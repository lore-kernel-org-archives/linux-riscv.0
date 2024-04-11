Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38B8FCD1284
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 09:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BJrSpf1SX4wMRF9fzOzFSbOW4Iyt90g27KNbisx8cPk=; b=tpf4zI1n4yfo+e
	CRT7C9NKVpotGGHp4Wn1AIc4jnpFOb12cjFa3jcEvFgUfzz1dkCQk+IL56Pj1/Mlm4jdv5HoZbnjm
	TIYoOMFUOridFGxes7Gq+gtY6PslrKjVgyO4IVFeh8gGpwmuqua5EcVYcoerBfo5rlPUe3p8lTIjA
	uqFmhLgiEJcqfpCQp0KI83IGwcNE6yKpEN1e5IFn14dvlE91FvSAbvuE8uJUq8O6ZV+i89dRAyQmY
	epMSToT15/PCZMhLvlCG7JwBg4JaZturl12HNazrv0sFm/a87IsztfMK06TPNnR6GGpctoKXkcrt/
	z8so6H0f5w7RLr/aGXCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruqOU-0000000BEzb-0U3O;
	Thu, 11 Apr 2024 09:06:54 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruqOR-0000000BEyK-1eOz
	for linux-riscv@lists.infradead.org;
	Thu, 11 Apr 2024 09:06:52 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-5aa241232faso3819984eaf.0
        for <linux-riscv@lists.infradead.org>; Thu, 11 Apr 2024 02:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1712826408; x=1713431208; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CBhqQGQ9V37via17GNYW/9Ko6M+5Uqp4L2VsS7G79oA=;
        b=BcMydOYKPKnavVq5bFDHk1PNcRBtBs8Ta2cpwjDXfZiPgxxBR6JZiRr2wR8+niQvzj
         2Rf9wH1hy2E8BvWzqfB6RGL3XKt9ajs9nhQr1HPW006rAzSHLhinYMpx6z/P97sQFCgy
         5IuseqteocARhjaHqiJ81Fa2J0eFqodY3okDvL/jWm8jh+/773V42m9dJlHZofOnB3sb
         Sr5B4PwUM7mZW7Nt7UmDwNYWXiyAx3CPleaAuDIs8xuw0VrMWfUVVnzC92iMulKIBUqI
         h2z1D7fqLfFwlMGcmzmP9k7E5ZCkb0mVKkd8wrY1/1dd0ztJms/M/ARjjkISC57JWmlS
         1Urg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712826408; x=1713431208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CBhqQGQ9V37via17GNYW/9Ko6M+5Uqp4L2VsS7G79oA=;
        b=SVtnYle37snxstTBv0JW2gC2GcNDc0DYKxjrE8lTRlxqvphDDpBKeOQiGNjYF/4uob
         1DiX+6Jc3jy0U4SdSBrDQTXZyCL3iJMKhoOtdvXIGzGsK0LXjphjJLjt59v7PaTCYLGG
         JaO8rgApHQ8VhP84xX68PjwA9xTj8WaR2sXvnTer4Yp46rq7SyKoJkV1fY+hXLSMNLU4
         TIXrp3rA6lxuBpApp75rQY98MUmipbUtsNkg3lMikps9EJZlunup1YPBgE+VZrvzDMHM
         eo7mIUFcA6SEsW4cM9LtSKWFtmKCcQovQ/S/svn9uDaLyzjVwvhLXkRu2ZCXvC5gRaAR
         7hxw==
X-Forwarded-Encrypted: i=1; AJvYcCXNr5x12CqLxzrPQL7DZwhUHnMbciZ8yMrsoR2lJVXJUl7SaIpTuPZai5ZpD8IXH4QCcYhZjcxvgDVb89VEY5LTT8Zlb5GItJaIWIKv/hFE
X-Gm-Message-State: AOJu0YwsL68/FtXXRV6QBCy4R8s8odTP9s0K1SHIu7YZ8t9oH2iXkki8
	LT4iLog+Pu1Di0qjK7IuJODPOriOWsQh4WQooktuawJ2NCC7CBX/iEoqHZqWv/M=
X-Google-Smtp-Source: AGHT+IHdV+Ixn8TwQhwDHZf5ScDldFNUD5vTYYRbuxDbqU8SomJtrIceDwDNi2J3aMwBPVQwYLhmIA==
X-Received: by 2002:a05:6871:5c6:b0:22e:c48a:bfda with SMTP id v6-20020a05687105c600b0022ec48abfdamr5675910oan.28.1712826408430;
        Thu, 11 Apr 2024 02:06:48 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.76.82.118])
        by smtp.gmail.com with ESMTPSA id e21-20020aa78c55000000b006e729dd12d5sm816738pfd.48.2024.04.11.02.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 02:06:48 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Cc: Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 0/2] KVM RISC-V HW IMSIC guest files
Date: Thu, 11 Apr 2024 14:36:37 +0530
Message-Id: <20240411090639.237119-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_020651_460451_E5CCC28C 
X-CRM114-Status: UNSURE (   7.88  )
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

This series extends the HWACCEL and AUTO modes of AIA in-kernel irqchip
to use HW IMSIC guest files whenever underlying host supports it.

This series depends upon the "Linux RISC-V AIA support" series which
is already queued for Linux-6.10.
(Refer, https://lore.kernel.org/lkml/20240307140307.646078-1-apatel@ventanamicro.com/)

These patches can also be found in the riscv_kvm_aia_hwaccel_v1 branch
at: https://github.com/avpatel/linux.git

Anup Patel (2):
  RISC-V: KVM: Share APLIC and IMSIC defines with irqchip drivers
  RISC-V: KVM: Use IMSIC guest files when available

 arch/riscv/include/asm/kvm_aia_aplic.h | 58 --------------------------
 arch/riscv/include/asm/kvm_aia_imsic.h | 38 -----------------
 arch/riscv/kvm/aia.c                   | 35 +++++++++-------
 arch/riscv/kvm/aia_aplic.c             |  2 +-
 arch/riscv/kvm/aia_device.c            |  2 +-
 arch/riscv/kvm/aia_imsic.c             |  2 +-
 6 files changed, 24 insertions(+), 113 deletions(-)
 delete mode 100644 arch/riscv/include/asm/kvm_aia_aplic.h
 delete mode 100644 arch/riscv/include/asm/kvm_aia_imsic.h

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
