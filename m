Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 670B9C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Mar 2022 13:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TSuKlQGpnpdk+vli8234lWkUNwjlwPNEYAqhOsU3apg=; b=bmnWZQ3ze8mpn1
	u40mOJjEk/J8xoKlXEkDNOMzM84Z1j1ru/DXToNDvXiVVlqjCjPoFx63vfozPJ2QaZThiuqlH7KAP
	hBxktVqe+7RiC8PhJ//I9kauIwC8YSCrx/Glx9EWuEM8UdLP9u/KETZyRlsnlNUUXjfIeQZA+L0Vt
	F99Ax6/heFV+b46esRbSTWLadG6Hv5g6dD7x25r6SgSecdeiCUYc1+KmsZ2LdacJb8rPDXALu/4R4
	8sxyQUHI6YCgjB9xdpD1gsU/W7Uc3Tut7CL+o4T+K8yvhhHUhRdnX4hsPYoKo1dZbg9BDOtN1YyY9
	CoiU3b78UbhPaP/l1RFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSIz9-00CxVo-HZ; Thu, 10 Mar 2022 13:37:43 +0000
Received: from m228-4.mailgun.net ([159.135.228.4])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSIz3-00CxUP-1U
 for linux-riscv@lists.infradead.org; Thu, 10 Mar 2022 13:37:42 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=michaelkloos.com;
 q=dns/txt; 
 s=k1; t=1646919459; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: References: Cc: To: To: From: From: Subject: Subject:
 MIME-Version: Date: Message-ID: Sender: Sender;
 bh=quoOdBqHe+MiRynnU2oJbvE2sJ9ayk5MN4kKgho3uZs=;
 b=XPsv/S55T/Pgkq6iSgh7DwAGdC3fUFwJa9OKlAmTxGHl5Ox6DrtAy9X0GdM0Y7t33K5WZODT
 o+CbEcE8KQ5rPz3eSI45KxmqSIi5gAERZoh1NSDyp393qchQJJe+CwkLR/XqmkmWTDiaqM8D
 fryCiA2bfaYYGvvJMGPMO9HVrTs=
X-Mailgun-Sending-Ip: 159.135.228.4
X-Mailgun-Sid: WyIxOGJjMSIsICJsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnIiwgIjQ4Y2MwIl0=
Received: from drop1.michaelkloos.com (drop1.michaelkloos.com
 [67.205.190.89]) by smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 6229ff19ea5f8dddb596cf6f (version=TLS1.3, cipher=TLS_AES_128_GCM_SHA256);
 Thu, 10 Mar 2022 13:37:29 GMT
Received: from [192.168.0.103] (cpe-173-88-115-50.columbus.res.rr.com
 [173.88.115.50])
 by drop1.michaelkloos.com (Postfix) with ESMTPSA id ACDAF40176;
 Thu, 10 Mar 2022 13:37:27 +0000 (UTC)
Message-ID: <b10e777c-1511-519b-20bb-a682a6119132@MichaelKloos.com>
Date: Thu, 10 Mar 2022 08:37:27 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] riscv: Work to remove kernel dependence on the M-extension
Content-Language: en-US
From: "Michael T. Kloos" <Michael@MichaelKloos.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, Christoph Hellwig
 <hch@infradead.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <mhng-08a28047-b563-41f4-b705-f27b88554f2c@palmer-mbp2014>
 <8f06a08e-c1b3-066f-bd9e-1f2d686492fa@MichaelKloos.com>
 <3db8c258-cc62-29d1-c64f-31f3c4e2aa07@MichaelKloos.com>
In-Reply-To: <3db8c258-cc62-29d1-c64f-31f3c4e2aa07@MichaelKloos.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220310_053739_917977_F810F428 
X-CRM114-Status: GOOD (  11.68  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SXMgdGhlcmUgc29tZXRoaW5nIEkgY2FuIGRvIHRoYXQgd291bGQgaGVscCBhbGxldmlhdGUgeW91
ciBjb25jZXJucyBvcgphcHByZWhlbnNpb24/CgpPbiAzLzEwLzIwMjIgODoyMiBBTSwgTWljaGFl
bCBULiBLbG9vcyB3cm90ZToKCj4gU29tZSBvdGhlciB0aG91Z2h0czoKPiBJdCBzb3VuZHMgbGlr
ZSBJIGFtIG5vdCB0aGUgZmlyc3QgcGVyc29uIHRvIHdhbnQgdGhpcyBmZWF0dXJlIGFuZCBJCj4g
cHJvYmFibHkgd29uJ3QgYmUgdGhlIGxhc3QuwqAgSSBjcmVhdGVkIHRoZSBjaGFuZ2UgZm9yIG15
IG93biByZWFzb25zLCB0aGUKPiBzYW1lIGFzIGFueSBvdGhlciBjb250cmlidXRvci7CoCBJIHRo
aW5rIHdlIGFsbCBrbm93IHRoYXQgSSBjYW4gbm90IHB1bGwKPiBvdXQgc29tZSBjaGFydCBhbmQg
c2F5LCAiVGhpcyBtYW55IHBlb3BsZSB3YW50IHRoaXMgYW5kIGhlcmUgaXMgd2h5LiLCoCBJCj4g
bGl2ZSBpbiBjZW50cmFsIE9oaW8gYW5kIGhhdmUgYmVlbiBkb2luZyB0aGlzIGFzIGEgaG9iYnku
wqAgSSBkb24ndCBldmVuCj4ga25vdyBhbnlvbmUgZWxzZSB3aG8ga25vd3MgYWJvdXQgc3lzdGVt
cyBhbmQgb3BlcmF0aW5nIHN5c3RlbSBkZXZlbG9wbWVudC4KPiBJZiB0aGUganVzdGlmaWNhdGlv
biB0aGF0IHlvdSBhcmUgbG9va2luZyBmb3IgaXMgdGhhdCBJIGFzIHNvbWUKPiBoeXBvdGhldGlj
YWwgZGV2ZWxvcGVyIGF0IGEgbWFqb3IgdGVjaCBjb21wYW55IGlzIGFib3V0IHRvIHJlbGVhc2Ug
YSBuZXcKPiBSSVNDLVYgY2hpcCB3aXRob3V0IE0gc3VwcG9ydCBidXQgd2Ugd2FudCBpdCB0byBy
dW4gTGludXgsIEkgY2FuIG5vdAo+IHByb3ZpZGUgdGhhdCBhbnN3ZXIuwqAgSXQgc291bmRzIGEg
Yml0IGxpa2Ugc29tZSBzb2Z0d2FyZSBvciBoYXJkd2FyZSwKPiBjaGlja2VuIG9yIHRoZSBlZ2cg
YW55d2F5LsKgIFRyeWluZyB0byBtYWludGFpbiBteSBvd24gZm9yayBpZiBwZW9wbGUKPiBzdGFy
dCBjb250cmlidXRpbmcgcGF0Y2hlcyB3aXRoIGluY29tcGF0aWJsZSBhc3NlbWJseSBzY2FyZXMg
bWUuCj4gIMKgwqDCoMKgTWljaGFlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
