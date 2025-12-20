Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CF7AE668AA
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Dec 2025 02:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6l9jfiJehSYBHXJxAX3ahQp4fGdTGU7gOj8FpqaW9xk=; b=GMK05ImlTNQppM
	WxPogW3XonIiR80SYBaIGoe1FoxEkBSqUxQa8HbF+1bbn2wOtQbJEmBYF0EpnDQFLyMkSlGKwZuao
	sH0U8XFW3UuLs/cv5B7VC4/bNARCNHBCBvTUVdT9u7+mlIYC4jRiKO4GcyQsRCv+ts/Rc9EIevc0i
	2rllGFdkaCxFnnZ8U85S2Xpl9rfb/SDnnBYl2L7f1O1kenItD6ukF4PWak90t6WSECIdDP6CPpPx9
	eG42IyPElHwwSGjV8+Jd7yHOugMsdToe4sgjWkyPY1nsnk3nfZ+q3HK6TSVYlDB32KEvgvBDn7Atk
	xsCS4/0RzkEsPyf27Y8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWmcO-0000000BCsw-0V6J;
	Sat, 20 Dec 2025 02:22:52 +0000
Received: from mail112.out.titan.email ([34.197.244.225])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWmcM-0000000BCsW-0XzD
	for linux-riscv@lists.infradead.org;
	Sat, 20 Dec 2025 02:22:51 +0000
Received: from localhost (localhost [127.0.0.1])
	by smtp-out.flockmail.com (Postfix) with ESMTP id 4dY7Tx6mLbz7t7x;
	Sat, 20 Dec 2025 02:22:45 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; bh=JA1g3A8Xw4RwgUl+aqKsaPm/4mDhUSopl/gOGEe81ck=;
	c=relaxed/relaxed; d=ziyao.cc;
	h=to:cc:subject:in-reply-to:date:references:mime-version:from:message-id:from:to:cc:subject:date:message-id:in-reply-to:references:reply-to;
	q=dns/txt; s=titan1; t=1766197365; v=1;
	b=ISk3k5a/OBtuHmc32uvplAcgxep4/WELQxL199oGAwOkAzuDamgsGmv2IZs34FlKG0wy+aU4
	0Odiov//ITBie5M2NJGbpT3vmiYLkFHpbTZTkoibwCq3aZ6mnlIwrG79KOtiVcH9TdTRY1ceiol
	ke/HUZoAkUFhUPWLK1NfJS1w=
Received: from pie (unknown [117.171.66.90])
	by smtp-out.flockmail.com (Postfix) with ESMTPA id 4dY7Tt4nMVz7t7b;
	Sat, 20 Dec 2025 02:22:42 +0000 (UTC)
Date: Sat, 20 Dec 2025 02:22:30 +0000
Feedback-ID: :me@ziyao.cc:ziyao.cc:flockmailId
From: Yao Zi <me@ziyao.cc>
To: Yixun Lan <dlan@gentoo.org>, Iker Pedrosa <ikerpedrosam@gmail.com>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Johannes Erdfelt <johannes@erdfelt.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 1/2] riscv: dts: spacemit: Add i2c buses on OrangePi RV2
Message-ID: <aUYIZkLmbxNXw3fF@pie>
References: <4acfc5d8-d8d9-4c9b-99eb-09c7b82ddd04@rootcommit.com>
 <aUDwDkd8k_4gD1yc@pie>
 <29600710-fc66-41d0-b399-1b635d0789d9@rootcommit.com>
 <CABdCQ=Orw0ULhPm43rAhS_iqqNYU4nChcPCqh8UdFhJUumVG5w@mail.gmail.com>
 <1626d445-fa7b-4527-b1d9-4d141d8b5ee5@rootcommit.com>
 <20251217221004.GD31109@sventech.com>
 <d5917806-56db-4945-b336-89bd1027f613@rootcommit.com>
 <e1cb227b-a55e-4962-b7e1-b540ba92012c@rootcommit.com>
 <CABdCQ=N4eZyBNBrhOQsW7jSeJmr=xhicwW8fskOAioV1q9cC5A@mail.gmail.com>
 <20251219112924-GYB1955339@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251219112924-GYB1955339@gentoo.org>
X-F-Verdict: SPFVALID
X-Titan-Src-Out: 1766197365741083818.30087.8443268963949404032@prod-use1-smtp-out1002.
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.4 cv=a8/K9VSF c=1 sm=1 tr=0 ts=69460875
	a=rBp+3XZz9uO5KTvnfbZ58A==:117 a=rBp+3XZz9uO5KTvnfbZ58A==:17
	a=kj9zAlcOel0A:10 a=MKtGQD3n3ToA:10 a=CEWIc4RMnpUA:10
	a=xs44MPHeUmOknF4M2gQA:9 a=CjuIK1q_8ugA:10 a=3z85VNIBY5UIEeAh_hcH:22
	a=NWVoK91CQySWRX1oVYDe:22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_182250_428258_87E43363 
X-CRM114-Status: GOOD (  16.69  )
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

On Fri, Dec 19, 2025 at 07:29:24PM +0800, Yixun Lan wrote:
> Hi Iker,
> 
> thanks for pushing this, I have few comments
> 
> On 10:49 Thu 18 Dec     , Iker Pedrosa wrote:
> > Hi Michael, Yao, Javier, Johannes,
> > 
> > Thanks everyone for the great discussion and the guidance.

...

> > 2. Extend the pinctrl driver: support is needed for switching the SD
> > voltage pins from 3.3V to 1.8V.
> we probably could leave pinctrl for now or take a look at it later when
> really necessary,  the default pin settings should work for most cases,
> besides, vendor is also starting to drop two pinctrl state implementation
> (the normal vs fast ..)
> 
> for 3.3v to 1.8v switch, there is one MMC1_IO_REG to control it, and
> we do need to implement a _voltage_switch() function
> and it's in another aib io space..

Note the MMC1_IO_REG (0xd401_e81c) stays right in the Pad Configuration
region (0xd401_e000, length 0xc00) as stated in the address mapping of
TRM.

So it's not another io space, it's right the pin controller. This makes
me believe it's an undocumented pinctrl register, in which case it's
pretty natural to implement the switch logic through pinctrl interface.

Seems I forgot to mention one thing: there are mysterious "asfar" and
"assar" registers in APBC region which are written 0xbaba and 0xeb10
during voltage switch process.

I've looked through the TRM and found they aren't documented, either.
But handling of them should be easy, since the whole APBC region is
registered as a syscon, though it will still be helpful to know their
effects...

Regards,
Yao Zi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
