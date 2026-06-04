Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6AD5CD6E6D
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jun 2026 14:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hRCRaEG5Ht46817hSHZ4hFKod2gh9Cah/TVeuSFj7HI=; b=Yg197Gf0dEfIJd
	ywHlKeux03eTW7bLitV3m4KG2sS7HpqSy04HfAROG+HKyA2MvR7ScnEXStFZcNgqgtg6HIiSeYOD4
	UrNQeIGIcIVd5MZsQtR8vM/h2dRrFKZZZbXRGAvmd6wORo2PazX1ul+0g/s9dPL0b3ZTjdhTbuzeB
	AdhsrC1C2Z/jgmhfIkphaWxySkwvr9tlklq1dFigGTnRMSpfb8y2zrGMg0UWelU3CQ46kl2MikkX5
	3v/RBCwL+K85KaD5tC0A884nMXh4ZJdq5nHa7OrUWqoz62LBhCQvmIlFVoEnoAJf1YvjQfoQARhwh
	ALr4Qp6C49mYHGhANq0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV9Fd-0000000GuzD-2xKX;
	Thu, 04 Jun 2026 14:40:53 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV9Fb-0000000GuyW-49q0
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jun 2026 14:40:53 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-c85825bbc4fso496140a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jun 2026 07:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780584051; x=1781188851; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=MYjvVyEwufg+Sp1o9wIFatQQ1kTSx89J6iGBCB8C5c8=;
        b=JQrVJXBcRrD6zBJji+yulPZyEjXK3ZvYLGCSsnW6Yh36yWMJFwfYakhdyeVFh5oMf8
         0mtUTdm4mDPUHrD8iCZpWf2mYO20SGx0pueObHhUHj17oofpcpeIGu/yo99NkDSt2suK
         ct3XwSCnR4Q9ZF1MeFlbd6GM7RRUW7RuFBAio8WjlV6/fdnnHXKQMsVQLrbJZ73rF8pE
         Y4XW5qceVQad20RbBIdcw9Sr2Qtu5uBmnUXgsFI8W6CL0Cid6GiWHTNna8DOoovCNHCy
         2+iwK1iEDkgt6zvzaAjeAC6chVImEMtMXcvIhe3+FNdhPKv0NFdd3hc2vifgqpaLZQVS
         gwvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780584051; x=1781188851;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MYjvVyEwufg+Sp1o9wIFatQQ1kTSx89J6iGBCB8C5c8=;
        b=R6lKUGYAZAxqawR9gsijZpQAxhdH5F2epwwUQCZZVyeZCX4Fdkw5lPD/ZXNDDQ8tgI
         8AU5cHnuq4Gfs9lMKfGbDrlADwpmLxKuYVGA6SjQzthGwg8KeHh7MyKwVXEsSjb4z+mn
         OopTzLQpZmE/RJCXMfaiycszZ4Xofa3TNoTftI/xfp/vseLu/oqpozlSlxTe/VdNzkWV
         oXUVKaz5NJAQSTUKxefoKgi3RnNkK6oPHOJ59NrMrnoEox1qvNo+ymyvX10Z6mZ5fQHh
         S2OGOgrYbvJJS1pUgtkR8KtZDOKmQegJqYVucKVsAk2wO0thRz8Dxk/5i7tg6RRCN7Tm
         S3Jw==
X-Forwarded-Encrypted: i=1; AFNElJ9q7U1WS3u/h28EkWSY7ojU3FhYP8hcvBirc90HyGjJA5u2tt4YAnE0izTWUOnCinVhjecoma3gX2cRvg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyyIdlkCjEArNFgXzGppYeYleKbTzQH+i0wC82vDIYpzbuuGUDu
	qVTC2xGA469B12I4HC0p6lol/ZL4i1dWhhl9qvnxA7nh9Rgh3ycPxcFg
X-Gm-Gg: Acq92OGLuIJgviA4XpZntvCyKNbRkOaNqQc3rJARz3BctPJbdEv+zvzoP1VMuIj660a
	i+Z9ccd8xjzlqRAPdPqtSMaIOmejSM6XFqiaiWpJs6fdXHEM3q+PgnuSSxK0p56aCHI+1Oxzgyo
	sh3dWbeLUP94JU7ZwgSxgBB0dSSY30k82zQlB0smqsQH11/RJ6hE742WcdjBkprKAMvMu4p6SwV
	awh0kpyi+jcUseEgApF8hY6GJZXLGx55tdCTCgcoJQHqHbWIZn/w3WzQM+UqScqo2545alZ5Fw5
	i1zQRK4z+xeHc5lx0kLV1b8sDSrieoxjiA2idEuCe7le8t+457OqLTO15UscFb7iEPWUwPIi0GJ
	GTRj7iYZPviLFYsMfwlbwtUA2uel8hS38J0nfCUeXYR0A8fIRPK6fKuBzxiCtBd9OQPQRyjhKmZ
	w9HKulibte0GrglvMZjzPuODZCAQy1lT6l8kEH+ERsyiNxfA9tcpikcQHfuiLPqmd18IwBw+xTc
	riQNzesREbB3NuXGWS7eHszuVMOlOyrME2lxqDKfYRgO1m/HEA1TD9wzZs4q1IM
X-Received: by 2002:a05:6a00:4fc1:b0:82c:9e00:f958 with SMTP id d2e1a72fcca58-84284a8c87fmr7952955b3a.0.1780584050963;
        Thu, 04 Jun 2026 07:40:50 -0700 (PDT)
Received: from donnager-debian.. ([45.124.203.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282372868sm7279753b3a.17.2026.06.04.07.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 07:40:50 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Paul Walmsley <pjw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Anup Patel <anup@brainfault.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/7] riscv: dts: tenstorrent: Add Atlantis platform 
Date: Fri,  5 Jun 2026 00:09:46 +0930
Message-ID: <20260604143957.668047-1-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_074052_033605_92551A63 
X-CRM114-Status: GOOD (  11.46  )
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

Add initial support for the Tenstorrent Atlantis platform, based on the
Atlantis SoC featuring 8x RVA23-compliant Tenstorrent Ascalon-XG cores.

The series adds a bare bones device tree with the CPU, interrupt
controllers and a UART. This will be replaced in time with a full
featured machine once details are available.

Patches 1, 2, 3, 5, and 6 add compatibles or extensions to existing
bindings.

Patch 4 adds a new binding document for the aclint timer device.

The series has been boot tested on QEMU[1] and internal development
platforms.

[1] https://lore.kernel.org/qemu-riscv/20260603065859.592063-1-joel@jms.id.au/

Thanks to Anup and Connor for the reviews on v1.

v1:
https://lore.kernel.org/linux-riscv/20260603074222.593243-1-joel@jms.id.au/

Changes since v1:
- Rework mtimer bindings, fix reg property, update compatible and use
  priv spec as reference
- Drop Drew's sob from bindings patches I wrote
- Add Drew's co-developed-by to dts patch
- Correct aplic num-sources

Drew Fustini (1):
  dt-bindings: riscv: add Smrnmi extension description

Joel Stanley (6):
  dt-bindings: aplic: Add Tenstorrent Atlantis compatible
  dt-bindings: imsics: Add Tenstorrent Atlantis compatible
  dt-bindings: riscv: cpus: Add Tenstorrent Ascalon
  dt-bindings: timer: Add RISC-V ACLINT mtimer bindings
  dt-bindings: riscv: Add Tenstorrent Atlantis platform
  riscv: dts: tenstorrent: Add Atlantis platform

 MAINTAINERS                                   |   1 +
 .../interrupt-controller/riscv,aplic.yaml     |   1 +
 .../interrupt-controller/riscv,imsics.yaml    |   1 +
 .../devicetree/bindings/riscv/cpus.yaml       |   5 +
 .../devicetree/bindings/riscv/extensions.yaml |   6 +
 .../bindings/riscv/tenstorrent.yaml           |   4 +
 .../bindings/timer/riscv,aclint-mtimer.yaml   |  56 +++
 arch/riscv/boot/dts/tenstorrent/Makefile      |   1 +
 .../boot/dts/tenstorrent/atlantis-evb.dts     |  33 ++
 .../boot/dts/tenstorrent/atlantis-soc.dtsi    | 471 ++++++++++++++++++
 10 files changed, 579 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
 create mode 100644 arch/riscv/boot/dts/tenstorrent/atlantis-evb.dts
 create mode 100644 arch/riscv/boot/dts/tenstorrent/atlantis-soc.dtsi

-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
