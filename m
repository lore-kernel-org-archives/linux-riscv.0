Return-Path: <SRS0=sMkx=M3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8816C4338F
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Aug 2021 05:25:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77BF660F10
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Aug 2021 05:25:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 77BF660F10
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O9Z5oyZd9GCLrT8ljmLPYE2HaoRXtH/bqJW3SABKxac=; b=2Gbe6pSrH+z6fhiUp0wvYoBAhe
	MHBokONPHsdK3GD4vlEvLqYIfZu7wAu24TQdPPDni5303lQtKMWdOh5A752JLgwjdrhpIpvVPq+mk
	nGW/obnC4mayUQpi3n2DkNUIZldFEDSc+yaOF0QyF27zwSwA688j/T1/MBOqekGeg88/ZJ66/bD+W
	dvSo4yVmBaILqxHvEeo6Cze8GNDeBWup3TzOGyz4YxpW1Eg2erIcVJn9XM50djbJ2sJyJhqqNc+bf
	7oOv8tueUISSwKv2p3Ad+7pIW+LkZrWN9NPEwpeWLl4xxDvGY8AcoPkmmCs0Eg9Fw3wg8fGjOH6FK
	8wzBDr2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mB9PM-004tOQ-D2; Wed, 04 Aug 2021 05:25:36 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mB9PI-004tNP-Pv
 for linux-riscv@lists.infradead.org; Wed, 04 Aug 2021 05:25:34 +0000
Received: by mail-ot1-x32c.google.com with SMTP id
 v9-20020a9d60490000b02904f06fc590dbso669030otj.4
 for <linux-riscv@lists.infradead.org>; Tue, 03 Aug 2021 22:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vHNz6EgMpzpbs2ab4Zs6bAjD3BVkQJArI/buz9v+9rU=;
 b=GziRt2jznB/phirmy2W/L1RHlsdc8g5zjEAgQ3JQPb7Rwg8L1jL8xXWoYv790bmR7q
 wR8D/Js7C4D169J95zsmd2vuISX+G8TjLg6oYI0Npn/YX2F3cLN9hN/sJoo9ZQkIkNHr
 +lTWri5CerhC7CfcL8uG0Ox++EMpbBeAB2MSd+/p+SWLCu68WP+AKa9hXwRhCHpw8xYc
 2s/UWsPMIrFAVV77w5tHyOZXo1Zd/FX9/G4a+AcpnD+HI7/g+fXhRvFL4kjef0rwMtsC
 hxFB1JepEWT06cqoKQaGUX1J843Ea9BpebCatOp1xVko7yJbZ1/f0NPSzyyghIJlPs8A
 GH5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vHNz6EgMpzpbs2ab4Zs6bAjD3BVkQJArI/buz9v+9rU=;
 b=FoCeiNHWo6NkVeQGQ6MVdTD14jKecSm5E091oelrZtYO0+Tsdk5f1acL1PLqMj6QaI
 UlN8qcTMLPGeNntL+EqTDxKeI1BSqDSoYEgRGNbGk0pCR5+HKSJgOOkIUj0d4ZI8jBID
 Qcm5+TuXLmceq+LSI7vnTRY1jaCNq+THA3+IVcTbHgJ190mueh3teGDxr4qguykc5ay8
 8gIR/1XXduh4Uri8p43YgVxtQE5myScuu2CAoq+qnvTwohfkZrx+t2qAh1t/TqyTgZw3
 B/4DehWm17M811hJj/+qGf18dl9HoIRY1O1OMBhCG6kKzhV1dPzHffI7dxm9y2Dn/7yt
 gbUw==
X-Gm-Message-State: AOAM532UxtChEDn8DwmxAnRmAK+mCTuA1eZj2X+iJ4A+Vd4O4VHnBSCo
 jRLJpXLXPljob4uDFfbHH2jL3S27BCM=
X-Google-Smtp-Source: ABdhPJyP89BhSd6xNI4Q58MVHOs3sr1qYdFIjShPIo4MC8ZxMZ9uag3kHS1OoMAlaoAsDkJET7j/1Q==
X-Received: by 2002:a9d:62d4:: with SMTP id z20mr18088775otk.305.1628054731543; 
 Tue, 03 Aug 2021 22:25:31 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 b2sm247495otf.40.2021.08.03.22.25.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Aug 2021 22:25:30 -0700 (PDT)
Subject: Re: [PATCH] riscv: Disable STACKPROTECTOR_PER_TASK if
 GCC_PLUGIN_RANDSTRUCT is enabled
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 guoren@linux.alibaba.com
References: <mhng-5b3c9fa7-2e28-4788-9013-3a988ac5280d@palmerdabbelt-glaptop>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <9a2918b0-0c85-7e56-58e0-d2ea0ea10068@roeck-us.net>
Date: Tue, 3 Aug 2021 22:25:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <mhng-5b3c9fa7-2e28-4788-9013-3a988ac5280d@palmerdabbelt-glaptop>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_222532_897360_C6043137 
X-CRM114-Status: GOOD (  18.87  )
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

T24gOC8zLzIxIDEwOjE0IFBNLCBQYWxtZXIgRGFiYmVsdCB3cm90ZToKPiBPbiBGcmksIDIzIEp1
bCAyMDIxIDE3OjU4OjEzIFBEVCAoLTA3MDApLCBQYWxtZXIgRGFiYmVsdCB3cm90ZToKPj4gT24g
VHVlLCAwNiBKdWwgMjAyMSAwOToyNjoyMSBQRFQgKC0wNzAwKSwgbGludXhAcm9lY2stdXMubmV0
IHdyb3RlOgo+Pj4gcmlzY3YgdXNlcyB0aGUgdmFsdWUgb2YgVFNLX1NUQUNLX0NBTkFSWSB0byBz
ZXQKPj4+IHN0YWNrLXByb3RlY3Rvci1ndWFyZC1vZmZzZXQuIFdpdGggR0NDX1BMVUdJTl9SQU5E
U1RSVUNUIGVuYWJsZWQsIHRoYXQKPj4+IHZhbHVlIGlzIG5vbi1kZXRlcm1pbmlzdGljLCBhbmQg
d2l0aCByaXNjdjphbGxtb2Rjb25maWcgb2Z0ZW4gcmVzdWx0cwo+Pj4gaW4gYnVpbGQgZXJyb3Jz
IHN1Y2ggYXMKPj4+Cj4+PiBjYzE6IGVycm9yOiAnODEyMCcgaXMgbm90IGEgdmFsaWQgb2Zmc2V0
IGluICctbXN0YWNrLXByb3RlY3Rvci1ndWFyZC1vZmZzZXQ9Jwo+Pj4KPj4+IEVuYWJsZSBTVEFD
S1BST1RFQ1RPUl9QRVJfVEFTSyBvbmx5IGlmIEdDQ19QTFVHSU5fUkFORFNUUlVDVCBpcyBkaXNh
YmxlZAo+Pj4gdG8gZml4IHRoZSBwcm9ibGVtLgo+Pj4KPj4+IEZpeGVzOiBmZWEyZmVkMjAxZWU1
ICgicmlzY3Y6IEVuYWJsZSBwZXItdGFzayBzdGFjayBjYW5hcmllcyIpCj4+PiBDYzogR3VvIFJl
biA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+Pj4gU2lnbmVkLW9mZi1ieTogR3VlbnRlciBS
b2VjayA8bGludXhAcm9lY2stdXMubmV0Pgo+Pj4gLS0tCj4+PiDCoGFyY2gvcmlzY3YvS2NvbmZp
ZyB8IDEgKwo+Pj4gwqAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPj4+Cj4+PiBkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9LY29uZmlnIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4+PiBpbmRl
eCA0NjlhNzBiZDhkYTYuLjNhZmI4NGZhMjE5MCAxMDA2NDQKPj4+IC0tLSBhL2FyY2gvcmlzY3Yv
S2NvbmZpZwo+Pj4gKysrIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4+PiBAQCAtNDg2LDYgKzQ4Niw3
IEBAIGNvbmZpZyBDQ19IQVZFX1NUQUNLUFJPVEVDVE9SX1RMUwo+Pj4KPj4+IMKgY29uZmlnIFNU
QUNLUFJPVEVDVE9SX1BFUl9UQVNLCj4+PiDCoMKgwqDCoCBkZWZfYm9vbCB5Cj4+PiArwqDCoMKg
IGRlcGVuZHMgb24gIUdDQ19QTFVHSU5fUkFORFNUUlVDVAo+Pj4gwqDCoMKgwqAgZGVwZW5kcyBv
biBTVEFDS1BST1RFQ1RPUiAmJiBDQ19IQVZFX1NUQUNLUFJPVEVDVE9SX1RMUwo+Pj4KPj4+IMKg
Y29uZmlnIFBIWVNfUkFNX0JBU0VfRklYRUQKPj4KPj4gVGhhbmtzLCB0aGlzIGlzIG9uIGZpeGVz
LsKgIEkgZG8gYW4gYWxsbW9kY29uZmlnIGJ1aWxkIGFuZCBoYXZlbid0IHNlZW4KPj4gdGhlc2Ug
ZmFpbHVyZXMsIGlzIHRoZXJlIHNvbWV0aGluZyBzcGVjaWFsIEkgbmVlZCB0byBkbyB0byBnZXQg
dGhpcwo+PiB3b3JraW5nP8KgIEkga25vdyBub3RoaW5nIGFib3V0IEdDQyBwbHVnaW5zLi4uCj4g
Cj4gU29ycnksIGxvb2tzIGxpa2UgSSBzY3Jld2VkIHNvbWV0aGluZyB1cCBhbmQgSSBkaWRuJ3Qg
YWN0dWFsbHkgbWVyZ2UgdGhpcyBvbnRvIGZpeGVzLsKgIE5vdCBzdXJlIHdoYXQgaGFwcGVuZWQs
IGJ1dCB0aGlzIHRpbWUgaXQgc2hvdWxkIGFjdHVhbGx5IGJlIG9uIGZpeGVzLgoKQWgsIEkgdGhv
dWdodCB5b3UgZGVjaWRlZCBub3QgdG8gYXBwbHkgaXQgZm9yIHNvbWUgcmVhc29uLiBJIGNoYW5n
ZWQKbXkgdGVzdCBzY3JpcHRzIHRvIGFsd2F5cyBkaXNhYmxlIEdDQ19QTFVHSU5fUkFORFNUUlVD
VCBmb3IgcmlzY3YKYnVpbGQgdGVzdHMgYW5kIHN0b3BwZWQgcmVwb3J0aW5nIHRoZSBwcm9ibGVt
LiBJIG1lbnRpb25lZCB0aGlzCmEgY291cGxlIG9mIHdlZWtzIGFnbyBpbiBteSB0ZXN0IHJlcG9y
dHMuIEp1c3QgaW4gY2FzZSB5b3Ugd29uZGVyZWQuCgpHdWVudGVyCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
