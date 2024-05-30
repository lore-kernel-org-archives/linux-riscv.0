Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C153BC27C43
	for <linux-riscv@archiver.kernel.org>; Thu, 30 May 2024 11:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yuJ0EeRnVEuz7VaPid+TSAegbPiRxWDJkLn5mYQIgAA=; b=Ql+jIqgg1biVbc
	j7b59oeODuY9RLnFtTrcvll257qKUSBAK3lfF4644QfcwY98rjGtKJ6a5lLGD2DfA98Dvrog14o21
	aY9XV27YchhW0ifd9F7UxCTchdFETZeCG6JqO9sAub6BBrHeXY0BMd9oLXcPjYzVG0AbbOtID575p
	MsQ2ChYXXTw3FB6nBmLXzsLxymeWebPlCSNs74C4Xo0UhcoR/k93vLEXQTyOI0kiU9BvHeprwjbQi
	hHf7GtmDGe8W0Q2Sl888rtpBFLWluN9BFKK4mGZydd3s/3OmLJb6wCEExLhwx/FxFRKBTJRTGlqp8
	uYDEAdypPl0QSUtHPulA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCdpf-000000074pk-0nqG;
	Thu, 30 May 2024 11:20:31 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCdpR-000000074iN-3Tje;
	Thu, 30 May 2024 11:20:20 +0000
Received: by mail-pl1-x643.google.com with SMTP id d9443c01a7336-1f480624d10so6712545ad.1;
        Thu, 30 May 2024 04:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717068015; x=1717672815; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dH4BG/CKSo6jMt/U3mBL2fbfMm4MpAzh5hyuRszV+t4=;
        b=VlSskVbTZs5kNtGmOMFcNTz57ydP0Df9MBQn/Tdc/FYHpPo66YiECSvOGIocI4kjS7
         dr9v6QaqesmNW840idlwVdhVuXG2qWsgYm2fIz6MZOFZPfIk1LnzgY93x9mK9AMrYQ2t
         AKcZgOa0e7zVPzNnk7WOrlk+L3r3iC2GBoEGWKxrL3PTfBhHzRXwFP/mdpxOXEJ84vpe
         tjRpqlsBH1GRD8HFnlZXiMOEt+GWF/w+MXb3KjBCdePSzmzPIcrUlVY64vK9gy7nuWPK
         ZuzrQEXaarCJHqF82q8nJRizN1JR5uqqNp6ivQKfpHU6OlUp9817IFzUJU34f4BuLpn7
         ea+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717068015; x=1717672815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dH4BG/CKSo6jMt/U3mBL2fbfMm4MpAzh5hyuRszV+t4=;
        b=jlzUs3LtgYQEoYWBNu+YOHMBwLNx6aT8JdAEFcqfBJaOieAJo7AewxI7ptccnEKAz5
         rOcV7sYRDPPtOd6zBc0zxORvqmYMusm2O3+OsjH1cKX/gS0bf/6+4MtszYAxARpxOWSB
         DMYsNffgnGab+ECp4KVS2PlseIKbzfdr+GQSFE4pQC6QgEXnYMqt0JduZeVva6VWY1bW
         fV/hMWAbTpeCEizVOJsoKCKr/zIUFiD6Q3q68lf0kAnBFKTsTWmmbRuRY2r/gZr4xKIf
         9b+vsFAZnedBWzRdy7MbE7B6ODdaT82X6dKCb/yD0a5Tt6zJJ788q49zyTsk3b2BYRdo
         N37A==
X-Forwarded-Encrypted: i=1; AJvYcCXc9zNm8Y2XnQp1EI4hib3mnkCp17zJtmIxPKjHFMm3AbbAJicsA0xNkciFs3o20AH2WJnOHGf5vQzN32MScd1m/1MXWYocHKHUUySCpIESlq8IdHgkMLEQNtvAnZ2a7/R6wtae0ZtCdf4Ydnf0m6R0kEvdpyM3S4xB1TVxzY4x/X+N+vlsCgZuS8FpA8ZP6dG5XAi7UoD21qYAQQ==
X-Gm-Message-State: AOJu0YzWZqpXvZlwjWI2ink+5mlOJY6dRicYnuz4pDLfwE2Fj3RK8SH5
	XvRauHSQIocd2VXPRrktolot4+Loy1Wimw74rVAQx6tkB6ZSEfSI
X-Google-Smtp-Source: AGHT+IG8jHeaxjvonyo+8k1nlUsHHhRggP/hzSY+HPghj9Yo3s6jnJryohh0teWJzBXwbeSfn/+xNg==
X-Received: by 2002:a17:902:ef45:b0:1f6:1a91:e744 with SMTP id d9443c01a7336-1f61a91e96fmr18511035ad.21.1717068015407;
        Thu, 30 May 2024 04:20:15 -0700 (PDT)
Received: from localhost ([212.107.28.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f48bbbcaf0sm81594105ad.48.2024.05.30.04.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 04:20:15 -0700 (PDT)
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
Subject: [PATCH 4/6] powerpc: defconfig: drop RT_GROUP_SCHED=y from ppc6xx_defconfig
Date: Thu, 30 May 2024 19:19:52 +0800
Message-ID: <20240530111947.549474-12-CoelacanthusHex@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240530111947.549474-8-CoelacanthusHex@gmail.com>
References: <20240530111947.549474-8-CoelacanthusHex@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1725; i=CoelacanthusHex@gmail.com; h=from:subject; bh=Y154zJjweZqXiEFejTlLKuxlmlIxiSlX1+quATRaPS0=; b=owJ4nJvAy8zAJfY4pvNJRPo6U8bTakkMaREJNwz83B+K5vRMSbg2N3g2v23ulidmG/9Zikz5N r1Q2vnFpk0dpSwMYlwMsmKKLGI7n75eVvrowzJekxkwc1iZQIYwcHEKwES4nzD89/SoEmo8dO8G n0eO7Aw1cZt90Zb+dnteRPD1pkVFLBEsZmT4umrj9jtvzS78ub1pD3/1w7Mzvl6+8T9jVc6dBXm cuVf72AEUHU7d
X-Developer-Key: i=CoelacanthusHex@gmail.com; a=openpgp; fpr=892EBC7DC392DFF9C9C03F1D15F4180E73787863
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_042018_053637_47E70143 
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

Commit 6e5f1537833a ("powerpc: Add a 6xx defconfig") said it was copied
from fedore's ppc32 defconfig, but at least since 2015-06-10, Fedora has
dropped this option.[1]

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

systemd also doesn't support it.[2]

[1]: https://bugzilla.redhat.com/show_bug.cgi?id=1229700
[2]: https://github.com/systemd/systemd/issues/13781#issuecomment-549164383

Signed-off-by: Celeste Liu <CoelacanthusHex@gmail.com>
---
 arch/powerpc/configs/ppc6xx_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/configs/ppc6xx_defconfig b/arch/powerpc/configs/ppc6xx_defconfig
index 66c7b28d7450..c06344db0eb3 100644
--- a/arch/powerpc/configs/ppc6xx_defconfig
+++ b/arch/powerpc/configs/ppc6xx_defconfig
@@ -12,7 +12,6 @@ CONFIG_TASK_XACCT=y
 CONFIG_TASK_IO_ACCOUNTING=y
 CONFIG_CGROUPS=y
 CONFIG_CGROUP_SCHED=y
-CONFIG_RT_GROUP_SCHED=y
 CONFIG_CGROUP_DEVICE=y
 CONFIG_CGROUP_CPUACCT=y
 CONFIG_USER_NS=y
-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
