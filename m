Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CCEBEB64DE
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Sep 2024 12:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9rjl7jEA0vibygNpbAbUt+Q7WId0Rt3eM4JnI8eLvpA=; b=emdvTaXdOzJirc
	CvVGr7lvWwsm1I672CjH40/C+W82W/82hc1oHBkBLJYU+3i2DXPNXL7tKkZmzTV+nsgIPqvmtyDXa
	RX4YHJ2UBXY0mgJR9mcTi2sB6kc06X0GBfyEcYlXijLJBpgTpT4iAlaCs/J7SownySbpwOrYq5Hve
	C9ghdlV8fRcezdgNGrbKZQuE9J1lES0VBsxqGrmyVYuNP5kSO41o/XAtgGezi8o5N7iEZS4kk/ZQG
	0Tt5mzdcsKrWwjRNqbeEWdgTGnIhorLyVj+BtZxQpIUzS7lwXMxZXr67f5cSKq+hRXiNk0uznYNb/
	+zd+q8SyRY+58UIlY7Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1so0P9-00000005dId-0LXU;
	Tue, 10 Sep 2024 12:55:35 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1so0LA-00000005cIp-3m9k;
	Tue, 10 Sep 2024 12:51:30 +0000
Received: by mail-pf1-x442.google.com with SMTP id d2e1a72fcca58-718d704704aso676628b3a.3;
        Tue, 10 Sep 2024 05:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725972688; x=1726577488; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2bAopf7ujBU/05x/Zo+oSjXvUJSVgeIkGsnSfUiFe/M=;
        b=fBhzIZkZbxZ2imh5qiSNOwsgGlptEW4tWYFlXfL1txwGtBCASoB/8eoghA2mFMgWzF
         N+OaNDUGoL8Zgs8Stu+jSk8ciTBRz0wS9pwQcro0QAZ/J9S4y3rjSMNo2OFrqPZd0wwr
         uv4kCxObdKbE6KMSxOoWFeqtQz+zW59HigJ26YlVqZqIKXM24FVmWILocOKpDIR4GUg3
         UqHOuem5/d4gBbkEEfD/LGW5IuxT0B3Q+YEUBCVpnraPW7ntHpPjtV0hnny7S35OD4+U
         1xwJVmCuepS/0fhBwwjYAROQXPMbAKmRxcQaSYK8y7BzkQDCzll7YFYav6x+811i6XF3
         sK1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725972688; x=1726577488;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2bAopf7ujBU/05x/Zo+oSjXvUJSVgeIkGsnSfUiFe/M=;
        b=jMIoEEwM10zWz0DLucsoMQ4e6kp3JBWcHyvo96OF9LcrECj/zBJkVPj0OEx+Mwoaz8
         YbydSwI08giWcRM+u0FEQBwUJxEqD3KzJZ2BuS2FK/wq55yZ57BUzZMCVnY9TsYztAJx
         eYvb+Pv1D8uBKVJ//4rT6NmKOydHoLDTV9qZ67BePNl2nWxI2yKm3QQTspUI0GfEoQae
         EVP5KnESNwEj3cQA1xPhg3llh5ToSwd7K4FRYZ+7SIIL+c2GJvqaz1Dk6KCKeFMawnks
         9xqJ3TY1A3pQC31MaYnTKRH9z3BfVUzyVAkO+Fn3py1e12dzrCJQC7sIRuziALdq58cS
         H0TA==
X-Forwarded-Encrypted: i=1; AJvYcCUMAOGIemaYLxGgnMFkXVCMEiL46VzIOSddUc7giFIp1id1HEXR5G3+6WNfFPXoDS0daznoxWueIT/gjiU=@lists.infradead.org, AJvYcCVjLjyc2ihFELKMI9DEGTWsYlE98FkkSbGr88h3ARHJTK+xcB4CxRaeLqNRvKO9V45axV40zL9rZY7cxrU+IWvc@lists.infradead.org, AJvYcCWQY3tTQcXFcA9Lk6EGVsCC1FiTcPvLp160EX9iPU3PaYxrG2NciZjGHaVRGtggXhWsZ0+ligGg/YGXHFPGM+dAjw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzBpzTgHM7uYPpI6URjTAyVEqlfXaKV1cKpv399lHG1ol4zqfa7
	z+YZwZkhS+FGIo9xSnV8nthtdfo7v24/x6qmCF7qgeY59mfHOXXj
X-Google-Smtp-Source: AGHT+IHgHbCzgcyX/yq2/aN5BrFUKFDAFGLiltGw+vmIZ7aKbx1Z6fmvlBgd0wE3EiRb5/sbMP7HqA==
X-Received: by 2002:a05:6a21:150c:b0:1ca:981:8e4e with SMTP id adf61e73a8af0-1cf5e096a13mr901315637.3.1725972687795;
        Tue, 10 Sep 2024 05:51:27 -0700 (PDT)
Received: from localhost ([212.107.28.55])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2db04966b75sm6317071a91.36.2024.09.10.05.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 05:51:27 -0700 (PDT)
From: Celeste Liu <coelacanthushex@gmail.com>
X-Google-Original-From: Celeste Liu <CoelacanthusHex@gmail.com>
Date: Tue, 10 Sep 2024 20:51:09 +0800
Subject: [PATCH v3 3/4] sh: defconfig: drop RT_GROUP_SCHED=y from
 sdk7786/urquell
MIME-Version: 1.0
Message-Id: <20240910-fix-riscv-rt_group_sched-v3-3-486e75e5ae6d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2143;
 i=CoelacanthusHex@gmail.com; h=from:subject:message-id;
 bh=i4dMYbikEhftIrSd1gq7tvjKJfStRheJwUa1Cpif+Lw=;
 b=owJ4nJvAy8zAJfY4pvNJRPo6U8bTakkMaQ8cjhgVSl/QKw754HE9X+Szg08Pp2726RsspZo1s
 cuehoW11HeUsjCIcTHIiimyiO18+npZ6aMPy3hNZsDMYWUCGcLAxSkAE5EsZGSYdUDWq+zSzrNb
 uf2nMx3iy3m2PDCA48XSy62/naf1Wu9cwvBXwMtR5NxLTpaWCzuFXEqvq6VyxJlzXj0uYqrOt+/
 TP1EOAFFySKE=
X-Developer-Key: i=CoelacanthusHex@gmail.com; a=openpgp;
 fpr=892EBC7DC392DFF9C9C03F1D15F4180E73787863
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_055128_976369_AA7C4BF0 
X-CRM114-Status: GOOD (  12.11  )
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
index 7b427c17fbfecb24d63e717023aad19ce1c953e8..3599b1683593b865d863800eb84b3f8f89d3d57e 100644
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
index 00ef62133b04ded8d0b4221f11e0adafde99d386..9cf4a719001ea5ef4b031c1bbbf8098e8af5a2b2 100644
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
