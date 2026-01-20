Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9851DD2ED11
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 04:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D6G+Kzxx/QukoRmRmAKms5UyEWfJzinYYUWgI7focGQ=; b=rvIc5IWjuGYYHf
	VZJDuA/gcK3wyL1iB4+nFzc2EqO32T8dLvGilJqFrV6FoPJopHSesKdATzaaj7aQ7MxA7sD6bp/dQ
	7x4j3NKIMOaKc0JiDKH+s3+D2HAM6uVlvmxDgEvkXgKRoZDdk6GBIVorlYcVthpeGunluB0g5fANT
	0j7rRspHUwDnXpfjoQGKsZ3gdpp5RDHZOjVQm+jdW4Rv6YmcxE9coO3VOdshRu9Wf9wNgGkPgdsTL
	ShlRrZCj+LWixF1luKVv1KYb2cfg4gaoPk+H3LhsLYz6+fdfgMMWIQwXExmvsmyXfooR6MsVhw9wC
	Wmk9rwsiuwBiNiOAHfTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi3BE-000000039xh-1ikR;
	Tue, 20 Jan 2026 04:17:24 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi3Ay-000000039m1-1woA
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jan 2026 04:17:14 +0000
Received: from [10.213.18.194] (unknown [210.73.43.101])
	by APP-05 (Coremail) with SMTP id zQCowAAXqg21AW9pXw+3BQ--.1431S2;
	Tue, 20 Jan 2026 12:16:54 +0800 (CST)
Message-ID: <f63d455c-7593-4382-86ef-9c31a1ebd283@iscas.ac.cn>
Date: Tue, 20 Jan 2026 12:16:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] net: spacemit: Check netif_carrier_ok when reading
 stats
To: Andrew Lunn <andrew@lunn.ch>, Chukun Pan <amadeus@jmu.edu.cn>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, dlan@gentoo.org,
 edumazet@google.com, kuba@kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org, pabeni@redhat.com,
 spacemit@lists.linux.dev
References: <e3890633-351d-401d-abb1-5b2625c2213b@iscas.ac.cn>
 <20260119141620.1318102-1-amadeus@jmu.edu.cn>
 <48757af2-bbea-4185-8cc9-2ef51dbc8373@lunn.ch>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <48757af2-bbea-4185-8cc9-2ef51dbc8373@lunn.ch>
X-CM-TRANSID: zQCowAAXqg21AW9pXw+3BQ--.1431S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KFy5KryruFyxJr18CryxuFg_yoW8WF1kpF
	43Kw4Fyr1kt3W0qF1Ika1DA3409rZ5tFy5Gr1Fg3s3Aa15Xr1Svr4fKrWjgFyUWryvgw1j
	vr1qvF4YvFWDAFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvvb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
	c7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjxUgHanUUUUU
X-Originating-IP: [210.73.43.101]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_201712_009790_6C563ABB 
X-CRM114-Status: GOOD (  14.81  )
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

On 1/19/26 23:09, Andrew Lunn wrote:
>> root@OpenWrt:~# ethtool -S eth1
>> [   71.725539] k1_emac cac81000.ethernet eth1: Read stat timeout
>> NIC statistics:
>>      rx_drp_fifo_full_pkts: 0
>>      rx_truncate_fifo_full_pkts: 0
>>
>> I just discovered that adding "motorcomm,auto-sleep-disabled" to disable
>> the sleep mode of the MotorComm PHY prevents the problem from occurring.
> This suggests that when the PHY stops the reference clock, the MAC
> hardware stops working. It needs that clock to access
> statistics. Keeping the clock ticking will increase power usage a
> little.

As per suggestion from Chukun, adding realtek,aldps-enable to the DTS on
BananaPi F3 (with, obviously, a Realtek PHY) also reproduces this
problem. So this is a good indication that it really is a problem with
this power saving thing.

> I wounder if anything else stops working? There are some MACs whos DMA
> engine stop working without the reference clock. That can cause
> problems during both probe and remove, or open and close.

At least DMA reset seems to work in this case, so it's probably not as
big of a problem, but at least I would conclude that the HW design
didn't have the reference clock stopping in mind. AFAICT from the DTS
files a bunch of other boards also have motorcomm,auto-sleep-disabled so
at least SpacemiT isn't alone in this.

> So it would be nice to have a better understanding of this. If this
> turns out to be true, maybe a comment by this poll_read_timeout()
> indicating if it does timeout, the PHY might be the problem.

I'll send a patch updating the comments and error prints.

Thanks,
Vivian "dramforever" Wang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
