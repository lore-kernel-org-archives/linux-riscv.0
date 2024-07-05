Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DDB5C30658
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jul 2024 09:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+kgeJt4UhGBiMa3ThZV8JGln/6XybcYeR6XDjF34xRg=; b=mtvyYMFH1bckeI
	lbyodGycNrsesc3oGiJ1PEQhdxU/7OoxnHJUlqv6PAJsZMorKd0BgZURiHRkn6KyG2ViBY5BcuCW0
	LUbDngLhmy8F8AbnxJnfUg8a37o2PG3yCdJRLjuJUwO/H5Pl+P3tEzlobFgsHwwtYx7DrqlMRD7ID
	KwbAEBUKR940BBfO4iYoUCDWeRcbINPvBdAIOydHO4ckObPn/2m3SIzjah7XYYrP/DHI3yVBVQdMV
	uivRkt3gGLj8U6UaT+U3Pm/OW3xOlk0qM+hQKipQJakxt+WEjuthlMFdhICfQHTbe8jwgPTtBCjR4
	Y07NB5tvfpFDaEfET39A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPfLg-0000000FSty-2xxs;
	Fri, 05 Jul 2024 09:35:24 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPfLd-0000000FSsG-0w1U
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jul 2024 09:35:23 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-6bce380eb96so838110a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 05 Jul 2024 02:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720172120; x=1720776920; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nE8UIWRoJ/aeBHjinkzqbMC5u9B5QJJxla+VRssQHgs=;
        b=VnYjqWMhEhWNV3m7KIEb73KUXlxCe0KkYUF9PU3JBzup2BUh5bEcU87rIjwOw9BsCk
         nARFmfoENjqsh2OKf7yeA5in2kFJlzP9PNJgtyXZW5qYjOcnPAvXbkF7KYTPcSwo1Tu9
         qhzu3U3s9kcIpp85A6tAOakIOE3kpVse3rT15qImhDM6o6mchlmPAFGi2ufJWHpMIqzN
         1RontRp8qhUG5n5zFH3lTGJL6VkUeLCGg1vc1h9NKrMe09y1+Q8lItaWW5qXtNxm8gbz
         B7WryiKr0O133E8gOAHtWkaLzMAa4l+RG3IGc/VVsZaXzwqxLd9BK0qvH0kdkMhs++1M
         L7zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720172120; x=1720776920;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nE8UIWRoJ/aeBHjinkzqbMC5u9B5QJJxla+VRssQHgs=;
        b=rqRrDsS8FAyS3wS1bve94e1GCIC9+NENU6rk0JK80XQWHPsGJaTGnyBaqBJLyPolpx
         nSi4+y3lPdXQH5So6/7dh+TI8Fk/6To+C2jAW6UwGvSE/DyJ3BD816hhH9LZFSHxHuOY
         DJw+k2DX+Xa/lNSc/4FmN+Ltd5+TaODSUwdLyoIS43WPdMyxD0cQeAB1/gPbroimEBtT
         7QuVKp1Va9su6KssTOnwtbsvMfF7+gpUwIDdd33nQUoeu3dV+LrudkvAk3OFMJ0iRRF6
         DTHlDIA2MFnyTThuXb26yXZ5u4C+sdgwsV3tsjtR+i/+jGG1O+wf/kofJYqlgD5bK7OU
         pklw==
X-Forwarded-Encrypted: i=1; AJvYcCWFoo1Y5dC2/bhLLhrxX7RVs3XN86pOeBRWcPxJbrnqShKiRpfPfZ+2ZrxraKDSYSGjgEhWcU++6LTgRTgnnjC5URQ7pWgfrRpRU65NMd7l
X-Gm-Message-State: AOJu0YyGvjNBjBQO9yQ2/S57KaSn5fNygGaZ7ROTtdBzGGeKQdhmtuJM
	7xUZ3IHBDcnyvCTJmIF9sTmiwA2DN8iS66rWhUQekEZ8MPI9Pxr+
X-Google-Smtp-Source: AGHT+IFYV0r/a2b3+xBZzBhYajORt+43xY24FXI3ptcmw2M+JtT31VHqtIMh8rJdbxD6jVFNEcM0FQ==
X-Received: by 2002:a05:6a20:2583:b0:1be:e265:8201 with SMTP id adf61e73a8af0-1c0cc75c761mr4311404637.28.1720172120307;
        Fri, 05 Jul 2024 02:35:20 -0700 (PDT)
Received: from ga401ii.. ([2401:4900:1c28:7740:14cd:cbce:fd61:6413])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-1fb167dd71esm48552005ad.238.2024.07.05.02.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 02:35:19 -0700 (PDT)
From: Kanak Shilledar <kanakshilledar@gmail.com>
To: 
Cc: Kanak Shilledar <kanakshilledar@gmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/1] Add basic SPI support on TH1520
Date: Fri,  5 Jul 2024 15:04:58 +0530
Message-ID: <20240705093503.215787-1-kanakshilledar@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_023521_296372_18E58F77 
X-CRM114-Status: GOOD (  12.17  )
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

Implemented basic SPI support for TH1520 SoC. There are two SPIs reserved
on the LicheePi4A, one on the SPI Flash pads that are blanked out on the
back, and one on the pins. I implemented the one connected to the pad.

It is using a fixed clock of 396MHz. The address and clock frequency was
referenced from the TH1520 System Reference Manual [1].

I have tested this on the LicheePi4A.

[2] Driver Patch discussion
[3] Devicetree binding discussion

Changes made in v3:
- Dropped the driver patch as the generic fallback compatible was
  working properly. [2]
- Removed the devicetree binding patch as it got accepted and is already
  in the linux-next branch. [3]
- Arranged the devicetree aliases alphabetically in the DTS files.

Changes made in v2:
- Changed from single patch file to a patchset by splitting the single
  commit into dt-bindings, driver and the devicetree.

[1] https://openbeagle.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs/TH1520%20System%20User%20Manual.pdf
[2] https://lore.kernel.org/all/20240701121355.262259-4-kanakshilledar@gmail.com/
[3] https://lore.kernel.org/all/20240701121355.262259-3-kanakshilledar@gmail.com/


Kanak Shilledar (1):
  riscv: dts: thead: add basic spi node

 .../boot/dts/thead/th1520-beaglev-ahead.dts      |  9 +++++++++
 .../boot/dts/thead/th1520-lichee-module-4a.dtsi  |  4 ++++
 .../riscv/boot/dts/thead/th1520-lichee-pi-4a.dts |  5 +++++
 arch/riscv/boot/dts/thead/th1520.dtsi            | 16 ++++++++++++++++
 4 files changed, 34 insertions(+)


base-commit: 22a40d14b572deb80c0648557f4bd502d7e83826
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
