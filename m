Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31CC6EB64D9
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jun 2023 07:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ywC0wyRcN6wp3ML3i6ZpJ/ww1NKWQ05zd80F2VlaS4=; b=HTrEs4ToIcPg/u
	SSBoYRs/Ow5NzlgEW/GE8ZLx0ls7v8PgUSwzEuKiixTKR54T155O1EraFDrjAWBl+FU6qCjv6bDmT
	yDgdBBuAzJ9a1fXe83cr2CokujcwimiQGON/+VwXpjcvtZEOnd89PIqUe+3llWI4dbYMqQOhlDEh6
	a/d3fC7d0gGtbAronQ9Durpmdca75bY/0RFRJm/V3EMnYeiKt0ny42d2RyjoT4pGBfbG7iPcQusO5
	//Ce3zkt7sE0axuDlVPcWJ4fbI3CYIiuyyXi2P6BxqzEdqDaR3Zf/rTfEu3GFDrtHfTm9Gd+TOOiS
	7l1VO/5tT2mUf/+iIZvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qB8v5-007eko-0r;
	Mon, 19 Jun 2023 07:03:23 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qB8v1-007ekJ-1y
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jun 2023 07:03:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1687158200; x=1718694200;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AFeAq0/MBBTbj1nsTpnX71sh1KNpxSIUOTRgnvUmZa4=;
  b=JXUdBB3FQHAx6fB8fz0uMFfeJaG6O2qO6T5U6rM7S3o6bpjd4f85xFbm
   r2+b+w4EN2VinZ9MvKmfbfsS29jOHPF1Hq3PTjOrSZt9GNu+X9ZQdw8fy
   oP0v3GCynqSS6Y5UjVyP5KSNQPoMF7DkPdJg9OSagwhAEFuEU1tKeZWsS
   c2pvD7qPOjT6ifAg4y8Qj+2060u95Rt5NKTuOMa3KbEjeeZGDkqsMSBwL
   14K5I3hQIpV/UH3fXR0jpHTFWOeD05rlys4buYCXHpiOXq7PH4dEzxBgy
   dwDzLo62rTQw28qegNhMeg8g/92Q1spaVIr2D6ZTdBCqxc5nDnBFMznhQ
   Q==;
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; 
   d="scan'208";a="216620408"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 Jun 2023 00:03:17 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 19 Jun 2023 00:03:12 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Mon, 19 Jun 2023 00:03:12 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <linux-riscv@lists.infradead.org>, Conor Dooley <conor@kernel.org>
CC: <conor.dooley@microchip.com>
Subject: Re: [PATCH v1] riscv: dts: sort makefile entries by directory
Date: Mon, 19 Jun 2023 08:02:41 +0100
Message-ID: <20230619-abroad-jingle-a9fb26d2fce7@wendy>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230617-stimulant-untainted-3fa1955d386f@spud>
References: <20230617-stimulant-untainted-3fa1955d386f@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=364; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=AFeAq0/MBBTbj1nsTpnX71sh1KNpxSIUOTRgnvUmZa4=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCn9f7t66s90P1b0EV3Ob5dy5mj5jNA5QTvFZphLHXj3Z9qK 2I8/O0pZGMQ4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjCRld8Y/vAWmphY8L7j6p09Qyy0lN ln95eM+fuD+xcV7U4uedaWbsrwT0lAun2FIfvBHhnuoyZFU1fHnLMXmMr26I2JtLAwS8oufgA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_000319_888677_81C48B7C 
X-CRM114-Status: UNSURE (   5.91  )
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

On Sat, 17 Jun 2023 21:27:35 +0100, Conor Dooley wrote:
> New additions to the list have tried to respect alphanumeric ordering,
> but the thing was out of order to start with. Sort it.
> 
> 

Applied to riscv-dt-for-next, thanks!

[1/1] riscv: dts: sort makefile entries by directory
      https://git.kernel.org/conor/c/2bd9e07140ae

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
