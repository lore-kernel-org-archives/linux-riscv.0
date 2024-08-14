Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CDB0C52D7F
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Aug 2024 19:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=s8HQaFIM7HfoasKQU0rwpiwTgjt0StwGdyf5KF3JoY0=; b=p/FbQB21Se31FA
	BwQ9NFOaOSwQJbM6cVIXLLM77BrQ6x/Ogitgbn8znbWXzhZpL7Axj+8uEUS8fxhdtx2SfuvmUfFlx
	zYbkMhZD9+xX1MjFak3+BEvBqmwUEwsyiVHHw7wuR23VbFghlW7h7u9Y1+Xc2F3T1J6zI7dyixfhR
	wY/U+AoMiRNcHn9LQtnmY5XI/fpUac41q4yjXITSxWvEefbyFQdQGWfEcPMMwkU8PQpEJmS+SULnb
	z3O2UNY9e6u+j9MV3eFa22y2j9P3KMB/28yZgfI7neXXd3nyeqO8YC7XzzoubqCRf66e5wjL1xzeN
	ihNnWN4s/7jskrNFIwVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seJdZ-0000000832U-3yph;
	Wed, 14 Aug 2024 19:26:25 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seJdX-00000008321-3K5k
	for linux-riscv@lists.infradead.org;
	Wed, 14 Aug 2024 19:26:25 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-428f5c0833bso7233315e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 14 Aug 2024 12:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1723663581; x=1724268381; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=1rOXkKU2W9D9rNgyzn1pK2KXlz25F7zmkDN5gNLIerY=;
        b=jig7hhfo/HPmHOMuNWyaWXkqTPbjAUqUDEonI12ZvRoRre4T7+R7GViM1M/CVC1/Vm
         SYrECE73QC2Kz3qEkTgmYBzdU0+/yqlN5eDbZxFwyBMsq168AzK5t2pYGbJr/9PqO0hS
         gqRzVUZL7rxLRRDNPSOVkaYsunwve3w0+MgbmH6eap+F4TuvUIDHYPXxAdqS/2FqJwN0
         xsDQxDdfpEIKKq8d+3py0uZ8ze51elyVqgO3OMkrl6gwsRz8mozFwsO9hQmOXZx+hukL
         ZUi0RCxCsx3LMLSLdqluyEeimwMsJ31c5LL+rjAHntYziodY1ejJlqzOqJR88IKou2o5
         gnow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723663581; x=1724268381;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1rOXkKU2W9D9rNgyzn1pK2KXlz25F7zmkDN5gNLIerY=;
        b=PmmtYM9IbG2ZdU5BG0Frt3+AbhJJhSaJDDMlj/Rap5l43KC/FJwjBZ4Y9Uv0fgJO8P
         RGws0UUSzyghgsdWK0jrttxMbs8/br7Zi9upbJN3RIymt9kI0cprPJ4Owg4qBeO6TfB5
         kYVnuKlG1HGBaGaFWZbQQnwrxLEuDpyBXd1Yayhz+yTUqZwjeAVngcFoM+rudoitnrmt
         n1mVuXchcAYu1tFqce/sTSxUzSJ87FlXyoFgOGqaFWY9+oOTVwOdyBMLpiE9kc1VaUcx
         14N1lJ6N/vgtA+/lCXEfcuvzO7w1CV2759ywscbOLFhxeP5Fazz0Lj5avHo4b/l0BjkB
         WbQA==
X-Forwarded-Encrypted: i=1; AJvYcCVSwTqvt86YXUR3jlJg3YY/Rd5ZvYF31lR+xA8YwtX9whRrHS3VxypeKidPSCSdspLidMWRjUwbsIgl+0TRLsS8Sm0pspBWfpG3A4Hsx+rq
X-Gm-Message-State: AOJu0YwxHuBFbNWxELgFad28KEwB6S0lCRVHOD2CVyh0EAADow3BKNav
	s2tDhZQIr+SldH80l5+HZSEPWTuQ8aaUUkWZmqHvpv8mADNwAn0VM0K9C8ot4W8=
X-Google-Smtp-Source: AGHT+IHUnDWpVPfNpPkJ+/ynQ0mR1yA85wCz/I8P8Q8Je8RxXlJ7pr4pT2cjP14L/DBSxoHXE4qMpw==
X-Received: by 2002:adf:f7cf:0:b0:366:595c:ca0c with SMTP id ffacd0b85a97d-37186c091f8mr395135f8f.24.1723663581314;
        Wed, 14 Aug 2024 12:26:21 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36e4f0a6f6fsm13589689f8f.116.2024.08.14.12.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 12:26:20 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH -fixes v2] riscv: Fix out-of-bounds when accessing Andes per hart vendor extension array
Date: Wed, 14 Aug 2024 21:26:19 +0200
Message-Id: <20240814192619.276794-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_122623_861301_71B8EB36 
X-CRM114-Status: UNSURE (   9.74  )
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

The out-of-bounds access is reported by UBSAN:

[    0.000000] UBSAN: array-index-out-of-bounds in ../arch/riscv/kernel/vendor_extensions.c:41:66
[    0.000000] index -1 is out of range for type 'riscv_isavendorinfo [32]'
[    0.000000] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.11.0-rc2ubuntu-defconfig #2
[    0.000000] Hardware name: riscv-virtio,qemu (DT)
[    0.000000] Call Trace:
[    0.000000] [<ffffffff94e078ba>] dump_backtrace+0x32/0x40
[    0.000000] [<ffffffff95c83c1a>] show_stack+0x38/0x44
[    0.000000] [<ffffffff95c94614>] dump_stack_lvl+0x70/0x9c
[    0.000000] [<ffffffff95c94658>] dump_stack+0x18/0x20
[    0.000000] [<ffffffff95c8bbb2>] ubsan_epilogue+0x10/0x46
[    0.000000] [<ffffffff95485a82>] __ubsan_handle_out_of_bounds+0x94/0x9c
[    0.000000] [<ffffffff94e09442>] __riscv_isa_vendor_extension_available+0x90/0x92
[    0.000000] [<ffffffff94e043b6>] riscv_cpufeature_patch_func+0xc4/0x148
[    0.000000] [<ffffffff94e035f8>] _apply_alternatives+0x42/0x50
[    0.000000] [<ffffffff95e04196>] apply_boot_alternatives+0x3c/0x100
[    0.000000] [<ffffffff95e05b52>] setup_arch+0x85a/0x8bc
[    0.000000] [<ffffffff95e00ca0>] start_kernel+0xa4/0xfb6

The dereferencing using cpu should actually not happen, so remove it.

Fixes: 23c996fc2bc1 ("riscv: Extend cpufeature.c to detect vendor extensions")
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/kernel/vendor_extensions.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/vendor_extensions.c b/arch/riscv/kernel/vendor_extensions.c
index b6c1e7b5d34b..a8126d118341 100644
--- a/arch/riscv/kernel/vendor_extensions.c
+++ b/arch/riscv/kernel/vendor_extensions.c
@@ -38,7 +38,7 @@ bool __riscv_isa_vendor_extension_available(int cpu, unsigned long vendor, unsig
 	#ifdef CONFIG_RISCV_ISA_VENDOR_EXT_ANDES
 	case ANDES_VENDOR_ID:
 		bmap = &riscv_isa_vendor_ext_list_andes.all_harts_isa_bitmap;
-		cpu_bmap = &riscv_isa_vendor_ext_list_andes.per_hart_isa_bitmap[cpu];
+		cpu_bmap = riscv_isa_vendor_ext_list_andes.per_hart_isa_bitmap;
 		break;
 	#endif
 	default:
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
