Return-Path: <SRS0=tx4i=TX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 098CFC282E1
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 23 May 2019 11:46:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBEE220881
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 23 May 2019 11:46:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mJCaN6CR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="kBRcan3e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CBEE220881
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=vv1p0rKB0g5PfM4ipTkg9vgfHU+tFFk2d7PjJ+kyWMQ=; b=mJC
	aN6CR0efECnh9qzh1oWfYZKJcKyhToj5jUcadv7LsXc0hqNDATyHtkamm3DPuWYR0Gh9aiJCPQlvl
	8+rtWeAk3S+xgSutSbmwa8fMnW0bCTYfHW+0Qe+HTfAyiLXOCv6BuRp1xBGB8uqLX1vvncdpf5Goa
	R1gMBKk8rlNkP/tZFGhDJAauqSll09FpAHYg7T327BiBhpItZuwARq9dw7IERdhe+IcrhmRYfqsyD
	Ejy2QwD5Cm80jP8n8yYLqjHjVdZdvBbEh6lD1y7Rl4EEruSpIeZSt1RMV2/KhWyvMR+32SEBOIYXJ
	qqZO+KyQJC6i2HQ0kVfVotlhqvAgw0g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hTmB2-0003VQ-Hr; Thu, 23 May 2019 11:46:28 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTmAx-0003Uw-Q5
 for linux-riscv@lists.infradead.org; Thu, 23 May 2019 11:46:25 +0000
Received: by mail-pl1-x644.google.com with SMTP id f97so2666980plb.5
 for <linux-riscv@lists.infradead.org>; Thu, 23 May 2019 04:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=wCUem1x/ylV1bJblqN5DyUuj9iRlSTgirM+Nihz6Yc0=;
 b=kBRcan3ex7if0+/zQ6bxlRiznWrjYUd+Ho3MCpSpAJ3oI1kOro4TWWVqTr4YjeoAKQ
 m6ousfyZQWk4f6F4ysIa/GCw5se1GTJWlIALfspm0wUD1QUCHZXLy40cP8cfZ3DsG8VX
 hYFTF+SAT4gQfiK+oF7F+JIEHF0DEotkzap6a2rIfoVmGpS4dyltZJ6/WP67CY1GJjTu
 WxOBsrcRA1jE5vQMuCZnAFTY5P3MKkGvN3AiL+YK++gwzVpeaaY0fo7RzBQJoQWi2RJh
 dts2N4sCqCe/yvCxlveHNdRP/FsbOaqNx5W1AOp2mJ3BEZBZVXFTOkxn8AP5WETImJ8b
 VmkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=wCUem1x/ylV1bJblqN5DyUuj9iRlSTgirM+Nihz6Yc0=;
 b=mGFmNCYUgwERKWufINlu1qYB9qaRGM0/ncmDuYjPODCzd+zWFEiDZq4hEqHF2L50Q0
 fHsS/ZndSajf5PQbhAInwpg2mv4QGIZB4byPDbM3QT4T5nv9JkGRBJX2st6qslMB+v0U
 zq1UR5R+msNmG5ewNwQCw/EkWaM0PedoaJxU0I54Rhyr/6iE0cRPCWes9iH3nSbnxdvY
 r9bHQscGOpTPkmIW1BDwDgxE6qDe27BCkpso5kgu0BJ3k2D90dXXI+EY5EXT5RRRGdya
 99E8qj3nyt/eqsvxy2C7Awah9yo0eKhJpbMa+2+5RGa5rIgH00QVbXUuKM+NoncmcDIX
 OMHg==
X-Gm-Message-State: APjAAAVo4JFygdWmVhJ+ct3lEQOoUDz2YEFRak8LIKoifTQDA2fGXjgC
 nJb4DFdPdY7ZiBSb6m2cRjqZ8A==
X-Google-Smtp-Source: APXvYqxVNdT42fnzi2SZEZYBxORLSTPqXLfNElPuLBHxSdMY7xWL/p1mDc4dwYQBFNxX2+n1KhaIwg==
X-Received: by 2002:a17:902:ab98:: with SMTP id
 f24mr95930813plr.223.1558611982802; 
 Thu, 23 May 2019 04:46:22 -0700 (PDT)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
 by smtp.googlemail.com with ESMTPSA id l43sm565045pjb.7.2019.05.23.04.46.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 23 May 2019 04:46:21 -0700 (PDT)
From: Yash Shah <yash.shah@sifive.com>
To: davem@davemloft.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH 0/2] net: macb: Add support for SiFive FU540-C000
Date: Thu, 23 May 2019 17:15:50 +0530
Message-Id: <1558611952-13295-1-git-send-email-yash.shah@sifive.com>
X-Mailer: git-send-email 1.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190523_044623_985336_77D36617 
X-CRM114-Status: UNSURE (   9.37  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, aou@eecs.berkeley.edu, palmer@sifive.com,
 nicolas.ferre@microchip.com, sachin.ghadi@sifive.com,
 Yash Shah <yash.shah@sifive.com>, robh+dt@kernel.org, paul.walmsley@sifive.com,
 ynezz@true.cz
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On FU540, the management IP block is tightly coupled with the Cadence
MACB IP block. It manages many of the boundary signals from the MACB IP
This patchset controls the tx_clk input signal to the MACB IP. It
switches between the local TX clock (125MHz) and PHY TX clocks. This
is necessary to toggle between 1Gb and 100/10Mb speeds.

Future patches may add support for monitoring or controlling other IP
boundary signals.

This patchset is mostly based on work done by
Wesley Terpstra <wesley@sifive.com>

This patchset is based on Linux v5.2-rc1 and tested on HiFive Unleashed
board with additional board related patches needed for testing can be
found at dev/yashs/ethernet branch of:
https://github.com/yashshah7/riscv-linux.git

Yash Shah (2):
  net/macb: bindings doc: add sifive fu540-c000 binding
  net: macb: Add support for SiFive FU540-C000

 Documentation/devicetree/bindings/net/macb.txt |   3 +
 drivers/net/ethernet/cadence/macb_main.c       | 118 +++++++++++++++++++++++++
 2 files changed, 121 insertions(+)

-- 
1.9.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
