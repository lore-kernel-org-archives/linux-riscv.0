Return-Path: <SRS0=kkwt=O2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 802B6C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Oct 2021 16:44:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25EA561130
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Oct 2021 16:44:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 25EA561130
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SFAohPFLq7ACxXPTBPjaH2wLQL/NUjc7wloM+qt79C4=; b=DEBF1ex1om6opq
	i9+EYDGyVPqHrlmmJdG4+fYS5VZreE4dLa6DtY0CDhJedlMcRTLxRroAkcqot6bxET9pIOpR7xxYA
	1Fu8oes7DdcdBKh2jxeK5FIQ1d8mZZod6OiLVSM+KcT9JjW4VLzGumK75AyO/X6YS6hcbDBcn8F8u
	PjvMqQzwim09rsxQ2sSZjg4SAn+IgO1cDAJTq6mtqKq8z9aSKLLA9RaW3hjThOx2ddik6u1TjMDtP
	x9auySul6cXJSSehr6jqjJCS7g1W1vhM9R1o2ObkjYCP1VrMDAaQDjEGQ+22tDXXx6lgiBwKhfzen
	iQ4TJ7IeTBkCerM8iabA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYA1H-00F29J-1j; Wed, 06 Oct 2021 16:43:51 +0000
Received: from mail-oi1-f175.google.com ([209.85.167.175])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYA12-00F22K-RB; Wed, 06 Oct 2021 16:43:38 +0000
Received: by mail-oi1-f175.google.com with SMTP id w206so4861979oiw.4;
 Wed, 06 Oct 2021 09:43:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jBzMvIMgnR7M/3yhI7B+vslrQk5E3C0Pdi0d+USOXmM=;
 b=xJMk1bk/aCcVIpqjZaE2PiEvy7B0NLjCuoNeZ3SI/bsr1pQy00NlymlC3l/6/zLzlY
 neVnj3Ea5yYzyy+lpkWDCZHUO/AqDSsbby9in1wk18RncvNGubG+fpgHVZTGIia+o0cu
 JjtGeXxxS7egnOtrUmMva4kIKeu1qYkBZMYOi0h/a7ltNnLi6AopOCBwobHRDGsbtgw0
 taLbOX2FF2Lkri9dSdYo8rI0QQW31y9Dl8XQKNzX3nEqiqy+k+AGR7v0RWhgM8OGUce6
 fbMmPt/E0b4cm7kahr4q+OlHWSG/Pl7V0m+NKXvqakgfuGwm8Vge4yNWfT6zjQcXb1P6
 o6mA==
X-Gm-Message-State: AOAM530wbUpUwDH1+UsY5Dn1YGux1wCGyGj1eZNJfNg7U06z0yCSt4Ep
 LTQrQMPobqVizJ5vtwvhfA==
X-Google-Smtp-Source: ABdhPJx7CXhXT5M1W0CAhtBp2h8eMcQ5I0cRndKVwy8olo5SejcUQh3JemHdw8Jrz5VsbxC5vFcqCA==
X-Received: by 2002:a05:6808:2221:: with SMTP id
 bd33mr8117373oib.64.1633538615382; 
 Wed, 06 Oct 2021 09:43:35 -0700 (PDT)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.googlemail.com with ESMTPSA id s29sm4236628otg.60.2021.10.06.09.43.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 09:43:34 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Russell King <linux@armlinux.org.uk>, James Morse <james.morse@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 x86@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, openrisc@lists.librecores.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-sh@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 00/12] DT: CPU h/w id parsing clean-ups and cacheinfo id
 support
Date: Wed,  6 Oct 2021 11:43:20 -0500
Message-Id: <20211006164332.1981454-1-robh@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211006_094336_904544_8D64FB76 
X-CRM114-Status: GOOD (  12.64  )
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

The first 10 patches add a new function, of_get_cpu_hwid(), which parses
CPU DT node 'reg' property, and then use it to replace all the open
coded versions of parsing CPU node 'reg' properties.

The last 2 patches add support for populating the cacheinfo 'id' on DT
platforms. The minimum associated CPU hwid is used for the id. The id is
optional, but necessary for resctrl which is being adapted for Arm MPAM.

Tested on arm64. Compile tested on arm, x86 and powerpc.

Rob

Rob Herring (12):
  of: Add of_get_cpu_hwid() to read hardware ID from CPU nodes
  ARM: Use of_get_cpu_hwid()
  ARM: broadcom: Use of_get_cpu_hwid()
  arm64: Use of_get_cpu_hwid()
  csky: Use of_get_cpu_hwid()
  openrisc: Use of_get_cpu_hwid()
  powerpc: Use of_get_cpu_hwid()
  riscv: Use of_get_cpu_hwid()
  sh: Use of_get_cpu_hwid()
  x86: dt: Use of_get_cpu_hwid()
  cacheinfo: Allow for >32-bit cache 'id'
  cacheinfo: Set cache 'id' based on DT data

 arch/arm/kernel/devtree.c       | 22 ++-------------------
 arch/arm/mach-bcm/bcm63xx_pmb.c |  6 +++---
 arch/arm64/kernel/smp.c         | 31 ++----------------------------
 arch/csky/kernel/smp.c          |  6 ++----
 arch/openrisc/kernel/smp.c      |  6 +-----
 arch/powerpc/kernel/smp.c       |  7 +------
 arch/riscv/kernel/cpu.c         |  3 ++-
 arch/sh/boards/of-generic.c     |  5 ++---
 arch/x86/kernel/devicetree.c    |  5 ++---
 drivers/base/cacheinfo.c        | 34 ++++++++++++++++++++++++++++++++-
 drivers/of/base.c               | 22 +++++++++++++++++++++
 include/linux/cacheinfo.h       |  2 +-
 include/linux/of.h              |  1 +
 13 files changed, 74 insertions(+), 76 deletions(-)

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
