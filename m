Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 534DBCA1000
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Sep 2025 13:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uB+wXyxImnrr2TplnrP9KPVhvuQHhXUL+wZ1JrSPaJM=; b=py9cnWUR0OcgrA
	V7msn7Ax8l9/aJMotGsOZAYPJ1ypGGe+szqvo8jFsgBRxe0SQQaCsiGvyZ5qkgVA4Y55LfMR2g+Mv
	hvsecx4AyK21YAOSmDiT/GiaUp+0V3ECZlBn4OBR6IEhgU4ifJ+ZJ8ZHV8I+4ZFuSPHRqHoAD4kSN
	MTnlc6icDMkrlYLacNi/WCLM/QPI0SWS/4eT077kvG7v4ZwkOt8Ppewf6rE9RvbGFv37yTR9Ocp6G
	W4t/8EwDmidQ0DYnHTVbIUR33KCArAIgaxQpyMRooCe3jfo4rVvRqy1nXxUzEfdUIoCO/lY9bcbwQ
	Y73eTihryFES0kMrroQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut4uT-0000000CkB6-3MIr;
	Mon, 01 Sep 2025 13:49:25 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut2kA-0000000C3qM-3UPm
	for linux-riscv@lists.infradead.org;
	Mon, 01 Sep 2025 11:30:40 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-7724cacc32bso922929b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 01 Sep 2025 04:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1756726234; x=1757331034; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OVH3gE/tU2NrwTFLWPs2VeMd5NnIXGOgVMzKZ0VvHYk=;
        b=fgG87WehEhqbcYA26nDbTSC6PhJfkaLy3oOD6oJc5GgKZGGZ/sn+tiZaRawcmz6SyY
         E9LZBbxvgNue8ioslEeA0d+tE7UZEulvEZEVcm1p3l+yHu+0lIQvEK+Ra0toqjEAx+Yz
         3sCbT7KL7/oBgDAHJYRL3GfPRND3LEpWaUCtggG8qlz8AVwQyiC2ilndnLRA/lUXmj27
         4M8wU1+v7Fg7maz6Cb3gr+dNNu1OfrDLr0OwYfcq8FilT8/ckXTIbrw1vz2j/XuIcB9H
         E7cSwach4Yv7EY7yFlmxo9A0Y1DMQZ0nKzxew4mzN6/wE1tHxstIqp49B7hZBjeUSXL0
         IeSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756726234; x=1757331034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OVH3gE/tU2NrwTFLWPs2VeMd5NnIXGOgVMzKZ0VvHYk=;
        b=BdOP09vVEhLuIiOyAsP9Vk7j3udHWB6UEt59clMYO3m0fvgVL3xWH6bVroz70UK/Em
         g1BHUSjwEsagI6Yd0cPwN18NZpQa1hJVCCMJXEyYrsPv7pdOFpuupSLhKGlS6ojxotPp
         bCAe21YGEM7n+Q/GbcVLjyJyi621zy5SbBWkYKRN2wARw2QLSBbMHVAxQYvCoAN1WH/g
         KjE5ah9JOd6OuJCoNdWn2RgjyNHGcRPcX0wS7mTlgF8OwNMFUrmYXaxXRKMLKHPklACQ
         DaQPWBtTGPymSyLxt+PiPTDwqCNR1Im4lIoGvfvYuEAdIcB0soulQYK/i/mdk+W3/Lgv
         M36g==
X-Forwarded-Encrypted: i=1; AJvYcCU2hdH2U/oCqt8idGLcQ/PaFzTKsAcu926dUbiIC0AnrV88glivHBILql2ufPDHoeojsgjJQsMELk20ig==@lists.infradead.org
X-Gm-Message-State: AOJu0YyKDcpqUtLsBpugUuS7T/QmIT7K58weTb9U84teCk9uMc3v3Som
	Jtixfg8mOZCUK4nvcyfabhsWj82VtgQDL77+SGMlePwdM8lkx8sxCVV+Bb3hOEU5lIk=
X-Gm-Gg: ASbGncsfZcigwQufZjTawwLLFck28oY6Cxzm7cHNA/W1Y0ATubH5gRZGtNkwMtzrMgL
	Mu814CtCBeNhClhaud+Suww3mhsuF9GGJyxlP+BioIBF2hNuOhJ/gdSc/b2pz43PrVhcR3WMWNr
	pe8tLajqrp56tNyKR8uCkIC1RcxcfJtu4FxroYsmjSv6eegTP8CMAVGAHzBlA1W5fpg0eL4rTHM
	s82U+i1PTbYYRjTsHreepJgdfKv4Pj38BKr3hmj4COLFEdiIIxcyVLVipix0Ipi97EngO4nJvwH
	SEjuMc+WRQyXynwt2MspGLHYDB80ZO+aJalI7RWV+7Wm5RatE4EThoMB700f2muau2X9ZawfMs9
	0xDTNox0gAeSPlgljY2rjjfhWsAqx07BT0PokgukPocYxizux21CMZPZVVJcT7fYd7IKOBYA95G
	8AFhp1R7icvc5Ns0qRiWAViXwtAQdAfghXZowUygecPG8=
X-Google-Smtp-Source: AGHT+IELNeEmeLv/bVJbqXS2DLw/rssPuwVvgWByQkWQ+Dl4Z0Oyw27w9LOsidVAsxPp2930j5ZwRg==
X-Received: by 2002:a05:6a00:1748:b0:76e:7aee:35f1 with SMTP id d2e1a72fcca58-7723e3fcb56mr9285395b3a.29.1756726233690;
        Mon, 01 Sep 2025 04:30:33 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7725ad1e9afsm2911441b3a.11.2025.09.01.04.30.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 01 Sep 2025 04:30:33 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	ajones@ventanamicro.com,
	brs@rivosinc.com
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	apw@canonical.com,
	joe@perches.com,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH 0/4] riscv: Add Zalasr ISA exntesion support
Date: Mon,  1 Sep 2025 19:30:18 +0800
Message-Id: <20250901113022.3812-1-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_043038_980262_ECD44B79 
X-CRM114-Status: UNSURE (   8.81  )
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

This patch adds support for the Zalasr ISA extension, which supplies the
real load acquire/store release instructions.

The specification can be found here:
https://github.com/riscv/riscv-zalasr/blob/main/chapter2.adoc

This patch seires has been tested with ltp on Qemu with Brensan's zalasr
support patch[1].

Some false positive spacing error happens during patch checking. Thus I
CCed maintainers of checkpatch.pl as well.

[1] https://lore.kernel.org/all/CAGPSXwJEdtqW=nx71oufZp64nK6tK=0rytVEcz4F-gfvCOXk2w@mail.gmail.com/

Xu Lu (4):
  riscv: add ISA extension parsing for Zalasr
  dt-bindings: riscv: Add Zalasr ISA extension description
  riscv: Instroduce Zalasr instructions
  riscv: Use Zalasr for smp_load_acquire/smp_store_release

 .../devicetree/bindings/riscv/extensions.yaml |  5 ++
 arch/riscv/include/asm/barrier.h              | 79 ++++++++++++++++---
 arch/riscv/include/asm/hwcap.h                |  1 +
 arch/riscv/include/asm/insn-def.h             | 79 +++++++++++++++++++
 arch/riscv/kernel/cpufeature.c                |  1 +
 5 files changed, 154 insertions(+), 11 deletions(-)

-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
