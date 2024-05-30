Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E4FC25B74
	for <linux-riscv@archiver.kernel.org>; Thu, 30 May 2024 11:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ErWaTyxBK8QwZUX/9p6AdbMUxP4zwfRr7nL4/uO5ZgM=; b=KH2EHa9RKiCz0D
	lAE15b8hirrPiOrXRgIj/13ab7LaV3TNQZuTA8Rco8ECd+rFciY8r+EOmk6WK2TeIm2LS35a8JV3W
	BZsjpzk0j1AQx2jgmWg+h+aaFIDlFxG7nEGiH0OPjjgd2Sys0hhzYrdy8Gk9kEEqWRZQGJ4GP7rLA
	WJBhg2HxWzr3aadBj44QMVQZqlHqP0enTq5HouNrE2IO/1PrHsI6cmq2sNfJpqcAKDrot0Gedh1SF
	6E2nvMUWckZnMLXCh1+N3UoG4sLNMU2IKZJaICNX/DfhNA2sqga6oE5aekUeJnQU1bPOxSoLb9uCs
	CeRDe71wNVL5lecM0Qeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCdq2-0000000750t-08uS;
	Thu, 30 May 2024 11:20:54 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCdpV-000000074kI-0Pjx;
	Thu, 30 May 2024 11:20:23 +0000
Received: by mail-pl1-x643.google.com with SMTP id d9443c01a7336-1f44b45d6abso5218735ad.0;
        Thu, 30 May 2024 04:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717068020; x=1717672820; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=10Khnm7VAFiOR+x13kGKX5QXUNu8EX2jhqaMmuaAe9Q=;
        b=nR9Wjf8g0XBC8oj1oxIpFVmot7oqcTugc6KyTWEu+XvOhb+KqOg/aGcPl/dUFzYXPQ
         GLyu3TK9NsB23Xm9vxfHXCi4x+ircmejz1LVvDzI3FYrC6m95sSv1ojQjbHskWB9hQvp
         5KHPVHHQIhsdVh3TSRw5Q3MhjHDBGLRIckaGn7NS0oCyyHxRplSQGFIQBrQfLUP6umuX
         M/rQd9yErymtNVFreO29J06ORVbwZUqp85NWgMvITwagDTRZdqyDQTiK7ciJ3mivO8Cl
         HuR4lNiDhGU40aJnzxj0PhepLgk7l4TdxrJ5232idDQuuSDeampYGOadt/M3IXgubE/v
         aDEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717068020; x=1717672820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=10Khnm7VAFiOR+x13kGKX5QXUNu8EX2jhqaMmuaAe9Q=;
        b=J52rqadP5kxAHGex30nCm8lYuKfBZR+CYoCscOP/qHY3BQsXngXjIec1okAgnWh0b7
         AB0q/um17H+nLvU0bQuUx79vqMfE/ghB0a1L1oAw4/BDz5Ed3DmQo+lxtqmIQ2H7iano
         cwGnIZ9VoQ3f3dTB1s0T/vk5JciWlnIfeMA9PMgVGzi66jm9h4y9aBIlsr2cpTnWeRGM
         8mvmuZZ0mZztfMVX4lmzibiwGI0CcccHB1Ics8HJPf/02V8dUmGHKCsDqZkr5CDPDu/9
         nQ9BRXXGlhMuhNW1hWn+EsV6+r0UTRnchb40OGQUigrt/txb+YS/RWXUg0AGp1PAJp8w
         EzvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhTbfsh3XA+Zo7/VZTWVOPV9WjIEGgZ30yxCQ4kZDbRWj8gqNCi8B/sGs0KACF+BQzQ0Zeoze4JLy7A4sWN+Gm2PhpcUSclnhNtRrLUlqvKYCXSyJwLqJ8zONY7gPGmdVXrapwVc5w6SBgnjwDeZUy3Lu522JpKl/yvXfX4/4gkzbAHa/DbUQf/cc7t+DvwvCNMhxGYBrVOJItcA==
X-Gm-Message-State: AOJu0YxlsiQnt+7sPN39r4L3kMsEb/8kMqyNML9KQwpVK3QwUSbddZw2
	8cTlSgygEijniObu2GITvY+gnv9/9K/2Nf2p1Wo1z7LeAgdwsfYD
X-Google-Smtp-Source: AGHT+IFxkZxBxtRo803YeGMuC8sIHF/n8GOkz3SCFQuOwIu4wbjvdjgInTxjR211s2831JVg1Df+Ag==
X-Received: by 2002:a17:902:f682:b0:1f6:846:c15d with SMTP id d9443c01a7336-1f61983ab3dmr21091605ad.47.1717068020137;
        Thu, 30 May 2024 04:20:20 -0700 (PDT)
Received: from localhost ([212.107.28.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f48e95c85asm80546745ad.34.2024.05.30.04.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 04:20:19 -0700 (PDT)
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
Subject: [PATCH 6/6] arm: defconfig: drop RT_GROUP_SCHED=y from bcm2855/tegra/omap2plus
Date: Thu, 30 May 2024 19:19:54 +0800
Message-ID: <20240530111947.549474-14-CoelacanthusHex@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240530111947.549474-8-CoelacanthusHex@gmail.com>
References: <20240530111947.549474-8-CoelacanthusHex@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2729; i=CoelacanthusHex@gmail.com; h=from:subject; bh=z/Xh6Oh4/edMyA0oTGEdVRRBweOMR/LS4ucNKKx8jxk=; b=owJ4nJvAy8zAJfY4pvNJRPo6U8bTakkMaREJt//Jpz1/9vq+ftrjnHPOdUJ7Zl16y3oqfNMJ2 c4TmxeuZVnZUcrCIMbFICumyCK28+nrZaWPPizjNZkBM4eVCWQIAxenAExEIJzhf8HRRdu8P/5W lRSfdEtSzuIjW+AJrhe/BHfb27mxp8vLBjP8D+rcabfgddQ8Botz1wy6Gi5ev2tY0Ppvy/7rzt8 y5t8MZQUAhClPwQ==
X-Developer-Key: i=CoelacanthusHex@gmail.com; a=openpgp; fpr=892EBC7DC392DFF9C9C03F1D15F4180E73787863
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_042021_446674_11C961DF 
X-CRM114-Status: GOOD (  12.13  )
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

Commit 673ce00c5d6c ("ARM: omap2plus_defconfig: Add support for distros
with systemd") said it's because of recommendation from systemd. But
systemd changed their recommendation later.[1]

For cgroup v1, if turned on, and there's any cgroup in the "cpu" hierarchy it
needs an RT budget assigned, otherwise the processes in it will not be able to
get RT at all. The problem with RT group scheduling is that it requires the
budget assigned but there's no way we could assign a default budget, since the
values to assign are both upper and lower time limits, are absolute, and need to
be sum up to < 1 for each individal cgroup. That means we cannot really come up
with values that would work by default in the general case.[2]

For cgroup v2, it's almost unusable as well. If it turned on, the cpu controller
can only be enabled when all RT processes are in the root cgroup. But it will
lose the benefits of cgroup v2 if all RT process were placed in the same cgroup.

Red Hat, Gentoo, Arch Linux and Debian all disable it. systemd also doesn't
support it.

[1]: https://github.com/systemd/systemd/commit/f4e74be1856b3ac058acbf1be321c31d5299f69f
[2]: https://bugzilla.redhat.com/show_bug.cgi?id=1229700

Signed-off-by: Celeste Liu <CoelacanthusHex@gmail.com>
---
 arch/arm/configs/bcm2835_defconfig   | 1 -
 arch/arm/configs/omap2plus_defconfig | 1 -
 arch/arm/configs/tegra_defconfig     | 1 -
 3 files changed, 3 deletions(-)

diff --git a/arch/arm/configs/bcm2835_defconfig b/arch/arm/configs/bcm2835_defconfig
index b5f0bd8dd536..27dc3bf6b124 100644
--- a/arch/arm/configs/bcm2835_defconfig
+++ b/arch/arm/configs/bcm2835_defconfig
@@ -7,7 +7,6 @@ CONFIG_BSD_PROCESS_ACCT=y
 CONFIG_BSD_PROCESS_ACCT_V3=y
 CONFIG_LOG_BUF_SHIFT=18
 CONFIG_CFS_BANDWIDTH=y
-CONFIG_RT_GROUP_SCHED=y
 CONFIG_CGROUP_FREEZER=y
 CONFIG_CPUSETS=y
 CONFIG_CGROUP_DEVICE=y
diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
index 3a166c2f02bd..9cb265c8d414 100644
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@ -13,7 +13,6 @@ CONFIG_MEMCG=y
 CONFIG_BLK_CGROUP=y
 CONFIG_CGROUP_SCHED=y
 CONFIG_CFS_BANDWIDTH=y
-CONFIG_RT_GROUP_SCHED=y
 CONFIG_CGROUP_FREEZER=y
 CONFIG_CPUSETS=y
 CONFIG_CGROUP_DEVICE=y
diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
index d2a094ad360c..3a9bda2bf422 100644
--- a/arch/arm/configs/tegra_defconfig
+++ b/arch/arm/configs/tegra_defconfig
@@ -6,7 +6,6 @@ CONFIG_IKCONFIG=y
 CONFIG_IKCONFIG_PROC=y
 CONFIG_CGROUPS=y
 CONFIG_CGROUP_SCHED=y
-CONFIG_RT_GROUP_SCHED=y
 CONFIG_CGROUP_FREEZER=y
 CONFIG_CGROUP_CPUACCT=y
 CONFIG_CGROUP_DEBUG=y
-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
