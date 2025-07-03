Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05BB6C8303C
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Jul 2025 00:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sdzkeQS04P7w9RcWhZf67IV5So7WElMzjPO3nslxUig=; b=PHYVN2tCXfaWVq
	SAU69yLagjfmRXU2ZWi7xDcCCx5/x6zY/w1+IxE/tnuLXk1WT47xqCvI1mkZw2nalb3tcc3t4hEEA
	DL8Q8FsXBAaD/QK6J/9woox18rNaUH4K4sgAXQD6ky4PLE6d/zXuhtwdGYR0W33gqZNhCtFU3oc+h
	EFU+IUwX8GolD6W6WkWy3we7jrI0umyVVmt2hQwA4iqi2K+bQ/d+X6FciDxo2vuwcdN1mzOJXOaCR
	vYHjUgSW6V/koKsJ0EsSFuYGIbgFDkRNxLudsPthLW02kn30kLvVynrdHCm92FhhGhN+KjH9T/jZ9
	ickF8fN1z8p/r46WqU4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX88w-00000009taV-02GP;
	Thu, 03 Jul 2025 00:49:38 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX80L-00000009su8-40VE
	for linux-riscv@lists.infradead.org;
	Thu, 03 Jul 2025 00:40:47 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-747e41d5469so5598372b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 02 Jul 2025 17:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751503245; x=1752108045; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QGPW00Wqzr+TkyN3TBBplCnltrgypUhsxgUVEyLdzHk=;
        b=TrpnWfraw/vbEEX4nerrnMCwrDpm1uON0lE2RSqbm3ehiy8d+6o9z8IHMWigerV2BT
         n0SWOvVlprb8Mf7qHJjCFUfw1XoHRTaDAOY4MxRk/+K4wkQ6An7sbzdnH+awk6LkWG3Q
         kxLrqG0PV0M9YTYaBa9HetKt77WQ9eGGDaP0YhHqFufwhQioH6GAs94ibRYjP7NbFedu
         2tmWXjTvD1KfaPJCW3iC0E97qFDl8jLNb4JYdmSlaEKZDsU9rzy1DnpQK3UhmI8TS2oG
         E+pGMY/zZDdwmcsbCg42pY33AsvZE61Wvdi1FdJCYeNjfKCV6nMGpdmpiT0qEuj/n11K
         boZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751503245; x=1752108045;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QGPW00Wqzr+TkyN3TBBplCnltrgypUhsxgUVEyLdzHk=;
        b=Fp4tWvMCzwPUXdr+yc7Ux3GkvypKUtLW5AXm9+5s39lMz1mXvIN/DC9xOng9Nh2fV9
         rnXKoRnICsMUN6WvUJkMhkUrtpiNHyJr+VFeU2JcISLLNfu6uQLSLu8r31mzztPmi70n
         qH3IqNP4B/0U5PzIHdv3bWSNl+mUjCE2+nOwZITJKM9RYqpQ61x3Fnr/SPCs5krYAb8O
         8gvfuTF7jbak0TJT7amWE9g/lUgVI8+ymx/mGa/0LcB5AdHrlXmN75E5gToGIf7U0Wie
         bNqaYeFMe6+F3ISXZZELA8EX5FhDvBHLEgVBZtoBluvlTRduTmKCOH+GQVxKD8EIoOz5
         nVOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbvZ+qwQulBu0o8i2WXUehYAiL/MSO7/ik3hb7KFX8fjDoqetjxfw4fU7O1SPfCoJolleuOAKoOM+jlQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzQ3rjyFB/AQ3gSX2pH5f7RzjKxVSApSr+THTM+ihrdCkn+1xDA
	KArFPaIxknABULRlbcg0zFLe1ogq/5NUoVq/36dQKTZqg6hcFCPxtyHq
X-Gm-Gg: ASbGncuspMOwArGflT0KXgpmPvvh718mNcyhj8ElGSV/4+LzGbhHx1Q+0wtIw2sNrdP
	01RTgvxN4HKOsPmqMvj8a67CHUKTbEOYlA7/oWlG9RkOipattlw6Whw8Fyw93awOUWar0r/LyxF
	PdSpY+uWxokt8X4bhywsgnVps14pCa8duYRBmpiSEGFd9rFJ/Vrtxvb7M7S+trVldXxpcco0VJp
	eoMVpzt3yVItBwJVp2G+H2/AmjgT2hlDXbLeckyL0wtoyp0MaQwi+a88cAirVmNQwIb/8GdB+rB
	ad+QAmOmhdJnb7PKar1/K3iBgl2BwR+9WOzB6w6rcs+JMTTYgTvnEOXRx4KPWH8ci2WLJqla
X-Google-Smtp-Source: AGHT+IFEgHWRSZOM1OGOkaV/VMwcCoCEpYqFzUShN8zioQuMCjdKGgVKSOQXH56aFJAs4t/pv3Uo0g==
X-Received: by 2002:a05:6a00:2349:b0:74a:e29c:287d with SMTP id d2e1a72fcca58-74b5149d55dmr5410675b3a.11.1751503245093;
        Wed, 02 Jul 2025 17:40:45 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-b34e31bea22sm13872345a12.38.2025.07.02.17.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 17:40:44 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Longbin Li <looong.bin@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH] riscv: dts: sophgo: sophgo-srd3-10: reserve uart0 device
Date: Thu,  3 Jul 2025 08:40:23 +0800
Message-ID: <20250703004024.85221-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_174045_995398_A8CC46B1 
X-CRM114-Status: UNSURE (   9.04  )
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

As the uart0 is already occupied by the firmware, reserve it
to avoid this port is used by mistake.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
index 96ccb6120114..1b506972d465 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
@@ -113,6 +113,11 @@ &sd {
 	status = "okay";
 };
 
+&uart0 {
+	/* for firmware */
+	status = "reserved";
+};
+
 &uart1 {
 	status = "okay";
 };
-- 
2.50.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
