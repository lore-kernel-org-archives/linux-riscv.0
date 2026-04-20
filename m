Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC383F557F2
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Apr 2026 09:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:Subject:Cc:
	To:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D6IMMrEIAs1nYsM0YVyFwlciNHNxpKF6uj1E4G0Zy4Y=; b=Er7+8fJxs7OQLv
	W4Z21ITnfQ12GJAlP5ny7DqX0eBYK8ZizC6g//ctbHVuOgog0RWrQyXZajolHGhh9C0fUpcyuXfFc
	VU0grfF4jS9zHKmmzlwiGUD6QTG6G04lJUtrZyTtfkdnJMzh64sQ7EJNAdjy+CO+JQ81NkCRYSiqS
	y8uxYwSHF/EMnjGSeoeAsvQvIyv4clV+wREdhts7zFa4b7ObOwucJhUzCop8q6zgRfT/7XUXFlcFw
	o602p+cFbnyhUu3ZeVn5einlnOCLciwYypE2gRoGgjpFCriU2jdmzIEdslxZCx9Lh884/BcNf0YPd
	XLXdd1t2S0P39wH25g9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEkwU-00000006gAC-24EX;
	Mon, 20 Apr 2026 09:29:22 +0000
Received: from smtpbg151.qq.com ([18.169.211.239])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEkwQ-00000006g8k-0nSU
	for linux-riscv@lists.infradead.org;
	Mon, 20 Apr 2026 09:29:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1776677289;
	bh=Epg2XijeaAbCs5Ct+as2QF3IkV5HTxzlVZVwtKv66wk=;
	h=Mime-Version:Date:Message-Id:To:Subject:From;
	b=HQ2cP9jEbKLx60g6DqTW2OmocU4AU48PxOnwsd7Je4szIQJLTtHolDNUjJBkh7EZ1
	 4y/PqnTwvA+BnPWlKJil00e88++rjs1SVwjpL7j/C+YU9YsAjYATCGzna/XUYflC2K
	 i8/APwidLOqCpVSiLb+KdumW5xDuE76RzY0wfuTI=
X-QQ-mid: zesmtpsz2t1776677279t4d3418c6
X-QQ-Originating-IP: OnBclwAmSm8kIWOHKvtJLXfl5OmN7/ZPSMWtVz2JVoU=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 20 Apr 2026 17:27:57 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4948310961083474313
EX-QQ-RecipientCnt: 16
Mime-Version: 1.0
Date: Mon, 20 Apr 2026 17:27:55 +0800
Message-Id: <DHXVJ4GG8XSX.2HBP0VYODXHUG@linux.spacemit.com>
To: "Yixun Lan" <dlan@kernel.org>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
Cc: "Krzysztof Kozlowski" <krzk@kernel.org>, "Sandie Cao"
 <sandie.cao@deepcomputing.io>, "Conor Dooley" <conor+dt@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Paul Walmsley" <paul.walmsley@sifive.com>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, <spacemit@lists.linux.dev>,
 <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "kernel test robot" <lkp@intel.com>
Subject: Re: [PATCH] dts: riscv: spacemit: k3: only keep spacemit,k1-i2c
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260420083931.1427703-1-sandie.cao@deepcomputing.io>
 <dfa3f1a7-f4c6-4655-94c0-326f88db3896@kernel.org>
 <87ef529e-b591-49f5-9fc9-3099672e2f0f@kernel.org>
 <DHXUQHVK4XRN.3CVZ3GH75L4L4@linux.spacemit.com>
 <20260420090936-GKB203300@kernel.org>
In-Reply-To: <20260420090936-GKB203300@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OZH4OYjZqgcfnK9wN1uPDG/vAN2LnGiMr7U4zSrVFT3LrmpkdZtMMOSB
	IVYlp0AIyUcAKQNxUonVgrF47Re5tx3OD+fZEgAK6I12EU4f/bj9Sjseb0TGVL9JZUF/Vtn
	PrQ7w/oM4ysJ+lssTnU++0yj3gcq+PBZ6bEdYwpEz2CE+XtUh9smjo9gmOkXMoxwjWIEagM
	enxwSzAdbeJyfxVZLKVWr4XjN7DZmPMEsnj8iUBiGK9dnXfS0rQbZRdzIsAPpRZEttmZhxo
	NzHKmjetA4WPftL4p+6ry/mClqDbH+ei3tmIU+RUconN86Z2aFdJucHPcPL/d/39W3OZkrt
	fGyAWCc4++Lzq+V4X2Nhx1kxrbrtkSzsVc8FlxF3O62gcAI3UzwhM/Dj6MNV/zrcjSPErdC
	7DowucqWobSYHo8qUe6VJsekw8jBZMTXgHLx8unnBhHBkrySr6UVnG6T0ddJE9yXt4OBdTO
	YRmKjqaamiZqhcKx0DYVgZ7EgREcPqnxLEINalj29GhNJKEgXHXEvZRxESdYHJ6tiTMdu16
	xW1gUwurxoIhB55bFrPhLVEqGjHqNZU52iBpwtNPfcvZQUqgjKyJnVXufNyA+fT7LJNWr+N
	+BMr1aoocQ2vKMwJLqbpBFtG1iUHlPB+QgH9IgG3EtKTYXyWxxkS6ScYrfW3yrAnwNQM384
	p+ld2BUYFCyvEHibuJ6AFsM03TXRQ5xzX1Z0T1YiQ+ylUE2MMWwXJGfy1Bd1N2ClZ5f6Hur
	GiS+HNM1GOeMJT6GdUi1JprO8LGN+FphWs83//bkA4y07drkmiutyBqmF6HY79fQnuA3WNs
	yks/KfNeull+KC6HPMQMvIp45zoDLaNmOeYQOO4g1K01gj+3B6P7A1d8avZ4RuweHPEnoM4
	GnsJl+jS3GgjaLG0zdplmAUMKh4epd53xQcOMjdpFTBqEwoocDYMuASXLnsRSkwkfDCWRH2
	1kNL6n+Sjq4Fwf3TyN187RhlROWxXQDrHW9J5G9P647PZPCnwvI2agHbEU+EC9WVqPaBYL1
	6qP0VL5HYgNjIpgm7UTJS0H/T3qBwOZZGkgPgRNm7sX+Ki6tBEX9cokFi6ozsqHoUNfp8fV
	Hf18lafXd6C/KfF8fI4X7xJIf9tFrosmlL2+rCcag84
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_022919_866138_0C541509 
X-CRM114-Status: UNSURE (   7.67  )
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

On Mon Apr 20, 2026 at 5:09 PM CST, Yixun Lan wrote:
> Hi Troy,
>
> On 16:50 Mon 20 Apr     , Troy Mitchell wrote:
>> On Mon Apr 20, 2026 at 4:44 PM CST, Krzysztof Kozlowski wrote:
>> > On 20/04/2026 10:43, Krzysztof Kozlowski wrote:
>> >> On 20/04/2026 10:39, Sandie Cao wrote:
>> >>> Fix dtcheck issue: compatible:0: 'spacemit,k1-i2c' was expected
>> >> 
>> >> Missing space after main commit msg.
>> >> 
>> >>> Reported-by: kernel test robot <lkp@intel.com>
>> >>> Closes: https://lore.kernel.org/r/202604140259.eKDaxKua-lkp@intel.com/
>> >>>
>> >
>> > Also, the file reported in above warning DOES NOT EXIST (I checked
>> > next-20260414).
>> In Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml:
>> 
>> properties:
>>   compatible:
>>     enum:
>>       - spacemit,k1-pinctrl
>>       - spacemit,k3-pinctrl
>> 
> I think you refer to wrong file, which should be
>  Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
My apologies, I overlooked that. The file you mentioned is indeed correct.
Thanks for pointing it out.

                                        - Troy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
