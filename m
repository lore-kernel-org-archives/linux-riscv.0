Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C603C79F86
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jan 2026 12:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DDIcBRt3AW5w6hA7hlivgqK7Dh5zW29013c19VOpTOg=; b=DpocKuW9tyZHlH
	4aJQFsMHAOMmd1tHFI9oQYLHoclL0hlA3esuWb7zOcDLH5S1FolfN+kSVDRQEXBYTpA5Xv0KcENp5
	uHOks9xRzAQRnADOz3UDhou7pNJUJIHTQ0DUhbTJfjOJIHOm+z+oCCJOtc7FToG+iKq+sZleKsk3q
	jnpT0LyR1DPE/v6NOLuBZLjazXHupPFUJU8kK4PsgJRZIXL1ya15Wn5U+XaG7I6gX1+0RlEX1bSiQ
	axigKDVM8bWmE2RS/TwGIhgl9pZOlHkVQd6NOcv+UA+u+dchFWbPj/AAxbrSCSZ/SP6XhfAJOmJl4
	KDnA6/iAYrnQPjaKa2Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcjHe-0000000BErG-1cxG;
	Mon, 05 Jan 2026 12:02:02 +0000
Received: from mail2.viabit.com ([65.246.80.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcjHU-0000000BElo-0T8S
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jan 2026 12:02:01 +0000
Received: from mertle.michael.orlitzky.com (vpn1.metro-data.com [65.213.236.242])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail2.viabit.com (Postfix) with ESMTPSA id 4dlCZR6LLGz3wnD;
	Mon, 05 Jan 2026 07:01:35 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=orlitzky.com; s=mail2;
	t=1767614498; bh=s4Zp1PExfCSkpt+X/Q/fCkCFvRLv6N0SrZZTA/2PWFA=;
	h=From:To:Cc:Subject:Date;
	b=OZO9QtWSBOdy/UhtNriG2i4U/Jf7SGDZ2VlBPKxX5eYEd/1VsKU3w/mu+a6QoCD+x
	 BeoYcH+kv1M5akdKJiBrdiMWMHSFuK5ejv0jItGmhns8M16NFNxfTE6wakCWIJjg2h
	 g/Osjg2TkM6csiB7INBFHW+kpLLZniTL798O7tUQ=
From: Michael Orlitzky <michael@orlitzky.com>
To: unicorn_wang@outlook.com,
	inochiama@gmail.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH 0/1] Enable hardware clock (RTC) on the Milk-V Pioneer
Date: Mon,  5 Jan 2026 07:01:28 -0500
Message-ID: <20260105120129.58895-1-michael@orlitzky.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_040152_345545_FD0AA22F 
X-CRM114-Status: UNSURE (   6.48  )
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

Add the DTS entries needed for the hardware clock on the Milk-V
Pioneer. I was able to get this working with an earlier (6.1.x) vendor
kernel, but it is disabled in the upstream DTS.

AFAIK this is the only hardware support remaining to be upstreamed.

Link: https://github.com/sophgo/linux/wiki#sg2042

Michael Orlitzky (1):
  riscv: dts: sophgo: enable hardware clock (RTC) on the Milk-V Pioneer

 .../boot/dts/sophgo/sg2042-milkv-pioneer.dts  | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
