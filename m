Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41AF0C48BC3
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Feb 2024 11:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PfAeXH1EeTpS1wSS9eKTTiETAvNfnX00agH/Zc3wPgs=; b=i2KTS3dfEA6Huk
	Ubi+M/DlHiRA05TFa1PQf/0RKpyMYnACKz1RJX+G5hNM8cEFY6THwPbohXg2kOCpV9dGfXVM4fayR
	KrZ2PDuV4AQkymRzbrbQkbq0C2biG57tW1VWiOJJh87Xq28BoCdzNfQ593cmPPbGlxgLRG31b7Hg3
	tPihtOJrr+yKXdZZYfhi1vRePC5mthZcA8jQr4p8vJuCIVLUnDDmRvRa9LgC5YZ5CNH4SFB5lftcj
	Y9KcCEV9zR+6MHa+WJ1fYkHYh/7E9Nwkr6TX1ixyqK51EJdIgifrz3S1zO58k56YMk3aF/Xgutip/
	12ebHyyP3+VG2zQDtcIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rclG7-00000000mP1-3282;
	Wed, 21 Feb 2024 11:59:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rclG4-00000000mNz-0Z1j;
	Wed, 21 Feb 2024 11:59:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A5DFA61447;
	Wed, 21 Feb 2024 11:59:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7916C433C7;
	Wed, 21 Feb 2024 11:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708516766;
	bh=icr+Ws7AdDS8MhLtU6pYh5gnTY6nWC5oeWHCPgrtqac=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=b7osNXPcai2BCK0LMvdyyVsWjG8RLcrHGFG+6UbibZYadg2QRj/Z1m97e21ExmSir
	 oaIgimntM9xsZx7LwugvwJsbiyP9wjgCgJSNyamLpQLD7IrsCp8fKlSbI1jcVV9xK7
	 /D/P9Ly3/hwyJZQ8oVUDUNDuX/4NNKz7dH9hcOCb8gtPFRnNDAQ/7o5Mzn3WZ3D6Ar
	 MrNWSLpU4k9tIZNkBl5aK6z5RH8wg7h/2beqT0F9JWnbT6MdTJg0UONe6QvH1yBlB3
	 UgAhnRaDhOuDIPN84qqxS/sEjIi+j0qodNBdSHukYfN5Z7CLZTEJj4kuVpL1WW7hU3
	 klWq4Xxg8m6qw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Frank Rowand
 <frowand.list@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Marc
 Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>,
 linux-kernel@vger.kernel.org, Atish Patra <atishp@atishpatra.org>,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH v13 06/13] irqchip: Add RISC-V incoming MSI controller
 early driver
In-Reply-To: <CAK9=C2Xnzg3KAVETXN+ZGLWhVtaJuU4uXs3WH2ZondkBJMHFcA@mail.gmail.com>
References: <20240220060718.823229-1-apatel@ventanamicro.com>
 <20240220060718.823229-7-apatel@ventanamicro.com>
 <87frxnfj3p.fsf@all.your.base.are.belong.to.us>
 <CAK9=C2Xnzg3KAVETXN+ZGLWhVtaJuU4uXs3WH2ZondkBJMHFcA@mail.gmail.com>
Date: Wed, 21 Feb 2024 12:59:22 +0100
Message-ID: <874je2yqn9.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_035928_306276_EA9B7E68 
X-CRM114-Status: GOOD (  21.19  )
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

QW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+IHdyaXRlczoKCj4+ID4gK3ZvaWQg
aW1zaWNfdmVjdG9yX21hc2soc3RydWN0IGltc2ljX3ZlY3RvciAqdmVjKQo+PiA+ICt7Cj4+ID4g
KyAgICAgc3RydWN0IGltc2ljX2xvY2FsX3ByaXYgKmxwcml2Owo+PiA+ICsKPj4gPiArICAgICBs
cHJpdiA9IHBlcl9jcHVfcHRyKGltc2ljLT5scHJpdiwgdmVjLT5jcHUpOwo+PiA+ICsgICAgIGlm
IChXQVJOX09OKCZscHJpdi0+dmVjdG9yc1t2ZWMtPmxvY2FsX2lkXSAhPSB2ZWMpKQo+PiA+ICsg
ICAgICAgICAgICAgcmV0dXJuOwo+PiA+ICsKPj4gPiArICAgICAvKgo+PiA+ICsgICAgICAqIFRo
aXMgZnVuY3Rpb24gaXMgY2FsbGVkIHRocm91Z2ggTGludXggaXJxIHN1YnN5c3RlbSB3aXRoCj4+
ID4gKyAgICAgICogaXJxcyBkaXNhYmxlZCBzbyBubyBuZWVkIHRvIHNhdmUvcmVzdG9yZSBpcnEg
ZmxhZ3MuCj4+ID4gKyAgICAgICovCj4+ID4gKwo+PiA+ICsgICAgIHJhd19zcGluX2xvY2soJmxw
cml2LT5sb2NrKTsKPj4gPiArCj4+ID4gKyAgICAgdmVjLT5lbmFibGUgPSBmYWxzZTsKPj4gPiAr
ICAgICBiaXRtYXBfc2V0KGxwcml2LT5kaXJ0eV9iaXRtYXAsIHZlYy0+bG9jYWxfaWQsIDEpOwo+
PiA+ICsgICAgIF9faW1zaWNfcmVtb3RlX3N5bmMobHByaXYsIHZlYy0+Y3B1KTsKPj4gPiArCj4+
ID4gKyAgICAgcmF3X3NwaW5fdW5sb2NrKCZscHJpdi0+bG9jayk7Cj4+ID4gK30KPj4KPj4gUmVh
bGx5IG5pY2UgdGhhdCB5b3UncmUgdXNpbmcgYSB0aW1lciBmb3IgdGhlIHZlY3RvciBhZmZpbml0
eSBjaGFuZ2UsCj4+IGFuZCBnb3QgcmlkIG9mIHRoZSBzcGVjaWFsL3dlaXJkIElNU0lDL3N5bmMg
SVBJLiBDYW4geW91IHJlYWxseSB1c2UgYQo+PiB0aW1lciBmb3IgbWFzay91bm1hc2s/IFRoYXQg
bWFrZXMgdGhlIG1hc2svdW5tYXNrIG9wZXJhdGlvbgo+PiBhc3luY2hyb25vdXMhCj4+Cj4+IFRo
YXQgd2FzIHdoYXQgSSB3YXMgdHJ5aW5nIHRvIGdldCB0aG91Z2ggd2l0aCB0aGlzIGNvbW1lbnQ6
Cj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2Lzg3c2YyNG1vMWcuZnNmQGFs
bC55b3VyLmJhc2UuYXJlLmJlbG9uZy50by51cy8KPj4KPj4gQWxzbywgdXNpbmcgdGhlIHNtcF8q
IElQSSBmdW5jdGlvbnMsIHlvdSBjYW4gcGFzcyBhcmd1bWVudHMsIHNvIHlvdQo+PiBkb24ndCBu
ZWVkIHRoZSBkaXJ0eV9iaXRtYXAgdHJhY2tpbmcgdGhlIGNoYW5nZXMuCj4KPiBUaGUgbWFzay91
bm1hc2sgb3BlcmF0aW9ucyBhcmUgY2FsbGVkIHdpdGggaXJxcyBkaXNhYmxlZCBzbyBpZgo+IENQ
VSBYIGRvZXMgc3luY2hyb25vdXMgSVBJIHRvIGFub3RoZXIgQ1BVIFkgZnJvbSBtYXNrL3VubWFz
awo+IG9wZXJhdGlvbiB0aGVuIHdoaWxlIENQVSBYIGlzIHdhaXRpbmcgZm9yIElQSSB0byBjb21w
bGV0ZSBpdCBjYW5ub3QKPiByZWNlaXZlIElQSSBmcm9tIG90aGVyIENQVXMgd2hpY2ggY2FuIGxl
YWQgdG8gY3Jhc2hlcyBhbmQgc3RhbGxzLgo+Cj4gSW4gZ2VuZXJhbCwgd2Ugc2hvdWxkIG5vdCBk
byBhbnkgYmxvY2svYnVzeS13YWl0IHdvcmsgaW4KPiBtYXNrL3VubWFzayBvcGVyYXRpb24gb2Yg
YW4gaXJxY2hpcCBkcml2ZXIuCgpIbW0sIE9LLiBTdGlsbCwgYSBiaXQgb2RkIHRoYXQgd2hlbiB0
aGUgLmlycV9tYXNrIGNhbGxiYWNrIHJldHVybiwgdGhlCm1hc2tpbmcgaXMgbm90IGFjdHVhbGx5
IGNvbXBsZXRlZC4KCjEuIENQVSAwIHRyaWVzIHRvIG1hc2sgYW4gaW50ZXJydXB0IHRyaWVkIHRv
IENQVSAxLgoyLiBUaGUgdGltZXIgaXMgcXVldWVkIG9uIENQVSAxLgozLiBUaGUgY2FsbCBpcnFf
bWFzayByZXR1cm5zIG9uIENQVSAwCjQuIC4uLnRoZSBpcnEgaXMgbWFza2VkIGF0IHNvbWUgZnV0
dXJlIHBvaW50LCBkZXRlcm1pbmVkIGJ5IHRoZSBjYWxsYmFjawogICBhdCBDUFUgMQoKSXMgdGhh
dCB0aGUgZXhwZWN0ZWQgb3V0Y29tZT8KClRoZXJlIGFyZSAuaXJxX21hc2sgaW1wbGVtZW50YXRp
b24gdGhhdCBkb2VzIHNlZW0gdG8gZ28gYXQgbGVuZ3RoCihibG9ja2luZykgdG8gcGVyZm9ybSB0
aGUgbWFzaywgZS5nLjogZ2ljX21hc2tfaXJxKCkgd2hpY2ggY2FsbHMKZ2ljX3tyZSx9ZGlzdF93
YWl0X2Zvcl9yd3AgdGhhdCBoYXZlIHNsZWVwL3JldHJ5IGxvb3BzLiBUaGUgR0lDMyBJVFMKY29k
ZSBoYXMgc2ltaWxhciB0aGluZ3MgZ29pbmcgb24uCgpJJ20gbm90IHNheWluZyB5b3UncmUgd3Jv
bmcsIEknbSBqdXN0IHRyeWluZyB0byB3cmFwIG15IGhlYWQgYXJvdW5kIHRoZQptYXNraW5nIHNl
bWFudGljcy4KCj4gVGhlIEFJQSBJTVNJQyBzcGVjIGFsbG93cyBzZXR0aW5nIElEIHBlbmRpbmcg
Yml0IHVzaW5nIE1TSSB3cml0ZQo+IGlycmVzcGVjdGl2ZSB3aGV0aGVyIElEIGlzIGVuYWJsZWQg
b3Igbm90IGJ1dCB0aGUgaW50ZXJydXB0IHdpbGwgYmUKPiB0YWtlbiBvbmx5IGFmdGVyIElEIGlz
IGVuYWJsZWQuIEluIG90aGVyIHdvcmRzLCB0aGVyZSB3aWxsIGJlIG5vCj4gbG9zcyBvZiBpbnRl
cnJ1cHQgd2l0aCBkZWxheWVkIG1hc2svdW5tYXNrIHVzaW5nIGFzeW5jIElQSSBvcgo+IGxhenkg
dGltZXIuCgpObyBsb3NzLCBidXQgd2UgbWlnaHQgKmdldCogYW4gaW50ZXJydXB0IHdoZW4gd2Ug
ZXhwbGljaXRseSBhc2tlZCBub3QgdG8KZ2V0IGFueS4gTWF5YmUgdGhhdCdzIG9rPwoKCkJqw7Zy
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
