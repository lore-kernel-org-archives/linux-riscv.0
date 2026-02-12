Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E513EE3694
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Feb 2026 14:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d8suTfRyuq++UCB/KmqC3cFKDN+3ASoXKEEhQg/75ro=; b=BwbVqkle5q8KHc
	DZ0pNuCHYLi1B13IhSIMWrf5K/HurB7lJ1RtvDRM1NPUhFtSAp+FlST5yCNZbRH7GrGuwm8RfGJDL
	wa9eG9R4mbmg0ojFTFeldsUU5izwdYVQa+yYi1zcaYvmIL++TFXp90wOY8nv3ryN6wLcWFw3bKIMm
	b1hTQUVEvRwTXX9Cyi4iH9a9QeAYa8J/ozFj42UCpQZ8whaaYU2KcrsHocVspbfiOhnLQRqmSZGMC
	YSEY7uBSvuC8hnIAtNoPIHx2o9JUOrtzp0IyzylzY2M3hY2tfcekub8Gdlb+s9Fr48qUR8AxO0B74
	2KxOkTBqhsFvHWNsSYlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqY7S-00000002EHp-2uKv;
	Thu, 12 Feb 2026 14:56:39 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqY7K-00000002EHI-34qv
	for linux-riscv@lists.infradead.org;
	Thu, 12 Feb 2026 14:56:37 +0000
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-66103641d76so1424968eaf.1
        for <linux-riscv@lists.infradead.org>; Thu, 12 Feb 2026 06:56:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770908189; cv=none;
        d=google.com; s=arc-20240605;
        b=FYBOGjEuta+INKyU4v5lN2weSwImwjfzVykzfXQXxi5wD7ih2xYeH8eyG0OzaaZLDB
         3ev4y3nuJ+VU82B4p0wYAJGvV+108QsPgSYUBFzQfUR8tKIf71Lv5iY5SHSHsF4xeFH9
         PmvzrWiOVJQrK32s5eIx/DSYjpgqyNB7BeJI7k+u2izaVHZk54xtLWeRarkdC4orK5hm
         RJAjL2TtS9AqsDfd8GYh0UCPOZDz7ttG7cwFGj4Pkde4Lvf2ER9eofrD7jb23e2Z6qYs
         e1Y7up1mxpa3D1iPePruf9CUDwHSHi4FNZ0v/hEpU1NotSnQ22K9jNnzWNdhYLxQcwzY
         BDKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Whyzwajta14y7TRhkZKDO7TWWt4S5sk7qcVD8mUXNl0=;
        fh=eDVatG3xXW5J7Qqj4YAIkde+aUvgMT4Gv0puOLiWul0=;
        b=YEMNNvMgN421vo0yhgkWahH7nUzcrsVBChAISY+3gJoanW6cPMSJS7+lnEJqpPryqs
         f9OBykwG+vfrKF01QXw16JiFm2LnkclHFIAwCPhed6qXd3V2OeyAlA58QGxobkSjBcT1
         WBPhQRaGzctLkD0i+2LaffoLldUdZA5886QoRz0zt+NbUAQwPt6Ws9wihn4AfSV7OEIG
         QqTXsaOMmEQZUJ4EREbhqI5n4fhtiuGDsSIaNTS72jQYKZpvdr/3wTGv6kVvd6r7u+QL
         kMq1HiH/aNMm6iGrE/4QAVWFrQaWyguR2yJXRfbB15H7Zr/g7XfHhhgxyh8OjuCAQ+zS
         9BUw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1770908189; x=1771512989; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Whyzwajta14y7TRhkZKDO7TWWt4S5sk7qcVD8mUXNl0=;
        b=B1tY4kR24c+G1bLZxWAwbYkKavfBrmBWP66nMSo96nePZkvvA+J+NgH2jqRp0CVYnx
         VdE0NqmdHd/lVrtOVkn47aF4VtvoJ26gZ00hucTFhKG6uWaaYivdo275jeTU1KCixQJA
         IWSUi13Jj422SSJChrYld45Ng6iEb6BsVqnw1KZS921pvurcV5q0Cfm/kPmM4j31ZQSr
         DyzcdsSYzyoItD1h9Z1OR3lncaCN4hR4AOIPAuuaTfJ8Uw9pSvUtb6r2CU4SWZ+CyZVc
         xI2OFSwqlEc1tf6nRK9zkfMtOAIfbTtXMGOdOTNFLHyDNAv2XAs5qVtF2W/j6d0YSNJF
         kw4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770908189; x=1771512989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Whyzwajta14y7TRhkZKDO7TWWt4S5sk7qcVD8mUXNl0=;
        b=O8RQrVWt3+H8lNY+IDgqreuRnwM95Je1fJtRAeCM93Mu3nrKYc2g4QcgrjsbipCVgC
         13z8wd8+CcullIRhSEEl7k54mbVgalZtNNFn4ucYFqHEjpjCajUfBl/sDVFksQos9eue
         pPSX2ggRQ4+H8GXcauAV1vx+bpDcWfhs9OoAEs9q2w01HAAbTRtxo5wxcAydKJKAXnzK
         jkTxS5Jvbp7bvmppbI7M9JP+ygD8qyTefkUoLTxT4TbUhTPDucd4mycO31fvvMGiShIP
         Lb9hlU4eaKaewCCuXTjMk5jjW/EysjhuI8zv73O4cvuKyqimNIYJFxqlt8B3lV5jQQFN
         T25A==
X-Forwarded-Encrypted: i=1; AJvYcCWV0f2mrTH3B9hw8jA7bvx+3oHJn6P13Z+UK/4FJh3Wou5Et5OcoMMxb0V6JLsx+pJguKA/9bsyUFU5Xw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywz4MGmfA0ibLpf8TaroldOPFOgAKaxO3u7/kzWGDPRDEKKwMAj
	+pxrF8ujf2c6HH70Xd4ESqLNw45JAHIys2YnTP/VNlcNpybEQdhGmF1lickcFAlOkbzijxe5csZ
	vHIh1giGQyLmwbjlRzW9h1Fq5HOP3WxqD8smMpn+jMg==
X-Gm-Gg: AZuq6aLiHiWCVaaCysX0lH8nUqg9ovm7YXSCTQxeAs29r+SEfahFQsxs05L5NdSPJJr
	cIdbTB8mcAAMjARMkAQs0BOuSOAgYY3Q7SLhJ8iQIvo/KhsXEkVQ4x/FyJtGChLNR/u2VDmdVCG
	cW9UVv36IZI2UwbaeFZUC+iXy+/tflQ66KzGomh3/YPd3XwBHsyace26UMPvTPJWGK0kUzxS8BK
	jjKHGzlymlmQcnCY/0k2FpDwo9fr54Y1Bd0O+hhJ/HZTRilOnjWdt0GQBPYHCqh6LWK3RKL95wN
	zpbei6md9XVvkbN9eHvys8Uvaeb7PO60MUtrp5TSUn6UELwmTb0x87qs5dt1ATabiqRU7uo=
X-Received: by 2002:a4a:e90a:0:b0:662:c6f1:9231 with SMTP id
 006d021491bc7-67598658084mr1154531eaf.4.1770908189582; Thu, 12 Feb 2026
 06:56:29 -0800 (PST)
MIME-Version: 1.0
References: <20260212135337.18308-1-guoyaxing@bosc.ac.cn>
In-Reply-To: <20260212135337.18308-1-guoyaxing@bosc.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 12 Feb 2026 20:26:15 +0530
X-Gm-Features: AZwV_Qg6czl03refqOI4PPIjan3n-YGHjk4u2blBEQ3zgExKUAxj49u5AJpgkSk
Message-ID: <CAAhSdy2HhRYVC+whNpNXGPBo8BLU5Ljf2QvzNszu1WDVM1P+Yw@mail.gmail.com>
Subject: Re: [PATCH v1] riscv/imsic: add support for IRQ_MSI_IOMMU and map MSI
 pages through IOMMU
To: Yaxing Guo <guoyaxing@bosc.ac.cn>
Cc: tglx@linutronix.de, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_065636_186242_E1220316 
X-CRM114-Status: GOOD (  26.13  )
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

T24gVGh1LCBGZWIgMTIsIDIwMjYgYXQgNzoyNOKAr1BNIFlheGluZyBHdW8gPGd1b3lheGluZ0Bi
b3NjLmFjLmNuPiB3cm90ZToKPgo+IFRoaXMgcGF0Y2ggYWRkcyBzdXBwb3J0IGZvciBDT05GSUdf
SVJRX01TSV9JT01NVSBpbiB0aGUgUklTQy1WIElNU0lDCj4gZHJpdmVyIGJ5IGNhbGxpbmcgaW9t
bXVfZG1hX3ByZXBhcmVfbXNpKCksIHdoaWNoIGFsbG9jYXRlcyBhbiBJT1ZBCj4gYW5kIG1hcHMg
dGhlIHBoeXNpY2FsIElNU0lDIE1TSSBhZGRyZXNzIGludG8gdGhlIGRldmljZSBkb21haW4uIFRo
ZQo+IE1TSSBtZXNzYWdlIGFkZHJlc3MgaXMgdGhlbiB3cml0dGVuIHRvIHVzZSB0aGUgSU9WQSwg
ZW5zdXJpbmcgSU9NTVUKPiB0cmFuc2xhdGlvbiBzdWNjZWVkcyBvbiBNU0kgd3JpdGVzLgo+Cj4g
V2l0aCB0aGlzIGNoYW5nZSwgUENJZSBvciBwbGF0Zm9ybSBkZXZpY2VzIHVzaW5nIElNU0lDLWJh
c2VkIE1TSSBjYW4KPiBvcGVyYXRlIGNvcnJlY3RseSB1bmRlciBJT01NVSBpc29sYXRpb24uCj4K
PiBTaWduZWQtb2ZmLWJ5OiBZYXhpbmcgR3VvIDxndW95YXhpbmdAYm9zYy5hYy5jbj4KClRoZXJl
IHNob3VsZCBub3QgYmUgYW55IG5ldyB1c2VycyBvZiBpb21tdV9kbWFfcHJlcGFyZV9tc2koKSBB
UEkKaW5zdGVhZCwgaW50ZXJydXB0IHJlbWFwIGRvbWFpbiBpbXBsZW1lbnRlZCBieSB0aGUgSU9N
TVUgZHJpdmVyIGlzCnRoZSByaWdodCBhcHByb2FjaC4KClBsZWFzZSByZWZlciB0byBwYXN0IGRp
c2N1c3Npb25zIHdoZW4gdGhlIEFJQSBzZXJpZXMgd2FzIHVuZGVyIHJldmlldy4KKGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2FsbC9aSW5TcUM2YjdSUEQxbnpYQHppZXBlLmNhLykKClJlZ2FyZHMs
CkFudXAKCj4gLS0tCj4gIGRyaXZlcnMvaXJxY2hpcC9LY29uZmlnICAgICAgICAgICAgICAgICAg
ICB8ICAxICsKPiAgZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1wbGF0Zm9ybS5jIHwg
MzIgKysrKysrKysrKysrKysrKy0tLS0tLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDI1IGluc2VydGlv
bnMoKyksIDggZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pcnFjaGlwL0tj
b25maWcgYi9kcml2ZXJzL2lycWNoaXAvS2NvbmZpZwo+IGluZGV4IDkzNmQyN2MzMThlOC4uYjc3
ODYyMWFkMjUyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaXJxY2hpcC9LY29uZmlnCj4gKysrIGIv
ZHJpdmVycy9pcnFjaGlwL0tjb25maWcKPiBAQCAtNjMzLDYgKzYzMyw3IEBAIGNvbmZpZyBSSVND
Vl9JTVNJQwo+ICAgICAgICAgc2VsZWN0IEdFTkVSSUNfSVJRX01BVFJJWF9BTExPQ0FUT1IKPiAg
ICAgICAgIHNlbGVjdCBHRU5FUklDX01TSV9JUlEKPiAgICAgICAgIHNlbGVjdCBJUlFfTVNJX0xJ
Qgo+ICsgICAgICAgc2VsZWN0IElSUV9NU0lfSU9NTVUKPgo+ICBjb25maWcgUklTQ1ZfUlBNSV9T
WVNNU0kKPiAgICAgICAgIGJvb2wKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pcnFjaGlwL2lycS1y
aXNjdi1pbXNpYy1wbGF0Zm9ybS5jIGIvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1w
bGF0Zm9ybS5jCj4gaW5kZXggNjQzYzhlNDU5NjExLi43ZWViMmRjNTlkODIgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1wbGF0Zm9ybS5jCj4gKysrIGIvZHJp
dmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1wbGF0Zm9ybS5jCj4gQEAgLTE5LDYgKzE5LDcg
QEAKPiAgI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPgo+ICAjaW5jbHVkZSA8bGlu
dXgvc3BpbmxvY2suaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3NtcC5oPgo+ICsjaW5jbHVkZSA8bGlu
dXgvaW9tbXUuaD4KPgo+ICAjaW5jbHVkZSA8bGludXgvaXJxY2hpcC9pcnEtbXNpLWxpYi5oPgo+
ICAjaW5jbHVkZSAiaXJxLXJpc2N2LWltc2ljLXN0YXRlLmgiCj4gQEAgLTY5LDcgKzcwLDggQEAg
c3RhdGljIHZvaWQgaW1zaWNfaXJxX2FjayhzdHJ1Y3QgaXJxX2RhdGEgKmQpCj4gICAgICAgICBp
cnFfbW92ZV9pcnEoZCk7Cj4gIH0KPgo+IC1zdGF0aWMgdm9pZCBpbXNpY19pcnFfY29tcG9zZV92
ZWN0b3JfbXNnKHN0cnVjdCBpbXNpY192ZWN0b3IgKnZlYywgc3RydWN0IG1zaV9tc2cgKm1zZykK
PiArc3RhdGljIHZvaWQgaW1zaWNfaXJxX2NvbXBvc2VfdmVjdG9yX21zZyhzdHJ1Y3QgaXJxX2Rh
dGEgKmQsIHN0cnVjdCBpbXNpY192ZWN0b3IgKnZlYywKPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHN0cnVjdCBtc2lfbXNnICptc2cpCj4gIHsKPiAgICAgICAgIHBo
eXNfYWRkcl90IG1zaV9hZGRyOwo+Cj4gQEAgLTc5LDE0ICs4MSwxMyBAQCBzdGF0aWMgdm9pZCBp
bXNpY19pcnFfY29tcG9zZV92ZWN0b3JfbXNnKHN0cnVjdCBpbXNpY192ZWN0b3IgKnZlYywgc3Ry
dWN0IG1zaV9tcwo+ICAgICAgICAgaWYgKFdBUk5fT04oIWltc2ljX2NwdV9wYWdlX3BoeXModmVj
LT5jcHUsIDAsICZtc2lfYWRkcikpKQo+ICAgICAgICAgICAgICAgICByZXR1cm47Cj4KPiAtICAg
ICAgIG1zZy0+YWRkcmVzc19oaSA9IHVwcGVyXzMyX2JpdHMobXNpX2FkZHIpOwo+IC0gICAgICAg
bXNnLT5hZGRyZXNzX2xvID0gbG93ZXJfMzJfYml0cyhtc2lfYWRkcik7Cj4gICAgICAgICBtc2ct
PmRhdGEgPSB2ZWMtPmxvY2FsX2lkOwo+ICsgICAgICAgbXNpX21zZ19zZXRfYWRkcihpcnFfZGF0
YV9nZXRfbXNpX2Rlc2MoZCksIG1zZywgbXNpX2FkZHIpOwo+ICB9Cj4KPiAgc3RhdGljIHZvaWQg
aW1zaWNfaXJxX2NvbXBvc2VfbXNnKHN0cnVjdCBpcnFfZGF0YSAqZCwgc3RydWN0IG1zaV9tc2cg
Km1zZykKPiAgewo+IC0gICAgICAgaW1zaWNfaXJxX2NvbXBvc2VfdmVjdG9yX21zZyhpcnFfZGF0
YV9nZXRfaXJxX2NoaXBfZGF0YShkKSwgbXNnKTsKPiArICAgICAgIGltc2ljX2lycV9jb21wb3Nl
X3ZlY3Rvcl9tc2coZCwgaXJxX2RhdGFfZ2V0X2lycV9jaGlwX2RhdGEoZCksIG1zZyk7Cj4gIH0K
Pgo+ICAjaWZkZWYgQ09ORklHX1NNUAo+IEBAIC05NCwxMyArOTUsMTUgQEAgc3RhdGljIHZvaWQg
aW1zaWNfbXNpX3VwZGF0ZV9tc2coc3RydWN0IGlycV9kYXRhICpkLCBzdHJ1Y3QgaW1zaWNfdmVj
dG9yICp2ZWMpCj4gIHsKPiAgICAgICAgIHN0cnVjdCBtc2lfbXNnIG1zZyA9IHsgfTsKPgo+IC0g
ICAgICAgaW1zaWNfaXJxX2NvbXBvc2VfdmVjdG9yX21zZyh2ZWMsICZtc2cpOwo+ICsgICAgICAg
aW1zaWNfaXJxX2NvbXBvc2VfdmVjdG9yX21zZyhkLCB2ZWMsICZtc2cpOwo+ICAgICAgICAgaXJx
X2RhdGFfZ2V0X2lycV9jaGlwKGQpLT5pcnFfd3JpdGVfbXNpX21zZyhkLCAmbXNnKTsKPiAgfQo+
Cj4gIHN0YXRpYyBpbnQgaW1zaWNfaXJxX3NldF9hZmZpbml0eShzdHJ1Y3QgaXJxX2RhdGEgKmQs
IGNvbnN0IHN0cnVjdCBjcHVtYXNrICptYXNrX3ZhbCwKPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgYm9vbCBmb3JjZSkKPiAgewo+ICsgICAgICAgaW50IGVycjsKPiArICAgICAg
IHBoeXNfYWRkcl90IG1zaV9wYTsKPiAgICAgICAgIHN0cnVjdCBpbXNpY192ZWN0b3IgKm9sZF92
ZWMsICpuZXdfdmVjOwo+ICAgICAgICAgc3RydWN0IGltc2ljX3ZlY3RvciB0bXBfdmVjOwo+Cj4g
QEAgLTEzNSw2ICsxMzgsMTEgQEAgc3RhdGljIGludCBpbXNpY19pcnFfc2V0X2FmZmluaXR5KHN0
cnVjdCBpcnFfZGF0YSAqZCwgY29uc3Qgc3RydWN0IGNwdW1hc2sgKm1hc2sKPiAgICAgICAgIGlm
ICghbmV3X3ZlYykKPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9TUEM7Cj4KPiArICAgICAg
IGltc2ljX2NwdV9wYWdlX3BoeXMobmV3X3ZlYy0+Y3B1LCAwLCAmbXNpX3BhKTsKPiArICAgICAg
IGVyciA9IGlvbW11X2RtYV9wcmVwYXJlX21zaShpcnFfZGF0YV9nZXRfbXNpX2Rlc2MoZCksIG1z
aV9wYSk7Cj4gKyAgICAgICBpZiAoZXJyKQo+ICsgICAgICAgICAgICAgICByZXR1cm4gZXJyOwo+
ICsKPiAgICAgICAgIC8qCj4gICAgICAgICAgKiBEZXZpY2UgaGF2aW5nIG5vbi1hdG9taWMgTVNJ
IHVwZGF0ZSBtaWdodCBzZWUgYW4gaW50ZXJtZWRpYXRlCj4gICAgICAgICAgKiBzdGF0ZSB3aGVu
IGNoYW5naW5nIHRhcmdldCBJTVNJQyB2ZWN0b3IgZnJvbSBvbmUgQ1BVIHRvIGFub3RoZXIuCj4g
QEAgLTE2MSwxMiArMTY5LDEyIEBAIHN0YXRpYyBpbnQgaW1zaWNfaXJxX3NldF9hZmZpbml0eShz
dHJ1Y3QgaXJxX2RhdGEgKmQsIGNvbnN0IHN0cnVjdCBjcHVtYXNrICptYXNrCj4gICAgICAgICAg
ICAgICAgIGltc2ljX21zaV91cGRhdGVfbXNnKGlycV9nZXRfaXJxX2RhdGEoZC0+aXJxKSwgJnRt
cF92ZWMpOwo+ICAgICAgICAgfQo+Cj4gLSAgICAgICAvKiBQb2ludCBkZXZpY2UgdG8gdGhlIG5l
dyB2ZWN0b3IgKi8KPiAtICAgICAgIGltc2ljX21zaV91cGRhdGVfbXNnKGlycV9nZXRfaXJxX2Rh
dGEoZC0+aXJxKSwgbmV3X3ZlYyk7Cj4gLQo+ICAgICAgICAgLyogVXBkYXRlIGlycSBkZXNjcmlw
dG9ycyB3aXRoIHRoZSBuZXcgdmVjdG9yICovCj4gICAgICAgICBkLT5jaGlwX2RhdGEgPSBuZXdf
dmVjOwo+Cj4gKyAgICAgICAvKiBQb2ludCBkZXZpY2UgdG8gdGhlIG5ldyB2ZWN0b3IgKi8KPiAr
ICAgICAgIGltc2ljX21zaV91cGRhdGVfbXNnKGlycV9nZXRfaXJxX2RhdGEoZC0+aXJxKSwgbmV3
X3ZlYyk7Cj4gKwo+ICAgICAgICAgLyogVXBkYXRlIGVmZmVjdGl2ZSBhZmZpbml0eSAqLwo+ICAg
ICAgICAgaXJxX2RhdGFfdXBkYXRlX2VmZmVjdGl2ZV9hZmZpbml0eShkLCBjcHVtYXNrX29mKG5l
d192ZWMtPmNwdSkpOwo+Cj4gQEAgLTIyNSw2ICsyMzMsOSBAQCBzdGF0aWMgc3RydWN0IGlycV9j
aGlwIGltc2ljX2lycV9iYXNlX2NoaXAgPSB7Cj4gIHN0YXRpYyBpbnQgaW1zaWNfaXJxX2RvbWFp
bl9hbGxvYyhzdHJ1Y3QgaXJxX2RvbWFpbiAqZG9tYWluLCB1bnNpZ25lZCBpbnQgdmlycSwKPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IG5yX2lycXMsIHZv
aWQgKmFyZ3MpCj4gIHsKPiArICAgICAgIGludCBlcnI7Cj4gKyAgICAgICBtc2lfYWxsb2NfaW5m
b190ICppbmZvID0gYXJnczsKPiArICAgICAgIHBoeXNfYWRkcl90IG1zaV9wYTsKPiAgICAgICAg
IHN0cnVjdCBpbXNpY192ZWN0b3IgKnZlYzsKPgo+ICAgICAgICAgLyogTXVsdGktTVNJIGlzIG5v
dCBzdXBwb3J0ZWQgeWV0LiAqLwo+IEBAIC0yMzUsNiArMjQ2LDExIEBAIHN0YXRpYyBpbnQgaW1z
aWNfaXJxX2RvbWFpbl9hbGxvYyhzdHJ1Y3QgaXJxX2RvbWFpbiAqZG9tYWluLCB1bnNpZ25lZCBp
bnQgdmlycSwKPiAgICAgICAgIGlmICghdmVjKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVO
T1NQQzsKPgo+ICsgICAgICAgaW1zaWNfY3B1X3BhZ2VfcGh5cyh2ZWMtPmNwdSwgMCwgJm1zaV9w
YSk7Cj4gKyAgICAgICBlcnIgPSBpb21tdV9kbWFfcHJlcGFyZV9tc2koaW5mby0+ZGVzYywgbXNp
X3BhKTsKPiArICAgICAgIGlmIChlcnIpCj4gKyAgICAgICAgICAgICAgIHJldHVybiBlcnI7Cj4g
Kwo+ICAgICAgICAgaXJxX2RvbWFpbl9zZXRfaW5mbyhkb21haW4sIHZpcnEsIHZpcnEsICZpbXNp
Y19pcnFfYmFzZV9jaGlwLCB2ZWMsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIGhhbmRs
ZV9lZGdlX2lycSwgTlVMTCwgTlVMTCk7Cj4gICAgICAgICBpcnFfc2V0X25vcHJvYmUodmlycSk7
Cj4gLS0KPiAyLjM0LjEKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
