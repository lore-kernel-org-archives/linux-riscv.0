Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 640DEC3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Aug 2024 17:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a3+ET52gEf/gXzi5eYplbbJ62EEYhmNvoLG99csf0FI=; b=MCsp2hZ986Gxvg
	FVD6WP7mrOdx8AwGPeQK9mwSoxIplUSS3jHatk7lQ5yi1TduwmSGHaxz5IB0bc5Pq/W+ODHi1a9mz
	KPxUCn3jCK7UiZfFwIFqcuycLNIDSCFK3jehlFvJ0awtx9IfZSNTA5Fk3Q7JYeP2Dc5oY6y4ao0WL
	95bmB7MBCcySbtnyFY8FJsE3r3fMWC8cjvW+I4vhNPGmRzc5ydWAiCUQSUvvSTJ5MCYXZUHSIG8/k
	yKfUfVgeTvNVOkZdZcn9VFqRfVdqoKYaJDh4nB+j8Og8NRkt/tEwWivazPAIfbDI+LL6Fk306fIpK
	52krLMwmtPYm38FJW4Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shBuo-0000000DqsN-3l3k;
	Thu, 22 Aug 2024 17:48:06 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shBqY-0000000DphR-2cZf;
	Thu, 22 Aug 2024 17:43:44 +0000
Received: by mail-pg1-x544.google.com with SMTP id 41be03b00d2f7-7c3d9a5e050so791615a12.2;
        Thu, 22 Aug 2024 10:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724348622; x=1724953422; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7sOOkFBlhh23O4ezy3O2VeMYO9nyKzVNPflyo9LvKHU=;
        b=Q/D3fj8LTzTjoAWxyodUxVGvVxcyAgrRJqWMhArlc46/CWAOBwu24Gh5ETD3MbAMmC
         Llt5lR2H9EFlGp9E/Nbr/NEShwTCO/ms0H1B15sEO0mVa1E4zizbanNuGiAz/v2npqUK
         V4GqvjIZNCcNQyzqds259FJwDe5CmMERsCWWRICi3rfLTL+XcU/SXXPOcmc9nmHYwEe4
         Rj9la+Anb6go97nrV9uPIjbgZdFD1KIOXE60zJeEhhOdw8Sj9GxEOBWas1uf4iSln7qm
         5ZAgUQtcvOij6GxjwxoIL8Awi/EH/LQxuoez1bo4usNAiNFJWFDJHl6/wMtMWjRtWnfs
         FPmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724348622; x=1724953422;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7sOOkFBlhh23O4ezy3O2VeMYO9nyKzVNPflyo9LvKHU=;
        b=AE2Ct0nXfjZVQRRND8qmM7snz+dog95wgTnbtX6r6CU1t/hUlSCAxQ3LL6F6pw76CS
         l+vg7Kk8TzIVSLTT9otoXYrKaZUziMw11hSS1Mqsoju+ag4MhELiqESkcDT0HMnnQi/v
         iEwcG52qDpUbv9uyGGKhk5RC5hfMJadmIZvF4k6/lBZ6+MncI5b97zdMH0opLPRmSHIt
         +5FRuSvafFE4RTrzc6JFNbi/OGIBaO8o4i9112wQAJtFvSnQwzhT2C+QtLtFVzGK5s1P
         FMqZH1ZEb4aIgCwCBgE5MK25j08J+LybVU/j7cTMl2sP6SpfjKZxG9dwuq6RuSIR4kL/
         XdZg==
X-Forwarded-Encrypted: i=1; AJvYcCUPjAO/XkYPGcz8NKXCE4hVM1vNQU0DKHwV8O+cn7lL0jMUmRLDz/SzDpVpBF+7NV08tfQDJRMgEdbE3zE=@lists.infradead.org, AJvYcCUfGTQs5d0OR3COvHrAlTbbIAfV1OYcaMCFE9HeJx3oeTfnHan5PlBbGMQuMRQ1tTHfnrHG0Yah9E8T7xrx/6YrEg==@lists.infradead.org, AJvYcCUzafGFk2CkUPR6QgGSZVaPUpCJfadCO3RGNLd6qiCeFNzcQjqwobQ7S2lMuGpZn/ZLUFcyKL5dwfn1REDHjnby@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2gDJbYmca0WnJEfK3HNXd15Od4ZSsVs4KrLhZ5Q7FuDfKuZIY
	Zkcx8jQHdDDCb/Vek0mDCTg0DdIucYPalsTyNhbsuqv9N3z45pNO
X-Google-Smtp-Source: AGHT+IFVKAnltALjlFsjogL3o8zeO/3bEDh5Wkul+T/Aa6h0si5BxRHsYJSRp8SKq/v4VG7qkbpDqg==
X-Received: by 2002:a17:90b:3881:b0:2c9:7d09:1e7b with SMTP id 98e67ed59e1d1-2d5e9db8804mr7441404a91.27.1724348621520;
        Thu, 22 Aug 2024 10:43:41 -0700 (PDT)
Received: from localhost ([103.156.242.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d613941e6esm2174700a91.26.2024.08.22.10.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 10:43:41 -0700 (PDT)
From: Celeste Liu <coelacanthushex@gmail.com>
X-Google-Original-From: Celeste Liu <CoelacanthusHex@gmail.com>
Date: Fri, 23 Aug 2024 01:43:28 +0800
Subject: [PATCH v2 3/4] sh: defconfig: drop RT_GROUP_SCHED=y from
 sdk7786/urquell
MIME-Version: 1.0
Message-Id: <20240823-fix-riscv-rt_group_sched-v2-3-e4dbae24f7e1@gmail.com>
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
 linux-tegra@vger.kernel.org, Celeste Liu <CoelacanthusHex@gmail.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2031;
 i=CoelacanthusHex@gmail.com; h=from:subject:message-id;
 bh=RtVPfBukDdiWXFe+rES/vpRLMHkhNnaCFx7uCSJVdVE=;
 b=owJ4nJvAy8zAJfY4pvNJRPo6U8bTakkMaccrDrHXhbvqv0j2K04OUp6r9c3yjL7wmfkK3ed0L
 wiLJwVfOdVRysIgxsUgK6bIIrbz6etlpY8+LOM1mQEzh5UJZAgDF6cATIR5CcP/uAsdETX3d4jM
 P1D0MeoGY0/w5qWbQibevqlWcn6F0szobQx/ZR6s/XP6xDnB6RkyIt+j14R9+7s1gD9Tsy1IxPC
 t2qsvjAD/Nk5/
X-Developer-Key: i=CoelacanthusHex@gmail.com; a=openpgp;
 fpr=892EBC7DC392DFF9C9C03F1D15F4180E73787863
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_104342_704222_06FA7EFD 
X-CRM114-Status: GOOD (  11.77  )
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
2.46.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
