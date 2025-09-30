Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83064CAC5B9
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Sep 2025 02:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BVoY+RTYThu5SgwTHnJ16V26fVgY9Ap/1XS0ej5+Nno=; b=BCPbSU1g8DegPH
	x7qc88kfcyxIAi61Hl+D5BI1qwx+xL2D0ostcUGeDqSL5/1vkxYpM3w2x1AVcP5/MAKyRKaPVQMYg
	6HwoyBE/9Gzx37fuJL472HcuTSes4tZE5R2mtVTTJLvAmR3OHhr0eLS5Y6a04bu+yjq7VzZHOXZ1b
	vlU7CXatCLsKQk5xONh2764SstF1z7qcc+4n+cT6cQ+Idnl4x7Z4whauUfMu7H3zTAVp3Lb2RxP70
	neRp5HX7fLXF0YJDqz3zet/wUHQ2sdwYluR6lCY5SZPjeAiJfcA7lYXZTjAttwO0hjLJ89jzC7mt5
	I2WEug5eGbgDOj1VJKuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3QUO-00000003yQR-2Oth;
	Tue, 30 Sep 2025 02:53:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3QUL-00000003yOe-3Mye
	for linux-riscv@lists.infradead.org;
	Tue, 30 Sep 2025 02:53:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A6D3E40625
	for <linux-riscv@lists.infradead.org>; Tue, 30 Sep 2025 02:53:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86B46C4AF09
	for <linux-riscv@lists.infradead.org>; Tue, 30 Sep 2025 02:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759200792;
	bh=ym6h+Qei6CJdmJJVbagIpDYKjBeMBZx8FHWAejUB0wE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZQEQ98G3bc+RXLkAjVNzcVi/lvBuHyora3y6Zw3XprKqYOMPaiGuYjUK/G31JHpHr
	 O/OuKZm9HxOCnEpUNddpaLPt8AEcacqAeWwfafojoodFqESXk1zkEJdNPhyMg0aCTq
	 u9t2U/bkf6E2Ki2+tyhc3LF4SVgdenJkZpg5gxVO8OiTLyAuSdwIQIn6hyFegsIt+o
	 czyltKdO8Mhzmuk9ok02kbwhybem3tvpxnlWZKLjd1DoG/jUDb+8I5/pMNXO+ow6wc
	 9R56Mc3eNQU+YHPldkahVJa9yh0GzHiPaLclpp3q1D+rONvmophr3SCnxBPTIcVQ4F
	 ilqJGzWWnxTQA==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b3e9d633b78so422940866b.1
        for <linux-riscv@lists.infradead.org>; Mon, 29 Sep 2025 19:53:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXmDwbOroV0dpGojFKnSmc6gZSLQlNwPN6Bb9ahI/CPnEU24Tb8iY2gXjJXVI06mE1xFqssG2a0m8nPiw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywc4Tq7QMCGhxalOC44rIHoRt9FjY4bCXQf7PvHZSdut7saKS70
	auoRRBGK/ahByNO5JHU4F5SPun1v0IAXnO96/rBY5BPQio4/1pZsl8QuA04DZ6Bce9CWuO0l3Cy
	sjI3GhrDAXYw7hnNjPmnbflJ11zCszNQ=
X-Google-Smtp-Source: AGHT+IEfvCuZAVXXWVTEo167aebO6qUsrh2w2UDinUqmaNHItIXCoAnwHta702NRz1ENszkgUaXlenJfqCGyw7SV6Wc=
X-Received: by 2002:a17:907:daa:b0:b2d:4e57:58d8 with SMTP id
 a640c23a62f3a-b413600acc6mr256609966b.10.1759200791107; Mon, 29 Sep 2025
 19:53:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250928085506.4471-1-yangtiezhu@loongson.cn> <CAMj1kXG8Wi+THa2SeLxiDT=+t_TKx0AL4H-azZO4DNJvyyv96g@mail.gmail.com>
 <CAAhV-H7xOf8DEwOrNh+GQGHktOT4Ljp+7SqutGvvDZp6GLXJrA@mail.gmail.com> <CAMj1kXG=EFkRAMkvKMSjPixoGqU-tZXVoRkJJ6Wcnzs3x52X6Q@mail.gmail.com>
In-Reply-To: <CAMj1kXG=EFkRAMkvKMSjPixoGqU-tZXVoRkJJ6Wcnzs3x52X6Q@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 30 Sep 2025 10:52:59 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6PNcyTNXEhzdovt3an7e9V+B+Z-px=_HPiQ5vv7qaDMg@mail.gmail.com>
X-Gm-Features: AS18NWDktm4BaCz5O-7O3VzGm9rq1tPjPU1iKF2Ar1jh6n3dOQanb3Px7roMXtU
Message-ID: <CAAhV-H6PNcyTNXEhzdovt3an7e9V+B+Z-px=_HPiQ5vv7qaDMg@mail.gmail.com>
Subject: Re: [PATCH v2] efistub: Only link libstub to final vmlinux
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-efi@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_195313_884913_0113EA22 
X-CRM114-Status: GOOD (  24.65  )
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

T24gU3VuLCBTZXAgMjgsIDIwMjUgYXQgMTA6NDDigK9QTSBBcmQgQmllc2hldXZlbCA8YXJkYkBr
ZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIFN1biwgMjggU2VwdCAyMDI1IGF0IDE1OjUyLCBIdWFj
YWkgQ2hlbiA8Y2hlbmh1YWNhaUBrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBIaSwgQXJkLAo+
ID4KPiA+IE9uIFN1biwgU2VwIDI4LCAyMDI1IGF0IDk6NDLigK9QTSBBcmQgQmllc2hldXZlbCA8
YXJkYkBrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4KPiA+ID4gT24gU3VuLCAyOCBTZXB0IDIwMjUg
YXQgMTA6NTUsIFRpZXpodSBZYW5nIDx5YW5ndGllemh1QGxvb25nc29uLmNuPiB3cm90ZToKPiA+
ID4gPgo+ID4gPiA+IFdoZW4gY29tcGlsaW5nIHdpdGggTExWTSBhbmQgQ09ORklHX0xUT19DTEFO
RyBpcyBzZXQsIHRoZXJlIGV4aXN0cwo+ID4gPiA+IHRoZSBmb2xsb3dpbmcgb2JqdG9vbCB3YXJu
aW5nIG9uIExvb25nQXJjaDoKPiA+ID4gPgo+ID4gPiA+ICAgdm1saW51eC5vOiB3YXJuaW5nOiBv
Ymp0b29sOiBfX2VmaXN0dWJfZWZpX2Jvb3Rfa2VybmVsKCkKPiA+ID4gPiAgIGZhbGxzIHRocm91
Z2ggdG8gbmV4dCBmdW5jdGlvbiBfX2VmaXN0dWJfZXhpdF9ib290X2Z1bmMoKQo+ID4gPiA+Cj4g
PiA+ID4gVGhpcyBpcyBiZWNhdXNlIGVmaV9ib290X2tlcm5lbCgpIGRvZXNuJ3QgZW5kIHdpdGgg
YSByZXR1cm4gaW5zdHJ1Y3Rpb24KPiA+ID4gPiBvciBhbiB1bmNvbmRpdGlvbmFsIGp1bXAsIHRo
ZW4gb2JqdG9vbCBoYXMgZGV0ZXJtaW5lZCB0aGF0IHRoZSBmdW5jdGlvbgo+ID4gPiA+IGNhbiBm
YWxsIHRocm91Z2ggaW50byB0aGUgbmV4dCBmdW5jdGlvbi4KPiA+ID4gPgo+ID4gPiA+IEF0IHRo
ZSBiZWdpbm5pbmcsIHRyeSB0byBkbyBzb21ldGhpbmcgdG8gbWFrZSBlZmlfYm9vdF9rZXJuZWwo
KSBlbmRzIHdpdGgKPiA+ID4gPiBhbiB1bmNvbmRpdGlvbmFsIGp1bXAgaW5zdHJ1Y3Rpb24sIGJ1
dCB0aGlzIG1vZGlmaWNhdGlvbiBzZWVtcyBub3QgcHJvcGVyLgo+ID4gPiA+Cj4gPiA+ID4gU2lu
Y2UgdGhlIGVmaXN0dWIgZnVuY3Rpb25zIGFyZSB1c2VsZXNzIGZvciBzdGFjayB1bndpbmRlciwg
dGhleSBjYW4gYmUKPiA+ID4gPiBpZ25vcmVkIGJ5IG9ianRvb2wuIEFmdGVyIG1hbnkgZGlzY3Vz
c2lvbnMsIG5vIG5lZWQgdG8gbGluayBsaWJzdHViIHRvCj4gPiA+ID4gdGhlIHZtbGludXgubywg
b25seSBsaW5rIGxpYnN0dWIgdG8gdGhlIGZpbmFsIHZtbGludXguCj4gPiA+ID4KPiA+ID4KPiA+
ID4gUGxlYXNlIHRyeSBrZWVwaW5nIHRoZXNlIGNoYW5nZXMgY29uZmluZWQgdG8gYXJjaC9sb29u
Z2FyY2guIFRoaXMKPiA+ID4gcHJvYmxlbSBkb2VzIG5vdCBleGlzdCBvbiBvdGhlciBhcmNoaXRl
Y3R1cmVzLCBhbmQgY2hhbmdpbmcgdGhlIHdheQo+ID4gPiB2bWxpbnV4IGlzIGNvbnN0cnVjdGVk
IG1pZ2h0IGNyZWF0ZSBvdGhlciBpc3N1ZXMgZG93biB0aGUgcm9hZC4KPiA+IEFSTSwgUklTQy1W
IGFuZCBMb29uZ0FyY2ggZG8gdGhpbmdzIGV4YWN0bHkgaW4gdGhlIHNhbWUgd2F5LiBOb3cKPiA+
IExvb25nQXJjaCBpcyB0aGUgZmlyc3Qgb2YgdGhlIHRocmVlIHRvIGVuYWJsZSBvYmp0b29sLCBz
byB3ZSBtZWV0IHRoZQo+ID4gcHJvYmxlbSBmaXJzdC4KPiA+Cj4gPiBCdXQgeWVzLCBJIGFsc28g
ZG9uJ3Qgd2FudCB0byBjaGFuZ2UgdGhlIHdheSBvZiBjb25zdHJ1Y3Rpbmcgdm1saW51eC4KPiA+
IFNvIEkgcHJlZmVyIHRoZSBlYXJsaWVzdCB3YXkgdG8gZml4IHRoaXMgcHJvYmxlbS4KPiA+IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xvb25nYXJjaC9DQUFoVi1IN2ZSSEdGVktWOEhpdFJnbXVv
RFB0NU9EdC0taVN1VjBFbWVlVWI5ZDVGTndAbWFpbC5nbWFpbC5jb20vVC8jbWVlZjc0MTFhYmQx
NGY0YzI4Yzg1ZTY4NjYxNGFhOTIxMWZjY2RjYTAKPiA+Cj4KPiBDYW4gd2UganVzdCBkcm9wIHRo
ZSBfX25vcmV0dXJuIGFubm90YXRpb24gZnJvbSBrZXJuZWxfZW50cnlfdCwgYW5kCj4gcmV0dXJu
IEVGSV9TVUNDRVNTIGZyb20gZWZpX2Jvb3Rfa2VybmVsKCk/Ck5vdCBnb29kLCBiZWNhdXNlIGtl
cm5lbF9lbnRyeV90IGlzIHJlYWxseSAibm9yZXR1cm4iLCBhbmQgYXQgcHJlc2VudApubyBhcmNo
aXRlY3R1cmUgcmV0dXJucyBFRklfU1VDQ0VTUyBhdCB0aGUgZW5kIG9mIGVmaV9ib290X2tlcm5l
bCgpLgoKCkh1YWNhaQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
