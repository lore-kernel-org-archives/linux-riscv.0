Return-Path: <SRS0=edRZ=VX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54BEAC7618F
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 26 Jul 2019 22:21:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24C6D22BF5
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 26 Jul 2019 22:21:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NRi6u5I0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="I7L/iwUU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24C6D22BF5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=o2dxsv3O0DZ7FgNLwDwWVbth2hRMsY7c5CC1vnVlKUo=; b=NRi6u5I0MocfjcUW8nFsqn+mG
	NCViuff3ccPbxB5vwtDHOAYLKC55Dw/8gefKq/1FCjJQNpjC4XKe8RmTJ6cnbs+MyTw6SiIFSxo8w
	d4VVPpopyalRMNL/KyHsX0ZkYbBzeHciccqHli1ryqRO0QQFnywTVMXP0MLHkhncUBjb2bhs/E/Q4
	3wyMoJwEKimUNNiPe8gVaiIKI0h8eUQx6FAp/2IUmvDQTbR7YArgobBoF+qWh371AekXCIDRqTl+t
	XMzboEot5+5l6d730HSrX0ISvSQL44N3WtCu4nrpWAqrHzPkfzarM25cBxFLzYjyyUuqmI8l/iU60
	craOs7Egw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hr8a9-0005aq-Pr; Fri, 26 Jul 2019 22:20:57 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hr8a6-0005a6-9d
 for linux-riscv@lists.infradead.org; Fri, 26 Jul 2019 22:20:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1564179655; x=1595715655;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=2Pp7soz5T65+2MFGSxtLJF8/y1h3Zy8XLJbl/hXcT98=;
 b=I7L/iwUU9Vh91q99LoxMhs326cH+PTJNzbytq9HP1FOxAb/psIbgH1CD
 qsrVtdS8WYlo179FimsIGiMAu4a2DELzThGlIRYf2Z5iqVc2GAz7C/FlO
 vSpNJ/TGfGWQ9oJaN+3BoDRBelXdTxHVstgr2rltR53WsE0R+3WZYyKzL
 VgOF/rwl2N1SgotQY2axpXEvkVp4o4sQ7VpgJE8NWux+pLr6ZZmEImTlj
 NHV3mPk5Mpugx456ogQfjG/WdgzxKl/b1EqgeJ4AEaJZgt3vbLxPoI3Ar
 iHOf0+EhWgmuk2giPW9UJINRXc18wL+0HS0sMgdc9m2JZPsEEUPCweIOh Q==;
IronPort-SDR: whdlgktyc2IJ2YXmL++owbJHDg//SueMdo76/en8eQI6aFrNLZ5RYWTEZmznVaCr8FZBEuXbhX
 o6a0kJk9xReKFt4bVwctjOJ7QIZcSVcz3YbXxKDaIylUkWp4pFbLfrAqDANIOtmZvTbSyK3Bm2
 fXK00AzjcEgmR1B0j0mdVxWBe6FY/SZLsFPc2X9mC56c+pLFQXMnfO0z/ciB95sGI+LbwQLMNx
 3H4pLV3YJThrkCVdyC/4qfv3sQUuJZVzZ3PNXfDPnNqfwTHOhoY5G0YjS0xaAbFkxbgDgEdqd0
 xh0=
X-IronPort-AV: E=Sophos;i="5.64,312,1559491200"; d="scan'208";a="114246583"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 27 Jul 2019 06:20:52 +0800
IronPort-SDR: 1qUBU7pqGQCBzH5UWhVv2coC/5nxJLOUHprNn600ktwvEzjBWIUMlHzbfxxvP43yFXBRvYYnLc
 q56KfSbP7QxCZHi1tqGI+qveqgu0mzZ/RRyGrHOyUleK8FRCNpxtydF0je/nHCA39gH53/QVVA
 mmr3pUbQkiSjQHxsl4ALCJo0rPHAt5Z8lEDnuBJnZuagTFLzvuvSQ010i1+mht4uN0hN29rpQJ
 XAygg19ht56363TOgo9hz6veG7Qfve7rxSKI9lGaF5xMmYlmZpVEeBHlz4pp9Zk0VkHY1A0XFK
 ee9QjBTtnA31Abv4BX1vjwq5
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP; 26 Jul 2019 15:19:00 -0700
IronPort-SDR: DTvqt9Mfx3sEEJcaEIx2FzJIgmQZ2mIv8hWErAdPzRFMdP8MEQzAeRV/QyvsCeRPRd2OXjP7h1
 R5ZcVL7wgYNM/8gkkzOacIbRzpp/FRBnOST3Ily25tSBf7loEKaXkgRK7T23DqAwMooO0TxvoO
 xrb6+4c0kBv5ZzD9Uv4ZSosSoW8ld/+z3IlmYo2nc57WLNikT60H/TKXaM/9x701mObj1g1bgA
 nNwGP5ZN4ut/H4GcPqBuphfvr2IjI2GJsS9+xBio/aHuG804X+YShuM6HmLZALhiSQgEklZGG2
 yw0=
Received: from unknown (HELO [10.225.104.231]) ([10.225.104.231])
 by uls-op-cesaip01.wdc.com with ESMTP; 26 Jul 2019 15:20:51 -0700
Subject: Re: [PATCH 3/4] RISC-V: Support case insensitive ISA string parsing.
To: Paul Walmsley <paul.walmsley@sifive.com>
References: <20190726194638.8068-1-atish.patra@wdc.com>
 <20190726194638.8068-3-atish.patra@wdc.com>
 <alpine.DEB.2.21.9999.1907261346560.26670@viisi.sifive.com>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <a8a6be2c-2dcb-fe58-2c32-e3baa357819c@wdc.com>
Date: Fri, 26 Jul 2019 15:20:47 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.9999.1907261346560.26670@viisi.sifive.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190726_152054_377034_4924EA91 
X-CRM114-Status: GOOD (  11.60  )
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
Cc: Anup Patel <Anup.Patel@wdc.com>, Alan Kao <alankao@andestech.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Johan Hovold <johan@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 7/26/19 1:47 PM, Paul Walmsley wrote:
> On Fri, 26 Jul 2019, Atish Patra wrote:
> 
>> As per riscv specification, ISA naming strings are
>> case insensitive. However, currently only lower case
>> strings are parsed during cpu procfs.
>>
>> Support parsing of upper case letters as well.
>>
>> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> 
> Is there a use case that's driving this, or 

Currently, we use all lower case isa string in kvmtool. But somebody can 
have uppercase letters in future as spec allows it.


can we just say, "use
> lowercase letters" and leave it at that?
> 

In that case, it will not comply with RISC-V spec. Is that okay ?

> 
> - Paul
> 


-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
