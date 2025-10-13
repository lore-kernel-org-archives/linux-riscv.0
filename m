Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 595EFCCD183
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 11:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ULEyQOGbtpM+ioQK4frI8pcr3WMRcT3/WDQZwMqdMBI=; b=13ywgVS42JMAvS
	F5HxhKiuNy7dJ3yi8Ys4IHR+G6IDXCN6js6FgvgbvqisNdrNldjnLbHbkEE76jm7BMQ+SKcSu4Ocx
	MEXkP+FsDfnD2FVfqe2zmim1uDGDDZKRzJ6Xpeayvnb5dFmnXB4gQBeX97k4NwsNv3C+MkkM5/5P6
	nh/0UtapTajTRbrp+QPweiiGyPweCmsdbO+hV4+KdSt+8jbunRhQnKBP4S0mY18JmteyFeBQTsXyp
	DoqdylJZmd6pnAIHaYol6FnFwAazxcBSdUrERSw9YFT1Al/miZZDWnbz8BwO4kclFK+nyo6DqW5A1
	BafEAZQVPdt8cu2KdOlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8GX7-0000000Czzx-0Odz;
	Mon, 13 Oct 2025 11:16:05 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8GX3-0000000CzxE-3X0d
	for linux-riscv@lists.infradead.org;
	Mon, 13 Oct 2025 11:16:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760354159;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=61Utvg9LwLcHKeJsFrKrzFO3e/IAfbPbmM/8491Uo7k=;
	b=L2BBZC6sZ6vHajdOQ/X3ZHWDCk+qQ6mt1gF+ANxt35fiCSZTr3ZoQvC0AR85eZlknxUbYq
	kj/smgVghTM4fdsYHQiPRJzqINccRwNnz/7cEdcbv9fZTZqpP+PYoabHyi/arpYlq/c+vW
	AWyrHzjWJrsa5Ix+3zCcs9djgB9y+og=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-3yFpVadMPHScXfmROnVewQ-1; Mon, 13 Oct 2025 07:15:56 -0400
X-MC-Unique: 3yFpVadMPHScXfmROnVewQ-1
X-Mimecast-MFC-AGG-ID: 3yFpVadMPHScXfmROnVewQ_1760354155
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-b3d525fb67eso539904166b.0
        for <linux-riscv@lists.infradead.org>; Mon, 13 Oct 2025 04:15:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760354155; x=1760958955;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=61Utvg9LwLcHKeJsFrKrzFO3e/IAfbPbmM/8491Uo7k=;
        b=FvawuZ2JNyamzEy/UvGk2M3vD+kwnJZyN+sxgUBjxNDd9VQLEQ2e/BpFtjfy8cHshW
         L7GYEFsLeH5i0YuJxQuKyAEbsg/K3h81EFzy70Xr8NLUmSct8WkRSK/MyYKAx6Uypfoi
         ezzXmn+3rIb9Zh3QxhpGLHoAIzTCohMdkxANHTV3EJyxvs2L9uPAVg0T8w+Gb4dWQIBs
         41/1b3NmjByxq1eqwWqowsp4PeNrzP9LKynNuN1rsXO6IfNveQm+25R+0LiBV8LzNcTZ
         Ih4KEVasTzKFMhmOQEam1L2rTL8MvSKBQrmqyz28GWQEa8X2adqZF4wf5Knwy/hYJK29
         VTqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyGBFdVwAJC/YktEJzw4+ddvgNwOgvizs0h4F5U9KHyQ+kvIEFH8fUBtlERdjF+GenqTTdkmbmpqrdhw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwBsgu3CEWs/dGGbYXoc8vSEz1ZupGG2K4s7WFlKxrPKq3+Undt
	Yea25TZiGVbTI/jxoo/A6Hnu3aRfvpDb7+Sm1KBE4RCgdNLVQNqIqCLXlKqFERILg5kslhI7NGx
	hftEXoxv4/Qu7uq8hkhbpOe7ohADeraUavd+yNTkqQ6NNfXJl1PjuV/fp5jckPt8jNc+FeQ==
X-Gm-Gg: ASbGncusVO+irCgqH+4DjIfM/t9eqF7FGfPlmxfxKuxpLm1Zd8GxEX58duOPQgVnMZO
	uhtYOnM4pGoI/wgTJ1SVF5MFwL3hlzZT5Ge2rkkQW5XybwFYr3iLXQiwgxKOWoQlyfKJ8pozQmc
	j1z0y1asUlGiBnXRRaLwy9E7F5AQ2FZJl7TuSQ9W+Gcx5O7z/5qWS3YWwvdlfj2F2AIBPAd7eDk
	TegzsY8DjvjimYl7ClsGU9HfCdsnceQkonqF2k+tFKNgO++J0WXmzaFbCCajUIMyGtw7juz6Bj+
	ZzOYkMb9asV7JQRHJcSTabxU68C+/8gNaeI3w3Ar1kvM
X-Received: by 2002:a17:907:25c6:b0:b3b:4e6:46e6 with SMTP id a640c23a62f3a-b50aa393beamr2047104766b.1.1760354155228;
        Mon, 13 Oct 2025 04:15:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUqBMHoqhVV+uP7cey3LAt770FSA4Et8Avsavd59CQxq+OTW7LvyN55HaT1Bq0FyA9hJprYw==
X-Received: by 2002:a17:907:25c6:b0:b3b:4e6:46e6 with SMTP id a640c23a62f3a-b50aa393beamr2047102566b.1.1760354154847;
        Mon, 13 Oct 2025 04:15:54 -0700 (PDT)
Received: from holism.Home ([2a06:5900:814a:ab00:c1c7:2e09:633d:e94e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d5cad8adsm917336966b.7.2025.10.13.04.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 04:15:54 -0700 (PDT)
From: Lucas Zampieri <lzampier@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Lucas Zampieri <lzampier@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Vivian Wang <dramforever@live.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 0/3] Add UltraRISC DP1000 PLIC support
Date: Mon, 13 Oct 2025 12:15:35 +0100
Message-ID: <20251013111539.2206477-1-lzampier@redhat.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Uj9Qj92LPAh7nmIkWfgNs-7JiZEYB1Ak8I_qEQbqMZg_1760354155
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_041602_078249_301D7A1A 
X-CRM114-Status: GOOD (  10.67  )
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

This series adds support for the PLIC implementation in the UltraRISC
DP1000 SoC. The DP1000 PLIC claim register has a hardware bug where
reading it while multiple interrupts are pending can return the wrong
interrupt ID. The workaround temporarily disables all interrupts except
the first pending one before reading the claim register, then restores
the previous state.

The driver matches on "ultrarisc,cp100-plic" (CPU core compatible), allowing
the quirk to apply to all SoCs using UR-CP100 cores (currently DP1000,
potentially future SoCs).

Charles Mirabile (2):
  dt-bindings: interrupt-controller: add UltraRISC DP1000 PLIC
  irqchip/plic: add support for UltraRISC DP1000 PLIC

Lucas Zampieri (1):
  dt-bindings: vendor-prefixes: add UltraRISC

Changes in v2:
- 0002: Changed compatible string pattern to SoC+core: ultrarisc,dp1000-plic
  with ultrarisc,cp100-plic fallback (suggested by Krzysztof and Vivian)
- 0003: Driver now matches on ultrarisc,cp100-plic (core) instead of dp1000 (SoC)
- All patches: Added submitter Signed-off-by to complete DCO chain

 .../devicetree/bindings/vendor-prefixes.yaml      |  2 +
 .../interrupt-controller/sifive,plic-1.0.0.yaml    |  3 +
 drivers/irqchip/irq-sifive-plic.c                  | 83 ++++++++++++++++++-
 3 files changed, 87 insertions(+), 1 deletion(-)

--
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
