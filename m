Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BA8ECCD183
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 08:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WIjTuWJgRDvEkAAj0ir4tD0uLviCDwadwq1aLDnBsA4=; b=3dR4WhvJLf06kf
	J6plJBVOuqKTce6J9zzLR9foH4T73pbXas9T7wfYrKizTNXGw+FbwWfwI+gih2ppYpDNSWjQvLbZn
	J8qGJA3eChktJzKxbMy5pt4LaZRSUqEbPt4w/CFyqzRZVzIWLJEz3ebR8WoZzKbOPuyGNDwlJfPjV
	17SaTZKRj8fNFFkm1sLWkgEm7naPG7XhzecE9lVOHlOgdsCH6PKXwl96/UsYa/XD5fyqjbRGqzEB5
	0F3omqPOj1666KFXgDyBvfTYFu3Oo/k4IVzEAv5WNxk3Ax2oCt5iz9J8T8O+FKVVlYMvTpZnIoByr
	PkWRNlj2hfierLuVDclQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6ltn-00000005VEj-3QMe;
	Thu, 09 Oct 2025 08:21:19 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6ltk-00000005VDf-3Nfh
	for linux-riscv@lists.infradead.org;
	Thu, 09 Oct 2025 08:21:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759998074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uAS+qkMsvlrGMvDE3IZzNp7+IP/1UAMbFrv7U9a54xQ=;
	b=QD+d1BFMGvQJqNbA7pbdzJ4OZy0aUNMk72OEYsJSmaJ8XJ0qxwobvUlTPR0HXS94K3i4R4
	dGTP4T/LT2UB/881lQHSqZAEi4+AaK/Y0ww0An4rM2b16nZah57HY+ExEt/dLF03qNgIUS
	z2Ke3+yU337S6CBV1mSaghDcLWvMzZg=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-676-Ly1kSF_-MbSR1Q-cqWUjAA-1; Thu, 09 Oct 2025 04:21:12 -0400
X-MC-Unique: Ly1kSF_-MbSR1Q-cqWUjAA-1
X-Mimecast-MFC-AGG-ID: Ly1kSF_-MbSR1Q-cqWUjAA_1759998072
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-b504dd6dbf1so48820466b.0
        for <linux-riscv@lists.infradead.org>; Thu, 09 Oct 2025 01:21:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759998071; x=1760602871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uAS+qkMsvlrGMvDE3IZzNp7+IP/1UAMbFrv7U9a54xQ=;
        b=TYHP5NhtOA2m+pffZVlapy0/dF0owxQwEhf3qJTawWuD/dd56ixdiuaL7kBPjpMA4F
         woHWnqg1F8cuGAiQ5nxgEKutymQBsEEECdBtyi/S9FVc7bNB78pcyWPFyip0WqiT7N/c
         6w3NWyHcPYLxnOOcItUk0NSTkMxGfr9MUecxxNA716MGCXy0h1Do4+S9W02W2zWPumEZ
         ZSasyntiVaf7fC/J6uSuQRgumR5OgL19ua08RYdXlf4z0uJXVramsd7hp6vwwiTRROyG
         9B2YQIj+ip5h9u5/BQyJBQLJLBD4MjNbdyp1SZifN4S2ue5GnBYgnJ3sHKr5RTkEhVub
         62lQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqpigZTJNurCLt8B+sxZWA68W12bdcC66x35Psqdh3SDjHydI9yYGQDGVZ1UjqijRLDhO8UXad7XPmLQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwO3T6wRehznD1iShSimBdUfMEkbFo73qh0gCMjUecpqm7BY1ss
	zynlTMjSEfoFtsVD2Flrzb/W7ScUDmNSoNNuRxn7Zj1Z+GmcpOWYLxw6AAh3Mlx/RlDoC2al530
	zWl9f4tFXIiyb6HDTyZVeQeHovfNhc+uHIrgzGhnOYHzaw5Sfim92J45P24YCqFNUnN/T0w==
X-Gm-Gg: ASbGnctE51WHgRsKBNDUKXG2JKaK11g/ttxUX5GvJnqeghi9nmv984OODD+eqDIXqAd
	M58cuA/Xo45JP8vJxXjhWlOw0tstXxjAKbEU2FKqPOXm2B4/iWtZrR1C1rGPjBFEE8Y9lPBze5Y
	CDhdglbYLrVmS5uWvCui19ti6ry55WEy4+hEq7BON2FkgpYvHpiW0R4tkxgWV1kahrbZVoM9yoI
	mWZjEvyykmv6WmGjExH10fBJUPd5bJzr/UU5Px5BHsAY/697WJrnn6nqvqT13MeIx37iBds4uWc
	AjYimOM/lMTaZauCq/7V/ifm6CpULgLd45FlXF/13o+YK8Jr8pt4
X-Received: by 2002:a17:907:961b:b0:b0e:d477:4972 with SMTP id a640c23a62f3a-b50aa7a086amr745875966b.25.1759998071532;
        Thu, 09 Oct 2025 01:21:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2yb0GW1Dmb4of5uiYM3V2RwnL7r4BajO4YJiE5GftpOYhzsHAtgMNkDAR7AnfSfgfWS6gIw==
X-Received: by 2002:a17:907:961b:b0:b0e:d477:4972 with SMTP id a640c23a62f3a-b50aa7a086amr745872566b.25.1759998071078;
        Thu, 09 Oct 2025 01:21:11 -0700 (PDT)
Received: from holism.redhat.com ([148.252.9.235])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4869b4e27dsm1832988266b.70.2025.10.09.01.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 01:21:10 -0700 (PDT)
From: Lucas Zampieri <lzampier@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Lucas Zampieri <lzampier@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Subject: [PATCH 0/3] Add UltraRISC DP1000 PLIC support
Date: Thu,  9 Oct 2025 09:20:10 +0100
Message-ID: <20251009082013.1331361-1-lzampier@redhat.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: w61EcvUmGTOyc95IKuoZifarDSYOviHBp7r0XRQd8jY_1759998072
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_012116_915559_957292F6 
X-CRM114-Status: UNSURE (   9.44  )
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

This series adds support for the PLIC implementation in the UltraRISC
DP1000 SoC. The DP1000 PLIC claim register has a hardware bug where
reading it while multiple interrupts are pending can return the wrong
interrupt ID. The workaround temporarily disables all interrupts except
the first pending one before reading the claim register, then restores
the previous state. This is implemented as PLIC_QUIRK_CLAIM_REGISTER,
activated only for "ultrarisc,dp1000-plic" compatible strings.

Charles Mirabile (2):
  dt-bindings: interrupt-controller: add UltraRISC DP1000 PLIC
  irqchip/plic: add support for UltraRISC DP1000 PLIC

Lucas Zampieri (1):
  dt-bindings: vendor-prefixes: add UltraRISC

 .../devicetree/bindings/vendor-prefixes.yaml      |  2 +
 .../interrupt-controller/sifive,plic-1.0.0.yaml    |  2 +
 drivers/irqchip/irq-sifive-plic.c                  | 83 ++++++++++++++++++-
 3 files changed, 86 insertions(+), 1 deletion(-)

--
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
