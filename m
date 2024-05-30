Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9493C25B74
	for <linux-riscv@archiver.kernel.org>; Thu, 30 May 2024 11:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k9H/ExxT2TfB57f0gaf/CRXY4yw4pvanWi5018a2BtE=; b=E9l7qG/EUjCyJU
	RJ7Q6bOjZeyuakSJ0byXsHfKx2U3tP/e3HkDZ1HThIWBLUiSk5HvH6tDRWYMJLlnanshhLaSJQI6a
	KiduUJY6jJL/ZULe7V/WPIMVRe5JdAH4zNZKQz/xbr7ZN0/5zv+75aziDIze3Vga10OOOKwlk33PI
	Z+Jry4KLz7nSXjS/i6gGO7IsU6QyzfsavIXWJbh8wPSfmHjF6LskAn2s8BJzSId4Y+iUWDV4TfUJM
	c7T1t/1uR1NZUzOuXQ86WMC8HtfM1FJOKUtAFbs1KlaRtPFhMpUEWRmeWuheWqnkgrTyuM3Ocbcpt
	5BdwdedFpc/9la83Ncfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCdvi-0000000771I-3bAn;
	Thu, 30 May 2024 11:26:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCdve-0000000770L-4BOD;
	Thu, 30 May 2024 11:26:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=UKDbsptHUOf10z9ycdwLPkvcPnlZIVKylvaMWlEqffg=; b=Hq98IzfvtmD0MYHy9lIlXtbjJs
	mtIjsmlBTDZuXO9CJ8jn4R66VUX2mCROsZFr64Yc3XsWW9Ygyz6x9hGZQfJjibixm28eLD6YrKPX/
	cIjzQy5jVE2Xfh3fvvE9sFwOH8AG1sdSHL3VAfAld9FS7qTiwBZNxK9LGfMoJdLnWFppnvl8+vr3x
	JTLiysmmHwF/LvZuDvMpP20wZybg9oKa0IQlf5kO/eefOMItN25mN4OWJzaD50BaY4A0Xc7oCW+eA
	/H5ayqw45BgsvKbWoQeWxwCsjGUjXBZTwXOiBACPFWDOuI2mSleuFeAvskxbp3dIFIFuuaeIEDa5T
	SM3kT03w==;
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCdqm-0000000EYLc-2TVe;
	Thu, 30 May 2024 11:26:04 +0000
Received: by mail-pg1-x541.google.com with SMTP id 41be03b00d2f7-6bce380ebc2so678541a12.0;
        Thu, 30 May 2024 04:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717068010; x=1717672810; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UKDbsptHUOf10z9ycdwLPkvcPnlZIVKylvaMWlEqffg=;
        b=lzwTzqISui8LMvaqYeHNGY/9DMXBwNPq+uZlGamyHfA4o9CLOmLxpKL0MZmxIp9vih
         76/xZRXwKePeHzqLqYnOD2VPv53NPM8CklsljhvmGJaIxjssAcSk+dJ6jwCHFSgMrFjw
         KYhPX7/60wrNKuA48PjkEt2hF8uWqJm7Fc1yVgN+fS5UR3KWtS4Oh60pmg/gccVXBzES
         fmyrIDh8dZw2F6ScfaS9jO5I4ElLdkIPVX0NGSIXNEivQvnmfYyF6LvsUy0nFqnOZVN0
         o4taSVvpTka4aOSTHAmKg6Xfs2CSzAqjmwj1B3V6l9NnLJGHNtEPIpVfszU2ue6MyS6u
         S4Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717068010; x=1717672810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UKDbsptHUOf10z9ycdwLPkvcPnlZIVKylvaMWlEqffg=;
        b=jtwjDmBaNWVAW1rTPvPXjQn4DW9VffCdLZX1CZpk9NfcUtb9zGPhXfBDiYYoIEZK0T
         GkkSguTg6DCi6WYAxkg+zKQqHJHc7y1HT/9PHeJa29UDscWlEmyn4ngz1jGFed7zhMse
         4J8Y9ysRiAATgnLTNQk9ZsLRuT/xt/IJbkaIXZZiRVZh2Ga9uyceVIvo3aRQUNtkD+/Z
         RDBTzI1ZVB6gB9YJ+aEWxem9s32RnbAlomWNaR+2Ohxf0pU5ecXnOBI1j8Z0y5tR1odc
         dLJAyQ1LKVtkbemmv5z2ukyH/jY0urt226LDbEKBHEUTxXlbtVaVpcnbyt1J+p9+1Wri
         LRNQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8kwFV37H5z6GXyiN09+tuEM/VPjP/BrfWJsnpZwjoHZkVHRigtSu+VqqZSQz1UcA8QwYBGQNH+vTjjcUOEM/jGsBh8XTJMosmsqsZNNR/HNRXrVmm8V1ABsQ2Wag+xwP8TF4wMJizH/iZm31Cn1MUa0hBOx8VeV+02pRc+yRpS5e0tZpjYKk4mQTt5gvGnP0xkmA5cPq1NCXXPA==
X-Gm-Message-State: AOJu0YxTuwbMRicLgDduJhMLqOlXC0UH1ceGyubsLQVz/5CsFBZsgOiW
	wXkXMtnkhadw10rsAGSiAx1UdW7FoKHxS59Wn4syNVhPToUMWzKh
X-Google-Smtp-Source: AGHT+IG8jDyJ8as1gn+77mY1eHAg+/C0hnh88tNUqGm5hMTpX2IBrtY6RK5OpQr2kS5B3uzx1FXS4g==
X-Received: by 2002:a17:90a:b005:b0:2bd:f3dc:62d0 with SMTP id 98e67ed59e1d1-2c1abc41427mr1745172a91.37.1717068010054;
        Thu, 30 May 2024 04:20:10 -0700 (PDT)
Received: from localhost ([212.107.28.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c1a777a976sm1534201a91.20.2024.05.30.04.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 04:20:09 -0700 (PDT)
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
Subject: [PATCH 2/6] loongarch: defconfig: drop RT_GROUP_SCHED=y
Date: Thu, 30 May 2024 19:19:50 +0800
Message-ID: <20240530111947.549474-10-CoelacanthusHex@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240530111947.549474-8-CoelacanthusHex@gmail.com>
References: <20240530111947.549474-8-CoelacanthusHex@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1629; i=CoelacanthusHex@gmail.com; h=from:subject; bh=h4glHeoHIj1lCrO/9cfcaGCSQbc7rI3O4B300cL/OlA=; b=owJ4nJvAy8zAJfY4pvNJRPo6U8bTakkMaREJ1/n69Xxaeu7NP36NP963pkB213cGx83nk+e+3 76w6tID+4kdpSwMYlwMsmKKLGI7n75eVvrowzJekxkwc1iZQIYwcHEKwESKNRn+WU/3fra1weNu krm/TiCjVtvfa8brLyYvXBxW9+bE9hjTBwx/hWUiri0SdmdLcHzGfvl11UovoVVOsWVy29fF/F/ 2874CBwCfBE2n
X-Developer-Key: i=CoelacanthusHex@gmail.com; a=openpgp; fpr=892EBC7DC392DFF9C9C03F1D15F4180E73787863
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_122357_043654_C33B97FC 
X-CRM114-Status: GOOD (  11.99  )
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
 arch/loongarch/configs/loongson3_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/loongarch/configs/loongson3_defconfig b/arch/loongarch/configs/loongson3_defconfig
index b4252c357c8e..4d93adb3f1a2 100644
--- a/arch/loongarch/configs/loongson3_defconfig
+++ b/arch/loongarch/configs/loongson3_defconfig
@@ -23,7 +23,6 @@ CONFIG_NUMA_BALANCING=y
 CONFIG_MEMCG=y
 CONFIG_BLK_CGROUP=y
 CONFIG_CFS_BANDWIDTH=y
-CONFIG_RT_GROUP_SCHED=y
 CONFIG_CGROUP_PIDS=y
 CONFIG_CGROUP_RDMA=y
 CONFIG_CGROUP_FREEZER=y
-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
