Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 994EBC369AB
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Apr 2025 12:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FWgeI/dvnCYttN6wbH9s3/R5Qhtg5OTfnfXKxjuDWHc=; b=npvoVV2oYIao2T
	TiXHQa8UQD9pHBTnudn64JRRe40DzIuNIXptYk6c0KdB5VnK+LF04jIKwwfYkZmuhem+KtFYX4up2
	4eWzBWkpQsqta45FmI34GWzjADUBrkGqB1y4eTRtRqmj/7ZFy5m9ZQZ2y4ro7vS6K1ssg4BlXESOt
	bzJdWPtmw+6MsK2Pk5gF/Pp6poFEKt/xTt/dzmZ9S3ks+em7zIb/6CCd2aJ8EdotzQBKv2HK7VPVw
	8vIKuYui5IS4OqtzsIiqxI3ZI02RRLU93TnuFgwAR2Ed9nf4aCrnWUH+iSXHcSB+929wiKBR1BjtJ
	Psfen4KVoN62EWR94MQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4fW6-00000005lZU-15Yb;
	Tue, 15 Apr 2025 12:35:54 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4f89-00000005fVv-04qs
	for linux-riscv@lists.infradead.org;
	Tue, 15 Apr 2025 12:11:10 +0000
Received: by mail-io1-xd35.google.com with SMTP id ca18e2360f4ac-85b4170f1f5so197706539f.3
        for <linux-riscv@lists.infradead.org>; Tue, 15 Apr 2025 05:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744719068; x=1745323868; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CmptmweS7lJ6GHE2wFUYE+JWDVLKYqz8ucpeUP/DcRA=;
        b=MxzMr9QZKWsgc+haaYlE7wjnNpDv/tkLPwyEXGLZ4ESvp8DvEUlFgph8sx1EjzJ37F
         FFTGld1j1ddIsky6K2GmPvhsoB1vRq6JqGLu77F/Jwnwf6UQ6AY9YVORJ8e9tere0dFs
         pdrCcvYrVj2rrM46BIZEuFNuFyEKvhevzjGBFJVLDW1KA91aaWf+FVVHNXRjiiNmMEu4
         gl4zKmZ4rzlqCOfzGrobJzLv/32tmK71vApLbzbu6+VPneYvXJO0ZG7U+nF32u4MFPSZ
         utNP5x9Q0I1QNLY2ZaHaDEyN2g/NfRL7GwXkM/c9jkn5Dr09kSC09tStTMxzX/5msc6r
         0pug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744719068; x=1745323868;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CmptmweS7lJ6GHE2wFUYE+JWDVLKYqz8ucpeUP/DcRA=;
        b=uvOHzxLtt5Hod/y0LCWAvTS+ccSwE5eM4+s0YwSHsEDV1m0ZtUkDTSx4f4i3vznq13
         WKBviqd8BF0fLAXKMsogItgVAfvBO3aiXMw+Nr29hTyc5ifKnphZcOrypHzA65X65LKi
         u2lCJqPxSa1VbIJNm2LQcNiDnem8wxxvkKwuPMxYYOpGlNVnYA+PfsLg4Z3i87Pi7yh6
         nEEcBe3cun7uQJ/B5mVaFO/42BNOj2CWp+Vw2CB+pISphI0lN7oyE2e7ovFdFGXurEQE
         MX1GqOsb3kVtClayhVTKRH9gFrjKCf25ftuMb5LA2NPwCJqU6bWf3dUs0WJF77uHWR7m
         NAmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgvm9Q27Ae11meBqFG3ItU3zosy/moavhwidg5e4hAMslmI/bmCmU036rfCUBGpw0lomwycZOgqRbbtQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxq0bQH+rN1yWx38zAMe1X4CrFZpU+2BUDQUWQA1oRPMoCFPckQ
	DJFWU4CGNs4H2SB1Op8wczsUReAqMSUE8zDFVDWKJL4mbiaoERO0NAittN0lMDY=
X-Gm-Gg: ASbGnctoz5WJF+IRLeJ7KLWGwRsBUY+1W0ljTeAvTSYWem+8wHmodRtOfdpa5xgE1vw
	HyN3dqVs6GWXor113izS0yaGjyyS/BCSVyXNmEDzwKSxcsNLV4yVAIUmbkz/BREfo1IH4XkT4gE
	WWEylxO1hLv91aRo2AWJvVvbmZAQuZyG+TUgKwM3akcgcRYcvWTXdi2KFJcXKFisWc4iYwvlm0n
	aKN1m3uRDyuAqKWlmjiK2l+naDF9lcpgws8bzDph+wcWkx27gXWQB9OoGHWuqLjXsMt2OGKKDvY
	ji0s4tzQwIDz9/oZiZB5+gQGIukc28ml7bcD15VMoqSQo4DOzFdiKZpFT8lBo3yyZ6QBLyFYOis
	2mCXp
X-Google-Smtp-Source: AGHT+IHJ1Ly5q6h/cItnEzYwsEqY15X2cujDF4x9G+IO1L2NReprTYetKPX12tqvaoe5ju58AuPTaw==
X-Received: by 2002:a05:6e02:441c:10b0:3d8:975:b808 with SMTP id e9e14a558f8ab-3d80975bb69mr22117655ab.5.1744719067875;
        Tue, 15 Apr 2025 05:11:07 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d7dba66fcbsm33384565ab.9.2025.04.15.05.11.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 05:11:07 -0700 (PDT)
Message-ID: <0bbd2842-72bc-47a7-832a-fc8833163e32@riscstar.com>
Date: Tue, 15 Apr 2025 07:11:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] dt-bindings: pwm: marvell,pxa: add optional property
 resets
To: Yixun Lan <dlan@gentoo.org>, Guodong Xu <guodong@riscstar.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Conor Dooley <conor@kernel.org>,
 ukleinek@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, drew@pdp7.com, inochiama@gmail.com,
 geert+renesas@glider.be, heylenay@4d2.org, tglx@linutronix.de,
 hal.feng@starfivetech.com, unicorn_wang@outlook.com,
 duje.mihanovic@skole.hr, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20250411131423.3802611-1-guodong@riscstar.com>
 <20250411131423.3802611-2-guodong@riscstar.com>
 <20250411-confider-spinster-35f23040d188@spud>
 <89b6142bacecd4a7742341b88dc1e28c4454527a.camel@pengutronix.de>
 <CAH1PCMZnJDcYKJR35WirQT95hte0NWvGBe4fjDuyZEgagvunAA@mail.gmail.com>
 <20250415101249-GYA30674@gentoo>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250415101249-GYA30674@gentoo>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_051109_056990_285F0D9C 
X-CRM114-Status: GOOD (  18.07  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gNC8xNS8yNSA1OjEyIEFNLCBZaXh1biBMYW4gd3JvdGU6Cj4gSGkgUGhpbGlwcCwKPiAKPiBP
biAxNzo1NCBUdWUgMTUgQXByICAgICAsIEd1b2RvbmcgWHUgd3JvdGU6Cj4+IE9uIFR1ZSwgQXBy
IDE1LCAyMDI1IGF0IDQ6NTPigK9QTSBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4
LmRlPiB3cm90ZToKPj4+Cj4+PiBPbiBGciwgMjAyNS0wNC0xMSBhdCAxNzo0NCArMDEwMCwgQ29u
b3IgRG9vbGV5IHdyb3RlOgo+Pj4+IE9uIEZyaSwgQXByIDExLCAyMDI1IGF0IDA5OjE0OjE1UE0g
KzA4MDAsIEd1b2RvbmcgWHUgd3JvdGU6Cj4+Pj4+IEFkZCBhbiBvcHRpb25hbCByZXNldHMgcHJv
cGVydHkgZm9yIHRoZSBNYXJ2ZWxsIFBXTSBQWEEgYmluZGluZy4KPj4+Pj4KPj4+Pj4gU2lnbmVk
LW9mZi1ieTogR3VvZG9uZyBYdSA8Z3VvZG9uZ0ByaXNjc3Rhci5jb20+Cj4+Pj4+IC0tLQo+Pj4+
PiAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wd20vbWFydmVsbCxweGEtcHdt
LnlhbWwgfCAzICsrKwo+Pj4+PiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPj4+
Pj4KPj4+Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9w
d20vbWFydmVsbCxweGEtcHdtLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvcHdtL21hcnZlbGwscHhhLXB3bS55YW1sCj4+Pj4+IGluZGV4IDllZTE5NDZkYzJlMS4uOTY0
MGQ0YjYyN2MyIDEwMDY0NAo+Pj4+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvcHdtL21hcnZlbGwscHhhLXB3bS55YW1sCj4+Pj4+ICsrKyBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9wd20vbWFydmVsbCxweGEtcHdtLnlhbWwKPj4+Pj4gQEAgLTMx
LDYgKzMxLDkgQEAgcHJvcGVydGllczoKPj4+Pj4gICAgIGNsb2NrczoKPj4+Pj4gICAgICAgbWF4
SXRlbXM6IDEKPj4+Pj4KPj4+Pj4gKyAgcmVzZXRzOgo+Pj4+PiArICAgIG1heEl0ZW1zOiAxCj4+
Pj4KPj4+PiBEbyBhbnkgb2YgdGhlIGN1cnJlbnRseSBzdXBwb3J0ZWQgZGV2aWNlcyB1c2UgYSBy
ZXNldD8gSWYgbm90LCB0aGVuIGFkZAo+Pj4+IHRoaXMgaW4gdGFuZGVtIHdpdGggdGhlIG5ldyBj
b21wYXRpYmxlIGFuZCBvbmx5IGFsbG93IGl0IHRoZXJlIHBsZWFzZS4KPj4+Cj4+PiBBbHNvLCBp
ZiBzcGFjZW1pdCxrMS1wd20gY2FuIG5vdCB3b3JrIHdpdGhvdXQgdGhlIHJlc2V0IGJlaW5nCj4+
PiBkZWFzc2VydGVkLCBtYXJrIGl0IGFzIHJlcXVpcmVkLgo+IAo+IElmIEkgaW5lcnByZXQgY29y
cmVjdGx5LCBvbmx5IHJlc2V0IHJlcXVpcmVzIGV4cGxpY2l0bHkgYmVpbmcgZGUtYXNzZXJ0ZWQs
Cj4gbmVlZCB0byBtYXJrIGFzIHJlcXVpcmVkPyB0aGF0J3MgYmVpbmcgc2FpZCwgaWYgcmVzZXQg
Y29tZXMgb3V0IGFzIGRlLWFzc2VydGVkCj4gICBieSBkZWZhdWx0IGFmdGVyIHBvd2VyIHJlc2V0
LCB0aGVuIG5vdCBuZWNlc3Nhcnk/Cj4gKGluIG90aGVyIGNhc2VzLCBzb21lIGRldmljZSBibG9j
ayBpcyBpbiBhc3NlcnRlZCBzdGF0ZSBieSBkZWZhdWx0KQoKV2UgY2FuIG9mdGVuIGJlbmVmaXQg
ZnJvbSB0aGUgc3RhdGUgdGhhdCB0aGUgYm9vdCBsb2FkZXIgaGFzIGxlZnQKdGhpbmdzIGluLCBi
dXQgSSB0aGluayBpdCdzIGJldHRlciBub3QgdG8gYXNzdW1lIGl0IGlmIHBvc3NpYmxlLgpJIHN1
cHBvc2UgaXQgbWlnaHQgbm90IGJlIHJlcXVpcmVkIHRob3VnaC4KCkFueXdheSwgdGhlIHJlc2V0
IGxpbmUgaXMgYXZhaWxhYmxlIHRvIHVzZTsgd2h5IG5vdCByZXF1aXJlIGl0PwoKCQkJCQktQWxl
eAoKPiB0aGFua3MKPj4+Cj4+Cj4+IFRoYW5rIHlvdSBQaGlsaXBwLiBzcGFjZW1pdCxrMS1wd20g
Y2FuIG5vdCB3b3JrIHdpdGhvdXQgdGhlIHJlc2V0Lgo+PiBJIHdpbGwgYWRkIHRoYXQgaW4gdGhl
IG5leHQgdmVyc2lvbi4KPj4KPj4gLUd1b2RvbmcKPj4KPj4+IFRoZSBkcml2ZXIgY2FuIHN0aWxs
IHVzZSByZXNldF9jb250cm9sX2dldF9vcHRpb25hbC4KPj4+Cj4+PiByZWdhcmRzCj4+PiBQaGls
aXBwCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
