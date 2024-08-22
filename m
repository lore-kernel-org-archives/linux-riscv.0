Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07A49C3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Aug 2024 17:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ram3k+pbSlGhb+QJK9OgtDz88mgatr853r0dT3lKyKQ=; b=yx2YZ4gxwFS5Ac
	z36XkJs8WIib+dp8wokWZkcB4urK75Z/fkDBlrNTuCSnoDhn8VeaaUUtAHFCN8oPtYUZRsv40PLLh
	9hIALem2CiVxn+0yCXdhYVdIEPna4nqzFvMzf5PnBmhSIIFdDuOajWevWKjO3Us3tU1OAuMDdhN1n
	b8tBbOaFMu5bZ8zCSsgaCrc+CAi3SmJwFLRj4S5EW27PCRs3VKZWlFi0PI6yW2hegMZAyCnYwBKji
	arweB5IQfBgsDB9gZ8cCJIPhUU4rfIg8CwZzdwQ2kETphJ0t49mYb5az6zPrA5Dq/6T0iAro5I2rU
	Zvs3ov35zXhfsiExH6PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shBu5-0000000Dqcp-0D6s;
	Thu, 22 Aug 2024 17:47:21 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shBqV-0000000Dpfv-2Z1o;
	Thu, 22 Aug 2024 17:43:41 +0000
Received: by mail-pl1-x641.google.com with SMTP id d9443c01a7336-2025031eb60so9382055ad.3;
        Thu, 22 Aug 2024 10:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724348619; x=1724953419; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=naTDf2Yfagd090z1pfb9ctw1MuISnW6ZHr9QkxmSD9w=;
        b=dEs74xyreWgjW/z2TMp69ol7gR5LEM5T5buIMibY92G4OpUfnqipZm+5eKo7/Qes9U
         gacib7JOxQlw2+6zHTiSqmQIQxtOifTvIlpIlUk519om0w6FHRJ9dcI2ObGf8Q0ycwPF
         eA2hXSvOcN7FZm6GDeEWzXTVPg3+o7bku9h66IFuFDnm1Hih0yaElvEHP9FLiRrNMwO6
         n6wUBDMNz5KENi/vLk/mqAPNBHyDwVdSk+IZIkqK7rMh0h3OVX3D0JhyU8A6WEx9rhsI
         A9gYlgc0aDz9d4r60vjALb+r9ZJlvbqmGf8V8qs9rrP8v7Veux4BVgc5UGwswlUQuiaS
         CIHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724348619; x=1724953419;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=naTDf2Yfagd090z1pfb9ctw1MuISnW6ZHr9QkxmSD9w=;
        b=abr6Px5DfPkMIaPshz3Dnry+egZPEUxhyCWFiV/El56fnvXujWW7/BpqSvSU0KYqTJ
         u6MlV8SdhY1Agcy2qVZZ6WHLetoPuRmlS5Jwqpmq2Gxi6dmppL+f8puRI0e/GwIzJskJ
         GFFSpnukc9CLwjoERwys5SO0WydAMXFfPSm4JC7k3d+0VQa9vdXPzPj+hJNsQkGfc/hb
         8TGOMV2BtBc4iHUfRX2qU/bmpfwJU1V/fPLxuPSs1q7jS/AeeCJL5Z3v2uueNOYsCpir
         Z2VOmFx2vI4BW+LE5spvQDQJZWDIjvJM4DDb/SFGdr618xJTIrcHKC3X618Cz4w7ty7m
         NCDA==
X-Forwarded-Encrypted: i=1; AJvYcCUZ4dRNFm4bgvdLMR1P9iXRf3y2EjPgXFNWGoRyhEuWwwf+qpjoayWXTxIF6gUnPtBa0sQIshnAIFl4U/U=@lists.infradead.org, AJvYcCWfTtDc27WX1NXLfxUV0lT6vmVEBmDIhGHRCY0XsxLBL1SSmePJZndPNrvKt+7vyOEhUQZYmTcTUjYr9bogADbs@lists.infradead.org, AJvYcCXJpDNTzq5hX94Fr3qXy7Ibg7BFh7xk1d4CWU6ZMa0tIMnpodRt2bqSJDYb99r4kG142bVx3FOpMvdGfUr/qTfSAg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwPo3IH7NCesD/+PujNfcL3xrK1GFxocVnbNwhZsUS1DMrwTGrj
	/wMrjTqRbHLGOSG+SYXskHVLAStn2krubGD9V3fXxGFc4Szp8Da7
X-Google-Smtp-Source: AGHT+IE8Wv2mi92FmXr0EVETbptIN+dts38PH1ZrQUIYcAnqCM0iFwVebSqZvsivRqmBz2JSK5Lz5A==
X-Received: by 2002:a17:902:c408:b0:1fc:3600:5cd7 with SMTP id d9443c01a7336-20367af0b9amr84139415ad.10.1724348618612;
        Thu, 22 Aug 2024 10:43:38 -0700 (PDT)
Received: from localhost ([103.156.242.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203855664a7sm15365755ad.15.2024.08.22.10.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 10:43:38 -0700 (PDT)
From: Celeste Liu <coelacanthushex@gmail.com>
X-Google-Original-From: Celeste Liu <CoelacanthusHex@gmail.com>
Date: Fri, 23 Aug 2024 01:43:27 +0800
Subject: [PATCH v2 2/4] loongarch: defconfig: drop RT_GROUP_SCHED=y
MIME-Version: 1.0
Message-Id: <20240823-fix-riscv-rt_group_sched-v2-2-e4dbae24f7e1@gmail.com>
References: <20240823-fix-riscv-rt_group_sched-v2-0-e4dbae24f7e1@gmail.com>
In-Reply-To: <20240823-fix-riscv-rt_group_sched-v2-0-e4dbae24f7e1@gmail.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Guo Ren <guoren@kernel.org>, Anup Patel <anup@brainfault.org>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Russell King <linux@armlinux.org.uk>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Tony Lindgren <tony@atomide.com>, Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
 linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rpi-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
 linux-tegra@vger.kernel.org, Xi Ruoyao <xry111@xry111.site>, 
 Celeste Liu <CoelacanthusHex@gmail.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1676;
 i=CoelacanthusHex@gmail.com; h=from:subject:message-id;
 bh=BD75Xt3LZKpr2Q5IcAd6LQbXDWkdD5S9pnl1NWkD0aY=;
 b=owJ4nJvAy8zAJfY4pvNJRPo6U8bTakkMaccrDq7cWv9HKpm1gp9XuSSxq8t74rLzH8Iuc9/9Z
 V6+kdfkhV1HKQuDGBeDrJgii9jOp6+XlT76sIzXZAbMHFYmkCEMXJwCMBH5fob/mZs/PD5ma8Hx
 8F7zO+Gcfce/RpUvkP7W1qScI/C0aYLCVYb/pR2XVnbPdNm4oDwvfcO+zZx8fjqb7h2UvJJdVsM
 b5lHKCADITk6N
X-Developer-Key: i=CoelacanthusHex@gmail.com; a=openpgp;
 fpr=892EBC7DC392DFF9C9C03F1D15F4180E73787863
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_104339_684657_4F745B41 
X-CRM114-Status: GOOD (  11.85  )
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

Reviewed-by: Xi Ruoyao <xry111@xry111.site>
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
2.46.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
