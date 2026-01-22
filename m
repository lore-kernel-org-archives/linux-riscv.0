Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D6BC44500
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 10:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q7iY7pZu3lW9xaiBt/ZR7wbCHk43ZEsqy6LLQ6vrNTM=; b=AkkmoSIu97oJ69
	bUWntENMHEjdL9Z18yMWpC4IQx6RZAPjQPlpfinDzoBAw9LsCYFeAG39YV/lXIU4enbpqRbjAcIBo
	4yBA9XTviqyz2dAESqzqRApMgbSAFKWxN6ua6JMUlyhBJKXTR+601AO5kifmISmFvdpJRvfEbmp1K
	IbtUDX4lcTyrX0dnXM+kAbTI47VMosrBr87wabgTBpfa7qzEK8+j6S2QULeJPxnHFW2L6/OMka/Z2
	cykT4LIaAgeIa9NaBIV3U112/wDmvVphMG4GxNgJazrd15MPL4DwRQa0q65WB0aYAM6tdajMkUBNI
	dAqIM7xd+omwx/gnsnMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vis5v-00000006rDO-06IR;
	Thu, 22 Jan 2026 10:39:19 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vis5r-00000006rCU-2hM3
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 10:39:18 +0000
Received: from [10.213.20.167] (unknown [210.73.43.101])
	by APP-03 (Coremail) with SMTP id rQCowABnhdxK_nFpSZlDBg--.20370S2;
	Thu, 22 Jan 2026 18:39:07 +0800 (CST)
Message-ID: <5639ff0c-dfd1-4528-a0ce-92d3c457ce64@iscas.ac.cn>
Date: Thu, 22 Jan 2026 18:39:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2] net: spacemit: Clarify stat timeout comments and
 messages
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Yixun Lan <dlan@gentoo.org>,
 Chukun Pan <amadeus@jmu.edu.cn>,
 Michael Opdenacker <michael.opdenacker@rootcommit.com>,
 netdev@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260121-k1-ethernet-clarify-stat-timeout-v2-1-76ff1a1168d9@iscas.ac.cn>
 <20260121200439.64c22125@kernel.org>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <20260121200439.64c22125@kernel.org>
X-CM-TRANSID: rQCowABnhdxK_nFpSZlDBg--.20370S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CryxGw48ZF47tF17KF4Durg_yoW8XF4fpa
	1IgwsxGF1xtrWkXrsrtw10qFyYvw1vqa43ury3KryDtF15XrZa9r1FkrZ0kFZrZ393u3yj
	qr42gFyv9FsrZa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Ib7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY
	1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE14v_Gw1l42xK82IYc2Ij64vIr41l4I8I3I0E4I
	kC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWU
	WwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr
	0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWU
	JVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJb
	IYCTnIWIevJa73UjIFyTuYvjxUgd-PDUUUU
X-Originating-IP: [210.73.43.101]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_023916_068066_CBEF61C9 
X-CRM114-Status: GOOD (  16.14  )
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

On 1/22/26 12:04, Jakub Kicinski wrote:
> On Wed, 21 Jan 2026 10:17:18 +0800 Vivian Wang wrote:
>> This patch isn't a fix for the problem per se, since it is hardware
>> behavior. The new message and comments, however, should direct those
>> running into this on new hardware towards a fix.
> Is it not possible to improve the situation?

Maybe I should have made it clearer, but this comment and messages
improvement was proposed by Andrew in the linked thread [1].

As an aside, saying that made me realize this patch should be:

Suggested-by: Andrew Lunn <andrew@lunn.ch>

> Is the refclock disappearing because of power saving?
> Or because the link is down?

I'm not really well-versed in what's allowed from the PHY here, but at
least the Motorcomm and Realtek PHYs seem to only stop this clock while
the link is down. So from what I can tell it's PHY stopping the clock
because of power saving for when the link is down. I'm not sure how that
should translate into an answer to your question here...

> Because if it's the latter we should be able to skip reading the stats
> when link is down (still racy but better than waiting in cases we can
> detect?)

If checking the link is definitely up as a condition for updating stats
would be acceptable, then maybe the original patch from the linked
thread [2] can also be adopted?

Vivian "dramforever" Wang

[1]: https://lore.kernel.org/r/48757af2-bbea-4185-8cc9-2ef51dbc8373@lunn.ch/
[2]: https://lore.kernel.org/r/20260118100000.224793-1-amadeus@jmu.edu.cn/


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
