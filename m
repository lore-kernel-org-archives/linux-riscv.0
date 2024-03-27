Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55604C47DD9
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 20:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xa9yaC3vbzXtTWd1AUyzldjdggdIafzRqKM5i0fLqhM=; b=twwTU/bmXgn1sS
	XYcDZgXB2ByZ+46HWIODQknGMyeAK3wP6er3u3VC2HKZUweaCOHPOMBfiDLpPGn0Ygn8LK7lyYyP1
	mSZgfDegyRJr+pvIg9v/HdzCnbHN+zAAG+o1kJvBTKiyDjTDp1xeBZ0AttwnbIPx2nFUkGZ6nsgJV
	WvUOhIK8iQC+jDc/ejjJYlG4o9fJjzzinODYyLD2KRMsT3zh5EwHxpthLwbwJSoc6jjQ2IrAWT/ZX
	mQCuxPA5oSh2DJlKl9vICg8QbxV3Z6qXT4VCXSmauukEXaDAQdtEaBaxvOmTS77ml0LpwHvnBsgHa
	K1b7j8U3YY8o0m8FyOxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpZVs-0000000Aveg-3RPt;
	Wed, 27 Mar 2024 20:04:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpZTV-0000000Au8F-3XjK
	for linux-riscv@bombadil.infradead.org;
	Wed, 27 Mar 2024 20:02:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=JhRrF1Pu1wTofDEF5NDtSjXNjQrJmyXSgj6gSsLdD3o=; b=kTtCt0c1Sw9hp6hziuZQniN2wa
	uGTurNDruvXDZAt3WrfVIUUcCCoIAyUKHcyUbxzk+8z/462EFBi5GMmE5Wmeg65/d1yDSThUgE12O
	flK0mQBazd44Bo1pzRURZbufROIVmlSCmJBx9e6qh47AK5zcGyb9TRRLY1j+cOeeJhOfIV7MlxgqK
	/Dtwey9B8Skw93CLtJ6gBRDMq3CW8DKdTw63Sw/kSUD4XDocNMAmBHjyR0sTeHIR6em4+C3p5Ok84
	0Jpu8ms4Ybm3D1IgY6/1QamsYv+UIPqDi2bfiLoBnxKvk38GDu5jerLvv4jjkANLa7xW++B+4hUOo
	sxvYatJg==;
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpZTN-00000000Wpz-0Noj
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 20:02:16 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1dfff641d10so1915865ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 13:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711569727; x=1712174527; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JhRrF1Pu1wTofDEF5NDtSjXNjQrJmyXSgj6gSsLdD3o=;
        b=bvBmJfk8irpuOzlh5TmE+RsuKxPdKZ8qdVCQi+68AcdyjzUrQygVrCaGM87IXV28NI
         40fqYhowDQ/zkrGuqyVbFryg2h8EaDknwDNIyAP5y8CsMJqZA06IqfwxqtB/Gml0UUrd
         QDDLH+9ix2udXOmUhWXTsOd1fvtjPaC1sjirDOpm4JKGVM4FxkpEQy16TAC8osDfNvOZ
         MACaUdIOlqPN1/J6e/62iyTX1cuuPQJPf8cltLGeSE7hMxEx/1XtW5qp7z0XdgcOWhxG
         1i97zGCsPIsdvKatOP3Zq5hyHMUXVyRpRTrhhD1snTSjG9RglFKkwwnqdnizw+werVBu
         gQuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711569727; x=1712174527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JhRrF1Pu1wTofDEF5NDtSjXNjQrJmyXSgj6gSsLdD3o=;
        b=KsSvHGQjiOfb/zobU0S/UbpBu0SPT9RpQT8VCQKSprPp+AD0p7Zx7eY7jAis0qWnFL
         I/ekYXanEZgcPNUdX8AN//A+oTHfXlF4RhezBvfvwa3hlRFYopW1f3N588fV84DRtFxo
         3tadKRfnEhq/+Y+fMnoRUy6vnMAbStDuenX0xXzmPxB887XYLjuFL6t5LqM/UgIp7ea9
         24SIdAumIc2+Z40K5NlUEzF/Hei+FWizxqMLuFz9UVSmYtxvpjW84G0Fr0Ruq9dqe7sG
         zSjhWmOur2ov2vRWPd/+2KInu40Eht14xzP3t2jIz+pqnIjNuaZi2HJwIti0c39lWeoh
         NlDg==
X-Forwarded-Encrypted: i=1; AJvYcCV1hG9H4mjnqF9UymEgTVEBbk4dbsdnLg98Sj3Mqd/zGl8ckOnl1M7aXk7Wx5ms1pZ6/gjCwbVWb81cHKy+ni4td8GDo24sMdHP+KFHFGWh
X-Gm-Message-State: AOJu0Ywkty2lkKoyrn45+EthxYhGu/DAJs71FFrtGXkFMbDlsejotjHZ
	BxavB2+8xgR/MfE5GXl0TO/myzI5sq6X0eRXGf9NOl0/uhJz7sf3OyRU7M9SO6s=
X-Google-Smtp-Source: AGHT+IFTdj+7xjr/hkuUZrog62OKlzxWVPjf6p/E+DdPaik3Rv7nG00gWJ8Kh9j7qP1eqTQJrGE0sw==
X-Received: by 2002:a17:902:650e:b0:1de:eca6:483d with SMTP id b14-20020a170902650e00b001deeca6483dmr724908plk.27.1711569726983;
        Wed, 27 Mar 2024 13:02:06 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id u4-20020a170902e5c400b001dd0d0d26a4sm9446459plf.147.2024.03.27.13.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 13:02:06 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	Christoph Hellwig <hch@lst.de>,
	loongarch@lists.linux.dev,
	amd-gfx@lists.freedesktop.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v3 06/14] lib/raid6: Use CC_FLAGS_FPU for NEON CFLAGS
Date: Wed, 27 Mar 2024 13:00:37 -0700
Message-ID: <20240327200157.1097089-7-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240327200157.1097089-1-samuel.holland@sifive.com>
References: <20240327200157.1097089-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_200213_269952_9D9E3F98 
X-CRM114-Status: GOOD (  10.29  )
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

Now that CC_FLAGS_FPU is exported and can be used anywhere in the source
tree, use it instead of duplicating the flags here.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v1)

 lib/raid6/Makefile | 31 ++++++++-----------------------
 1 file changed, 8 insertions(+), 23 deletions(-)

diff --git a/lib/raid6/Makefile b/lib/raid6/Makefile
index 385a94aa0b99..c71984e04c4d 100644
--- a/lib/raid6/Makefile
+++ b/lib/raid6/Makefile
@@ -33,25 +33,6 @@ CFLAGS_REMOVE_vpermxor8.o += -msoft-float
 endif
 endif
 
-# The GCC option -ffreestanding is required in order to compile code containing
-# ARM/NEON intrinsics in a non C99-compliant environment (such as the kernel)
-ifeq ($(CONFIG_KERNEL_MODE_NEON),y)
-NEON_FLAGS := -ffreestanding
-# Enable <arm_neon.h>
-NEON_FLAGS += -isystem $(shell $(CC) -print-file-name=include)
-ifeq ($(ARCH),arm)
-NEON_FLAGS += -march=armv7-a -mfloat-abi=softfp -mfpu=neon
-endif
-CFLAGS_recov_neon_inner.o += $(NEON_FLAGS)
-ifeq ($(ARCH),arm64)
-CFLAGS_REMOVE_recov_neon_inner.o += -mgeneral-regs-only
-CFLAGS_REMOVE_neon1.o += -mgeneral-regs-only
-CFLAGS_REMOVE_neon2.o += -mgeneral-regs-only
-CFLAGS_REMOVE_neon4.o += -mgeneral-regs-only
-CFLAGS_REMOVE_neon8.o += -mgeneral-regs-only
-endif
-endif
-
 quiet_cmd_unroll = UNROLL  $@
       cmd_unroll = $(AWK) -v N=$* -f $(srctree)/$(src)/unroll.awk < $< > $@
 
@@ -75,10 +56,14 @@ targets += vpermxor1.c vpermxor2.c vpermxor4.c vpermxor8.c
 $(obj)/vpermxor%.c: $(src)/vpermxor.uc $(src)/unroll.awk FORCE
 	$(call if_changed,unroll)
 
-CFLAGS_neon1.o += $(NEON_FLAGS)
-CFLAGS_neon2.o += $(NEON_FLAGS)
-CFLAGS_neon4.o += $(NEON_FLAGS)
-CFLAGS_neon8.o += $(NEON_FLAGS)
+CFLAGS_neon1.o += $(CC_FLAGS_FPU)
+CFLAGS_neon2.o += $(CC_FLAGS_FPU)
+CFLAGS_neon4.o += $(CC_FLAGS_FPU)
+CFLAGS_neon8.o += $(CC_FLAGS_FPU)
+CFLAGS_REMOVE_neon1.o += $(CC_FLAGS_NO_FPU)
+CFLAGS_REMOVE_neon2.o += $(CC_FLAGS_NO_FPU)
+CFLAGS_REMOVE_neon4.o += $(CC_FLAGS_NO_FPU)
+CFLAGS_REMOVE_neon8.o += $(CC_FLAGS_NO_FPU)
 targets += neon1.c neon2.c neon4.c neon8.c
 $(obj)/neon%.c: $(src)/neon.uc $(src)/unroll.awk FORCE
 	$(call if_changed,unroll)
-- 
2.43.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
