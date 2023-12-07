Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3810BC10DC3
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Dec 2023 08:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CV25l1vdeV1hoom/X4qv86JZf69X7j+kVFqH2nD4IRA=; b=ZOxOaBeg5G7RSu
	CkzFJWwtQipHBLWZVVxYLWAfhbJzW5orOHTV0/h7KqUMYpMgL6VhVpqwgN8qKMBp438O8eeu/VU6N
	TolbgZywNeRCBk+ScghU/IdYCsDgOr6BGaidQ6qp3xGH5+DzrMrwc2XS0G5lwiSl6wb5UnGw0y5aO
	Aedi6Ez8cPI+3ODs3VMlv2bWvBvyzHy9Uci9lWWyWmfKr/KFwx4KMRPjGdEP6t8x859xocyMsjQqn
	SYEqvf8Fi7p1ITB1kz2yhQy6TCpn6SNlyhC6Vc+kUh9xm1uWhY6VBkBaj2jcwZU/mc+ThbBlARkmE
	gJoVV1c+FXG7yKoncRDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rB9ha-00CCqI-2t;
	Thu, 07 Dec 2023 08:25:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rB9hY-00CCpn-06
	for linux-riscv@lists.infradead.org;
	Thu, 07 Dec 2023 08:25:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 25B6F62012
	for <linux-riscv@lists.infradead.org>; Thu,  7 Dec 2023 08:25:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE848C433CA
	for <linux-riscv@lists.infradead.org>; Thu,  7 Dec 2023 08:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701937542;
	bh=fpz3hSpcQoJnZmp0wb8Pb6jeykz0fSOXPRjRXzbi/ZA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BdHVz7o7bo/SFplvfZVidqwY6Tgg8lYu2OEOsxtd103fkz7gdWZJWDMdFK0KNe4Gt
	 gBay/UGWX0idnnetOLeAVWiWDVnoVz9vROfe/Jzqnht4h0nV6TzjJ0tXYlEE39p3e/
	 tzNaXMCrNQCi9WbDzCs5hgUPZXXr9TrgwOgtUzpsUY4UCUC2UE/94xNGgvXvWkDPxN
	 ez4Z0D58UcPt/QC32XB2u3foXTILoQsbkHgJl05jtXaHXYnZQgs1ASGvc+dUB2ctN2
	 jajV0a3vuxu6TRFpcMDOKMzh8nUT9KQyOpSqTpLo3grw7sBWmi5fpbFBVPWkySFmQe
	 BEo75eEcAwHgQ==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a1da1017a09so72378566b.3
        for <linux-riscv@lists.infradead.org>; Thu, 07 Dec 2023 00:25:42 -0800 (PST)
X-Gm-Message-State: AOJu0YzeYnT3njPNznp2kQsWwDVoV+ywuPp16+lKw1s4ZrnWno5MRt61
	dzsvzAvIOWWYkBu/h0R+t3Nsj/H3iI3C31/cH08=
X-Google-Smtp-Source: AGHT+IGVol4JPnCCVW5u1xUP5SM0B8ekxDdTr4UjzQn2LIi8K5liZqacGNwq0o5zFMcSbm9sMLegOWYWoXnJXLWPbts=
X-Received: by 2002:a17:906:2c7:b0:a1e:2e2b:1b7 with SMTP id
 7-20020a17090602c700b00a1e2e2b01b7mr908589ejk.132.1701937541279; Thu, 07 Dec
 2023 00:25:41 -0800 (PST)
MIME-Version: 1.0
References: <20231206-th1520_mmc_dts-v8-0-69220e373e8f@baylibre.com> <20231206-th1520_mmc_dts-v8-4-69220e373e8f@baylibre.com>
In-Reply-To: <20231206-th1520_mmc_dts-v8-4-69220e373e8f@baylibre.com>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 7 Dec 2023 16:25:30 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSrd-ywx_aMZHNGbobmF60kqEwkRgz2d_YA0suWWa-HYA@mail.gmail.com>
Message-ID: <CAJF2gTSrd-ywx_aMZHNGbobmF60kqEwkRgz2d_YA0suWWa-HYA@mail.gmail.com>
Subject: Re: [PATCH v8 4/4] riscv: dts: thead: Enable LicheePi 4A eMMC and microSD
To: Drew Fustini <dfustini@baylibre.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Jisheng Zhang <jszhang@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Jason Kridner <jkridner@beagleboard.org>, Robert Nelson <robertcnelson@beagleboard.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_002544_399447_42D28F76 
X-CRM114-Status: GOOD (  13.08  )
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

T24gV2VkLCBEZWMgNiwgMjAyMyBhdCA0OjA54oCvUE0gRHJldyBGdXN0aW5pIDxkZnVzdGluaUBi
YXlsaWJyZS5jb20+IHdyb3RlOgo+Cj4gQWRkIGVtbWMgbm9kZSBwcm9wZXJ0aWVzIGZvciB0aGUg
ZU1NQyBkZXZpY2UgYW5kIGFkZCBzZGlvMCBub2RlCj4gcHJvcGVydGllcyBmb3IgdGhlIG1pY3Jv
U0Qgc2xvdC4gU2V0IHRoZSBmcmVxdWVuY3kgZm9yIHRoZSBzZGhjaQo+IHJlZmVyZW5jZSBjbG9j
ay4KPgo+IFNpZ25lZC1vZmYtYnk6IERyZXcgRnVzdGluaSA8ZGZ1c3RpbmlAYmF5bGlicmUuY29t
Pgo+IC0tLQo+ICAuLi4vYm9vdC9kdHMvdGhlYWQvdGgxNTIwLWxpY2hlZS1tb2R1bGUtNGEuZHRz
aSAgICAgIHwgMjAgKysrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIwIGlu
c2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3RoZWFkL3Ro
MTUyMC1saWNoZWUtbW9kdWxlLTRhLmR0c2kgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3RoZWFkL3Ro
MTUyMC1saWNoZWUtbW9kdWxlLTRhLmR0c2kKPiBpbmRleCBhODAyYWIxMTA0MjkuLjEzNjVkM2E1
MTJhMyAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3RoZWFkL3RoMTUyMC1saWNo
ZWUtbW9kdWxlLTRhLmR0c2kKPiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3RoZWFkL3RoMTUy
MC1saWNoZWUtbW9kdWxlLTRhLmR0c2kKPiBAQCAtMjksNiArMjksMTAgQEAgJmFwYl9jbGsgewo+
ICAgICAgICAgY2xvY2stZnJlcXVlbmN5ID0gPDYyNTAwMDAwPjsKPiAgfTsKPgo+ICsmc2RoY2lf
Y2xrIHsKPiArICAgICAgIGNsb2NrLWZyZXF1ZW5jeSA9IDwxOTgwMDAwMDA+Owo+ICt9Owo+ICsK
PiAgJnVhcnRfc2NsayB7Cj4gICAgICAgICBjbG9jay1mcmVxdWVuY3kgPSA8MTAwMDAwMDAwPjsK
PiAgfTsKPiBAQCAtMzYsMyArNDAsMTkgQEAgJnVhcnRfc2NsayB7Cj4gICZkbWFjMCB7Cj4gICAg
ICAgICBzdGF0dXMgPSAib2theSI7Cj4gIH07Cj4gKwo+ICsmZW1tYyB7Cj4gKyAgICAgICBidXMt
d2lkdGggPSA8OD47Cj4gKyAgICAgICBtYXgtZnJlcXVlbmN5ID0gPDE5ODAwMDAwMD47Cj4gKyAg
ICAgICBtbWMtaHM0MDAtMV84djsKPiArICAgICAgIG5vbi1yZW1vdmFibGU7Cj4gKyAgICAgICBu
by1zZGlvOwo+ICsgICAgICAgbm8tc2Q7Cj4gKyAgICAgICBzdGF0dXMgPSAib2theSI7Cj4gK307
Cj4gKwo+ICsmc2RpbzAgewo+ICsgICAgICAgYnVzLXdpZHRoID0gPDQ+Owo+ICsgICAgICAgbWF4
LWZyZXF1ZW5jeSA9IDwxOTgwMDAwMDA+Owo+ICsgICAgICAgc3RhdHVzID0gIm9rYXkiOwo+ICt9
Owo+Cj4gLS0KPiAyLjM0LjEKPgpSZXZpZXdlZC1ieTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5v
cmc+CgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
