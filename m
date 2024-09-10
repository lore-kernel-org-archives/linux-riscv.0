Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21B55EB64DE
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Sep 2024 12:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ypI/abuSPaDc3pp3ddbj3/4Nkwlllbjx+eT7w8YGlfk=; b=1EzcJ9VVfQUaHq
	Q/uXKx2AYGtNFqQsOwRpANx9RjmkhMHhoAAX1BzYv2Td9skRHY4Lb4vG2CFkoAY7TLkO4az/8r7sJ
	v2mB7QddbQof/0MNckdNdmL1ejgl/8ho9ZZh4maSSCTRi1/hs+2nYQVWgbwMD8/pV/qVMOciuD/kU
	XJgSv/Kt0e4yHA1uDQuLacGhFvxZckrYHGTuezoOJ0m/YI3dTa/ND+RWLtXG1axfMeTNDas+a0yFb
	FbbtsbvQoFA4wXyff2ZRe/ET4yCAYQ4ehXuzrrYxV3+zOccLNUXyjioJKTSlNU8Jyw3EKkvj288wk
	9WzMprcEv6/BZYutb95w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1so0Mj-00000005cgm-1y5Y;
	Tue, 10 Sep 2024 12:53:05 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1so0L3-00000005cGk-2toN;
	Tue, 10 Sep 2024 12:51:23 +0000
Received: by mail-pf1-x444.google.com with SMTP id d2e1a72fcca58-718d985b6bbso3708957b3a.2;
        Tue, 10 Sep 2024 05:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725972680; x=1726577480; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HmFRGdMwr20yEnEpySkcXv8bxDquizqNtEjadBQeONs=;
        b=gMCPaAszCRvH1m9XtjnLoT1tw4agT7yHo7B1sqUt+k60jRLlegspK1cUkKRyVKdbHq
         XhrMwCTlKCCWuO+Scx73y7vFXFi1Fc1lHTmhlTi7lcdxHMKyv+wP0awYhnlOOFMkK3km
         Kkk6/8b92udDaj4PDUTOGmCnCjwdG4Bcy1hwwBkNENgBe1yHKwBtvdsSqU39w6c5XUYi
         iZea0aK9gZFA5T51TEFrp/dhldI4TUagNXxh5a0beMTkC8Cq9DitB7e9Cv4zIcBfFuY5
         mF+YLVcKsmz2d1rAT66IlX337U2o0xnsyb2uWJ0NEH6O/WTfnBS3DhEVbn7A2uzmTWyJ
         QkAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725972680; x=1726577480;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HmFRGdMwr20yEnEpySkcXv8bxDquizqNtEjadBQeONs=;
        b=QQfvECsLYeLUU3zzSjQ2Ewe739nHko9ybbwU3RRXfUBWuAJTmogRO1xmxowZhPNBQT
         eNnMOb29iLoiaPQJEic7OEHbIM9Nn+cDO8VhL/xIe/q0ox7YmE5XVsDX3cPf8LTAsgms
         mijXQv8nIOwc6mWp7XwD1jpzaO/u4dBzH0r91fQEgFzOoc1nzZkJFYJevu50ec8MhiVv
         21DJRRFuGG7lbISIJxompOFEJQeDupnNoUkaTemDi9pIszY0VUTZaj63i34YsEhaK4QA
         kDjMvj8NR+7MZ91lri2y1LdhfaW++r9HTmmE0e4IVT3N43P5vJR8o8L/JTuUmaf5WwTs
         WJ5w==
X-Forwarded-Encrypted: i=1; AJvYcCUUR2X2hf7LRG7yk6VLLrKp9x5HvWbze74MPXIRAwHPmYudxB2isFCTxQyIiMncn9oQlfLijml7VXGXiBY=@lists.infradead.org, AJvYcCVdUqVnm+NV7qsikWYDoZvzPwkR4FGQcnfLGcJgS0UUVkaCXEt/pM55RkelF489y9PkBAmHupsqQQGys3uCf6HC@lists.infradead.org, AJvYcCXLfS72DxMxRRffjM93tru30rsBA8sv28KXx0mVc61ts0e5DVayZzlaK0VxvQ0/w4h1XA+H3wau0yUrpwx/G/2adQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7JTcBLSKoRS4uZPqWLAItPaR43rLUseMpxEHB0sq1Hfi7ySK2
	EnfSmX5vhlSmo4tWtz/eAx7rSi/1c7rum4Qhf6dV+JyvIcOAB3bG
X-Google-Smtp-Source: AGHT+IG248YCrlDAw2xajSnMZP7vlgtd8wgKpLqJSASLHed1IOD9s2TORggoVe5FKne78SHiSh0bHw==
X-Received: by 2002:a05:6a00:4fd4:b0:717:849a:d668 with SMTP id d2e1a72fcca58-718d5e301d6mr19258677b3a.10.1725972680311;
        Tue, 10 Sep 2024 05:51:20 -0700 (PDT)
Received: from localhost ([212.107.28.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-719090d32ffsm1305614b3a.220.2024.09.10.05.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 05:51:19 -0700 (PDT)
From: Celeste Liu <coelacanthushex@gmail.com>
X-Google-Original-From: Celeste Liu <CoelacanthusHex@gmail.com>
Subject: [PATCH v3 0/4] defconfig: drop RT_GROUP_SCHED=y
Date: Tue, 10 Sep 2024 20:51:06 +0800
Message-Id: <20240910-fix-riscv-rt_group_sched-v3-0-486e75e5ae6d@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIALpA4GYC/3XOQQrCMBAF0KtI1o4kabTVleDGO0gpMZk2gbaRS
 S2V0rsbdaEbNwMf5j/+zCKSx8gOq5kRjj760KeQrVfMON03CN6mzCSXiu9kDrWfgHw0I9BQNRT
 utyoahxasRC7UFVVhNUv1G2H6fdOXMuWaQgeDI9RfcJtxIcRe5ZutSldBAaeArTa6H9w9nnE6N
 p327caE7mU6H4dAj/faUb7kj1PI7P+wUQIHVPaqUao6R/FjlsuyPAFxOzqbBAEAAA==
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
 linux-tegra@vger.kernel.org, Celeste Liu <CoelacanthusHex@gmail.com>, 
 Xi Ruoyao <xry111@xry111.site>, Stefan Wahren <wahrenst@gmx.net>, 
 Kevin Hilman <khilman@baylibre.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2848;
 i=CoelacanthusHex@gmail.com; h=from:subject:message-id;
 bh=xt5JaBDuTJrD7O0EfnMDSyenJKkQfXyI8xQwHbDtYuc=;
 b=owJ4nJvAy8zAJfY4pvNJRPo6U8bTakkMaQ8c9n7cbfzk59X391e8DW8R38Vd9NJK4em3uftmP
 THh++tpfPNrRykLgxgXg6yYIovYzqevl5U++rCM12QGzBxWJpAhDFycAjAR9+OMDCu+8trVyR1a
 +lGiv/zy9oCHhY7+Ol+XV7vPvSXCNFt03XVGhqddz9bJXYvKW3xZL6ll/rsNWR1ST8NFfJ7duti
 z89WtNCYAsCpTEg==
X-Developer-Key: i=CoelacanthusHex@gmail.com; a=openpgp;
 fpr=892EBC7DC392DFF9C9C03F1D15F4180E73787863
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_055121_771979_DDEB2B51 
X-CRM114-Status: GOOD (  10.64  )
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

---
Changes in v3:
- Remove Fixes: tag because of it's not suitable.
- Link to v2: https://lore.kernel.org/r/20240823-fix-riscv-rt_group_sched-v2-0-e4dbae24f7e1@gmail.com

Changes in v2:
* Remove MIPS and PowerPC patch because of merged.
* Link to v1: https://lore.kernel.org/lkml/20240530111947.549474-8-CoelacanthusHex@gmail.com/T

Celeste Liu (6):
  riscv: defconfig: drop RT_GROUP_SCHED=y
  loongarch: defconfig: drop RT_GROUP_SCHED=y
  sh: defconfig: drop RT_GROUP_SCHED=y from sdk7786/urquell
  arm: defconfig: drop RT_GROUP_SCHED=y from bcm2855/tegra/omap2plus

 arch/arm/configs/bcm2835_defconfig         | 1 -
 arch/arm/configs/omap2plus_defconfig       | 1 -
 arch/arm/configs/tegra_defconfig           | 1 -
 arch/loongarch/configs/loongson3_defconfig | 1 -
 arch/riscv/configs/defconfig               | 1 -
 arch/sh/configs/sdk7786_defconfig          | 1 -
 arch/sh/configs/urquell_defconfig          | 1 -
 7 files changed, 7 deletions(-)

--
2.45.1

---
Celeste Liu (4):
      riscv: defconfig: drop RT_GROUP_SCHED=y
      loongarch: defconfig: drop RT_GROUP_SCHED=y
      sh: defconfig: drop RT_GROUP_SCHED=y from sdk7786/urquell
      arm: defconfig: drop RT_GROUP_SCHED=y from bcm2835/tegra/omap2plus

 arch/arm/configs/bcm2835_defconfig         | 1 -
 arch/arm/configs/omap2plus_defconfig       | 1 -
 arch/arm/configs/tegra_defconfig           | 1 -
 arch/loongarch/configs/loongson3_defconfig | 1 -
 arch/riscv/configs/defconfig               | 1 -
 arch/sh/configs/sdk7786_defconfig          | 1 -
 arch/sh/configs/urquell_defconfig          | 1 -
 7 files changed, 7 deletions(-)
---
base-commit: afcd48134c58d6af45fb3fdb648f1260b20f2326
change-id: 20240627-fix-riscv-rt_group_sched-d2e014be48da

Best regards,
-- 
Celeste Liu <CoelacanthusHex@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
