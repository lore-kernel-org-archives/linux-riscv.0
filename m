Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1C18CD5BD2
	for <linux-riscv@archiver.kernel.org>; Fri, 29 May 2026 06:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rj/eXcl7KO3+4zQjJ9YOm//WrRoYAFSV7sCzVFjx1yQ=; b=UN+DoJ7TjAhC7K
	pKAJDDT0Uc8ISPTP2Ab3KB6N+g0AtD5gUnGdYlEE3hphLhbtSvcaiQVNQOy5M3tAwT7sSnL0ndiK1
	MWBWVmBULF8mX8KVDIoGbFND1fDpjV7EAQwOz4uUPF9GoT9Ss8ZV0fkQnO5QfsUTefJsE9gahVOW+
	x3boxOloSktXCa/wJp6J0RAdXEmXgJ7sKYOhh5fEmg7IElGtgNRrQB85xT867bCwQTXSinv+REyyy
	E+xgyQaBF51+CfifgM0k39wAFu2874yW8gdl7tpD33L8QF2kiobtZpoQWWuKaHzgO3TzmktHiC2ny
	Dom/lMliLYkbXbD4Vh1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSqbe-00000006ntA-1WYT;
	Fri, 29 May 2026 06:22:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSqbb-00000006nso-49xt
	for linux-riscv@lists.infradead.org;
	Fri, 29 May 2026 06:22:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 090DD44528;
	Fri, 29 May 2026 06:22:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED7161F00893;
	Fri, 29 May 2026 06:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780035722;
	bh=XNhOvejT4/3o+g58bTyobWWwZwSRbAllSV42yEUrEQw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P0lKK5npMrRB+m7LsnGng8LuC9nAiFxO5ZTK86uuvAGRSH+W5l8naXQSEAVOugJNd
	 2dA77UQlpqDbKbjcSyFi45HlT0XKuAqeIHcdpQ1KGS4YmbLAXyMiYmdgfU73DOjIYE
	 iHQFC06Nw6U61DDHp8B69BHn37wpry63zND8HsD3TIQ27IRhvmjKybKSOj0+CMO4+3
	 j/DzusFAPSAVDXWQ4GnlS0UTRyXBVCK1D7DzzlsjPP2gmIlXdDBwwWMiuvNYeTq0u5
	 G4JyGM8w8MgQ2JM17piyh+ZIPwzgGqI9NtTDnnSsScfa8trhCpWwYjD1XIMAKmxZbk
	 xLUs0FC1IpwNw==
Date: Fri, 29 May 2026 06:21:59 +0000
From: Yixun Lan <dlan@kernel.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Guodong Xu <docularxu@outlook.com>
Subject: Re: [PATCH] riscv: dts: spacemit: k3: Add Ziccrse extension for X100
 cores
Message-ID: <20260529062159-GKE3748271@kernel.org>
References: <20260526-k3-ziccrse-v1-1-c759792ca3a3@riscstar.com>
 <CAH1PCMa_RJ0NVNyxkqsXPfrF4tz_69ZbWeqkh8xRCu7bLDkr-A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAH1PCMa_RJ0NVNyxkqsXPfrF4tz_69ZbWeqkh8xRCu7bLDkr-A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_232204_055712_7F2B8619 
X-CRM114-Status: GOOD (  13.21  )
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

SGkgR3VvZG9uZywKCk9uIDEzOjE4IFRodSAyOCBNYXkgICAgICwgR3VvZG9uZyBYdSB3cm90ZToK
PiBPbiBUdWUsIE1heSAyNiwgMjAyNiBhdCAzOjIz4oCvUE0gR3VvZG9uZyBYdSA8Z3VvZG9uZ0By
aXNjc3Rhci5jb20+IHdyb3RlOgo+ID4KPiA+IEFkZCB0aGUgWmljY3JzZSBJU0EgZXh0ZW5zaW9u
IHRvIGFsbCBlaWdodCBYMTAwIGNvcmVzLiBaaWNjcnNlCj4gPiBwcm92aWRlcyBhIGZvcndhcmQg
cHJvZ3Jlc3MgZ3VhcmFudGVlIG9uIExSL1NDIHNlcXVlbmNlcyBpbiBtYWluCj4gPiBtZW1vcnkg
cmVnaW9ucyB3aXRoIGNhY2hlYWJpbGl0eSBhbmQgY29oZXJlbmNlIFBNQXMuCj4gPgo+ID4gVGhl
IFNwYWNlbWlUIFgxMDAgY29yZSBzdXBwb3J0cyBpdCBwZXIgdGhlIFNwYWNlbWlUIEszIGhhcmR3
YXJlCj4gPiBzcGVjaWZpY2F0aW9uLgo+IAo+IEZvciB0aGUgcmVjb3JkLCBJIGhhdmUgdGVzdGVk
IHRoaXMgY2hhbmdlIG9uIFNwYWNlbWlUIEszIFBpY28tSVRYLgo+IAo+IFRoZSBzdHJlc3MgdGVz
dCBpcyBydW4gYnkgZW5hYmxpbmcgQ09ORklHX0xPQ0tfVE9SVFVSRV9URVNUPXkgdGhlbgo+IGJv
b3RzIHRoZSBrZXJuZWwgd2l0aDoKPiAKPiAgIGxvY2t0b3J0dXJlLnRvcnR1cmVfdHlwZT1zcGlu
X2xvY2sgbG9ja3RvcnR1cmUubndyaXRlcnNfc3RyZXNzPTE2Cj4gCj4gZHJpdmluZyBhbGwgOCBo
YXJ0cy4gSXQgc3Vydml2ZWQgc3VzdGFpbmVkIHRvcnR1cmUgW3JhbiBmb3IgfjEwIG1pbnV0ZXNd
Cj4gd2l0aCAwIEZhaWwuCj4gCj4gLi4uIC4uLgo+IFsgIDczNS41ODg5NDddIHRvcnR1cmVfc3Bp
bl9sb2NrX3dyaXRlX2RlbGF5OiBkZWxheSA9IDI1IGppZmZpZXMuCj4gWyAgNzM4LjAxNTA5Nl0g
dG9ydHVyZV9zcGluX2xvY2tfd3JpdGVfZGVsYXk6IGRlbGF5ID0gMjUgamlmZmllcy4KPiBbICA3
MzkuMjA0NzEzXSB0b3J0dXJlX3NwaW5fbG9ja193cml0ZV9kZWxheTogZGVsYXkgPSAyNSBqaWZm
aWVzLgo+IFsgIDc0MS4xOTUyMTFdIFdyaXRlczogIFRvdGFsOiA3MTQzMTk0MjAgIE1heC9NaW46
IDQ1OTQ2NTk5LzQzNjc5ODc2ICAgRmFpbDogMAo+IApJIGFwcHJlY2lhdGUgeW91IGdpdmUgbW9y
ZSBpbmZvIGFib3V0IHRoZSB0ZXN0LCBqdXN0IHdhbnQgdG8gbWFrZSBzdXJlLApmb3IgdGhlIGtl
cm5lbCBjb25maWcsIHRoZSBDT05GSUdfUklTQ1ZfVElDS0VUX1NQSU5MT0NLUyBpcyBub3QgZW5h
YmxlZD8Kc28gaXQgd2lsbCBmYWxsIGJhY2sgdG8gdXNlIHppY2Nyc2UgaW1wbGVtZW50YXRpb24u
LgotLSAKWWl4dW4gTGFuIChkbGFuKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
