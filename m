Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7485DF9B601
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Apr 2026 09:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eUnsN+po8KlNekzols2wREyGB4b1Jr4NoeXMxYftxEI=; b=o2E4pTwMvYl4Pw
	zKXdiiKqLVwdvFBekF9JtrF2oRXOXPMl71lHPDf38eicU+npB+HguQrF275Cp3NQlajw522KLDWw8
	W4vCFPLZHmHHl/m3nj40SXT+yHNawixnaftg+UYHN+MEYzZCNXb4NBSJQO8QLQPMmjpXUlJd0Lc5h
	d6cdxtiJJZ8Jrqam8pL6Hg9AZTGIrRfdGEGjGwCV+nCzN5PimcAB1HWgTC+owpOc/lRffyYnQAK4R
	tZqwIxx0HkxXag4617SHpp8rB9Kl4mskhrGogL4hDr8y1r5rXBZVQ3Pucxl7OdvzbwG8qT8N8dF/e
	eSFTzcmylM452p+DAf5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFU9A-00000009sge-2rup;
	Wed, 22 Apr 2026 09:45:28 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFU97-00000009sfz-3qEc
	for linux-riscv@lists.infradead.org;
	Wed, 22 Apr 2026 09:45:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=fBKH/HXbWWaP59wt4kSlVA4e+/kt2/yz9
	4apwAHGDm0=; b=B1q/KexwszubstnoHstLH0GK8YTQm4QwUwxUXAj5wbjA+ebIA
	SWrQ8fVgljQSrRGDPYu0COi5YDesyrAQTx+zmNxJSlce7INJlZVNbvONdxFW9pvV
	zKjk8OHFW+ikoKCze/SRKORHSbzHizZas6BTvFjRnnFY6bidDXoPyUc/7s=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwAnEkPPmOhpoqQCAA--.1549S2;
	Wed, 22 Apr 2026 17:45:51 +0800 (CST)
MIME-Version: 1.0
Subject: Re: [PATCH v3 2/2] serial: 8250_dw: Use a fixed CPR value for
 UltraRISC DP1000 UART
From: Jia Wang <wangjia@ultrarisc.com>
To: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Jia Wang <wangjia@ultrarisc.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
 linux-serial <linux-serial@vger.kernel.org>, 
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <446bf928-002a-456a-ae50-28220883dade@linux.intel.com>
References: <20260421-ultrarisc-serial-v3-0-3d7f09c2420e@ultrarisc.com>
 <20260421-ultrarisc-serial-v3-2-3d7f09c2420e@ultrarisc.com>
 <979c9543-3ea0-25de-f97b-9c6d2fa3ac61@linux.intel.com>
 <177681947637.2697678.10937675549830278979.b4-reply@b4>
 <446bf928-002a-456a-ae50-28220883dade@linux.intel.com>
Date: Wed, 22 Apr 2026 17:45:06 +0800
Message-Id: <177685110619.768471.8296280075168950467.b4-reply@b4>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776851106; l=3618;
 i=wangjia@ultrarisc.com; s=20260309; h=from:subject:message-id;
 bh=4zqVy+XtKgRxGiMzoPFgfg5vI+4TZ59byA4yAXHOmTM=;
 b=7WEztEAuFIW0/XSHLTXmt/ddsyy0WGDukxrE0QppuC1YDZ9+09jLnCh5V9qz3qf57fcW+qKpr
 UDLYse7EWnHCpDi17F+vRWpjBGpaiagkHmlX81otL3/LhVDZ1Du+TQE
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=XvYkrelqJIIzobY7j+nIg8rsfv5kzaOzuc1UPhd087U=
X-CM-TRANSID: AQAAfwAnEkPPmOhpoqQCAA--.1549S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJw1UCrW8AFyUAryrCry3Arb_yoW5tr43pF
	48GFWYkryktwsaywn2va1jvFsaya1Sg3yUWrnrW342yFn0yr1SyFy8trWY9a4DZrWFkr1j
	vF4Yvay7uw4UZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAFEWnoRb4ACQAPsp
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_024526_133748_031CAC17 
X-CRM114-Status: GOOD (  37.26  )
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

T24gMjAyNi0wNC0yMiAxMjowMSArMDMwMCwgSWxwbyBKw6RydmluZW4gd3JvdGU6Cj4gT24gV2Vk
LCAyMiBBcHIgMjAyNiwgSmlhIFdhbmcgd3JvdGU6Cj4gCj4gPiBPbiAyMDI2LTA0LTIxIDE1OjE4
ICswMzAwLCBJbHBvIErDpHJ2aW5lbiB3cm90ZToKPiA+ID4gT24gVHVlLCAyMSBBcHIgMjAyNiwg
SmlhIFdhbmcgd3JvdGU6Cj4gPiA+IAo+ID4gPiA+IFRoZSBVbHRyYVJJU0MgRFAxMDAwIFVBUlQg
ZG9lcyBub3QgcHJvdmlkZSB0aGUgc3RhbmRhcmQgQ1BSIHJlZ2lzdGVyIHVzZWQKPiA+ID4gPiBi
eSA4MjUwX2R3IHRvIGRpc2NvdmVyIHBvcnQgY2FwYWJpbGl0aWVzLgo+ID4gPiA+IAo+ID4gPiA+
IFByb3ZpZGUgYSBmaXhlZCBDUFIgdmFsdWUgZm9yIHRoZSBEUDEwMDAtc3BlY2lmaWMgY29tcGF0
aWJsZSBzbyB0aGUKPiA+ID4gPiBkcml2ZXIgY2FuIGNvbmZpZ3VyZSB0aGUgcG9ydCBjb3JyZWN0
bHkuCj4gPiA+ID4gCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogSmlhIFdhbmcgPHdhbmdqaWFAdWx0
cmFyaXNjLmNvbT4KPiA+ID4gPiAtLS0KPiA+ID4gPiAgZHJpdmVycy90dHkvc2VyaWFsLzgyNTAv
ODI1MF9kdy5jIHwgNyArKysrKysrCj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlv
bnMoKykKPiA+ID4gPiAKPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy90dHkvc2VyaWFsLzgy
NTAvODI1MF9kdy5jIGIvZHJpdmVycy90dHkvc2VyaWFsLzgyNTAvODI1MF9kdy5jCj4gPiA+ID4g
aW5kZXggOTRiZWFkYjQwMjRkLi5jYTZkYmRmNzU5MTggMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvZHJp
dmVycy90dHkvc2VyaWFsLzgyNTAvODI1MF9kdy5jCj4gPiA+ID4gKysrIGIvZHJpdmVycy90dHkv
c2VyaWFsLzgyNTAvODI1MF9kdy5jCj4gPiA+ID4gQEAgLTk2Miw2ICs5NjIsMTIgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBkdzgyNTBfcGxhdGZvcm1fZGF0YSBkdzgyNTBfaW50YzEwZWUgPSB7Cj4g
PiA+ID4gIAkucXVpcmtzID0gRFdfVUFSVF9RVUlSS19JRVJfS0lDSywKPiA+ID4gPiAgfTsKPiA+
ID4gPiAgCj4gPiA+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZHc4MjUwX3BsYXRmb3JtX2RhdGEg
ZHc4MjUwX3VsdHJhcmlzY19kcDEwMDBfZGF0YSA9IHsKPiA+ID4gPiArCS51c3JfcmVnID0gRFdf
VUFSVF9VU1IsCj4gPiA+ID4gKwkuY3ByX3ZhbHVlID0gMHgwMDAyMjAyMiwKPiA+ID4gCj4gPiA+
IEhpLAo+ID4gPiAKPiA+ID4gUGxlYXNlIGNvbnN0cnVjdCB0aGUgY3ByX3ZhbHVlIGJ5IE9SaW5n
IERXX1VBUlRfQ1BSXyogZGVmaW5lcyB0b2dldGhlci4KPiA+ID4gRm9yIGZpZWxkcywgRklFTERf
UFJFUF9DT05TVCgpIG1heSBiZSB1c2VmdWwuCj4gPiA+IAo+ID4gPiBJbiBvcmRlciB0byBiZSBh
YmxlIHRvIHVzZSB0aGUgRFdfVUFSVF9DUFJfKiBkZWZpbmVzLCB0aGV5IG5lZWQgdG8gYmUgCj4g
PiA+IG1vdmVkIGludG8gODI1MF9kd2xpYi5oIChJJ2QgbW92ZSBhbGwgRFdfVUFSVCByZWdpc3Rl
ciBkZWZpbmVzIGluIGEgCj4gPiA+IHByZXBhcmF0b3J5IHBhdGNoKS4KPiA+ID4gCj4gPiA+IEkg
a25vdyB0aGUgZXhpc3RpbmcgUmVuZXNhcycgLmNwcl92YWx1ZSBkb2Vzbid0IGZvbGxvdyB0aGlz
IGNvbnZlbnRpb24gYnV0IAo+ID4gPiB0aGF0IGNvdWxkIGJlIGNvbnZlcnRlZCBhcyB3ZWxsIChp
biBhbm90aGVyIHBhdGNoLCBvciBsZWF2ZSB0aGUgUmVuZXNhcyAKPiA+ID4gZW50cnkgY29udmVy
c2lvbiB0byBtZSBpZiB5b3UgZG9uJ3Qgd2FudCB0byBkbyB0aGF0KS4KPiA+ID4KPiA+IAo+ID4g
VGhhbmtzIGZvciB0aGUgcmV2aWV3Lgo+ID4gCj4gPiBKdXN0IHRvIGNvbmZpcm06IHNpbmNlIHlv
dSBtZW50aW9uZWQgdGhhdCB0aGUgcHJlcGFyYXRvcnkgcGF0Y2ggbW92aW5nCj4gPiB0aGUgRFdf
VUFSVCByZWdpc3RlciBkZWZpbmVzIGlzIGFscmVhZHkgaW4gcGxhY2UsIEkgZG9uJ3QgbmVlZCB0
byBtb3ZlCj4gPiB0aGVtIGFnYWluLCBjb3JyZWN0Pwo+IAo+IEknbSBub3Qgc3VyZSB3aGVyZSB0
aGF0IHByZXBhcmF0b3J5IHBhdGNoIGlzLiBUaG9zZSBkZWZpbmVzIHN0aWxsIGFwcGVhciAKPiBp
biA4MjUwX2R3bGliLmMgQUZBSUNULgo+IAo+IFRvIGJlIGNsZWFyLCBEV19VQVJUX0NQUl8qIGRl
ZmluZXMgYXJlIGluIDgyNTBfZHdsaWIuYyBidXQgeW91J3JlIAo+IG1vZGlmeWluZyA4MjUwX2R3
LmMgZmlsZSBoZXJlIHNvIHlvdSBjYW5ub3QgdXNlIHRob3NlIHByZS1leGlzdGluZyBkZWZpbmVz
IAo+IGFzIGlzIGluIDgyNTBfZHcuYy4gVG8gc29sdmUgdGhhdCwgcGxlYXNlIGFkZCBhIHByZXBh
cmF0b3J5IHBhdGNoIGludG8gCj4geW91ciBzZXJpZXMgd2hpY2ggcmVsb2NhdGVzIGFsbCB0aG9z
ZSBkZWZpbmVzIGZyb20gODI1MF9kd2xpYi5jIHRvIAo+IDgyNTBfZHdsaWIuaC4gSWYgdGhlcmUn
cyBhIHBhdGNoIHdoaWNoIGRvZXMgdGhhdCBhbHJlYWR5LCBpdCBoYXMgbWlzc2VkIG15IAo+IHJh
ZGFyLgo+IAo+IEFuZCBteSBzdWdnZXN0aW9uIGlzIHRvIG1vdmUgbm90IGp1c3QgRFdfVUFSVF9D
UFJfKiBkZWZpbmVzIGludG8gCj4gODI1MF9kd2xpYi5oIGJ1dCBhbGwgRFcgVUFSVCBzcGVjaWZp
YyByZWdpc3RlciBkZWZpbmVzIHRvIGtlZXAgdGhlbSBpbiAKPiB0aGUgc2FtZSBwbGFjZS4KPiAK
PiBIb3BlZnVsbHkgdGhpcyBjbGVhcnMgdXAgYW55IG1pc3VuZGVyc3RhbmRpbmcuCj4gCj4gCj4g
TXkgbWFpbiBwb2ludCBhbGwgYWxvbmcgaXMgdGhhdCBkbyBub3QgZG8gdGhlIGRlZmluZSBtb3Zl
IGluIHRoZSBzYW1lIAo+IHBhdGNoIHdoZXJlIHlvdSdyZSBhZGRpbmcgVWx0cmFSSVNDIERQMTAw
MCBVQVJUICh3aGljaCBpcyBhIGNvbW1vbiBwaXRmYWxsIAo+IHRvIG1hbnkgc3VibWl0dGVycyBz
byBJIHRyeSB0byBnaXZlIHByby1hY3RpdmUgaW5zdHJ1Y3Rpb25zIHdoaWxlIAo+IHJldmlld2lu
ZyB0byBhdm9pZCBleHRyYSB2ZXJzaW9ucyBiZWNhdXNlIG9mIHRoZW0pLgo+CgpUaGFua3MuCgpV
bmRlcnN0b29kLiBJIHdpbGwgYWRkIGEgcHJlcGFyYXRvcnkgcGF0Y2ggdG8gbW92ZSBhbGwgRFdf
VUFSVCByZWdpc3RlcgpkZWZpbmVzIGludG8gODI1MF9kd2xpYi5oLCBhbmQgdXBkYXRlIHRoZSBV
bHRyYVJJU0MgRFAxMDAwIHN1cHBvcnQgYWNjb3JkaW5nbHkuCgpJIHdpbGwgYWxzbyBmb2xsb3cg
dGhlIG9yZGVyaW5nIHN1Z2dlc3RlZCBkdXJpbmcgcmV2aWV3IGFuZCByZXNlbmQgdGhlCnNlcmll
cyBhcyB2NC4KIAo+ID4gSSB3aWxsIHVwZGF0ZSBteSBwYXRjaCB0byB1c2UgdGhlIERXX1VBUlRf
Q1BSXyogbWFjcm9zIGFuZAo+ID4gRklFTERfUFJFUF9DT05TVCgpIGFjY29yZGluZ2x5LCBhbmQg
SeKAmW0gaGFwcHkgdG8gYWRkIGEgc2VwYXJhdGUgcGF0Y2ggaW4KPiA+IHRoZSBuZXh0IHJldmlz
aW9uIHRvIGNvbnZlcnQgdGhlIFJlbmVzYXMgLmNwcl92YWx1ZSBhcyB3ZWxsLgo+IAo+IEdyZWF0
LCB0aGFua3MuCj4gCj4gPiA+ID4gKwkucXVpcmtzID0gRFdfVUFSVF9RVUlSS19DUFJfVkFMVUUs
Cj4gPiA+ID4gK307Cj4gCj4gLS0gCj4gIGkuCgpSZWdhcmRzLApKaWEgV2FuZwoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
