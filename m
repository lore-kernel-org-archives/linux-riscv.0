Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBEA1C41513
	for <linux-riscv@archiver.kernel.org>; Thu, 30 May 2024 11:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ISSpnAr4wAi2j5dGP/+Q+IvbBIWiNv+Sq1UoKHASKsQ=; b=w//xqr8ZgCaeAi
	rh+yNuQClExn7cHwcVJQuABW31Jjaofl5TkHmaFZ/ENcDvqEZLFeZzKU01wb5UEridRqYNdsOZyyL
	1DTZWhNPseefR9tun4RWcr0UZXvOFzke963PFXumYGZ5Y0mrYFtPLzDZsXYc0b5D82DyKAoCKCh+m
	aMIS7NRx4cOwhx7tjuXG1x3nem3DO4zxEARgbWTqb6pr1syrz2WzbFGgnDEHLFxfnGJJFtL/hMqtn
	fh+80C/yRYCN33OtR3wSEppHFbWH5I4pZlGqIuc39s03qyXMWZf+s5Sb6FnqtwtVafP08B6PehXtv
	g1bVeNlMURSFukex1nfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCdvg-0000000770O-3gtH;
	Thu, 30 May 2024 11:26:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCdvd-00000007704-0iBE;
	Thu, 30 May 2024 11:26:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=iS6/3rMP5XMaNOKzvqnjBVlN/YxRA0hOsUbIiKByQ6o=; b=KGAnzE+WhBKzm/OVVIbQwzi20G
	HTWSOsVIPdplnGkmKhLKHdhJTNi09A6AHv5ZsZPERZMeyRD0M+7N9wYRFNuqp0nllDBufy/yqCHE/
	YbVD7Py75XEk+EgKxUewFagu9Xy/RxKgkYeAxmOcIAmPqSspPMY0obLNjndjlT/uS7V2v1p1y6tjc
	E1pSN+yjA6YSrp1ejLzxeb5HfCmmWuLNhzMgtRbmPtyU8+aC+GZKNKZ1IBOoFaOne8kjDoet4atvR
	NLcjSIe2FNsscTQNzq569nTGXrqh0yHs3lw2Xc6+vBQrkUVgaxsZcAUrB3ailKxs16XaiM8dfPmJh
	sBQLSuJg==;
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCdqm-0000000EYLg-1frm;
	Thu, 30 May 2024 11:26:05 +0000
Received: by mail-pg1-x541.google.com with SMTP id 41be03b00d2f7-6bde8ca4af5so652656a12.2;
        Thu, 30 May 2024 04:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717068013; x=1717672813; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iS6/3rMP5XMaNOKzvqnjBVlN/YxRA0hOsUbIiKByQ6o=;
        b=JjD2kPdXLB5gVut0vdCChOW+U6Jafqtlg+DLQOdKD9hu0QtocbhSUFC4uV4ERLU/gM
         jksxhvgieUjxYmzVdRz6T/u2P30yRWlhxPafEROboNLrh7GYIdJ8ObQ4y66gK28fa1Tu
         nUkQQtNMWqDktRe9qvDgWft4cFeQ12Iw+ZheAb7MlaJejjfFapn0n3y0Vqpeps4wnIrO
         2FDFKwgzOSe9K7y7FNkJegvWmOAKQfE5D0ktttpK+3N0sVnJ9T8K+omND6UumCIu+C6M
         Am2HxuiN8Gun+hdy6YDWpB7+UgynKKb6/74wWHpep6CRudwA2iDfOynwRUJTHiY5VJpb
         4xyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717068013; x=1717672813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iS6/3rMP5XMaNOKzvqnjBVlN/YxRA0hOsUbIiKByQ6o=;
        b=OPJqk8eKhAh3A9KupmYEMMDAgeRjuUR+q7LcLB6fM9me6vHbG1/T4AU6bhiUM98a1m
         8vM7XqmnJq0mEedN21MZPQBvGfsV/7ycmlCOQt+0STB+affXAzor2OXownSNGvgPfIn6
         Z6M0b141wCnxVzRhXs6+kz9wwlwRfJEwdQ4n7Xg8PtiZnRhmOURHfplKRHwNYRsVJ22h
         sHubG+YEyoDRoXsskK+szuqVSnP7UABSbA73qUZ+sJU+sgN1muxOjpw/8SfGY+3N2jUa
         5PCF+EWh/OgXSEDz3HnreqNNKbgWsEh7PwQQY8853hKI1/ccLaL8d+QC7XBsUKFD5UO2
         Aiyw==
X-Forwarded-Encrypted: i=1; AJvYcCWUH/f8WF/+1MQJrJbTYaOFjeY5caeBRYEPIEjHOtkY5Y+vKUKObKkG87y4FNKqwcCxofFIBtxfCXFQrT682LmY4mMQ38P8d68kgULRHg7RUx+N5c/VN2YVmTv/kpbTw2V31ItOo9YSLUS8qdvyDWAxRo6ieziUhuWFdQvvwdmVgKLvrtJ4BHF5TqN7jU9tcE1tCN7O/vzQn68Bbw==
X-Gm-Message-State: AOJu0YzXm86I8Y5EiB9uZhPgGKdnvLykLiVAf5xC53rvfAV50vZbSe7S
	12ZLWeilIO3/iY32w//WGQJFITu/hIxndqW+p9mVbht59UFQwwBP
X-Google-Smtp-Source: AGHT+IEz4if+6nQ+0nx1w/27JH/n7YuyuluXY8+GolxtiPn58HNH1t1JZeRF1Dn7No9YQVVS74OoWg==
X-Received: by 2002:a05:6a21:9982:b0:1b0:111f:2b7f with SMTP id adf61e73a8af0-1b264645684mr2023903637.39.1717068013130;
        Thu, 30 May 2024 04:20:13 -0700 (PDT)
Received: from localhost ([212.107.28.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7021feb0b7dsm2116952b3a.25.2024.05.30.04.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 04:20:12 -0700 (PDT)
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
Subject: [PATCH 3/6] mips: defconfig: drop RT_GROUP_SCHED=y from generic/db1xxx/eyeq5
Date: Thu, 30 May 2024 19:19:51 +0800
Message-ID: <20240530111947.549474-11-CoelacanthusHex@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240530111947.549474-8-CoelacanthusHex@gmail.com>
References: <20240530111947.549474-8-CoelacanthusHex@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2501; i=CoelacanthusHex@gmail.com; h=from:subject; bh=iuzxupRQlKvaCQIBiZ4xlf2r612WVp0v0y+1iZrYbx8=; b=owJ4nJvAy8zAJfY4pvNJRPo6U8bTakkMaREJN5aHbSvetGXDI9/Lgg/2RZ0Pr9tZ2Zeh8l34s JFf/NkbX3s7SlkYxLgYZMUUWcR2Pn29rPTRh2W8JjNg5rAygQxh4OIUgIkc2cnw3+dB99H+ecua Oiy0mLQjDFasNi7dvfTwkdv38ytDfrqaLGRkOOx28cCrP0VHmn/UfmB7LhiTWCzOvmna5ka3YIu yCes1WADtNVCT
X-Developer-Key: i=CoelacanthusHex@gmail.com; a=openpgp; fpr=892EBC7DC392DFF9C9C03F1D15F4180E73787863
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_122357_710139_AFE0F14C 
X-CRM114-Status: GOOD (  11.30  )
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
 arch/mips/configs/db1xxx_defconfig  | 1 -
 arch/mips/configs/eyeq5_defconfig   | 1 -
 arch/mips/configs/generic_defconfig | 1 -
 3 files changed, 3 deletions(-)

diff --git a/arch/mips/configs/db1xxx_defconfig b/arch/mips/configs/db1xxx_defconfig
index b2d9253ff786..6eff21ff15d5 100644
--- a/arch/mips/configs/db1xxx_defconfig
+++ b/arch/mips/configs/db1xxx_defconfig
@@ -12,7 +12,6 @@ CONFIG_MEMCG=y
 CONFIG_BLK_CGROUP=y
 CONFIG_CGROUP_SCHED=y
 CONFIG_CFS_BANDWIDTH=y
-CONFIG_RT_GROUP_SCHED=y
 CONFIG_CGROUP_FREEZER=y
 CONFIG_CGROUP_DEVICE=y
 CONFIG_CGROUP_CPUACCT=y
diff --git a/arch/mips/configs/eyeq5_defconfig b/arch/mips/configs/eyeq5_defconfig
index c35c29a4d479..3794707c9522 100644
--- a/arch/mips/configs/eyeq5_defconfig
+++ b/arch/mips/configs/eyeq5_defconfig
@@ -8,7 +8,6 @@ CONFIG_IKCONFIG_PROC=y
 CONFIG_MEMCG=y
 CONFIG_BLK_CGROUP=y
 CONFIG_CFS_BANDWIDTH=y
-CONFIG_RT_GROUP_SCHED=y
 CONFIG_CGROUP_PIDS=y
 CONFIG_CGROUP_FREEZER=y
 CONFIG_CPUSETS=y
diff --git a/arch/mips/configs/generic_defconfig b/arch/mips/configs/generic_defconfig
index 071e2205c7ed..fa916407bdd4 100644
--- a/arch/mips/configs/generic_defconfig
+++ b/arch/mips/configs/generic_defconfig
@@ -5,7 +5,6 @@ CONFIG_IKCONFIG_PROC=y
 CONFIG_MEMCG=y
 CONFIG_BLK_CGROUP=y
 CONFIG_CFS_BANDWIDTH=y
-CONFIG_RT_GROUP_SCHED=y
 CONFIG_CGROUP_PIDS=y
 CONFIG_CGROUP_FREEZER=y
 CONFIG_CPUSETS=y
-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
