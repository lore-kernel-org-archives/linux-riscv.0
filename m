Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08FA6D3B7E5
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Dec 2025 01:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9iE/jThU2YobuC4NSjK1eShbUgt3wlpcx5Tia63HOpE=; b=f3NN8yhyvHkHMV
	zV9CB2JD0edRK/k9niiDK9U9z3oLE/aHPyEgk+XnoBuMzmHDtonsQodTdgw+su5VxAajWIKV5FlrX
	nf+x5hcmmgA9og2kbkGeGIjT47XTb/xRmwvKxkmUbQpMkiqv5TpvUlJsin1ZAFRue0z2M0PYCxZdX
	RQjfzUqEzaTfBPNmN40MBu0Xfktuy2L6Ivo+JPmUVHM7O+sMf7E4dfGfjpzzzqB49Tq3YTit6lJW0
	m0BGdtHbYh0gp/3ty4wyMB/AZeRyfIPAIIhBLeNeqR0ecqyoNNPpSz+9gt0xknMQl/1U1XQsxShWC
	MpMs3Kj7dhzKhC3d4Nuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va21z-00000003Bx2-3t1A;
	Mon, 29 Dec 2025 01:26:43 +0000
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va21x-00000003BwC-0ptD
	for linux-riscv@lists.infradead.org;
	Mon, 29 Dec 2025 01:26:42 +0000
Received: by mail-qt1-x843.google.com with SMTP id d75a77b69052e-4ed7024c8c5so72393171cf.3
        for <linux-riscv@lists.infradead.org>; Sun, 28 Dec 2025 17:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766971600; x=1767576400; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rGBP3a20VsxawgAkzyf8iorKbTSNb1d+2RoMt317030=;
        b=ldSxUAPJJu9N78bV58jvZzUsWYiRD6yFeLsRD3mXcm+Al9wGVdrFK5E3ZaI+yI1Cvz
         3APKSLSJDvEIqZzLaekUA0qJxw8PHh4N7VZg0azNtM5P5tKIkklN4H/BfeHxzssvjiq8
         pRIohDyzUAus9xHuHaBwFKKDN5HbxLrLlPWNOV0H3zITf9CWQEhjsmGllbr0BH5NPJMN
         Iw1cR6LrpbKMD/hinI3jl8NrpyrHHM9swj6XAWhH5+L4Zx6Y2A0h2KkVn4IXZyaPT8G7
         vCJDJOxhbv9ZDrDlnRo1EzC7rJLB0/faPRoHs0sxVTA0mpga2YrWK/5/3jVjoBuVms6b
         GjCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766971600; x=1767576400;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rGBP3a20VsxawgAkzyf8iorKbTSNb1d+2RoMt317030=;
        b=j84b4IYdqp8XlN7oHw3qLVy15pU6RqFHaOKk+X1xuLIErX/sD5spNK24aywaHGP4RC
         92w3r7k9aUQHAmZoZWT8GYt1dSvEfNZnoV9yOdaYz0diBTsMmina9q2vdnrbpOoACfgU
         qMDL+GyiJJ4sS9gl6k0GfsUOeyRmIMsHbg2pVkYa/cBspfBmwyoVp4BCX6gRThqXMB4y
         XD4v+0JE30kbuU35Ld9eOZlRmIbPuvf75yD4sLoKbKdH7+uPqwag8iJGsnkPpsqtCEBI
         bX3mF5x9ugQCWZl8kcLufSQftKTKM0DX2sTDLyIFpjxeXpLU3dP512FIZSDc9puNmI/A
         i4Wg==
X-Forwarded-Encrypted: i=1; AJvYcCV07qUA1U2h6941la8W7MxtOcSISSp7KRqgo0AXICjIAQz1/OM+e6VR5vnr2OSHV3VL4fLH0bJ8w6Atwg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyb+KqDi5L0Lm1B2VsWXkhAbJvw2Vvsut8BUIOb7h8ypi/gqg0Z
	o/I+3gzwumHdCRdzMWLyNXCZSuvbeEhkbtYz2KCFap/El2uaWd1GgtL5gRIP2jJM8TBdKF1ebDB
	JnrzaiHA=
X-Gm-Gg: AY/fxX4h3VPeyfVjleqoJkJzTM3pZ0iANvV7XpSoxS5b6k7F+SCqwzvpDNDTEJ3s64U
	Iz6tJKeryPFILpw/3IdSb05ZcTA2UN+OufeNmqhcMOIgPNsoxRHvp7jWRme/tvIE6tzi+Nccc+c
	Rc0Bs2zjj8rgUwRKL3jMPhh1UFOr/PfOZFHbBGgmYGbkwBQDX72Y6Swxb7mDmwmK/twIMNp0A+n
	YFr/JWs9kJGLFuBP6I86NXYPIda9LUY/J2Y1lNYZQAS7pZSJl6wb4eJsIuri347IbFvcqSLxe48
	bESKHJmW6O0IAkKJ0f1Nz0gSi6/q5X6oDJZD8AgD1ojDr/7ekLqWcfHTjL1/ON54AzU2H9uyKUn
	8ZLkki5umsZ17YgBGyBOtJ48RD5XYtgM03LDTbqcTw0aLWEaZvlbuLA1U6uDYz+j7ThOszSgKHG
	/m6Qjdatq7oc07CjKC9i96W4jlhxJHIsvOp0S7l5s+zcP8LgLB2eQ=
X-Google-Smtp-Source: AGHT+IGEzqpbI6AbapIJlA3Uz+KnswrSFec0YE5rCA81t7vFfgvpfz5067CC+VvdDzEo7yRutO/rPA==
X-Received: by 2002:a05:622a:230d:b0:4f1:e8f1:cbda with SMTP id d75a77b69052e-4f4abd839edmr436267011cf.54.1766971599661;
        Sun, 28 Dec 2025 17:26:39 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4ac531fa8sm204081481cf.4.2025.12.28.17.26.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Dec 2025 17:26:39 -0800 (PST)
Message-ID: <ccf5c43c-c7d3-4c89-b578-b40d32dc5b7c@riscstar.com>
Date: Sun, 28 Dec 2025 19:26:36 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/13] dt-bindings: riscv: Add B ISA extension
 description
To: Guodong Xu <guodong@riscstar.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Samuel Holland <samuel.holland@sifive.com>, Anup Patel
 <anup@brainfault.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
 Yangyu Chen <cyy@cyyself.name>, Paul Walmsley <paul.walmsley@sifive.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
 Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 spacemit@lists.linux.dev, linux-serial@vger.kernel.org
References: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
 <20251222-k3-basic-dt-v2-7-3af3f3cd0f8a@riscstar.com>
 <20251222-stitch-preachy-3fab87fd6f0f@spud>
 <CAH1PCMZ7ywZ3unLy0yHYK+fFHk0y=q2cEtPnRi=qSpf=fc75rw@mail.gmail.com>
 <66c0676a-7920-4825-b916-3c00b1648a08@riscstar.com>
 <CAH1PCMbBURb=DpChf+Y-DjYjzpXG-pKgoaHAu=TUuG4oVC56cg@mail.gmail.com>
 <5979c8ef-b0fa-40c8-944d-96e226fbcbe8@riscstar.com>
 <CAH1PCMZkQ11-Uk5GnyetLkNLOuO3gs2o0WPWHrFMWVH9R6s8mQ@mail.gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <CAH1PCMZkQ11-Uk5GnyetLkNLOuO3gs2o0WPWHrFMWVH9R6s8mQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_172641_251819_2F8355CA 
X-CRM114-Status: GOOD (  20.13  )
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

T24gMTIvMjgvMjUgNzowOCBQTSwgR3VvZG9uZyBYdSB3cm90ZToKPiBPbiBNb24sIERlYyAyOSwg
MjAyNSBhdCA3OjUw4oCvQU0gQWxleCBFbGRlciA8ZWxkZXJAcmlzY3N0YXIuY29tPiB3cm90ZToK
Pj4KPj4gT24gMTIvMjcvMjUgODo1MSBQTSwgR3VvZG9uZyBYdSB3cm90ZToKPj4+PiBUaGF0J3Mg
d2hhdCBJIHVuZGVyc3RhbmQgaXQgdG8gbWVhbiwgYW55d2F5Lgo+Pj4+ICAgICAgaHR0cHM6Ly9n
aXRodWIuY29tL3Jpc2N2L3Jpc2N2LWIKPj4+Pgo+Pj4+IFRoZXJlJ3Mgbm8gcG9pbnQgaW4gc3Vw
cG9ydGluZyAiYiIgaW4gZGV2aWNldHJlZSB0byByZXByZXNlbnQKPj4+PiB0aGUgb3RoZXJzIGlm
IGl0IGFsc28gcmVxdWlyZXMgdGhlIG90aGVycyB0byBiZSBwcmVzZW50Lgo+Pj4+Cj4+Pj4gSSB0
aGluayB0aGF0LCBpbnN0ZWFkLCAiYiIsICJ6YmEiLCAiemJiIiwgYW5kICJ6YnMiIHNob3VsZCBh
bGwKPj4+PiBiZSBhbGxvd2VkLgo+Pj4+Cj4+Pj4gSSBtaWdodCBldmVuIGdvIGZ1cnRoZXIgYW5k
IGhhcmRlbiB0aGUgcmVxdWlyZW1lbnQsIHNheWluZyB0aGF0Cj4+Pj4gaWYgeW91IHNwZWNpZnkg
ImIiIHlvdSBzaG91bGQqbm90KiBzcGVjaWZ5ICJ6YmEiLCAiemJiIiwgb3IgInpicyIuCj4+PiBI
aXN0b3JpY2FsIHJlYXNvbnMgaGVyZS4gImIiIGNhbWUgdG9vIGxhdGUuIFRoZSBjaGlwIHZlbmRv
cnMgaGF2ZSBwdWJsaXNoZWQKPj4+IGNvcmVzIHdpdGggInpiYSIsICJ6YmIiLCBhbmQgInpicyJh
bHJlYWR5Lgo+Pj4KPj4+IFRoYXQncyBhIG1pZ3JhdGlvbiBicmlkZ2UgdG8gcmVxdWlyZSAiYiIg
bXVzdCBiZSBsaXN0ZWQKPj4+IHRvZ2V0aGVyIHdpdGggdGhlIG90aGVyIHRocmVlLgo+Pgo+PiBB
cmUgeW91IHNheWluZyAiYiIgaGFzIGFscmVhZHkgYmVlbiBpbmNsdWRlZCB3aXRoICJ6YmEiLCAi
emJiIiwgYW5kCj4+ICJ6YnMiIGluIGFuIGV4aXN0aW5nIERUUyBmaWxlPwo+IAo+IAo+IFRoZSBy
aXNjLXYgcmF0aWZpY2F0aW9uIHRpbWVsaW5lIGlzOgo+ICJiIiB3YXMgcmF0aWZpZWQgaW4gQXBy
LzIwMjQsIHdoaWNoIGlzIGFib3V0IDIgeWVhcnMgbGF0ZXIgdGhhbiBpdHMKPiBjb21wb25lbnRz
IHpiYS96YmIvemJzICh0aGVzZSB3ZXJlIHJhdGlmaWVkIGluIEp1bi8yMDIxKS4KPiAKPiBJIGNh
biBkbyB0aGlzIGluIGxpbnV4IGtlcm5lbCwgd3JpdGluZyBhIGR0cyBmaWxlIHdoaWNoIGNvbnRh
aW5zIG9ubHkgImIiLAo+IGJ1dCBubyB6YmEvemJiL3picy4gVGhlIGxpbnV4IGtlcm5lbCBjYW4g
Y29ycmVjdGx5IGV4dGVuZCAiYiIgdG8gemJhL3piYi96YnMuCj4gcHM6IGFmdGVyIEkgb3Igc29t
ZWJvZHkgYWRkcyB0aGUgbG9naWMgaW50byBjcHVmZWF0dXJlLmMuCgpZZXMsIHRoaXMgcGFydCBJ
IHVuZGVyc3RhbmQuICAoWWVzLCBkbyB0aGF0Li4uKQoKPiBIb3dldmVyLCB0aGUgcHJvYmxlbSBp
cyB3aXRoIHRoZSBvbGRlciBzb2Z0d2FyZSB3aG8gcmV1c2Uga2VybmVsJ3MgRFRTIGZpbGVzLAo+
IGFuZCByZWNvZ25pemVzIG9ubHkgJ3piYS96YmIvemJzJy4gKElmIHlvdSBzZWFyY2ggaW4gdGhl
IHJpc2N2L2Jvb3QvZHRzLAo+IHlvdSB3aWxsIG5vdGljZSBhIGxvdCBwbGF0Zm9ybXMgc3VwcG9y
dHMgemJhL3piYi96YnMuKQo+IAo+IFdoZW4gdGhlcmUgaXMgb25seSAiYiIsIHRoZXNlIG9sZGVy
IHNvZnR3YXJlIG1heSBqdXN0IGRpc2FibGUgdGhlIGZlYXR1cmVzCj4gcmVsYXRlZCB0byAnemJh
L3piYi96YnMnLCBiZWNhdXNlIHdoZW4gdGhleSBkZXZlbG9wZWQgdGhlaXIgZmVhdHVyZSwKPiAi
YiIgZG9lc24ndCBleGlzdCB5ZXQuCgpZZXMsIG9sZCBEVFMgZmlsZXMgY2FuIGFuZCB3aWxsIGNv
bnRpbnVlIHRvIHNwZWNpZnkKInpiYSt6YmIremJzIi4gIEJ1dCB0aG9zZSBvbGQgRFRTIGZpbGVz
IGFyZSBub3QgZXhwZWN0ZWQKdG8gYmUgY2hhbmdlZCB0byByZXBsYWNlICJ6YmEremJiK3picyIg
d2l0aCBqdXN0ICJoIi4KCk9uY2UgImNwdWZlYXR1cmUuYyIgc3VwcG9ydHMgdGhlICJoIiBleHRl
bnNpb24sIHRoZQpzb2Z0d2FyZSBzdXBwb3J0cyBlaXRoZXIgb25lOiAgImgiIG9yICJ6YmEremJi
K3picyIuCgpUaGUga2V5IHBvaW50IEknbSB0cnlpbmcgdG8gbWFrZSBpcyB0aGF0IHRoZSBiaW5k
aW5nCnNob3VsZCBub3QgcmVxdWlyZSAiemJhK3piYit6YnMiIHRvIHN1cHBsaWVkICpvbiB0b3Ag
b2YqCnRoZSAiaCIgaW4gdGhlIGxpc3Qgb2YgQ1BVIGV4dGVuc2lvbnMuICBPbmx5IG9uZSBvciB0
aGUKb3RoZXIgc2hvdWxkIGJlIHN1ZmZpY2llbnQuICBBbmQgSSB0aGluayB5b3VyIGJpbmRpbmcK
d2FzIHNheWluZyAiaWYgImgiIHRoZW4gcmVxdWlyZWQgInpiYSt6YmIremJzIi4KCj4gSG9wZWZ1
bGx5IEkgZXhwbGFpbmVkIHRoZSBsb2dpYyBjbGVhciB0aGlzIHRpbWUuCgpJIHRoaW5rIHlvdSBo
YXZlIGRvbmUgeW91ciBiZXN0LiAgSSBob3BlIEknbSBub3QganVzdCBiZWluZwpkZW5zZS4KCgkJ
CQkJLUFsZXgKCj4gQlIsCj4gR3VvZG9uZwo+IAo+Pgo+PiBXaGF0IEknbSBzdWdnZXN0aW5nIGlz
IHRoYXQgKHVubGVzcyBzb21lb25lIGhhcyBhbHJlYWR5IGRvbmUgdGhpcyBpbgo+PiBhIERUUyBm
aWxlKSwgdGhlcmUgaXMgbm8gcmVhc29uIHRvIHJlcXVpcmUgImIiICphbmQqIHRoZSBvdGhlciB0
aHJlZS4KPj4gWW91IHNob3VsZCBhbGxvdyBlaXRoZXIgImIiICpvciogYWxsIG9mIHRoZSBvdGhl
ciB0aHJlZSwgbm90IGJvdGguCj4+IFRoYXQgd291bGQgc3VwcG9ydCBvbGRlciBwbGF0Zm9ybXMg
YXMgd2VsbCBhcyBuZXdlciBvbmVzIHRoYXQgdXNlCj4+IHRoZSBtb3JlIGNvbmNpc2UgImIiIG9u
bHkuCj4+Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLUFsZXgK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
