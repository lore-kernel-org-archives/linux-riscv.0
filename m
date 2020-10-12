Return-Path: <SRS0=BUIi=DT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEF94C433E7
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Oct 2020 02:32:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 643122072C
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Oct 2020 02:32:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qKEQHg/p"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 643122072C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NLSoPTCRSgPmGxmzPx05bTQjAKOWxfoXPLRkUUDd19s=; b=qKEQHg/pWDb2mfNRboQDzFbVG
	545FT2iU1sIFq/Y0SjvaZZ+NQNXwJoahksZ5XHDebvJpxasnfO5iAmA6ADwhJ/huvpALY1+AKWhKt
	Kobv00Ft12fF+DVfxiabZ/lVm6INiZqTxLCc0GW0G+iBP9VXq9rY5hNsEMn94RqdTXTe7iUpc0eTb
	nHOxZIIfIaAaFFT79LvPlZzF3wGqYApnWN+jZAfEDrtKOfyTVkv/kXBwq55ZpEMMsvxJKoEiSSH9K
	g1jq0I/ja5RG7dJoMsX/YKlM+Ez1npWZbELN00Zt6rD4forAXJ7nQvStCp4CnsrgbsAE3YXoS2HFl
	sRUXWyTqQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kRndV-0002Qs-0f; Mon, 12 Oct 2020 02:32:29 +0000
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kRndS-0002P7-20; Mon, 12 Oct 2020 02:32:28 +0000
Received: from [10.130.0.80] (unknown [113.200.148.30])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxr97yv4NfkbEcAA--.4007S3;
 Mon, 12 Oct 2020 10:31:16 +0800 (CST)
Subject: Re: [PATCH v5 00/14] irqchip: Fix potential resource leaks
To: Marc Zyngier <maz@kernel.org>
References: <1593998365-25910-1-git-send-email-yangtiezhu@loongson.cn>
 <ab1cd9280c7892a0230945ef5ff0880c@kernel.org>
 <02e077df-7c4e-24a7-1640-5f17894bd252@loongson.cn>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <4b18d030-76c7-1b83-3b0d-deb8ecd925dc@loongson.cn>
Date: Mon, 12 Oct 2020 10:31:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <02e077df-7c4e-24a7-1640-5f17894bd252@loongson.cn>
X-CM-TRANSID: AQAAf9Dxr97yv4NfkbEcAA--.4007S3
X-Coremail-Antispam: 1UD129KBjvJXoWxJrW5Xw43tFyrCr4Duw47XFb_yoW8XF4DpF
 13t3WYkr4kX34qyFnFkw47Xa4Iy3yDK3yUWryYgrs3Aw1q9F1DWrWrtFyFkw4DWw1rGF42
 kws5t3s7Aw1jyaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9Eb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4
 vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40E
 FcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr
 0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY
 04v7Mxk0xIA0c2IEe2xFo4CEbIxvr21lc2xSY4AK67AK6r4UMxAIw28IcxkI7VAKI48JMx
 C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
 wI0_JrI_JrWlx4CE17CEb7AF67AKxVWrXVW8Jr1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2
 IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxK
 x2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
 AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8aYLPUUUUU==
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201011_223227_333266_97D8175C 
X-CRM114-Status: GOOD (  19.81  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Baruch Siach <baruch@tkos.co.il>,
 Heiko Stuebner <heiko@sntech.de>, Tony Lindgren <tony@atomide.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>,
 Sekhar Nori <nsekhar@ti.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Grant Likely <grant.likely@secretlab.ca>, Guo Ren <guoren@kernel.org>,
 linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org,
 David Lechner <david@lechnology.com>, Jisheng Zhang <jszhang@marvell.com>,
 linux-samsung-soc@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, Kukjin Kim <kgene@kernel.org>,
 u.kleine-koenig@pengutronix.de,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Jason Cooper <jason@lakedaemon.net>,
 Arnd Bergmann <arnd@arndb.de>, Rob Herring <rob.herring@calxeda.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Anup Patel <anup.patel@wdc.com>, linux-kernel@vger.kernel.org,
 Felipe Balbi <balbi@ti.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alban Bedel <albeu@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 09/02/2020 11:59 AM, Tiezhu Yang wrote:
> On 07/06/2020 03:30 PM, Marc Zyngier wrote:
>> On 2020-07-06 02:19, Tiezhu Yang wrote:
>>> When I test the irqchip code of Loongson, I read the related code of 
>>> other
>>> chips in drivers/irqchip and I find some potential resource leaks in 
>>> the
>>> error path, I think it is better to fix them.
>>>
>>> v2:
>>>   - Split the first patch into a new patch series which
>>>     includes small patches and add "Fixes" tag
>>>   - Use "goto" label to handle error path in some patches
>>>
>>> v3:
>>>   - Add missed variable "ret" in the patch #5 and #13
>>>
>>> v4:
>>>   - Modify the commit message of each patch suggested by Markus Elfring
>>>   - Make "irq_domain_remove(root_domain)" under CONFIG_SMP in patch #3
>>>   - Add a return statement before goto label in patch #4
>>>
>>> v5:
>>>   - Modify the commit messages and do some code cleanups
>>
>> Please stop replying to Markus Elfring, and give people who actually
>> care a chance to review this code. Elfring will keep asking you to make
>> absolutely pointless changes until you are blue in the face
>
> Hi Marc,
>
> Any comments?
> Could you please apply this patch series?

Hi all,

Maybe I should cc the related persons through ./scripts/get_maintainer.pl
to get Acked-by or Reviewed-by.

The cover letter link of this patch series is:
[v5,00/14] irqchip: Fix potential resource leaks
https://lore.kernel.org/patchwork/cover/1268043/

Any comments will be much appreciated.

Thanks,
Tiezhu

>
> Thanks,
> Tiezhu
>
>>
>>
>> Thanks,
>>
>>         M.
>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
