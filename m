Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90E97C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Nov 2022 21:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=74qRdnzw5LoJzATOHM8rJl1Lscoxd3IytCuAPx03D8U=; b=qhpJ59+xMbNhEm
	WYh+VT6WfZICjvfk2FJPw3NEaUKCGDpFZrH6Uf8H18HHFk803gcT8t7JS7TzwruHmsdtLeaeCT3D5
	m6sD3rWx8jtaAgeWLSimVx9kuBqVkz3CYMCvnnmrVguINJVkhjUqAR1D9SQEVMmixfH3N1mcw9CHZ
	ufXw5fLjMkMLxaNFNLaHiGOJu24DgF7xBsXpzOF6VTk895sWuDo0p7pq+GtOgpc13Mzmd1VBwZiIi
	W1Qyfp6Zdw2PTCC3m2KMXHWAzBAnGnSIwB/Qwn1275bqoUlx4hKO9GmS4Yh6MsJ4AfiIXjpanziIe
	n+N8we+d1kWHSKt1H8Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozlVo-004UCm-TR; Mon, 28 Nov 2022 21:18:00 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozlVd-004UAq-EB; Mon, 28 Nov 2022 21:17:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 564DFB80EFE;
	Mon, 28 Nov 2022 21:17:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D31AC433D7;
	Mon, 28 Nov 2022 21:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669670264;
	bh=wR2vdYn7jxfskOVqXRDFR2xx2Bh5pit2zrFi6YtSvFA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=r+pIGF/O69EpN3z6euPpIMgazagQE7FEA6RWFRgsVQYtt8TLAaZ9FEWYFPTYD6+OC
	 FTJRX2CvpbxoGy8xZ2as10rOn6NE7W7S+UAl9O5Y5U1JWEKTHTeRYP0SyLPGVxlHSw
	 eOfTKqKtJ8BZ+PtDxt4h542vz13uyGbYVzvhfJoR3eJyFtNqeX18G+F8Z0WWz/sROq
	 UcL1HrjboQojqRU8uctCQbCUyg545fvt+jrRG2DOj5r/Xxir4mKaEPwmI+eiMlYppS
	 Dt5BgKPdOopYmwT8jha9ECjs4a6HTNsnKyfB8TFd9zd2qEHItHOhHyuE11WGfYh+Xe
	 D9CiPaGAa33WA==
Message-ID: <6aad3b63-498e-b13a-af49-b5af0d4e721e@kernel.org>
Date: Mon, 28 Nov 2022 21:17:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 12/12] riscv: defconfig: Enable the Allwinner D1
 platform and drivers
Content-Language: en-US
To: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
 Samuel Holland <samuel@sholland.org>, palmer@dabbelt.com
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Andre Przywara <andre.przywara@arm.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Stanislav Jakubek <stano.jakubek@gmail.com>
References: <20221125234656.47306-1-samuel@sholland.org>
 <20221125234656.47306-13-samuel@sholland.org> <Y4JBa52o4Yemv/uj@spud>
 <11740765.nUPlyArG6x@diego>
From: Conor Dooley <conor@kernel.org>
In-Reply-To: <11740765.nUPlyArG6x@diego>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_131749_781098_012C4FE3 
X-CRM114-Status: GOOD (  22.34  )
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

T24gMjgvMTEvMjAyMiAyMToxMSwgSGVpa28gU3TDvGJuZXIgd3JvdGU6Cj4gQW0gU2Ftc3RhZywg
MjYuIE5vdmVtYmVyIDIwMjIsIDE3OjQwOjExIENFVCBzY2hyaWViIENvbm9yIERvb2xleToKPj4g
T24gRnJpLCBOb3YgMjUsIDIwMjIgYXQgMDU6NDY6NTZQTSAtMDYwMCwgU2FtdWVsIEhvbGxhbmQg
d3JvdGU6Cj4+PiBOb3cgdGhhdCBzZXZlcmFsIEQxLWJhc2VkIGJvYXJkcyBhcmUgc3VwcG9ydGVk
LCBlbmFibGUgdGhlIHBsYXRmb3JtIGluCj4+PiBvdXIgZGVmY29uZmlnLiBCdWlsZCBpbiB0aGUg
ZHJpdmVycyB3aGljaCBhcmUgbmVjZXNzYXJ5IHRvIGJvb3QsIHN1Y2ggYXMKPj4+IHRoZSBwaW5j
dHJsLCBNTUMsIFJUQyAod2hpY2ggcHJvdmlkZXMgY3JpdGljYWwgY2xvY2tzKSwgU1BJIChmb3Ig
Zmxhc2gpLAo+Pj4gYW5kIHdhdGNoZG9nICh3aGljaCBtYXkgYmUgbGVmdCBlbmFibGVkIGJ5IHRo
ZSBib290bG9hZGVyKS4KPj4KPj4gQWxsIG9mIHRoYXQgbG9va3MgZ29vZC4KPj4KPj4+IE90aGVy
IGNvbW1vbgo+Pj4gb25ib2FyZCBwZXJpcGhlcmFscyBhcmUgZW5hYmxlZCBhcyBtb2R1bGVzLgo+
Pgo+PiBUaGlzIEkgYW0gbm90IHN1cmUgYWJvdXQgdGhvdWdoLiBJJ2xsIGxlYXZlIHRoYXQgdG8g
UGFsbWVyIHNpbmNlIEknbQo+PiBwcmV0dHkgc3VyZSBpdCB3YXMgaGltIHRoYXQgc2FpZCBpdCwg
YnV0IEkgdGhvdWdodCB0aGUgcGxhbiB3YXMgb25seQo+PiB0dXJuaW5nIG9uIHN0dWZmIHJlcXVp
cmVkIHRvIGJvb3QgdG8gYSBjb25zb2xlICYgdGhpbmdzIHRoYXQgYXJlCj4+IGdlbmVyYWxseSB1
c2VmdWwgcmF0aGVyIHRoYW4gZW5hYmxpbmcgbW9kdWxlcyBmb3IgZXZlcnlvbmUncyAicmFuZG9t
Igo+PiBkcml2ZXJzLiBQYWxtZXI/Cj4gCj4gSXNuJ3QgdGhlIGRlZmNvbmZpZyBtZWFudCBhcyBh
IHN0YXJ0aW5nIHBvaW50IHRvIGdldCB3b3JraW5nIHN5c3RlbXMKPiB3aXRoIG1pbmltYWwgY29u
ZmlnIGVmZm9ydD8gQXQgbGVhc3QgdGhhdCB3YXMgYWx3YXlzIHRoZSB3YXkgdG8gZ28gb24gYXJt
Cj4gc28gZmFyIDotKSAuCj4gCj4gU28gaGF2aW5nIGJvb3QtcmVxdWlyZWQgZHJpdmVycyBidWls
dC1pbiB3aXRoIHRoZSByZXN0IGVuYWJsZWQgYXMgbW9kdWxlcwo+IGZvciBzdXBwb3J0ZWQgYm9h
cmRzIHdpbGwgYWxsb3cgcGVvcGxlIHRvIGJvb3QgdGhlaXJzIHdpdGhvdXQgaGVhZGFjaGVzLgo+
IAo+IERpc2FibGluZyB1bm5lZWRlZCBkcml2ZXJzIGlmIHlvdSdyZSBzdGFydmVkIGZvciBzdG9y
YWdlIHNwYWNlIGluIGEgc3BlY2lhbAo+IHByb2plY3QgaXMgYWx3YXlzIGVhc2llciB0aGFuIGh1
bnRpbmcgZG93biBhbGwgdGhlIGRyaXZlcnMgdG8gZW5hYmxlIGZvciBhCj4gc3BlY2lmaWMgYm9h
cmQuIAoKSSB3b3VsZG4ndCBtaW5kIGJlaW5nIGFibGUgdG8gdHVybiBvbiBhbGwgdGhlIFBvbGFy
RmlyZSBTb0Mgc3R1ZmYgYW5kCnllYWgsIHRoYXQgd291bGQgYmUgdGhlIHdheSB0aGF0IGFybTY0
IGRvZXMgaXQuIEJ1dCBJIGRvIHJlY2FsbCBoZWFyaW5nCnRoYXQgSSBzaG91bGQgbm90IHR1cm4g
c3R1ZmYgb24gdGhpcyB3YXksIHdoZW4gSSBpbml0aWFsbHkgdHJpZWQgdG8KdHVybiBzdHVmZiBv
biB2aWEgc2VsZWN0cywgZ290IGEgbmFjayBhbmQgYXNrZWQgaWYgSSBjb3VsZCBkbyB0aGlzIGlu
c3RlYWQuCgpCdXQgaXQgbWF5IGJlIHRoYXQgSSBtaXNyZW1lbWJlciwgd2hpY2ggaXMgd2h5IEkg
YXBwZWFsZWQgdG8gdGhlIEhpZ2hlcgpQb3dlcnMgZm9yIGNsYXJpZmljYXRpb24gOikKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
