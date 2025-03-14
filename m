Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F29C35FF8
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 08:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=286pmurIcBKIOAqLrESlOgj+rBS4mDR5VUcQL5KsC0w=; b=nQxJkxDkXVG9X9
	5UqXN0L7EqJ+kuxaSbgdfVw0fKLP1VQ6/Wx7BBxxNp9b2VnTgjAA0BehUqGAeIlzT3U1eHf/BBzJs
	8COAxQIIgorwAkIyZTQAQCmjP1MJUKLBopa0KNPVnQbw7vi+gx9tdGxLW+Kn6/28WKJHbJ52bLjBV
	lGZ8pzRVX7ZlhwWPrZGyWU5VDMZ/GH18OuG5wLD4ZS2eWzt0ugrTIHHT0YywIIdq3yB8e8ACV9gRA
	995kax+SIcNxZm/q5yWnjJX7Dwj26dmv0GU03CCCMvJgJKJTLQ7XhBXxJelx27ciHI96aqs4yqssH
	z1/6dgt+ilrvY2bL3U9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt0lL-0000000DXNc-1HP2;
	Fri, 14 Mar 2025 08:51:27 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt0To-0000000DUTS-1LIf
	for linux-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 08:33:22 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-3cf8e017abcso7503235ab.1
        for <linux-riscv@lists.infradead.org>; Fri, 14 Mar 2025 01:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1741941199; x=1742545999; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RZ6FuxCD5VQCRHQX3CMFDucd83uwpV785bHCUjNT0V8=;
        b=Bq6VDzNPJIw4wKCJx3V1VXnLKPIRKfk2Fv5Ffjb0gndnFzOiGmmjxPfsOfv1FmZ/2c
         y++805xYAePIFGWKDVlHN8p7v5J+7BBjzRhhTtksijMhow+Ov1N96PUhw8cAKvDEzPmd
         0i6JLqP2wXnbM7aj4KL9t/+eOUlRI1LUaVt7mcWJdY4A5/9qDw1xUj367V87g6EILgcK
         XUTl+HEgFDNGUyP3QZ0OqM6+yPBs8bKoXm3PvKM8BStGIMB/KA4xXWh+cftXIe4oart2
         JlqLvFQpu6oxgDK25SSjFNJyl1Qd787kzJQNUBIZk6RTDP+eYIJFDZ8a0euI5LgSGsqt
         Nm1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741941199; x=1742545999;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RZ6FuxCD5VQCRHQX3CMFDucd83uwpV785bHCUjNT0V8=;
        b=LkN/cExANviydm1MvE1HX2sbaQXdiwWP4HJ5Hu5Vr7dLvz1pf43B5iwf6mc9iXJTSQ
         RtJGKyxzsQ0KpP5d5vMuPkQ/5sxRqJTBfsRRoiI1CuYm4Azh8mrjFpL9bi+UgWcbIlCp
         mI4NUFFZVXuctW0H4AX0YHL1K5HruIFLK6Az3mP833GtaO6dEq8ed8rbMyxutCEHvylw
         sVJw5q8RZyZdxyiDPApmaDg+4zCLpY6SPS5cGdjGYGaD0NyYzoJOE2RAynO3LdgF5r9C
         B7Yo5ORm68Wzp1TK5LzINcG1sfKh5BdF1r2/LRB1ufNFnGHWxTPM7Xduo/rumAIFJDzo
         Kk8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUMjqyc0PBfJ2lG6N7//cEUWze0tZljTmNt3kWBYSQZa8cEvGnPnKM/X+gha10Gixx6ydAjiTttsJdxXw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8KPKNcXjE3m7D5dS8DucG1qNvKvNJghsIpj/5SGVtpu/Ip/Lt
	VURIlrScKJ/sSoVJ5+30nlsUdC/2leVaa0ApiW1kDl3MgFkrZhyigK4Ea6sa5q9Gfdn9HE0TN0c
	L1IlYnP9Fxl5wRVE6K5e+pADgdjlCTb87XRfcQQ==
X-Gm-Gg: ASbGncshO73GpQJMIOiCwhBQpOL1neK/v+0YHsb2U1ZojiakG83uVp2T8AladWIYES9
	2Ae9kkUUl2S+P7mZzo5VNmu9ACpo6O+pyTW4Hs1JedJk3BSnLCOPVfVuLdmS/4Iz4YiNPWnPNOh
	XuiOQIs+EBNAtkLR2sVSTEGKNm3gY=
X-Google-Smtp-Source: AGHT+IEpjn4sO807Vp20+x53G/QOr0uFP8XMrOnpLUB7Nd0kqwhiUZDXFX7IBtCy0L3k8Bc72TnDTAm7aisZ3g/OHoQ=
X-Received: by 2002:a05:6e02:3285:b0:3d0:bd5:b863 with SMTP id
 e9e14a558f8ab-3d483a82c1amr15625505ab.20.1741941199592; Fri, 14 Mar 2025
 01:33:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250310-v5_user_cfi_series-v11-0-86b36cbfb910@rivosinc.com> <20250310-v5_user_cfi_series-v11-21-86b36cbfb910@rivosinc.com>
In-Reply-To: <20250310-v5_user_cfi_series-v11-21-86b36cbfb910@rivosinc.com>
From: Zong Li <zong.li@sifive.com>
Date: Fri, 14 Mar 2025 16:33:07 +0800
X-Gm-Features: AQ5f1JogaNhvTzIi-JULlyOhpNHglIVqmb85QzpCgn3yIvu9uGDNtiVJw3WLZ4A
Message-ID: <CANXhq0pynCvJ5bmPErTGiiO3-d0iXX8KyMZUFOH_tO7AYyytkw@mail.gmail.com>
Subject: Re: [PATCH v11 21/27] riscv: enable kernel access to shadow stack
 memory via FWFT sbi call
To: Deepak Gupta <debug@rivosinc.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Christian Brauner <brauner@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, Jann Horn <jannh@google.com>, 
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, alistair.francis@wdc.com, 
	richard.henderson@linaro.org, jim.shu@sifive.com, andybnac@gmail.com, 
	kito.cheng@sifive.com, charlie@rivosinc.com, atishp@rivosinc.com, 
	evan@rivosinc.com, cleger@rivosinc.com, alexghiti@rivosinc.com, 
	samitolvanen@google.com, broonie@kernel.org, rick.p.edgecombe@intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_013320_357906_04517204 
X-CRM114-Status: GOOD (  18.06  )
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

T24gTW9uLCBNYXIgMTAsIDIwMjUgYXQgMTE6NDTigK9QTSBEZWVwYWsgR3VwdGEgPGRlYnVnQHJp
dm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBLZXJuZWwgd2lsbCBoYXZlIHRvIHBlcmZvcm0gc2hhZG93
IHN0YWNrIG9wZXJhdGlvbnMgb24gdXNlciBzaGFkb3cgc3RhY2suCj4gTGlrZSBkdXJpbmcgc2ln
bmFsIGRlbGl2ZXJ5IGFuZCBzaWdyZXR1cm4sIHNoYWRvdyBzdGFjayB0b2tlbiBtdXN0IGJlCj4g
Y3JlYXRlZCBhbmQgdmFsaWRhdGVkIHJlc3BlY3RpdmVseS4gVGh1cyBzaGFkb3cgc3RhY2sgYWNj
ZXNzIGZvciBrZXJuZWwKPiBtdXN0IGJlIGVuYWJsZWQuCj4KPiBJbiBmdXR1cmUgd2hlbiBrZXJu
ZWwgc2hhZG93IHN0YWNrcyBhcmUgZW5hYmxlZCBmb3IgbGludXgga2VybmVsLCBpdCBtdXN0Cj4g
YmUgZW5hYmxlZCBhcyBlYXJseSBhcyBwb3NzaWJsZSBmb3IgYmV0dGVyIGNvdmVyYWdlIGFuZCBw
cmV2ZW50IGltYmFsYW5jZQo+IGJldHdlZW4gcmVndWxhciBzdGFjayBhbmQgc2hhZG93IHN0YWNr
LiBBZnRlciBgcmVsb2NhdGVfZW5hYmxlX21tdWAgaGFzCj4gYmVlbiBkb25lLCB0aGlzIGlzIGFz
IGVhcmx5IGFzIHBvc3NpYmxlIGl0IGNhbiBlbmFibGVkLgo+Cj4gU2lnbmVkLW9mZi1ieTogRGVl
cGFrIEd1cHRhIDxkZWJ1Z0ByaXZvc2luYy5jb20+Cj4gLS0tCj4gIGFyY2gvcmlzY3Yva2VybmVs
L2FzbS1vZmZzZXRzLmMgfCAgNCArKysrCj4gIGFyY2gvcmlzY3Yva2VybmVsL2hlYWQuUyAgICAg
ICAgfCAxMiArKysrKysrKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCsp
Cj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvYXNtLW9mZnNldHMuYyBiL2FyY2gv
cmlzY3Yva2VybmVsL2FzbS1vZmZzZXRzLmMKPiBpbmRleCAwYzE4OGFhZjM5MjUuLjIxZjk5ZDU3
NTdiNiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9hc20tb2Zmc2V0cy5jCj4gKysr
IGIvYXJjaC9yaXNjdi9rZXJuZWwvYXNtLW9mZnNldHMuYwo+IEBAIC01MTUsNCArNTE1LDggQEAg
dm9pZCBhc21fb2Zmc2V0cyh2b2lkKQo+ICAgICAgICAgREVGSU5FKEZSRUdTX0E2LCAgICAgICAg
ICAgIG9mZnNldG9mKHN0cnVjdCBfX2FyY2hfZnRyYWNlX3JlZ3MsIGE2KSk7Cj4gICAgICAgICBE
RUZJTkUoRlJFR1NfQTcsICAgICAgICAgICAgb2Zmc2V0b2Yoc3RydWN0IF9fYXJjaF9mdHJhY2Vf
cmVncywgYTcpKTsKPiAgI2VuZGlmCj4gKyAgICAgICBERUZJTkUoU0JJX0VYVF9GV0ZULCBTQklf
RVhUX0ZXRlQpOwo+ICsgICAgICAgREVGSU5FKFNCSV9FWFRfRldGVF9TRVQsIFNCSV9FWFRfRldG
VF9TRVQpOwo+ICsgICAgICAgREVGSU5FKFNCSV9GV0ZUX1NIQURPV19TVEFDSywgU0JJX0ZXRlRf
U0hBRE9XX1NUQUNLKTsKPiArICAgICAgIERFRklORShTQklfRldGVF9TRVRfRkxBR19MT0NLLCBT
QklfRldGVF9TRVRfRkxBR19MT0NLKTsKPiAgfQo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tl
cm5lbC9oZWFkLlMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9oZWFkLlMKPiBpbmRleCAzNTZkNTM5N2Iy
YTIuLjYyNDQ0MDhjYTkxNyAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9oZWFkLlMK
PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9oZWFkLlMKPiBAQCAtMTY0LDYgKzE2NCwxMiBAQCBz
ZWNvbmRhcnlfc3RhcnRfc2JpOgo+ICAgICAgICAgY2FsbCByZWxvY2F0ZV9lbmFibGVfbW11Cj4g
ICNlbmRpZgo+ICAgICAgICAgY2FsbCAuTHNldHVwX3RyYXBfdmVjdG9yCj4gKyAgICAgICBsaSBh
NywgU0JJX0VYVF9GV0ZUCj4gKyAgICAgICBsaSBhNiwgU0JJX0VYVF9GV0ZUX1NFVAo+ICsgICAg
ICAgbGkgYTAsIFNCSV9GV0ZUX1NIQURPV19TVEFDSwo+ICsgICAgICAgbGkgYTEsIDEgLyogZW5h
YmxlIHN1cGVydmlzb3IgdG8gYWNjZXNzIHNoYWRvdyBzdGFjayBhY2Nlc3MgKi8KPiArICAgICAg
IGxpIGEyLCBTQklfRldGVF9TRVRfRkxBR19MT0NLCj4gKyAgICAgICBlY2FsbAo+ICAgICAgICAg
c2NzX2xvYWRfY3VycmVudAo+ICAgICAgICAgY2FsbCBzbXBfY2FsbGluCj4gICNlbmRpZiAvKiBD
T05GSUdfU01QICovCj4gQEAgLTMyMCw2ICszMjYsMTIgQEAgU1lNX0NPREVfU1RBUlQoX3N0YXJ0
X2tlcm5lbCkKPiAgICAgICAgIGxhIHRwLCBpbml0X3Rhc2sKPiAgICAgICAgIGxhIHNwLCBpbml0
X3RocmVhZF91bmlvbiArIFRIUkVBRF9TSVpFCj4gICAgICAgICBhZGRpIHNwLCBzcCwgLVBUX1NJ
WkVfT05fU1RBQ0sKPiArICAgICAgIGxpIGE3LCBTQklfRVhUX0ZXRlQKPiArICAgICAgIGxpIGE2
LCBTQklfRVhUX0ZXRlRfU0VUCj4gKyAgICAgICBsaSBhMCwgU0JJX0ZXRlRfU0hBRE9XX1NUQUNL
Cj4gKyAgICAgICBsaSBhMSwgMSAvKiBlbmFibGUgc3VwZXJ2aXNvciB0byBhY2Nlc3Mgc2hhZG93
IHN0YWNrIGFjY2VzcyAqLwo+ICsgICAgICAgbGkgYTIsIFNCSV9GV0ZUX1NFVF9GTEFHX0xPQ0sK
PiArICAgICAgIGVjYWxsCj4gICAgICAgICBzY3NfbG9hZF9jdXJyZW50Cj4KPiAgI2lmZGVmIENP
TkZJR19LQVNBTgo+CkxHVE0uCgpSZXZpZXdlZC1ieTogWm9uZyBMaSA8em9uZy5saUBzaWZpdmUu
Y29tPgo+IC0tCj4gMi4zNC4xCj4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
