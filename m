Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D82B4C79F85
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Sep 2026 08:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IuNE0ACL7Qai1d+CmxalcZ0J0JWsOpRQjwD8kXnhp5s=; b=uerj2n9L5llg3P
	LdNUJ5uV2V+dTwCIztZcFMgppBqWCIEwKeOvaZQwkY3UtL5O21fNrBRJY+LCWQfI6TTID1DXkRMcn
	Qq9AQMlG8dJH1zkuWMghnlWWVfcfs5XjFNm9453JuZG3QWWkQyxedyGIpdqJ+6niEaMjII8tM6Pyt
	XG6w86f+riXn6VCX1PYUOPrvpXNmoU0SYv+9k/YutqTEtaTZk/iVKGbonHX+0DCFK9eN9+f52kJfn
	MypK7p8iH2FQqed/kmeFXXLIoMrQwkoWV6yHdvolanZPM6sH9MK6vkNcRhAmjCuSlAQlJTsuUkZD6
	5tpTj0r1w7IyGGDMJVBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x37vU-00000004piJ-3aB7;
	Sun, 06 Sep 2026 08:08:32 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x37vQ-00000004phZ-3fRb
	for linux-riscv@lists.infradead.org;
	Sun, 06 Sep 2026 08:08:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:Content-Type:
	MIME-Version; bh=xKDSKizHZCSh/GwioNCRk11NIWuQanvzrZUh4Jc1YQI=;
	b=J4lRhI8X9o2TPUgNwf52MVFNgLyW4EnCq1v/DKKzfzAvodaHGRHvJ8Q9q8Rliy
	c0cT4IvX8yAZ0qRUNpMDxs0szBksD+1//HaQLJ44K74MqPECXfy0zmJ5HSpKWq7p
	OwEy4+NralQg9ymjG6UhHi4n59v3chkVz9njhGiR1KjP8=
Received: from localhost.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgAnfypSH51qW34ZQQ--.4333S2;
	Sun, 06 Sep 2026 16:07:47 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: Anup Patel <anup@brainfault.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Pengpeng Hou <hppiscas@163.com>,
	Radu Rendec <radu@rendec.net>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Bjorn Topel <bjorn@kernel.org>
Subject: [PATCH 0/2] irqchip/riscv-imsic: Validate group index geometry
Date: Sun,  6 Sep 2026 16:07:44 +0800
Message-ID: <caplitmus-rv.4f722288a2f1483090d75bcd991d5b90.imsic-cover@163.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CM-TRANSID: PygvCgAnfypSH51qW34ZQQ--.4333S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtFyfJr45Wr1kKF4rXw45trb_yoW3twc_ua
	4v9r98JFWxtr1DKrW7Jws0vFWktrWS9F1vvr1rX3Z5ZasYqa1xua4vqr4Yqr18AFWkZrs3
	KFWfX343Gw1IkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjvzutUUUUU==
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbC7hPdpmqdH1Pk7wAA32
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_010831_442866_97F8F128 
X-CRM114-Status: UNSURE (   3.80  )
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

This series handles absent and overlapping IMSIC group fields.

Patch 1 skips group-shift validation and masking when the group width is
zero, including the APLIC consumer. Patch 2 rejects nonzero fields that
overlap the lower address fields and makes the upper-bound check safe.

The series is based on tip/irq/drivers, which already contains
bd7d57a03c4b ("irqchip/riscv-imsic: Use GENMASK for base address masks").
That prerequisite is not included again.

The two patches have not previously been submitted. The earlier local
draft versions do not constitute public revisions.

The issues were found by our static-analysis tool and manually reviewed.

Assisted-by: GPT-5

Pengpeng Hou (2):
  irqchip/riscv-imsic: Ignore unused group index shifts
  irqchip/riscv-imsic: Reject overlapping group index fields


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
