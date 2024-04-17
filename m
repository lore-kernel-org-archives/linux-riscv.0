Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B499C4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Apr 2024 23:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DJgddyoSiobFcHBzvC1QDFwUNV740SP1fyZfFL2dDZM=; b=UFYcuvay6WmuM6
	T65gFb4vZaXFIirWQD8wdc5a5+vj33ryNBWy/gRlbfieZlykfeSFb6+mLSsmot6S/zZnfQ0p11/a9
	ZrEEq1mB0BbaCXB6jrg25FeBKVvCRG4ukcW67mztf19nhrJi8T7rL3NM83P4pYjKJPhhHfyU/tTj+
	Dzoj8HdSehrWwW+XRFMzZOKMXXOziBTIMR8VIojcpKGC6Qc8KNowO6IBQtYEcepP/OKr97VmPsp1n
	sOR5HKxFilbhTQ/TTeSv1f7vEtWz1BySIdsNB5ilQE4jNM1e/ZVA+9wgNNOqr+k8WjLmXD1adMQRY
	GKbAr2bP0aqEd0SGoYcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxF2K-00000000MCX-4194;
	Wed, 17 Apr 2024 23:49:57 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxF2G-00000000MBt-3kEn
	for linux-riscv@lists.infradead.org;
	Wed, 17 Apr 2024 23:49:54 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6ed11782727so325565b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 17 Apr 2024 16:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713397791; x=1714002591; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l6QPcqewJGS3JFKwt5jL99ECNB022Q5NjXUoC/gxxD4=;
        b=fDqy+ulTwm242NkOU2rm3k/o8xrg/CHUX7cdEH2oq7Tmfz9J2PoFkV/l5OYPp0ekd2
         H4pCCdy8/kB21q62xJwxPvjTSRdrMlpaid8Agxv64TGXgsXsJD8Zm2Y0fjE07EmKmcql
         BQ/JAoc85GvjxxthvMiNeuqIE1/FlNxv8gMxjDTGhrOhV4+mvtO3+QjZ5AvcpdliY3Jn
         gchM05yzgEqv7tq3Lb5+VuW57nh4djPRbLhiibRX6sGaobXFi9soHXkSlXKPNmtMp1zQ
         YrENnYxBc740TAddBoFNtCltERLrQbv5+MmPe7CXAQGq5a15QodUY8U5BQ4ri3ECd1WI
         Tbzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713397791; x=1714002591;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l6QPcqewJGS3JFKwt5jL99ECNB022Q5NjXUoC/gxxD4=;
        b=Es0x++n0HglSZa093DrsQWFNsWYGR/ENUZa4KOlpj2UL+lhgF9WVpAtvZLFob/vWrL
         Ooty7UvgH9QwBd+bbuNXLE+5/tS4n7xncPAWDwFYjX1KgOIBWGs3Ll4Y+L0nB73KIE0q
         9yVnd5HspEfRp/lGwoHNPnyGVrkTrHsLm5CUaZYvmQ/OMOj/bWGAbuaEFtrrc1tuHF8Q
         e//NoJ/RfGleuVgkPIJ+vK9PJK28BZHjvVQPgs3cp3m+G9yQ+Ci0PBzQ7Ye5/LonXZSX
         kG4gzBJP9ylh98oiFD2mum1VW7A+qJUgUJiBFP5ilVAy79lha4v406f3pf3wPMDlHroc
         uZVA==
X-Forwarded-Encrypted: i=1; AJvYcCUblJVIj1eqF4hVZOFjpHukTElACxF+Hpe7b+Yqb4vWsKLglj9NVAa3rayoq7jMVWG9K7X56oVKkEXfsN8Vj6DvcG69I6LvjR4Mw0k5YNwt
X-Gm-Message-State: AOJu0YyQSLftWjw+9/l/VWIs4Wok3jZvXI6GfEt1fRIlpK52CoDxFqjM
	EqLlcjMav5qsonOHGv+3SdjE1EJkO5BlPcElYdbB8WkLxymZAnCcCMNhltmFUtk=
X-Google-Smtp-Source: AGHT+IG4XjDqRECtKlDqradeGR//Cr8LDn9qG9X89yeLCIO+tM0IDNTJkjO4vUl8sBNG3QOo/yqRbw==
X-Received: by 2002:a05:6a00:b8f:b0:6ed:416d:f7c with SMTP id g15-20020a056a000b8f00b006ed416d0f7cmr1479557pfj.6.1713397790689;
        Wed, 17 Apr 2024 16:49:50 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id g21-20020a63e615000000b005f75f325db4sm180626pgh.29.2024.04.17.16.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 16:49:50 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 17 Apr 2024 16:49:48 -0700
Subject: [PATCH riscv/for-next] riscv: cacheflush: Fix warning when
 compiled without CONFIG_SMP
MIME-Version: 1.0
Message-Id: <20240417-fix_nosmp_icache-v1-1-921a3c07d4ce@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIABxgIGYC/x2MwQqDMBAFf0X23GC02kJ/pRSJ64vuoYnsFhHEf
 zf0ODAzBxlUYPSqDlJsYpJTgeZWES8hzXAyFabWt53vmqeLsg8p23cdhAMvcD7y/REQ4oieSrY
 qivNfvknFeKtjVpew/+hznhcIWRdpcgAAAA==
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Atish Patra <atishp@rivosinc.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713397789; l=1366;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=QOeEbZPIOXSFim7lsiz0WmrK/rdPihErm3BmndcXrBk=;
 b=MD96CDgWAywUmAiDDGjPnD1xMLhEG+ivBh9UezqhJGdfkpsEq6o7FnPPrw3xBGmVDL6+VzUzS
 ld/hGTyVCvTDoy9EAOBkddn8mzifBpZxFpe4aLic1QyFonX9klAMgYv
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_164953_078313_FBFF6E1B 
X-CRM114-Status: UNSURE (   8.84  )
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

GCC tries to compile the static function set_icache_stale_mask() even
when there are no callers. Guard the function with #ifdef CONFIG_SMP.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Fixes: 383289e4b071 ("riscv: Include riscv_set_icache_flush_ctx prctl")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202404180621.qG7A9Tk0-lkp@intel.com/
---
Since this is just in for-next Palmer do you want to squash this onto the
commit that introduced this 383289e4b071?
---
 arch/riscv/mm/cacheflush.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index 3b03534e57b4..3ef666c7dfc7 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -154,6 +154,7 @@ void __init riscv_init_cbo_blocksizes(void)
 		riscv_cboz_block_size = cboz_block_size;
 }
 
+#ifdef CONFIG_SMP
 static void set_icache_stale_mask(void)
 {
 	cpumask_t *mask;
@@ -171,6 +172,7 @@ static void set_icache_stale_mask(void)
 	cpumask_setall(mask);
 	cpumask_assign_cpu(smp_processor_id(), mask, stale_cpu);
 }
+#endif
 
 /**
  * riscv_set_icache_flush_ctx() - Enable/disable icache flushing instructions in

---
base-commit: a76716f0ec75b9e7ac62d30854d690044c857684
change-id: 20240417-fix_nosmp_icache-0fc36aeafbe5
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
