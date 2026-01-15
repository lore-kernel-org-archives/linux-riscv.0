Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1157D3CCB0
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 04:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=drEpKtBzLDTjDjoPbPAbjZlO7V1EuD3o1ebBKtNLApk=; b=BBvKXLYmgpcItg
	RdV9gui9iV7Bgh/Bx8v021P4wKimdqZ6SRG1nkwDHQJDq1dpHhPYtnIwqVrNxhmWNeVXntlik/jow
	6r/42LauEVPVIapYYK40pig+gfnwUO53fggjd3dyclx7Gbnjg+uV5UtYS+Ejz0FwQ8pTnLcS+uK7r
	D8FShcimCVwRFplyX/dG+q/1lG6LtsS1A2DAJw4DKPqNkxt9I4jkUrL80b1mDD0woEK/jtCvNeWjF
	gpXb7DnQZSXT6yduuyuiYTXdanRPOZNK82skJFwIJIke3N5nGlhnlkte+5HWkKPENaZR2CGbNwHHU
	EZJpGC8YxApRPlnxjCWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgFAQ-0000000BmTC-0tg7;
	Thu, 15 Jan 2026 04:41:06 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgFAN-0000000BmSs-0ZfM
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 04:41:05 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-7904a401d5cso5837797b3.3
        for <linux-riscv@lists.infradead.org>; Wed, 14 Jan 2026 20:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768452061; x=1769056861; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UHORsUrCGxhFKBEYnnmZVqnwkkEcReBR9XoRnnvUNsA=;
        b=skmf8rHwGrq0JX9VBAMvf7I52cBOpj7935/EQqAUIiArTKBwMsVE0fymsBcaNub4OD
         MQWaAX0E+Gl/1IwUtQiV23HCstYtwhTXJKKkzlgNsykK37mjKJ0eo6iqjETq0NZzwouQ
         CgyOiKoEOBDPE2/nMaK6cniDF9uyWTW/sa9CjtdqQJSKvJudW2Mdrf1jiSZ+tjp9nY0x
         eoN4KuSEtH7o8l4QOLbVXaewazyjGjFDbU/m/yP2M2Y3jVvraG6Fao8ALdtqDfwf4OZA
         S07PpTXStDXz8jeyeGdkEtP0lWfjxR+tefoW3Yd2PNfMOyy0zgeKLUs9k51uAkgRi//U
         1F3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768452061; x=1769056861;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UHORsUrCGxhFKBEYnnmZVqnwkkEcReBR9XoRnnvUNsA=;
        b=NC9aepQWf4NvqjShYGT1Rn94JYUd8WBa4Zpw+kE7o0ZaYsVTEC/tMegzYNWpZkRb1C
         8KvEnlMcOv/qGtSw7zU1G6Ix90eYUff446hkm23JGomu037ZStq6gt4+Vbttn9dz5sGz
         Chw+Z6CC6Kf0cOd5AIx+DR74lQymcV7qG6ssX9y4SmCrimkgB1w+nhAdrZuaPmOOW5Uj
         qhr3eqpI7LlilRjyes3qzMsLxnJj1hb3dGRtQc7wtjaSscz4qyEMcPevjSEWRfpWE75v
         +lTmJ1kY3Hhi1XTjK0AsPt/Z4KmUbUtPbG09IvUMBnNfitfeeBxL2951wUiEhDPPUSpI
         I1Fg==
X-Forwarded-Encrypted: i=1; AJvYcCVkdg/t0YJ58zsS8csmF/+X+EKMAx6LeTZbVrDBvNzKHn2eWQLL4yx74kkSw6sjbNd0sHmKuQ8I6PHLnA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywy/wCt7hOkOkE+g0am5jo4MdpP1v56Vx7SrlWniP32ZcOWe7gy
	4L/2tqGLcu4VhHRE3vXHnPZijdVec88vofcFtpVHYIOS78vFGe6kecLMJCZ+u8rTfaZdle6wS3n
	y1+0q7CkmrtV8DFuJgjgWlsQIZYKxYGf0uOABThQ5AZNxe/v8Xlb/p68=
X-Gm-Gg: AY/fxX5Ccy0nukfCMGIilGAwT4lsbHdyXe+SfXgTomZq4aGLpbXm7wQ5MA2YMJ1GYqS
	PQV/pK9TtGKXWlqRMec06qEmxzP6x6+4I06e1WCxr7/42eYx9QZpbsqI9ZW7UH6dJMWFXEH8Icr
	3IFsuCTTEbTQkR/8B7E7te6fKgnTwAXL9kZH4fJl9aNDLOfmjzNa4wFGO2Syg4BzO7QsKzQTLjY
	X1x2KYcslGAeC19GiirYDPLlq6dghY7kn5Nmt+UPhPG8vcWcqfuxsNa/9ZLeykQwHAotAlhnH2g
	GfXyzuSUZQPXH22a8SB7G+jVdURIzEe399Ao6A==
X-Received: by 2002:a05:690e:14c8:b0:644:4259:9b63 with SMTP id
 956f58d0204a3-64903b1d0e0mr3032668d50.41.1768452061481; Wed, 14 Jan 2026
 20:41:01 -0800 (PST)
MIME-Version: 1.0
References: <20260108-k3-reset-v2-0-457df235efe9@riscstar.com>
In-Reply-To: <20260108-k3-reset-v2-0-457df235efe9@riscstar.com>
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 15 Jan 2026 12:40:50 +0800
X-Gm-Features: AZwV_Qgg7yPvsd_zYkdWW175mtNGzIR7tHiFYjvfgqt1QtUiV4wnMaVSXFiifeg
Message-ID: <CAH1PCMa8kXx=5_3UrcbnJH21kQm13QdFeUcBDUboiCnACzbiVw@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] reset: spacemit: Add support for SpacemiT K3 SoC
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Haylen Chu <heylenay@4d2.org>
Cc: Alex Elder <elder@riscstar.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_204103_435015_FEC66788 
X-CRM114-Status: GOOD (  21.95  )
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

SGksIFBoaWxpcHAKCk9uIFRodSwgSmFuIDgsIDIwMjYgYXQgMTA6MjLigK9QTSBHdW9kb25nIFh1
IDxndW9kb25nQHJpc2NzdGFyLmNvbT4gd3JvdGU6Cj4gVGhpcyBwYXRjaHNldCBpcyBiYXNlZCBv
biB2Ni4xOS1yYzQgYW5kIGRlcGVuZHMgb24gdGhlIEszIGNsb2NrIGRyaXJ2ZXIKPiBwYXRjaHNl
dCBbM10gYW5kIHRoZSBLMSBjb21tb24gY2xvY2sgd29yayBbMl0gYW5kIFsxXToKPgo+IExpbms6
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI1MTIxOTAxMjgxOS40NDA5NzItMS1pbm9j
aGlhbWFAZ21haWwuY29tLyBbMV0KPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21s
LzIwMjYwMTA4LTA2LWsxLWNsay1jb21tb24tdjQtMC1iYWRmNjM1OTkzZDNAZ2VudG9vLm9yZy8g
WzJdCj4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDI2MDEwOC1rMy1jbGst
djUtMC00MmExMWI3NGFkNThAZ2VudG9vLm9yZy8gWzNdCgpJIGFtIHdyaXRpbmcgdG8gdXBkYXRl
IHRoZSBzdGF0dXMgb2YgdGhlc2UgZGVwZW5kZW5jaWVzLgoKVGhlIGNsb2NrIHBhdGNoZXMgaGF2
ZSBiZWVuIGFjY2VwdGVkIGFuZCBhcmUgbm93IHByZXNlbnQgaW4gbGludXgtbmV4dAooc2luY2Ug
bmV4dC0yMDI2MDExMykuCgpUbyBmYWNpbGl0YXRlIHRoZSBtZXJnaW5nIG9mIHRoaXMgcmVzZXQg
ZHJpdmVyLCBZaXh1biBMYW4gaGFzIGNyZWF0ZWQgYW4KaW1tdXRhYmxlIHRhZyB3aXRoaW4gaGlz
IHB1bGwgcmVxdWVzdCB0byB0aGUgY2xvY2sgc3Vic3lzdGVtLiBBcyBub3RlZAppbiBoaXMgUFIg
WzVdOgoKPiBQbGVhc2UgcHVsbCBTcGFjZW1pVCdzIGNsb2NrIGNoYW5nZXMgZm9yIHY2LjIwLCBU
aGlzIFBSIGJhc2ljYWxseSBhZGRzCj4gc3VwcG9ydCBmb3IgU3BhY2VtaVQgbmV3IEszIFNvQywg
d2hpbGUgZG9pbmcgdGhpcyBJJ3ZlIGNyZWF0ZWQgYW4gaW1tdXRhYmxlCj4gdGFnIChzcGFjZW1p
dC1jbGtyc3QtdjYuMjAtMykgZm9yIHJlc2V0IGRyaXZlciBpbiBjYXNlIGl0IGFsc28gbmVlZHMg
dG8gYmUKPiBtZXJnZWQgZHVyaW5nIHNhbWUgbWVyZ2Ugd2luZG93LCBvdGhlcndpc2UgZXZlcnl0
aGluZyBpcyBub3JtYWwuCgpTaW5jZSB0aGUgZGVwZW5kZW5jaWVzIGFyZSBub3cgYXZhaWxhYmxl
IHZpYSB0aGlzIGltbXV0YWJsZSB0YWcsIGFyZSB0aGVyZQphbnkgZnVydGhlciBjb21tZW50cyBv
biB0aGlzIHNlcmllcywgb3Igc3RlcHMgSSBzaG91bGQgdGFrZSB0byB1dGlsaXplIHRoYXQKdGFn
IGZvciBhIHYzPwoKVGhhbmsgeW91LgoKTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvc3Bh
Y2VtaXQvMjAyNjAxMTQwOTI3NDItR1lDNzkzMzI2N0BnZW50b28ub3JnLyBbNV0KCkJlc3QgcmVn
YXJkcywKR3VvZG9uZwoKCgoKPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvY2Mx
Y2I4MzMtMmM0YS00ZTIwLWE1MGQtMTA5YTQ5MTllMjc0QHJpc2NzdGFyLmNvbS8gWzRdCj4KPiBD
aGFuZ2VzIGluIHYyOgo+ICAtIFBhdGNoIDE6Cj4gICAgICBVcGRhdGUgdGhlIGNvbW1pdCBtZXNz
YWdlIHRvIGV4cGxhaW4gdGhlIHdoeS4KPiAgICAgIFVwZGF0ZSB0aGUgc3BhY2VtaXQsazEtc3lz
Y29uLnlhbWwgdG8gcG9pbnQgdG8gazMgcmVzZXQgSURzCj4gICAgICBoZWFkZXIgZmlsZS4KPiAg
LSBQYXRjaCAzOgo+ICAgICAgVXNlIGRldi0+ZHJpdmVyLT5vd25lciBmb3IgdGhlIHJlc2V0IGNv
bnRyb2xsZXIgb3duZXIgaW5zdGVhZCBvZgo+ICAgICAgVEhJU19NT0RVTEUgdG8gZml4IHRoZSBt
b2R1bGUgcmVmZXJlbmNlIGNvdW50aW5nIGlzc3VlIHBvaW50ZWQgb3V0Cj4gICAgICBieSBLcnp5
c3p0b2YgS296bG93c2tpLgo+ICAtIFBhdGNoIDMgYW5kIDQ6Cj4gICAgICBVcGRhdGUgdGhlIEsx
X0FVWF9ERVZfSUQgYW5kIEszX0FVWF9ERVZfSUQgbWFjcm9zIHRvIGEgc2ltcGxlciBidXQgZGly
ZWN0Cj4gICAgICBmb3JtLCBvbmUgYmVuZWZpdCBpcyB0byBpbXByb3ZlIHRoZSBjb2RlIHJlYWRh
YmlsaXR5LiBNb3JlIGRpc2N1c3Npb24KPiAgICAgIGNhbiBiZSBmb3VuZCBpbiBMaW5rIFs0XS4K
PiBMaW5rIHRvIHYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjUxMjI5LWszLXJlc2V0
LXYxLTAtZWRhMDc0N2JkZWQzQHJpc2NzdGFyLmNvbQo+Cj4gU2lnbmVkLW9mZi1ieTogR3VvZG9u
ZyBYdSA8Z3VvZG9uZ0ByaXNjc3Rhci5jb20+Cj4gLS0tCj4gR3VvZG9uZyBYdSAoNCk6Cj4gICAg
ICAgZHQtYmluZGluZ3M6IHNvYzogc3BhY2VtaXQ6IEFkZCBLMyByZXNldCBzdXBwb3J0IGFuZCBJ
RHMKPiAgICAgICByZXNldDogQ3JlYXRlIHN1YmRpcmVjdG9yeSBmb3IgU3BhY2VtaVQgZHJpdmVy
cwo+ICAgICAgIHJlc2V0OiBzcGFjZW1pdDogRXh0cmFjdCBjb21tb24gSzEgcmVzZXQgY29kZQo+
ICAgICAgIHJlc2V0OiBzcGFjZW1pdDogQWRkIFNwYWNlbWlUIEszIHJlc2V0IGRyaXZlcgo+Cj4g
IC4uLi9iaW5kaW5ncy9zb2Mvc3BhY2VtaXQvc3BhY2VtaXQsazEtc3lzY29uLnlhbWwgIHwgICA4
ICstCj4gIGRyaXZlcnMvcmVzZXQvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgIDEyICstCj4gIGRyaXZlcnMvcmVzZXQvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgICAyICstCj4gIGRyaXZlcnMvcmVzZXQvc3BhY2VtaXQvS2NvbmZpZyAgICAgICAg
ICAgICAgICAgICAgIHwgIDM2ICsrKysKPiAgZHJpdmVycy9yZXNldC9zcGFjZW1pdC9NYWtlZmls
ZSAgICAgICAgICAgICAgICAgICAgfCAgIDYgKwo+ICBkcml2ZXJzL3Jlc2V0L3NwYWNlbWl0L3Jl
c2V0LXNwYWNlbWl0LWNvbW1vbi5jICAgICB8ICA3NyArKysrKysrCj4gIGRyaXZlcnMvcmVzZXQv
c3BhY2VtaXQvcmVzZXQtc3BhY2VtaXQtY29tbW9uLmggICAgIHwgIDQyICsrKysKPiAgLi4uL3Jl
c2V0LXNwYWNlbWl0LWsxLmN9ICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxMDcgKy0tLS0t
LS0tLQo+ICBkcml2ZXJzL3Jlc2V0L3NwYWNlbWl0L3Jlc2V0LXNwYWNlbWl0LWszLmMgICAgICAg
ICB8IDIzMyArKysrKysrKysrKysrKysrKysrKysKPiAgaW5jbHVkZS9kdC1iaW5kaW5ncy9yZXNl
dC9zcGFjZW1pdCxrMy1yZXNldHMuaCAgICAgfCAxNzEgKysrKysrKysrKysrKysrCj4gIDEwIGZp
bGVzIGNoYW5nZWQsIDU4NCBpbnNlcnRpb25zKCspLCAxMTAgZGVsZXRpb25zKC0pCj4gLS0tCj4g
YmFzZS1jb21taXQ6IGYxMGMzMjVhMzQ1ZmVmMGE2ODhhMmJjZGZhYjE1NDBkMWM5MjQxNDgKPiBj
aGFuZ2UtaWQ6IDIwMjUxMjI5LWszLXJlc2V0LThkOWI3NTFlZjM5MQo+IHByZXJlcXVpc2l0ZS1t
ZXNzYWdlLWlkOiA8MjAyNTEyMTkwMTI4MTkuNDQwOTcyLTEtaW5vY2hpYW1hQGdtYWlsLmNvbT4K
PiBwcmVyZXF1aXNpdGUtcGF0Y2gtaWQ6IGRmNDMwNzMwZWQ5NjEwMTFjZWU1YzVkNDdiN2FjZTg0
YjNjNWViYjcKPiBwcmVyZXF1aXNpdGUtcGF0Y2gtaWQ6IDY0MDAzNjE4YzMzYmU5MjU2MDJlNDZi
NzU0M2YyYzEzZDNmMzY0NzQKPiBwcmVyZXF1aXNpdGUtbWVzc2FnZS1pZDogPDIwMjYwMTA4LTA2
LWsxLWNsay1jb21tb24tdjQtMC1iYWRmNjM1OTkzZDNAZ2VudG9vLm9yZz4KPiBwcmVyZXF1aXNp
dGUtcGF0Y2gtaWQ6IDk2Y2QxMzI5M2I4ODhjMDVmNDAwZGFmNTI5YzNjYWNmMTdkZGYwMDIKPiBw
cmVyZXF1aXNpdGUtcGF0Y2gtaWQ6IDVmNjU3OTc5OTkxOWM0ZTJlMTJjOGM4MzZhYzQxNjRiMDBj
Y2FhYTMKPiBwcmVyZXF1aXNpdGUtcGF0Y2gtaWQ6IDExZThkNWNiZTZmMzYxMGFhMzYyZGMwMDUx
YjMxNzMwMDFkMGE1ZjQKPiBwcmVyZXF1aXNpdGUtcGF0Y2gtaWQ6IDYyMmQ2NjA2OTEzNjA5YmUw
NGY2NjAwNjYwOTU1MGU4YzNlN2YyMmIKPiBwcmVyZXF1aXNpdGUtbWVzc2FnZS1pZDogPDIwMjYw
MTA4LWszLWNsay12NS0wLTQyYTExYjc0YWQ1OEBnZW50b28ub3JnPgo+IHByZXJlcXVpc2l0ZS1w
YXRjaC1pZDogNDRhNTFmYTZhNmYwZjlkMmM1YjdiZjMyOTVmMzI3MmQ2YmI3MDA1YQo+IHByZXJl
cXVpc2l0ZS1wYXRjaC1pZDogZGNlODVhYzZlNGU5NGIxZDI2MjJhODIzMWRkYWIzZGU3NjYzNzNm
Zgo+IHByZXJlcXVpc2l0ZS1wYXRjaC1pZDogYWYxZmI1NzFmMGQxOWQ3MmU2OWRkNDFkMTVmYzJk
YmQ3MzBiMTdjNwo+IHByZXJlcXVpc2l0ZS1wYXRjaC1pZDogMTMxOGJmZmJiZTYwNDRjYjRlZjBm
NzdjNjc1NmZmOTZkNjllY2RmMwo+IHByZXJlcXVpc2l0ZS1wYXRjaC1pZDogODg1NmNlY2MyOTlj
ZGZmY2QxOGFjZjlhNzQ3NjE3NWE0ZDY1ZTYyZQo+Cj4gQmVzdCByZWdhcmRzLAo+IC0tCj4gR3Vv
ZG9uZyBYdSA8Z3VvZG9uZ0ByaXNjc3Rhci5jb20+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
