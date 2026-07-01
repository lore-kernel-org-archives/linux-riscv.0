Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6D4AC43327
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 09:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uPV4WfCRA1gdDW5R6dAyklVNsctKOtifyEGbnMFpmFw=; b=QQyJvcYIRnrjE9
	4YF0DejTD1K5or0Eopqb1YYfek8qBlYg6opyA4iYtQtvNoJAIjiuWXv1CqE6GR4753g5KY7+yzrTu
	o59nmtzk1Jrh+KKuY6afUVdj+u+/12Lv9CIjC9q2Tm6raRZvaRfHmvLrqk3t4XgC+HPwUQ0wIUHz9
	+3zH1X63tPC/VUIMJxtorOcNxLlymB7LPnpO8Ra3IYo9jHq3/qR6qegTpuJks3EpqSlI8O+Pw5uGK
	MV9lYFhIBNjzxfK8A4RdRHrzrSxiZGGZivPq1IUczqvfgmsCIcqhd05nNI+uBR2UD+RfXAr7NJQ56
	MCnIN544JedfT2csFiZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1werY4-00000001EC5-08T0;
	Wed, 01 Jul 2026 09:48:04 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1werY1-00000001EAx-1pwI
	for linux-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 09:48:02 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-c9dad3afec2so167095a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 01 Jul 2026 02:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782899280; x=1783504080; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nRpp8Aarym9MAbA9S6grsKajHp/qT3ZkQCLbPzfeNPY=;
        b=bM/RXe/rqoYrdT3abvdklMOx0RR2rM8mOi+lEsIOAujXVjA6o6fR2P5EiitJ1CnP7O
         s0/KWUN3tEGwEdE4xQn7UyEMx23jf/0CCciWHzCtB/5PDkY02+yUZvjKEazYydmvZeyb
         uDkjii8hC2Alwm13XAjZHybKqWq6dxxvEvgCxyBwtXvIxVJMqNJgTpgxEWc6jJgOrPx4
         b5mTikz4EJZLNPPDUR5ts7/qv9VQSf1gVZqVfyYzUJOjre+q7PPJZ9/FVkslQg3aAegg
         YTEFj3YcWkymWeOd7hDKqbB55nmABOI2FCSuMXi+IuHsSrz894BmCnhSabMDJ/cAv8o1
         Jl9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782899280; x=1783504080;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nRpp8Aarym9MAbA9S6grsKajHp/qT3ZkQCLbPzfeNPY=;
        b=FkmwTQF0yr0Vpuohl92Oj0XiNhlRfLKuGvOYHBQq5bE9suNqGLWmP3fbW/6cV0ZCz2
         E4FFrdhJDM8s5d78rAMfKeQFBBr05/iG3ZOVcLtTBhBz2yQCX6o4CLxj1CLboz1ym38k
         v61hI6c1eyLjuBHZhZpZXcgvi7GkN5IQWL8PL0xt4yO63hCSVCly/tcDNX3DOIBMOfN+
         o8m1vSD4vXCZ5Fn/soJt6dXwEx7ZMjPqu30rwHqbfK2qf5CetKL7IAa0Ez/TPzxTdCLT
         mR2U4+n1che5QNjo0eVnZ6u3a9HEKiNBQZXKDZiIMi6BA5DfOj7RHUB38Nm2+TuJUzxg
         dYoQ==
X-Forwarded-Encrypted: i=1; AFNElJ//zEKvNWxKGtSNO+4cUh8MjuXhJj4rCXIl1jgAAmKkdzP/JwbUQFbS7boYKXdSxcerDsEjpSCPV1Qkxw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzhtkyfFgnUiT5fwMld3MURajCc7gImlXEGVHndqWNTTIDOzmLo
	4OKjrxGMAC8g334MUbmSRabTigyJsp1HeB9zNoejM1UkGG6eXdluC+m4
X-Gm-Gg: AfdE7cmw2f/NM3ORmoGuBUdZ7v8NDEWrfmgjy1gMt8lN0m1QuORkbAOjir7X3ad89ni
	2hparhuSjhXkTjowx9xZ4STydm4Rz0mmYh8V/72XyHvemWKlbc2E/tpPfntuVvrdiERIvgpsvPp
	pWZnI13XsQf7LSziK7QWmLywxrMU/a3mQ/pfRRLjk0G1Grp4R/zlAus3ZH1jej5htcrF+vHdGak
	ujvieX+pdjTmCZ5Q7ZTyM4/y7J3OB777ClfHZGRBlFzTE6cXS2EQUfPQfJ2p11OAr9yBpcTCH+h
	FTiYrfKM9mpX7GavT0bR6vZwZCokO7UClzZPfwALnDFnovBWDg2K+VNvpAB3BuPRS6pOQeiZ8VN
	LnpPPs5hEikQ0pez3OXyCJTpDhIq7kHuO7nVj04m8guEzLCsuLPSDHUfXgP3ahcZAlcQICqoW5l
	1lDrNODPxfU70=
X-Received: by 2002:a05:6a21:7d06:b0:3bf:6c08:2b32 with SMTP id adf61e73a8af0-3bff431786dmr33434637.58.1782899280562;
        Wed, 01 Jul 2026 02:48:00 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9bbc6d9ed9sm2903779a12.7.2026.07.01.02.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 02:48:00 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 0/3] RISC-V: KVM: Cleanup SBI extension status when disble
Date: Wed,  1 Jul 2026 17:47:27 +0800
Message-ID: <20260701094731.1022163-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_024801_505998_B4C9856B 
X-CRM114-Status: UNSURE (   7.35  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

KVM SBI FWFT extension has multiple internal state can be programmed
by the userspace. However, when the FWFT feature or the FWFT extension
is disabled, the internal state will be kept as it is, which may cause
some side effect for the vCPU, cleanup these state when a SBI extension
or FWFT feature is disabled.

Inochi Amaoto (3):
  RISC-V: KVM: Add SBI extension validate callback
  RISC-V: KVM: Add SBI FWFT validation support
  RISC-V: KVM: Reset the SBI extension when disable it

 arch/riscv/include/asm/kvm_vcpu_sbi.h |  4 ++++
 arch/riscv/kvm/vcpu_config.c          |  2 ++
 arch/riscv/kvm/vcpu_sbi.c             | 33 +++++++++++++++++++++++++++
 arch/riscv/kvm/vcpu_sbi_fwft.c        | 25 ++++++++++++++++++++
 4 files changed, 64 insertions(+)

--
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
