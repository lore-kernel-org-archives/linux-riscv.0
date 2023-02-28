Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFBE4C64EC7
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Feb 2023 19:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lMrSUj7T5YBwYQD0TjyYDfmAL6Wl/Yg3QGIlEDwg29Q=; b=RXaruToOYXDKbo
	pq/FqmdQ+gNu2B58/ONfMhgqrv91pPbqBy0z9XdpLFrwRXpOF7GrJXBHliRYRdfD1edB8unSTDLYu
	UxI3itw/uKuQcg8cm+hJMb0HRrWb54VYGCVatkVI1UBA255l78mfQ8EwLrZABUHRrHS5ZvNCphFru
	vx5RkfR7zJHnTccYREYfA10k5XDqyXwMOxB/9t2jCGwVZ6wmpBobZhePO4/msFVj4fH9oy0eAXj1c
	JK5JrFFf2nSykzPXcxtKRXwGR9JoizCsoQZU1Azp0vXfAZVxUOlBieRBECl2OhfdaEBxue9zsmgQ/
	6QJB1oMOvEdhnOIzW17g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX5VN-00E4O2-GD; Tue, 28 Feb 2023 19:19:17 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX5VH-00E4M9-E2
	for linux-riscv@lists.infradead.org; Tue, 28 Feb 2023 19:19:12 +0000
Received: by mail-pl1-x62b.google.com with SMTP id a2so1128635plm.4
        for <linux-riscv@lists.infradead.org>; Tue, 28 Feb 2023 11:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677611948;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FpEVz7SmprPoPkB0vfE/PqJxuugSFBKj6AY2r5uLAhc=;
        b=oWlcXRzyqWqEIYwyzrAbhH5dfbtnZIzo1YdAD6EbxrkG1UYmywauWswlbWUb9RyzJT
         brrhvXg9BV/J80dlhPlO1Y21wLf6vRkFdXy7JICIvDrelyzHIZjZVwrR4yuaicL7f3Vk
         2p3merJr6M4IafXoXz51BvBxgjw+2vFOvA7iQCX7+ipsnTqqyjWJ3THXEnrQ8p4gJgDk
         xZ3DYrEnn6dh5SSFWIpnSPW533U6fF1NRXuZZhGMXkF858tTyzkALowN2hKgVfeUNsrR
         5wS/6VMndefgSb0UUhYGxgiYLa81lYWrHHI0iDazPBKk+F/PHzqrgvgcgWVcBnyOqxfC
         HgLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677611948;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FpEVz7SmprPoPkB0vfE/PqJxuugSFBKj6AY2r5uLAhc=;
        b=nAPCVaRn1LfLtNUwDJ6jaqP8SCG7Ko3fFTM8HOOzDbCwDvcNYJAqK/SdA0dKewWuFT
         fvWx1ClGsr2pltIfFq3P8UcUSTzKfod8saeughNukzaVejBbxeJZsQ5m21I+rj8ppGbK
         /hMMZLVD8OHdnWkTmuxPtQ9RzP0ksHrWvEQ/HouHr2SMoEVfPEqEpSgRsCrolBVA7k/g
         USfqH5ANQg7rJ3Uv0Ey1gx98jmpt4HwFCbybOgJQc0SVEaoeG6MHkPHxjull45+z7z9P
         Vym8rbeCr7XZT8OTcriIvtvywh/GKKH8QBZBFOU8UTuplZnGBzPBv5nP1SbrNbhrI/jO
         Xodw==
X-Gm-Message-State: AO0yUKUReitVhO21CtIS6bnOeKhxxLaytnyuTBOIWm5+n2CiEmc1JWtr
	eartRpNaWLCCkZcl4WDLxHM=
X-Google-Smtp-Source: AK7set9nvpB6Jm7bh8EL2CSZ/onqaLVDtbrhvaG0Y49z4Hn9XsjcfvrcAyDG9rY99D0UL9m1Qq4bXA==
X-Received: by 2002:a05:6a20:7f8e:b0:cb:6e9e:e6df with SMTP id d14-20020a056a207f8e00b000cb6e9ee6dfmr5180512pzj.14.1677611948146;
        Tue, 28 Feb 2023 11:19:08 -0800 (PST)
Received: from ?IPV6:2001:df0:0:200c:112f:75e9:7ff2:6774? ([2001:df0:0:200c:112f:75e9:7ff2:6774])
        by smtp.gmail.com with ESMTPSA id j8-20020a62b608000000b005ded4825201sm6382146pff.112.2023.02.28.11.19.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 11:19:07 -0800 (PST)
Message-ID: <f619e8ce-1fce-ace9-3685-e0b50646e8fb@gmail.com>
Date: Wed, 1 Mar 2023 08:18:59 +1300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 08/10] parisc: fix livelock in uaccess
Content-Language: en-US
To: Guenter Roeck <linux@roeck-us.net>, Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-arch@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, Michal Simek <monstr@monstr.eu>,
 Dinh Nguyen <dinguyen@kernel.org>, openrisc@lists.librecores.org,
 linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
 sparclinux@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>
References: <Y9lz6yk113LmC9SI@ZenIV> <Y9l0w4M91DwYLO3N@ZenIV>
 <20230228152236.GA4088022@roeck-us.net>
From: Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <20230228152236.GA4088022@roeck-us.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_111911_499581_525D8B7D 
X-CRM114-Status: GOOD (  17.75  )
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

R3VlbnRlciwKCk9uIDEvMDMvMjMgMDQ6MjIsIEd1ZW50ZXIgUm9lY2sgd3JvdGU6Cj4gT24gVHVl
LCBKYW4gMzEsIDIwMjMgYXQgMDg6MDY6MjdQTSArMDAwMCwgQWwgVmlybyB3cm90ZToKPj4gcGFy
aXNjIGVxdWl2YWxlbnQgb2YgMjYxNzhlYzExZWYzICJ4ODY6IG1tOiBjb25zb2xpZGF0ZSBWTV9G
QVVMVF9SRVRSWSBoYW5kbGluZyIKPj4gSWYgZS5nLiBnZXRfdXNlcigpIHRyaWdnZXJzIGEgcGFn
ZSBmYXVsdCBhbmQgYSBmYXRhbCBzaWduYWwgaXMgY2F1Z2h0LCB3ZSBtaWdodAo+PiBlbmQgdXAg
d2l0aCBoYW5kbGVfbW1fZmF1bHQoKSByZXR1cm5pbmcgVk1fRkFVTFRfUkVUUlkgYW5kIG5vdCBk
b2luZyBhbnl0aGluZwo+PiB0byBwYWdlIHRhYmxlcy4gIEluIHN1Y2ggY2FzZSB3ZSBtdXN0ICpu
b3QqIHJldHVybiB0byB0aGUgZmF1bHRpbmcgaW5zbiAtCj4+IHRoYXQgd291bGQgcmVwZWF0IHRo
ZSBlbnRpcmUgdGhpbmcgd2l0aG91dCBtYWtpbmcgYW55IHByb2dyZXNzOyB3aGF0IHdlIG5lZWQK
Pj4gaW5zdGVhZCBpcyB0byB0cmVhdCB0aGF0IGFzIGZhaWxlZCAodXNlcikgbWVtb3J5IGFjY2Vz
cy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQWwgVmlybyA8dmlyb0B6ZW5pdi5saW51eC5vcmcudWs+
Cj4+IC0tLQo+PiAgIGFyY2gvcGFyaXNjL21tL2ZhdWx0LmMgfCA1ICsrKystCj4+ICAgMSBmaWxl
IGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0
IGEvYXJjaC9wYXJpc2MvbW0vZmF1bHQuYyBiL2FyY2gvcGFyaXNjL21tL2ZhdWx0LmMKPj4gaW5k
ZXggODY5MjA0ZTk3ZWM5Li5iYjMwZmY2YTNlMTkgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcGFyaXNj
L21tL2ZhdWx0LmMKPj4gKysrIGIvYXJjaC9wYXJpc2MvbW0vZmF1bHQuYwo+PiBAQCAtMzA4LDgg
KzMwOCwxMSBAQCB2b2lkIGRvX3BhZ2VfZmF1bHQoc3RydWN0IHB0X3JlZ3MgKnJlZ3MsIHVuc2ln
bmVkIGxvbmcgY29kZSwKPj4gICAKPj4gICAJZmF1bHQgPSBoYW5kbGVfbW1fZmF1bHQodm1hLCBh
ZGRyZXNzLCBmbGFncywgcmVncyk7Cj4+ICAgCj4+IC0JaWYgKGZhdWx0X3NpZ25hbF9wZW5kaW5n
KGZhdWx0LCByZWdzKSkKPj4gKwlpZiAoZmF1bHRfc2lnbmFsX3BlbmRpbmcoZmF1bHQsIHJlZ3Mp
KSB7Cj4+ICsJCWlmICghdXNlcl9tb2RlKHJlZ3MpKQo+PiArCQkJZ290byBub19jb250ZXh0Owo+
IDAtZGF5IHJpZ2h0ZnVsbHkgY29tcGxhaW5zIHRoYXQgdGhpcyBsZWF2ZXMgJ21zZycgdW5pbml0
aWFsaXplZC4KPgo+IGFyY2gvcGFyaXNjL21tL2ZhdWx0LmM6NDI3IGRvX3BhZ2VfZmF1bHQoKSBl
cnJvcjogdW5pbml0aWFsaXplZCBzeW1ib2wgJ21zZycKPgo+IEd1ZW50ZXIKCldoYXQgaGFwcGVu
cyBpZiB5b3UgaW5pdGlhbGl6ZSBtc2cgdG8gIlBhZ2UgZmF1bHQ6IG5vIGNvbnRleHQiIHJpZ2h0
IGF0IAp0aGUgc3RhcnQgb2YgZG9fcGFnZV9mYXVsdCAoYW5kIGRyb3AgdGhlIGFzc2lnbm1lbnQg
YSBmZXcgbGluZXMgZG93biBhcyAKdGhhdCdzIG5vdyByZWR1bmRhbnQpPwoKKFdvbmRlcmluZyBp
ZiB0aGUgemVybyBwYWdlIGFjY2VzcyBvbiBwYXJpc2MgY291bGQgY2F1c2UgYSB0cmlwIHJpZ2h0
IApiYWNrIGludG8gZG9fcGFnZV9mYXVsdCwgYWQgaW5maW5pdHVtLi4uKQoKQ2hlZXJzLAoKIMKg
wqDCoCBNaWNoYWVsCgoKPj4gICAJCXJldHVybjsKPj4gKwl9Cj4+ICAgCj4+ICAgCS8qIFRoZSBm
YXVsdCBpcyBmdWxseSBjb21wbGV0ZWQgKGluY2x1ZGluZyByZWxlYXNpbmcgbW1hcCBsb2NrKSAq
Lwo+PiAgIAlpZiAoZmF1bHQgJiBWTV9GQVVMVF9DT01QTEVURUQpCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
