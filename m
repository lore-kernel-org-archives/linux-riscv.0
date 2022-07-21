Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB57C43334
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Jul 2022 18:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ExPTRC2emc5hL8EhKbMId1zmMZxyqQa+9YE7W+4amOc=; b=uK34ULq9WfN+ZP
	7dRGzUVueaf2RMTAsmu87adX2QZrmiEAipcg4g6pm2e8wjkx4lFORFHfAJoE0ST2pe+5Wy0oFacoA
	LGagTW0Cc5wO/rHr+/bXEl1ujLzfGdpqfPA1cgf662A/tuxQaq+ltp491uUULaI8kMj7sWICDtDY+
	2pnbnUeICqUy/8rq6dBvGfO6sdTdB6lUMvXnEWo1Ns5Lnyz5soQyASDEdtXSej5RYD3Nj398E0QUJ
	Jf/+5EnfyBD7CX8sIovZVmuTMuPkDo1/g1vOJsBg1WFkP5BXTSRYpHqt6hYHJoinNmqAch4alZS29
	YIq0fUj0EDozt6OGwt8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEaf8-00BHsb-3k; Thu, 21 Jul 2022 18:12:38 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEaf1-00BHiZ-20
	for linux-riscv@lists.infradead.org; Thu, 21 Jul 2022 18:12:33 +0000
Received: by mail-pf1-x429.google.com with SMTP id b9so2449448pfp.10
        for <linux-riscv@lists.infradead.org>; Thu, 21 Jul 2022 11:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JO4EgaFLA+7AeATY37WXQlGJ9vdJOA0mjTrTo1yHUWU=;
        b=riG2PtdLx0LlINs136KP5QyxDhqO+kVaZVCGH/J20pnAzCaWI0cNrw4ZKDVwIuQKzI
         s3DpyvOseHncIaaYhLOH8rx0kDgBjdmQ+VaSyFC5Te26GWSMTn/iDiwdMBSLbbySx1iz
         A/QtjMMVexwd7x+C6X+5Ka4WgCzL9oKKHK5fhduu7Y23VDfSJydWvcxzBlHNX0Y+JYow
         NlMMiIdZ8WTGaMGAdW+qWVbhP8ut+rKWjmzGrXNcbphrgxn9ziKf6TOmHxQcna3Xki3q
         g8zUDW456eefJqNCiXx4tF9aQ2VC3p4v6vcz4bF3Eb40szoNeVQvHZVgjCQsvw1DqLsg
         It4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JO4EgaFLA+7AeATY37WXQlGJ9vdJOA0mjTrTo1yHUWU=;
        b=Jy6/jzy0nKRkDHEWJfSP9s0wsgUHKsfwRu0PQpj96l3Py98V/urJBjvyp01sD9nOf5
         JY02gZWWreOEPFnd67LHFlz5hBUWdipRqRiowLvW9v3yClFdNDM2zbW0hfhPYCDzReKr
         cePlN0cGAzSsKdADC3vHX5HX3INtMSSRMd/ULOm/zOmlVxeuKTEnAwrjm2mYQOnZrzqi
         Q7ISk8CmB14Yo7T4qCUgKje9EPPTws1sr8/c2UNNT+TYGxO6JacfrjZuaR95b3OCipEi
         m01oyfp3Uz+cnnd7mYthQFgeaXNMNNnIulw9P0vZLmLx6Y+uW13lImZX42sjo1UEzUV8
         RAxA==
X-Gm-Message-State: AJIora/ZYnPL9dy/IB08PI5Le2MQ1/xsbS5Bsv2w1Zxg2ADyEo1yH6m0
	rpWFZ1GQNI3ca+LKCbKQnhGCGw==
X-Google-Smtp-Source: AGRyM1vCz2MPQ+o0CTmBQcVDehcx5aKC828ghajOSEd6ubFHv0tSkQh5zBLbLycgTGSqipKoq1bssQ==
X-Received: by 2002:a63:ff4c:0:b0:412:b100:786b with SMTP id s12-20020a63ff4c000000b00412b100786bmr39952104pgk.537.1658427145703;
        Thu, 21 Jul 2022 11:12:25 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id b12-20020a1709027e0c00b0016d3a354cffsm617358plm.89.2022.07.21.11.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 11:12:25 -0700 (PDT)
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
	Thomas Gleixner <tglx@linutronix.de>,
	Tsukasa OI <research_trasio@irq.a4lg.com>,
	Wei Fu <wefu@redhat.com>
Subject: [PATCH v6 2/4] RISC-V: Enable sstc extension parsing from DT
Date: Thu, 21 Jul 2022 11:12:10 -0700
Message-Id: <20220721181212.3705138-3-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220721181212.3705138-1-atishp@rivosinc.com>
References: <20220721181212.3705138-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_111231_117165_7EE7EE0B 
X-CRM114-Status: GOOD (  10.43  )
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
