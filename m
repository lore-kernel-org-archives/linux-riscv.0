Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D526C54E49
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Mar 2024 08:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3eyJyFrhwortC83dT4OTVgCbAdZoAFv5Zzuetpf4M3Q=; b=YsaNWJ42eBSiKd
	MvRHvY3Mpgfdy1IBU3gZiED0IRlrjTyMdHJfg6WvIhUNxICnIkFkUvknSRkEjq6p4MOsmXhxLQF8t
	M5UzVug4EhynbVSS8OOFDyw7jD9ChG/uDL0X/xqOgFQ2pDVjiHw4YOTwJjc7aTXhdwas8Ovfpln1M
	NZaFSCjHDMifJEdutoHcKYWPj+9K6jAOdPlQCL9Y2MprEpTglxKYdFfMLjqE44m0fTojyYizAzbr/
	0Xqc2U6rF0U4i+a0tYrjCuVyaNGy6r7vNRm/1MZhu+QEBSKayWN+ct4ffn8BiIXXpgVopbsY9YOul
	/y4JDxWCa1SN1U6qE6Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhn4w-0000000H15z-45Ju;
	Wed, 06 Mar 2024 08:56:46 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhn4s-0000000H126-4Bss
	for linux-riscv@lists.infradead.org;
	Wed, 06 Mar 2024 08:56:45 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6e5dddd3b95so484601b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 06 Mar 2024 00:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1709715398; x=1710320198; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=miJgmmft5IPBYmaXSyen84BtDBnhdyu7bBvtRv7/vGE=;
        b=cZ+ZvLRsLseO50N5i54xSlMSA69dKDYEavSXY5HQHmFcNm/UvafbhNBxAISaT1KEnZ
         M70TuLYotnxBOZRxn5LH9MuIrjxtyjynnZO8mnNh0ah67CDsTTBK3noK2OSe811Rb/Zj
         8jYl0qXF4E+JXirEgxP4LO2b3spftX1TalueRkEKFL8RulcX6POOY2EQ5ipJJdhhi3Ln
         tdJxVVADIV6oLJ6FKMuMw+2DNPeI1H08K+Os7MlaCswAhrIVq+G/ouNHpBP6lr1KBf2i
         +Yj1LHBNu794hu6EXkLF5SOf/oyxN96ExYTASN83jfKrJsWJ5BDE1Sf/icwXxEw25IqM
         ezhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709715398; x=1710320198;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=miJgmmft5IPBYmaXSyen84BtDBnhdyu7bBvtRv7/vGE=;
        b=ThV8sEgDrjL9cQFhtAnzfw4V8tMvGyqk0t5yyhGWpXhI8JTtWlk4AaFo4npZOLVDiO
         UtrMHcpaJUoyXTm6mW3Ua39mV0S5s8XBIhp45uioau2ELB4yDDz6SZ84ESRZKbOnvHE7
         WQs7BxLFwYzseXRO87yIcaZRrbo3p9k5GHhSqrBFKJ2F4eiLeP/tF+ztEPOhOOkyzAq4
         deASZ+NVImSR+dO3be8WxeOZaPQWykklKsi7zc35ugsAilEsjG49LBKjW7cJvwPfAEbm
         x/6b4T5fuNPRduZQGERjFHz5+1vE3Gozq0A8021ugNsEk4xpl/uhiPqHygXO5419ClVl
         fCvw==
X-Forwarded-Encrypted: i=1; AJvYcCXj68K8dUOKu7Uh11AU/Ryzpw/ZH+Q6QAlxO2ZupW8dmGvwu91TJhQV1J+eDRDVYgJpl4Ba/L2+1avG2Hnxje9Hb4auctaamkCxgzrDnqei
X-Gm-Message-State: AOJu0YwegQFBp8+LGzHgq0Lga/uocxSZZUnT/nfXzhL4gVJmHh3S3JJB
	FSXUJkaPBw+YewUsewX7nV/auqiv2zM9D9MzrUAkCaCdgpFlZxodtAcLD2ooeEk=
X-Google-Smtp-Source: AGHT+IHSPWMWnSqJ94igWDFx0dxlS6jl64WPFzIgP3y43hLTZHJR/pVyi5tFhE8JE9eK2c3TtONwHQ==
X-Received: by 2002:a05:6a20:1442:b0:1a0:eb43:421b with SMTP id a2-20020a056a20144200b001a0eb43421bmr5447236pzi.28.1709715397698;
        Wed, 06 Mar 2024 00:56:37 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([61.213.176.7])
        by smtp.gmail.com with ESMTPSA id o74-20020a62cd4d000000b006e58663dd0asm10740071pfg.110.2024.03.06.00.56.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 06 Mar 2024 00:56:37 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	ardb@kernel.org,
	cuiyunhui@bytedance.com,
	xuzhipeng.1973@bytedance.com,
	alexghiti@rivosinc.com,
	samitolvanen@google.com,
	bp@alien8.de,
	xiao.w.wang@intel.com,
	jan.kiszka@siemens.com,
	kirill.shutemov@linux.intel.com,
	nathan@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org
Subject: [PATCH 1/3] Revert "riscv/efistub: Ensure GP-relative addressing is not used"
Date: Wed,  6 Mar 2024 16:56:20 +0800
Message-Id: <20240306085622.87248-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_005643_322420_70AC309F 
X-CRM114-Status: UNSURE (   7.21  )
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

This reverts commit afb2a4fb84555ef9e61061f6ea63ed7087b295d5.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 drivers/firmware/efi/libstub/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
index 31eb1e287ce1..475f37796779 100644
--- a/drivers/firmware/efi/libstub/Makefile
+++ b/drivers/firmware/efi/libstub/Makefile
@@ -28,7 +28,7 @@ cflags-$(CONFIG_ARM)		+= -DEFI_HAVE_STRLEN -DEFI_HAVE_STRNLEN \
 				   -DEFI_HAVE_MEMCHR -DEFI_HAVE_STRRCHR \
 				   -DEFI_HAVE_STRCMP -fno-builtin -fpic \
 				   $(call cc-option,-mno-single-pic-base)
-cflags-$(CONFIG_RISCV)		+= -fpic -DNO_ALTERNATIVE -mno-relax
+cflags-$(CONFIG_RISCV)		+= -fpic -DNO_ALTERNATIVE
 cflags-$(CONFIG_LOONGARCH)	+= -fpie
 
 cflags-$(CONFIG_EFI_PARAMS_FROM_FDT)	+= -I$(srctree)/scripts/dtc/libfdt
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
