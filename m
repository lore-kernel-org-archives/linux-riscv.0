Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53544C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jun 2022 06:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:References:
	In-Reply-To:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BxtO/Q0nWipZdHRh5MNp5U87VuLwO2dOZ8aM+jbLaqI=; b=VqX29MpcDKXCzo
	s/8i63jnzVthu4PQTOeaYzvbhvtkKgk2KOfNHuEVT2Uh2UdnFX+jX9cwzG4UBEOOsLWVR6PFovIOO
	cNrm9PNiCTHAnaYyf/sDKKgo1SPmTZnORwaPGktKz/KBhohaF4+MBiZiBg5cErWvcQxXpVwASwjvv
	IQ4LVfXY5fsNoWtmfeM4oTbhQnd+IEQBb9CG0/Q1FRFpZN89Ab454TD7K/SNN1H9mECQIOcl6EYda
	J/eu/yxpGZdjRB4B0N+q2kJEWw7YshTvd+vUyIqzQveXoFjTNErLXEuhwOgdgbvV1zVKw0kmx7uMH
	8dxZmbp7MZFatLeBBppg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1jRJ-000tI7-R8; Thu, 16 Jun 2022 06:57:13 +0000
Received: from m1524.mail.126.com ([220.181.15.24])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1jNh-000rDK-8n
	for linux-riscv@lists.infradead.org; Thu, 16 Jun 2022 06:53:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=5cTfm
	ODNb8lH6Wzhj3ugO3wV8oQYCCfXEhOaU7VUNVo=; b=MW3tQ5qE4hCyAEUMDRCag
	tspZif1FKg7XhQSDGJLS1PK/zU2PWeJJcOUwVziZ1MhiE4rBUY2G4T7hgGBMjj4I
	iv9oVjaCWuQRphwjZEZlHIn+p1pDevX1Y2YGpNhN8VQK5XnKT30cVYjMbJEmW6OE
	tnfwrBJzzN0i+9BReperxo=
Received: from windhl$126.com ( [124.16.139.61] ) by ajax-webmail-wmsvr24
 (Coremail) ; Thu, 16 Jun 2022 14:52:58 +0800 (CST)
X-Originating-IP: [124.16.139.61]
Date: Thu, 16 Jun 2022 14:52:58 +0800 (CST)
From: "Liang He" <windhl@126.com>
To: Conor.Dooley@microchip.com
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	lkp@intel.com
Subject: Re:Re: [PATCH v2] soc: sifive: (sifive_l2_cache) Add missing
 of_node_put()
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20220113(9671e152)
 Copyright (c) 2002-2022 www.mailtech.cn 126com
In-Reply-To: <fe1c23cf-dab4-d926-ffef-7a8a5489a071@microchip.com>
References: <20220616044915.3978097-1-windhl@126.com>
 <28cd6700.3e2d.1816b13f1fa.Coremail.windhl@126.com>
 <fe1c23cf-dab4-d926-ffef-7a8a5489a071@microchip.com>
MIME-Version: 1.0
Message-ID: <3098748e.4883.1816b495c44.Coremail.windhl@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: GMqowAAnLydL06pijBA3AA--.9807W
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbiuBQiF2JVj47iXgABsS
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_235331_979196_9B74FFFC 
X-CRM114-Status: UNSURE (   7.11  )
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



At 2022-06-16 14:26:17, Conor.Dooley@microchip.com wrote:
>On 16/06/2022 06:54, Liang He wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>> 
>> At 2022-06-16 12:49:15, "Liang He" <windhl@126.com> wrote:
>>> In sifive_l2_init(), of_find_matching_node() will return a node pointer
>>> with refcount incremented. We should use of_node_put() in each fail path
>>> or when it is not used anymore.
>>>
>>> Reported-by: kernel test robot <lkp@intel.com>
>>>
>>> Signed-off-by: Liang He <windhl@126.com>
>>> ---
>> 
>> 
>> Sorry, please ignore this version as it still has a bug.  I will have a strict check and compile the code before my next commit.
>
>While you're at it - drop the Reported-by too.
>You only need to include that if LKP found a problem with
>a patch that's been applied already. If it's on something
>in progress, just fix what it pointed out & resend.
>
>Thanks,
>Conor.
>


Thanks for all your help, Conor.

I will make a proper patch considering all things you suggested.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
