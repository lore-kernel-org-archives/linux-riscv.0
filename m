Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C585AC46CD2
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Dec 2023 01:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wg81HwaoxVpc56lhEj4n2MjQNuYVIIaNlbAZL/zMMBo=; b=Tjbqp5qk8GQL8K
	/AEpSruE5z8WuD7TVv2rMWEzomg4dDa8xMjtuyOu3n7LRM0Eobe4k1w7AZFzDz0nYqElv28Ypbqq3
	/Vd8jmR5W2Nt1zIF7UzNm1GHBOuQTKK+usXFbCdt7sKX6F7nQMlRLJbv2OwBl+CnKU0hmRRONfU2K
	X4t22NcHKlkXDvR2T71ADyJKJirA26XASCZRnK25nirbxe2yTOsulld8yik7KuaDpU473Ltc6l6xj
	ocdt4eX+63mNXbfU5DlV9pdDAPWF3/iV7/SLn20D+FwHYgXGhqJypWgYnvv4vuMisuymcq/rhn4JX
	kJ+X+kPHCBYxaMljJOTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIfQA-00Fs5Q-2s;
	Thu, 28 Dec 2023 01:42:50 +0000
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIfPp-00FrkT-27
	for linux-riscv@lists.infradead.org;
	Thu, 28 Dec 2023 01:42:31 +0000
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-20451bc39b1so3181171fac.1
        for <linux-riscv@lists.infradead.org>; Wed, 27 Dec 2023 17:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1703727748; x=1704332548; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bJe+2iWG7zhbu2gjOAPKG3r+a1/tBb6PXcWtzUfSG2Y=;
        b=TX73H3rjXVnKloa6uXeuQjfdwEJFjKEZ2yc2lB8rWA9tLpKIiwvSDIO8UlCrPNRDBD
         riZIZw37PGv8l1DUq1Oe3hFlF8j69npj1EWJNLHg2OmegWpAdpG0NkkvvW2+zM0Bf4oY
         x3rWISIPsRKn5/SbRiKmUbXGPcdjWGoECjX33yZy1P/vOzl+jfRpTdul+GfDy0ceM1Ll
         TxmHp+nDMQDLI4vnhs/aIiNcwGGVBPl8uAeZOOCeMB85A1g4Irb98qXUJo2w4Ur5nFgb
         g1OTLq9zKGyuOxi9mFhf9H9tEdiEnw3zJA11mbj7h5KpBhf095XbfaMX9k3XFIi78rWD
         f/cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703727748; x=1704332548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bJe+2iWG7zhbu2gjOAPKG3r+a1/tBb6PXcWtzUfSG2Y=;
        b=FmdXFLLPGbB325losUCF4Tro5LQ2oPSh63H1JacIj7WFEqlHqApj1Qld7BSiKgQ44H
         X50q8yN01Lx6CyyOE28fOE2WiN3MPzc7avYbo5u3MK5DLJwk/xRz8D3aOpHIdjL4Z3iu
         MlPcWVHd68JfzmznA5iwFYq59ofXv5yq0QAWjV3w1h3yzdgYD/G8gexoSQ57GZ82nud1
         B0Fn6ihm7EM991XUW/oOeTn2SWXuWUR57Qmv1G0/ZbFvcmMfQ3yZUkEGNurooY7/pP7s
         jizZFrOv9WXvHLUoUuPEmRDVloZbSVjA/wICj2YzmPsoYiKBApvFPl2cYrxZefO7gqXL
         WlFA==
X-Gm-Message-State: AOJu0Ywf/72f9/uiZEPqV1Ck9NTdqLfeGy2XVhn10311YD7cg6G3Mrnq
	Ilqglx4LqNhSaHxGnCrKmYKtrBTvZTMvpw==
X-Google-Smtp-Source: AGHT+IHYZaSMdp2QaO80SoY2qT34DsaM+IszcA+ix/EbDuC7szn+dKwMtM8zlpfibfh9dbJ1h4v/ng==
X-Received: by 2002:a05:6870:355:b0:203:e0bc:5e11 with SMTP id n21-20020a056870035500b00203e0bc5e11mr10237951oaf.70.1703727746413;
        Wed, 27 Dec 2023 17:42:26 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id g24-20020aa78758000000b006d49ed3effasm7335440pfo.63.2023.12.27.17.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 17:42:26 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	Christoph Hellwig <hch@lst.de>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	linux-arch@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 03/14] ARM: crypto: Use CC_FLAGS_FPU for NEON CFLAGS
Date: Wed, 27 Dec 2023 17:41:53 -0800
Message-ID: <20231228014220.3562640-4-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231228014220.3562640-1-samuel.holland@sifive.com>
References: <20231228014220.3562640-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231227_174229_718034_807D4FF6 
X-CRM114-Status: UNSURE (   9.67  )
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

Now that CC_FLAGS_FPU is exported and can be used anywhere in the source
tree, use it instead of duplicating the flags here.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v1)

 arch/arm/lib/Makefile | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/lib/Makefile b/arch/arm/lib/Makefile
index 650404be6768..0ca5aae1bcc3 100644
--- a/arch/arm/lib/Makefile
+++ b/arch/arm/lib/Makefile
@@ -40,8 +40,7 @@ $(obj)/csumpartialcopy.o:	$(obj)/csumpartialcopygeneric.S
 $(obj)/csumpartialcopyuser.o:	$(obj)/csumpartialcopygeneric.S
 
 ifeq ($(CONFIG_KERNEL_MODE_NEON),y)
-  NEON_FLAGS			:= -march=armv7-a -mfloat-abi=softfp -mfpu=neon
-  CFLAGS_xor-neon.o		+= $(NEON_FLAGS)
+  CFLAGS_xor-neon.o		+= $(CC_FLAGS_FPU)
   obj-$(CONFIG_XOR_BLOCKS)	+= xor-neon.o
 endif
 
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
