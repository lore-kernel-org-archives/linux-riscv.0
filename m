Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B4C2D3B7EA
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Dec 2025 05:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VOHbv6NN1dzFpZj0T4PnOpENw/AY03NcuE7rtMEfd3M=; b=Tb6uMqImwPzbX4
	6RIOus/e85ytDnRaJk4xe/x1vZiroM/1zfMTltdYKsDS5wAk220yJY4yjpeTwMOjcc38NhvCKdYWB
	l5bAi/43jCyapNgQk0NT6ClW9jSj/tk0mAdvK4A/77lXe5fMbfbpnxIUGvGXqLmfi01KXFClYD9CJ
	4qtN4B3XXEsUQHU5E2anU4GTBkQAfaBQs1AJLvGRPBwloVQBqiSMGuV+9wMekHeliIk9y4fRzetRC
	fmHaGGzWfoPs58hh+7V1scPBQWbTYmKgn5xXqG4iljzqLdrMeNzjpLrARY3fAtkBmlIGQhmpp14Wo
	juqeQWpnTkJ/HoQ451ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSqCg-0000000Dq8Q-1XLt;
	Tue, 09 Dec 2025 05:24:02 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSqCd-0000000Dq7w-3SV4
	for linux-riscv@lists.infradead.org;
	Tue, 09 Dec 2025 05:24:01 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-3438d4ae152so4919963a91.1
        for <linux-riscv@lists.infradead.org>; Mon, 08 Dec 2025 21:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1765257838; x=1765862638; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3eSPmbLWyLBcQiX4FuCahKZ0aMEL39arsdfnAYJUHkQ=;
        b=OqMrFqdEJtKXhIMNKmLORLW31yUNCZAgGboYOTbrAAD6bcGbqH1y59pZi5dKLK3kAY
         mO0TYUB0eAbAA5ZNUx0ghY5yIvPDTkm1y03ZUIAcLy2GC+DLegChv6jebLGLgnpN6MaU
         eZ4togKVvpeCR3yQJdzvmWFFfn5NQ4bX+rOBbBzw//yoIn+xVhXQurD1IRRQOr8hSouq
         E6AV9NEJskSPgq7s+JuMtaRoYErjQYcVLbnVWAqWkDrzuQr453B4XK4LrAk8oBezUC8/
         hkPk2fJIKjdZZXQqzBz/iK8z7Zl14IvXfrtzPz+Ra67PUDTROzCe4z8OWLz1oAVoCiD/
         DO/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765257838; x=1765862638;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3eSPmbLWyLBcQiX4FuCahKZ0aMEL39arsdfnAYJUHkQ=;
        b=rjLLSwikO4flPR1Vmz6PcmBD3k70y09ShLPq9lziHsUsy3yVOk7/XHQHVf9SJuSAYV
         Eg2q9jdsKKRDOB8Dn26nrOzFY9sjYWKP+gm7Lh02HHxFfby3zOj9nbKqlDThDiO+FwIL
         2FJitBwh2fFLKGjnEV3DcwmtQBE4YNX8FYr5t2+uH3uHScmvQ6lGSQmr1XpQFBsmvdhq
         Jrp0dMMeK5uXGVUauBy9EizUhcYsnP8Gn82goWtxsDM634TUl1MPL1r/3vsl46qH7zfZ
         oq1ipRcOIIPXko3cInPsfYQtrY5DYbGZkSVqG3mSYA7W6y8RNmjcVCDZhbi3JExd0+1e
         lHbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyhAtNnvBRJnyNyYelR2D7s1V9rBtLT5FUoJcFPYNq7dsnPHCVDHwcwioH85WPkotLAehXCwCfTIlZTA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzFHQk49t+6vNOzH8tIFL5KfvRAQIpaSTNg6sWplCA80ozTfXnm
	o1SGif3XRkZ44yemo9WDdq0nUsFp0UIzDtPwE9Swci+IVQ5X2y1oKgATk8lmnQUjj08=
X-Gm-Gg: ASbGncuGFrfUrFW2YdYYDaN7GYFts1GlH4LBhi8PflCPnk5TLEW+4B9xCY+lJv0U2DK
	kjP/6sHKIWKapaH3ufGs8ZaSsVIpcmd4E+qiUSMUSSiTifD6pnDZvgWnpYt8bOti2/YA0c0NePR
	eL/3EwTgmctB5QMTE3tIgjn3w1VLfuPc2ejL5Z2K51+NSrvGwifVVMfroHq5u9G85b6hREycvao
	ZTs2FeewniuDlxNOAaozDeo9VavU3X18WNqCB3kAad9uVAQe/z9SNJ59sqSV8/MwRbiR3MUXtgn
	e6rCxaQghbjSt79w/LGnLf+snJOZmOcBNugIiZ3FI07xPvvhFIvCVJte+Cwrahkw7YXRkVjVUxI
	qOTbAwdh6/82TIkkglcIxfTt3f5mKCFDtWYlPF4gXJXMjrdsXD9ZaR+uOxYcpM7ph2mfmpqFGpP
	qeOdwQyrIgvlnMmFBpOVauyrWX5/CKuzg=
X-Google-Smtp-Source: AGHT+IEgRj8k/NUy8lgVpyEQCJU09GRONGLpSBp5S4EGiMvTHzEYpgp5Tbqw7st/J1fN/hxgbt03xw==
X-Received: by 2002:a17:90b:562d:b0:340:c4dc:4b8b with SMTP id 98e67ed59e1d1-349a24f21f1mr8022838a91.10.1765257838492;
        Mon, 08 Dec 2025 21:23:58 -0800 (PST)
Received: from [100.64.0.1] ([165.225.110.109])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a49b9178csm949702a91.12.2025.12.08.21.23.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 21:23:58 -0800 (PST)
Message-ID: <d8df2603-b5f7-408d-b2cb-515ddfff126e@sifive.com>
Date: Tue, 9 Dec 2025 14:23:52 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] lib/crypto: riscv/chacha: Avoid s0/fp register
To: Eric Biggers <ebiggers@kernel.org>
Cc: Vivian Wang <wangruikang@iscas.ac.cn>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-crypto@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jerry Shih <jerry.shih@sifive.com>
References: <20251202-riscv-chacha_zvkb-fp-v2-1-7bd00098c9dc@iscas.ac.cn>
 <20251202053119.GA1416@sol>
 <80cb6553-af8f-4fce-a010-dff3a33c3779@iscas.ac.cn>
 <20251202063103.GA100366@sol>
 <CABO+C-DAuguO4svhi4o5ZgybizzgnADRbzJWZNBTb4-096c10g@mail.gmail.com>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <CABO+C-DAuguO4svhi4o5ZgybizzgnADRbzJWZNBTb4-096c10g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_212359_879022_07243425 
X-CRM114-Status: GOOD (  14.51  )
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

T24gMjAyNS0xMi0wOSAxMjo1OCBQTSwgSmVycnkgU2hpaCB3cm90ZToKPiBPbiBUdWUsIERlYyAy
LCAyMDI1IGF0IDI6MzLigK9QTSBFcmljIEJpZ2dlcnMgPGViaWdnZXJzQGtlcm5lbC5vcmc+IHdy
b3RlOgo+Pgo+PiBPbiBUdWUsIERlYyAwMiwgMjAyNSBhdCAwMjoyNDo0NlBNICswODAwLCBWaXZp
YW4gV2FuZyB3cm90ZToKPj4+IE9uIDEyLzIvMjUgMTM6MzEsIEVyaWMgQmlnZ2VycyB3cm90ZToK
Pj4+PiBPbiBUdWUsIERlYyAwMiwgMjAyNSBhdCAwMToyNTowN1BNICswODAwLCBWaXZpYW4gV2Fu
ZyB3cm90ZToKPj4+Pj4gSW4gY2hhY2hhX3p2a2IsIGF2b2lkIHVzaW5nIHRoZSBzMCByZWdpc3Rl
ciwgd2hpY2ggaXMgdGhlIGZyYW1lIHBvaW50ZXIsCj4+Pj4+IGJ5IHJlYWxsb2NhdGluZyBLRVkw
IHRvIHQ1LiBUaGlzIG1ha2VzIHN0YWNrIHRyYWNlcyBhdmFpbGFibGUgaWYgZS5nLiBhCj4+Pj4+
IGNyYXNoIGhhcHBlbnMgaW4gY2hhY2hhX3p2a2IuCj4+Pj4+Cj4+Pj4+IE5vIGZyYW1lIHBvaW50
ZXIgbWFpbnRlbmVuY2UgaXMgb3RoZXJ3aXNlIHJlcXVpcmVkIHNpbmNlIHRoaXMgaXMgYSBsZWFm
Cj4+Pj4+IGZ1bmN0aW9uLgo+Pj4+IG1haW50ZW5lbmNlID0+IG1haW50ZW5hbmNlCj4+Pj4KPj4+
IE91Y2guLi4gSSBzd2VhciBJIHNwZWNpZmljYWxseSBjaGVja2VkIHRoaXMgYmVmb3JlIHNlbmRp
bmcsIGJ1dAo+Pj4gYXBwYXJlbnRseSBkaWRuJ3Qgc2VlIHRoaXMuIFRoYW5rcyBmb3IgdGhlIGNh
dGNoLgo+Pj4KPj4+Pj4gIFNZTV9GVU5DX1NUQVJUKGNoYWNoYV96dmtiKQo+Pj4+PiAgICBhZGRp
ICAgICAgICAgICAgc3AsIHNwLCAtOTYKPj4+Pj4gLSAgc2QgICAgICAgICAgICAgIHMwLCAwKHNw
KQo+Pj4+IEkga25vdyBpdCdzIGFubm95aW5nLCBidXQgd291bGQgeW91IG1pbmQgYWxzbyBjaGFu
Z2luZyB0aGUgOTYgdG8gODgsIGFuZAo+Pj4+IGRlY3JlYXNpbmcgYWxsIHRoZSBvZmZzZXRzIGJ5
IDgsIHNvIHRoYXQgd2UgZG9uJ3QgbGVhdmUgYSBob2xlIGluIHRoZQo+Pj4+IHN0YWNrIHdoZXJl
IHMwIHVzZWQgdG8gYmU/ICBMaWtld2lzZSBhdCB0aGUgZW5kIG9mIHRoZSBmdW5jdGlvbi4KPj4+
Cj4+PiBObyBjYW4gZG8uIFN0YWNrIGFsaWdubWVudCBvbiBSSVNDLVYgaXMgMTYgYnl0ZXMsIGFu
ZCA4MCB3b24ndCBmaXQuCj4+Pgo+Pgo+PiBIbW0sIGludGVyZXN0aW5nLiAgSXQgc2hvdWxkbid0
IGFjdHVhbGx5IG1hdHRlciwgc2luY2UgdGhpcyBkb2Vzbid0IGNhbGwKPj4gYW55IG90aGVyIGZ1
bmN0aW9uLCBidXQgd2UgbWlnaHQgYXMgd2VsbCBsZWF2ZSBpdCBhdCA5NiB0aGVuLiAgSSBkb24n
dAo+PiB0aGluayB0aGlzIHdhcyBjb25zaWRlcmVkIHdoZW4gYW55IG9mIHRoZSBSSVNDLVYgY3J5
cHRvIGNvZGUgd2FzCj4+IHdyaXR0ZW4sIGJ1dCBmb3J0dW5hdGVseSB0aGlzIGlzIHRoZSBvbmx5
IG9uZSB0aGF0IHVzZXMgdGhlIHN0YWNrLgo+Pgo+PiBBbnl3YXksIEkgZ3Vlc3MgSSdsbCBhcHBs
eSB0aGlzIGFzLWlzIHRoZW4uCj4+Cj4+IC0gRXJpYwo+IAo+IFRoZSAxNi1ieXRlIHN0YWNrIGFs
aWdubWVudCBpcyBpbiBSSVNDLVYgY2FsbGluZyBjb252ZW50aW9uOgo+IGh0dHBzOi8vcmlzY3Yu
b3JnL3dwLWNvbnRlbnQvdXBsb2Fkcy8yMDI0LzEyL3Jpc2N2LWNhbGxpbmcucGRmCj4gSXQgc2F5
czoKPiBJbiB0aGUgc3RhbmRhcmQgUklTQy1WIGNhbGxpbmcgY29udmVudGlvbiwgdGhlIHN0YWNr
IGdyb3dzIGRvd253YXJkCj4gYW5kIHRoZSBzdGFjayBwb2ludGVyIGlzIGFsd2F5cyBrZXB0IDE2
LWJ5dGUgYWxpZ25lZC4KCkluZGVlZCwgYW5kIHRoaXMgZG9lcyBtYXR0ZXIgaWYgdGhlIGNvZGUg
cnVucyB3aXRoIElSUXMgZW5hYmxlZCwgYXMgdGhlIFJJU0MtVgplbnRyeSBhc3NlbWJseSBhc3N1
bWVzIHRoZSBrZXJuZWwgc3RhY2sgaXMgYWxyZWFkeSBwcm9wZXJseSBhbGlnbmVkLgoKUmVnYXJk
cywKU2FtdWVsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
