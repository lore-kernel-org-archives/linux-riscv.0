Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C32E6C636CC
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Jan 2023 10:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OwbQ39kA29/xUellqy1bzHhKgGLltTjN1JzF9g9RyeY=; b=O9RMM2hpMqDThy
	4BzRcGPROE0wWcEpRzJp/uXWV5+RpvYE/FnmCJCSlLbj6epHuER5Zmg7P+SrWnEtymP6NljtRwx6E
	BrcYmlB49ZZX2QrALNRWsjdxQrbKtmQBOwbQjyktMy5v+078Zz/7pkeTTGKoJDbi7EsLFfcf0Ka30
	EeRq95+DwxqW2MG1blM0abi4wCPxXvfOJceq07BaAjU81f1EMrsETNuOQG334ot38CXrhJteabjqg
	Ui3TsPLm3WZ0O91wFTNq/lL056Lm7JeHMoDdgYUr2nqnKD1k0ra3T6xVEPOQFQqhMNhmML8QuT/Mr
	4E6EftQeVDd3WfoWvjQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMo3O-007ULh-UW; Tue, 31 Jan 2023 10:39:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMnxW-007RgP-6X
	for linux-riscv@bombadil.infradead.org; Tue, 31 Jan 2023 10:33:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=NOngKMrIigypgZEhbdUNEnz4nTQSNbBmMRTpNk/9MdI=; b=MvoCukJTV1nQ6v9IBiJ6q1x/e7
	R1GmzcZ8afPJHCdeUmDJt0KxRlgsdqvfwKmKYzwrmd9VjWjGwvp85xREFNC3ruuq206Eg+emrUGEg
	wbMZl6EwWpTBNYZpZIQeJNAQnaifHHijE0bus7brrCBHcGRMkpsXlQt8x8UiOEhQrM4F57S7mrJXU
	pdP0E99eAQcl5CIP8qfuT1fumL+RPQGg03Y7wUSHfDW8NGoRAqhRDO2TW8znXQp+NQSxS5WOttw1u
	4rU7Ru6Z1pWhdLZbWZHR2z4hDyYttI+Vk/wyrGBNx99iILPEJuF1BKw1iTt2jGVr9Y+rODMrAAaj5
	swemAzpw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pMnws-004Jsv-02
	for linux-riscv@lists.infradead.org;
	Tue, 31 Jan 2023 10:33:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 26EA32F4;
	Tue, 31 Jan 2023 02:33:52 -0800 (PST)
Received: from FVFF77S0Q05N (unknown [10.57.12.254])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4FC3A3F64C;
	Tue, 31 Jan 2023 02:33:08 -0800 (PST)
Date: Tue, 31 Jan 2023 10:33:05 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Guo Ren <guoren@kernel.org>
Cc: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
	"liaochang (A)" <liaochang1@huawei.com>, palmer@dabbelt.com,
	paul.walmsley@sifive.com, mhiramat@kernel.org,
	conor.dooley@microchip.com, penberg@kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH] riscv: kprobe: Optimize kprobe with accurate atomicity
Message-ID: <Y9juYX8Bt1Z55lv0@FVFF77S0Q05N>
References: <20230126161559.1467374-1-guoren@kernel.org>
 <0abbbdd4-6b85-9659-03ee-97c56a5b77c1@huawei.com>
 <CAJF2gTS0s4X_uwLaEeSqKAyRmxCR2vxRuHhz7-SP2w4bBqzr+Q@mail.gmail.com>
 <87r0vc9h4g.fsf@all.your.base.are.belong.to.us>
 <Y9fm+6LPXgtDSma/@FVFF77S0Q05N>
 <CAJF2gTRgze_owuWvJjnrPpBNs8+GY-km7wvHU4EuJzarQc+BPQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTRgze_owuWvJjnrPpBNs8+GY-km7wvHU4EuJzarQc+BPQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_103310_565006_E99F6B63 
X-CRM114-Status: GOOD (  27.69  )
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

T24gVHVlLCBKYW4gMzEsIDIwMjMgYXQgMDk6NDg6MjlBTSArMDgwMCwgR3VvIFJlbiB3cm90ZToK
PiBPbiBNb24sIEphbiAzMCwgMjAyMyBhdCAxMTo0OSBQTSBNYXJrIFJ1dGxhbmQgPG1hcmsucnV0
bGFuZEBhcm0uY29tPiB3cm90ZToKPiA+Cj4gPiBIaSBCam9ybiwKPiA+Cj4gPiBPbiBNb24sIEph
biAzMCwgMjAyMyBhdCAwNDoyODoxNVBNICswMTAwLCBCasO2cm4gVMO2cGVsIHdyb3RlOgo+ID4g
PiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4gd3JpdGVzOgo+ID4gPgo+ID4gPiA+PiBJbiB0
aGUgc2VyaWUgb2YgUklTQ1YgT1BUUFJPQkVTIFsxXSwgaXQgcGF0Y2hlcyBhIGxvbmctanVtcCBp
bnN0cnVjdGlvbnMgcGFpcgo+ID4gPiA+PiBBVUlQQy9KQUxSIGluIGtlcm5lbCB0ZXh0LCBzbyBp
biBvcmRlciB0byBlbnN1cmUgb3RoZXIgQ1BVcyBkb2VzIG5vdCBleGVjdXRlCj4gPiA+ID4+IGlu
IHRoZSBpbnN0cnVjdGlvbnMgdGhhdCB3aWxsIGJlIG1vZGlmaWVkLCBpdCBpcyBzdGlsbCBuZWVk
IHRvIHN0b3Agb3RoZXIgQ1BVcwo+ID4gPiA+PiB2aWEgcGF0Y2hfdGV4dCBBUEksIG9yIHlvdSBo
YXZlIGFueSBiZXR0ZXIgc29sdXRpb24gdG8gYWNoaWV2ZSB0aGUgcHVycG9zZT8KPiA+ID4gPiAg
LSBUaGUgc3RvcF9tYWNoaW5lIGlzIGFuIGV4cGVuc2l2ZSB3YXkgYWxsIGFyY2hpdGVjdHVyZXMg
c2hvdWxkCj4gPiA+ID4gYXZvaWQsIGFuZCB5b3UgY291bGQga2VlcCB0aGF0IGluIHlvdXIgT1BU
UFJPQkVTIGltcGxlbWVudGF0aW9uIGZpbGVzCj4gPiA+ID4gd2l0aCBzdGF0aWMgZnVuY3Rpb25z
Lgo+ID4gPiA+ICAtIFRoZSBzdG9wX21hY2hpbmUgY291bGRuJ3Qgd29yayB3aXRoIFBSRUVNUFRJ
T04sIHNvIHlvdXIKPiA+ID4gPiBpbXBsZW1lbnRhdGlvbiBuZWVkcyB0byB3b3JrIHdpdGggIVBS
RUVNUFRJT04uCj4gPiA+Cj4gPiA+IC4uLmFuZCBzdG9wX21hY2hpbmUoKSB3aXRoICFQUkVFTVBU
SU9OIGlzIGJyb2tlbiBhcyB3ZWxsLCB3aGVuIHlvdSdyZQo+ID4gPiByZXBsYWNpbmcgbXVsdGlw
bGUgaW5zdHJ1Y3Rpb25zIChzZWUgTWFyaydzIHBvc3QgYXQgWzFdKS4gVGhlCj4gPiA+IHN0b3Bf
bWFjaGluZSgpIGRhbmNlIG1pZ2h0IHdvcmsgd2hlbiB5b3UncmUgcmVwbGFjaW5nICpvbmUqIGlu
c3RydWN0aW9uLAo+ID4gPiBub3QgbXVsdGlwbGUgYXMgaW4gdGhlIFJJU0MtViBjYXNlLiBJJ2xs
IGV4cGFuZCBvbiB0aGlzIGluIGEgY29tbWVudCBpbgo+ID4gPiB0aGUgT1BUUFJPQkVTIHY2IHNl
cmllcy4KPiA+Cj4gPiBKdXN0IHRvIGNsYXJpZnksIG15IGNvbW1lbnRzIGluIFsxXSB3ZXJlIGFz
c3VtaW5nIHRoYXQgc3RvcF9tYWNoaW5lKCkgd2FzIG5vdAo+ID4gdXNlZCwgaW4gd2hpY2ggY2Fz
ZSB0aGVyZSBpcyBhIHByb2JsZW0gd2l0aCBvciB3aXRob3V0IFBSRUVNUFRJT04uCj4gPgo+ID4g
SSBiZWxpZXZlIHRoYXQgd2hlbiB1c2luZyBzdG9wX21hY2hpbmUoKSwgdGhlICFQUkVFTVBUSU9O
IGNhc2UgaXMgZmluZSwgc2luY2UKPiA+IHN0b3BfbWFjaGluZSgpIHNjaGVkdWxlcyB3b3JrIHJh
dGhlciB0aGFuIHJ1bm5pbmcgd29yayBpbiBJUlEgY29udGV4dCBvbiB0aGUKPiA+IGJhY2sgb2Yg
YW4gSVBJLCBzbyBubyBDUFVzIHNob3VsZCBiZSBtaWQtc2VxdW5jZSBkdXJpbmcgdGhlIHBhdGNo
aW5nLCBhbmQgaXQncwo+ID4gbm90IHBvc3NpYmxlIGZvciB0aGVyZSB0byBiZSB0aHJlYWRzIHdo
aWNoIGFyZSBwcmVlbXB0ZWQgbWlkLXNlcXVlbmNlLgo+ID4KPiA+IFRoYXQgYWxsIHNhaWQsIElJ
VUMgb3B0cHJvYmVzIGlzIGdvaW5nIHRvIGRpc2FwcGVhciBvbmNlIGZwcm9iZSBpcyByZWFkeQo+
ID4gZXZlcnl3aGVyZSwgc28gdGhhdCBtaWdodCBiZSBtb290Lgo+IFRoZSBvcHRwcm9iZXMgY291
bGQgYmUgaW4gdGhlIG1pZGRsZSBvZiBhIGZ1bmN0aW9uLCBidXQgZnByb2JlIG11c3QgYmUKPiB0
aGUgZW50cnkgb2YgYSBmdW5jdGlvbiwgcmlnaHQ/Cj4gCj4gRG9lcyB5b3VyIGZwcm9iZSBoZXJl
IG1lYW46ID8KPiAKPiBUaGUgTGludXgga2VybmVsIGNvbmZpZ3VyYXRpb24gaXRlbSBDT05GSUdf
RlBST0JFOgo+IAo+IHByb21wdDogS2VybmVsIEZ1bmN0aW9uIFByb2JlIChmcHJvYmUpCj4gdHlw
ZTogYm9vbAo+IGRlcGVuZHMgb246ICggQ09ORklHX0ZVTkNUSU9OX1RSQUNFUiApICYmICgKPiBD
T05GSUdfRFlOQU1JQ19GVFJBQ0VfV0lUSF9SRUdTICkgJiYgKCBDT05GSUdfSEFWRV9SRVRIT09L
ICkKPiBkZWZpbmVkIGluIGtlcm5lbC90cmFjZS9LY29uZmlnCgpZZXMuCgpNYXNhbWksIFN0ZXZl
LCBhbmQgSSBoYWQgYSBjaGF0IGF0IHRoZSB0cmFjaW5nIHN1bW1pdCBsYXRlIGxhc3QgeWVhciAo
d2hpY2gKdW5mb3J0dW5hdGVseSwgd2FzIG5vdCByZWNvcmRlZCksIGFuZCB3aGF0IHdlJ2QgbGlr
ZSB0byBkbyBpcyBnZXQgZWFjaAphcmNoaXRlY3R1cmUgdG8gaGF2ZSBGUFJPQkUgKGFuZCBGVFJB
Q0VfV0lUSF9BUkdTKSwgYXQgd2hpY2ggcG9pbnQgT1BUUFJPQkUKYW5kIEtSRVRQUk9CRSBiZWNv
bWUgcmVkdW5kYW50IGFuZCBjb3VsZCBiZSByZW1vdmVkLgoKaS5lLiB3ZSdkIGtlZXAgS1BST0JF
UyBhcyBhICJ5b3UgY2FuIHRyYWNlIGFueSBpbnN0cnVjdGlvbiIgZmVhdHVyZSwgYnV0IGluIHRo
ZQpmZXcgY2FzZXMgd2hlcmUgT1BUUFJPQkVTIGNhbiBtYWtlIHRoaW5ncyBmYXRlciBieSB1c2lu
ZyBGVFJBQ0UsIHlvdSBzaG91bGQKanVzdCB1c2UgdGhhdCBkaXJlY3RseSB2aWEgRlBST0JFLgoK
VGhhbmtzLApNYXJrLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
