Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF39D2E008
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Oct 2024 01:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RQfmU1xpTrhPMPQ1CzmNw5SaWXC45Q7lAtv7Sc9FSV4=; b=f/0OEWK1cjgE7O
	YQOQQeL9S07ozINwhgLBjM7nTIxRo75kCzKHBKm3lCdjvfTM85i84epvNBqOY5eupPGj9NAUUedE/
	15KepKyndDA2j4fkAzkQSh307ZHt3KU+Pb4sVcaogS7+AOVf7Sb238iD1XhzQoifK+vk6PGBaILde
	AmZkpdbMo2CjoHYqbBBnG2WJrHuw9WA70K4zTKdk1DcLUdqtCAqasvnrScuOtrEH2LpNZbs8GCEmz
	nQTrqTD7ibGt+PyucEWk/hzHc/bvFTnvC7G6aBqnQg8REjXwJGG/Lv4AmIveX9IKZpXlAg0ZMarM0
	7KvHazUDYqEIxa2bmesg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Pvi-0000000CaqV-2TuR;
	Wed, 23 Oct 2024 01:12:54 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Pvf-0000000Capx-3nYd
	for linux-riscv@lists.infradead.org;
	Wed, 23 Oct 2024 01:12:53 +0000
Received: from [IPV6:2605:59c8:31de:bf00:37c2:fe62:c21b:ab46] (unknown [IPv6:2605:59c8:31de:bf00:37c2:fe62:c21b:ab46])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id B9AB0B4B04E6;
	Wed, 23 Oct 2024 03:12:46 +0200 (CEST)
Message-ID: <434a7a39-de2d-4053-aed7-df556b5c385d@freeshell.de>
Date: Tue, 22 Oct 2024 18:12:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: dts: starfive: Update ethernet phy0 delay
 parameter values for Star64
To: Conor Dooley <conor@kernel.org>
Cc: Henry Bell <dmoo_dv@protonmail.com>,
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241022061004.62812-1-e@freeshell.de>
 <20241022-amusement-overreach-c5d1d7fd797b@spud>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20241022-amusement-overreach-c5d1d7fd797b@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_181252_125553_55513415 
X-CRM114-Status: GOOD (  12.77  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On 10/22/24 09:41, Conor Dooley wrote:
> On Mon, Oct 21, 2024 at 11:09:51PM -0700, E Shattow wrote:
>> Improve function of Star64 bottom network port phy0 with updated delay values.
>> Initial upstream patches supporting Star64 use the same vendor board support
>> package parameters known to result in an unreliable bottom network port.
> Should I add:
> Fixes: 2606bf583b962 ("riscv: dts: starfive: add Star64 board devicetree")
> CC: stable@vger.kernel.org
> ?
>
> "unreliable" sounds to me like something that is worthy of going to
> fixes/stable

Applying as a fix to stable sounds reasonable, thanks. The bottom 
network port has always been known by Star64 users in reviews and 
discussions to be affected by dropped packets and low network 
throughput. If we want to prove correctness does this require expertise 
and use of an oscilloscope to characterize the signal timing? Though I 
am not sure I got it right, it's not worse than previously was on any of 
these Star64 boards in the wild and probably is better for at least some 
(if not all).

Notable aside is to mention the re-worked motorcomm driver of 
more-recent Linux kernel releases (when compared to the vendor board 
support package) dropped the Fast Ethernet configuration parameters on 
the reasoning that Fast Ethernet (as compared to Gigabit Ethernet) is 
relatively slow enough of a signal that a default delay parameter is 
good enough for all use cases. The non-default Fast Ethernet delay 
parameter values missing from the upstream effort are not possible to 
implement or test for in my effort here, but are no worse or better for 
having this patch applied.

-E


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
