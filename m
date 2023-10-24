Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D5F3C07545
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Oct 2023 18:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GfHLgCSS0xG8UnzHp580QFpgnTEy4o5HtKCh5KGn+yQ=; b=vfysny4g87Fd8P
	Ow2EP6jQ9Ayiq9eaQ4TmWxzRxzWQhgTJ9ne+A3bRriKOR3tZBisfRt4mq7vC5W0IQAVlzuMUv16KJ
	WvI9dp27RsUbI4RKOD38F+O3z9iBQA1yVUFCdrKIekvmREGRlGJNBG5f+9ssXARLRwKH7HqgE2Ejs
	EcKPMRmH4zOtgcryX/vUmuUDuRtsCtB4xwn09LZCjVLmaWVYs2Vb7CEMDmBbrpqeQC4PdwUyNNMR6
	GkrFtJvFNH5bAzkN8Um8WwQOm0wq9Ovsf8JSU85P+dowjlNd8sTkzQj7Ikx0B68YOBHV5utSAanh1
	pJJaD4fOaAROubDMbFMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvLry-00Ae6a-2Z;
	Tue, 24 Oct 2023 18:11:10 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvLrv-00Ae5T-2e
	for linux-riscv@lists.infradead.org;
	Tue, 24 Oct 2023 18:11:09 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-32de9764793so755489f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 24 Oct 2023 11:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1698171062; x=1698775862; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dKxR0O8nMebNGWqyGQ9J2L+zEiSIfrsVmyfDrAKwhR8=;
        b=f4ukdVXvhAHhEWrOnK/gZZoYRSPwhrVk4sEKhgX2EO7lBim+nP+svK5i2YVf7Fo1Jk
         iUx03azaHL+lCpqLHM+9ACSqOHo4cYlT6gl3jTlHNnCbHtwae+OgVgi/xW94gTTYpEGI
         yeLMZZ9bt0E+lgC7LRnpfmlQOYntgIzA1Ip0ttYODVgcig0VD2ozPOXzRyLjSPOMG980
         z7YYkqWjURxV8T0DzcgVbTTe10YU/dRjXlBl1IUlF8d6rPzUpZ56Tzvu9BufDAhLPDc4
         HsVRYH4a4WbTGcHjGvDFPFOJ6P7P/EKszYTJV1tcQkEseRxEQ7fVyfYt18JYAiXMwOxq
         +VwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698171062; x=1698775862;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dKxR0O8nMebNGWqyGQ9J2L+zEiSIfrsVmyfDrAKwhR8=;
        b=HZJkr5ZW8VPfVzDTwAtc3x1gVD5fJDHxmvbcNYfcG3bZP3TaUqUTvRTv5zuAAJ8wut
         GVdMDwE6vr9sMqXaCXmcpa0ddneaalVFlShz4vwrI0Dso9VJJ1eO6Ug6Sdlk12o3T4yH
         6qlRmlPeYKq0ZD+OIL0kDXZItPM9zgshIjARObnDq9Iwn9RuC1tzXg8/r6ai3jUQ5l9O
         MpBfSTr1nyS0EAJprQcJespNO+yBJl07VJRzZP87FNQ7G4QsGhoSdwqGJLQrbcEkdzpF
         5qUiufr7VTVuYsf8SLwwsOc3GXgRKHxU3VQk/5JuNYlezQ1PaobYgp3XgE9OzLufe0zJ
         rr1Q==
X-Gm-Message-State: AOJu0Ywjg4QVhvJWriaqBHHJ+EpQEY8rokad9JmPG/xuY5gOCqxVVxFI
	yP+nnf96gVegYLEIJrLD8hJzyw==
X-Google-Smtp-Source: AGHT+IEzTUYZHBwMWOmDylM23+SpgZ4YldKTRCyQKmiDghga3Ul4JN8Saqse9bLNdqzRU8gTtkmr7w==
X-Received: by 2002:adf:b649:0:b0:32f:51c6:cd6c with SMTP id i9-20020adfb649000000b0032f51c6cd6cmr1688373wre.2.1698171061901;
        Tue, 24 Oct 2023 11:11:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:9f43:3ca4:162c:d540? ([2a01:e0a:999:a3a0:9f43:3ca4:162c:d540])
        by smtp.gmail.com with ESMTPSA id a10-20020adfe5ca000000b0032415213a6fsm10361744wrn.87.2023.10.24.11.11.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Oct 2023 11:11:01 -0700 (PDT)
Message-ID: <3a5462f6-62d4-49e3-ae78-374fb5cbad5a@rivosinc.com>
Date: Tue, 24 Oct 2023 20:11:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/19] riscv: add ISA extension parsing for scalar
 crypto
Content-Language: en-US
To: Evan Green <evan@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Palmer Dabbelt <palmer@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>,
 Andrew Jones <ajones@ventanamicro.com>, Conor Dooley <conor@kernel.org>,
 Samuel Ortiz <sameo@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>
References: <20231017131456.2053396-1-cleger@rivosinc.com>
 <20231017131456.2053396-3-cleger@rivosinc.com>
 <CALs-HssmufWCKzaGy7BwWz4n4hfwV9NjjRD-O_JeupM-p=Ov+w@mail.gmail.com>
 <d0ea4996-5c48-47b4-99b0-f4211276e0b2@rivosinc.com>
 <56f6af04-bdf4-4b85-99dc-9eb4f391d7ad@rivosinc.com>
 <CALs-Hsvy411MnHQXHLK8u4JmM+LO5R2tuCxY6zQco7BKJONqPA@mail.gmail.com>
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <CALs-Hsvy411MnHQXHLK8u4JmM+LO5R2tuCxY6zQco7BKJONqPA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_111107_866423_918E9E79 
X-CRM114-Status: GOOD (  28.81  )
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

CgpPbiAyNC8xMC8yMDIzIDE4OjM3LCBFdmFuIEdyZWVuIHdyb3RlOgo+IE9uIFR1ZSwgT2N0IDI0
LCAyMDIzIGF0IDI6MzDigK9BTSBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+
IHdyb3RlOgo+Pgo+Pgo+Pgo+PiBPbiAyNC8xMC8yMDIzIDA5OjE4LCBDbMOpbWVudCBMw6lnZXIg
d3JvdGU6Cj4+Pgo+Pj4KPj4+IE9uIDIzLzEwLzIwMjMgMTg6MjEsIEV2YW4gR3JlZW4gd3JvdGU6
Cj4+Pj4gT24gVHVlLCBPY3QgMTcsIDIwMjMgYXQgNjoxNeKAr0FNIENsw6ltZW50IEzDqWdlciA8
Y2xlZ2VyQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4+Pj4+Cj4+Pj4+IEZyb206IEV2YW4gR3JlZW4g
PGV2YW5Acml2b3NpbmMuY29tPgo+Pj4+Pgo+Pj4+PiBUaGUgU2NhbGFyIENyeXB0byBzcGVjaWZp
Y2F0aW9uIGRlZmluZXMgWmsgYXMgYSBzaG9ydGhhbmQgZm9yIHRoZQo+Pj4+PiBaa24sIFprciBh
bmQgWmt0IGV4dGVuc2lvbnMuIFRoZSBzYW1lIGZvbGxvd3MgZm9yIGJvdGggWmtuLCBaa3MgYW5k
IFpiaywKPj4+Pj4gd2hpY2ggYXJlIGFsbCBzaG9ydGhhbmRzIGZvciB2YXJpb3VzIG90aGVyIGV4
dGVuc2lvbnMuIFRoZSBkZXRhaWxlZAo+Pj4+PiBicmVha2Rvd24gY2FuIGJlIGZvdW5kIGluIHRo
ZWlyIGR0LWJpbmRpbmcgZW50cmllcy4KPj4+Pj4KPj4+Pj4gU2luY2UgWmtuIGFsc28gaW1wbGll
cyB0aGUgWmJrYiwgWmJrYyBhbmQgWmJreCBleHRlbnNpb25zLCBzaW1wbHkgcGFzc2luZwo+Pj4+
PiAiemsiIHRocm91Z2ggYSBEVCBzaG91bGQgZW5hYmxlIGFsbCBvZiBaYmtiLCBaYmtjLCBaYmt4
LCBaa24sIFprciBhbmQgWmt0Lgo+Pj4+PiBGb3IgZXhhbXBsZSwgc2V0dGluZyB0aGUgInJpc2N2
LGlzYSIgRFQgcHJvcGVydHkgdG8gInJ2NjRpbWFmZGNfemsiCj4+Pj4+IHNob3VsZCBnZW5lcmF0
ZSB0aGUgZm9sbG93aW5nIGNwdWluZm8gb3V0cHV0Ogo+Pj4+PiAicnY2NGltYWZkY196aWNudHJf
emljc3JfemlmZW5jZWlfemlocG1femJrYl96YmtjX3pia3hfemtuZF96a25lX3prbmhfemtyX3pr
dCIKPj4+Pj4KPj4+Pj4gcmlzY3ZfaXNhX2V4dF9kYXRhIGdyb3dzIGEgcGFpciBvZiBuZXcgbWVt
YmVycywgdG8gcGVybWl0IHNldHRpbmcgdGhlCj4+Pj4+IHJlbGV2YW50IGJpdHMgZm9yICJidW5k
bGVkIiBleHRlbnNpb25zLCBib3RoIHdoaWxlIHBhcnNpbmcgdGhlIElTQSBzdHJpbmcKPj4+Pj4g
YW5kIHRoZSBuZXcgZGVkaWNhdGVkIGV4dGVuc2lvbiBwcm9wZXJ0aWVzCj4+Pj4+Cj4+Pj4+IENv
LWRldmVsb3BlZC1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4K
Pj4+Pj4gU2lnbmVkLW9mZi1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlw
LmNvbT4KPj4+Pj4gU2lnbmVkLW9mZi1ieTogRXZhbiBHcmVlbiA8ZXZhbkByaXZvc2luYy5jb20+
Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNv
bT4KPj4+Pgo+Pj4+IE15IHRyZWUgbWlnaHQgYmUgb3V0IG9mIHN5bmMsIGJ1dCBpbiBteSBzZWFy
Y2ggZm9yIHJpc2N2X2lzYV9leHQsIEkKPj4+PiBhbHNvIGZvdW5kIGEgdXNlIGluIHByaW50X2lz
YSgpIChjcHUuYykgd2hlcmUgd2UncmUgcmVhY2hpbmcgaW50bwo+Pj4+IHJpc2N2X2lzYV9leHRb
XS5pZCBhbmQgYXNzdW1pbmcgaXQncyBhbHdheXMgdmFsaWQuIElmIHRoYXQncyBzdGlsbCBpbgo+
Pj4+IHRoZXJlIHdlJ2xsIHdhbnQgdG8gZml4IHVwIHRoYXQgc3BvdCB0b28sIHNpbmNlIG5vdyB3
aXRoIGJ1bmRsZXMgLmlkCj4+Pj4gbWF5IG9yIG1heSBub3QgYmUgdmFsaWQuCj4+Pgo+Pj4gT2gg
aW5kZWVkLCB0aGUgYXJyYXkgaXMgdmlzaWJsZSBvdXRzaWRlIG9mIHRoaXMgY29tcGlsYXRpb24g
dW5pdCA6Ly4KPj4+IEknbGwgY2hlY2sgdGhhdCBiZWZvcmUgc2VuZGluZyBWMy4KPj4KPj4gQWZ0
ZXIgbG9va2luZyBhIGJpdCBtb3JlIGF0IHRoYXQsIGl0IGFjdHVhbGx5IHNlZW1zIHRoYXQgaWQg
aXMgdXNlZCBpbgo+PiBjcHVpbmZvIHRvIGRldGVybWluZSB3aGljaCBleHRlbnNpb25zIGFyZSBw
cmVzZW50IHdoaWNoIG1lYW5zIHlvdSBhcmUKPj4gcmlnaHQsIGJ1bmRsZV9zaXplIG5lZWRzIHRv
IGJlIGFjY291bnRlZCBmb3IuCj4+Cj4+IExvb2tpbmcgYXQgaXQgYWxzbyByYWlzZXMgdGhlIHF1
ZXN0aW9uIChhZ2Fpbikgb2YgZXhwb3NpbmcgdGhlICJidW5kbGVzIgo+PiBleHRlbnNpb25zIHRo
ZW1zZWx2ZXMgb3Igbm90IGluIGNwdWluZm8gb3V0cHV0LiBXaXRoIHRoZSBjdXJyZW50IHNldHVw
LAo+PiB0aGUgYnVuZGxlcyBleHRlbnNpb25zIHdvbid0IGJlIHZpc2libGUgaW4gY3B1aW5mbyBv
dXRwdXQuIEZvciBpbnN0YW5jZQo+PiBpZiBaayB3YXMgaW4gdGhlIGlzYSBzdHJpbmcsIHRoZW4g
aXQgd2lsbCBub3QgYmUgdmlzaWJsZSBpbiB0aGUgY3B1aW5mbwo+PiBvdXRwdXQsIG9ubHkgdGhl
IGNoaWxkIGV4dGVuc2lvbnMuIE9uZSBzb2x1dGlvbiB3b3VsZCBiZSB0byBhbHdheXMgaGF2ZQo+
PiBhIHZhbGlkIGlkIGZvciBlYWNoIGV4dGVuc2lvbi4gU28gd2Ugd291bGQgaGF2ZSBvbmUgZm9y
IFprIGZvciBpbnN0YW5jZS4KPj4KPj4gV2Ugd291bGQgdGhlbiBoYXZlIGEgc2ltaWxhciBzZXR1
cCBmb3IgYWxsICJidW5kbGVzIiBvciAic3Vic2V0Igo+PiBleHRlbnNpb25zLCB0aGV5IHdvdWxk
IGhhdmUgYSBpZCBmb3IgYWxsIG9mIHRoZW0uIEZvciBpbnN0YW5jZSwgWmsgd291bGQKPj4gYmVj
b21lOgo+Pgo+PiBfX1JJU0NWX0lTQV9FWFRfREFUQV9CVU5ETEUoemssIFJJU0NWX0lTQV9FWFRf
WkssIHJpc2N2X3prX2J1bmRsZWRfZXh0cykKPj4KPj4gU2FtZSB3b3VsZCBnbyBmb3IgenZiYiAo
cmlzY3ZfenZiYl9zdWJzZXRfZXh0cyB3b3VsZCBvbmx5IGNvbnRhaW4gWnZrYik6Cj4+Cj4+IF9f
UklTQ1ZfSVNBX0VYVF9EQVRBX0JVTkRMRSh6aywgUklTQ1ZfSVNBX0VYVF9aVkJCLCByaXNjdl96
dmJiX3N1YnNldF9leHRzKQo+Pgo+PiBGb3IgdGhlIHNha2Ugb2YgY29tcGxldGVuZXNzLCBJIGZl
ZWwgbGlrZSBpdCB3b3VsZCBiZSBnb29kIHRvIGhhdmUgYWxsCj4+IHRoZSBleHRlbnNpb25zIChi
dW5kbGVzIG9yIG5vdCkgdmlzaWJsZSBpbiB0aGUgcmlzY3ZfaXNhX2V4dC4KPj4KPj4gQW55IG9i
amVjdGlvbiA/Cj4gCj4gSSBjb3VsZCBiZSBwZXJzdWFkZWQgdGhhdCBpdCdzIGEgZ29vZCBpZGVh
LCBidXQgdGhlcmUgYXJlIGFyZ3VtZW50cyB0bwo+IGJlIG1hZGUgZm9yIG5vdCBkZWZpbmluZyB0
aGVtIGFzIHNlcGFyYXRlIGJpdHM6Cj4gCj4gMS4gSGF2aW5nIHR3byAoc2V0cyBvZikgYml0cyB0
aGF0IG1lYW4gdGhlIHNhbWUgdGhpbmcgbWVhbnMgdXNlcm1vZGUKPiBub3cgaGFzIHRvIGRlY2lk
ZSB3aGljaCBvbmUgdG8gcXVlcnksIG9yIHF1ZXJ5IGJvdGguIE11bHRpcGxlIHZhbHVlcwo+IHRo
YXQgbWVhbiB0aGUgc2FtZSB0aGluZyBpcyBhbHdheXMgc29tZXRoaW5nIHRoYXQgbWFrZXMgbWUg
bmVydm91cy4KClRoYXQgaXMgaW5kZWVkIGFuIGFjY2VwdGFibGUgY29ucy4KCj4gMi4gVG8gYXZv
aWQgdGhlc2UgdHdvIHNldHMgaGF2aW5nIGRpZmZlcmVudCBhbnN3ZXJzLCB3ZSdkIGhhdmUgdG8K
PiBzb2x2ZSB0aGUgcmV2ZXJzZSBwcm9ibGVtIHRvbzogSWYgYWxsIG9mIHRoZSBidW5kbGVkIGV4
dGVuc2lvbnMgdGhhdAo+IG1ha2UgdXAgWmsgYXJlIG9uLCB3ZSdkIG5lZWQgdG8gZGV0ZWN0IHRo
YXQgYW5kIHR1cm4gWmsgb24gYXMgd2VsbC4KCk9oIHllcywgc29ycnksIGFscmVhZHkgZm9yZ290
IHRoYXQgcG9pbnQgOi8gV2VsbCwgSSBndWVzcyB0aGluZ3Mgc29ydGVkCm91dCBieSB0aGVtc2Vs
dmVzLiBMZXQncyBkbyB3aGF0IHlvdSBwcm9wb3NlZDoKCi0gUHVyZSBsYXNzbyBleHRlbnNpb25z
IChaaykgd2lsbCBzaW1wbHkgcmVzdWx0IGluIGFsbCB0aGUgc3ViCmV4dGVuc2lvbnMgYmVpbmcg
ZW5hYmxlLCB0aGVyZSB3b24ndCBiZSBhbnkgLmlkIHNwZWNpZmllZCBmb3IgdGhlc2UKb25lcywg
c2ltcGx5IGEgYnVuZGxlIG9mIGV4dGVuc2lvbnMuCgotICJTdXBlcnNldCIgZXh0ZW5zaW9ucyAo
WnZiYiBmb3IgaW5zdGFuY2UpIHdpbGwgaGF2ZSB0aGVpciBvd24gLmlkIGFzCndlbGwgYXMgYSBi
dW5kbGUgbWFkZSBvZiBzdWJzZXRzIGV4dGVuc2lvbnMuCgpDbMOpbWVudAoKPiBUaGF0IGNvZGUg
d291bGQgYWxzbyBuZWVkIHRvIGtub3cgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiBhIHB1cmUgbGFz
c28KPiBsaWtlIFprLCB3aGVyZSB5b3Ugc2hvdWxkIGZsaXAgaXQgb24gaWYgaXRzIGNvbXBvbmVu
dHMgYXJlIG9uLCBhbmQgdGhlCj4gbG9vc2UgY2hhbmdlIHZhcmlhbnQgd2Ugd2VyZSBkaXNjdXNz
aW5nIG9uIHRoZSBvdGhlciB0aHJlYWQgKFp2a2I/KSwKPiB3aGVyZSB5b3UgY2Fubm90Lgo+IAo+
IFByZXRlbmRpbmcgcHVyZSBsYXNzbyBleHRlbnNpb25zIGRpZG4ndCBleGlzdCBvbiB0aGVpciBv
d24gd2FzIGEgd2F5Cj4gdG8gc2lkZXN0ZXAgdGhlIHByb2JsZW0uCj4gLUV2YW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
