Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA80CCF9EB
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Oct 2025 15:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b5+MJK5IBRRHKNp+EVf5R+fXkLmWIPWvCTx5a4eeAH8=; b=oSLyPQZFDmMWPY
	kpc5OsknTh5OhHn3ORrPhzItRpMcBFHqHcfyztLt/4QVj0ikW3gP9xMgBOzwWc6ZjUYXxVlpg6Hc7
	RT6dSCsE1aGTU9y7X0zqAj+h0kxVaPnplUql0OqxklREfXpHkBfrg6PP5zfcQXuzaYtqsPIX1+VGA
	RmznTvTUDTLfYOH5bELu1j9jYhde2oouJMXqIK79PhsX7FAZHdu9ehCA+Vd2sAMl0hOmDg6CP1k7I
	jwY6bZgPA573ghU7MNjEACMlgKZXBykyz3zSMwgpPK4OUKzBhKS/0K6rAuVQH+Zecsy23rwIMBmrW
	tKQcpcABvls2NDqebxkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE8Cm-00000001oXe-3PIs;
	Wed, 29 Oct 2025 15:35:20 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE8Ck-00000001oVt-1LsX
	for linux-riscv@lists.infradead.org;
	Wed, 29 Oct 2025 15:35:20 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-47710acf715so20159955e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 29 Oct 2025 08:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1761752115; x=1762356915; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aLI3NZdHzrZYLWdy8/zoWvHAgFT9er17PaTQd3QXPMs=;
        b=Pjg4N0P7bBO4/nCKz63vtdmZiapQxq21+qtYy6UjZtfJ0hL2PAkWH/NIkPW91BfgVI
         RJUaTE17Pz1mXIwV+puaH7NQtmQBJEx1GI6yNdNQvxWpyqRrhRXAajTS+/1Cdi34kSnr
         HxUajMooGnrDr8jEPl64MZHwcpx7cW5iADTU8tIcyV7njXL+JxTa8en99frvwU/LNYpY
         Js4q9QJJUWUIYaa9qLuJnROURRjnmHlTFgrzWrw69oq3hOztWOXNL0VI3a6YIlBETcCT
         1y+dgJmHYi4O0x7/kiNadRdBuD7NBRen7Qq6ptAGvH/dnSVfsLAygAtfeHL8NjPOk6R6
         Dm5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761752115; x=1762356915;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aLI3NZdHzrZYLWdy8/zoWvHAgFT9er17PaTQd3QXPMs=;
        b=iH4HMu+2ppvYyrPLH+tGoRfA0AKLN847/HNtv6HhOmx/jimkrIpnA3tRP2+ucl3tiL
         rKL4IcSWbB9kPjlZVIePumsh0oQyJHSVkZs7jV4toSp5Dd3Wrs9oE6NDf2sqgUox0UqP
         OSML8VNjQ3EfuVb0GZxosW+XLRdXne/2dI2xU1b0YvwT58Zq85vKrXOHlihkdYn+iOAK
         1aCCXo6/15BqO4vytYdsp12hhtNsP9EVoAu8tBYp0i56dHGwQEGudC1nLvBsoub3IwbU
         Cin9ZuuFBRV3NzJOeQqOK/W1uuJyxTh68MueupCSOBvnIQmSekTIAP//sP+glHThc04w
         CmGw==
X-Forwarded-Encrypted: i=1; AJvYcCWtxrWH2n4pxuPtpNNW29fGOvBNzndPX2c9xm+qj+uU5Q2qOBf0O3SWExaFEv0HiZUA4lWs+bvSM2pKxw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwD0TqawRXN3ZeEnM+uhN4EJkGoLKHLKGRiN/VN9L/HLitaURYU
	PBFCS0KNmMIoU9JqoorizBmuN9UB5GxVOqxr3w24aWfZV7PpbW6C8ZZLpRkP5uq5tFw=
X-Gm-Gg: ASbGnctSOQOFk23bVWBKh6iWxmhIOPDDl//yDKrek3+3gSTdzsCrnzugYRFWZl+QS6d
	3CJCfd8qPrUt9PWaESqpRvMn6lZKDkiw5MOIlVWdFNJNMaYSYGIql8V//Hly06j8rc7Tt/ssTyg
	qTKpzFMqpO411Ig69lxbFZAzP1jkMwL0s9Qg79xMAm8XPRH/2CTKkgxppIhHMNPc8E48vWUPKAF
	BUegj//RxWbHBD16ptKIbpfXLfn/ngGSvyOdvm552/uuDc0gYUCAwd4vag3RT1bmLLwi0p7O4qE
	7WzSMFmEmtzv7LTNMGmHRJPQGANcSjMQ6iBar9B5AE7wkjTXXIO6FjpZHWUSVz/8BiFWWViebGG
	SspJUns0q6dn87ROldpCua+vHbWzF8KAyC8Grmz6bcjJ+uMms6/G2NdxwIqkeLsXBXQ9+zFNgbM
	mlmYOPjMVSg/FWY+Js3l61mff1PbVfRg4j3eA7R2W5Yk++fYBeQC/ZIgokYlI=
X-Google-Smtp-Source: AGHT+IE1War9zWW2DadyeaQTgCuzaEYVadTvhpK/iM6ucbryWIKimZJyW4F7rU2olGBmaok/ywFf6w==
X-Received: by 2002:a05:600d:839a:b0:475:dbb5:2397 with SMTP id 5b1f17b1804b1-4771e93fe4dmr17226345e9.0.1761752115477;
        Wed, 29 Oct 2025 08:35:15 -0700 (PDT)
Received: from ?IPV6:2001:861:3380:2e20:6214:6f9b:8e4c:f723? ([2001:861:3380:2e20:6214:6f9b:8e4c:f723])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4771e196b27sm56962425e9.8.2025.10.29.08.35.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 08:35:14 -0700 (PDT)
Message-ID: <72ab3ef1-fcd7-4003-8393-e64159625125@rivosinc.com>
Date: Wed, 29 Oct 2025 16:35:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/5] drivers: firmware: add riscv SSE support
To: Himanshu Chauhan <hchauhan@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Anup Patel <apatel@ventanamicro.com>, Xu Lu <luxu.kernel@bytedance.com>,
 Atish Patra <atishp@atishpatra.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, Yunhui Cui <cuiyunhui@bytedance.com>,
 Conor Dooley <conor.dooley@microchip.com>
References: <20250908181717.1997461-1-cleger@rivosinc.com>
 <20250908181717.1997461-4-cleger@rivosinc.com>
 <CAPd4WezLU2TdpyUQ_UOT0SO=N+jbwEs4iVUKZ2_ngcGEJpSbNw@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <CAPd4WezLU2TdpyUQ_UOT0SO=N+jbwEs4iVUKZ2_ngcGEJpSbNw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_083518_379944_4B8A538D 
X-CRM114-Status: GOOD (  12.62  )
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

CgpPbiAxMC8yNy8yNSAxMzozNSwgSGltYW5zaHUgQ2hhdWhhbiB3cm90ZToKPj4gK3N0YXRpYyBp
bnQgc3NlX3BtX25vdGlmaWVyKHN0cnVjdCBub3RpZmllcl9ibG9jayAqbmIsIHVuc2lnbmVkIGxv
bmcgYWN0aW9uLAo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICB2b2lkICpkYXRhKQo+PiAr
ewo+PiArICAgICAgIFdBUk5fT05fT05DRShwcmVlbXB0aWJsZSgpKTsKPj4gKwo+PiArICAgICAg
IHN3aXRjaCAoYWN0aW9uKSB7Cj4+ICsgICAgICAgY2FzZSBDUFVfUE1fRU5URVI6Cj4+ICsgICAg
ICAgICAgICAgICBzc2VfZXZlbnRzX21hc2soKTsKPj4gKyAgICAgICAgICAgICAgIGJyZWFrOwo+
PiArICAgICAgIGNhc2UgQ1BVX1BNX0VYSVQ6Cj4+ICsgICAgICAgY2FzZSBDUFVfUE1fRU5URVJf
RkFJTEVEOgo+PiArICAgICAgICAgICAgICAgc3NlX2V2ZW50c191bm1hc2soKTsKPj4gKyAgICAg
ICAgICAgICAgIGJyZWFrOwo+PiArICAgICAgIGRlZmF1bHQ6Cj4+ICsgICAgICAgICAgICAgICBy
ZXR1cm4gTk9USUZZX0RPTkU7Cj4+ICsgICAgICAgfQo+PiArCj4+ICsgICAgICAgcmV0dXJuIE5P
VElGWV9PSzsKPj4gK30KPj4gKwo+PiArc3RhdGljIHN0cnVjdCBub3RpZmllcl9ibG9jayBzc2Vf
cG1fbmIgPSB7Cj4+ICsgICAgICAgLm5vdGlmaWVyX2NhbGwgPSBzc2VfcG1fbm90aWZpZXIsCj4+
ICt9Owo+PiArCj4+ICsvKgo+PiArICogTWFzayBhbGwgQ1BVcyBhbmQgdW5yZWdpc3RlciBhbGwg
ZXZlbnRzIG9uIHBhbmljLCByZWJvb3Qgb3Iga2V4ZWMuCj4+ICsgKi8KPj4gK3N0YXRpYyBpbnQg
c3NlX3JlYm9vdF9ub3RpZmllcihzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgKm5iLCB1bnNpZ25lZCBs
b25nIGFjdGlvbiwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZvaWQgKmRhdGEp
Cj4+ICt7Cj4+ICsgICAgICAgY3B1aHBfcmVtb3ZlX3N0YXRlKHNzZV9ocF9zdGF0ZSk7Cj4+ICsg
ICAgICAgc3NlX3Jlc2V0KCk7Cj4gSXMgdGhpcyBzc2VfcmVzZXQgcmVxdWlyZWQ/Cj4gSSB3YXMg
cnVubmluZyB0aGUgcG93ZXJvZmYgY29tbWFuZC4gVGhlIENQVSB0ZWFyZG93biBmdW5jdGlvbiBp
cwo+IGNhbGxlZCBhbmQgZXZlbnRzIGFyZSBkaXNhYmxlZCAmIHVucmVnaXN0ZXJlZCBhcyBwYXJ0
IG9mIGl0Lgo+IHdoZW4gc3NlX3Jlc2V0IGlzIGNhbGxlZCwgaXQgYWdhaW4gdHJpZXMgdG8gY2Fs
bCBkaXNhYmxlICYgdW5yZWdpc3Rlcgo+IGV2ZW50cyBmb3IgYWxsIGNwdXMgKG5vbG9jayB2ZXJz
aW9uKS4gU28gSSBzZWUgZXJyb3JzIGZyb20gU0JJIHRoYXQKPiBldmVudCBpcyBpbiBpbnZhbGlk
IHN0YXRlLiBDb21tZW50aW5nIG91dCBzc2VfcmVzZXQoKSB3bwoKSGkgSGltYW5zaHUsCgpZZWFo
IHRoYXQgaXMgdXNlbGVzcy4gSSB0aGluayBpdCB3YXMgdGhlcmUgYmVmb3JlIHlvdSBhZGQgUE0g
c3VwcG9ydCBhbmQKd2Fzbid0IHJlbW92ZWQgdGhlbi4gSSdsbCByZW1vdmUgaXQuCgpUaGFua3Ms
CgpDbMOpbWVudAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
