Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 132BFC25B74
	for <linux-riscv@archiver.kernel.org>; Thu, 30 May 2024 12:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zYPINw5FRB+HaTfhiC79x92zq8GMeCBCvyWzWsD6Sko=; b=rj/TJtikcxGLW8
	QHJk8D4DWYkeY+9ptWO0dkSPe0PaQswzJPi5unVqc4DVgQFbZqtMz/IcFRH/gSUnngsgF6IvlbEML
	UzYElI7lWqQqdrP8QCY0y4bgStRvCNepkSr51Nfeym3oL5qspd9t8+UjintWjpGI8qMKKDK/+IIxe
	XvjGVVxecZu/7XobubzXXdzBdNCUduX3J08chTcigJPPLBLu5Vv9xFUbhY9Pw5zySz4Av9Bd/ug1j
	SE2jq8udrisOeYo9C0Jmgj8XF9p93HwDHLeEvhG/ztiVEyGXj4Yedk/0tXCmrKlLIMh467IIDLahn
	ea/NirR3nia9sYFBPJgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCewJ-00000007Etu-36pH;
	Thu, 30 May 2024 12:31:27 +0000
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCdpN-000000074fA-1lNq;
	Thu, 30 May 2024 11:20:15 +0000
Received: by mail-il1-x141.google.com with SMTP id e9e14a558f8ab-36db3a124f3so2692895ab.1;
        Thu, 30 May 2024 04:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717068007; x=1717672807; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yMLg5P8GKaZTkgjzD8R/QqO0sSQDVLJa6m0BArXde/g=;
        b=lXL7zq9gq9Btmigr6M4k4pdpWtL+f1HwFI/vzKsc7t25nfhDW8q69JEFAaStFIfj8d
         mdnQP79h0HxSy2h20AozlVGUTD3QLdYwO5HJUcgIJJtsxScSn9qBibKshwyAhMtGQfjm
         MeV0LB2ID5PUjlZnqwtQjAK/Icko8z0EpLv5umwarYVbCS/oegLzUAjtQ7IPGYBwzbd5
         gxKm57JwFUxK+Z4G6uoYLSzXjMjviQbnwAD2/yhTBmbzJPbc/5ojt0o18RdqsJzBNoBv
         gb2m5M/JqqyxpwoiYw6YIL3NvUxvJz6vN1C4C4XKxZyEYKPzlHkY1Q5enKULj5jMJyhA
         Yc/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717068007; x=1717672807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yMLg5P8GKaZTkgjzD8R/QqO0sSQDVLJa6m0BArXde/g=;
        b=EsvFO7+HVTfnYb1t+u++VMg49f+EU0v6KSCxXwnv7wQyfcqx54w55aIihIXPOrcAhP
         UTAlRcleZXjgJVpgBo3mIVqFDQKVXkwjREzIT7Wiwmx/oSXYhMQGiBwtoor/dlmkeE/Z
         mTwRJbf9VENi1ieAg5aEbQpeoq7tN2Kq8JgoXQRig8V/wlJ7wWEGZErXIFc5j2xMavC+
         1htHkyJJaoDj7YsGbI7PnWTQIDpO2oKaImn3fo9gg4Cep6PTyhxf0OZvxyLUYL/v6Vsb
         csrcSoxzefcr0zCPEQGPDlXPhZSYwX00lh4wYW945dpFwAStBUMRc4kmpdkFB60u+nkL
         Jxcw==
X-Forwarded-Encrypted: i=1; AJvYcCUtoTIAL91PTfmtIpzZ4l0dro0931cq+Cyk3BHeaV5yBOIkCSGzsrGKJCEdhJchgc5Kc5eJIt5P5ETAR97JqcnrxXwh3iwKsHKK4FBz7nF9WnhniyWdeaDfiuOT6O40geNyyhlgTotrUbdNB/Xyi4thoGDx2Z7ozaelLhoV0WYYz7Ng2qll1b33kLiJsibXGVxeAIlZ/emxGA/AqA==
X-Gm-Message-State: AOJu0Yw677l5FzMGm3qJU1smE7UIQTwVY7+jPU7e564q++XQWgwI9w3M
	TqML1XiBgWYtLunUI8HefQtNdJZ4pjIqt0tqKyZhUKi/0SWQjotH
X-Google-Smtp-Source: AGHT+IFxgfGuk4WvYoxrChp+N4lQDR0Si7/7Vlzjuk7wpmJrGZ30ttsy31urG1IDYNTmVV6Zs/i1hQ==
X-Received: by 2002:a05:6e02:b27:b0:374:6472:d923 with SMTP id e9e14a558f8ab-3747deba9demr23632145ab.0.1717068007160;
        Thu, 30 May 2024 04:20:07 -0700 (PDT)
Received: from localhost ([212.107.28.52])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6822198a7e3sm10550697a12.34.2024.05.30.04.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 04:20:06 -0700 (PDT)
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
Subject: [PATCH 1/6] riscv: defconfig: drop RT_GROUP_SCHED=y
Date: Thu, 30 May 2024 19:19:49 +0800
Message-ID: <20240530111947.549474-9-CoelacanthusHex@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240530111947.549474-8-CoelacanthusHex@gmail.com>
References: <20240530111947.549474-8-CoelacanthusHex@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1883; i=CoelacanthusHex@gmail.com; h=from:subject; bh=FEk4ZichD7CqTRAppezRH+4H9dhTF4GYT9EUDpibpAE=; b=owJ4nJvAy8zAJfY4pvNJRPo6U8bTakkMaREJ16rP/zv78xijc+SbFuluq7KoDVxfdGb3ntmwV 4b5b/rJ87kdpSwMYlwMsmKKLGI7n75eVvrowzJekxkwc1iZQIYwcHEKwERiuRj+FyWbH5kg7nGC bXudX8b5SVrfDn7ffNohZmU9l4bwcat4U4b/tfNS9VctvP7+NI+h5NrpGpcrHCr9as+x9XPYVM9 LOc3JBwDwgkw9
X-Developer-Key: i=CoelacanthusHex@gmail.com; a=openpgp; fpr=892EBC7DC392DFF9C9C03F1D15F4180E73787863
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_042013_472151_18E54E46 
X-CRM114-Status: GOOD (  12.46  )
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
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
