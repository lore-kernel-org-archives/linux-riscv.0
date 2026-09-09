Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A86C79FB7
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 20:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Q8UEBQNxTKPJ7uP+ulND/QmjJc29SNHMs8Adv4sbFc=; b=FC1HHjZ+zRXRah
	/q6HFfVWfgN+tjFbPmmxpl8vddIlIMcZZkMVnmDh33SZ5ON6CR22Zj6lh9YJWooiXTcge00CnXYTg
	Ek9TPjsIu3SXjxyjwn1odZMwbrGJLJUk9F0xrJ5Phn8JzMdN4k5isvj92aJYbzcLgZkWJ4x+vQBBw
	Hnu1M2scyjnOIAIHrDE1iMJwVGOAmrfY5zKR+HxNze9UYLpFLvFzJiORCyul4ZGyR2rVj4CxfZxd2
	HBILQ6GcCvvhwMXzZthpBO/tsifs+hWC1ezMijHXEN5TSsRZlJObPdqbCEOfVhkRbIlaVvT6RxBHr
	jI63k5I8Nlf8LDV0F92Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4OTt-0000000CmIy-39uI;
	Wed, 09 Sep 2026 20:01:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4OTq-0000000CmHl-1Q5j;
	Wed, 09 Sep 2026 20:01:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AB42B1570;
	Wed,  9 Sep 2026 13:01:07 -0700 (PDT)
Received: from [10.211.55.7] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BAF703F7B4;
	Wed,  9 Sep 2026 13:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=foss.arm.com; s=main;
	t=1788984071; bh=rNi5YhSEeETSE5FQBog3k1r0aviOJOf+s/njOtyxBZE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HnL3iTWUzI5pHllYz6CCHmcPV3JTw+s6qzHZZToyX8cY0TBKM130vVtUdiL2JwN+G
	 /8IMNBhLGf6IMvg5JAecf3/j2SujtIhDOIUmv1SnU6JOhvLB1iobKgEx/gCGbaofGy
	 u6UNzBwtszGomEhOE5GTTi+QO1cB/EndPZx3QVr4=
Message-ID: <c5367968-0e0d-4583-8ac9-efb3bb5b2983@foss.arm.com>
Date: Wed, 9 Sep 2026 15:01:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Shadow Stack Locking Semantics between arch's
To: Mark Brown <broonie@kernel.org>,
 "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: Jesse Huang <jesse.huang@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 linux-arm-kernel@lists.infradead.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-hardening@vger.kernel.org, linux-api@vger.kernel.org,
 dave.hansen@linux.intel.com, rick.p.edgecombe@intel.com, debug@rivosinc.com,
 andrew@sifive.com, kito.cheng@sifive.com
References: <a1946d93-370e-4ca9-85d6-60b4a20ffd47@arm.com>
 <3bb672e0-7bc3-434f-904e-aa00394dd01f@foss.arm.com>
 <d20ccb74-69ed-45d7-a810-846904873588@sirena.org.uk>
 <0ef9f4ab-4c9f-4089-bed3-f7726ec97804@foss.arm.com>
 <522bcf96-499c-491b-aaf0-34e6bbd42929@sirena.org.uk>
Content-Language: en-US
From: Bill Roberts <bill.roberts@foss.arm.com>
In-Reply-To: <522bcf96-499c-491b-aaf0-34e6bbd42929@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_130114_509692_A9B7A598 
X-CRM114-Status: UNSURE (   9.68  )
X-CRM114-Notice: Please train this message.
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

Pj4+PiB1bnNpZ25lZCBsb25nIGxvY2tlZCA9IDB4MjsgLy8gS2VybmVsIFRhc2sgU3RhdGUgLT4g
TE9DSyBXUklURQo+Pj4+IHVuc2lnbmVkIGxvbmcgY3VyX3ZhbCA9IDB4MzsgLy8gS2VybmVsIFRh
c2sgU3RhdGUgLT4gV1JJVEUgYW5kIFNIQURPV1NUQUNLCj4+Pj4gRU5BQkxFRAo+Pj4+IHVuc2ln
bmVkIGxvbmcgbmV3X3ZhbCA9IDB4MDsgLy8gVXNlcnNwYWNlIEZlYXR1cmUgQ2hhbmdlIHZpYSBz
eXNjYWxsIC0+Cj4+Pj4gRElTQUJMRQo+Pj4+IHwgeDg2LTY0IHwgcmlzYy12IHwgYXJtNjQgfAo+
Pj4+IHwgLS0tLS0tLS0tLSB8IC0tLS0tLS0tIHwgLS0tLS0tLS0tIHwKPj4+PiB8IFdvcmtzwqAg
fCBGYWlsc8KgIHwgRmFpbHPCoCDCoCDCoHwKPj4+IEkgd291bGQgbm90IGhhdmUgZXhwZWN0ZWQg
dGhhdCBjb21iaW5hdGlvbiB0byB3b3JrIGF0IGFsbCB3aXRoIHRoZQo+Pj4gcHJjdGwoKSAoYXMg
b3Bwb3NlZCB0byBhcmNoX3ByY3RsKCkpIGludGVyZmFjZSBUQkgsIGlmIHlvdSd2ZSBsb2NrZWQK
Pj4+IHdyaXRlIG9uIHlvdSBzaG91bGRuJ3QgYmUgYWJsZSB0byBkaXNhYmxlIGl0LiAgVGhlIHJl
YXNvbiB0aGF0IHdvcmtzIG9uCj4+PiB4ODYgYXQgdGhlIG1pbnV0ZSBpcyB0aGF0IGZvciB4ODYg
eW91IGNhbiBvbmx5IGNoYW5nZSBvbmUgYml0IGF0IGEgdGltZQo+Pj4gc28gdGhlIG5ldyB2YWx1
ZSB3aGVuIGRpc2FibGluZyBpcyBlZmZlY3RpdmVseSAweDIsIG5vdCAweDAuCj4+IFllcywgdGhp
cyBpcyBleGFjdGx5IHdoYXQgSSBhbSBwb2ludGluZyBvdXQuIEltcGxlbWVudGF0aW9uIGFzaWRl
LCBpcyB0aGF0Cj4+IHRoZSBiZWhhdmlvciB3ZSB3YW50Pwo+IEl0IHNlZW1zIG1vcmUgaGVscGZ1
bCB0byBzdXBwb3J0IGNoYW5naW5nIG1vcmUgdGhhbiBvbmUgYml0IGF0IG9uY2UuCisgUmljayBp
biAidG8iLCBJIHdhbnQgaGltIHRvIHdlaWdoIGluIGFzIHdlbGwuCgpJIHRoaW5rIHdlJ3JlIHN0
aWxsIG1pc2NvbW11bmljYXRpbmcuwqAgVGhlIGlzc3VlIGlzLCB0aGF0IGluIHRoZSBjdXJyZW50
CmludGVyZmFjZSBmb3IgeDg2IHZpYSBhcmNoX3ByY3RsLCB3aGljaCBpcyBvbmUgYml0IGF0IGEg
dGltZSwgdGhlIGV4cGxpY2l0CmxvY2tpbmcgb2Ygd3JpdGUgY2FuIGJlIHVuZG9uZSB2aWEgdHVy
bmluZyBvZmYgdGhlIHNoYWRvdyBzdGFjay4gU2hvdWxkCnRoYXQgc3VjY2VlZCwgb3Igc2hvdWxk
IHRoYXQgZmFpbCBzaW5jZSBpdCBpbXBsaWNpdGx5IHR1cm5zIG9mZiB3cml0ZT8gClNob3VsZAp3
ZSBwcmVzZXJ2ZSB0aGF0IGFzIHdlIHBvcnQgdG8gcHJjdGw/IFNob3VsZCB3ZSBjaGFuZ2UgdGhh
dCBpbiB4ODYKYXJjaF9wcmN0bCwgd2FzIHRoYXQgaW50ZW5kZWQ/CgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
