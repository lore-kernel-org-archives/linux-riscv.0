Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAAA0C4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Nov 2022 14:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1zyQ9JgeSc7rsctFiaKYVSChPzLPruGeuPq+5gsTlVU=; b=pDQq8dRLBQoe6Z
	aJc2mzGiffHrhQgFqetiiA5VUqEZrwspTvxKkjhQwdo4h7xWIXcz+DjwHrz9RW2nYsYkWQ5McLRcR
	0382wxu471I91WEaPSli2PUd8+Dy4JdQmP9I20+do3n/Wow7c56VtIRigzv7ZyLa0G7rZefxFdsza
	tbBKW3zne3M8acGzm9Uj9XxiFtMm7mUfYZSp7X0vSilClJ5ND8kH1+LM7qGLEFFzNCyh333Q4mKuK
	Gy2oB4FO327u91RMgpMf6kciiz4lH8KKm6hN1iOmJDvk2IMZrJ/J7VW39eLQD5Jk8KtNe1TwSMnwX
	vC1tsLykWX0g/X6EtvVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owlIt-004nUl-2F; Sun, 20 Nov 2022 14:28:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owlIq-004nTj-Pw
	for linux-riscv@lists.infradead.org; Sun, 20 Nov 2022 14:28:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 16C8560C5C;
	Sun, 20 Nov 2022 14:28:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6407C433D6;
	Sun, 20 Nov 2022 14:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668954491;
	bh=ZyTdR46YHnrIKCr3ypza1lyjyvfhcyJlCC9EQ4CL9Qw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BKuUuq7ArZdPGwIubzAT9eJp3NWq8a5wOgtoZVkvi6AsDW4icVR/rmq/LsrMn3Frj
	 jJ0IJolr731DBC7/lnH0xjK3IJ67Dl7HTA0+FBT2hM+etAQqdqJxwnAffT+Q1rm5w4
	 CpD2SmRJbDcOznoeXE+f9RSYjoHT9ebONxG6Wr8zJo73jUgx6oIVnlwdXHWA+GouFs
	 d423jE1Nl9KPg7YasDzlDTnE7n3WPxMqFuqI8SsNt4sx6Zv2qjeidSvDpOADjWqZwK
	 vp1yKZO+xtFJCrGj5t7uumHs6dEfTgvPXCGlJyAPc7xiIvieNZ98vY4f+Kk6AHS0Nc
	 6qjPrLFJbsWPg==
Date: Sun, 20 Nov 2022 14:28:06 +0000
From: Conor Dooley <conor@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Jisheng Zhang <jszhang@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jiri Slaby <jirislaby@kernel.org>, linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 5/7] riscv: dts: bouffalolab: add the bl808 SoC base
 device tree
Message-ID: <Y3o5dqPX7ScTs9qj@spud>
References: <20221120082114.3030-1-jszhang@kernel.org>
 <20221120082114.3030-6-jszhang@kernel.org>
 <Y3oJSfsNFE9Cn0Al@spud>
 <32ffd3f857ce9c08462ce8a7b2e40871c2f2c275.camel@icenowy.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <32ffd3f857ce9c08462ce8a7b2e40871c2f2c275.camel@icenowy.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221120_062812_898181_16F80BB9 
X-CRM114-Status: GOOD (  18.22  )
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

T24gU3VuLCBOb3YgMjAsIDIwMjIgYXQgMDc6NTg6NTZQTSArMDgwMCwgSWNlbm93eSBaaGVuZyB3
cm90ZToKPiDlnKggMjAyMi0xMS0yMOaYn+acn+aXpeeahCAxMTowMiArMDAwMO+8jENvbm9yIERv
b2xleeWGmemBk++8mgo+ID4gT24gU3VuLCBOb3YgMjAsIDIwMjIgYXQgMDQ6MjE6MTJQTSArMDgw
MCwgSmlzaGVuZyBaaGFuZyB3cm90ZToKPiA+ID4gQWRkIGEgYmFpc2MgZHRzaSBmb3IgdGhlIGJv
dWZmYWxvbGFiIGJsODA4IFNvQy4KCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBwbGljOiBpbnRlcnJ1cHQtY29udHJvbGxlckBlMDAwMDAwMCB7Cj4gPiA+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgY29tcGF0aWJsZSA9ICJ0aGVhZCxj
OTAwLXBsaWMiOwo+ID4gCj4gPiBIbW0sIHRoaXMgb25lIGZhaWxzIHZhbGlkYXRpb24gdG9vLiBM
aWtlbHkgeW91IG5lZWQgdG8gYWRkIGEKPiA+ICJib3VmZmFsb2xhYixwbGljIiB0byB0aGUgcGxp
YyBkdC1iaW5kaW5nIG9yIG90aGVyd2lzZSBtb2RpZnkgdGhlCj4gPiBiaW5kaW5nIHN1Y2ggdGhh
dCB0aGVhZCxjOTAwLXBsaWMgb24gaXQncyBvd24gaXMgcGVybWl0dGVkLiBDQyBTYW11ZWwKPiA+
IG9uCj4gPiB0aGF0IHBhdGNoIHBsZWFzZSBpbiBjYXNlIGhlIGhhcyBhbiBvcGluaW9uIG9uIGl0
Lgo+IAo+IFBlcnNvbmFsbHkgSSBwcmVmZXIgYSBzaW5nbGUgYzkwMC1wbGljIGluIGNvbXBhdGli
bGUsIGJlY2F1c2UgdGhlIFBMSUMKPiBkb2Vzbid0IGxvb2sgc28gY29uZmlndXJhYmxlIGluIEM5
MDYvQzkxMCAodGhlIGludGVycnVwdCBzb3VyY2UgbnVtYmVyCj4gaXMgcmVhbGx5IGFkanVzdGFi
bGUsIGJ1dCBpdCdzIGFscmVhZHkgaW4gdGhlIHJpc2N2LG5kZXYgcHJvcGVydHkpLgoKUmlnaHQs
IGlmIGFsbCBpbXBsZW1lbnRhdGlvbnMgYXJlIGdvaW5nIHRvIGJlIGlkZW50aWNhbCAobW9kdWxv
IHRoZQpyaXNjdixuZGV2KSBhbGxvd2luZyB0aGVhZCxjOTAwLXBsaWMgaW4gaXNvbGF0aW9uIG1h
a2VzIHNlbnNlIHRvIG1lLgpJIGhhZCBhIGJpdCBvZiBhIGNoZWNrIGluIHRoZSBoaXN0b3J5ICYg
aXQgbG9va3MgbGlrZSB0aGVyZSB3YXMgbm8gCmV4cGxhbmF0aW9uIGdpdmVuIGZvciB3aHkgdGhl
IEQxIG5lZWRlZCBhIHNwZWNpZmljIGNvbXBhdGlibGUgKGFsdGhvdWdoCnRoZXJlJ3Mgbm8gaGFy
bSBpbiBoYXZpbmcgb25lIGluIGNhc2Ugc29tZXRoaW5nIGNvbWVzIHVwIGluIHRoZSBmdXR1cmUK
dGhhdCdkIHJlcXVpcmUgc3BlY2lhbCBoYW5kbGluZyBmb3IgYSBnaXZlbiBpbXBsZW1lbnRhdGlv
bikuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
