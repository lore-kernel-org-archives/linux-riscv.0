Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B7DC761A6
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Apr 2023 15:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BDaGhGQZijlHOkUjzDy0H27jJMXOFaUpuabwZfCbypw=; b=Ffcp7cJB2w34nx
	3/yDYv5UyRaKHlvFnbsCg7KZQ3+aqWEVPuGPtTYEd1aWQUj/ayVEkBTNWlGoHiqZQrbzaG3icUfDp
	gRVyz2Jddkk5v4QsyW/wnO8chLhJlsL7ts2w5yBb5tf5Gq+x72FSSvPKsqZ7o7cDUIvlBd9CMJLln
	HD0+QPzW6dY7E78YzriDB4En5Qljlaw0bgylKJCMycv/N5xv+zhOjKApQe7azU/ER3qWWPeRJyU4Q
	g6FMbe4OfxTYu4MJw3D4x6uVjbEbKqz1U5UesZkC0E2H2MtnLADHUAiUXmDQHKnL7vhSzTr1HTD9i
	VMBQdMftvjBWnMlZj55g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjigv-0021CV-2W;
	Tue, 04 Apr 2023 15:35:25 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjigs-00217P-2b
	for linux-riscv@lists.infradead.org;
	Tue, 04 Apr 2023 15:35:24 +0000
Received: by mail-oi1-x234.google.com with SMTP id bi31so24485221oib.9
        for <linux-riscv@lists.infradead.org>; Tue, 04 Apr 2023 08:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680622522; x=1683214522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ynrEkFOVoh2ilNhT6Py6G4YVVk8kEghcO9UKxKZ0ojM=;
        b=BRgoclKSIeTbKLh/Q1MXriT5oiW3WR6WixObJxARdL/bFvcR/4j48hWnV/ObX747qN
         +gDv8vGlIQdGAYuKxF/rfrWflgx6ZUeU+ecDwngrtAkErOwkorEjTDFspXygS/xrLUgg
         lXtFR9pjKu753nV+/op/WmH73gMQXZjJhWmsU0EkMyl0fDrIg5nFRQSVGDHHjBcAeQa5
         0UQY1QQMQz1Fw6X02DYX/zdMFFnKklg/83Kn24Ei9ceNP4+J0K+VSF0tMNvD9xbYByz8
         RdHqBaD+WXGDDfRje8ttZ22B2OR8r+jnKpTRpHKaNtoX/d10K/HXA0GxKNkEBMRzwe+8
         Ee0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680622522; x=1683214522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ynrEkFOVoh2ilNhT6Py6G4YVVk8kEghcO9UKxKZ0ojM=;
        b=WNn52n1FXMYwZuIYRsoHBzLAmvfiRqjeFFpssD8rwOtBjj0S0onSFjoBx5slWE7hIN
         ptGhNtW4+gyTGmURYm86/q4fFffGUCcW+Ck0yCp8oQaZYJdKmLZbyuSd9c90vf7rIkbY
         S5BU/35AwH4LukfW393/luePx/NxW62YECCgoSR8AgWD8JfPWtLmT0QQLPz3HmYIdQoZ
         fmB8geoJM9SbSK++Los3t+8vOvmPbw8koCvSM1qKkw/39r0SeIbTsBkdHRwmftmERtYE
         axxBAr2ZbL6SqXlb3gwRcLFJr/Zv5j06Cmj6Qlf78ORSCivFPMTLvOEydKseKYa5rxe9
         n/GA==
X-Gm-Message-State: AAQBX9f2iuVxqYfD3oZfM9+NK5KvBT3Fwpafma4Eu415vfZzkIremMqs
	vBVEa4fWXi17k9q7xdQqTU4/4Q==
X-Google-Smtp-Source: AKy350Y9uI08y403VTorUA/J6uTgRO5eDoz1AIXPnEeKljD+beDcikH9qMkjQIGfUTgowT7Ekfvjsg==
X-Received: by 2002:a05:6808:1787:b0:387:4d4:7a45 with SMTP id bg7-20020a056808178700b0038704d47a45mr1780227oib.18.1680622522363;
        Tue, 04 Apr 2023 08:35:22 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id w124-20020acadf82000000b00387384dc768sm5325803oig.9.2023.04.04.08.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 08:35:21 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v4 2/9] RISC-V: Detect AIA CSRs from ISA string
Date: Tue,  4 Apr 2023 21:04:45 +0530
Message-Id: <20230404153452.2405681-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230404153452.2405681-1-apatel@ventanamicro.com>
References: <20230404153452.2405681-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_083522_843376_F78B65CA 
X-CRM114-Status: UNSURE (   9.42  )
X-CRM114-Notice: Please train this message.
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

We have two extension names for AIA ISA support: Smaia (M-mode AIA CSRs)
and Ssaia (S-mode AIA CSRs).

We extend the ISA string parsing to detect Smaia and Ssaia extensions.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/hwcap.h | 2 ++
 arch/riscv/kernel/cpu.c        | 2 ++
 arch/riscv/kernel/cpufeature.c | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 6263a0de1c6a..74f5dab2148f 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -42,6 +42,8 @@
 #define RISCV_ISA_EXT_ZBB		30
 #define RISCV_ISA_EXT_ZICBOM		31
 #define RISCV_ISA_EXT_ZIHINTPAUSE	32
+#define RISCV_ISA_EXT_SMAIA		33
+#define RISCV_ISA_EXT_SSAIA		34
 
 #define RISCV_ISA_EXT_MAX		64
 #define RISCV_ISA_EXT_NAME_LEN_MAX	32
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 8400f0cc9704..ae1e7bbf9344 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -188,6 +188,8 @@ static struct riscv_isa_ext_data isa_ext_arr[] = {
 	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
 	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
 	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
+	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
+	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
 	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
 	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 59d58ee0f68d..9e92e23f6f82 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -221,6 +221,8 @@ void __init riscv_fill_hwcap(void)
 				}
 			} else {
 				/* sorted alphabetically */
+				SET_ISA_EXT_MAP("smaia", RISCV_ISA_EXT_SMAIA);
+				SET_ISA_EXT_MAP("ssaia", RISCV_ISA_EXT_SSAIA);
 				SET_ISA_EXT_MAP("sscofpmf", RISCV_ISA_EXT_SSCOFPMF);
 				SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
 				SET_ISA_EXT_MAP("svinval", RISCV_ISA_EXT_SVINVAL);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
