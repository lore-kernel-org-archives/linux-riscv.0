Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D9ACC6FD1F
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 07:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l4jsbGcGtyMMwSdFaAGM7nZXWcPU3fyY/htnFT0K8So=; b=JMVF3kRuH9DwhY
	wL5Gj7ISqm1+9LC1oAPLQT3+EdDmCbXqmlXOguuwiaSICx5gweQngNJfwozjMzChauTqWzc7Nga1A
	tnXLJuTP64QHfdL3Z5dOX+PnJ0F3CibGEEGtFZxNXkquTqifY7Ju+ui7mPpD/sv0jB8XS93GwaZJp
	jYdnYpWIL5Ma+X1BVKifhUdso+DM0JHwH0uD5GMF9OhGKolq2RAi7eUyikHulgEbtHTtzz21KnP0p
	TShZVyJ8wrg0me3QqxRgu5tuThYVfxTXOvAMMJkHIb4qxAudaPxT0qLdgCZiw2Nm7ywl5Hh1NtQXk
	t2csNtq1bgmRLJuJCKSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq6cL-0000000H98Z-19B2;
	Fri, 29 Mar 2024 07:25:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq6bd-0000000H8bB-269s
	for linux-riscv@bombadil.infradead.org;
	Fri, 29 Mar 2024 07:24:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=cDl3drvCV8mQminB8cd0FWY5ZeQD5iRDfGVHISUC3N8=; b=NZlEbrPUfceCIViBDNcpRLB/w2
	xCDe7rzMCxlzqP/YMoRYfjsTyeSDdguskbvRtYy95Q3sw+2QpjPfEj1mI5DG4wn226pNT6UFfIoaf
	4RELrGmv4PJBR8h4/emEr2smGKaEUjdRLIVsvMTrAjCvLum/MauAbzv8tK4aK5eicoB/xy7WcDIfq
	n09oSUZt1R42GVnqN+SMPrY4d4k7eJvWvsdCcNxo8BcHCl9Lk3ty+T2cAQeZOW4Y/l/0Z0UpncwyO
	dJIW7OZgQ/dAASwEkD/P352CVGGYjExp32SHeY8mbnybuTBisNmM3/OTmYEGcfyD7/t2v4voPiHyY
	/OZpl3IQ==;
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq6bZ-00000001Qpr-3kCj
	for linux-riscv@lists.infradead.org;
	Fri, 29 Mar 2024 07:24:52 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-5d42e7ab8a9so1029637a12.3
        for <linux-riscv@lists.infradead.org>; Fri, 29 Mar 2024 00:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711697087; x=1712301887; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cDl3drvCV8mQminB8cd0FWY5ZeQD5iRDfGVHISUC3N8=;
        b=NFrY2hqkzB7B6q5MkqGtWxxwoZJ5c9iAj2Q+ZOv6LpeFHH7YDFU6I//jq5Rxyv17p2
         4+vGx0D/X7wx8nFUGi+8Z3LyFdy/CodR/tS/zCeNVaf7BVh5noDldsbSl8byxuA0gJTv
         do67gt/8gFLqnpRvSAos67FAJj3ggsb15r0BktBBjNGAwNVR0CfLSKA6TfNrsOQVHShy
         OKaOBGYfZT1jxZOZXwH9PdcJSnGnTtZ0I46H/KS/nq2ZYAaMqPtH+86phcywUE5NgDOz
         tfPhi+OySoGycWF6NuqRC3wIXpoEp1e40VvajPr8x5myj0jeBEMbD0P48gN2rP075q83
         VJ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711697087; x=1712301887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cDl3drvCV8mQminB8cd0FWY5ZeQD5iRDfGVHISUC3N8=;
        b=ojfxhxOCKTJzCgKJEnM0MeMzPBRa3uiM+3QY7GcQrH0AvVILSNyEvSC5B45gATprve
         1Tsb9OUmL6DrDVWHLILR1tuq8qWBQOQe4DzMrIcJbj/W+pODTin8kaw6UUxhVmwLayzV
         i+C0hvlCfG3BglSYkeQVXIKXY+qKY5oYKx9vXGfxKUc28OAfoYAu3BckZQTzw8B1veiS
         vKfzJqDaRavOQuVt6T6Rt9FqwiTJMNrz59ACX9DH41RfOaQuXYZjRiLPoupiREcrAtzm
         TzzMRxvnNU5/JpAcy84Y80azjux5erdzHpuVEvW1RyBABTnCP/45GTFLKU/yXI6VtGIj
         V1Yw==
X-Forwarded-Encrypted: i=1; AJvYcCWGkXFH4LKdFckM2Rbgqcsmr3dCjqOl3K1/vTJPp0FWajwr1NGnWwqPblGZdDW31znpADM+TppKp/oSQOSDVMOzfRAiAV2K7g57b5ZnwD+f
X-Gm-Message-State: AOJu0Ywb06oNbE3Q3Jer0jsRGo2kvDtWqDYEqpY9YmQ40ItHvblV0ADN
	1kfB1dhx3oapO4UYTo3cDZSRwYfzPg8Kz64kfco4zcYEXNOk9NKDdhaDcL5rd00=
X-Google-Smtp-Source: AGHT+IF+FV+uMuQXtJuoJZDILLDfziMVBq/KUES3aiEW6OY8o73iJ5kWmw5SdybGS1gXP7gvN622NQ==
X-Received: by 2002:a05:6a20:394d:b0:1a3:647b:b895 with SMTP id r13-20020a056a20394d00b001a3647bb895mr1477372pzg.47.1711697087156;
        Fri, 29 Mar 2024 00:24:47 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id b8-20020a17090a010800b0029ddac03effsm4971798pjb.11.2024.03.29.00.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 00:24:46 -0700 (PDT)
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
	Russell King <linux@armlinux.org.uk>
Subject: [PATCH v4 03/15] ARM: crypto: Use CC_FLAGS_FPU for NEON CFLAGS
Date: Fri, 29 Mar 2024 00:18:18 -0700
Message-ID: <20240329072441.591471-4-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240329072441.591471-1-samuel.holland@sifive.com>
References: <20240329072441.591471-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_072450_221996_F15851B3 
X-CRM114-Status: GOOD (  11.03  )
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
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
