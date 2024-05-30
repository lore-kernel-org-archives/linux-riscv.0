Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B96CC25B74
	for <linux-riscv@archiver.kernel.org>; Thu, 30 May 2024 12:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wvsx5TQM8TK2Q9E22NHn2GDViOBw9rgUis8ZK/vhFbU=; b=dEB5oocAvw9dtM
	+eTzqiCDcmFb9mknJ3tbaRHwGMOVTby6WC2QCHYBCP674AmEO2XVVkmlbSCSuuWArWkt03mtZyqO8
	yQkn7c29nkTK6H9YwwCcD4CfPSFy2a8DcUZDWTt8eTGtRti/efHbIt7I/7mzIVdxlLl2YdEZddKxD
	7cGyTPELQdM14tluMUVlmEt1JbmX7OuoFMhBaM44RB139XlRfMws/fp2E/Yt3uDYVgwfLcsDL/yWt
	nSvX0YEyhKXbvk7X0ZGSrjLJz3iYNdnx6w0KAEUH6P2zK7C5d3j7fBrMwBFdAbOTqYBqdyTXVxYv3
	ud/M+Dj1Yucq0FQOQzng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCewK-00000007EuQ-2NGL;
	Thu, 30 May 2024 12:31:28 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCdpN-000000074eh-222f;
	Thu, 30 May 2024 11:20:16 +0000
Received: by mail-pl1-x641.google.com with SMTP id d9443c01a7336-1f4a52b9413so6390685ad.2;
        Thu, 30 May 2024 04:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717068005; x=1717672805; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z8dJKE69s5+86iqiKT1v7IFgnofzj53z+mkIUUuty68=;
        b=naUx1F2mjPDVeOHEobHdr+5BgN66+x6oiv2ZWYaUxO9/dMseBHNHyJ0ukZblJqHh/0
         fnIKMI6fxKK+Db7vz5kxprCaP5E+ZEOAGaSwE835aUaWV0yjcCxrytStHHW4N/5NY5eC
         V+BqfDpWA1CpIRzhMCsKz4p48MMWNHm5GOMpT4D0mCht6x41BHGM6qTRi3C/E1RTyYKs
         D1cmx0JzoXKiBVjtsu41oSeWK2l9GsxqNJE13cg6pl8s1x7Y8f+7yooNYJVJuFT1fP0z
         ir5gcr3Fq1aUmFSGgjf8XAz0f5LS1O5G+SclENPFSLM/w0cqdUAqhJCXQAmdefA6y0g4
         8OMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717068005; x=1717672805;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z8dJKE69s5+86iqiKT1v7IFgnofzj53z+mkIUUuty68=;
        b=OKH5Ks+jQkdnsksaVjHxYnmI/xhXG5MY5P/GPpqOohwwxq1vAqzhpOC2mrCGnRwcqO
         0FI2fRDkrHmG+fa500rT3EAH8Mkk5DCOXclS1GTFUbABbddNNCT10sgPz67xkXfVk7fL
         4qC9N74PoTjmaV8Bf3d2Saqv7hFF1DhgzQzlzpOipQbMp1Vskzc2LoxuVawfB3Fr1Tni
         9vX530yQmAe4ylcuY6A7wGxjXJ+SSQjxEdtxCPKbS2FlAWNURNpe0CIAiTFJrbTKRtX/
         lSUrnvygPn9zT/bv4wbF8orY0v5r6S0BDXG6tSdqrRtmPMztFE6RlgOfTv4kIKBjSybf
         EJfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjSSlmKfZHpXNIPp8xOxXS9dFvTku1I3DnCcdCiO86+NJbWRLX10AVjKv1YEo0pAMZpd6I2dz2shcMuxOlJzgqj2JDl0Tg3iq0o5ZbfRx2vvWcAXLyNmRUoy6oUZsxGpgseNn3MklABCkT/HfMRQ3cdwOo4Pp0JN7+UhuPbT2y7HdwjSVGvqNVhgurxyHz1DEwjrATrUriaZy0gg==
X-Gm-Message-State: AOJu0YyaoUEDhG/qRbBgmyq8YgyekdwAfRtsDPyPSDHx7dnTCDZ4pzKG
	IaKH3UygrRtcUntlqOJKpsUMPlvYpxJc3KEjkEa1EzvpN393x04k
X-Google-Smtp-Source: AGHT+IHnnxtV+JRyOSR711uh0rY3WubRdOsfI4Q80RTI+mV/CYp9f7gUkptu0Yhyjwe8jY0JUuOaAA==
X-Received: by 2002:a17:903:22cb:b0:1f3:50e7:36db with SMTP id d9443c01a7336-1f6199310f7mr20627105ad.48.1717068004916;
        Thu, 30 May 2024 04:20:04 -0700 (PDT)
Received: from localhost ([212.107.28.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c754d20sm116341765ad.32.2024.05.30.04.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 04:20:04 -0700 (PDT)
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
Subject: [PATCH 0/6] defconfig: drop RT_GROUP_SCHED=y
Date: Thu, 30 May 2024 19:19:48 +0800
Message-ID: <20240530111947.549474-8-CoelacanthusHex@gmail.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2134; i=CoelacanthusHex@gmail.com; h=from:subject; bh=YDOl/Eq4EU32U8REOXA1aLCIyDHNFvkWJvOdwbcP7JA=; b=owJ4nJvAy8zAJfY4pvNJRPo6U8bTakkMaREJlycx/Wu4/Y1tQ+K7zVu27px3o+2Lk2ztb/Ozp zgqUpTP2XztKGVhEONikBVTZBHb+fT1stJHH5bxmsyAmcPKBDKEgYtTACbycj7DP527VsIyk9XS 03fzz7u7fEfWj2MbLsg93Phzuu9s68m3tf0Y/jtvNfKVfy57aprVB27vy3ZWNnJqNsYHao9/4hZ SOJ4dzggA3yZObA==
X-Developer-Key: i=CoelacanthusHex@gmail.com; a=openpgp; fpr=892EBC7DC392DFF9C9C03F1D15F4180E73787863
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_042013_532889_32E3EBD3 
X-CRM114-Status: UNSURE (   9.22  )
X-CRM114-Notice: Please train this message.
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

I leave tools/testing/selftests/bpf/config.{s390x,aarch64} untouched because
I don't whether bpf testing requires it.

[1]: https://bugzilla.redhat.com/show_bug.cgi?id=1229700
[2]: https://github.com/systemd/systemd/issues/13781#issuecomment-549164383


Celeste Liu (6):
  riscv: defconfig: drop RT_GROUP_SCHED=y
  loongarch: defconfig: drop RT_GROUP_SCHED=y
  mips: defconfig: drop RT_GROUP_SCHED=y from generic/db1xxx/eyeq5
  powerpc: defconfig: drop RT_GROUP_SCHED=y from ppc6xx_defconfig
  sh: defconfig: drop RT_GROUP_SCHED=y from sdk7786/urquell
  arm: defconfig: drop RT_GROUP_SCHED=y from bcm2855/tegra/omap2plus

 arch/arm/configs/bcm2835_defconfig         | 1 -
 arch/arm/configs/omap2plus_defconfig       | 1 -
 arch/arm/configs/tegra_defconfig           | 1 -
 arch/loongarch/configs/loongson3_defconfig | 1 -
 arch/mips/configs/db1xxx_defconfig         | 1 -
 arch/mips/configs/eyeq5_defconfig          | 1 -
 arch/mips/configs/generic_defconfig        | 1 -
 arch/powerpc/configs/ppc6xx_defconfig      | 1 -
 arch/riscv/configs/defconfig               | 1 -
 arch/sh/configs/sdk7786_defconfig          | 1 -
 arch/sh/configs/urquell_defconfig          | 1 -
 11 files changed, 11 deletions(-)

-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
