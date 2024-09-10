Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A91EB64DE
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Sep 2024 12:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pwwiIoRmXI9NfrdLWzkVMDArhTECSLwhjl9o2nrA5xE=; b=teT/wkl3PUKKya
	Wows2tz4ghAxpfO/phU3RPO1FX1R3wJ2wYnYV8hFSNJECeUC25ivR3qeLnmA4DmKrQIes5Ug99LYH
	IO6mdBqh/fplWlE4rNUjEpB2OF81Rqtco5365tZyFi9+2im7rwWfoKKJWH+QtyfjK9ITDBOoaBHjn
	mWCzuD/plrKz3y09PERZLVftr8rl8MQpiWxWGmVCAEBmzPZGmDsLsWqrcLubxWhdJoR1vZLSRMYyG
	D8Zs9MriixBHi/5z0vl3lkCBu06Ypf5hFpGRWYSTGptHdQP8ZBT0R87xgUkyVB6gIqDG+CR5VNOXa
	DwC+RxoCVNcNKOwA7rqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1so0O4-00000005d3b-14zz;
	Tue, 10 Sep 2024 12:54:28 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1so0L8-00000005cHy-2aws;
	Tue, 10 Sep 2024 12:51:28 +0000
Received: by mail-pg1-x541.google.com with SMTP id 41be03b00d2f7-7c1324be8easo4455009a12.1;
        Tue, 10 Sep 2024 05:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725972686; x=1726577486; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7zhYtyf6pWudgvlQc34K3t/DBsqlL88K8Bl2wQ6uvtE=;
        b=mYeTShTbF1LGbWnvgZdulfevk4NtITVvYC0YP7bFGW2NhuOYSXZ2ZtmP/vhEMDKCu3
         yld+j0J6Tzka2KSyb0dlirs/w7p5PX5xVSrRSLMZqo7mmYi7WuxiXzAXnwZ2zFEL+KE5
         XKbMbNPgclslzf2Y+zfvqhLNUfOeTC5Y+9kjvbpuzPf3TQk9GMpAMjCWoELoOaCIzeqx
         IrhhhYF55AqZ1wR2KAQvdqk5GWGdKfZqSiQN4c75Xzopr20TrG11GVS1UziU1tLT1TTI
         9aC03imM7Olcs9uIvgqr2wLBObPX/2dpsrWrB7S4GKdUaO1KBmk2CNo/RJqp5XBFH3QK
         f2wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725972686; x=1726577486;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7zhYtyf6pWudgvlQc34K3t/DBsqlL88K8Bl2wQ6uvtE=;
        b=bABw8SLTqywAW4AjmwPTH/8kzW4+XrpT8uP3zti6BKabd9FRlImVJHQmujVI/6awWz
         flk5axkvwNSzocvEjkBZ8h7f5orzt2Qft9x9A++inewLAU1FcqZ/c48OTD+YxZkC/hfN
         aM8rzUaw9tiKbmuuFZPZSotxuevS99WEblgQUPTXOwuiANzDiZB7SMsuPsYX6ikdsB++
         bObcDKU6Ktt4r2siPKjppB/Dgd02zrYGYyKquNI3nJceeaJxwIC75LKT24th2ywfQ6rY
         yF/pPI19VGFRWrsvI602/ItfMT4KiRNRWtp05E3znPUNT1atSs9sq7+LzbVEiw9ikwLs
         15iw==
X-Forwarded-Encrypted: i=1; AJvYcCU/bpeIGpuVE7K/kvIBwII/k/z6S9jlohAkUlv5W4FLV7fGyBORyjj1p2gAFUls9K1BF0Nuw4KIXdiFxbF3+jhf@lists.infradead.org, AJvYcCWHZnW/gUQ2aQYOmnx+yqV1hQcix8qunL0MzzGFq3Re8l+jkVjaGqJeO41LDnN221bXZB6WDHX7tWCXYPA=@lists.infradead.org, AJvYcCXOLqbax7T83Jzi3A8jORJfZJwbY8l51oGQ+A9hRLP3jPyAk2prSksH8JndkqD8P8z5ipj3wxgYNmlBVAPSUzZYXA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzW7uTe/SgJFQ/cOEfd7KwZbl+i73JW0qgIJ6Xu5kaQdm3XO8pI
	akj/9nw78Zkd/VQNYWpR3tOnyDo2jCUdUi3S4ydjEB7CMFm1j5oU
X-Google-Smtp-Source: AGHT+IHmtwAlv5WOsgDMs4PwbsAgQwHfvUqLAI2y2+Ec8H07id42d2TgjmDzwdXFvKEdewnxAip6VA==
X-Received: by 2002:a17:90a:ba96:b0:2c9:36bf:ba6f with SMTP id 98e67ed59e1d1-2db67181b2cmr4323244a91.3.1725972685499;
        Tue, 10 Sep 2024 05:51:25 -0700 (PDT)
Received: from localhost ([212.107.28.55])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2db049883e5sm6314220a91.50.2024.09.10.05.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 05:51:25 -0700 (PDT)
From: Celeste Liu <coelacanthushex@gmail.com>
X-Google-Original-From: Celeste Liu <CoelacanthusHex@gmail.com>
Date: Tue, 10 Sep 2024 20:51:08 +0800
Subject: [PATCH v3 2/4] loongarch: defconfig: drop RT_GROUP_SCHED=y
MIME-Version: 1.0
Message-Id: <20240910-fix-riscv-rt_group_sched-v3-2-486e75e5ae6d@gmail.com>
References: <20240910-fix-riscv-rt_group_sched-v3-0-486e75e5ae6d@gmail.com>
In-Reply-To: <20240910-fix-riscv-rt_group_sched-v3-0-486e75e5ae6d@gmail.com>
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
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1732;
 i=CoelacanthusHex@gmail.com; h=from:subject:message-id;
 bh=6wdnV6HdMVkp3ugnGGe8eg7mkzP3v3E6CFTydp2vS4k=;
 b=owJ4nJvAy8zAJfY4pvNJRPo6U8bTakkMaQ8cDrv6t52TOH0iZkrUt9brR8+cNvzzWly4edHmz
 KnS8YlRey07SlkYxLgYZMUUWcR2Pn29rPTRh2W8JjNg5rAygQxh4OIUgIk8q2dkeCn9ctNlT57W
 mV7nV6ddm1O/7t3//P5ipuOnTFb9ePuY9REjQ9PLM2/CDl+fIVI3uTfpqs7h2D4hubfuDpWL5s1
 2tGqKZAAA05JRXA==
X-Developer-Key: i=CoelacanthusHex@gmail.com; a=openpgp;
 fpr=892EBC7DC392DFF9C9C03F1D15F4180E73787863
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_055126_695653_70C51FEC 
X-CRM114-Status: GOOD (  12.27  )
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
index b4252c357c8e232ec7ba452881dcd7cb0d7f9aa2..4d93adb3f1a220ddd19a5437ff074e7fa9f3e1dd 100644
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
