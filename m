Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A74CD35140
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Apr 2026 06:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E4ERVVBp8Hh7rDBnkOZWCVBFr3zzIy0FLqEaZZalG1o=; b=tSJ8wV+5zryn/n
	oN4cZnkO1L8u9i6Afque88IL5OJq7VvuFo4QWpRXvwb4sVuI8bcmqKbnNUEh4HTia+AjyeOSsfwRR
	+dXB/AVRw/0U7OhDoc60hcjp2o4s6VsNRLxubVpBVJpaBYP4NkxH+q8xJSrTOOnYHlMi+Jx3zPmYG
	TFW0wca24Hu1fCE/27xtmA04BCNz6qv/dD6cnM61H0oEQpasnpbuiV7nTtEKOCRqpsrOmDlAlImoT
	b941tH2CNFXLMhdfyT96FYJmxKtixt8kPJZLXvFplFTU3v09HvyJPtorWNNNmAosBNbrdUOh1dWO/
	XmDxt9fVva+QamjWtscQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7pKg-0000000E8Bp-3mXo;
	Wed, 01 Apr 2026 06:45:42 +0000
Received: from smtpbg151.qq.com ([18.169.211.239])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7pKe-0000000E89q-0pCs
	for linux-riscv@lists.infradead.org;
	Wed, 01 Apr 2026 06:45:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1775025903;
	bh=jdSh7Gkw/dQvbevK9ISn2ljXK48jqiWBgsjGy36WQ/c=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=jQqDFXPLrpAGxQZQu+WsloIN51XWDD+ZO4a4UMAweMsPlqhjtwmLznjOrZMMJh6C6
	 n3QQYFDoS4iLU8O1ZReUCsNmwyyttIb5lanTRgAerRGgouoU0GEk+Ch+/EvRH8SF4o
	 xsN/dhgdHQFZzbPzlfdKvsfbPZvfmZFw+ciqOVHI=
X-QQ-mid: esmtpsz18t1775025901t2af1da78
X-QQ-Originating-IP: rNVcEvc/xIMzFngA6uKPDU8Cfui6+G/HVk6UwmFySyo=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 01 Apr 2026 14:44:58 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1209826560755650584
EX-QQ-RecipientCnt: 21
Mime-Version: 1.0
Date: Wed, 01 Apr 2026 14:44:58 +0800
Message-Id: <DHHM60NUGNZP.1JLBPAHKZRQFR@linux.spacemit.com>
Cc: "Vinod Koul" <vkoul@kernel.org>, "Frank Li" <Frank.Li@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Yixun Lan" <dlan@kernel.org>,
 "Guodong Xu" <guodong@riscstar.com>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
 <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v3 1/5] dt-bindings: dmaengine: Add SpacemiT K3 DMA
 compatible string
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260331-k3-pdma-v3-0-a4e60dd8b4b3@linux.spacemit.com>
 <20260331-k3-pdma-v3-1-a4e60dd8b4b3@linux.spacemit.com>
 <20260401-divergent-magenta-dalmatian-3c6c3e@quoll>
In-Reply-To: <20260401-divergent-magenta-dalmatian-3c6c3e@quoll>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: N9m5DZSiVOZbSjfBIAHCOaI9580cNFua75cW6peU9XPs/5ClY9v4OmN4
	owqev2zFdNAATCFOi6twzi/iF/GqezRCQWgbLUQw+lPDiXo4wqzgKbKYl8MRq9by7EqOYQw
	e03FFqbdHOS72KDNHdlv4XNwpvBqYL+0uLu35zqzgrNgDG27HjZBEVEBo+Gg9bWGlpXSL8t
	UbPXZTbNI04bQ0KxJAJq5a3IdodTDo/yPPjX+moWowygem1dw2rlKHuhSx1km3UdUVTXuCD
	jVRjhtenQg7hbzqNI1IiUkiZ2PHXjQgRh0DdXX1/8aT6xlHTkbVu7bbUEQ37jVUB36TPQfJ
	F5uSN+zNWhpsAHbLdY+7tchj/+M5r8/HPHZtcxpox+UIwRau6U1QiJlk+shqC8EOB7K/I9V
	P3a6HlYeQR/iUkKDn/Xl7dHtvh00wW+FlSpAVegBOwF37rpAX2J3jtSIIZH+oduWaP417hl
	VraVOmHQnu00Smo4/5fr9XyVpsID8WBHjnqsKqEOpqYU+JIaY1AIAJbN/da7BlBimMYKQcz
	ncG5Rd3XBoHkxoKECWLBqRdYRldT9WnUXeIBEuOglG88MG/8rP0NOFEB5K77LQylvsdP8Dr
	6EcdWQTgs7E4bz1CKoCE+TBdI3u9OpnUyVlNYBIs82/qwgvJsYHohy22JJnB+vkWqgnai50
	OYg0pZ6nM3sDeL93DoNHTLEMAucqxX5KVpHlZonGFw0/YulAw3pXpXYU3L3h/dLdVxbAb8h
	y9uYn8QWvM7OEPEyGjHRN/YwjWUVUle4tiXfSQ9Y0mg6ynGj5gc4X90yh3ejufllkhN1qPd
	XwsR3tcsRoRUQx6F343MPF/+7SyGUI5CNhDGGgW0fwY2OCjaonTquc+Q6ak3dVNeuVMDEkm
	IzojDah2TDJf3Tdryf5ryhJ2X6CsAw5JnXkRgWFRFB1QYuBTlKMnbkEtQacaHAwLzk5BMCc
	awYWLgI7fBE7+X3mkB9vJCxvMVifTX439yVHnMHlvZ916oFaSn/QPilJSLHZxW+QvXDuMLb
	UuJNILu1yea/cQorlRbcFt/yLfBZDHlQU3tjWN0Zs3dIJsZb1S/nXMrO+Jl6PkD0jf8Wfxl
	d2wpM3aEKSYDAh6BbNKrQ0=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_234540_736957_FE04D83F 
X-CRM114-Status: UNSURE (   6.94  )
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

On Wed Apr 1, 2026 at 2:42 PM CST, Krzysztof Kozlowski wrote:
> On Tue, Mar 31, 2026 at 04:27:04PM +0800, Troy Mitchell wrote:
>> From: Guodong Xu <guodong@riscstar.com>
>> - Memory addressing capabilities: Unlike the K1 SoC, which had memory addressing
>>   limitations (e.g., restricted to the 0-4GB space) and required a dedicated
>>   dma-bus with dma-ranges to restrict memory allocations, the K3 DMA masters
>>   possess full memory addressing capabilities.
>
> Programming interface is still compatible, regardless of memory
> addressing limitations, so that is rather incorrect reason.
I'll remove this item. Thanks.

                            - Troy
>
> Best regards,
> Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
