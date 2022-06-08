Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E40DC433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jun 2022 10:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LMhRAUBkq4wZLKtJATqYb5wvtVaT5NaNZqf5Xr8iEb0=; b=Sil5JhWEFftgjD
	+9uCcbz7bUBBA3YgpKtkQxIldMGOHVVgsq2EcUiLAODGaobExwf6FSlxewsUhN9cKFxYYL7s3QBut
	W8jJVV61fZIYGr491enYZUX55NlKws9TO1sq5ya7FLMd7syNNEerhVSZTJTC3yCfUOqzZ8UYFQLeT
	mS16NsHzFnfQ5tGVWiyPVmpUnOpQRkgCRhfzUP0JCQ+DxtjdF0/SUhGum9po2jwHCXyVhfOy1Eosn
	QYxniub5ioCS/1QcUpC2nqER0OrUDUqGhWvZeROPRceqYOaqqga4LgcYw7dBONnKVdumUqg2595Bq
	oy02gsV+eS6n3qwhF//g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyseN-00CdI5-Iz; Wed, 08 Jun 2022 10:10:55 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nysc2-00Cc8D-Ks
	for linux-riscv@lists.infradead.org; Wed, 08 Jun 2022 10:08:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654682909;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sEHEjRGmX36MVX7I3CW3Ag7ueRgzzBbF2Okws9bZlv4=;
	b=ethE80FzfRXN3BKY6qYVaXw3T6ILNMZjLNoP3NsshCrzw0KlEhiOetoeDp0s3EWC1SXXls
	GdyZn9v/Lkc1xUKWLp+M4prxPz201updcnAUGBPhkYBPikPcaAPpPKlEExsW+YrjDTpt0E
	wNoFnYnw8o5FHvBEe+0XR4f89q2wuZY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-519-N_kf45J7OseGTzwjQOWOiw-1; Wed, 08 Jun 2022 06:08:26 -0400
X-MC-Unique: N_kf45J7OseGTzwjQOWOiw-1
Received: by mail-wr1-f69.google.com with SMTP id h2-20020adfe982000000b002102da95c71so4630108wrm.23
        for <linux-riscv@lists.infradead.org>; Wed, 08 Jun 2022 03:08:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=sEHEjRGmX36MVX7I3CW3Ag7ueRgzzBbF2Okws9bZlv4=;
        b=KSrXqrInRU0db48kZsimQZLJ35uzaAXj0dl8QMhrmpCPzsF1Up/mraoQKfuAvVf6RY
         H5HTyge7Sxnf4dcaTlS8WFoBUfyE/iZ0QHuDq7k5pk0dvHMgcuM+38gtP2V7muXxbd/V
         6XgD96zBa0Ds8JLsHJJtY79JlURtFhUqWfmCHAg0LmFGIRX5XNcVKp3Yzjm+oPbEUrfK
         XxKebYWdHNF2xTV7xf0xJrPTsXYRpHNMybi+y+oOON6VBWUw/5QsOn4gKdwv9gYJvYoj
         ni3FHi4b2MTgpfXx6Pvn7G+AGqXtrVtH1CS2VcVtZkSwfGd1yz2+AMJt/L7eio1y/Yez
         d1pg==
X-Gm-Message-State: AOAM532Tog1Zf9V1Ip3GRGaHJ5uBlQM5unDW2qTRwR2reR2QcJVasevm
	4de3Q9jorjvu1xuRZXUxyzeg7d2drbMdOwFAkyYXTZjNjfrRHWVB1h9QdIHY/LwydsPVFOMvLqx
	z22tYpd4rGfUNlA0eqvYNmaCGGigy
X-Received: by 2002:a05:6000:170a:b0:215:6799:782c with SMTP id n10-20020a056000170a00b002156799782cmr25736324wrc.38.1654682905241;
        Wed, 08 Jun 2022 03:08:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxxxVImU4Va1WqxQD1UaKL+Dc2uPBVbwnA9UZNtwOl0kUiXQIUGj0uM330odftyyo1WuGntSg==
X-Received: by 2002:a05:6000:170a:b0:215:6799:782c with SMTP id n10-20020a056000170a00b002156799782cmr25736249wrc.38.1654682904562;
        Wed, 08 Jun 2022 03:08:24 -0700 (PDT)
Received: from ?IPV6:2003:cb:c705:ad00:db2:4c6:8f3a:2ec4? (p200300cbc705ad000db204c68f3a2ec4.dip0.t-ipconnect.de. [2003:cb:c705:ad00:db2:4c6:8f3a:2ec4])
        by smtp.gmail.com with ESMTPSA id x4-20020adfffc4000000b0021018642ff8sm20678946wrs.76.2022.06.08.03.08.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jun 2022 03:08:23 -0700 (PDT)
Message-ID: <cd0e727d-8ad6-2d74-55f5-498394aae297@redhat.com>
Date: Wed, 8 Jun 2022 12:08:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 5/6] mm: Add mirror flag back on initrd memory
To: Mike Rapoport <rppt@kernel.org>, mawupeng <mawupeng1@huawei.com>
Cc: ardb@kernel.org, corbet@lwn.net, will@kernel.org,
 catalin.marinas@arm.com, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 dvhart@infradead.org, andy@infradead.org, akpm@linux-foundation.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 paulmck@kernel.org, keescook@chromium.org, songmuchun@bytedance.com,
 rdunlap@infradead.org, damien.lemoal@opensource.wdc.com,
 swboyd@chromium.org, wei.liu@kernel.org, robin.murphy@arm.com,
 anshuman.khandual@arm.com, thunder.leizhen@huawei.com,
 wangkefeng.wang@huawei.com, gpiccoli@igalia.com, chenhuacai@kernel.org,
 geert@linux-m68k.org, chenzhou10@huawei.com, vijayb@linux.microsoft.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org
References: <20220607093805.1354256-1-mawupeng1@huawei.com>
 <20220607093805.1354256-6-mawupeng1@huawei.com>
 <99900b31-2605-2c85-a1b7-9ef2666b58da@redhat.com>
 <CAMj1kXGkzjq3koW_sgO4uzrdtwqSqzsJfT5ABYyvodf+ggXT2w@mail.gmail.com>
 <29900b05-ec44-76a2-645a-22a13399d7fd@huawei.com>
 <YqBzwgTgWEAx8J/C@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <YqBzwgTgWEAx8J/C@kernel.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_030830_824913_64B35EF7 
X-CRM114-Status: GOOD (  28.99  )
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

T24gMDguMDYuMjIgMTI6MDIsIE1pa2UgUmFwb3BvcnQgd3JvdGU6Cj4gT24gV2VkLCBKdW4gMDgs
IDIwMjIgYXQgMDM6Mjc6MDlQTSArMDgwMCwgbWF3dXBlbmcgd3JvdGU6Cj4+Cj4+IOWcqCAyMDIy
LzYvNyAyMjo0OSwgQXJkIEJpZXNoZXV2ZWwg5YaZ6YGTOgo+Pj4gT24gVHVlLCA3IEp1biAyMDIy
IGF0IDE0OjIyLCBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4gd3JvdGU6Cj4+
Pj4KPj4+PiBPbiAwNy4wNi4yMiAxMTozOCwgV3VwZW5nIE1hIHdyb3RlOgo+Pj4+PiBGcm9tOiBN
YSBXdXBlbmcgPG1hd3VwZW5nMUBodWF3ZWkuY29tPgo+Pj4+Pgo+Pj4+PiBJbml0cmQgbWVtb3J5
IHdpbGwgYmUgcmVtb3ZlZCBhbmQgdGhlbiBhZGRlZCBpbiBhcm02NF9tZW1ibG9ja19pbml0KCkg
YW5kIHRoaXMKPj4+Pj4gd2lsbCBjYXVzZSBpdCB0byBsb3NlIGFsbCBvZiBpdHMgbWVtYmxvY2sg
ZmxhZ3MuIFRoZSBsb3N0IG9mIE1FTUJMT0NLX01JUlJPUgo+Pj4+PiBmbGFnIHdpbGwgbGVhZCB0
byBlcnJvciBsb2cgcHJpbnRlZCBieSBmaW5kX3pvbmVfbW92YWJsZV9wZm5zX2Zvcl9ub2RlcyBp
Zgo+Pj4+PiB0aGUgbG93ZXIgNEcgcmFuZ2UgaGFzIHNvbWUgbm9uLW1pcnJvcmVkIG1lbW9yeS4K
Pj4+Pj4KPj4+Pj4gSW4gb3JkZXIgdG8gc29sdmUgdGhpcyBwcm9ibGVtLCB0aGUgbG9zdCBNRU1C
TE9DS19NSVJST1IgZmxhZyB3aWxsIGJlCj4+Pj4+IHJlaW5zdGFsbGVkIGlmIHRoZSBvcmlnaW4g
bWVtYmxvY2sgaGFzIHRoaXMgZmxhZy4KPj4+Pj4KPj4+Pj4gU2lnbmVkLW9mZi1ieTogTWEgV3Vw
ZW5nIDxtYXd1cGVuZzFAaHVhd2VpLmNvbT4KPj4+Pj4gLS0tCj4+Pj4+ICAgYXJjaC9hcm02NC9t
bS9pbml0LmMgICAgIHwgIDkgKysrKysrKysrCj4+Pj4+ICAgaW5jbHVkZS9saW51eC9tZW1ibG9j
ay5oIHwgIDEgKwo+Pj4+PiAgIG1tL21lbWJsb2NrLmMgICAgICAgICAgICB8IDIwICsrKysrKysr
KysrKysrKysrKysrCj4+Pj4+ICAgMyBmaWxlcyBjaGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspCj4+
Pj4+Cj4+Pj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L21tL2luaXQuYyBiL2FyY2gvYXJtNjQv
bW0vaW5pdC5jCj4+Pj4+IGluZGV4IDMzOWVlODRlNWE2MS4uMTE2NDFmOTI0ZDA4IDEwMDY0NAo+
Pj4+PiAtLS0gYS9hcmNoL2FybTY0L21tL2luaXQuYwo+Pj4+PiArKysgYi9hcmNoL2FybTY0L21t
L2luaXQuYwo+Pj4+PiBAQCAtMzUwLDkgKzM1MCwxOCBAQCB2b2lkIF9faW5pdCBhcm02NF9tZW1i
bG9ja19pbml0KHZvaWQpCj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgImluaXRyZCBub3Qg
ZnVsbHkgYWNjZXNzaWJsZSB2aWEgdGhlIGxpbmVhciBtYXBwaW5nIC0tIHBsZWFzZSBjaGVjayB5
b3VyIGJvb3Rsb2FkZXIgLi4uXG4iKSkgewo+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgIHBo
eXNfaW5pdHJkX3NpemUgPSAwOwo+Pj4+PiAgICAgICAgICAgICAgICB9IGVsc2Ugewo+Pj4+PiAr
ICAgICAgICAgICAgICAgICAgICAgaW50IGZsYWdzLCByZXQ7Cj4+Pj4+ICsKPj4+Pj4gKyAgICAg
ICAgICAgICAgICAgICAgIHJldCA9IG1lbWJsb2NrX2dldF9mbGFncyhiYXNlLCAmZmxhZ3MpOwo+
Pj4+PiArICAgICAgICAgICAgICAgICAgICAgaWYgKHJldCkKPj4+Pj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgZmxhZ3MgPSAwOwo+Pj4+PiArCj4+Pj4+ICAgICAgICAgICAgICAgICAg
ICAgICAgbWVtYmxvY2tfcmVtb3ZlKGJhc2UsIHNpemUpOyAvKiBjbGVhciBNRU1CTE9DS18gZmxh
Z3MgKi8KPj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICBtZW1ibG9ja19hZGQoYmFzZSwgc2l6
ZSk7Cj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgbWVtYmxvY2tfcmVzZXJ2ZShiYXNlLCBz
aXplKTsKPj4+Pgo+Pj4+IENhbiB5b3UgZXhwbGFpbiB3aHkgd2UncmUgcmVtb3ZpbmcrcmUtYWRk
aW5nIGhlcmUgZXhhY3RseT8gSXMgaXQganVzdCB0bwo+Pj4+IGNsZWFyIGZsYWdzIGFzIHRoZSBj
b21tZW50IGluZGljYXRlcz8KPj4+Pgo+Pj4KPj4+IFRoaXMgc2hvdWxkIG9ubHkgaGFwcGVuIGlm
IHRoZSBwbGFjZW1lbnQgb2YgdGhlIGluaXRyZCBjb25mbGljdHMgd2l0aAo+Pj4gYSBtZW09IGNv
bW1hbmQgbGluZSBwYXJhbWV0ZXIgb3IgaXQgaXMgbm90IGNvdmVyZWQgYnkgbWVtYmxvY2sgZm9y
Cj4+PiBzb21lIG90aGVyIHJlYXNvbi4KPj4+Cj4+PiBJT1csIHRoaXMgc2hvdWxkIG5ldmVyIGhh
cHBlbiwgYW5kIGlmIHJlLW1lbWJsb2NrX2FkZCdpbmcgdGhpcyBtZW1vcnkKPj4+IHVuY29uZGl0
aW9uYWxseSBpcyBjYXVzaW5nIHByb2JsZW1zLCB3ZSBzaG91bGQgZml4IHRoYXQgaW5zdGVhZCBv
Zgo+Pj4gd29ya2luZyBhcm91bmQgaXQuCj4+Cj4+IFRoaXMgd2lsbCBoYXBwZW4gaWYgd2UgdXNl
IGluaXRyZG1lbT0zRywxMDBNIHRvIHJlc2VydmUgaW5pdHJkIG1lbW9yeSBiZWxvdwo+PiB0aGUg
NEcgbGltaXQgdG8gdGVzdCB0aGlzIHNjZW5hcmlvKGp1c3QgZm9yIHRlc3RpbmcsIEkgaGF2ZSB0
cm91YmxlIHRvIGJvb3QKPj4gcWVtdSB3aXRoIGluaXRyZCBlbmFibGVkIGFuZCBtZW1vcnkgYmVs
b3cgNEcgYXJlIGFsbCBtaXJyb3IgbWVtb3J5KS4KPj4KPj4gUmUtbWVtYmxvY2tfYWRkJ2luZyB0
aGlzIG1lbW9yeSB1bmNvbmRpdGlvbmFsbHkgc2VlbXMgZmluZSBidXQgY2xlYXIgYWxsCj4+IGZs
YWdzKGVzcGVjaWFsbHkgTUVNQkxPQ0tfTUlSUk9SKSBtYXkgbGVhZCB0byBzb21lIGVycm9yIGxv
Zy4KPj4KPj4+Cj4+Pj4gSWYgaXQncyByZWFsbHkganVzdCBhYm91dCBjbGVhcmluZyBmbGFncywg
SSB3b25kZXIgaWYgd2UgcmF0aGVyIHdhbnQgdG8KPj4+PiBoYXZlIGFuIGludGVyZmFjZSB0aGF0
IGRvZXMgZXhhY3RseSB0aGF0LCBhbmQgaGlkZXMgdGhlIHdheSB0aGlzIGlzCj4+Pj4gYWN0dWFs
bHkgaW1wbGVtZW50ZWQgKG9idGFpbiBmbGFncywgcmVtb3ZlLCByZS1hZGQgLi4uKSwgaW50ZXJu
YWxseS4KPj4+Pgo+Pj4+IEJ1dCBtb3N0IHByb2JhYmx5IHRoZXJlIGlzIG1vcmUgbWFnaWMgaW4g
dGhlIGNvZGUgYW5kIGNsZWFyaW5nIGZsYWdzCj4+Pj4gaXNuJ3QgYWxsIGl0IGVuZHMgdXAgZG9p
bmcuCj4+Pj4KPj4+Cj4+PiBJIGRvbid0IHJlbWVtYmVyIGV4YWN0bHkgd2h5IHdlIG5lZWRlZCB0
byBjbGVhciB0aGUgZmxhZ3MsIGJ1dCBJIHRoaW5rCj4+PiBpdCBoYWQgdG8gZG8gd2l0aCBzb21l
IGNvcm5lciBjYXNlIHdlIGhpdCB3aGVuIHRoZSBpbml0cmQgd2FzCj4+PiBwYXJ0aWFsbHkgY292
ZXJlZC4KPj4gSWYgIm1lbT0iIGlzIHNldCBpbiBjb21tYW5kIGxpbmUsIG1lbWJsb2NrX21lbV9s
aW1pdF9yZW1vdmVfbWFwKCkgd2lsbAo+PiByZW1vdmUgYWxsIG1lbW9yeSBibG9jayB3aXRob3V0
IE1FTUJMT0NLX05PTUFQLiBNYXliZSB0aGlzIHdpbGwgYnJpbmcgdGhlCj4+IG1lbW9yeSBiYWNr
IGlmIHRoaXMgaW5pdHJkIG1lbSBoYXMgdGhlIE1FTUJMT0NLX05PTUFQIGZsYWc/Cj4+Cj4+IFRo
ZSByZmMgdmVyc2lvbiBbMV0gaW50cm9kdWNlIGFuZCB1c2UgbWVtYmxvY2tfY2xlYXJfbm9tYXAo
KSB0byBjbGVhciB0aGUKPj4gTUVNQkxPQ0tfTk9NQVAgb2YgdGhpcyBpbml0cmQgbWVtYmxvY2su
Cj4+IFNvIG1heWJlIHRoZSB1c2FnZSBvZiBtZW1ibG9ja19yZW1vdmUoKSBpcyBqdXN0IHRvIGF2
b2lkIGludHJvZHVjaW5nIG5ldwo+PiBmdW5jdGlvbihtZW1ibG9ja19jbGVhcl9ub21hcCk/Cj4+
Cj4+IFNpbmNlIGNvbW1pdCA0YzU0NmI4YTM0NjkgKCJtZW1ibG9jazogYWRkIG1lbWJsb2NrX2Ns
ZWFyX25vbWFwKCkiKSBhbHJlYWR5Cj4+IGludHJvZHVjZWQgbWVtYmxvY2tfY2xlYXJfbm9tYXAo
KS4gQ2FuIHdlIHVzZSB0aGlzIHRvIHJlbW92ZSBmbGFnIE1FTUJMT0NLX05PTUFQCj4+IHRvIHNv
bHZlIHRoaXMgcHJvYmxlbSByYXRoZXIgdGhhbiBicmluZyBmbGFnIE1FTUJMT0NLX01JUlJPUiBi
YWNrPwo+IAo+IEFGQUlDVCwgdGhlcmUgYXJlIHR3byBjb3JuZXIgY2FzZXMgdGhhdCByZS1hZGRp
bmcgaW5pdHJkIG1lbW9yeSBjb3ZlcnM6Cj4gKiBpbml0cmQgbWVtb3J5IGlzIG5vdCBhIHBhcnQg
b2YgdGhlIG1lbW9yeSByZXBvcnRlZCB0byBtZW1ibG9jaywgZWl0aGVyCj4gYmVjYXVzZSBvZiBm
aXJtd2FyZSB3ZWlyZG5lc3Mgb3IgYmVjYXVzZSBpdCB3YXMgY3V0IG91dCB3aXRoIG1lbT0KPiAq
IGluaXRyZCBtZW1vcnkgb3ZlcmxhcHMgYSBOT01BUCByZWdpb24KPiAKPiBTbyB0byBtYWtlIHN1
cmUgaW5pdHJkIG1lbW9yeSBpcyBtYXBwZWQgcHJvcGVybHkgYW5kIHJldGFpbnMKPiBNRU1CTE9D
S19NSVJST1IgSSB0aGluayB0aGUgYmVzdCB3ZSBjYW4gZG8gaXMKPiAKPiAJbWVtYmxvY2tfYWRk
KCk7Cj4gCW1lbWJsb2NrX2NsZWFyX25vbWFwKCk7Cj4gCW1lbWJsb2NrX3Jlc2VydmUoKTsKCldv
dWxkIHNpbXBseSBkZXRlY3QrcmVqZWN0aW5nIHRvIGJvb3Qgb24gc3VjaCBzZXR1cHMgYmUgYW4g
b3B0aW9uPyBUaGUKcmVwbGllcyBzbyBmYXIgaW5kaWNhdGUgdG8gbWUgdGhhdCB0aGlzIGlzIHJh
dGhlciBhIGNvcm5lciBjYXNlIHRoYW4gYQpyZWFzb25hYmxlIHVzZSBjYXNlLgoKLS0gClRoYW5r
cywKCkRhdmlkIC8gZGhpbGRlbmIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
