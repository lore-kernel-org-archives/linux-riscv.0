Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AAC5C3DA6E
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 03:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KYR5vxEpu9o41bqYPz6KJRl2k/YDC1ITfRMwIs8l+js=; b=yreEmC9e7w4KXE
	kEuMM3vniDKefPlx+hFC5BfaWB8ob5ffVVS62KbMFCbGumUbh6EUZ8a3aflB/sletPdvF6b+a8vHN
	LfF3LAcSJzyKB8rpg71qGJoQMn4rF/l/hvu+9E/8R2sUw04gSsDO9wqhG2UvvAkB8f+Z8Dl7BDIBv
	xxEPi7zWOFZ7NDVUNMiy6aZPicxBABaety9GpJaNRBmedpzvM7vaLjV1JT8Klsx/UUlGuEBorGnVC
	22qewyHAQesKKE4CksSKsfrGMSTeS3PGil3k1ELEUUUIQmmSqigms5pPTlRU+ZKmTHB1e2IOJ9QsY
	Ods0ADfKMr/ajTaQ2PWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLb8I-00Fs6T-2z;
	Fri, 05 Jan 2024 03:44:30 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLb8F-00Fs5Y-2V
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jan 2024 03:44:29 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-680cb09a819so5884716d6.2
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jan 2024 19:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20230601.gappssmtp.com; s=20230601; t=1704426265; x=1705031065; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h9Mf84xFuyY+KXEL0NxI6rgus6ihvZvZ8KwrTqLyjZE=;
        b=iUnGahBAumevs3j4qGWYR994U2bUulcwEXLWJ7jmncseGZjrjJS15vVS7fSRWyAliM
         CKr70t74qrb30MdB9i6x7QPlQlVoxz9I5V2vXx4spG4IZpyZWM7cu3zGDlH9M7U5sIvn
         CgSh5knUzbZpYZsbsYJstXOEZDYy156Wab9ZdyuSvTatgeKee1XTGaKA1aou/qzX3xgf
         ebvv1ApJTTpvgKaT5GiyRFibboj6Ek5eFo4yxJl/p276KQNDmq1GYmnThWmst23eh430
         aEnY2qeEBiciFpbMIJ3w2v0il8UwvfpQfeKKxRTDyaUTxqhhI+BhTfhFPNIASk3ZY0bg
         GHAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704426265; x=1705031065;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h9Mf84xFuyY+KXEL0NxI6rgus6ihvZvZ8KwrTqLyjZE=;
        b=GbENm7iu/NGrVhJhgFPCQgqLmcV5p0hdy/hUowuiiPrpWs//x7bOnj86oPO036f5LO
         q3OcfqFAVYhfQ7ivRVqQDOBv3igzIaKXBKU83I8zawBaLeuDL97/UpfNXUfcbbBguI6F
         gNd8CH5FExYYahZkPgI6ZtCjM48XEj51d6MidQRZnyvkX1Inls5lCZZVk6iE5xgwLkxt
         THF0fRAAE7+yM0fjr70ZTOJ6dAX/Pe/sPm7JEXysYICMN9sS5PzvvGp915D0TbUORLSH
         aaggPVOhU6yuLzv4lGNWlU6NBVs/rkJ+qQtmh0FvAwkKAQhTVAI4XCVGyPm8IsbJ6CN3
         WwkA==
X-Gm-Message-State: AOJu0YzLzQroCkH2ara6TRxF9RRdXJkd4HTBHJSFW6kji8VQNLhhZv63
	3/rK2XvL09OQeKSFmOHFVCQmfxMIU0vKRQ==
X-Google-Smtp-Source: AGHT+IE5c+alCyX1IwIj3VnIvG0UA9lij+ign+WLiqw65B1fGZND/Aeym1T7qiFm3gDYxSCgN4CMSg==
X-Received: by 2002:a05:6214:2602:b0:67f:5660:3e4 with SMTP id gu2-20020a056214260200b0067f566003e4mr1707272qvb.67.1704426264997;
        Thu, 04 Jan 2024 19:44:24 -0800 (PST)
Received: from [172.16.32.83] ([198.232.126.202])
        by smtp.gmail.com with ESMTPSA id eh17-20020a056214187100b0067f70cc986asm297636qvb.92.2024.01.04.19.44.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jan 2024 19:44:24 -0800 (PST)
Message-ID: <8131b56d-937d-d7a9-0bab-99599617ad74@landley.net>
Date: Thu, 4 Jan 2024 21:50:51 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 00/36] Remove UCLINUX from LTP
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>, Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it, Cyril Hrubis <chrubis@suse.cz>,
 Li Wang <liwang@redhat.com>, Andrea Cervesato <andrea.cervesato@suse.com>,
 Greg Ungerer <gerg@linux-m68k.org>, Jonathan Corbet <corbet@lwn.net>,
 Randy Dunlap <rdunlap@infradead.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Christophe Lyon <christophe.lyon@linaro.org>,
 linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux-sh list <linux-sh@vger.kernel.org>
References: <20240103015240.1065284-1-pvorel@suse.cz>
 <CAMuHMdXGwyS-CL0vLdUP4Z4YEYhmcmDyC3YdGCnS=jFkqASqvw@mail.gmail.com>
From: Rob Landley <rob@landley.net>
In-Reply-To: <CAMuHMdXGwyS-CL0vLdUP4Z4YEYhmcmDyC3YdGCnS=jFkqASqvw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_194428_006295_5A37A91B 
X-CRM114-Status: GOOD (  15.70  )
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

CgpPbiAxLzMvMjQgMDM6NDYsIEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90ZToKPiBIaSBQZXRyLAo+
IAo+IENDIG90aGVyIHVDbGludXggYXJjaCBsaXN0cwo+IAo+IE9uIFdlZCwgSmFuIDMsIDIwMjQg
YXQgMjo1MuKAr0FNIFBldHIgVm9yZWwgPHB2b3JlbEBzdXNlLmN6PiB3cm90ZToKPj4gVUNMSU5V
WCBpcyBicm9rZW4gaW4gTFRQIGFuZCBub2JvZHkgcmVhbGx5IGNhcmVzLiBBY3R1YWxseSBJIGRh
cmUgdG8KPj4gc2F5IFVDTElOVVggaXMgZGVhZC4gVGhlcmVmb3JlIEkgcHJlcGFyZWQgcGF0Y2hz
ZXQgdG8gcmVtb3ZlIFVDTElOVVgKPj4gZnJvbSBMVFAuIFdlIGhhdmUgYmVlbiBhY3RpdmVseSBy
ZW1vdmluZyBVQ0xJTlVYIGZyb20gTFRQIGR1cmluZyByZXdyaXRlCj4+IHRlc3RzIHRvIG5ldyBM
VFAgQVBJLiBUaGlzIHJlbW92ZXMgdGhlIHJlc3QgZnJvbSB0aGUgb2xkIHRlc3RzICh3aGljaAo+
PiB3aWxsIGJlIHNvb25lciBvciBsYXRlciByZXdyaXR0ZW4gdG8gbmV3IEFQSSkuCj4+Cj4+IEJl
Y2F1c2UgdGhlIHBhdGNoc2V0IGlzIHF1aXRlIGJpZywgSSBkaWQgbm90IHdhbnQgdG8gc2VuZCBp
dCB0byBtYWlsaW5nCj4+IGxpc3RzIChidXQgSSBjYW4gZG8gaXQgaWYgeW91IHdhbnQpLgo+Pgo+
PiBDYW4geW91IHBsZWFzZSBoYXZlIGxvb2sgYXQgbXkgZm9yayBvbiBnaXRsYWIsIGJyYW5jaDog
cmVtb3ZlLVVDTElOVVgKPj4gaHR0cHM6Ly9naXRsYWIuY29tL3BldmlrL2x0cC8tL2NvbW1pdHMv
cmVtb3ZlLVVDTElOVVg/cmVmX3R5cGU9aGVhZHMKPj4KPj4gQnVpbGQgdGVzdDoKPj4gaHR0cHM6
Ly9naXRodWIuY29tL3BldmlrL2x0cC9hY3Rpb25zL3J1bnMvNzM5MjQ3MDIxNQo+IAo+IFRoYW5r
cyBmb3IgeW91ciBzZXJpZXMhCj4gCj4gSSBzZWUgeW91IG9ubHkgQ0NlZCBsaW51eC1tNjhrLCBi
dXQgQUZBSUssIHVDbGludXggaXMgbm90IHJlc3RyaWN0ZWQKPiB0byBtNjhrL2NvbGRmaXJlLCBi
dXQgYWxzbyBhdmFpbGFibGUgb24gYXJtMzIsIHJpc2N2LCBzaCwgYW5kIHh0ZW5zYS4KCkRvIHlv
dSBtZWFuICJub21tdSBzdXBwb3J0Iiwgb3IgZG8geW91IG1lYW4gdGhlIGFuY2llbnQgZGlzdHJv
IEplZmYgRGlvbm5lCnN0b3BwZWQgbWFpbnRhaW5pbmcgaW4gMjAwMz8KCkJlY2F1c2UgSSd2ZSBi
ZWVuIGRvaW5nIG5vbW11IG11c2wtbGliYyBzeXN0ZW1zIGZvciBhIGZldyB5ZWFycyBub3cuIFdv
cmtzIGZvciBtZS4uLgoKUm9iCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
