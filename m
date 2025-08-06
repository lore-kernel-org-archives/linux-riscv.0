Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC872C87FD1
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Aug 2025 08:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MKVhRzQyQQJNzujAaAqgVMfn9aB0Mg+7MShu86t8ULM=; b=HgUfDxP9IvvRcR
	sD5paSUAOo8hCCIvVC7tMNQv8ulalrnAp9kJXvkJHuErl60blbpy1i7ayzreKYDuDExXq05+UDqVz
	YSqI56YseGlXZAdIniDZa8DKaImYebrtck7nyNhZs6Pj7tO6wSmJfzz9XV6t0SaFPQFAEMCXuZDLX
	MJXgADmu7PAv5dkSqO1U/gyCS4g6BMCKTaw1xEZDvxx1KXNzJKGpEhAKWD3xD6o9BRDxnXe58U+x4
	4BONJNGi/MZFyETOebHlOVk/l5MdNjogvrfr06MVez1eG24Emauu+hNJ2rnuu+bYK1bjRUmbJpdTg
	nca1aLXmsd+fQ9zI/xTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujZhd-0000000Ef0R-3zj6;
	Wed, 06 Aug 2025 08:40:53 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujZUp-0000000EdYs-3e8p
	for linux-riscv@lists.infradead.org;
	Wed, 06 Aug 2025 08:27:41 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2403ceef461so43601465ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 06 Aug 2025 01:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1754468859; x=1755073659; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DKQHi5RlpHViyps9vsh2JrxuqJ5/jkdoKvHFIQ8Mv80=;
        b=nWTU782e5AXHKKqSjY8vjLN9+GtKOjj9EidnU/Qp2dYmZEoTKDOy6Wt3XkcBye/BPF
         xM+5XF9NusyNStRaga4sqHRjYZuVqdbyeAwly7coV1t35/04veeLHgZWhqozQj7dVDRr
         dJfHiCOzMbQ/5qQGMnz0YxqCrF8XM3IVTk8a9jQ1feucPyP4ZMFFt7uuatu+YhcEMP9Q
         ytGgzMTwI33PRCEJFW9ZOT8bu9xyYdNkYMXQQWjM4jwWetdcr9FyMO8uJTfhyXSwpGUp
         Hv+UFJiwbiuh5gl8ldBNFHQAizAVAOp+RuLcSRvfn6YhjBVYjDzmtCiVdn2HRoKyls2M
         +5JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754468859; x=1755073659;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DKQHi5RlpHViyps9vsh2JrxuqJ5/jkdoKvHFIQ8Mv80=;
        b=IHnzcPDcxtuiD9tfO75etGfUjus9GKh29zSRQ7RLbuSlcnDtiYbHxfoK8pJgrblIhS
         RPRzI4pkpas58MplHizMIpwe4+0V99sshByQvsJ/2uLcXWy7GNJ7mlWm4gZASgShrv7I
         LfOo+DyG3irjXnQJoJHGdBufCMYbH4leY/SPDpGwNloPMxUzUmOWnVfa9jw6nTATZSDW
         WfByL1QjUeDU4vlW4+830tw+c5zfwiBBm0xFBOsULAN8GMhx2iCF4eszuF1pzXR1UWAl
         mDaa0bRgpAkv0HkADyWaKiZNTzyjymIR3fd58iV6jEHzueUmaf2XyBtSv4wEN/Nfgcjs
         wNJA==
X-Forwarded-Encrypted: i=1; AJvYcCVqj2pmwep3686/rbjsdKxOtZv0tNs5BvRiXTv9IdsWJXJ/ivOelSoGT/SD2i8T1Cy4sUO5JM3xz+ovXw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzEoBWJcW1djW/WxKlCHiK0Qwb5yGrUKABAsBA36JNbJKKfY6vQ
	ZCqTuM1XpLlgGaGnJAk4NiZYQkGVyb1nKqNl55AFjl1Iub4FEAIAjNSUsClHrQgMAtQ=
X-Gm-Gg: ASbGncv/yeS6sNhzB1Of1dnEIpo5DdKOEi5T7U2SZ2A+aLeInFsX/5+y0MNC/NkD+DL
	zfjtwWiFhUYa+y6xMBVMMJPFOG5ZW8aLT5U6az4aUSffq7acnrT1DmthXi39PA9TG/mhkNHTFVc
	+9DpC6b6hN+fSlUpEhFay81HAc1MpfAiqsOf0N++KXd1p5Xa9phx++0luCJnnbbkhZUnIT8Cqbu
	nvp+F3Ysmx9AH3qf7rDPQuyC203HPridp5PqotpO/E80DwE0UdoL7Xa5UgpI92NsNuA7+5WSHnC
	JSubM01jB1Npst0A/NXGPsZGpTz+xLEJqrCmaj0St3+VPicCgqPP/VxnrsVS1Fl30ElA1mHHW95
	BACKNZljDb9ybpru3WxlfPb9hWdGLkpE0kPFIgQnP7zrP
X-Google-Smtp-Source: AGHT+IGAVs0aZTzRh0hSXLELVvALcVXFdrlb1igNFgzkgK0hMe5vCmU/b8oyGf5YjPmg+54Jm5SnTg==
X-Received: by 2002:a17:902:d48e:b0:240:3909:5359 with SMTP id d9443c01a7336-242a0b8c001mr23466445ad.40.1754468858859;
        Wed, 06 Aug 2025 01:27:38 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e897690csm151958645ad.99.2025.08.06.01.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 01:27:38 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: anup@brainfault.org,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Cc: Nick Hu <nick.hu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v2 0/2] riscv-imsic/aplic: Save and restore the registers
Date: Wed,  6 Aug 2025 16:27:24 +0800
Message-Id: <20250806082726.8835-1-nick.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_012739_935169_353B189A 
X-CRM114-Status: UNSURE (   7.12  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Since the APLIC and IMSIC may be powered down when the CPUs enter a deep
sleep state, it is necessary to implement save and restore functions to
ensure their states are correctly preserved and restored.

Changes in V2:
- Address the compile error from kernel test robot when
  CONFIG_RISCV_M_MODE is enabled.
- Apply the suggestion from Anup [1]

Link:
- [1] https://lore.kernel.org/linux-riscv/20250709025516.28051-1-nick.hu@sifive.com/

Nick Hu (2):
  irqchip/riscv-imsic: Restore the IMSIC registers
  irqchip/riscv-aplic: Save and restore APLIC registers

 drivers/irqchip/irq-riscv-aplic-direct.c |  11 ++
 drivers/irqchip/irq-riscv-aplic-main.c   | 158 ++++++++++++++++++++++-
 drivers/irqchip/irq-riscv-aplic-main.h   |  11 ++
 drivers/irqchip/irq-riscv-imsic-early.c  |  41 ++++--
 4 files changed, 212 insertions(+), 9 deletions(-)

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
