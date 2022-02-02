Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 377B3C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Feb 2022 04:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=JUKT2xI70jl31veuE3I/KemP5IXYSPuHjJYcHaQHUH4=; b=MbHODUJBg3OTTNMS7nXtw6k9+y
	F2/cnyzf50B8+zkYntbE+E5aeALSfxhRMRWlwJINq/9uXkvhQczbQrLoChn/Ors5Sh2iGpjtQLFGW
	GiPo70KEFXDGlra+CRc2nUSTkVZ7a7aYmFP8lvHiFZqTLTcc7qEzxypS2Qzqmw0VuR+6wWcV+r1+K
	kwgK2Flc0K1fN8tHfM0viQnFMc3hjwjxdFVb60yxoNQZ1GEmxpxuKymoHhREkMt9WnfEl3wzxgStJ
	WKoH34wJo46mirN9cX9OfZzVj/Q8Gbynfes5oEiYyB8rlJrHA7bRx874KIpm8qScFjph3wFDRXL8s
	Q9j3B0hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nF7Tv-00E9DS-SH; Wed, 02 Feb 2022 04:42:59 +0000
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nF7Ti-00E99u-F9
 for linux-riscv@lists.infradead.org; Wed, 02 Feb 2022 04:42:48 +0000
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id D1C185C0184;
 Tue,  1 Feb 2022 23:42:40 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 01 Feb 2022 23:42:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; bh=9Fu1L53JHD2BEq
 uVl2Vb9y1iwWCLUhaDxYdzJpr+2wE=; b=BDVSa4hqtdY7r/REsB0e0BXP8Hasa6
 CbaqI+zUOXhJu05PbU0qhSifaba0XAfh5BJ57upqgxkH9fv5KdnZH/ogZB9DQTFr
 wALf6OIjsl+LRi6HLrCNBg+BNN7whGyT84FqcXdNEhMAam0grHWjyWUAmXP59nwU
 Le3QNF7AhiMsYjiqveZGNK/E9e2P+RoqQErRJzL+FeoyOkabxXwsunfIQ5p7gT8q
 8/x5217dGqiAP7FLKE+xdfOySoQzq+bd328eyE3xNq8ga0hANxfihNrdKshu6O/4
 4Wd3J3JpkDjeOZQb4yTSG0fLRPK/TrUZFsdOZnKZTV15kJbx1K8yQ81g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=9Fu1L53JHD2BEquVl2Vb9y1iwWCLUhaDxYdzJpr+2
 wE=; b=l7KNIHbrNbXzv+IWa2surYD6hdI0IJKWRHWB9fWYNUA1idZSiCTnE5MFR
 0BWPpRp8VhcXtFH11dQql2RPXx9xITjfXLMjWqcqkYV4kV3AWVcbYLzVW/iqEQNF
 qU4JRe/IJEYw8eBCMjzA7XIsv5u/g8iNBg7fMqouVOZLwGURBm1meJ/ttjh+H41U
 y1EA0f+Kk58PEW0Pi6x9yzQF+/9Fqyb6cV+Zqnuj7j0/+myzefH3pZS+R7qzw74f
 4JssGBJjdGiaUzfZeHI47iJTMv4fGQtm+U/tk8XJ6xf6aBpct6goEzLpu+516NTk
 K/iDlqAbUGEdCi6xTn5fODtMk5vaQ==
X-ME-Sender: <xms:wAv6YfmkX_C2NBCj6HdyDD3Ir4MQw1mdmqDUv3HQokxCNSy1q8xV2w>
 <xme:wAv6YS0Qc5KbUUKVCUTzC7NIeBXlm7qF44ZSZ16WpxARR6acqhU4My_VACCiIzT3_
 U62SwQ0mlQnUy77fA>
X-ME-Received: <xmr:wAv6YVqpYqI1lWztmNXamkecB0CZBhWO3PQy-P6fDl97hm-PsorqhoIYBJkNiL5KEpHumDqtiChlMuxpVPpkwQDxuSxKkWYxBo8taemFARPSEs0vY1U_I3G3UQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgeeggdeilecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefuvfhfhffkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpeetteffjeefhfegtdduledutdegudffleduueeftddvlefgieffveef
 hfdukeegvdenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghn
 ugdrohhrgh
X-ME-Proxy: <xmx:wAv6YXljBDhCAtteqD95c67VcXf6h8e1iK3JzYX1RgjG4RbRu7lbaw>
 <xmx:wAv6Yd3UDKk7klR5igU7bXlI87p5Ek9zdki3rOfBUmEjekRykVdG6A>
 <xmx:wAv6YWvMV-Rybu2E3cwjLvkIwEDgyKAHm3NGLfs0_QOGOv0BmOCiOQ>
 <xmx:wAv6Yan_JDwM8TA2yRtJOg34nYyInzX53zBXGbZtKKgv0kYGOE8ixQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Feb 2022 23:42:39 -0500 (EST)
Subject: Re: [PATCH V7 2/2] irqchip/sifive-plic: Fixup thead,c900-plic DT
 parse missing
To: guoren@kernel.org
Cc: anup@brainfault.org, maz@kernel.org, tglx@linutronix.de,
 palmer@dabbelt.com, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 Guo Ren <guoren@linux.alibaba.com>
References: <20220130135634.1213301-1-guoren@kernel.org>
 <20220130135634.1213301-3-guoren@kernel.org>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <5b59a816-a1a2-1e75-9c78-8bc9be18f70d@sholland.org>
Date: Tue, 1 Feb 2022 22:42:39 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20220130135634.1213301-3-guoren@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220201_204246_675731_5C64AAA4 
X-CRM114-Status: GOOD (  13.77  )
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

On 1/30/22 7:56 AM, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> The thead,c900-plic has been used in opensbi to distinguish
> PLIC [1]. Although PLICs have the same behaviors in Linux,
> they are different hardware with some custom initializing in
> firmware(opensbi).
> 
> Qute opensbi patch commit-msg by Samuel:
> 
>   The T-HEAD PLIC implementation requires setting a delegation bit
>   to allow access from S-mode. Now that the T-HEAD PLIC has its own
>   compatible string, set this bit automatically from the PLIC driver,
>   instead of reaching into the PLIC's MMIO space from another driver.
> 
> [1]: https://github.com/riscv-software-src/opensbi/commit/78c2b19218bd62653b9fb31623a42ced45f38ea6
> 
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Cc: Anup Patel <anup@brainfault.org>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Samuel Holland <samuel@sholland.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> ---
>  drivers/irqchip/irq-sifive-plic.c | 1 +
>  1 file changed, 1 insertion(+)

Tested-by: Samuel Holland <samuel@sholland.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
