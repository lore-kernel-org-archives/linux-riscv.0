Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D24D4C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Mar 2022 17:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1Hhn0m3rTavEdE0A/kVBfgy4SNK9fb/dL5FRQKga1/g=; b=42QyJ9gDmKMIM2
	BhpzAcbGBeE7AA9Pv7xtuWp8nqKNGCS75WexbN04kdUQqTpc3PdE8a9tRCY4nJsG8yAeFiYN1XHcv
	6ez709SCueYmnpuyUEu8G66pnHN/pIb4BWFzUFzJYJFriGjREYoUvM0UC1EWeGv6RSQLejmthrAQY
	kDnWx7IYvgVFZgJms7fgTjMrPcLT0e1gwKNDy6bq6IF+VLavUH3wtWVvTLCNUS5++56R1NO5NQ6mc
	3MwxiW/0elrzdexC+AJiW+nWA0Zsb/zi62bFXX6me6LQ/hgp73LYmRcrwn3T6Q1ENSqH/56tGlo1q
	grK6Jq0Caz6ncBVKpaJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSMII-00DaKG-DX; Thu, 10 Mar 2022 17:09:42 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSMIF-00DaId-0E
 for linux-riscv@lists.infradead.org; Thu, 10 Mar 2022 17:09:40 +0000
Received: by mail-pg1-x533.google.com with SMTP id o26so5237187pgb.8
 for <linux-riscv@lists.infradead.org>; Thu, 10 Mar 2022 09:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=9vsxDLv0jRYrdMWCdK+DvGUDoE+ZiEKYs1dLFeqWbTY=;
 b=E4BgBkJ+Xq4T2ddFS5W7BfSpnvoEsJJgEbqQef7Yz2rjMCUEx+9alT20ZbC1rEb5oG
 JduZegrQo51xuIG9Wun90nbMjAe4Kn+rTq63gKtbGdUA1oJF2fTgQygIQ7a+xHmQYcp3
 tAuJOoQNKvuQHvR5y24LzV3AQawgUieAiAvEiar4r+dkwSVtEKVHIDecem1aIftRqrVt
 1MJ9eABNl8N+ADd8QmEy4KCj5+ZZwupUvhbRh5ks6abaD65Xxvl/md65Sao4OShh9ihh
 prBEsm6wEV5SSpbiRoUoARtmFfSy3e3D0YTBBepuQVX5Ph36/8eyH69OooluxSbheTIq
 Qh2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=9vsxDLv0jRYrdMWCdK+DvGUDoE+ZiEKYs1dLFeqWbTY=;
 b=eICPK6suNEit/2/2oB1Mkg2lHMTkI9FtQpQ26oPnhqnTSd1Zs2mcVK2ePedVbX3vGO
 +h4LqJ1E+URPbjsO1sTDG70M59ITHqSJdpYko2myQryeAQULcE1CSmonUZEdhGt8tbAc
 cx4VN0t9g/sPOYTrBHE8PLkZwJuaFRThzB/7vctQbRMoHYkesjNQ69ylkL4L33iuoiX7
 41CdIKNP8yUW+NDgXpS8AOrcGqduph8GXO7TbKJfoQI1dXwacNu8kybMNVvJPPbvTsuE
 kntYFQ/wH7UaSDwg2FZr2dCyw7ia3Vu2ccbtf+lg5eSctmFRpN46gWkfgF5xLIYfUk9z
 hFWg==
X-Gm-Message-State: AOAM530sZoeewRCwYXHqmuhYD7lra43tENFmFy1KJOKIL9q4zCSjJzXU
 cju1m5VHbHAxI8sKORZKAVbNIA==
X-Google-Smtp-Source: ABdhPJxnz9epEpZ/4W/EkXe8NMBZnqltyihGTRilS5fQnFLc6+e4CXAYBKGHy5Viezd+couNh+TERQ==
X-Received: by 2002:a63:121e:0:b0:380:8c48:e043 with SMTP id
 h30-20020a63121e000000b003808c48e043mr4837588pgl.356.1646932176183; 
 Thu, 10 Mar 2022 09:09:36 -0800 (PST)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 z11-20020a056a001d8b00b004f74f8268cbsm6372992pfw.85.2022.03.10.09.09.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 09:09:35 -0800 (PST)
Subject: [PATCH] RISC-V: Add CONFIG_{NON,}PORTABLE
Date: Thu, 10 Mar 2022 09:08:45 -0800
Message-Id: <20220310170845.17614-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220310_090939_135620_0205E0C0 
X-CRM114-Status: GOOD (  24.69  )
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

From: Palmer Dabbelt <palmer@rivosinc.com>

The RISC-V port has collected a handful of options that are
fundamentally non-portable.  To prevent users from shooting themselves
in the foot, hide them all behind a config entry that explicitly calls
out that non-portable binaries may be produced.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

---
This came up in the context of the no-M patch:
https://lore.kernel.org/lkml/CAK8P3a3mzax-OiaxBcxM_RgKNsd6N8HW0odRmw38u2jKE5aYaQ@mail.gmail.com/

I'm not sure I strictly need both PORTABLE and NONPORTABLE, but it's the
only way I could come up with to force things like EFI.  I'll poke
around Kconfig a bit more, but I figured this is going to lead to a
discussion so it'd be better to just send this crusty version so we at
least have something concrete to talk about.

I've only given this a smoke test (ie, defconfig looks OK).  I'll go
through all the configs if folks think this is the right way to go -- I
figure it's better to have the discussion on a more focused patch than
on that M patch, as this is really an orthogonal issue.

I'm not really sure what the right option is here: I'm not selecting
things like errata and basic drivers, but I could buy the argument that
disabling those results in non-portable systems.  I am selecting EFI,
that might not be strictly required now but it's the direction we're
going so I figure we might as well start now.  I've also hidden 32BIT
behind this, I could see that going either way but my guess is that
users of 32-bit systems won't care about portable binaries.  I'm also
not sure if this should be tied to something like EMBEDDED or EXPERT.

My biggest worry with this is that users might get the feeling that
current kernels will be compatible with new hardware, that's just not
how RISC-V works.  I tried to write the help text indicating that, I'm
not sure I like how it reads so I'll almost certainly take another shot
at it (though suggestions are, of course, welcome).

I'm also a bit worried that vendors might get the feeling we're not
going to support systems that need modifications to these portablity
requirements.  That's also not the case, as there's really no way for
vendors to make sure their systems continue to run portable kernels
aside from just releasing them publicly so we can test them.
---
 arch/riscv/Kconfig | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 5adcbd9b5e88..de0916d7aca7 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -9,6 +9,7 @@ config 64BIT
 
 config 32BIT
 	bool
+	depends on NONPORTABLE
 
 config RISCV
 	def_bool y
@@ -485,6 +486,7 @@ config STACKPROTECTOR_PER_TASK
 
 config PHYS_RAM_BASE_FIXED
 	bool "Explicitly specified physical RAM address"
+	depends on NONPORTABLE
 	default n
 
 config PHYS_RAM_BASE
@@ -498,7 +500,7 @@ config PHYS_RAM_BASE
 
 config XIP_KERNEL
 	bool "Kernel Execute-In-Place from ROM"
-	depends on MMU && SPARSEMEM
+	depends on MMU && SPARSEMEM && NONPORTABLE
 	# This prevents XIP from being enabled by all{yes,mod}config, which
 	# fail to build since XIP doesn't support large kernels.
 	depends on !COMPILE_TEST
@@ -538,9 +540,31 @@ endmenu
 
 config BUILTIN_DTB
 	bool
-	depends on OF
+	depends on OF && NONPORTABLE
 	default y if XIP_KERNEL
 
+config NONPORTABLE
+	bool "Allow configurations that result in non-portable kernels"
+	help
+	  RISC-V kernel binaries are compatibile between all known systems
+	  whenever possible, but there are some use cases that can only be
+	  satisfied by configurations that result in kernel binaries that are
+	  not portable between systems.
+
+	  Selecting N does not guarntee kernels will be portable to all knows
+	  systems.  Selecting any of the options guarded by NONPORTABLE will
+	  result in kernel binaries that are unlikely to be portable between
+	  systems.
+
+	  If unsure, say N.
+
+config PORTABLE
+	bool
+	default !NONPORTABLE
+	select EFI
+	select OF
+	select MMU
+
 menu "Power management options"
 
 source "kernel/power/Kconfig"
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
