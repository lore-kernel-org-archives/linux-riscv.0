Return-Path: <SRS0=ksV6=Q2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8930C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 19 Feb 2019 01:40:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B80BD2173C
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 19 Feb 2019 01:40:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FfBtFIgp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B80BD2173C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DmGOhMT5ZuSStgLhhkheOpEByHOx46pULmivP8dqAC4=; b=FfBtFIgpxdif0+
	4hBka7k1fkHpSNrdJ/WHw1pG0GW1Tvb3sAW3xLOTZRBzUBR8L42JcU7m61BykLigyCWxglj5Ndv2X
	Mc6XQe9pciTnWuYwH9jMZDtERvm+3zWwCXnosLN6AZDWCMQ0CuiH5q/UZuxvDFXCppF3OUGSe7xCq
	yErbbVBIx+lPpFA2TLlYk5V6di5GRcFPDxd/XDEI/qHDChI4bBnHhlXKmcP8JHCOQ/U2utlLaFfGF
	G8/0XjeyAGN45+706tHfSqkhGLNUat+5/qvkranLUqghyT9u+Bi8AXkz6PKe52QGSjSadyDmRziuF
	Mtcym5avBmLA/eriYvJg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gvuOo-0008HS-34; Tue, 19 Feb 2019 01:40:42 +0000
Received: from mga12.intel.com ([192.55.52.136])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gvuOl-0008H2-Iv
 for linux-riscv@lists.infradead.org; Tue, 19 Feb 2019 01:40:41 +0000
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Feb 2019 17:40:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,385,1544515200"; d="scan'208";a="134531155"
Received: from lftan-mobl.gar.corp.intel.com (HELO ubuntu) ([10.226.248.88])
 by FMSMGA003.fm.intel.com with SMTP; 18 Feb 2019 17:40:35 -0800
Received: by ubuntu (sSMTP sendmail emulation); Tue, 19 Feb 2019 09:40:33 +0800
Message-ID: <1550540432.2534.1.camel@intel.com>
Subject: Re: [PATCH 05/11] tracing: consolidate the TRACE_IRQFLAGS_SUPPORT
 symbol
From: Ley Foon Tan <ley.foon.tan@intel.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Christoph Hellwig
 <hch@lst.de>
Date: Tue, 19 Feb 2019 09:40:32 +0800
In-Reply-To: <CAK7LNARDdPabSOq6vHvxTPPWaMguJUEtok=dNrfnLEz=UtHO+w@mail.gmail.com>
References: <20190213174005.28785-1-hch@lst.de>
 <20190213174005.28785-6-hch@lst.de>
 <CAK7LNARDdPabSOq6vHvxTPPWaMguJUEtok=dNrfnLEz=UtHO+w@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190218_174039_636359_738CD085 
X-CRM114-Status: GOOD (  16.21  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-xtensa@linux-xtensa.org,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 nios2-dev@lists.rocketboards.org, Ley Foon Tan <lftan@altera.com>,
 linux-riscv@lists.infradead.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAyMDE5LTAyLTE1IGF0IDE2OjU1ICswOTAwLCBNYXNhaGlybyBZYW1hZGEgd3JvdGU6
Cj4gK0NDOiBMZXkgRm9vbiBUYW4gPGxmdGFuQGFsdGVyYS5jb20+Cj4gK0NDOiBuaW9zMi1kZXZA
bGlzdHMucm9ja2V0Ym9hcmRzLm9yZwo+IAo+IAo+IE9uIFRodSwgRmViIDE0LCAyMDE5IGF0IDI6
NDAgQU0gQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+IHdyb3RlOgo+IAo+ID4gCj4gPiBk
aWZmIC0tZ2l0IGEvYXJjaC9uaW9zMi9LY29uZmlnIGIvYXJjaC9uaW9zMi9LY29uZmlnCj4gPiBp
bmRleCA3MTVlNmMwOWI0YTUuLjNiNTA2ODkwMDdmNSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvbmlv
czIvS2NvbmZpZwo+ID4gKysrIGIvYXJjaC9uaW9zMi9LY29uZmlnCj4gPiBAQCAtMjAsNiArMjAs
NyBAQCBjb25maWcgTklPUzIKPiA+IMKgwqDCoMKgwqDCoMKgwqBzZWxlY3QgT0ZfRUFSTFlfRkxB
VFRSRUUKPiA+IMKgwqDCoMKgwqDCoMKgwqBzZWxlY3QgU09DX0JVUwo+ID4gwqDCoMKgwqDCoMKg
wqDCoHNlbGVjdCBTUEFSU0VfSVJRCj4gPiArwqDCoMKgwqDCoMKgwqBzZWxlY3QgVFJBQ0VfSVJR
RkxBR1NfU1VQUE9SVAo+IAo+IFRoaXMgaXMgYSBiZWhhdmlvciBjaGFuZ2Ugb2YgbmlvczIuCj4g
Cj4gVFJBQ0VfSVJRRkxBR1NfU1VQUE9SVCB3YXMgcHJldmlvdXNseSAnbicsCj4gYW5kIHRoaXMg
Y29tbWl0IGlzIGNoYW5naW5nIGl0IHRvICd5Jy4KPiAKPiAKPiAKPiAKPiBTdHJhbmdlbHksIG5p
b3MyIGRlZmluZXMgVFJBQ0VfSVJRRkxBR1NfU1VQUE9SVCB0d2ljZQo+IHdpdGggZGlmZmVyZW50
IGRlZmF1bHQgdmFsdWVzLgo+IAo+IEluIEtjb25maWcsIHRoZSBmaXJzdCBvbmUgYmVjb21lcyBl
ZmZlY3RpdmUuCj4gCj4gSW4gdGhpcyBjYXNlLCAnZGVmX2Jvb2wgbicgaW4gYXJjaC9uaW9zMi9L
Y29uZmlnIGlzIHVzZWQuCj4gJ2RlZl9ib29sIHknIGluIGFyY2gvbmlvczIvS2NvbmZpZy5kZWJ1
ZyBpcyBkZWFkIGNvZGUuCj4gCj4gCj4gSSB0aGluayB0aGlzIHNlbGVjdCBzaG91bGQgYmUgZHJv
cHBlZAo+IHRvIGtlZXAgdGhlIGN1cnJlbnQgYmVoYXZpb3IsCj4gYnV0IEkgaG9wZSB0aGUgTklP
UzIgbWFpbnRhaW5lciB3aWxsIGdpdmUgdXMKPiBzb21lIGNvbW1lbnRzIGp1c3QgaW4gY2FzZS4K
PiAKWWVzLCBwbGVhc2UgZHJvcCB0aGlzIHBhdGNoIHRvIGtlZXAgb3JpZ2luYWwgYmVoYXZpb3Iu
ClRoYW5rcy4KClJlZ2FyZHMKTGV5IEZvb24KPiAKPiAKPiAKPiA+IAo+ID4gwqDCoMKgwqDCoMKg
wqDCoHNlbGVjdCBVU0JfQVJDSF9IQVNfSENEIGlmIFVTQl9TVVBQT1JUCj4gPiDCoMKgwqDCoMKg
wqDCoMKgc2VsZWN0IENQVV9OT19FRkZJQ0lFTlRfRkZTCj4gPiDCoMKgwqDCoMKgwqDCoMKgc2Vs
ZWN0IEFSQ0hfRElTQ0FSRF9NRU1CTE9DSwo+ID4gQEAgLTM5LDkgKzQwLDYgQEAgY29uZmlnIE5P
X0lPUE9SVF9NQVAKPiA+IMKgY29uZmlnIEZQVQo+ID4gwqDCoMKgwqDCoMKgwqDCoGRlZl9ib29s
IG4KPiA+IAo+ID4gLWNvbmZpZyBUUkFDRV9JUlFGTEFHU19TVVBQT1JUCj4gPiAtwqDCoMKgwqDC
oMKgwqBkZWZfYm9vbCBuCj4gPiAtCj4gPiDCoG1lbnUgIktlcm5lbCBmZWF0dXJlcyIKPiA+IAo+
ID4gwqBzb3VyY2UgImtlcm5lbC9LY29uZmlnLmh6Igo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvbmlv
czIvS2NvbmZpZy5kZWJ1ZyBiL2FyY2gvbmlvczIvS2NvbmZpZy5kZWJ1Zwo+ID4gaW5kZXggZjFk
YThhN2IxN2ZmLi5hOGJjMDZlOTZlZjUgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL25pb3MyL0tjb25m
aWcuZGVidWcKPiA+ICsrKyBiL2FyY2gvbmlvczIvS2NvbmZpZy5kZWJ1Zwo+ID4gQEAgLTEsOCAr
MSw1IEBACj4gPiDCoCMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKPiA+IAo+ID4g
LWNvbmZpZyBUUkFDRV9JUlFGTEFHU19TVVBQT1JUCj4gPiAtwqDCoMKgwqDCoMKgwqBkZWZfYm9v
bCB5Cj4gPiAtCj4gPiDCoGNvbmZpZyBFQVJMWV9QUklOVEsKPiA+IMKgwqDCoMKgwqDCoMKgwqBi
b29sICJBY3RpdmF0ZSBlYXJseSBrZXJuZWwgZGVidWdnaW5nIgo+ID4gwqDCoMKgwqDCoMKgwqDC
oGRlZmF1bHQgeQo+IC0tCj4gQmVzdCBSZWdhcmRzCj4gTWFzYWhpcm8gWWFtYWRhCj4gCj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiAKPiBDb25maWRlbnRpYWxpdHkgTm90aWNl
Lgo+IFRoaXMgbWVzc2FnZSBtYXkgY29udGFpbiBpbmZvcm1hdGlvbiB0aGF0IGlzIGNvbmZpZGVu
dGlhbCBvcgo+IG90aGVyd2lzZSBwcm90ZWN0ZWQgZnJvbSBkaXNjbG9zdXJlLiBJZiB5b3UgYXJl
IG5vdCB0aGUgaW50ZW5kZWQKPiByZWNpcGllbnQsIHlvdSBhcmUgaGVyZWJ5IG5vdGlmaWVkIHRo
YXQgYW55IHVzZSwgZGlzY2xvc3VyZSwKPiBkaXNzZW1pbmF0aW9uLCBkaXN0cmlidXRpb24sIG9y
IGNvcHlpbmcgb2YgdGhpcyBtZXNzYWdlLCBvciBhbnkKPiBhdHRhY2htZW50cywgaXMgc3RyaWN0
bHkgcHJvaGliaXRlZC4gSWYgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcwo+IG1lc3NhZ2UgaW4gZXJy
b3IsIHBsZWFzZSBhZHZpc2UgdGhlIHNlbmRlciBieSByZXBseSBlLW1haWwsIGFuZAo+IGRlbGV0
ZSB0aGUgbWVzc2FnZSBhbmQgYW55IGF0dGFjaG1lbnRzLiBUaGFuayB5b3UuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
