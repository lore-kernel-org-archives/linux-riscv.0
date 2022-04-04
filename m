Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14FFFC433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Apr 2022 15:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B44SxJ8vCXo+WjbezK+tZ9yoxWOZdcHGaeBPKDZ1gYw=; b=mX1bUaNNonYBuc
	CoOmjC3M6HkKryBASZ+EZxUEkuPbSO5mX1OMTDjcVGSf0AxpTNJQIpvfELS/MOM1Uj3mRJB91rBDc
	veuddfvYQ4yh75Maf9eQjPck33FUk1llEw84v6jc5un4o3AwxdBHkfDY2fFDVupJncGcEW8/3Rtjr
	ZKnNjyklcwf7d8hJUhVmz5VmdFJ9aLuj//gnbdAeC1Xnbp+7j6CRiQz93j3fdJNZg0iYYDCMXt5bt
	P+kNoaHnSa7ksGq1HAGyd6mUFvPYdZUjFk2jZLUyUVgzt2DvVHVORvDXKDueYPiBwsc2ALbg82K96
	RWsPhJId6ISFt+vCSy4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbOEH-00FTS7-TV; Mon, 04 Apr 2022 15:02:53 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbOEB-00FTP0-Hc
 for linux-riscv@lists.infradead.org; Mon, 04 Apr 2022 15:02:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D317DB81065;
 Mon,  4 Apr 2022 15:02:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0444CC340EE;
 Mon,  4 Apr 2022 15:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1649084564;
 bh=DSyr/AuapRImCrjmRCEvAPYtyLzoTPYJz8OafeBekS8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=naW15HUkpTiiBzJlkVtO0Zfifg/rwX7VjL5I0XYYjQwKRzdSELAEoyb1vCu9IfsoU
 57VWRv5Qrlx0ICiAVzuCPD/A9yEZAAZv4/VXth5pJmPYkgQjc5+tlu+zce7/ujv972
 uffGmFB/hwk/8I+Pe+IZp6wCtQ1vTYrRA8ityj8s=
Date: Mon, 4 Apr 2022 17:02:41 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: ogabbay@kernel.org, linux-riscv@lists.infradead.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 osharabi@habana.ai
Subject: Re: [PATCH] habanalabs: Elide a warning on 32-bit targets
Message-ID: <YksIkY0l8k7mmnzJ@kroah.com>
References: <CAFCwf13-o=kUR61xjWt=F-Q-Vfy=kF6fpMP7iB+83Gfqw7+2HA@mail.gmail.com>
 <mhng-89bfa679-14d3-436e-80e1-439ab154beb2@palmer-mbp2014>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-89bfa679-14d3-436e-80e1-439ab154beb2@palmer-mbp2014>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_080247_937019_3EA72DB8 
X-CRM114-Status: GOOD (  35.26  )
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

T24gRnJpLCBBcHIgMDEsIDIwMjIgYXQgMTE6MzY6NTNBTSAtMDcwMCwgUGFsbWVyIERhYmJlbHQg
d3JvdGU6Cj4gT24gRnJpLCAwMSBBcHIgMjAyMiAxMToxMzo0OCBQRFQgKC0wNzAwKSwgb2dhYmJh
eUBrZXJuZWwub3JnIHdyb3RlOgo+ID4gT24gRnJpLCBBcHIgMSwgMjAyMiBhdCA3OjQxIFBNIFBh
bG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPiB3cm90ZToKPiA+ID4gCj4gPiA+IEZy
b206IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPgo+ID4gPiAKPiA+ID4gVGhp
cyBkb3VibGUtY2FzdCBwYXR0ZXJuIGxvb2tzIGEgYml0IGF3a3dhcmQsIGJ1dCBpdCBhbHJlYWR5
IGV4aXN0cwo+ID4gPiBlbHNld2hlcmUgaW4gdGhlIGRyaXZlci4gIFdpdGhvdXQgdGhpcyBwYXRj
aCBJIGdldAo+ID4gPiAKPiA+ID4gZHJpdmVycy9taXNjL2hhYmFuYWxhYnMvY29tbW9uL21lbW9y
eS5jOiBJbiBmdW5jdGlvbiDigJhhbGxvY19kZXZpY2VfbWVtb3J54oCZOgo+ID4gPiBkcml2ZXJz
L21pc2MvaGFiYW5hbGFicy9jb21tb24vbWVtb3J5LmM6MTUzOjQ5OiB3YXJuaW5nOiBjYXN0IGZy
b20gcG9pbnRlciB0byBpbnRlZ2VyIG9mIGRpZmZlcmVudCBzaXplIFstV3BvaW50ZXItdG8taW50
LWNhc3RdCj4gPiA+ICAgMTUzIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgKHU2NCkgZ2VuX3Bvb2xfZG1hX2FsbG9jX2FsaWduKHZtLT5kcmFtX3BnX3Bv
b2wsCj4gPiA+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgXgo+ID4gPiAKPiA+ID4gd2hpY2ggZW5kcyB1cCBwcm9tb3RlZCB0byBhIGJ1aWxk
IGVycm9yIGluIG15IHRlc3Qgc2V0dXAuCj4gPiA+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBQYWxt
ZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4KPiA+ID4gCj4gPiA+IC0tLQo+ID4gPiAK
PiA+ID4gSSBkb24ndCBrbm93IGFueXRoaW5nIGFib3V0IHRoaXMgZHJpdmVyLCBJJ20ganVzdCBw
YXR0ZXJuLW1hdGNoaW5nIHRoZQo+ID4gPiB3YXJuaW5nIGF3YXkuCj4gPiA+IC0tLQo+ID4gPiAg
ZHJpdmVycy9taXNjL2hhYmFuYWxhYnMvY29tbW9uL21lbW9yeS5jIHwgMTAgKysrKystLS0tLQo+
ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiA+
ID4gCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21pc2MvaGFiYW5hbGFicy9jb21tb24vbWVt
b3J5LmMgYi9kcml2ZXJzL21pc2MvaGFiYW5hbGFicy9jb21tb24vbWVtb3J5LmMKPiA+ID4gaW5k
ZXggZTAwOGQ4MmU0YmEzLi5mMWZjNzljMWZjMTAgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMv
bWlzYy9oYWJhbmFsYWJzL2NvbW1vbi9tZW1vcnkuYwo+ID4gPiArKysgYi9kcml2ZXJzL21pc2Mv
aGFiYW5hbGFicy9jb21tb24vbWVtb3J5LmMKPiA+ID4gQEAgLTE1MCwxMiArMTUwLDEyIEBAIHN0
YXRpYyBpbnQgYWxsb2NfZGV2aWNlX21lbW9yeShzdHJ1Y3QgaGxfY3R4ICpjdHgsIHN0cnVjdCBo
bF9tZW1faW4gKmFyZ3MsCj4gPiA+ICAgICAgICAgICAgICAgICBmb3IgKGkgPSAwIDsgaSA8IG51
bV9wZ3MgOyBpKyspIHsKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgaWYgKGlzX3Bvd2Vy
X29mXzIocGFnZV9zaXplKSkKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBw
aHlzX3BnX3BhY2stPnBhZ2VzW2ldID0KPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgKHU2NCkgZ2VuX3Bvb2xfZG1hX2FsbG9jX2FsaWduKHZtLT5k
cmFtX3BnX3Bvb2wsCj4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFnZV9zaXplLCBOVUxM
LAo+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhZ2Vfc2l6ZSk7Cj4gPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICh1NjQpICh1aW50cHRyX3Qp
IGdlbl9wb29sX2RtYV9hbGxvY19hbGlnbih2bS0+ZHJhbV9wZ19wb29sLAo+ID4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFnZV9zaXplLCBOVUxMLAo+ID4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFnZV9zaXplKTsKPiA+ID4gICAgICAgICAgICAg
ICAgICAgICAgICAgZWxzZQo+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBo
eXNfcGdfcGFjay0+cGFnZXNbaV0gPSAodTY0KSBnZW5fcG9vbF9hbGxvYyh2bS0+ZHJhbV9wZ19w
b29sLAo+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhZ2Vfc2l6ZSk7Cj4gPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgcGh5c19wZ19wYWNrLT5wYWdlc1tpXSA9ICh1NjQp
ICh1aW50cHRyX3QpIGdlbl9wb29sX2FsbG9jKHZtLT5kcmFtX3BnX3Bvb2wsCj4gPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhZ2Vfc2l6ZSk7Cj4gPiA+ICAgICAgICAgICAg
ICAgICAgICAgICAgIGlmICghcGh5c19wZ19wYWNrLT5wYWdlc1tpXSkgewo+ID4gPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGRldl9lcnIoaGRldi0+ZGV2LAo+ID4gPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIkZhaWxlZCB0byBhbGxvY2F0ZSBkZXZp
Y2UgbWVtb3J5IChvdXQgb2YgbWVtb3J5KVxuIik7Cj4gPiA+IC0tCj4gPiA+IDIuMzQuMQo+ID4g
PiAKPiA+IAo+ID4gVGhpcyBwYXRjaCBpczoKPiA+IFJldmlld2VkLWJ5OiBPZGVkIEdhYmJheSA8
b2dhYmJheUBrZXJuZWwub3JnPgo+ID4gCj4gPiBHcmVnLAo+ID4gQ291bGQgeW91IHBsZWFzZSBh
cHBseSB0aGlzIGRpcmVjdGx5IHRvIHlvdXIgbWlzYyB0cmVlIGFuZCBzZW5kIGl0IHRvCj4gPiBM
aW51cyBhdCB5b3VyIG5leHQgcHVsbCByZXF1ZXN0ID8KPiA+IEkgZG9uJ3QgaGF2ZSBhbnkgb3Ro
ZXIgZml4ZXMgcGVuZGluZyBmb3IgNS4xOC4KPiA+IAo+ID4gRm9yIDUuMTkgd2Ugd2lsbCBkbyBh
IG1vcmUgZWxlZ2FudCBzb2x1dGlvbiB0aGF0IEFybmQgaGFzIHJlY29tbWVuZGVkLgo+IAo+IFRo
YW5rcy4KPiAKPiBBc3N1bWluZyB0aGlzIGlzIHRvbyBsYXRlIGZvciByYzEsIHdvdWxkIGl0IGJl
IHBvc3NpYmUgdG8gaGF2ZSBpdCBpbgo+IHNvbWV0aGluZyBJIGNhbiB0YWtlIGludG8gbXkgZml4
ZXMvZm9yLW5leHQgd2l0aG91dCB0b28gbXVjaCBkaWZmPyAgSSBwdXQKPiB0aGlzIG9uIHRvcCBv
ZiB0aGUgb2ZmZW5kaW5nIGNvbW1pdCB3aXRoIGEKPiAKPiBGaXhlczogZTg0NThlMjBlMGEzICgi
aGFiYW5hbGFiczogbWFrZSBzdXJlIGRldmljZSBtZW0gYWxsb2MgaXMgcGFnZSBhbGlnbmVkIikK
PiAKPiBhdCBrZXJuZWwub3JnL3BhbG1lci9oYWJhbmEgLCBpZiB0aGF0IGhlbHBzIGFueS4gIE5v
IGJpZyBkZWFsIGlmIGl0IGdvZXMgaW4KPiBhbm90aGVyIHdheSwgaXQncyBqdXN0IG5pY2UgdG8g
a2VlcCBhbGx5ZXNjb25maWcgYnVpbGRpbmcgb24gbXkgYnJhbmNoZXMKPiBkaXJlY3RseS4KCkxv
b2tzIGxpa2UgR3VlbnRlciBzZW50IGluIGEgIm1vcmUgY29tcGxldGUiIHZlcnNpb24gb2YgdGhp
cy4gIEknbGwKcXVldWUgaXQgdXAgdG8gbXkgdHJlZSBhbmQgZ2V0IGl0IHRvIExpbnVzIGZvciAt
cmMyLgoKdGhhbmtzLApncmVnIGstaAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
