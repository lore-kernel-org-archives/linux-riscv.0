Return-Path: <SRS0=qOfL=QL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68AFFC282CB
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  4 Feb 2019 20:09:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37C8A20821
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  4 Feb 2019 20:09:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H3Larhta"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37C8A20821
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=iogearbox.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ANw15XNBdiYX0eVIYDJnAUmV6YUtklZFviwmlmff5wk=; b=H3Larhta9B3q0R
	yLfH8bojU4O1o0wKz6+rP5q7qhvPPozk7dmtAg1L1hw2EaT1CDukseq2EYUjlopXLmIA2IlDPjq4T
	oxM/iJo7iJcJkCl+K/xmHlnhY/v9UDa9xHNBRsSQO4X4Ds7+bh9oxwZOdPJRyucyby1TOv+uywOf9
	INrsQfELsWbv++u2TiMx6HcYeZy52gL7OBeUVkUoCizWj6d/tlyOAE6UALxfcrZO1lEjN+9YjO9K9
	AlIjWnC3soBmpt64S9WMFgq3lKUsEaX4aBeNQ2Yz90kuk0n0ZoMaKMDIoa27Ig8FzNPju8PptVVoQ
	RP71DMiik0YM0ClYxZ+w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqkYH-0004gP-SF; Mon, 04 Feb 2019 20:09:09 +0000
Received: from www62.your-server.de ([213.133.104.62])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqkYE-0004fm-M5
 for linux-riscv@lists.infradead.org; Mon, 04 Feb 2019 20:09:08 +0000
Received: from [88.198.220.130] (helo=sslproxy01.your-server.de)
 by www62.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.89_1) (envelope-from <daniel@iogearbox.net>)
 id 1gqkYD-0004Sd-Cg; Mon, 04 Feb 2019 21:09:05 +0100
Received: from [178.197.249.40] (helo=linux.home)
 by sslproxy01.your-server.de with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.89)
 (envelope-from <daniel@iogearbox.net>)
 id 1gqkYC-0001NU-Vh; Mon, 04 Feb 2019 21:09:05 +0100
Subject: Re: [PATCH bpf-next 3/3] bpf, doc: add RISC-V to filter.txt
To: bjorn.topel@gmail.com, linux-riscv@lists.infradead.org, ast@kernel.org,
 netdev@vger.kernel.org
References: <20190203115132.8766-1-bjorn.topel@gmail.com>
 <20190203115132.8766-4-bjorn.topel@gmail.com>
From: Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <d033e68a-b520-c25d-e951-761693c16fe7@iogearbox.net>
Date: Mon, 4 Feb 2019 21:09:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20190203115132.8766-4-bjorn.topel@gmail.com>
Content-Language: en-US
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.100.2/25350/Mon Feb  4 11:34:43 2019)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190204_120906_722178_C9D92730 
X-CRM114-Status: GOOD (  14.78  )
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
Cc: hch@infradead.org, palmer@sifive.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMDIvMDMvMjAxOSAxMjo1MSBQTSwgYmpvcm4udG9wZWxAZ21haWwuY29tIHdyb3RlOgo+IEZy
b206IEJqw7ZybiBUw7ZwZWwgPGJqb3JuLnRvcGVsQGdtYWlsLmNvbT4KPiAKPiBVcGRhdGUgRG9j
dW1lbnRhdGlvbi9uZXR3b3JraW5nL2ZpbHRlci50eHQgdG8gbWVudGlvbiBSSVNDLVYuCj4gCj4g
U2lnbmVkLW9mZi1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm4udG9wZWxAZ21haWwuY29tPgoKTml0
OiBpbiBEb2N1bWVudGF0aW9uL3N5c2N0bC9uZXQudHh0IHVuZGVyIGJwZl9qaXRfZW5hYmxlIHRo
ZXJlIGlzIGFsc28KYSBjb25jcmV0ZSBsaXN0IG9mIGVCUEYvY0JQRiBKSVRzLCB3b3VsZCBiZSBn
b29kIHRvIGFkZCByaXNjdjY0IHRoZXJlIGFzCndlbGwuCgo+ICBEb2N1bWVudGF0aW9uL25ldHdv
cmtpbmcvZmlsdGVyLnR4dCB8IDE2ICsrKysrKysrKy0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQs
IDkgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1l
bnRhdGlvbi9uZXR3b3JraW5nL2ZpbHRlci50eHQgYi9Eb2N1bWVudGF0aW9uL25ldHdvcmtpbmcv
ZmlsdGVyLnR4dAo+IGluZGV4IDAxNjAzYmMyZWZmMS4uYjVlMDYwZWRmYzM4IDEwMDY0NAo+IC0t
LSBhL0RvY3VtZW50YXRpb24vbmV0d29ya2luZy9maWx0ZXIudHh0Cj4gKysrIGIvRG9jdW1lbnRh
dGlvbi9uZXR3b3JraW5nL2ZpbHRlci50eHQKPiBAQCAtNDY0LDEwICs0NjQsMTEgQEAgYnJlYWtw
b2ludHM6IDAgMQo+ICBKSVQgY29tcGlsZXIKPiAgLS0tLS0tLS0tLS0tCj4gIAo+IC1UaGUgTGlu
dXgga2VybmVsIGhhcyBhIGJ1aWx0LWluIEJQRiBKSVQgY29tcGlsZXIgZm9yIHg4Nl82NCwgU1BB
UkMsIFBvd2VyUEMsCj4gLUFSTSwgQVJNNjQsIE1JUFMgYW5kIHMzOTAgYW5kIGNhbiBiZSBlbmFi
bGVkIHRocm91Z2ggQ09ORklHX0JQRl9KSVQuIFRoZSBKSVQKPiAtY29tcGlsZXIgaXMgdHJhbnNw
YXJlbnRseSBpbnZva2VkIGZvciBlYWNoIGF0dGFjaGVkIGZpbHRlciBmcm9tIHVzZXIgc3BhY2UK
PiAtb3IgZm9yIGludGVybmFsIGtlcm5lbCB1c2VycyBpZiBpdCBoYXMgYmVlbiBwcmV2aW91c2x5
IGVuYWJsZWQgYnkgcm9vdDoKPiArVGhlIExpbnV4IGtlcm5lbCBoYXMgYSBidWlsdC1pbiBCUEYg
SklUIGNvbXBpbGVyIGZvciB4ODZfNjQsIFNQQVJDLAo+ICtQb3dlclBDLCBBUk0sIEFSTTY0LCBN
SVBTLCBSSVNDLVYgYW5kIHMzOTAgYW5kIGNhbiBiZSBlbmFibGVkIHRocm91Z2gKPiArQ09ORklH
X0JQRl9KSVQuIFRoZSBKSVQgY29tcGlsZXIgaXMgdHJhbnNwYXJlbnRseSBpbnZva2VkIGZvciBl
YWNoCj4gK2F0dGFjaGVkIGZpbHRlciBmcm9tIHVzZXIgc3BhY2Ugb3IgZm9yIGludGVybmFsIGtl
cm5lbCB1c2VycyBpZiBpdCBoYXMKPiArYmVlbiBwcmV2aW91c2x5IGVuYWJsZWQgYnkgcm9vdDoK
PiAgCj4gICAgZWNobyAxID4gL3Byb2Mvc3lzL25ldC9jb3JlL2JwZl9qaXRfZW5hYmxlCj4gIAo+
IEBAIC02MDMsOSArNjA0LDEwIEBAIGdvdCBmcm9tIGJwZl9wcm9nX2NyZWF0ZSgpLCBhbmQgJ2N0
eCcgdGhlIGdpdmVuIGNvbnRleHQgKGUuZy4KPiAgc2tiIHBvaW50ZXIpLiBBbGwgY29uc3RyYWlu
dHMgYW5kIHJlc3RyaWN0aW9ucyBmcm9tIGJwZl9jaGVja19jbGFzc2ljKCkgYXBwbHkKPiAgYmVm
b3JlIGEgY29udmVyc2lvbiB0byB0aGUgbmV3IGxheW91dCBpcyBiZWluZyBkb25lIGJlaGluZCB0
aGUgc2NlbmVzIQo+ICAKPiAtQ3VycmVudGx5LCB0aGUgY2xhc3NpYyBCUEYgZm9ybWF0IGlzIGJl
aW5nIHVzZWQgZm9yIEpJVGluZyBvbiBtb3N0IDMyLWJpdAo+IC1hcmNoaXRlY3R1cmVzLCB3aGVy
ZWFzIHg4Ni02NCwgYWFyY2g2NCwgczM5MHgsIHBvd2VycGM2NCwgc3BhcmM2NCwgYXJtMzIgcGVy
Zm9ybQo+IC1KSVQgY29tcGlsYXRpb24gZnJvbSBlQlBGIGluc3RydWN0aW9uIHNldC4KPiArQ3Vy
cmVudGx5LCB0aGUgY2xhc3NpYyBCUEYgZm9ybWF0IGlzIGJlaW5nIHVzZWQgZm9yIEpJVGluZyBv
biBtb3N0Cj4gKzMyLWJpdCBhcmNoaXRlY3R1cmVzLCB3aGVyZWFzIHg4Ni02NCwgYWFyY2g2NCwg
czM5MHgsIHBvd2VycGM2NCwKPiArc3BhcmM2NCwgYXJtMzIsIHJpc2N2IChSVjY0RykgcGVyZm9y
bSBKSVQgY29tcGlsYXRpb24gZnJvbSBlQlBGCj4gK2luc3RydWN0aW9uIHNldC4KPiAgCj4gIFNv
bWUgY29yZSBjaGFuZ2VzIG9mIHRoZSBuZXcgaW50ZXJuYWwgZm9ybWF0Ogo+ICAKPiAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
