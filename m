Return-Path: <SRS0=2CuI=MH=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57FC7C43382
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 25 Sep 2018 21:08:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1176120842
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 25 Sep 2018 21:08:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G6rnuVnn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="YX4PN42D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1176120842
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=efm3/+ojXc0hsb1od8VSafVEtf/l1rNEEDsMFBxam7c=; b=G6rnuVnnIoRl1IORfKkeLmn60
	PZTdfX8CcF7XmAIDwN79wpkLLGaUhSYW0R7nBdMgqigTOG1XsVoxeK0RNgkkFstJ3/DH7aFJVzYeU
	5gCIbDJ1BXWIzZ10y5CKvZaRjRBfjOttQbyiroQVaT8rT3ITtCqAU4JmB6b59QLvEDpX3Bvs622Aq
	t7UifKlrRnnppfUORwc42vdl5psfEA4Xh21m87bw8Waq1YYO4LsL/lgkPV4C5fu59oHesvi90VrZ7
	f1Yl6Y10zsYuzHwe6P/uM8yRTGv08vkG6WCgK8CAWV3MlMsrzYNNHBozF+uHSI/oovPnxt2KvK2R/
	yDA+u5RGw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g4uYo-000140-A8; Tue, 25 Sep 2018 21:07:58 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g4uYR-00010Z-1V
 for linux-riscv@lists.infradead.org; Tue, 25 Sep 2018 21:07:36 +0000
Received: by mail-pf1-x442.google.com with SMTP id s5-v6so4285738pfj.7
 for <linux-riscv@lists.infradead.org>; Tue, 25 Sep 2018 14:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=0Ttj3APRRbULsLfxX23FJYeZvBzv0WdqStjkbhKWvMk=;
 b=YX4PN42DyV46njmcCZ+1HCZo+bJ8KX7nmRZN2XQ6+IJM+ffbnObYSAVqL4WeYmfCtX
 Ebtl+et9FI+g4mbzGEBldT6wg9SJLH2EFCn0ZzKER+a0ocKeEVAPMAM+TaSFTfAn3Uek
 ftDm+t8xNVw7+3fiCwUytH/oZhOxUpKpQRhOtD/dLgh3SKc5so4uL5bV6TGjNn5BRLHT
 8a0F3rhOlX8QbooGMkEjylrEmLAa2/PvN7QrVO4+7+xRqjUiaFq+uYSm1ssCIqCOb1Fj
 kICY/DtxJhfSAs6s4lkCBDxM204BrYXWT5W8axt26sHlRXmjMVGKKk5VGDfl1y48+AqQ
 63lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=0Ttj3APRRbULsLfxX23FJYeZvBzv0WdqStjkbhKWvMk=;
 b=S40lE46yFoMsh5aQYwNwiqBAqGGltRrUsLbi1t1aFeTRjjPvibjYgmm4LC+U41ZLlH
 nUNAjU2LDZPVbv848EoP3G3smP9VXL4k8w6YSHe28FTZqnRT8jPALYbplZG8laCBJwoA
 7/4YH/3If6+PaBZ+obgGY5MySnEttXxQOBE/EydRfZWYVutg24GESYlBXVi95haAs4su
 x3qFuIbp3upE+pMvpGkgHTpf0fkOourcRkiuLkQVTy3vcxbebxmEYBSzjbZniwkqN+AQ
 eMVxdU0P8S5r8R3uLYlbZZ6/riYiolK0BBHf06aKuH/y523F1zwkLwklx+YUhIo61skv
 4BBg==
X-Gm-Message-State: ABuFfojRHCptTCIQ01o2YWfNTlK+PfOsH2fi2Gf13n1E0uvTrTk1ceuA
 +k6wo4/RGhj/o1asIsnheOI3sqz1m2c=
X-Google-Smtp-Source: ACcGV61p/PuZzoVOnCy7b/cW0soXR8eIiEnY4aTzUkVPoKiNJNUNo7ShtXb2iI4IKLFK2IhMoxhtAQ==
X-Received: by 2002:a62:1895:: with SMTP id
 143-v6mr2832182pfy.227.1537909626267; 
 Tue, 25 Sep 2018 14:07:06 -0700 (PDT)
Received: from [10.17.0.50] ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id h124-v6sm5416172pfg.112.2018.09.25.14.07.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Sep 2018 14:07:05 -0700 (PDT)
Subject: Re: mmcqd/0 stuck at 100% CPU
To: Palmer Dabbelt <palmer@sifive.com>, marcus@lysator.liu.se,
 Atish Patra <Atish.Patra@wdc.com>
References: <mhng-9789543b-ece6-4f92-b4f6-ec6ebc258baf@palmer-si-x1c4>
From: Paul Walmsley <paul.walmsley@sifive.com>
Message-ID: <66b20b1c-3594-36f3-b93c-d8d1e8dbf816@sifive.com>
Date: Tue, 25 Sep 2018 14:07:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <mhng-9789543b-ece6-4f92-b4f6-ec6ebc258baf@palmer-si-x1c4>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20180925_140735_144870_FBA0B661 
X-CRM114-Status: GOOD (  16.24  )
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
Cc: linux-riscv@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20180925210704.qDvgcUblAA0BdO4VE4Z8_ju_OpmHf0fIsyUwKsXk24c@z>

Ck9uIDkvMjUvMTggODozNiBBTSwgUGFsbWVyIERhYmJlbHQgd3JvdGU6Cj4gT24gTW9uLCAyNCBT
ZXAgMjAxOCAyMzoxNTo1MyBQRFQgKC0wNzAwKSwgbWFyY3VzQGx5c2F0b3IubGl1LnNlIHdyb3Rl
Ogo+Pgo+PiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPiB3cml0ZXM6Cj4+Cj4+Pj4gSSdt
IHdyaXRpbmcgdGhpcyBtYWlsIHRvIGluZm9ybSBhYm91dCBhbiBpc3N1ZSB3aXRoIHRoZSBTRGNh
cmQgCj4+Pj4gZHJpdmVyIG9uCj4+Pj4gdGhlIEhpNVVubGVhc2hlZCBib2FyZCBydW5uaW5nIExp
bnV4IDQuMTUuMTggKHJpc2N2LWxpbnV4LTQuMTUgYnJhbmNoCj4+Pj4gZnJvbSBnaXQgKyBwYXRj
aC00LjE1LjE4Lnh6IGZyb20ga2VybmVsLm9yZykuCj4+Pgo+Pj4gQ2FuIHlvdSB0cnkgYSBuZXdl
ciBrZXJuZWwgdmVyc2lvbj8KPj4KPj4gT25seSB0aGUgNC4xNSBicmFuY2ggc3VwcG9ydHMgdGhl
IEg1VSwgYW5kIHRoZXJlIGFyZSBubyBmdXJ0aGVyIHBhdGNoZXMKPj4gdG8gdGhhdCBrZXJuZWwg
bGluZS7CoCBJIGNhbiB0cnkgdGhpcyB1bm9mZmljaWFsIG1peCBiZXR3ZWVuIDQuMTUgYW5kCj4+
IDQuMTktcmMyOgo+PiBodHRwczovL2dpdGh1Yi5jb20vYXRpc2hwMDQvcmlzY3YtbGludXgvdHJl
ZS80LjE5X2ZlZG9yYV9zdWNjZXNzX3NlcDExCj4+Cj4+PiBUaGlzIHBhcnQgb2YgdGhlIG1tYyBz
dGFjayB3YXMgY29tcGxldGVseSByZXdyaXR0ZW4gaW4gNC4xNgo+Pj4gKGFmdGVyIG1hbnkgeWVh
cnMgb2Ygbm90IGNoYW5naW5nIG11Y2gpLCBzbyB0aGUgcmVzdWx0cyB3aWxsCj4+PiBiZSB2ZXJ5
IGRpZmZlcmVudC4gSWYgdGhlcmUgaXMgYSBidWcgaW4gdGhlIGRyaXZlciwgaXQgbWF5IHNob3cK
Pj4+IGluIGEgZGlmZmVyZW50IHdheSB0aG91Z2guCj4+Cj4+IE9rLCB3b3J0aCBhIHRyeSB0aGVu
LsKgIFRoYW5rcy4KPgo+IEZXSVcsIEknbSBwcmV0dHkgc3VyZSB0aGF0IHdlIHNlZSB3b3JzZSBi
ZWhhdmlvciBpbiB0aGUgbmV3ZXIga2VybmVscyAKPiB0aGFuIHRoZSBvbGRlciBrZXJuZWxzLsKg
IFBhdWwgb3IgQXRpc2ggbWlnaHQga25vdyBiZXR0ZXIsIHRob3VnaCwgYXMgSSAKPiBoYXZlbid0
IHBva2VkIHRoaXMgaW4gYSBiaXQuIAoKCldlIGRpZCB0cnkgb24gYW4gZXhwZXJpbWVudGFsIHY0
LjE5LXJjNCBicmFuY2gsIGFuZCB3ZXJlIG5vdCBhYmxlIHRvIApyZXByb2R1Y2UgdGhlIGJ1Zy7C
oCBUaGVyZSB3ZXJlIG11bHRpcGxlIGNvbmZvdW5kcywgdGhvdWdoLCBpbmNsdWRpbmcgdGhlIAp1
c2Ugb2YgYSBtdWNoIGxvd2VyIFNQSSBjbG9jayByYXRlIHRvIHRoZSBTRCBjYXJkLCBzbyB3ZSB3
ZXJlbid0IGFibGUgdG8gCmRyYXcgYW55IGZpcm0gY29uY2x1c2lvbnMgdGhhdCB0aGF0IHRpbWUu
CgoKLSBQYXVsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
