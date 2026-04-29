Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCAB1FF8864
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Apr 2026 08:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VSlwDcEfsBXG7fP4Y5TgFOj6CVVS9B17+wBAP4mBZoA=; b=Jmy/daytvxuc5R
	XZevwGxAZeTm5lxUgh7U8sji1J3UQxPqxLfkDdZOU+qj7kaN5XTvcgXrPqx9hihW2S7c5Wh9Vh/2l
	8aEwkwvNdvsvLS/Zc85SAH2nYGHBUU7tyRnx+MWyH8Pp26COuE3HtRCSBPf05+2uLR/CBJchr93ww
	ahEuld4dZSjk4nV9K9Kk/VUSnPzVUJIwTey805zUOCysaHds2lvV0WN8BkQWEcykWZ2valEeUZjsu
	lof+3h9iHhax7Yq0B4B1Iol6//IdvRT1LQs6m+uGidbMy0D2iCU9z0cHIAwOVUEAMRzrQRZlNiJjT
	KO2Nn3HkqaS9LqAF3Phw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHzuP-00000003DIM-03sB;
	Wed, 29 Apr 2026 08:04:37 +0000
Received: from bg1.exmail.qq.com ([114.132.67.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHzuJ-00000003DFs-1Ldl
	for linux-riscv@lists.infradead.org;
	Wed, 29 Apr 2026 08:04:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1777449837;
	bh=5fUuBfC7bwv1lJmKApj9TAOEI13YVB4KodPqQkdcyHw=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=glExagUFudUmYO9R/zBtHFDsBXcSE0OOiED2unKkrroaQgMLf7jMFA/uNTw/QPhgT
	 8xIECRqZmn3T2WcYEfdmw7FowWKQyT4WjmSTO41ryUdnib3FO5EhShXCtzOeFk8MdT
	 4RMcQ6Y8Orp4P77iOPqOUMzIdOhHu6zSUaGIHN70=
X-QQ-mid: zesmtpgz3t1777449827t5d1bd17e
X-QQ-Originating-IP: rX94L3y+/0mK+XkUrL28TUJzyamFByYqjc5ZNvM/9pc=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 29 Apr 2026 16:03:45 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15618526834681889661
EX-QQ-RecipientCnt: 15
Mime-Version: 1.0
Date: Wed, 29 Apr 2026 16:03:46 +0800
Message-Id: <DI5HDLS7LRAX.3M0H0KH046K04@linux.spacemit.com>
Cc: "Liam Girdwood" <lgirdwood@gmail.com>, "Jaroslav Kysela"
 <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>, "Yixun Lan"
 <dlan@kernel.org>, "Jinmei Wei" <weijinmei@linux.spacemit.com>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, <linux-sound@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH 1/7] ASoC: spacemit: fix RX DMA params not set when TX
 is running
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Mark Brown" <broonie@kernel.org>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260429-k3-i2s-v1-0-2fe99db11ecb@linux.spacemit.com>
 <20260429-k3-i2s-v1-1-2fe99db11ecb@linux.spacemit.com>
 <afFuXO3IfV6CSsLf@sirena.co.uk>
In-Reply-To: <afFuXO3IfV6CSsLf@sirena.co.uk>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OICmperGwjZpPesqIXqUQ0E3vUhzD+lcZ8nMk+H9tFd2yNxrF2CtjVTr
	yET02pxemhP+7yavT2zXw/hTFZ9GoJg0FnOFB3qxg2KWGQ/W5+lNLrbXgnTwHGCEBolW3Lx
	Mq4dWZ+BkuYxTFK5pPmmFVnmnM997F/Xd8jE4dtaUBH4Dqme9cqw8vtK4uDh2nIptJ0oQko
	E4mcpvNEHNoH3w7hz8qf9WRmtN6QkZSMdjSMAmK2iAhKhqUnJ/fwIUn8CGSZzD34WcO6lQy
	ACvnp8UQlg4GP3HVw9Zc18npA13doLDmij8WgOqO4H2A3btzqZyRNZw7EDOekZRnvcwbij+
	tTZMVPm7h8/SlZsG7bQY39ywh8QDwHlmH5Km3P2yWyzYP52sBf1Z6zMIxX7492F3KNobgIN
	qTccjYVJR3CjDvh6rmwvlxxzdlWO+RhRPlhgiEUnr//X0ug/91KD8xGDJETi934boTt34F+
	ZGWMCkTeAEcs3oY3W5jBg9WbSM0MI+62WNBn1yzlqQre16JVJWTL6/tUPttQ0jgwIz957uW
	xgxmjXr2+gidteIJ9nt6bp1SazoRViYzoFG7vcBrmTf4/o+ToNZGfhB9kS3r40tHE0JMAC6
	G24bCZqsc18W3LGgEUOXBbUu1yODq/4h0d6pJtv3uZPXyH9pvBEHCveSOPiCDIYX3TCHHXu
	9Tu9epA9Cjf8Z1KoCR+tA0eosMk7pEeWx7MLG1snU63jwowZoF50x1yoAC61kWJ9IFJR9sn
	uA8htJaz0xwSmy/5j9jmf8e34e5sKiojuAXPxxxQlRAhYy0zGJJTcu96P9twBQh66DiPmJ/
	UDo3P9mfva8KkZYfiJIU5NbmHKgRzFf0SORbMOaaz8jw9FOHkGIFfWHKRggSFOFEG9aRr5B
	fbPHEhQY/EL7hkJIuz6v3mnagRaEO+CQTtBysSA4t3lA7aisgub5b1EStOVsR+xNuw/Zrl3
	zhm9eUZiqrFNjbjatpf7n/UNkWI+SiL21auSIAJfCVM+aJD8oflqn9J5oCq8q7r7I1W9hAM
	YperCpqwP4AhQOl6TKCwdcZZsIBTMChyE/EIFrbFe/1WeJI5NtWzdlw4ypChvTGPFvyJRjB
	sp5pHrz+JUq
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_010432_071286_550E4971 
X-CRM114-Status: UNSURE (   6.00  )
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

On Wed Apr 29, 2026 at 10:35 AM CST, Mark Brown wrote:
> On Wed, Apr 29, 2026 at 09:38:46AM +0800, Troy Mitchell wrote:
>
>> Fixes: 955f7b46873e ("ASoC: spacemit: add i2s support for K1 SoC")
>
> 	Fixes tag: Fixes: 955f7b46873e ("ASoC: spacemit: add i2s support for K1 SoC")
> 	Has these problem(s):
> 		- Target SHA1 does not exist
should be fce217449075 ("ASoC: spacemit: add i2s support for K1 SoC")

                          - Troy


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
