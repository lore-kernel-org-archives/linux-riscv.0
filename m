Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F18FACE7B08
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Nov 2025 13:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tRgDYssvs0p8PtYODaGarSYQlzp8S6UGXgsX2jfE60M=; b=OTJm8BSDehyWOe
	5Z7vXq1bBykM3bIVhNtAWVno7BM+NnI5QU2hjWHvT1cDb7HTEobP7aI6GLBaUWzP3nlzZEYJBrLlk
	VyI3yoJJnWwhXEyx7SrrXoBXSgxgGc9f0mNbSx2ofMlhz0OJUBY04clkA8jkCMHpgc0KaQf40d/2z
	6BniCd4ecabVsk+VwkRgCs2CHWY8nQYNKXJm3YgdhKi9ffU7ZlXtM6/fcfAcbvGtSDhhmeDoXy1uY
	iGwumccsIiGZt/2yCggSdMHbi1YFeObZXTgb59wlI4my6NPryeaS8fbXg8g8KM3gEmzHuNluAgx/V
	oBde/gT6dUTnRYvNI05g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJtwb-0000000CGYI-28RB;
	Fri, 14 Nov 2025 13:34:29 +0000
Received: from smtpbguseast1.qq.com ([54.204.34.129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJtwY-0000000CGSv-2lq9
	for linux-riscv@lists.infradead.org;
	Fri, 14 Nov 2025 13:34:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1763127242;
	bh=VPD0Un9VCoiu/ZV1KP2Lboih+blDxW/s8Ai4q1ClHTY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=Bku/JWfxULtP+UUdaUlKVyNA+gz6nCBe9fhxl/QIIt5ZQdrv2fXeffpxVlhjDbAFq
	 J0+t10rA+w8MYp2GzU0nFfju6hG9QoVUsmQpZ0QJsJXdBg2oZmMQnhBg/hfJRNBTmL
	 rJjSCS4vIwFrFPT6ISff4FbY9qcXJ58GCZSbnkl4=
X-QQ-mid: zesmtpgz9t1763127238tb19bb4ed
X-QQ-Originating-IP: 3EoJsFn8/+w+Basw7ZgGnaNz8HyXJ58kswZeQ+S0/0I=
Received: from = ( [112.92.71.152])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 14 Nov 2025 21:33:57 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2921056434625684428
EX-QQ-RecipientCnt: 4
Date: Fri, 14 Nov 2025 21:33:57 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [RFC PATCH] riscv: dts: spacemit: initial i2c support for
 OrangePi RV2
Message-ID: <BF4752787F870A9D+aRcvxe_rNthTxlUn@troy-wujie14pro-arch>
References: <20251025074514.642357-1-michael.opdenacker@rootcommit.com>
 <52bf454f-424a-4824-a3fe-339d411bd664@rootcommit.com>
 <4544207DE7959B10+aP7Ieuaw16uArne_@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4544207DE7959B10+aP7Ieuaw16uArne_@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MrXWwK2gDZ/aRXSvmQ/EO19hjFa0un9MRuWWzCp/12gt4UOTGoyHgVYq
	mYCEoy5qglYVDdnHnWs8rggMH/j5cXEIEkyXglGO3jLmWvCq8qrRRhKIcgHhcKjstlCprZR
	zcZtlfHIYEmAnZyHLWXamfbk6raq7fL4EtbXqCMHnCrCeRoFhfusTNif0RSMjrqAG/mNdtx
	yHbpeBQwy/vzPaNI7UmM7y7FvgI1zXDMqJA9rddtvl0qph1aUXgWgc5/bXZcyLGQp6vDsoI
	I/KOX0gjg0q8yx4IqRBCTBcts7pbxUr4QNLWiQJfpNUmiMw0qAAM4E4W3JJ/LSjab5W1bGx
	uBitdXGAEa44SxMjiK0uNTqc2vdMtx/b3EIkAdpxt0kLRCLVKt4viWnTyRkp+JbMkTOIOiz
	wmZpse0dUaaAx3O0btBjL3Qk9wdv5Vo6KE8EmbMt1w5rg0WGapWmX3Ds+q5IGt3w/XSi3aj
	1vCX1Quds1xM7mETMiE+O5Wb8xGxagKkz842sywcaTXGjvR9jHB06cAeHfzE1epEWSskL5H
	stwlEleI3S4KfQ2Invr5FWhFEajWljg1d2EcX3fhAy4ynCP0XP2P53rRH2VfLOEyB7+Ghx7
	DeEKlHxIAGQMmXVNRm6OOGi3dHNI2PMy3cUYgBdt9BuPidrOSPmMwxCX5vgqFXO7SH2OGjE
	IBZwbn6sVmhI9uq2rJ3AE3NkQR9q1SLgMq2v+qn/N+VHN2RBH/y/umQCVxEhlWcRRyOycX1
	nnCTQO8oEMRmJwiAJnEoy3Wj2cG+f8Ku2pmfYckEjwPvrOQFqAedcZGSOg8rCg4XQI0Sjir
	I3Pkr+0R7Krr3xMHl1sVouUvdVGB0pqpFR7a50MqMEOVBbnRUm7kn0cCzDwUoovaVtM41XU
	MdNTlz7fiN4OppL4xbHeUyZDzmVl3/BQK8xrW7P5INoaXlBbeyykydV/1j5KwX3eMS3A/Lp
	Bir3fn5gMNmhLCAuXNzkfU1rZtuteF2deDzCNxPFtrWBIx1EvRAsn4vGFbHnCRT85gRdOCX
	ZMnO36F97toSmqHFal1E0p/aH1XzAAk4uQx3IXNBCmSvQXhdDw7xacaiOPybAimznykeU0+
	fBgfeqva1jFOLEfMPrwb2uZ1P1uQDH0EA==
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_053427_231091_AB0D2B0D 
X-CRM114-Status: GOOD (  15.75  )
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

T24gTW9uLCBPY3QgMjcsIDIwMjUgYXQgMDk6MTg6NTBBTSArMDgwMCwgVHJveSBNaXRjaGVsbCB3
cm90ZToKPiBPbiBTYXQsIE9jdCAyNSwgMjAyNSBhdCAwNzo0ODo0NUFNICswMDAwLCBNaWNoYWVs
IE9wZGVuYWNrZXIgd3JvdGU6Cj4gPiBHcmVldGluZ3MsCj4gPiAKPiA+IE9uIDEwLzI1LzI1IDA5
OjQ1LCBtaWNoYWVsLm9wZGVuYWNrZXJAcm9vdGNvbW1pdC5jb20gd3JvdGU6Cj4gPiA+IEZyb206
IE1pY2hhZWwgT3BkZW5hY2tlciA8bWljaGFlbC5vcGRlbmFja2VyQHJvb3Rjb21taXQuY29tPgo+
IFsuLi5dCj4gPiA+ICsmaTJjMiB7Cj4gPiA+ICsJcGluY3RybC0wID0gPCZpMmMyXzBfY2ZnPjsK
PiA+ID4gKwlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOwo+ID4gPiArCXN0YXR1cyA9ICJva2F5
IjsKPiA+ID4gK307Cj4gPiA+ICsKPiA+ID4gKyZpMmM4IHsKPiA+ID4gKwlwaW5jdHJsLTAgPSA8
JmkyYzhfY2ZnPjsKPiA+ID4gKwlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOwo+ID4gPiArCXN0
YXR1cyA9ICJva2F5IjsKPiA+ID4gK307Cj4gPiA+ICsKPiA+ID4gICAmcGRtYSB7Cj4gPiA+ICAg
CXN0YXR1cyA9ICJva2F5IjsKPiA+ID4gICB9Owo+ID4gCj4gPiAKPiA+IFVuZm9ydHVuYXRlbHks
IHRoZXNlIGNoYW5nZXMgYXJlIG5vdCBmdW5jdGlvbmFsIHlldCBvbiBPcmFuZ2VQaSBSVjIsIHRl
c3RpbmcKPiA+IG9uIGh0dHBzOi8vZ2l0aHViLmNvbS9zcGFjZW1pdC1jb20vbGludXgvY29tbWl0
cy9rMS9kdC1mb3ItbmV4dAo+ID4gCj4gPiAjIGkyY2RldGVjdCAtciAyCj4gPiBXQVJOSU5HISBU
aGlzIHByb2dyYW0gY2FuIGNvbmZ1c2UgeW91ciBJMkMgYnVzLCBjYXVzZSBkYXRhIGxvc3MgYW5k
IHdvcnNlIQo+ID4gSSB3aWxsIHByb2JlIGZpbGUgL2Rldi9pMmMtMiB1c2luZyByZWNlaXZlIGJ5
dGUgY29tbWFuZHMuCj4gPiBJIHdpbGwgcHJvYmUgYWRkcmVzcyByYW5nZSAweDA4LTB4NzcuCj4g
PiBDb250aW51ZT8gW1kvbl0KPiA+IMKgIMKgIMKgMMKgIDHCoCAywqAgM8KgIDTCoCA1wqAgNsKg
IDfCoCA4wqAgOcKgIGHCoCBiwqAgY8KgIGTCoCBlwqAgZgo+ID4gMDA6wqAgwqAgwqAgwqAgW8Kg
IDEyNC42NzUzMjFdIGkyYy1rMSBkNDAxMjAwMC5pMmM6IGkyYyB0cmFuc2ZlciBmYWlsZWQsIHJl
dCAtMTEKPiA+IGVyciAweDQwMDAwMAo+IFsuLi5dCj4gCj4gPiDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoC0tIDA5IFvCoCAxMjQuNjg2NzY5XSBpMmMtazEgZDQwMTIwMDAuaTJjOiBpMmMgdHJh
bnNmZXIKPiA+IEkgYXNzdW1lIHRoZSBpMmMtazEgZHJpdmVyIHdvcmtzIG9uIEJhbmFuYVBpIEYz
Lgo+IE5vLCBJdCBkb2Vzbid0IHdvcmsgb24gQmFuYW5hUGkgRjMgYWN0dWFsbHkuCj4gPiBBbnkg
Y2x1ZXMgd2h5IHRoZSBzYW1lCj4gPiBidXNlcyBkb24ndCB3b3JrIE9yYW5nZVBpIFJWMj8KPiBU
aGlzIGlzIGEga25vd24gaXNzdWUuCj4gSSBkaWRu4oCZdCBmaXggaXQgZWFybGllciBzaW5jZSBp
dCBkb2VzbuKAmXQgYWZmZWN0IGZ1bmN0aW9uYWxpdHksCj4gYnV0IG5vdyB0aGF0IGl04oCZcyBi
ZWVuIHJlcG9ydGVkLCBpdOKAmXMgdGltZSB0byBmaXggaXQuCj4gSeKAmWxsIHNlbmQgYSBwYXRj
aCBzaG9ydGx5Lgo+IAo+IFRoYW5rcyBmb3IgcmVwb3J0aW5nIHRoaXMgaXNzdWUuCkZpeGVkIGhl
cmU6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI1MTExMy1maXgtazEtZGV0ZWN0LWZh
aWx1cmUtdjItMS1iMDJhOWE3NGY2NWFAbGludXguc3BhY2VtaXQuY29tLwoKICAgICAgICAgICAg
ICAgICAtIFRyb3kKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
