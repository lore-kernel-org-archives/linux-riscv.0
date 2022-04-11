Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24A8DC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Apr 2022 09:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vvk15pt4gVjvvoWcRPqw9loQRfhGqs9Umk6D33FFnM4=; b=3LrvKiOn+TbW7X
	A799PHtIAh+RtrX829YmJPbBmeBEHIP4sG1lBF3ePZjuT+TTAwIAfP8+T4BZZy6oQ+tAzzvSPKcVT
	LutcL8yviTzjRYkuAg7tSAaph35/Vyd77li82ed/qhuGLJb8TnzubLfFf/u8QVuYcMZifYEQjI+Gb
	QD1GMJ2mLrvHQ5KiH270JYNskl9PUoYVrbzEJT3YVHYcZm/iVXtuTri82s/mjwP4ZiG5kJHhAjGbR
	Eoj2lxqPMUb9jLI5+LweG0HIDmAW/nOS3AvexZpdpldg8ZIEwDJSyvkhAeyMuFya80oPBHRywG6Y6
	7rBMhlQ9nJWy/I5akUKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndqS0-007xE6-EE; Mon, 11 Apr 2022 09:35:12 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndqRw-007xCN-QO
 for linux-riscv@lists.infradead.org; Mon, 11 Apr 2022 09:35:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 083BEED1;
 Mon, 11 Apr 2022 02:35:02 -0700 (PDT)
Received: from FVFF77S0Q05N (unknown [10.57.9.30])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A11483F793;
 Mon, 11 Apr 2022 02:35:00 -0700 (PDT)
Date: Mon, 11 Apr 2022 10:34:52 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: guoren@kernel.org
Cc: palmer@rivosinc.com, arnd@arndb.de, peterz@infradead.org,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH] riscv: Optimize AMO acquire/release usage
Message-ID: <YlP2PIPrUS89LuFR@FVFF77S0Q05N>
References: <20220406120405.660354-1-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220406120405.660354-1-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_023509_005844_6B0BA980 
X-CRM114-Status: GOOD (  13.64  )
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

SGkgR3VvLAoKT24gV2VkLCBBcHIgMDYsIDIwMjIgYXQgMDg6MDQ6MDVQTSArMDgwMCwgZ3VvcmVu
QGtlcm5lbC5vcmcgd3JvdGU6Cj4gRnJvbTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEu
Y29tPgo+IAo+IFVzaW5nIFJJU0NWX0FDUVVJUkUvUkVMRUFTRV9CQVJSSUVSIGlzIG92ZXIgZXhw
ZW5zaXZlIGZvcgo+IHhjaGcvY21weGNoZ19hY3F1aXJlL3JlbGVhc2UgdGhhbiBuYXR1cmUgaW5z
dHJ1Y3Rpb25zJyAuYXEvcmwuCj4gVGhlIHBhdGNoIGZpeGVkIHRoZXNlIGlzc3VlcyB1bmRlciBS
SVNDLVYgSW5zdHJ1Y3Rpb24gU2V0IE1hbnVhbCwKPiBWb2x1bWUgSTogUklTQy1WIFVzZXItTGV2
ZWwgSVNBIOKAnEHigJ0gU3RhbmRhcmQgRXh0ZW5zaW9uIGZvciBBdG9taWMKPiBJbnN0cnVjdGlv
bnMsIFZlcnNpb24gMi4xLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEd1byBSZW4gPGd1b3JlbkBsaW51
eC5hbGliYWJhLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9y
Zz4KPiBDYzogUGFsbWVyIERhYmJlbHQgPHBhbG1lckBkYWJiZWx0LmNvbT4KPiAtLS0KPiAgYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9hdG9taWMuaCAgfCA3MCArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKystLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NtcHhjaGcuaCB8IDMwICsrKysr
LS0tLS0tLS0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgNzYgaW5zZXJ0aW9ucygrKSwgMjQgZGVsZXRp
b25zKC0pCgpJJ2xsIGxlYXZlIHRoZSBidWxrIG9mIHRoaXMgdG8gUGFsbWVyLCBidXQgSSBzcG90
dGVkIHNvbWV0aGluZyBiZWxvdyB3aGljaApkb2Vzbid0IGxvb2sgcmlnaHQuCgo+IEBAIC0zMTUs
MTIgKzM3OSwxMSBAQCBzdGF0aWMgX19hbHdheXNfaW5saW5lIGludCBhcmNoX2F0b21pY19zdWJf
aWZfcG9zaXRpdmUoYXRvbWljX3QgKnYsIGludCBvZmZzZXQpCj4gICAgICAgICBpbnQgcHJldiwg
cmM7Cj4gIAo+ICAJX19hc21fXyBfX3ZvbGF0aWxlX18gKAo+IC0JCSIwOglsci53ICAgICAlW3Bd
LCAgJVtjXVxuIgo+ICsJCSIwOglsci53LmFxICAlW3BdLCAgJVtjXVxuIgo+ICAJCSIJc3ViICAg
ICAgJVtyY10sICVbcF0sICVbb11cbiIKPiAgCQkiCWJsdHogICAgICVbcmNdLCAxZlxuIgo+ICAJ
CSIJc2Mudy5ybCAgJVtyY10sICVbcmNdLCAlW2NdXG4iCj4gIAkJIglibmV6ICAgICAlW3JjXSwg
MGJcbiIKPiAtCQkiCWZlbmNlICAgIHJ3LCByd1xuIgo+ICAJCSIxOlxuIgo+ICAJCTogW3BdIj0m
ciIgKHByZXYpLCBbcmNdIj0mciIgKHJjKSwgW2NdIitBIiAodi0+Y291bnRlcikKPiAgCQk6IFtv
XSJyIiAob2Zmc2V0KQoKSSBiZWxpZXZlIGluIHRoaXMgY2FzZSB0aGUgZXhpc3RpbmcgY29kZSBo
ZXJlIGlzIGNvcnJlY3QsIGFuZCB0aGlzIG9wdGltaXphdGlvbgppcyBicm9rZW4uCgpJIGJlbGll
dmUgdGhlIGV4aXN0aW5nIGNvZGUgaXMgdXNpbmcgUkVMRUFTRSArIEZVTEwtQkFSUklFUiB0byBl
bnN1cmUgZnVsbApvcmRlcmluZywgc2luY2Ugc2VwYXJhdGUgQUNRVUlSRStSRUxFQVNFIGNhbm5v
dC4gRm9yIGEgZGVzY3JpcHRpb24gb2YgdGhlCnByb2JsZW0sIHNlZSB0aGUgY29tbWl0IG1lc3Nh
Z2UgZm9yOgoKICA4ZTg2ZjBiNDA5YTQ0MTkzICgiYXJtNjQ6IGF0b21pY3M6IGZpeCB1c2Ugb2Yg
YWNxdWlyZSArIHJlbGVhc2UgZm9yIGZ1bGwgYmFycmllciBzZW1hbnRpY3MiKQoKVGhlIGdpc3Qg
aXMgdGhhdCBIVyBjYW4gcmUtb3JkZXI6CgoJQUNDRVNTLUEKCUFDUVVJUkUKCVJFTEVBU0UKCUFD
Q0VTUy1CCgouLi4gdG86CgoJQUNRVUlSRQoJQUNDRVNTLUIKCUFDQ0VTUy1BCglSRUxFQVNFCgou
Li4gdmlvbGF0aW5nIEZVTEwgb3JkZXJpbmcgc2VtYW50aWNzLgoKVGhpcyB3aWxsIGFwcGx5IGZv
ciAqYW55KiBvcGVyYXRpb24gd2hlcmUgRlVMTCBvcmRlcmluZ2lzIHJlcXVpcmVkLCB3aGljaCBJ
CnN1c3BlY3QgYXBwbGllcyB0byBzb21lIG1vcmUgY2FzZXMgYmVsb3cuCgo+IEBAIC0zMzcsMTIg
KzQwMCwxMSBAQCBzdGF0aWMgX19hbHdheXNfaW5saW5lIHM2NCBhcmNoX2F0b21pYzY0X3N1Yl9p
Zl9wb3NpdGl2ZShhdG9taWM2NF90ICp2LCBzNjQgb2Zmcwo+ICAgICAgICAgbG9uZyByYzsKPiAg
Cj4gIAlfX2FzbV9fIF9fdm9sYXRpbGVfXyAoCj4gLQkJIjA6CWxyLmQgICAgICVbcF0sICAlW2Nd
XG4iCj4gKwkJIjA6CWxyLmQuYXEgICVbcF0sICAlW2NdXG4iCj4gIAkJIglzdWIgICAgICAlW3Jj
XSwgJVtwXSwgJVtvXVxuIgo+ICAJCSIJYmx0eiAgICAgJVtyY10sIDFmXG4iCj4gIAkJIglzYy5k
LnJsICAlW3JjXSwgJVtyY10sICVbY11cbiIKPiAgCQkiCWJuZXogICAgICVbcmNdLCAwYlxuIgo+
IC0JCSIJZmVuY2UgICAgcncsIHJ3XG4iCj4gIAkJIjE6XG4iCj4gIAkJOiBbcF0iPSZyIiAocHJl
diksIFtyY10iPSZyIiAocmMpLCBbY10iK0EiICh2LT5jb3VudGVyKQo+ICAJCTogW29dInIiIChv
ZmZzZXQpCgpNeSBjb21tZW50IGZvciBhcmNoX2F0b21pY19zdWJfaWZfcG9zaXRpdmUoKSBhcHBs
aWVzIGhlcmUgdG9vLgoKClsuLi5dCgo+IEBAIC0zMDksMTEgKzMwMSwxMCBAQAo+ICAJc3dpdGNo
IChzaXplKSB7CQkJCQkJCVwKPiAgCWNhc2UgNDoJCQkJCQkJCVwKPiAgCQlfX2FzbV9fIF9fdm9s
YXRpbGVfXyAoCQkJCQlcCj4gLQkJCSIwOglsci53ICUwLCAlMlxuIgkJCQlcCj4gKwkJCSIwOgls
ci53LmFxICUwLCAlMlxuIgkJCVwKPiAgCQkJIglibmUgICUwLCAlejMsIDFmXG4iCQkJXAo+ICAJ
CQkiCXNjLncucmwgJTEsICV6NCwgJTJcbiIJCQlcCj4gIAkJCSIJYm5leiAlMSwgMGJcbiIJCQkJ
XAo+IC0JCQkiCWZlbmNlIHJ3LCByd1xuIgkJCQlcCj4gIAkJCSIxOlxuIgkJCQkJCVwKPiAgCQkJ
OiAiPSZyIiAoX19yZXQpLCAiPSZyIiAoX19yYyksICIrQSIgKCpfX3B0cikJXAo+ICAJCQk6ICJy
SiIgKChsb25nKV9fb2xkKSwgInJKIiAoX19uZXcpCQlcCj4gQEAgLTMyMSwxMSArMzEyLDEwIEBA
Cj4gIAkJYnJlYWs7CQkJCQkJCVwKPiAgCWNhc2UgODoJCQkJCQkJCVwKPiAgCQlfX2FzbV9fIF9f
dm9sYXRpbGVfXyAoCQkJCQlcCj4gLQkJCSIwOglsci5kICUwLCAlMlxuIgkJCQlcCj4gKwkJCSIw
Oglsci5kLmFxICUwLCAlMlxuIgkJCVwKPiAgCQkJIglibmUgJTAsICV6MywgMWZcbiIJCQlcCj4g
IAkJCSIJc2MuZC5ybCAlMSwgJXo0LCAlMlxuIgkJCVwKPiAgCQkJIglibmV6ICUxLCAwYlxuIgkJ
CQlcCj4gLQkJCSIJZmVuY2UgcncsIHJ3XG4iCQkJCVwKPiAgCQkJIjE6XG4iCQkJCQkJXAo+ICAJ
CQk6ICI9JnIiIChfX3JldCksICI9JnIiIChfX3JjKSwgIitBIiAoKl9fcHRyKQlcCj4gIAkJCTog
InJKIiAoX19vbGQpLCAickoiIChfX25ldykJCQlcCgpJIGRvbid0IGhhdmUgZW5vdWdoIGNvbnRl
eHQgdG8gc2F5IGZvciBzdXJlLCBidXQgSSBzdXNwZWN0IHRoZXNlIGFyZSBleHBlY3RpbmcKRlVM
TCBvcmRlcmluZyB0b28sIGFuZCB3b3VsZCBiZSBicm9rZW4sIGFzIGFib3ZlLgoKVGhhbmtzLApN
YXJrLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
