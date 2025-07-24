Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA21C87FC5
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Jul 2025 23:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YvCHHMMh0rhASKhzZB2InubHC9Zw9KoguN8oZx20mXE=; b=JXQI7cZ9buiq6N
	0DoXxhqR9l5FiUrs5zxtA9KSwjIZS636ZgQ4xsIoCyqqpikEtevdHXLQz+My/N8eTDwSBsLEnwWsk
	QsouvG2eJjkZaJp1eYUAO7tSa4OLQfCWZYOwJq1blMjehOkCb24V2EzVscWSHbquFbhBqzKiuHI+P
	B1V7cORiq2ZTCuYtmzGJmeaDASn1w3FPr9ZrVnteYr7O8lfUT5844JtdO4B6opGE8M5Ga15+Ib1a7
	FuYAmITA1QMLMSdVyej4Tn6thyK/cS8eeOxcJ9BRd5UUQwy+8GYtmZh4YOcsm3D03X85kockLO3Ep
	wTIbP/wJlNq8GOO6/9mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf5f6-00000008iD8-2COR;
	Thu, 24 Jul 2025 23:47:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf5V5-00000008h2g-408t
	for linux-riscv@bombadil.infradead.org;
	Thu, 24 Jul 2025 23:37:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=WOl3Nqiah3DIFqJnwAEdiPuuEwqhP+r/KN32JLcNnyU=; b=Bn2Yd9k1CP7ZoQE3txYP3zLMlH
	wYc1zkG/tocNijhdqYLkbT47xhl2Q2yKaRaQQRdVMMdjCdH9oQzxAlTf5woHScYs8CaWreUE5sapY
	RgrZZRalLZOYZF0LULTEb7MKwlPZ+UDpzhMc85F/ATDSm60DAX/IKJdD+T/WPlIJauVkRqciVpRon
	6PXO5SeN/SbzRfO7sAfWDD5h1cWj3gb5gTOLroUmBoX42yvUjNdfpwzQZyisUvJ1eyBrm245mNnbs
	VB7cEBrjL4ejhp2HqEz5JYgnr/zz5UcixTbqYoE3jECYzLSv8GCpTSJuPg5JbmWZBo/y8N7Jh4aNJ
	Gpib/65w==;
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf5V2-0000000BioH-3nrH
	for linux-riscv@lists.infradead.org;
	Thu, 24 Jul 2025 23:37:22 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-23649faf69fso12758225ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 24 Jul 2025 16:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753400239; x=1754005039; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WOl3Nqiah3DIFqJnwAEdiPuuEwqhP+r/KN32JLcNnyU=;
        b=bu7rXoi8hKXio1sgskMuXAiROKkvYm/xR0AZnLDx1Wadm00jks3T0a309wXs8JRYQT
         7qW++KDjosH4nIEtZrak/KqmSofk1Dbxvtc1b6JtlKY4tKpIvguBQ8WYfN+QfreZhW0W
         eQVV5IlQON6MjFOL5kD89/KDDQbeGRMrLHOkttF6tLjrUNBxRGT5I8mi2c/ckwszOsE4
         ULusvtyC9KzC253oQzMihD3STx2lhRxss1hUdI3kzwdHg/NDhBHEICucYxJA+N9Ng+Pe
         bD1g9xFIT2h2a0oX5h/A5sPl2ZNkONta6vIdvPIZXHzK9cQqAiKHkgYK6aqAllo6CUbw
         YWLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753400239; x=1754005039;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WOl3Nqiah3DIFqJnwAEdiPuuEwqhP+r/KN32JLcNnyU=;
        b=Uj3Q2O+3gMHMC1EnXcbX0RntmdLVIrUvJWqFsni5L9e+WRBrt7GpbLNICrNLK4q1l5
         nbMZDFh9L2k4EhQQ0II6zrt1cf0jt4QxzN/Gr7WnzpZC7Ok1Sd7+KX1xjUtwYn2Wwd6x
         +hnTR3Nzn4NNStzWybGMCNPRf2Cil4VFPRIPChFnQdYy+vFr8JkArFlLQWUW0ddjVEyi
         pQjbi7VOVCgqBq+HmfEQ2m16P2oBBR4uqjwr22GunqdOZIdSTibce88SZ4VBXrlC03P2
         MTwEZwPKNhriY6oEgYVvrYTHFgM+8foXSJU8RDT9Kw4PS5JDE8KFAntvS7mefnhDMLAz
         JF8w==
X-Gm-Message-State: AOJu0Yz5LKg4Ye5yKIOtJ6xrAKBlUZwS5uwu76+NbzKPdL0tye1o1b1p
	suwUDlqk+Bk3Vv4LZS5Vs+dd5+eXXwSntQLLqFqcbGtMHwWgM/fRv64SaPLt+KTNNwU=
X-Gm-Gg: ASbGnct2VdcFxkiQ1dhfhn+2hCICqS6VvIBDh8g/hHgKYmNXKZV8BEY426+mdr7tZ21
	16Iul1ZeIfUnGPelzVik1W7NnzahM60tHjjClcEDD6Wm22TKK2oNLN5G1d+iQonuAkVuGvA5M10
	5eOXFF/3H6Ih0W6NXASVbyBOv7HkPSBQN/CpXZ/bBnR6aF6PwF/JQ4Em6cA1lUK3QQrqNYz8iAi
	GClWpS9uczkalhamvjL6pUDGU6Oktr9759tG4xWrlps61BC3WcFil0NQdK7J4ayeOKGtxNmvoKr
	oww6AegmFsyMJsyj0xJJiOWMhMD7+s3kwKDOegOT0b9NSP2NwkbsvP/AlZci36VRFLwgpuaYtFp
	qy3cjHPOHByV74FBAdhCsoAREgH+6Yglb
X-Google-Smtp-Source: AGHT+IGSQSNsbZMV3011ClnOwbU01lkESEFEILFi40CGgrviIgB/I9wMU9rWnehZSismvHPpuGcGoQ==
X-Received: by 2002:a17:902:d501:b0:235:e71e:a37b with SMTP id d9443c01a7336-23f981aed8emr123582705ad.34.1753400238919;
        Thu, 24 Jul 2025 16:37:18 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa48bc706sm23598685ad.106.2025.07.24.16.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 16:37:18 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 24 Jul 2025 16:36:59 -0700
Subject: [PATCH 06/11] mm: Introduce ARCH_HAS_KERNEL_SHADOW_STACK
MIME-Version: 1.0
Message-Id: <20250724-riscv_kcfi-v1-6-04b8fa44c98c@rivosinc.com>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
In-Reply-To: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@redhat.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Monk Chiang <monk.chiang@sifive.com>, 
 Kito Cheng <kito.cheng@sifive.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, 
 rick.p.edgecombe@intel.com, broonie@kernel.org, cleger@rivosinc.com, 
 samitolvanen@google.com, apatel@ventanamicro.com, ajones@ventanamicro.com, 
 conor.dooley@microchip.com, charlie@rivosinc.com, samuel.holland@sifive.com, 
 bjorn@rivosinc.com, fweimer@redhat.com, jeffreyalaw@gmail.com, 
 heinrich.schuchardt@canonical.com, andrew@sifive.com, ved@rivosinc.com, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_003721_170329_21EFEC3D 
X-CRM114-Status: UNSURE (   8.97  )
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

commit bcc9d04e74 ("mm: Introduce ARCH_HAS_USER_SHADOW_STACK") introduced
`ARCH_HAS_USER_SHADOW_STACK`. Introducing `ARCH_HAS_KERNEL_SHADOW_STACK`
so that arches can enable hardware assistance for kernel shadow stack.

If `CONFIG_DYNAMIC_SCS` or `CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK` are
selected, skip compiler flag `-fsanitizer=shadow-call-stack`.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 Makefile   | 2 +-
 mm/Kconfig | 6 ++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 35e6e5240c61..7e3ecca9353d 100644
--- a/Makefile
+++ b/Makefile
@@ -987,7 +987,7 @@ LDFLAGS_vmlinux += --gc-sections
 endif
 
 ifdef CONFIG_SHADOW_CALL_STACK
-ifndef CONFIG_DYNAMIC_SCS
+ifeq ($(or $(CONFIG_DYNAMIC_SCS),$(CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK)),false)
 CC_FLAGS_SCS	:= -fsanitize=shadow-call-stack
 KBUILD_CFLAGS	+= $(CC_FLAGS_SCS)
 KBUILD_RUSTFLAGS += -Zsanitizer=shadow-call-stack
diff --git a/mm/Kconfig b/mm/Kconfig
index 781be3240e21..f295ea611cdb 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1367,6 +1367,12 @@ config ARCH_HAS_USER_SHADOW_STACK
 	  The architecture has hardware support for userspace shadow call
           stacks (eg, x86 CET, arm64 GCS or RISC-V Zicfiss).
 
+config ARCH_HAS_KERNEL_SHADOW_STACK
+	bool
+	help
+	  The architecture has hardware support for kernel shadow call
+          stacks (eg, x86 CET, arm64 GCS or RISC-V Zicfiss).
+
 config ARCH_SUPPORTS_PT_RECLAIM
 	def_bool n
 

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
