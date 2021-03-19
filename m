Return-Path: <SRS0=wr6O=IR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A6B2C433DB
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Mar 2021 08:52:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A828964D9D
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Mar 2021 08:52:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A828964D9D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=StXfdkkNV0GUTi2pcf/08cBzYFlyJFpJr5ca3L/LMhs=; b=O76Lc85xy+lHwFtKsJSRAwHuF
	6k1EV4Mv1lwnATbFPdfec7OnGQ5tKTxpCjnTpgNLTrgZlNdDYzDLOH5sZscn0glvtSw1I0+FJkbD5
	zYx2XKwNvi6sDiz0UNDYnEGMeIT6g2QnXx/Z4XstHfVSLs/ppxFmKa0u4EVJYkhwPOD9HsLiJHlEY
	xaLJH1jmE+tCIM55iXZDmDD2xaeKZJ0XpZv3ZLo8uLSwAr0w/thBP4C9xIKSlSQQ2YZOGBMxO7T1z
	36r8BTNzkxZM+h12KaU1hgk72eCxWfZvBPEfBRlh2GljRvPrjJ1FdY9l2FFdsKzsK1qOTSnKAeDE6
	xhEwk26Tg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lNArs-006u8A-JD; Fri, 19 Mar 2021 08:52:28 +0000
Received: from mail-out.m-online.net ([212.18.0.10])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lNArN-006u4B-1v
 for linux-riscv@lists.infradead.org; Fri, 19 Mar 2021 08:51:58 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4F1yLf4vCtz1ryXl;
 Fri, 19 Mar 2021 09:51:54 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4F1yLf1zZYz1sP6g;
 Fri, 19 Mar 2021 09:51:54 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id MpU8k5-xFkaL; Fri, 19 Mar 2021 09:51:53 +0100 (CET)
X-Auth-Info: DlswMWnw3C8i5v/0U2HHpEfL8e7xsZsM+rvbYAK5w1NvYv1+pMZ11EtmPpv8SaHo
Received: from igel.home (ppp-46-244-191-242.dynamic.mnet-online.de
 [46.244.191.242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Fri, 19 Mar 2021 09:51:53 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
 id D5DAF2C3171; Fri, 19 Mar 2021 09:51:52 +0100 (CET)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Yixun Lan <yixun.lan@gmail.com>
Cc: Claudiu.Beznea@microchip.com,  linux-riscv@lists.infradead.org,
 ckeepax@opensource.cirrus.com,  andrew@lunn.ch,  w@1wt.eu,
 Nicolas.Ferre@microchip.com,  daniel@0x0f.com,
 alexandre.belloni@bootlin.com,  pthombar@cadence.com,
 netdev@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: macb broken on HiFive Unleashed
References: <87tupl30kl.fsf@igel.home>
 <04a7e801-9a55-c926-34ad-3a7665077a4e@microchip.com>
 <87o8fhoieu.fsf@igel.home>
 <CALecT5gY1GK774TXyM+zA3J9Q8O90UKMs3bvRk13yg9_+cFO3Q@mail.gmail.com>
X-Yow: I wonder if I should put myself in ESCROW!!
Date: Fri, 19 Mar 2021 09:51:52 +0100
In-Reply-To: <CALecT5gY1GK774TXyM+zA3J9Q8O90UKMs3bvRk13yg9_+cFO3Q@mail.gmail.com>
 (Yixun Lan's message of "Fri, 19 Mar 2021 08:28:06 +0000")
Message-ID: <87h7l77cgn.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210319_085157_389581_0FD3DC79 
X-CRM114-Status: UNSURE (   8.12  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTcOkciAxOSAyMDIxLCBZaXh1biBMYW4gd3JvdGU6Cgo+IHdoYXQncyB0aGUgZXhhY3Qgcm9v
dCBjYXVzZT8gYW5kIGFueSBzb2x1dGlvbj8KClRyeSByZXZlcnRpbmcgdGhlIGZpdmUgY29tbWl0
cyBzdGFydGluZyB3aXRoCjczMjM3NGEwYjQ0MGQ5YTc5Yzg0MTJmMzE4YTI1Y2QzN2JhNmY0ZTIu
CgpBbmRyZWFzLgoKLS0gCkFuZHJlYXMgU2Nod2FiLCBzY2h3YWJAbGludXgtbTY4ay5vcmcKR1BH
IEtleSBmaW5nZXJwcmludCA9IDc1NzggRUI0NyBENEU1IDRENjkgMjUxMCAgMjU1MiBERjczIEU3
ODAgQTlEQSBBRUMxCiJBbmQgbm93IGZvciBzb21ldGhpbmcgY29tcGxldGVseSBkaWZmZXJlbnQu
IgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
