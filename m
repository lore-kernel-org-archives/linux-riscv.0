Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 909C2C3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Aug 2024 17:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EPzk9d+ifJaTA8qKk8UWfgyOPBDoUSsK3x90tCmxaRE=; b=hdYuV6AO5q3Mzu
	P8ddEMT6IGGz0bwcBzM7t7YL0noEIJM9kcMfXA9RWHVgxn2hoG9QEJl7+gfxu71RtOPIreNsOlGiq
	JyyYtmMNHzZ95G3oJtOwNVbkQMybof08NVB0OJLUNIHkLjzOI/d3U6AQ5KFndQxac4EDXoAo1eABP
	UEmkeJ6TW/+k10zTdXrYY6P84D5DluSGpzM+M0NG5OhYWy+T/HJeML3SArgVHgWFGDskvCbXTma3W
	9TmL816KmRueSOcasAw4JX8DZ16AHPKPTQOsIarkthdew4FSLdQen77WUXo6AyjRSZGpUjN1Z+pkB
	sDAiQbBGRTcV5A0KIhTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shBsd-0000000DqCa-0vAS;
	Thu, 22 Aug 2024 17:45:51 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shBqT-0000000DpeZ-1OGc;
	Thu, 22 Aug 2024 17:43:38 +0000
Received: by mail-pf1-x443.google.com with SMTP id d2e1a72fcca58-7142e002aceso996314b3a.2;
        Thu, 22 Aug 2024 10:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724348616; x=1724953416; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+NvCv6jeEaWhn1t3eF5O7vM5v2ll4kF+knLw1urWQdc=;
        b=RzXVE+eGEdBlHF6J6BbirWefnvBLkwxJsKScBFx0NcDdoFP1TCG84XP0q+jqmY5WIK
         J4HkzE9mRVKQAb2WQlDsIP9cQUyRlrjqfo+V4riK+DgBsVpXsheqF90Ho83Sv3nMq1lp
         oUx+nvqKcAZ/HNm/N1ZUh2k5XXuxegH6s9L5Db++YgK60eoayRErBDV4O5c4B4yXRnbN
         iNSTn6sSZ2/wX5mROQgsC53H9FU8qCCdTT+FPlmHCv/tr+fhiZbIiKqUPaVCx0XWrzEv
         Wy9Kp9DbFWIER7m/CDUzA+WDZbuDaSAH0zZe9Ss3WQKj9Oxq4BlyNYkYlkySAZjAkCmu
         whog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724348616; x=1724953416;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+NvCv6jeEaWhn1t3eF5O7vM5v2ll4kF+knLw1urWQdc=;
        b=ql1MlOvuBrYKEFVCBy9xeNU4HgJveRnwsX4tca/FsaMmNrADBicQ9chNBzbVWtD/Sv
         uZ5aep+pSZomhyqxsUuSb5IqsDprUaHaQ6PI4pLt64oLgXyHStiE2+lK8vuk6Bibj7Td
         iMQ8mUvagLTZ7hHD1gtTYO201g6zoc3rOOUP87WelPI1ercvqBnM8CZ1ITOE4erTkrqs
         iZRHOY6pcKEc47g65f/bVdPMWsak+okWVeM9/o6xoo2SnNVh9o8jERmSoQhLGPGIOHG2
         yfQr+maUxeXSFx/puS11P7wRxb0OVEAnjP9xUaNiEaueB0D727mXeIhlZ9XR/Zo/ly14
         Wzpw==
X-Forwarded-Encrypted: i=1; AJvYcCVSda8qNjcrY2cwnY5N8qeZAxiEHrudBVII/MEXS2/lKc/O1UHMnh443nUTUWGo3Nox7ghOySACmtGIUnDwYFSK@lists.infradead.org, AJvYcCW3rkxoKNNl5VV3YUucYmWvFEjraaV8cDtUfDBjEpO3II6ChSQwhzc1OFDJZC5kodIyO/uLWi1USRKGWPBMy8iACQ==@lists.infradead.org, AJvYcCWBWQShc2MHn94kxX99oCeA/JCipkSHsDcygjTFx+swy1O4vDXC9O0Qg7tWWiCgps0e3JyuWfMU0czsSww=@lists.infradead.org
X-Gm-Message-State: AOJu0YxsWXuSwRghkFZTRoU2NzJhtreQTUtvlgfREVn141GpSuajbl7H
	PNsBVMsc13I42ewFrh3w/CiS7DYg60Ddz6uZPUWrI6hkwFm9WdWv
X-Google-Smtp-Source: AGHT+IFY7faoa1ysSNP/WTlIuc5cvUwL0iduNK27/aTo1Ui5+aFB0dzwQSjau/0u3AZ2vjSD7A4hzg==
X-Received: by 2002:a05:6a20:d04c:b0:1bd:2214:e92f with SMTP id adf61e73a8af0-1cad7f8daafmr8210064637.14.1724348616184;
        Thu, 22 Aug 2024 10:43:36 -0700 (PDT)
Received: from localhost ([103.156.242.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7143430964fsm1647764b3a.150.2024.08.22.10.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 10:43:35 -0700 (PDT)
From: Celeste Liu <coelacanthushex@gmail.com>
X-Google-Original-From: Celeste Liu <CoelacanthusHex@gmail.com>
Date: Fri, 23 Aug 2024 01:43:26 +0800
Subject: [PATCH v2 1/4] riscv: defconfig: drop RT_GROUP_SCHED=y
MIME-Version: 1.0
Message-Id: <20240823-fix-riscv-rt_group_sched-v2-1-e4dbae24f7e1@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1885;
 i=CoelacanthusHex@gmail.com; h=from:subject:message-id;
 bh=zrg/IlnMUyssz1StuHquhO16krnEeXCPcrxCVtormZo=;
 b=owJ4nJvAy8zAJfY4pvNJRPo6U8bTakkMaccrDj6cdSh5rvkhA43VF5ie/BGZ8aZM6IH+r8Sia
 u1NErnCStc6SlkYxLgYZMUUWcR2Pn29rPTRh2W8JjNg5rAygQxh4OIUgIkEJTP8j35R0LfbpvUd
 1xaRRpYmh5N3lf8sPhhZfaL89dFXV1JWzmZkmLBztbxRUUjEvrpX0xSd53Jw9lcJmBeKL5h0U7r
 m3345dgD+6E2g
X-Developer-Key: i=CoelacanthusHex@gmail.com; a=openpgp;
 fpr=892EBC7DC392DFF9C9C03F1D15F4180E73787863
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_104337_424629_8D2844C3 
X-CRM114-Status: GOOD (  12.17  )
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

Fixes: ba6cfef057e1 ("riscv: enable Docker requirements in defconfig")
Signed-off-by: Celeste Liu <CoelacanthusHex@gmail.com>
---
 arch/riscv/configs/defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 12dc8c73a8ac..de85c3ab261e 100644
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
