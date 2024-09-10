Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 247BAEB64DE
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Sep 2024 12:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XTkOFbnj2oRCc59x/0ZLjxTijeC7RV4Ha0QUBhv2M3o=; b=kgvsM9YNwtFvSM
	0Ep9J4PnKev/XhpJyZdeFwI9u9AxOyLjw9yXRMyyT4T/IVnOYN9PHkqFG8cftO6uvkGiAADVjeli/
	twHcGox7IXSgDa1GY47gRoopAPGLLIcgN+tNXa/1RWqcjQ46nco7m7t0BfJOXmeGa62txAIad79HU
	6YQA72s9JGTGSkisufdKYkT3qOEtSSOsplsc24gLM5AgLPWrpaNgUNMdhuWF6Eq6UOGE35w+gHFe1
	8SULUnmavMIkTmiLIC3cLEOewKUjs2bqu1vmwu9dgiYbLTtUPYzFdkl4zVaJeOG2HQ6f0Rh1bYs4U
	12Qk9TChgTRZh9eoPsog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1so0Mt-00000005clS-28Zs;
	Tue, 10 Sep 2024 12:53:15 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1so0L6-00000005cHO-20EQ;
	Tue, 10 Sep 2024 12:51:26 +0000
Received: by mail-pj1-x1044.google.com with SMTP id 98e67ed59e1d1-2d8b68bddeaso3988154a91.1;
        Tue, 10 Sep 2024 05:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725972683; x=1726577483; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r7Rc9kfm8v0kZDrGPOkzuOTqF6FHBC+bkHagLjAPL1g=;
        b=lmqtLE/5hygNFgLRBj7tTcNxBwpwTV8kyp0Q++4G9REPmkUDPqDza+rqVRVavH9o8d
         20sFDjUneoFlG6fQWeaCDpCVHlSfJlu1R8UxkLjqsmdD/8Ui1CiSgEZgBBF+t8quzlfv
         5hbsobst5m3sEGEd5I/UxRyWYNR8hZ7zSx8re4oB/eBK+SzYU6/HNjZJbbq36o0+1qx+
         KilUNwYoxRwYVIKSuZi+auIiOTmgnE8SZPOuaELVrdhfAWu/nD8BNQDELh1lL6+otrmr
         lqdtvH3F53I1vXU5rZNrLIC/+5SAjhHXbDDPvdLUozL7rlxZYf/pskvttXUSnFpXajtr
         3g+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725972683; x=1726577483;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r7Rc9kfm8v0kZDrGPOkzuOTqF6FHBC+bkHagLjAPL1g=;
        b=Tw8r9RyERsKKE8YoLZyDUnRSdsXmlWCqB9jCmuqtQuL0CgBMg1rGTelMqQ3DVaX1w8
         YNDNIDQxx1dBv37Waqhm7PA0/z2OciFcbC5Rm8AEyEY5CSvp+o6ut+naoUd1HH5zkq2f
         U++NqJ16eQlBFhdnbExW+Btx2ckDKwSKNKkhOQ47+AzySHyJbeskquekKOselka50R4s
         +hdErnjziEVKSHUGGM8OAnTr7EFIvYy5k9aKCFvOPiS4IffHrWiaMiSiIxSX6zUxCbD/
         0n+SZx2vSmh8VJx5GdwCmAf9aQNrLI/Ubsx0pY5LPWyGFqL3hwIFRqFWOBD2IeIoVE5Y
         4Mpg==
X-Forwarded-Encrypted: i=1; AJvYcCUHAbS9JvB++2NpMC4noOAfNjEnnLeVr/kZZn938YRj9LCmmrkeNK2LwGB4TsKcuxPj10dPw9c2CLWCGGP5LNWV4A==@lists.infradead.org, AJvYcCVsMaUM9VNeyqgIuxGZY0esIOKjcQnYTSnHS7g369cvBH+0Bok4AoBtCOLoZKiekFHJaeXoFfVNc7Q05Ss=@lists.infradead.org, AJvYcCXqUNbK/gKcOLzUzYAtlDxqzP5EycXcUom+Ve4bTEJtovowAok0ig4vUzq3ohE0nRTez+xPHjZaT1GDRR2zWsE3@lists.infradead.org
X-Gm-Message-State: AOJu0YzJ+KKDSXWMgJGYSDZwLHA2Jdwv8cxG+xpQuhoFyFnXt4t3/GDq
	3rOmfPVs/vWU/yJmwsWd/iuy7U/9vXpWWQxD0EHl+JLOTXqcL0yA
X-Google-Smtp-Source: AGHT+IG5eZbjm5Ya2QBW7ZmccQn2oryjff4WMMcYPIAxT9c+ncTv25A+QUGWTxzLMOWwgDIsjCJItA==
X-Received: by 2002:a17:90a:5802:b0:2d3:c4cd:245f with SMTP id 98e67ed59e1d1-2dad5010441mr15248405a91.17.1725972683183;
        Tue, 10 Sep 2024 05:51:23 -0700 (PDT)
Received: from localhost ([212.107.28.55])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dadc04041csm8412798a91.27.2024.09.10.05.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 05:51:22 -0700 (PDT)
From: Celeste Liu <coelacanthushex@gmail.com>
X-Google-Original-From: Celeste Liu <CoelacanthusHex@gmail.com>
Date: Tue, 10 Sep 2024 20:51:07 +0800
Subject: [PATCH v3 1/4] riscv: defconfig: drop RT_GROUP_SCHED=y
MIME-Version: 1.0
Message-Id: <20240910-fix-riscv-rt_group_sched-v3-1-486e75e5ae6d@gmail.com>
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
 linux-tegra@vger.kernel.org, Celeste Liu <CoelacanthusHex@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1936;
 i=CoelacanthusHex@gmail.com; h=from:subject:message-id;
 bh=cfUrWXL9qtt/rVda6iREvTUmuGd0VH6THULMDnviMOM=;
 b=owJ4nJvAy8zAJfY4pvNJRPo6U8bTakkMaQ8cDm15vp/BYfcFjgX95w7z6J1xDnyz/unOC5Ybh
 Ru7vd5krt/bUcrCIMbFICumyCK28+nrZaWPPizjNZkBM4eVCWQIAxenAEzk1h+G/3nNNzrefDjr
 uVHmtuD2L8ZKWk3ztJKEfp63tdjRv3j2njUM/7MmH5p8S52Ljfl156oFGppi72Q6l51aoTf3s1v
 Ttv0OB1kAKbhR+Q==
X-Developer-Key: i=CoelacanthusHex@gmail.com; a=openpgp;
 fpr=892EBC7DC392DFF9C9C03F1D15F4180E73787863
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_055124_556977_FB250539 
X-CRM114-Status: GOOD (  12.59  )
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

Commit ba6cfef057e1 ("riscv: enable Docker requirements in defconfig")
introduced it because of Docker, but Docker has removed this requirement
since [1] (2023-04-19).

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
support it.[3]

[1]: https://github.com/moby/moby/commit/005150ed69c540fb0b5323e0f2208608c1204536
[2]: https://bugzilla.redhat.com/show_bug.cgi?id=1229700
[3]: https://github.com/systemd/systemd/issues/13781#issuecomment-549164383

Acked-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Signed-off-by: Celeste Liu <CoelacanthusHex@gmail.com>
---
 arch/riscv/configs/defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 12dc8c73a8acfaa5c8f442968a807de303428d9e..de85c3ab261e6d62b2089a3c89bdc9d1b34fa792 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -9,7 +9,6 @@ CONFIG_CGROUPS=y
 CONFIG_MEMCG=y
 CONFIG_CGROUP_SCHED=y
 CONFIG_CFS_BANDWIDTH=y
-CONFIG_RT_GROUP_SCHED=y
 CONFIG_CGROUP_PIDS=y
 CONFIG_CGROUP_FREEZER=y
 CONFIG_CGROUP_HUGETLB=y

-- 
2.46.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
