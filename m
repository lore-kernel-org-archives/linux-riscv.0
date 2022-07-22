Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1494AC43334
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Jul 2022 18:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ExPTRC2emc5hL8EhKbMId1zmMZxyqQa+9YE7W+4amOc=; b=bpFCQgvSS17uDa
	DE4P5+yg74B999VeDSuf8wL9llJbWpovrfMSxDxXODbHg7U8RpRAabrqTTXskmbKyYBKu9mkcfQp1
	9N4XLyqf1oA8Y2f5fK1NuLJoavGqIOrsWJXD5AzrhshnFX6S/2FbiYInEsjXHtoy/PByseU62gJwu
	3QmG7r6UpVW86H+mADRKhhG/16C7vwwDTSccD/nj563HEf3rVyKP6bN2qN0Kdv3XCo9xoYPP2B2W5
	2U9YVS466KlP+4Bl6p+7kzWuUtB1W/yjNNY1IZDrGU58jF0CZ/p9h8GMuTmiXAw4sB3NWCbYRNkm0
	K1UmL141nzlwwQxJUHrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEwxP-008gMR-Mq; Fri, 22 Jul 2022 18:00:59 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEvrl-00853w-7T
	for linux-riscv@bombadil.infradead.org; Fri, 22 Jul 2022 16:51:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=JO4EgaFLA+7AeATY37WXQlGJ9vdJOA0mjTrTo1yHUWU=; b=UEYrekmKN4Rd54Da2rXEJ/4Zhl
	A9b5OwGm6O3ykNgLCIGjWKzTfiRk421DKS1obtMxuettT4yXu6fafO1slcXfhzodLzVZpLWfDo/RA
	Atmhhltdea7C+Q4p+yfL85kWChZxwsOdZHabFNcye0FhVvx7nfClDvoKQG3637O9/1XRCfo8QkjBC
	6zEDuDzeJwlgP9X93mstMIHOp6BDSQ3QWW8hR3bRzW9HP7NlOUEx9LwTgqbcU3udn4Scqzu4DeW+k
	SoaAbqfHeUhGx2L+KwFcJdliMiVByAHxNszDgysqCePREhgFpyaLk9JeCUW6J2VCP0CCSriLst6Gt
	COdEExNA==;
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEvrf-005uOl-Sh
	for linux-riscv@lists.infradead.org; Fri, 22 Jul 2022 16:51:02 +0000
Received: by mail-pl1-x631.google.com with SMTP id q5so5005630plr.11
        for <linux-riscv@lists.infradead.org>; Fri, 22 Jul 2022 09:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JO4EgaFLA+7AeATY37WXQlGJ9vdJOA0mjTrTo1yHUWU=;
        b=bq+HPB5ICJBE7xBIVRuNq+EPfcnoMUoLuXKksB72CK/VjmEbn4i9TVIwnfsu56z21Q
         DWM/ngg7QCZriV1iyAEKzNlWFWhvBhOc403GaQ/UGjb/oxQgJAOin4v+loO9HnjoV61T
         0w9dvMzfQ+gJjANcmO76tv5n6MFedvhjDJR7Cg6ipQMVeC3CQhIzRvwr94/m0+rgCZtv
         2fYvKpWmEiXHoWb+OJeCV1FmufOnEqTRgmPjYBW+GI3fWQBDj2f+e6YNSTT6I+Rm6Xco
         WVNrYVFdKaOSlxbZ3HM5FGX8qGT7dy527SffgvIrSp5C7hUAFYwkwyHvU8n8OUh77vHe
         GYAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JO4EgaFLA+7AeATY37WXQlGJ9vdJOA0mjTrTo1yHUWU=;
        b=ymMUc/O5RE6USfZDVSJU+V/6LO22FxqT4swENWCRUz9reCSqyTnUVmF+YSIOFn8Ur4
         8v1W0rUvhbSP7VbT0Pmd5hLNABrvLGOjo07MNRNWCanVP8NsOVl/CaMOr2zdh6nQmPCS
         1Jzu3SjfqR8ixAb+iPYpPoKaa/r/PM6uLSWHr+LRaxqb7TJzCxKdK/3Y7PQgwk8LEqwr
         uW3jEea4pr5qmdwfE+f8Pv33j/ZlKOnBTPJ3ui/m5X41noAL7pUsOK5OQ3S2xaW9FlV5
         6iVySqn4vOOydAvOV0poe5DaaHN4CmkHzgXcDz4iZHWHwJvY5NiNGYC8PryjtUqgGElC
         7V2g==
X-Gm-Message-State: AJIora8cUq54TJalWgo7UGkk4O7vnVsl57axzsCPnGT4NgFEv1VQmvlh
	QwDsscyCVSz0KGIv6N5AfbpjUg==
X-Google-Smtp-Source: AGRyM1ugctXp/cOpPZAz/TTQpitjVDRcbpFZbfjDJ5+U3/UXlRTApFXjaoxWKtg4T6l9D98ypoh6tA==
X-Received: by 2002:a17:902:8f98:b0:16d:2a9:d5c7 with SMTP id z24-20020a1709028f9800b0016d02a9d5c7mr423460plo.5.1658508656994;
        Fri, 22 Jul 2022 09:50:56 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id s7-20020a170902ea0700b0016a3f9e4865sm4028476plg.148.2022.07.22.09.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jul 2022 09:50:56 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Anup Patel <anup@brainfault.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Tsukasa OI <research_trasio@irq.a4lg.com>,
	Wei Fu <wefu@redhat.com>
Subject: [PATCH v7 2/4] RISC-V: Enable sstc extension parsing from DT
Date: Fri, 22 Jul 2022 09:50:45 -0700
Message-Id: <20220722165047.519994-3-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220722165047.519994-1-atishp@rivosinc.com>
References: <20220722165047.519994-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_175100_404417_65AD8E36 
X-CRM114-Status: GOOD (  10.49  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The ISA extension framework now allows parsing any multi-letter
ISA extension.

Enable that for sstc extension.

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/hwcap.h | 1 +
 arch/riscv/kernel/cpu.c        | 1 +
 arch/riscv/kernel/cpufeature.c | 1 +
 3 files changed, 3 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 4e2486881840..b186fff75198 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -53,6 +53,7 @@ extern unsigned long elf_hwcap;
 enum riscv_isa_ext_id {
 	RISCV_ISA_EXT_SSCOFPMF = RISCV_ISA_EXT_BASE,
 	RISCV_ISA_EXT_SVPBMT,
+	RISCV_ISA_EXT_SSTC,
 	RISCV_ISA_EXT_ID_MAX = RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index fba9e9f46a8c..0016d9337fe0 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -89,6 +89,7 @@ int riscv_of_parent_hartid(struct device_node *node)
 static struct riscv_isa_ext_data isa_ext_arr[] = {
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
 	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
+	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
 	__RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
 };
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 12b05ce164bb..034bdbd189d0 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -199,6 +199,7 @@ void __init riscv_fill_hwcap(void)
 			} else {
 				SET_ISA_EXT_MAP("sscofpmf", RISCV_ISA_EXT_SSCOFPMF);
 				SET_ISA_EXT_MAP("svpbmt", RISCV_ISA_EXT_SVPBMT);
+				SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
 			}
 #undef SET_ISA_EXT_MAP
 		}
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
