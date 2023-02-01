Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F00FC38142
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Feb 2023 09:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oB5BDVyQV4454DpZXwdZSFc0MdIqVo8dnuGAoMZ9NBI=; b=Qa5o/iYYIahwC4
	Fz6YH5DTKixULIfkSG6s6xjv6d5nrF9GFKw+7OS++24mgQoe0STpfOwEoTZZbnur1BGVzbZrWucZL
	kENsKRqH+Y63oRfSVHbFs0tvGoH7kZ2ABFw8yDP0K4jfivr8tnEGzdR3u/QrkJaJIiTprX/Oubb3F
	kyR5jnggFSZCtJ0QNgYIHxWYXEyJ1k4t1EY3oK2LEk0qn6+FZJCpFa9MqeIw1Sx686NCbJ04Fp21W
	Q7ve9H1K9MWIhgEgPdEZYTF47PG2Daj+Ch8h6BFyPjJo6n3qzFNWAxfGgOrzv3xhY/IUIt3H1dgDS
	smtPjum0v2D5BBsA0nLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN9Rd-00B1DK-HZ; Wed, 01 Feb 2023 09:30:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN9Ra-00B1Bw-Ne
	for linux-riscv@lists.infradead.org; Wed, 01 Feb 2023 09:30:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 14BE46170A;
	Wed,  1 Feb 2023 09:30:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F39FC433EF;
	Wed,  1 Feb 2023 09:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675243817;
	bh=MImzud+6lRzhX2tGkp7uKBM1B58TKv2hfv2OdwtwPDQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=S3mpfu431i4iAMsICWrvOX+66Gfb7JR6cGSmf2FbkUpQPH3hHzrwgrp1DSmEzWtwu
	 3WNz9hI/fdn2hnWDf8mX4MHbDqC/8SuIYFnxE6dop7HWzhPwIlNnpqzbFkDrSXstEE
	 1wswwAWG/lxElpfZ90hM+Uz2+qOWXRYor6fJFCB+6VYtmt+3s6h4/nW1NIGGKqwRyy
	 syClpFLPBfX+QatEJsqoRwA2H1mvhXm0ZrALHwpK4i7XJGMDDRkuB/Xb4IPozaxFZu
	 7dwAjmVkHtPwjZqsRf4R0glhSJAr99WRYCuH6y4XMnf8X6Nj4adFtRBuZ6mtEdVtEb
	 23C/ZYOkJ20VA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Guo Ren <guoren@kernel.org>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, mhiramat@kernel.org,
 conor.dooley@microchip.com, penberg@kernel.org, mark.rutland@arm.com,
 liaochang <liaochang1@huawei.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH] riscv: kprobe: Fixup kernel panic when probing an
 illegal position
In-Reply-To: <CAJF2gTQHDmT=XWE=j8+5Y5ogKh4qNMpXCwAa+7wXEkBit0ujXw@mail.gmail.com>
References: <20230126130509.1418251-1-guoren@kernel.org>
 <878rhig9zj.fsf@all.your.base.are.belong.to.us>
 <CAJF2gTQHDmT=XWE=j8+5Y5ogKh4qNMpXCwAa+7wXEkBit0ujXw@mail.gmail.com>
Date: Wed, 01 Feb 2023 10:30:14 +0100
Message-ID: <87357pravt.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_013018_824307_9A4389A9 
X-CRM114-Status: GOOD (  13.32  )
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

R3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+IHdyaXRlczoKCj4+ID4gKyAgICAgaWYgKCFhcmNo
X2NoZWNrX2twcm9iZShwKSkKPj4gPiArICAgICAgICAgICAgIHJldHVybiAtRUlMU0VROwo+PiA+
ICsKPj4gPiAgICAgICAvKiBjb3B5IGluc3RydWN0aW9uICovCj4+ID4gICAgICAgcC0+b3Bjb2Rl
ID0gKnAtPmFkZHI7Cj4+Cj4+IE5vdCByZWxhdGVkIHRvIHlvdXIgcGF0Y2gsIGJ1dCB0aGlzIGNh
biBhbHNvIHRyaWdnZXIgYSBtaXNhbGlnbmVkIGxvYWQuCj4gQWZ0ZXIgcmVyZWFkaW5nIHRoZSBz
cGVjLCBtaXNhbGlnbmVkIGxvYWQvc3RvcmUgaXMgbm90IG1hbmRhdG9yeQo+IHN1cHBvcnRlZC4g
KEFsdGhvdWdoIG15IG1hY2hpbmVzIGFuZCBxZW11IGFyZSBjb3JyZWN0KQoKWWVzLiBJdCB3b3Vs
ZCBiZSBncmVhdCBpZiBpdCBjb3VsZCBiZSB0dXJuZWQgb24gYnkgUUVNVSAoeW91IGNhbiB3aXRo
ClNwaWtlKS4KCj4gU28gSSBuZWVkIGZpeHVwOgo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
a2VybmVsL3Byb2Jlcy9rcHJvYmVzLmMKPiBiL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Jlcy9rcHJv
YmVzLmMKPiBpbmRleCAyN2Y4OTYwYzMyMWMuLjBjMDE2ZDQ5Njc0NiAxMDA2NDQKPiAtLS0gYS9h
cmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMva3Byb2Jlcy5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJu
ZWwvcHJvYmVzL2twcm9iZXMuYwo+IEBAIC01OCwxMiArNTgsMTQgQEAgc3RhdGljIGJvb2wgX19r
cHJvYmVzIGFyY2hfY2hlY2tfa3Byb2JlKHN0cnVjdCBrcHJvYmUgKnApCj4gIHsKPiAgICAgICAg
IHVuc2lnbmVkIGxvbmcgdG1wICA9ICh1bnNpZ25lZCBsb25nKXAtPmFkZHIgLSBwLT5vZmZzZXQ7
Cj4gICAgICAgICB1bnNpZ25lZCBsb25nIGFkZHIgPSAodW5zaWduZWQgbG9uZylwLT5hZGRyOwo+
ICsgICAgICAga3Byb2JlX29wY29kZV90IG9wY29kZTsKPgo+ICAgICAgICAgd2hpbGUgKHRtcCA8
PSBhZGRyKSB7Cj4gICAgICAgICAgICAgICAgIGlmICh0bXAgPT0gYWRkcikKPiAgICAgICAgICAg
ICAgICAgICAgICAgICByZXR1cm4gdHJ1ZTsKPgo+IC0gICAgICAgICAgICAgICB0bXAgKz0gR0VU
X0lOU05fTEVOR1RIKCooa3Byb2JlX29wY29kZV90ICopdG1wKTsKPiArICAgICAgICAgICAgICAg
bWVtY3B5KCZvcGNvZGUsICh2b2lkICopdG1wLCBzaXplb2Yoa3Byb2JlX29wY29kZV90KSk7Cj4g
KyAgICAgICAgICAgICAgIHRtcCArPSBHRVRfSU5TTl9MRU5HVEgob3Bjb2RlKTsKCkknZCBwcmVm
ZXIgc2l6ZW9mKG9wY29kZSkuCgo+ICAgICAgICAgfQo+Cj4gICAgICAgICByZXR1cm4gZmFsc2U7
Cj4gQEAgLTgwLDcgKzgyLDcgQEAgaW50IF9fa3Byb2JlcyBhcmNoX3ByZXBhcmVfa3Byb2JlKHN0
cnVjdCBrcHJvYmUgKnApCj4gICAgICAgICAgICAgICAgIHJldHVybiAtRUlMU0VROwo+Cj4gICAg
ICAgICAvKiBjb3B5IGluc3RydWN0aW9uICovCj4gLSAgICAgICBwLT5vcGNvZGUgPSAqcC0+YWRk
cjsKPiArICAgICAgIG1lbWNweSgmcC0+b3Bjb2RlLCBwLT5hZGRyLCBzaXplb2Yoa3Byb2JlX29w
Y29kZV90KSk7CgpTYW1lIGNvbW1lbnQgYXMgYWJvdmUsIGFuZCB0aGlzIHdvdWxkIGlkZWFsbHkg
YmUgYSBzZXBhcmF0ZSBwYXRjaC4KCgpCasO2cm4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
