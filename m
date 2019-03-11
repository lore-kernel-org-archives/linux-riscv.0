Return-Path: <SRS0=WyFe=RO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C804C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Mar 2019 18:29:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 319BA20657
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Mar 2019 18:29:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ph7+wOsO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 319BA20657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bRLQemOaBc/Pk2qzves95XiNgbvRLEjjEVsTLU5BMEI=; b=Ph7+wOsOonaYBUfgOlMLpNutD
	qUghANUh69P8hikuqRMoviFMZc0Xoex4z3HQGsAm5Kz2dJ1GANTloVQs8XgE9o9qlSIL0kkRq4bSd
	P4oZC9mQ2CRdkuz14uwz4ERod11t2N82KYD8+gBaZ1sAAgEbaRGD1ogzMp3FGpmQef4NtNqFSs2pE
	Zmz05Wi19DewhYbIpqaBL2OUmLUd5fnzF/zTHqcMttp8aakPkuZKHlnsjPXBcPMsaGAUzKAaGSk+B
	2qSvxJt0UHxOIqkP/5rEoMjRo7vpVte8mm+ySGoaXrzK8se7Xiqz/20nJa55JcGMbkgC3QVDBaI4C
	UoKRhmIyA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3Pfv-00018G-3T; Mon, 11 Mar 2019 18:29:23 +0000
Received: from mailgate-2.ics.forth.gr ([139.91.1.5])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3Pfm-0000v9-EE; Mon, 11 Mar 2019 18:29:16 +0000
Received: from av1.ics.forth.gr (av3in [139.91.1.77])
 by mailgate-2.ics.forth.gr (8.14.4/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 x2BISdx7004303; Mon, 11 Mar 2019 18:28:41 GMT
X-AuditID: 8b5b9d4d-90dff7000000235c-e0-5c86a8d6e0ce
Received: from enigma.ics.forth.gr (webmail.ics.forth.gr [139.91.1.35])
 by av1.ics.forth.gr (SMTP Outbound / FORTH / ICS) with SMTP id
 2E.8E.09052.6D8A68C5; Mon, 11 Mar 2019 20:28:39 +0200 (EET)
Received: from webmail.ics.forth.gr (localhost [127.0.0.1])
 by enigma.ics.forth.gr (8.15.1//ICS-FORTH/V10.5.0C-EXTNULL-SSL-SASL) with
 ESMTP id x2BISbRP014201; Mon, 11 Mar 2019 20:28:37 +0200
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Mon, 11 Mar 2019 20:28:37 +0200
From: Nick Kossifidis <mick@ics.forth.gr>
To: Pintu Agarwal <pintu.ping@gmail.com>
Subject: Re: ssh session with qemu-arm using busybox
Organization: FORTH
In-Reply-To: <CAOuPNLgobR4ejPs_ZUuXpRwkURH0sfb1LD27TKhGg=wrwhUvZg@mail.gmail.com>
References: <CAOuPNLgobR4ejPs_ZUuXpRwkURH0sfb1LD27TKhGg=wrwhUvZg@mail.gmail.com>
Message-ID: <2c5d240eabdb56913f4abcc9aacf2b6b@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.1.2
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrLLMWRmVeSWpSXmKPExsXSHc2orHt9RVuMwcc+eYurT34xWUw88JDd
 YtPja6wWl3fNYbPY9rmFzeL6y2ksFsd7d7A4sHvsnHWX3WPRr0SPzUvqPZ5c28zk8XmTXABr
 FJdNSmpOZllqkb5dAlfGhHmvmAs+C1c0ntjB3MDYx9/FyMkhIWAi8XbGNeYuRi4OIYEjjBIT
 T7axgySEBA4xSrz9VQBRZCoxe28nI4jNKyAocXLmExYQm1nAQmLqlf2MELa8RPPW2cwgNouA
 qkTng+2sIDabgKbE/EsHwepFBDQkdk37xAqyjFmghUni1vt7YEXCQFc8fdAFZvMLCEt8unsR
 zOYUCJR4v7CVBeKgAIktCzcyQxzhIrF150NmiONUJD78fgB2tKiAssSLE9NZJzAKzUJy6ywk
 t85CcusCRuZVjAKJZcZ6mcnFemn5RSUZeulFmxjBkTDXdwfjuQX2hxgFOBiVeHgdittihFgT
 y4orc4EBw8GsJMKbVwUU4k1JrKxKLcqPLyrNSS0+xCjNwaIkznv4RXiQkEB6YklqdmpqQWoR
 TJaJg1OqgdFkWc/JhZHWl8IOlkXPKJN9WHgtvXqbjL3bPf15nd4qE35brlphI/Hc7lagy/3D
 32acrGrKnvmq+eSKhEuW7zWK/ZrOHRYIqfrHsfxwil9m4rvg9SFTq0MtNvgeehoib7245lfS
 z28nMoLiN09kOG7upz7B1m/DEwvuUJ5IF+FLz36Gz+hS/qzEUpyRaKjFXFScCACgdBZFgAIA
 AA==
X-Greylist: inspected by milter-greylist-4.6.2 (mailgate-2.ics.forth.gr
 [139.91.1.5]);
 Mon, 11 Mar 2019 18:28:42 +0000 (GMT) for IP:'139.91.1.77' DOMAIN:'av3in'
 HELO:'av1.ics.forth.gr' FROM:'mick@ics.forth.gr' RCPT:''
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mailgate-2.ics.forth.gr [139.91.1.5]); Mon, 11 Mar 2019 18:28:42 +0000 (GMT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190311_112914_847946_3F450AA2 
X-CRM114-Status: GOOD (  12.84  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: kernelnewbies@kernelnewbies.org, qemu-devel@nongnu.org,
 open list <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?=EC=A0=84=EC=A7=84=EC=98=81?= <jy0.jeon@gmail.com>,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

zqPPhM65z4IgMjAxOS0wMy0xMSAxNjozNCwgUGludHUgQWdhcndhbCDOrc6zz4HOsc+IzrU6Cj4g
SGksCj4gCj4gSSBoYXZlIGEgcWVtdS1hcm0gc2V0dXAgd2l0aCBidXN5Ym94IHdoaWNoIEkgbm9y
bWFsbHkgdXNlIHRvIHRlc3QgbXkKPiBrZXJuZWwgY2hhbmdlcy4KPiBJIHVzZSB0aGlzIGNvbW1h
bmQgdG8gYm9vdCBpdDoKPiAKPiBRRU1VLUFSTSQKPiBxZW11LXN5c3RlbS1hcm0gLU0gdmV4cHJl
c3MtYTkgLW0gMTAyNE0gLWtlcm5lbAo+IC4uL0tFUk5FTC9saW51eC9hcmNoL2FybS9ib290L3pJ
bWFnZSAtZHRiCj4gLi4vS0VSTkVML2xpbnV4L2FyY2gvYXJtL2Jvb3QvZHRzL3ZleHByZXNzLXYy
cC1jYTkuZHRiIC1pbml0cmQKPiByb290ZnMuaW1nLmd6IC1hcHBlbmQgImNvbnNvbGU9dHR5QU1B
MCByb290PS9kZXYvcmFtIHJkaW5pdD0vc2Jpbi9pbml0Cj4gaXA9ZGhjcCIgLW5vZ3JhcGhpYyAt
c21wIDQKPiAKPiBUaGlzIGluY2x1ZGVzLCBteSBvd24gY3VzdG9tIGtlcm5lbCBhbmQgcm9vdGZz
IGJ1aWxkLgo+IEZvciByb290ZnMgSSB1c2UgYnVzeWJveCBhbmQgY3JlYXRlIGNwaW8gaW1hZ2Ug
YW5kIHVzZSBpdCBhcyBpbml0cmQuCj4gCj4gQnV0LCBldmVyeSB0aW1lLCBpZiBJIGhhdmUgdG8g
Y29weSBzb21lIGZpbGVzIGluc2lkZSBxZW11LCBJIG5lZWQgdG8KPiBjcmVhdGUgY3JlYXRlIHJv
b2ZzIGltYWdlLgo+IFRoaXMgaXMgcGFpbmZ1bC4KPiAKPiBTbywgbm93IEkgYW0gZXhwbG9yaW5n
IGhvdyB0byB0cmFuc2ZlciBmaWxlcyBmcm9tIG15IHVidW50dSBwYyB0bwo+IHFlbXUtc2Vzc2lv
biB1c2luZyAic3NoIi4KPiBJIGtub3cgdGhpcyBpcyBwb3NzaWJsZSwgYnV0IEkgYW0gc3RpbGwg
bm90IHN1Y2Nlc3NmdWwsIGFuZCBiaXQgbGF6eQo+IHRvIGV4cGxvcmUgdGhlc2UuCj4gCj4gSSBh
bSBzdXJlLCBtYW55IG9mIHlvdSBwZW9wbGUgd291bGQgaGF2ZSBleHBsb3JlZCBhbHJlYWR5ICJo
b3cgdG8gdXNlCj4gc3NoIG92ZXIgcWVtdSIgYW5kIGZvdW5kIGEgZWFzeSBtZXRob2QuCj4gU28s
IGlmIGFueWJvZHkgaGF2ZSBlYXN5IHNldHVwIHBsZWFzZSBzaGFyZSB3aXRoIG1lLgo+IAo+IEkg
Y291bGQgc2VlIHRoYXQgYWZ0ZXIgYWRkaW5nICJpcD1kaGNwIiBJIGdldCB0aGUgZXRoMCBpbnRl
cmZhY2UgbGlrZSAKPiB0aGlzOgo+IC8gIyBpZmNvbmZpZwo+IGV0aDAgICAgICBMaW5rIGVuY2Fw
OkV0aGVybmV0ICBIV2FkZHIgNTI6NTQ6MDA6MTI6MzQ6NTYKPiAgICAgICAgICAgaW5ldCBhZGRy
OjEwLjAuMi4xNSAgQmNhc3Q6MTAuMC4yLjI1NSAgTWFzazoyNTUuMjU1LjI1NS4wCj4gICAgICAg
ICAgIFVQIEJST0FEQ0FTVCBSVU5OSU5HIE1VTFRJQ0FTVCAgTVRVOjE1MDAgIE1ldHJpYzoxCj4g
ICAgICAgICAgIFJYIHBhY2tldHM6MiBlcnJvcnM6MCBkcm9wcGVkOjAgb3ZlcnJ1bnM6MCBmcmFt
ZTowCj4gICAgICAgICAgIFRYIHBhY2tldHM6MiBlcnJvcnM6MCBkcm9wcGVkOjAgb3ZlcnJ1bnM6
MCBjYXJyaWVyOjAKPiAgICAgICAgICAgY29sbGlzaW9uczowIHR4cXVldWVsZW46MTAwMAo+ICAg
ICAgICAgICBSWCBieXRlczoxMTgwICgxLjEgS2lCKSAgVFggYnl0ZXM6MTE4MCAoMS4xIEtpQikK
PiAgICAgICAgICAgSW50ZXJydXB0OjIyCj4gCj4gbG8gICAgICAgIExpbmsgZW5jYXA6TG9jYWwg
TG9vcGJhY2sKPiAgICAgICAgICAgaW5ldCBhZGRyOjEyNy4wLjAuMSAgTWFzazoyNTUuMC4wLjAK
PiAgICAgICAgICAgVVAgTE9PUEJBQ0sgUlVOTklORyAgTVRVOjY1NTM2ICBNZXRyaWM6MQo+ICAg
ICAgICAgICBSWCBwYWNrZXRzOjAgZXJyb3JzOjAgZHJvcHBlZDowIG92ZXJydW5zOjAgZnJhbWU6
MAo+ICAgICAgICAgICBUWCBwYWNrZXRzOjAgZXJyb3JzOjAgZHJvcHBlZDowIG92ZXJydW5zOjAg
Y2FycmllcjowCj4gICAgICAgICAgIGNvbGxpc2lvbnM6MCB0eHF1ZXVlbGVuOjEwMDAKPiAgICAg
ICAgICAgUlggYnl0ZXM6MCAoMC4wIEIpICBUWCBieXRlczowICgwLjAgQikKPiAKPiBCdXQgSSBj
b3VsZCBub3QgcGluZyBpdCBmcm9tIHVidW50dSBQQy4KPiAKPiAKPiBSZWdhcmRzLAo+IFBpbnR1
Cj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBs
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgoKWW91IG1heSB1c2UgdGhlIGhvc3RmdyBhcmd1bWVudCBvbiBxZW11LCBlLmcuLi4KCi1uZXRk
ZXYgdXNlcixpZD11bmV0LGhvc3Rmd2Q9dGNwOjoyMjIyLToyMiBcCi1uZXQgdXNlciBcCgphbmQg
eW91ICdsbCBnZXQgZ3Vlc3QncyBwb3J0IDIyIHRvIGJlIGZvcndhcmRlZCB0byBob3N0cyBwb3J0
IDIyMjIsIHNvIAp5b3UgY2FuIGRvCgpzc2ggcm9vdEBsb2NhbGhvc3Q6MjIyMgoKZnJvbSB0aGUg
aG9zdC4KClJlZ2FyZHMsCk5pY2sKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
