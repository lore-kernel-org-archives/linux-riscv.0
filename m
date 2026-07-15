Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA85CC44507
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2026 10:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=hWHh5FQxAN/3uf/F+DeFlTwMjx4gaidjqhBbM6c2QW0=; b=X7KvQ7TMJbWrzqNGWcrkOxU8co
	5hxDw/mVAU2b60v9IeRrNA2YHO7kqQPZx25mKfJD7RX21lo9QdxubT9a1kkGhHPQiuy7nY2j8l16A
	aLmzsEhFHiye/NDctO+X9p9FCjJKYOa/A5P0iOteP2/UUL+yXOJDX1pET7058tWw3vEgP6iMZxjVn
	XfsNl7GZjKzDCm4ovv36IwBUlt7jEDiPXTI25DDJhGcQYx0/npyEKaUHRGnoKNJnHQDPmScNTfW+4
	1NlDGMrPHG9hiV9KhiD0L0l+ywl8Qrv6pHlXQufVn7q0U+1rSuD9vv4O0ISwT7M54GIPTsVXTHjrw
	kVSk0t7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjwcr-0000000EPle-2Z2e;
	Wed, 15 Jul 2026 10:14:01 +0000
Received: from fout-a3-smtp.messagingengine.com ([103.168.172.146])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjwco-0000000EPjj-46bm;
	Wed, 15 Jul 2026 10:14:00 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id B34E3EC01F0;
	Wed, 15 Jul 2026 06:13:57 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Wed, 15 Jul 2026 06:13:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1784110437;
	 x=1784196837; bh=Gu9zw8RR2Cmhp5RnOK+0qu8XOtAv+L3E2BPrnjRUzAk=; b=
	xV5+RR4pDt0UViS7EXROvKgdzfemK4kJs/mc/M4kEeEhQn3yuUIbGHuZscTSw8l5
	zrQkJU+ngMoDVdLtq+qfR4qKI7dBrik/7fCMvc36+MRSPlVdfsncsjON9K9QmiTq
	e2dCk/vQoyZrBrqwUiqwAPKW7RjZUX7TG9eL6Z0Otvjuus0eez3LegPT/LO5HYIo
	4YgEyIj/SNBby5WXCPYxR+dx6dmJ68OTgCYXlzDXHwzHDcMomhuF1rvr6MD2RIpP
	hVb+VomZ/lKEE/T2nWb8nChL+qarxcjdD3aulkvwfRUZFJwaUWlVomHCPqX6oaSB
	SnhwXr23Ha7a27yVvejl6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784110437; x=
	1784196837; bh=Gu9zw8RR2Cmhp5RnOK+0qu8XOtAv+L3E2BPrnjRUzAk=; b=b
	YEn7OOof0QUF6qWo8cPh9eDHxrPJn/D33ZVC23wXoRhggqcEzF1kAfaotBQ1Nz5z
	kMMTrPf7A9GrDySSFlsRlgqs+YLznLmXb0wkoE7CpTKZhAqMftWTbazQ2n9KFnGE
	tCad1ono7TPVxiVBOztuvZnmsn6Mfi9KK1+x7RzoM0kLCUcMQUg8faMrnSECSwyL
	GHXh55WjUjd/VP+B1SLaXAAjC5wvwrPs+w1QWaN7cA5w3Od8ODqufaFq2kBuBXVs
	ulE6lpsIikZJCqdSNVcfOezBX+r0QsZZuTq1ovWqXdqesqJDIlN6LHBjdznTB3Ss
	lqNSI2SFiCD4Ut7fVRT1A==
X-ME-Sender: <xms:ZF1XakRqZTH7wv1ZcRAvW2VWX-BDNvbi4Xp9vkAFPyLV7tMveE0PPw>
    <xme:ZF1Xaskq5u_i-PGWhwDmmkuKCuhj7BDLGgqNtP71NuE7eZvA5vcbwk5vvOS1YDxZf
    -SMw5MdRzxwkKcOwnuimQcHdmaezYJEytVlAIWNy2duQdht1QqddAs>
X-ME-Proxy-Cause: dmFkZTFLhEwUOOUSeE15S3w19zjkdTnAsNUBdeZx7QjdH/i+PYps0l7WyNVeJwiurKDuvo
    NgJyy+q0Y56GLBdscP8qD05J4sLi8nYcemPbel6b0753Xdv4ChYVvZxsltLQ8RkWUpXshF
    OjUg23v7wa8tpWy8tfxP1nnWJ1fJmuoj0LDWtTUi0AHe5jnjrku6BTu6DJKQzUT9xg1KA+
    6IrTZymLwYB7kkRY6GbT3zaZOiKepFB9jHKAXzmQJFgu9r0m6xmCcCTG3TAyiMvOiIXc9z
    Ohxb0rTiqtaZ75qL1bxitFDtCJ/gQGz3/Kk7RTtsY6PsTVkSuXMKDd04xxwol5viKVoKXh
    5NKqNrWowQd2J+Htud9T5mig4KvREhwaTJ3n30FIat1siB44W8OcIz19Ge4gCrW7Oz8UBZ
    1C/YcqkSwbB/FPQcsE8mvto3ckIXwjmSzVSBh9CYRNSuaHZYLEfBTEH03HduFpFCDVO53A
    jagUk0oEXngNZB8CGr61JJHYxdWFECeXd9if5e3EbdG1eE0NH7960PqmKkKfu6sWO6fPt4
    YQ7dYkop3El95uNGDIVwb3zmtaGVQik5MEIUClDFCDsUux2S88w3uNwKrKEWhXRL+3vXEq
    LMt2VWNOmTG5FUNNA+SUhigUmkz3Ay1qdf8jGHr25FMqf3hZceUjqlGeygtQ
X-ME-Proxy: <xmx:ZF1Xamqvn0dSlc6OKp74fshXHrxVhXUYQZ3JVNFpL8VDOOpGgOLE6w>
    <xmx:ZF1Xagwb8fD0pDUjqYAaJ3-oRpY8fFKBvpxLgWcL80JJJpaWOcK2_g>
    <xmx:ZF1XanCYT7QkpsDd333iBz2crSePeHcEn-zcKAuFZEjohHLVUDt_xA>
    <xmx:ZF1XavMidYNHjdaV8L3n5tPqA4AcDSBzKSoMqjSeyLxNoL_HEaYFqw>
    <xmx:ZV1XatutlieSAZZxBaUy3rH_MgAXR1gL-pzhmiShjrI00JyMl41re_g2>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 72D39182007E; Wed, 15 Jul 2026 06:13:56 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AjbDdkWFEQuV
Date: Wed, 15 Jul 2026 12:13:06 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 "Thomas Gleixner" <tglx@kernel.org>
Cc: "Andy Lutomirski" <luto@kernel.org>,
 "Vincenzo Frascino" <vincenzo.frascino@arm.com>,
 "Nathan Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Daniel Lezcano" <daniel.lezcano@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>, "Marc Zyngier" <maz@kernel.org>,
 "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
 "Huacai Chen" <chenhuacai@kernel.org>, "WANG Xuerui" <kernel@xen0n.name>,
 Linux-Arch <linux-arch@vger.kernel.org>, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 loongarch@lists.linux.dev
Message-Id: <ee62c755-a15a-41e8-b0bb-7595e9366977@app.fastmail.com>
In-Reply-To: <20260715102751-d1ed7195-f541-484e-9843-73ee4237b7b5@linutronix.de>
References: <20260709-vdso-arch-clockmodes-v1-0-3fd780bbf851@linutronix.de>
 <20260709-vdso-arch-clockmodes-v1-3-3fd780bbf851@linutronix.de>
 <87wluwoe1c.ffs@fw13>
 <20260715102751-d1ed7195-f541-484e-9843-73ee4237b7b5@linutronix.de>
Subject: Re: [PATCH 3/7] MIPS: csrc-r4k: Replace CONFIG_GENERIC_GETTIMEOFDAY ifdeffery
 with IS_ENABLED()
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_031359_311350_13FA50FA 
X-CRM114-Status: GOOD (  12.26  )
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

T24gV2VkLCBKdWwgMTUsIDIwMjYsIGF0IDEwOjQzLCBUaG9tYXMgV2Vpw59zY2h1aCB3cm90ZToK
PiBPbiBXZWQsIEp1bCAxNSwgMjAyNiBhdCAxMDoyNToxOUFNICswMjAwLCBUaG9tYXMgR2xlaXhu
ZXIgd3JvdGU6Cgo+PiAtI2lmZGVmIENPTkZJR19HRU5FUklDX0dFVFRJTUVPRkRBWQo+PiAgI2lu
Y2x1ZGUgPGFzbS92ZHNvL2Nsb2Nrc291cmNlLmg+Cj4+IC0jZW5kaWYgLyogQ09ORklHX0dFTkVS
SUNfR0VUVElNRU9GREFZICovCj4+ICBlbnVtIHZkc29fY2xvY2tfbW9kZSB7Cj4+ICAJVkRTT19D
TE9DS01PREVfTk9ORSwKPj4gLSNpZmRlZiBDT05GSUdfR0VORVJJQ19HRVRUSU1FT0ZEQVkKPj4g
KyNpZmRlZiBWRFNPX0FSQ0hfQ0xPQ0tNT0RFUwo+PiAgCVZEU09fQVJDSF9DTE9DS01PREVTLAo+
PiAgI2VuZGlmCj4+ICAJVkRTT19DTE9DS01PREVfTUFYLAo+PiAKPj4gYW5kIHRoZW4geW91IGNh
biBqdXN0IHVuY29uZGl0aW9uYWxseSBzZXQgY2xvY2tzb3VyY2U6OnZkc29fY2xvY2tfbW9kZQo+
PiBpbiBhbGwgZHJpdmVycy4KPj4gCj4+IE5vPwo+Cj4gSXQgd2lsbCB3ZWFrZW4gdGhlIHNhbml0
eSBjaGVjayBpbiBfX2Nsb2Nrc291Y2VfcmVnaXN0ZXJfc2NhbGUoKSBpZgo+IENPTkZJR19HRU5F
UklDX0dFVFRJTUVPRkRBWT1uLiBJIGFtIG5vdCBzdXJlIHdoYXQgdGhhdCBzYW5pdHkgY2hlY2sK
PiBpcyBzdXBwb3NlZCB0byBwcm90ZWN0IGFnYWluc3QsIHNvIEkgbGVmdCBpdCBhcyBpcy4KCklz
IHRoZXJlIHN0aWxsIGEgcmVhc29uIHRvIGV2ZW4gYWxsb3cgQ09ORklHX0dFTkVSSUNfR0VUVElN
RU9GREFZPW4Kd2hlbiAgZ2VuZXJpYyBWRFNPIGlzIGVuYWJsZWQ/IEkgc2VlIHRoYXQgbG9vbmdh
cmNoMzIgYW5kCnJpc2N2MzIgYXJlIHN0aWxsIG1pc3NpbmcgdGhlIHZkc28gdGltZSBzdXBwb3J0
LCBidXQgdGhhdCBtYXkKYmUgbW9yZSBhIHNpZ24gdGhhdCBub2JvZHkgY2FyZXMgZW5vdWdoIGFi
b3V0IHBlcmZvcm1hbmNlCm9uIHRob3NlIHRhcmdldHMuCgpJbiBwYXJ0aWN1bGFyLCByaXNjdjY0
IGRvZXNuJ3QgZXZlbiBidWlsZCB0aGUgdmRzbzMyIGNvZGUgZm9yCmNvbXBhdCB0YXNrcywgd2hp
Y2ggaW5kaWNhdGVzIHRoYXQgdXNlcnNwYWNlIGRvZXNuJ3QgYWN0dWFsbHkKbmVlZCB2ZHNvLiBP
biBsb29uZ2FyY2gzMiwgdGhlIGNvbW1pdCBhZGRpbmcgdGhlIHZkc28gc2FpZApHRU5FUklDX0dF
VFRJTUVPRkRBWSAnd2lsbCBiZSBzdXBwb3J0ZWQgaW4gZnV0dXJlJy4KCk9uIGV2ZXJ5dGhpbmcg
ZWxzZSwgR0VORVJJQ19HRVRUSU1FT0ZEQVkgYW5kIEhBVkVfR0VORVJJQ19WRFNPCmFyZSBhbHJl
YWR5IHN5bm9ueW1zLgoKICAgIEFybmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
