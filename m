Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB11C27C43
	for <linux-riscv@archiver.kernel.org>; Thu, 30 May 2024 11:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/YzTMN67ULMVtl4zNEwatFaqe5VZM8Nm9FBdS3XNLs8=; b=V+qAYJ0jKKBo2X
	KNRsDsenNQdKpflphGJwFdQM0XVN0A7qZ2e/YVG5BKgnwTFY0uxhuAbE4DVxe6FTGgUDPRK22iCca
	edqOdfaxoA+NzijBdmkla3HQR+W08Dk1019RduZU9ubANNEctHY13p+n4UqKiCuY90yhCThr0ac5N
	CjJ9UatjCfOzUuQT2uDTpIPas62HnPnYF9g0Lyb7CcDE4PizjgxEUGlqtK7PKGFKesuxSGlS/xSxR
	K1CQsaVEru8esppUx9tqCEBFToe7a4rMua9x/p/RjRYhKiZa1knvLbuVtM0DO0ZUZYgmAG6EGiseL
	NLhkxAUYhPkDmiY/jc+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCdq0-00000007503-3sPy;
	Thu, 30 May 2024 11:20:52 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCdpU-000000074jc-0wL8;
	Thu, 30 May 2024 11:20:23 +0000
Received: by mail-pl1-x644.google.com with SMTP id d9443c01a7336-1f082d92864so6321235ad.1;
        Thu, 30 May 2024 04:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717068018; x=1717672818; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FGiqpKa0bHIEpa15rly2elByLBlsz+mavCGVuSQB03U=;
        b=kXXjoo80i/xAEnYoof331s+rxd75V9G7EUNfT1H6rhm+QPGZ6+I/fDBmcwIeINGmsI
         XVLQ/npxXnGLp4nng9F5t9AFs3dFBmeKRqA09R9zy/HvG9Et3Hd7zcDs6D1khR2dyxEa
         J+G5wgZUtUfCipMk7o3TpK8R4YXSvWpGk4ilpd8fTtLe9+b5UQVo+0Ert3BZr1toCWwn
         9WhiQCL+cq2hwK3lhN2qpOI/UJ8Gc/rMPJl/1mHhuS20M41+D3VzQgqEvfsMkXsTbpp6
         MSc0J2hfpz9WCYBBkTs2XYF9TfIlF0TpkhlntBd/FNrVZcdw0yPfA/5OOnCJTNXQV/ro
         r43g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717068018; x=1717672818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FGiqpKa0bHIEpa15rly2elByLBlsz+mavCGVuSQB03U=;
        b=bSglciWPVOFGewBPoywyDO676cxbIL4U88sbeBrzkHGHaDE5t5yXh+wQ1cJJy9pWLJ
         gB5WHEgr+NDj+pGCNP62bWX2Lzm619MQwHhVkr10/Hr3DSwNb6u14vSC5IyfBrm2LVb8
         +xCWzMB9XGMSTuUO7ElP/Kvc8QyKUWxozI2f/fhLT7mUMcPZX8CaQJgCMACF9DsyDjvK
         vgJmdNa8sLvQPpz2p8aMgVRhzdhM5PwSRxQMpYXhcC13p/KWx4UEFq5pAGG4MSlvWKZu
         Xb0W2PZdWKQbeRFpx0eG+8ThJWPngoaK2XzGaaTBTGgoOXDV807vLydfa99I1ogLz3kh
         1xtw==
X-Forwarded-Encrypted: i=1; AJvYcCW7AnCHPerhP7AccjD77cu5bvzybmRXOnTfW67Mh9X0vWh0Mu0rnOnqwvDeVxHZV5OvasSgq6a1m2IDmp+wTh/WzqgeH2sjIsEwVx+Pvz43jAyzDsK210hj11zYWGP/mINdZUWMxu6hILNMBry5nNrk9Jin59RylvNp0U13QmQVSUMlbH6uC7+CbcqPlFB+ZUVHDAyu43xTb/HIBQ==
X-Gm-Message-State: AOJu0YxhzqnqZ4aNuZu58oax01HYyHI672tLctWN6jsqT+FgD9THqRmm
	RuDH0OBIfo+39Uz0Xaf1AcbAIgjKqmM34O9bherhq7RwXETU56Vb
X-Google-Smtp-Source: AGHT+IH8SBUM4HFPal7PP4GlEtGKEuppsnSX92o9KNQGYi+syJrrgm3CpsZ+Cwm0ovcoR5ODsoOSkQ==
X-Received: by 2002:a17:902:f1cb:b0:1f4:f1c1:646b with SMTP id d9443c01a7336-1f619610e86mr13465395ad.33.1717068017750;
        Thu, 30 May 2024 04:20:17 -0700 (PDT)
Received: from localhost ([212.107.28.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f62218d9e6sm9517475ad.117.2024.05.30.04.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 04:20:17 -0700 (PDT)
From: Celeste Liu <coelacanthushex@gmail.com>
X-Google-Original-From: Celeste Liu <CoelacanthusHex@gmail.com>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Anup Patel <anup@brainfault.org>,
	Guo Ren <guoren@kernel.org>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Naveen N . Rao" <naveen.n.rao@linux.ibm.com>,
	Sven Joachim <svenjoac@gmx.de>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Tony Lindgren <tony@atomide.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Mykola Lysenko <mykolal@fb.com>,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sh@vger.kernel.org
Subject: [PATCH 5/6] sh: defconfig: drop RT_GROUP_SCHED=y from sdk7786/urquell
Date: Thu, 30 May 2024 19:19:53 +0800
Message-ID: <20240530111947.549474-13-CoelacanthusHex@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240530111947.549474-8-CoelacanthusHex@gmail.com>
References: <20240530111947.549474-8-CoelacanthusHex@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2029; i=CoelacanthusHex@gmail.com; h=from:subject; bh=kOqrnzdbmJCW+4DZmJVchuzFR6LT5fL9WaReqTWmC8g=; b=owJ4nJvAy8zAJfY4pvNJRPo6U8bTakkMaREJNwub0yXLjr83sFl6+r9m9kR/++RbfTfmNMpv7 my3dmlavLujlIVBjItBVkyRRWzn09fLSh99WMZrMgNmDisTyBAGLk4BmAiHHSPDiWeRLf+fbOwM 1WVrORm/XDDz8bQ1DJ+etga9dN23//qBHoY/HAcKm/+7fhPVYMsRuzTfViI8IXPz8oWr86eHXVw Sp9rHBgChF03a
X-Developer-Key: i=CoelacanthusHex@gmail.com; a=openpgp; fpr=892EBC7DC392DFF9C9C03F1D15F4180E73787863
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_042021_323285_DDA68F02 
X-CRM114-Status: GOOD (  11.83  )
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
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, Celeste Liu <CoelacanthusHex@gmail.com>, Lennart Poettering <lennart@poettering.net>, bpf@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

For cgroup v1, if turned on, and there's any cgroup in the "cpu" hierarchy it
needs an RT budget assigned, otherwise the processes in it will not be able to
get RT at all. The problem with RT group scheduling is that it requires the
budget assigned but there's no way we could assign a default budget, since the
values to assign are both upper and lower time limits, are absolute, and need to
be sum up to < 1 for each individal cgroup. That means we cannot really come up
with values that would work by default in the general case.[1]

For cgroup v2, it's almost unusable as well. If it turned on, the cpu controller
can only be enabled when all RT processes are in the root cgroup. But it will
lose the benefits of cgroup v2 if all RT process were placed in the same cgroup.

Red Hat, Gentoo, Arch Linux and Debian all disable it. systemd also doesn't
support it.[2]

[1]: https://bugzilla.redhat.com/show_bug.cgi?id=1229700
[2]: https://github.com/systemd/systemd/issues/13781#issuecomment-549164383

Signed-off-by: Celeste Liu <CoelacanthusHex@gmail.com>
---
 arch/sh/configs/sdk7786_defconfig | 1 -
 arch/sh/configs/urquell_defconfig | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/sh/configs/sdk7786_defconfig b/arch/sh/configs/sdk7786_defconfig
index 7b427c17fbfe..3599b1683593 100644
--- a/arch/sh/configs/sdk7786_defconfig
+++ b/arch/sh/configs/sdk7786_defconfig
@@ -17,7 +17,6 @@ CONFIG_CPUSETS=y
 CONFIG_CGROUP_CPUACCT=y
 CONFIG_CGROUP_MEMCG=y
 CONFIG_CGROUP_SCHED=y
-CONFIG_RT_GROUP_SCHED=y
 CONFIG_BLK_CGROUP=y
 CONFIG_RELAY=y
 CONFIG_NAMESPACES=y
diff --git a/arch/sh/configs/urquell_defconfig b/arch/sh/configs/urquell_defconfig
index 00ef62133b04..9cf4a719001e 100644
--- a/arch/sh/configs/urquell_defconfig
+++ b/arch/sh/configs/urquell_defconfig
@@ -15,7 +15,6 @@ CONFIG_CPUSETS=y
 CONFIG_CGROUP_CPUACCT=y
 CONFIG_CGROUP_MEMCG=y
 CONFIG_CGROUP_SCHED=y
-CONFIG_RT_GROUP_SCHED=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_PROFILING=y
 CONFIG_MODULES=y
-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
