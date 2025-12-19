Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD081D711D2
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Dec 2025 01:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PvFdrC24vtK+P9Lx0RveXDV6o7ZC6HqCnDnmWKHf0iY=; b=ciCobX95PLpHOh
	AR/Fe7P5oPiqHcr/IPupbCQxELKEeU25DNuL+8V+247v8rZWWRJLqgWIyx5cHp4d8blvxcK1FUOl/
	5gF6rn2kF5MhUer3tcDZcbf9Oj3EUy+gbO7bea8to520E9gypieEB6V3PXAouwrj4KvvHyhZfNzoo
	UnMUEgqceR9JyNhLaNNca9EH40F/7qDep3fdCzkNp6qITGCnaPucDzqMSqpdMSw47J7HwSfbL9lMQ
	4woJHo4gTM5LtR4hIH/9slnG11Qv0TyOdul0Ca9ia/FjYJEp16vy2JZh5QKHYinO9U1RLQyP1Uz7x
	LQSOXhw2OBaJonGHISaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWPJA-00000009QrU-2Jxi;
	Fri, 19 Dec 2025 01:29:28 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWPJ8-00000009Qr5-34fT
	for linux-riscv@lists.infradead.org;
	Fri, 19 Dec 2025 01:29:28 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-b6ce6d1d3dcso1168379a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 18 Dec 2025 17:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766107765; x=1766712565; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ImtK/f/sYZ0T/CDz6wNZi8kpvO1eTA7THBDv7eoYu1c=;
        b=VdaGvaaRK1HhdG6w41SfgvdtBHpz5aiBNDT9Clv+70Qir/i1IZOiyp3mHCBEQb0BVZ
         fII6SSXVEI3iWpim6sCFRuG7HyXUqJQ+GgolH340hQjy1Jf4mwtLvA2vReIdwSWwNrEh
         xS4O2WRR8q2VYzKAO7lNdHvr8FUjAaqfTHYjFEmIP7VVws1Ta4c5VGHa5IXC1NgyT63q
         j9g64RMM4NkkXnKlohtl+FdNxJy6YXhc7Rc7BcoCjGyZVgu02LSbVL7CVuiGTfPVelSg
         mEvJ7zdRDlwoNHv942iGHYDzY3I+RLhvy2PTe/ziFeraUOKucRCL9jmPZRK0Dl9My9j8
         CWfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766107765; x=1766712565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ImtK/f/sYZ0T/CDz6wNZi8kpvO1eTA7THBDv7eoYu1c=;
        b=Qnfy9CYunr4ctYtmiLT2cpxWCHJ+OGtXRfVZ996LrR+Wtil5rOfAeKGZIDCPbTOVdv
         m+HOhUQQcj24vnqHrZFnXwEsQ8mNrxjwhkvJssgmUjFSTR5r6hTJKHZ/mcq2ADqRBlNO
         wouTPSvwD5ks704SqToG6YXIZKvZUlPx/H6+A1HFMOAA0XyMtn/UD195DwO3eSthzxwu
         xCh9hDWWfEHMm2EhqoyOw/iD8ZGYy8ol0v+6TsMVuwhy3PlyCm3JKUn2ECcgp3vWqzBw
         UsrbRcBzEj4ifO3nVZPSrcFHZpMKoVu3QqrPQWElQc/JgqPkW+E8/VkGNbDVdBv4WVzR
         Mr8g==
X-Forwarded-Encrypted: i=1; AJvYcCVNbOToJCXuKuC20VDbroCU20Uv+IKmjDO8+cns+mCvk7mUVx1mQiSbS3qgK8R+riS87nzv9ZTRbVUc3Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YycOy/dMnoM9Vmmm7ZsYmhuQDzzu9JxXhgZexzueg1OfoCci2As
	QAlLffwbu2rPOwT/CZnvRKM5Krex5wecehso/UWCxCiEF/7jNEVw0ZRn
X-Gm-Gg: AY/fxX51pjV/9l8NEBkN9UwGYiAbYczyTAIxBP+SY2Da2hxrcQWIkccVpHyolPZ73k+
	B5YO6wxcYHZE6A1UjXbucsTs2gl7YNdg77Yd36ma69oZdb0fWSuocp5BMxLZBZ8nUNiOGi6Blfl
	XRI7KfpEUzGzWaCgv3ny7sw6DYHnZNgvnSSIn5y7Um1cBz+rSFvsmbg4Cfg2SMBgc5LP9tDJdks
	tbehCp/6lbWPsw1tOF1JPp8zzCERI6tsNsOS7av193IQfJ2MyyneqLhsmneXrE+p1eQde4V7m5U
	W5oBR15PTWNr2srfqI6Bae6OdiQVHtKlrMb5EH9jEhIWKQ7SuQwRO+9aBTz3cBkzt7inWbPYEVX
	Bd+jLs6V3xF33VbrbC6UXstkIbxkvjilfSO8wxNP0K2ZDZaYKHSIjXJgyDUnqHNGK65EVSEFcyI
	k7QyZ+9Acneg==
X-Google-Smtp-Source: AGHT+IHmCsJOTDpegNz1zbKi7qV4zqhXPVuzMhRGlv8/8xKRdA6N3Lz/R25WgxpM69DLVt3TUiIsaA==
X-Received: by 2002:a05:7300:2315:b0:2ae:5a13:97d8 with SMTP id 5a478bee46e88-2b05ec030cdmr1436191eec.14.1766107765232;
        Thu, 18 Dec 2025 17:29:25 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b05ffd5f86sm2058701eec.5.2025.12.18.17.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 17:29:24 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Haylen Chu <heylenay@4d2.org>,
	Alex Elder <elder@riscstar.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Charles Mirabile <cmirabil@redhat.com>,
	Brian Masney <bmasney@redhat.com>,
	Akhilesh Patil <akhilesh@ee.iitb.ac.in>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v4 0/2] clk: spacemit: Fix module build for spacemit common ccu driver
Date: Fri, 19 Dec 2025 09:28:16 +0800
Message-ID: <20251219012819.440972-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_172926_781117_0431B205 
X-CRM114-Status: GOOD (  12.04  )
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

Currently, the SPACEMIT_CCU entry is only a switch for enabling entry
SPACEMIT_K1_CCU. It does not guide the build for common clock codes
even if it is a tristate entry. This makes this entry useless.

Change the Makefile to add a separate build for common clock logic,
so the SPACEMIT_CCU entry takes effect, also add necessary
MODULE_LICENSE()/MODULE_DESCRIPTION()/EXPORT_SYMBOL() for the module
build.

This patch mostly fix the build problem, and it should serve as a
basic for the incoming K3 clock driver. See link.

Link: https://lore.kernel.org/all/20251217001833-GYE1903981@gentoo.org

Change from v3:
1. patch 1: change Makefile to trigger module build actually
2. patch 2: new patch for remove internal Kconfig entry

Change from v2:
1. change namespace name to CLK_SPACEMIT

Change from v1:
1. Use EXPORT_SYMBOL_NS_GPL to export clock ops

Inochi Amaoto (2):
  clk: spacemit: Respect Kconfig setting when building modules
  clk: spacemit: Hide common clock driver from user controller

 drivers/clk/spacemit/Kconfig      | 14 ++++++--------
 drivers/clk/spacemit/Makefile     |  9 +++++++--
 drivers/clk/spacemit/ccu-k1.c     |  1 +
 drivers/clk/spacemit/ccu_common.c |  6 ++++++
 drivers/clk/spacemit/ccu_ddn.c    |  1 +
 drivers/clk/spacemit/ccu_mix.c    |  9 +++++++++
 drivers/clk/spacemit/ccu_pll.c    |  1 +
 7 files changed, 31 insertions(+), 10 deletions(-)
 create mode 100644 drivers/clk/spacemit/ccu_common.c

--
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
