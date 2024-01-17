Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1719AC47258
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jan 2024 09:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nO18nU1kdS8aLw7VHzRO4UZ2nEVwDfFl7/IIHYFEn8w=; b=e2uc33MnSJOxj5
	J7WGEvGE8lWRSAIu4oPHza+zSoz9SaxkuxkzRnA1+v6SemuTR3oi++uWHcqdMl4317i/9ZEn5mJLF
	Np0zpe6iCRxdmy5LXojPCJToa4Wbg9Pf0tPIJnUUoEIxKjf0ueFUsHjB7ebYVqNbMbbzjHRnz7vf0
	Ru354s8lCE14j8Uiz7e7HoApKP9fr7MJrFazLisN7DqPz7ICjdLz/sApSlU8OrhWegof7aGsTvD/M
	948Rzao2iiFy6FBs0pTRaUXinYJEqxol+BNnbR3aKU/4Ks6vINbDUQdBewV2l6GzVnNa/nwX/MqI8
	AmWP5GyL2wr6aD86eDdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ1nO-00Ezue-28;
	Wed, 17 Jan 2024 09:01:14 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ1nK-00Eztk-25
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jan 2024 09:01:12 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E19F420007;
	Wed, 17 Jan 2024 09:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1705482065;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VuZ4Un0BLQoRBChJAdwuRDvUgI+N0jme5H6MO6JTRFE=;
	b=fU3OzOqETpVFcXb3/GD+j0na9pcmogonlSJTPxORlkIAt5Uzd81H1ugw6pyookKIewUEoM
	fK4U17jZZkMPT/vS0RWwrDuqtm16gx0pjknvQSVPpfeNNZ/ECYiTRQ+5lIaNa8cagEASrk
	lBMNMwsh4s8HeDZrvE3u0FyaTteWBkgzkzdp4iQHOvoRQEQe/mMmOM893UItPgrn3yRR0Z
	J3Io3VgwS3nkrsA/CbbqOdv2YBdIOwV93yAbD3isfdYt8g6B60B18R7BSKHogKLj2tvJBN
	7ThJLsQj0hU7vN1J8W6Spi1fGr0tSTnptNCXjKXnJGHFblca7ryB4Q/M5NKb2w==
Date: Wed, 17 Jan 2024 10:01:02 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, chao.wei@sophgo.com, unicorn_wang@outlook.com,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	dlan@gentoo.org, inochiama@outlook.com
Subject: Re: [PATCH v6 3/3] riscv: dts: sophgo: add rtc dt node for CV1800
Message-ID: <2024011709010227b73d33@mail.local>
References: <20240115160600.5444-1-qiujingbao.dlmu@gmail.com>
 <20240115160600.5444-4-qiujingbao.dlmu@gmail.com>
 <f2b3dff2-ce0d-4ddb-ad61-74abf2c3022d@linaro.org>
 <CAJRtX8QFLoWnJBkepZrbneHX8qZdde=aw+zbdErVC91B=u==MA@mail.gmail.com>
 <007e8c14-13eb-4917-b9da-8d47d6c965c7@linaro.org>
 <CAJRtX8ROH4R_s1=ML5ka340PAE0SWJKK24yVWHw5gCd+7d9pkA@mail.gmail.com>
 <dfcf74a9-db76-43fe-9261-20bf7a993bc3@linaro.org>
 <CAJRtX8Tkie+ykLv8L2EgBQcy9tVP5Yz-_J_eHE-9N9hjt+6gkg@mail.gmail.com>
 <20240116165356eaa221fe@mail.local>
 <CAJRtX8S9dQddoxWv9T36i852ZgX6x-kjYvrGvRNd-2cXD8B=wQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJRtX8S9dQddoxWv9T36i852ZgX6x-kjYvrGvRNd-2cXD8B=wQ@mail.gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240117_010111_096912_CBF66398 
X-CRM114-Status: GOOD (  41.03  )
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

T24gMTcvMDEvMjAyNCAxMDo1NDowOCswODAwLCBKaW5nYmFvIFFpdSB3cm90ZToKPiBPbiBXZWQs
IEphbiAxNywgMjAyNCBhdCAxMjo1M+KAr0FNIEFsZXhhbmRyZSBCZWxsb25pCj4gPGFsZXhhbmRy
ZS5iZWxsb25pQGJvb3RsaW4uY29tPiB3cm90ZToKPiA+Cj4gPiBPbiAxNy8wMS8yMDI0IDAwOjI5
OjI4KzA4MDAsIEppbmdiYW8gUWl1IHdyb3RlOgo+ID4gPiBPbiBXZWQsIEphbiAxNywgMjAyNCBh
dCAxMjowM+KAr0FNIEtyenlzenRvZiBLb3psb3dza2kKPiA+ID4gPGtyenlzenRvZi5rb3psb3dz
a2lAbGluYXJvLm9yZz4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBPbiAxNi8wMS8yMDI0IDE2OjUx
LCBKaW5nYmFvIFFpdSB3cm90ZToKPiA+ID4gPiA+Pj4gQ1YxODAwIGlzIGEgUklTQ1YgYmFzZWQg
U09DIHRoYXQgaW5jbHVkZXMgYW4gUlRDIG1vZHVsZS4gVGhlIFJUQwo+ID4gPiA+ID4+PiBtb2R1
bGUgaGFzIGFuIE9TQyBvc2NpbGxhdG9yCj4gPiA+ID4gPj4KPiA+ID4gPiA+Pgo+ID4gPiA+ID4+
IEkgYW0gbm90IGdvaW5nIHRvIHJlYWQgcGFnZXMgb2YgZGVzY3JpcHRpb24uIFBsZWFzZSB3cml0
ZSBjb25jaXNlIHJlcGxpZXMuCj4gPiA+ID4gPgo+ID4gPiA+ID4gVGhhbmtzLCBXaGF0IEkgbWVh
biBpcyB0aGF0IHRoaXMgaGFyZHdhcmUgaW5jbHVkZXMgdHdvIGZ1bmN0aW9ucywgUlRDCj4gPiA+
ID4gPiBhbmQgUE9SLiBIb3cgc2hvdWxkIEkgZGVzY3JpYmUgdGhlaXIgcmVsYXRpb25zaGlwPwo+
ID4gPiA+Cj4gPiA+ID4gWW91ciBQT1IgZG9lcyBub3QgbmVlZCB0byB0YWtlIGFueSByZXNvdXJj
ZXMsIHNvIG5vIG5lZWQgdG8gZGVzY3JpYmUgYW55Cj4gPiA+ID4gcmVsYXRpb25zaGlwLgo+ID4g
PiA+Cj4gPiA+ID4gLi4uCj4gPiA+ID4KPiA+ID4gPiA+Pj4gWW91ciBzdWdnZXN0aW9uIGlzLCBm
aXJzdGx5LCB0aGUgcG9yIHN1Ym1vZHVsZSBkb2VzIG5vdCBoYXZlIGFueQo+ID4gPiA+ID4+PiBy
ZXNvdXJjZXMsIHNvIGl0IHNob3VsZCBiZSBkZWxldGVkLgo+ID4gPiA+ID4+Cj4gPiA+ID4gPj4g
U28gd2hlcmUgZGlkIHlvdSBkZWxldGUgaXQ/IEkgc3RpbGwgc2VlIGl0IGluIHRoaXMgcGF0Y2gu
Cj4gPiA+ID4gPgo+ID4gPiA+ID4gU2hvdWxkIEkgY29tcGxldGVseSBkZWxldGUgaGltPyBIb3cg
Y2FuIGEgcG9yIGRyaXZlciBvYnRhaW4gZGV2aWNlIGluZm9ybWF0aW9uPwo+ID4gPiA+Cj4gPiA+
ID4gRGVsZXRlIGNvbXBsZXRlbHkuCj4gPiA+ID4KPiA+ID4gPiBEZXZpY2UgaW5mb3JtYXRpb24/
IFdoYXQgaXMgdGhpcz8gV2UgYWxyZWFkeSBhZ3JlZWQgeW91IGRvbid0IGhhdmUgYW55Cj4gPiA+
ID4gcmVzb3VyY2VzIGZvciBQT1IuCj4gPiA+ID4KPiA+ID4gPiAuLi4uCj4gPiA+ID4KPiA+ID4g
PiA+PiBEZXZpY2UgaXMgb25seSBvbmUgdGhpbmcsIG5vdCB0d28uCj4gPiA+ID4gPj4KPiA+ID4g
PiA+Pj4gICAgICAgICAgICAgICAgICAgICByZWcgPSA8MHg1MDI1MDAwIDB4MjAwMD47Cj4gPiA+
ID4gPj4+ICAgICAgICAgICAgICAgICAgICAgaW50ZXJydXB0cyA9IDwxNyBJUlFfVFlQRV9MRVZF
TF9ISUdIPjsKPiA+ID4gPiA+Pj4gICAgICAgICAgICAgICAgICAgICBjbG9ja3MgPSA8Jm9zYz47
Cj4gPiA+ID4gPj4+IH07Cj4gPiA+ID4gPj4+IEhvd2V2ZXIsIGluIHJlYWxpdHksIHRoZSBQT1Ig
c3VibW9kdWxlIGRvZXMgbm90IHVzZSBJUlEgYW5kIENMSy4KPiA+ID4gPiA+Pj4gUGxlYXNlIGRv
IG5vdCBoZXNpdGF0ZSB0byB0ZWFjaC4gVGhhbmtzLgo+ID4gPiA+ID4+Cj4gPiA+ID4gPj4gSSBl
eHBlY3Qgb25lIGRldmljZSBub2RlLiBIb3cgbWFueSBkcml2ZXJzIHlvdSBoYXZlIGRvZXMgbm90
IG1hdHRlcjogeW91Cj4gPiA+ID4gPj4gY2FuIGluc3RhbnRpYXRlIDEwMCBMaW51eCBkZXZpY2Vz
IGluIDEwMCBMaW51eCBkZXZpY2UgZHJpdmVycy4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBJIHVuZGVy
c3RhbmQgd2hhdCB5b3UgbWVhbi4gQSBkZXZpY2Ugbm9kZSBjb3JyZXNwb25kcyB0byBtdWx0aXBs
ZSBkcml2ZXJzLgo+ID4gPiA+ID4gU2hvdWxkIEkgY29tcGxldGVseSBkZWxldGUgdGhlIFBPUiBk
ZXZpY2UgdHJlZSBub2RlIGFuZCBhZGQgaXQgd2hlbgo+ID4gPiA+ID4gc3VibWl0dGluZyB0aGUg
UE9SIGRyaXZlcj8KPiA+ID4gPgo+ID4gPiA+ID8gSSB3cm90ZSBpdCBpbiBwcmV2aW91cyBtZXNz
YWdlcyBhbmQgdHdpY2UgaW4gdGhpcyB0aHJlYWQuIENvbXBsZXRlbHkKPiA+ID4gPiBkZWxldGUu
IFlvdSBkbyBub3QgYWRkIGl0IGJhY2shIEJlY2F1c2UgaWYgeW91IGV2ZXIgaW50ZW5kZWQgdG8g
YWRkIGl0Cj4gPiA+ID4gYmFjaywgaXQgc2hvdWxkIGJlIGFkZGVkIHNpbmNlIGJlZ2lubmluZy4g
SSBkb24ndCB1bmRlcnN0YW5kIHdoYXQKPiA+ID4gPiBzdWJtaXR0aW5nIGxhdGVyIHdvdWxkIHNv
bHZlLgo+ID4gPiA+Cj4gPiA+ID4gPiBJZiB0aGF0J3MgdGhlIGNhc2UsIGhvdyBjYW4gSSBleHBs
YWluIHRoYXQgdGhlIHJ0YyBkZXZpY2UgdHJlZSBub2RlCj4gPiA+ID4gPiB1c2VzIHRoZSBzeXNj
b24gdGFnPwo+ID4gPiA+ID4gSG93IGNhbiBJIGRlc2NyaWJlIGEgUE9SIGRldmljZSBpbiBEVFM/
IFBPUiBpcyBhIHN1Ym1vZHVsZSBvZiBSVEMsIGFuZAo+ID4gPiA+ID4gaXQgYWxzbyBoYXMgY29y
cmVzcG9uZGluZyBkcml2ZXJzLgo+ID4gPiA+Cj4gPiA+ID4gSSBzYWlkLCB0aGVyZSBpcyBubyBu
ZWVkIGZvciBQT1IgaW4gRFRTLCBiZWNhdXNlIHlvdSBoYXZlIG5vdGhpbmcgdGhlcmUuCj4gPiA+
ID4gV2h5IGRvIHlvdSBpbnNpc3Qgb24gcHV0dGluZyBpdCBvbiBEVFM/Cj4gPiA+ID4KPiA+ID4g
PiA+IEl0J3MganVzdCB0aGF0IGhpcyByZXNvdXJjZXMgYXJlIG9ubHkgc2hhcmVkIHdpdGggUlRD
J3MgUmVnLgo+ID4gPiA+Cj4gPiA+ID4gV2hhdCByZXNvdXJjZXM/IFJlZz8gVGhhdCdzIG5vdCBh
IHNlcGFyYXRlIHJlc291cmNlLgo+ID4gPgo+ID4gPiBJJ20gdmVyeSBzb3JyeSBhYm91dCB0aGlz
Lgo+ID4gPiBCdXQgSSBmb3VuZCBhIGJpbmRpbmcgZmlsZSB0aGF0IG9ubHkgY29udGFpbnMgUmVn
IGFuZCBDb21wYXRpYmxlLgo+ID4gPgo+ID4gPiBydGNAODA5MjAwMDAgewo+ID4gPiBjb21wYXRp
YmxlID0gImNpcnJ1cyxlcDkzMDEtcnRjIjsKPiA+ID4gcmVnID0gPDB4ODA5MjAwMDAgMHgxMDA+
Owo+ID4gPiB9Owo+ID4gPgo+ID4gPiBMaW5rOiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvcnRjL2NpcnJ1cyxlcDkzMDEtcnRjLnlhbWwKPiA+ID4KPiA+ID4gPgo+ID4gPiA+IFRv
IHN1bW1hcml6ZTogRHJvcCBQT1IgZnJvbSBEVFMgYW5kIG5ldmVyIGJyaW5nIGl0IGJhY2ssIHVu
bGVzcyB5b3UgY29tZQo+ID4gPiA+IHdpdGggc29tZSBkaWZmZXJlbnQgYXJndW1lbnRzLCB3aGlj
aCB5b3UgZGlkIG5vdCBzYXkgYWxyZWFkeS4KPiA+ID4gPgo+ID4gPgo+ID4gPiBZb3UgYXJlIHJp
Z2h0LCBpZiB0aGVyZSBpcyBubyBwb3IgZGV2aWNlIHRyZWUgbm9kZSwgaG93IGNhbiB0aGUgcG9y
Cj4gPiA+IGRyaXZlciBvYnRhaW4gdGhlIFJlZz8KPiA+Cj4gPiBJIGd1ZXNzIHRoZSBxdWVzdGlv
biBpcyB3aHkgZG9uJ3QgeW91IHJlZ2lzdGVyIGV2ZXJ5dGhpbmcgZnJvbSB0aGUgUlRDCj4gPiBk
cml2ZXI/Cj4gCj4gVGhhbmtzLCBQT1IgcHJvdmlkZXMgcG93ZXIgb2ZmIGFuZCByZXN0YXJ0IGZ1
bmN0aW9ucyBhcyBhIGNoaWxkIG5vZGUgb2YgUlRDLgo+IFNvLCBJIHRoaW5rIGl0IHNob3VsZCBi
ZSBwbGFjZWQgaW4gdGhlIHBvd2VyL3Jlc2V0IGRpcmVjdG9yeS4KCk5vIGl0IGRvZXNuJ3QsIGhh
dmUgYSBsb29rIGF0IHRoZSBqejQ3NDAgcnRjIGRyaXZlcgoKPiAKPiBCZXN0IHJlZ2FyZHMsCj4g
SmluZ2JhbyBRaXUKCi0tIApBbGV4YW5kcmUgQmVsbG9uaSwgY28tb3duZXIgYW5kIENPTywgQm9v
dGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxp
bi5jb20KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
