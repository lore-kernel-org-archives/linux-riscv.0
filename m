Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C8DFEE498F
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Dec 2025 17:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uRWKWECKxHcwJNadXqEYawtEcya0IVpawhrH18AE5Uk=; b=3VdtFNIdihj4/+
	Q3BbGDDhJlLWLv6IhzBEl65I0+5XZb7CeYyLTnb1gndLGJbJNa5fAvrHhyh4zbJq6Uu8T9OObCjcE
	fVW2M/WkYT7vXmYNtHQ4r/SHhamy/MmyIYp4nQYd2n4nao6BM5N5Eomsps6OleHm148VPvJnGC/AK
	OnODOO6h0vm+9MXwQqne6Qb4SGzWtrZDSJFksREePegWNhDiXFJvJYWrwb6A1QLzAjphopifp6sm1
	uLAA//djspH+DrOAmEArM3lTy8yJhdjtERVkC2ZAzp+42QJ5BRKsL7lzZgUVZ3Pf4CXwZ5HPlQxjb
	mSyJ4/U9NjAmaYtU7w7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vadX7-000000057tG-3EDF;
	Tue, 30 Dec 2025 17:29:21 +0000
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vadX4-000000057sV-3RLd
	for linux-riscv@lists.infradead.org;
	Tue, 30 Dec 2025 17:29:20 +0000
Received: by mail-qk1-x742.google.com with SMTP id af79cd13be357-8bb6a27d3edso1027681785a.3
        for <linux-riscv@lists.infradead.org>; Tue, 30 Dec 2025 09:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767115757; x=1767720557; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ClCUh7zsnhsbA19JnDKkm5LuPYmbeU70s0bhWy9c0/U=;
        b=KsBQOjglRNO8W5LBEJdH5FOZEcfeQ2Jv72cSw8yYkuLOd6e5wZMvgN6cWMuD4YwIBs
         JklCiYz57t+3/ldVf1bn2trzUHb0XqoAiyd6/m1dSYtdK1/eJTynYTz58NM5Nn2N8Ghe
         ocVeHdCYS0Wl5qZDjzdFKUT2EZPNX+cnLsQVdVAhjNF2xlKlAqeX2Y0NzSX718LvEaXt
         vA3y8na8jPac+y/N0uJNRrC7DnmOe17Xf1agFiym8YY8zHm7cQzif+OjwfPZaG96Ixt5
         os+hlTSTaEEMjxnVMn8Ur3fySrEg9z9+/oLFaCeT/XGp4T2VJs/FHFFZVWG/aRV/vPlq
         aM+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767115757; x=1767720557;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ClCUh7zsnhsbA19JnDKkm5LuPYmbeU70s0bhWy9c0/U=;
        b=TuPgXrmrUKQdJsYks2HICVnsm+DHJ30UH0JrANxkgZhYCLwtqazaGOvZZ+n1sA2R3y
         Ptjczj5PXGB9c5lTtf2seYK+FbYTMwvIl7/a0ByGgMoGGN+FHwZfifh2a0PKkZMob0Tp
         AJSHfjCIR5rGICLbdSa8hTCQNlZmMGhMJ/Dlbwut+n7CAtHu2+GLlwPqCZQN8VhBN4/M
         aQj2ets3AKiNSdKUD3Bw9RarzSE2gl9EGKdZo7++LibbKOUq0wJ90og2eodaCC64mfXF
         4L2FnUFDlyvZiS0YMjBSg9yhZy4zgiObqr/5Mkp9sDZgfcoxZ6rYG/+wcskI7676acjG
         SRqA==
X-Forwarded-Encrypted: i=1; AJvYcCVlGbqfBtiOdR7vta0AxU1zjXWtt49Xafunzmp0q0Tz2grzllxqztMSdizhLcsX4Nd5BjEYAvj//Vqc3A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwOqSRoD2ipHlYRZGPyzS21Pr1pbFZDG34HBYK/FVtbWhcZWX1i
	HnACZHOwsS944QjbVsaR4UrmHlD2KyAq7ce6FctUyXFGJcFWshER5PotfwtkMBBAsis=
X-Gm-Gg: AY/fxX45M2Ln1Ys5wu6LsvZik0hZOCVbY28WjjFOxgRQ4WhUBxgZXWDtzWbOpHNf2cZ
	ClMftVhimAqWNHEbElyCuqMouyV1sfx4cJVJf1U6UNZdJI2h3g6EyELXZmFSk7ob6Z/T/UECSYE
	mBS+MIYi2+UuodezN8RyooxciXq+TN+ncvmR/FcC0SM6TwU5cjv5753YJ/wbf8J5Lai0JSwa+6W
	ohyxZaX55lInKmLJqwUj7iRS81nclRhqCOWv6GSKqHX4CqaY7s2qrHGCURfWj9z6HloUvz0/R3n
	23ZMudp6sYSLgwz5GdxgvBz47tok0ykU4eA53ILmMqZwTtDYcAaZBW8KV3ZRmH9phEizbXVH5v4
	NPveR6ghkaQ0+vQb/uXyi0baGkpG38VByZpdjp2P4ysDjLmn33pt+X/YUtmRJDOimehMLy6uI8n
	kOleE+Lz58ynECZX8WjWv4ACvALCSHCzNVBUBGdTpp6xZr06bqbHAzxHPwxQiwgg==
X-Google-Smtp-Source: AGHT+IGPvUHSrmG9Ie9qzS3Ctu9VIUpR8C4eEU8Vq5QeEjI1H5P+1EGVldpe9Aku9nrcc2iPrnzPyg==
X-Received: by 2002:a05:620a:4620:b0:892:a71a:c02 with SMTP id af79cd13be357-8c08f666f7dmr5034992285a.23.1767115757254;
        Tue, 30 Dec 2025 09:29:17 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c0975ee7bfsm2551055585a.51.2025.12.30.09.29.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 09:29:16 -0800 (PST)
Message-ID: <dc87a3c0-8627-4328-a17a-6510ee8245ac@riscstar.com>
Date: Tue, 30 Dec 2025 11:29:14 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/13] dt-bindings: riscv: Add B ISA extension
 description
To: Conor Dooley <conor@kernel.org>
Cc: Guodong Xu <guodong@riscstar.com>, Rob Herring <robh@kernel.org>,
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
 <20251230-imprison-sleet-6b5a1e26d34b@spud>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20251230-imprison-sleet-6b5a1e26d34b@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_092919_175980_177958AB 
X-CRM114-Status: GOOD (  27.70  )
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

T24gMTIvMzAvMjUgMTE6MDkgQU0sIENvbm9yIERvb2xleSB3cm90ZToKPiBPbiBGcmksIERlYyAy
NiwgMjAyNSBhdCAwMzoyODoyNVBNIC0wNjAwLCBBbGV4IEVsZGVyIHdyb3RlOgo+PiBPbiAxMi8y
My8yNSAxMjo1MSBBTSwgR3VvZG9uZyBYdSB3cm90ZToKPj4+IEhpLCBDb25vcgo+Pj4KPj4+IE9u
IFR1ZSwgRGVjIDIzLCAyMDI1IGF0IDU6MTfigK9BTSBDb25vciBEb29sZXkgPGNvbm9yQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Pj4+Cj4+Pj4gT24gTW9uLCBEZWMgMjIsIDIwMjUgYXQgMDk6MDQ6MTdQ
TSArMDgwMCwgR3VvZG9uZyBYdSB3cm90ZToKPj4+Pj4gQWRkIGRlc2NyaXB0aW9uIG9mIHRoZSBz
aW5nbGUtbGV0dGVyICJCIiBleHRlbm5zaW9uIGZvciBCaXQgTWFuaXB1bGF0aW9uLgo+Pj4+PiBC
IGlzIG1hbmRhdG9yeSBmb3IgUlZBMjNVNjQuCj4+Pj4+Cj4+Pj4+IFRoZSBCIGV4dGVuc2lvbiBp
cyByYXRpZmllZCBpbiB0aGUgMjAyNDA0MTEgdmVyc2lvbiBvZiB0aGUgdW5wcml2aWxlZ2VkCj4+
Pj4+IElTQSBzcGVjaWZpY2F0aW9uLiBBY2NvcmRpbmcgdG8gdGhlIHJhdGlmaWVkIHNwZWMsICJ0
aGUgQiBzdGFuZGFyZAo+Pj4+PiBleHRlbnNpb24gY29tcHJpc2VzIGluc3RydWN0aW9ucyBwcm92
aWRlZCBieSB0aGUgWmJhLCBaYmIsIGFuZCBaYnMKPj4+Pj4gZXh0ZW5zaW9ucy4KPj4+Pj4KPj4+
Pj4gSGVuY2UgYWRkIGEgc2NoZW1hIGNoZWNrIHJ1bGUgdG8gZW5mb3JjZSB0aGF0IEIgaW1wbGll
cyBaYmEsIFpiYiBhbmQgWmJzLgo+Pj4+Pgo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBHdW9kb25nIFh1
IDxndW9kb25nQHJpc2NzdGFyLmNvbT4KPj4+Pj4gLS0tCj4+Pj4+IHYyOiBOZXcgcGF0Y2guCj4+
Pj4+IC0tLQo+Pj4+PiAgICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25z
LnlhbWwgICAgICAgICB8IDE5ICsrKysrKysrKysrKysrKysrKysKPj4+Pj4gICAgMSBmaWxlIGNo
YW5nZWQsIDE5IGluc2VydGlvbnMoKykKPj4+Pj4KPj4+Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sCj4+Pj4+IGlu
ZGV4IDU2NWNiMmNiYjQ5YjU1Mjk1OTM5MjgxMGE5YjczMWI0MzM0NmE1OTQuLjM4NWUxZGViMjM5
OTZkMjk0ZTc2NjI2OTNmMTI1N2Y5MTBhNmUxMjkgMTAwNjQ0Cj4+Pj4+IC0tLSBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwKPj4+Pj4gKysr
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFt
bAo+Pj4+PiBAQCAtMTA5LDYgKzEwOSwxMyBAQCBwcm9wZXJ0aWVzOgo+Pj4+PiAgICAgICAgICAg
ICAgICBUaGUgc3RhbmRhcmQgQyBleHRlbnNpb24gZm9yIGNvbXByZXNzZWQgaW5zdHJ1Y3Rpb25z
LCBhcyByYXRpZmllZCBpbgo+Pj4+PiAgICAgICAgICAgICAgICB0aGUgMjAxOTEyMTMgdmVyc2lv
biBvZiB0aGUgdW5wcml2aWxlZ2VkIElTQSBzcGVjaWZpY2F0aW9uLgo+Pj4+Pgo+Pj4+PiArICAg
ICAgICAtIGNvbnN0OiBiCj4+Pj4+ICsgICAgICAgICAgZGVzY3JpcHRpb246Cj4+Pj4+ICsgICAg
ICAgICAgICBUaGUgc3RhbmRhcmQgQiBleHRlbnNpb24gZm9yIGJpdCBtYW5pcHVsYXRpb24gaW5z
dHJ1Y3Rpb25zLCBhcwo+Pj4+PiArICAgICAgICAgICAgcmF0aWZpZWQgaW4gdGhlIDIwMjQwNDEx
IHZlcnNpb24gb2YgdGhlIHVucHJpdmlsZWdlZCBJU0EKPj4+Pj4gKyAgICAgICAgICAgIHNwZWNp
ZmljYXRpb24uIFRoZSBCIHN0YW5kYXJkIGV4dGVuc2lvbiBjb21wcmlzZXMgaW5zdHJ1Y3Rpb25z
Cj4+Pj4+ICsgICAgICAgICAgICBwcm92aWRlZCBieSB0aGUgWmJhLCBaYmIsIGFuZCBaYnMgZXh0
ZW5zaW9ucy4KPj4+Pj4gKwo+Pj4+PiAgICAgICAgICAgIC0gY29uc3Q6IHYKPj4+Pj4gICAgICAg
ICAgICAgIGRlc2NyaXB0aW9uOgo+Pj4+PiAgICAgICAgICAgICAgICBUaGUgc3RhbmRhcmQgViBl
eHRlbnNpb24gZm9yIHZlY3RvciBvcGVyYXRpb25zLCBhcyByYXRpZmllZAo+Pj4+PiBAQCAtNzM1
LDYgKzc0MiwxOCBAQCBwcm9wZXJ0aWVzOgo+Pj4+PiAgICAgICAgICAgIHRoZW46Cj4+Pj4+ICAg
ICAgICAgICAgICBjb250YWluczoKPj4+Pj4gICAgICAgICAgICAgICAgY29uc3Q6IGYKPj4+Pj4g
KyAgICAgICMgYiBjb21wcmlzZXMgdGhlIGZvbGxvd2luZyBleHRlbnNpb25zCj4+Pj4+ICsgICAg
ICAtIGlmOgo+Pj4+PiArICAgICAgICAgIGNvbnRhaW5zOgo+Pj4+PiArICAgICAgICAgICAgY29u
c3Q6IGIKPj4+Pgo+Pj4+IFdoYXQncyB0aGUgdmFsdWUgaW4gYWRkaW5nIGIsIGlmIGl0IGRlcGVu
ZHMgb24gaGF2aW5nIGFsbCAzIG9mIHRoZQo+Pj4+IGNvbXBvbmVudHMgZGVmaW5lZCBpbmRpdmlk
dWFsbHkgdG9vPyBDdXJyZW50bHkgYWxsICJzdXBlcnNldCIgdHlwZXMgb2YKPj4+PiBleHRlbnNp
b25zIGFyZSBwZXJtaXR0ZWQgd2l0aG91dCB0aGVpciBjb21wb25lbnQgcGFydHMgYWxzbyBiZWlu
ZyBkZWZpbmVkLAo+Pj4+IHRoaXMgZG9lc24ndCBmb2xsb3cgY29udmVudGlvbiBhbmQgdGhlcmVm
b3JlIG5lZWRzIHRvIGJlIGV4cGxhaW5lZC4KPj4+Pgo+Pj4+IFlvdSBvYnZpb3VzbHkgbmVlZCB0
aGlzIGNvbnN0cnVjdCBiZWNhdXNlIHRoZSBrZXJuZWwgZG9lcyBub3QgdW5kZXJzdGFuZAo+Pj4+
ICJiIiwgYW5kIGV2ZW4gaWYgeW91IGFkZGVkIHN1cHBvcnQgZm9yIGludGVycHJldGluZyAiYiIg
dG8gdGhlIGtlcm5lbAo+Pj4+IHRoaXMgaXMgcHJvYmFibHkgc3RpbGwgbmVlZGVkIHRvIG1ha2Ug
c3VyZSB0aGUgQUJJIGlzIG1haW50YWluZWQgZm9yCj4+Pj4gYW55dGhpbmcgaW1wb3J0aW5nIGEg
ZGV2aWNldHJlZSBmcm9tIHRoZSBrZXJuZWwuCj4+Pgo+Pj4gWWVzLCBleGFjdGx5LiBVbmxpa2Ug
b3RoZXIgc2luZ2xlLWxldHRlciBleHRlbnNpb25zLCAiYiIgd2FzIHJhdGlmaWVkCj4+PiAoQXBy
LzIwMjQpIG11Y2ggbGF0ZXIgdGhhbiBpdHMgY29tcG9uZW50cyB6YmEvemJiL3picyAoSnVuLzIw
MjEpLgo+Pj4gRXhpc3Rpbmcgc29mdHdhcmUgYW5kIHRoZSBrZXJuZWwgYWxyZWFkeSBleHBlY3Qg
dGhlc2UgZXhwbGljaXQgY29tcG9uZW50Cj4+PiBzdHJpbmdzLCBzbyBlbmZvcmNpbmcgdGhpcyBk
ZXBlbmRlbmN5IGVuc3VyZXMgY29yZXMgZGVjbGFyaW5nICJiIiB3aWxsCj4+PiBhbHNvIGJlIGNv
cnJlY3RseSB1bmRlcnN0b29kIGJ5IG9sZGVyIHNvZnR3YXJlIHRoYXQgb25seSBsb29rcyBmb3IK
Pj4+IHpiYS96YmIvemJzLgo+Pgo+PiBJIG1pZ2h0IGJlIG1pc3VuZGVyc3RhbmRpbmcgeW91LCBi
dXQgSSBkb24ndCB0aGluayBleHRlbnNpb24gImIiCj4+IHNob3VsZCAqcmVxdWlyZSogdGhlIG90
aGVyIHRocmVlIGV4dGVuc2lvbnMuICBJbnN0ZWFkLCB0aGUgImIiCj4+IGV4dGVuc2lvbiBzaG91
bGQgYmUgY29uc2lkZXJlZCAqZXF1aXZhbGVudCogdG8gdGhlIG90aGVyIHRocmVlLgo+PiBUaGF0
J3Mgd2hhdCBJIHVuZGVyc3RhbmQgaXQgdG8gbWVhbiwgYW55d2F5Lgo+PiAgICBodHRwczovL2dp
dGh1Yi5jb20vcmlzY3YvcmlzY3YtYgo+Pgo+PiBUaGVyZSdzIG5vIHBvaW50IGluIHN1cHBvcnRp
bmcgImIiIGluIGRldmljZXRyZWUgdG8gcmVwcmVzZW50Cj4+IHRoZSBvdGhlcnMgaWYgaXQgYWxz
byByZXF1aXJlcyB0aGUgb3RoZXJzIHRvIGJlIHByZXNlbnQuCj4gCj4gVGhlIGRlcGVuZGVuY3kg
Y2FuIGJlIGdvIGJvdGggd2F5cywgdG8gYWxzbyBtYWtlIHNwZWNpZnlpbmcgImIiIG1hbmRhdG9y
eQo+IHdoZW4gdGhlIHRocmVlIGNvbXBvbmVudHMgYXJlLiBUaGF0IHByb2JhYmx5IHByb2R1Y2Vz
IHRoZSBtb3N0IGhlbHBmdWwKPiBkZXZpY2V0cmVlIHVsdGltYXRlbHkuCgpXaGF0IGFib3V0IERU
IGZpbGVzIHRoYXQgc3BlY2lmaWVkIHpiYSt6YmIremJzIGJlZm9yZSAiYiIgd2FzCnJhdGlmaWVk
PwoKPj4gSSB0aGluayB0aGF0LCBpbnN0ZWFkLCAiYiIsICJ6YmEiLCAiemJiIiwgYW5kICJ6YnMi
IHNob3VsZCBhbGwKPj4gYmUgYWxsb3dlZC4KPiAKPj4gSSBtaWdodCBldmVuIGdvIGZ1cnRoZXIg
YW5kIGhhcmRlbiB0aGUgcmVxdWlyZW1lbnQsIHNheWluZyB0aGF0Cj4+IGlmIHlvdSBzcGVjaWZ5
ICJiIiB5b3Ugc2hvdWxkICpub3QqIHNwZWNpZnkgInpiYSIsICJ6YmIiLCBvciAiemJzIi4KPj4g
QnV0IHRoYXQgbWlnaHQgbm90IGJlIG5vcm1hbCBwcmFjdGljZSwgYW5kIGl0J3Mgbm90IG5lY2Vz
c2FyeQo+PiBiZWNhdXNlIHRoZXkgYXJlbid0IGluIGNvbmZsaWN0Lgo+IAo+IEkgZGlzYWdyZWUg
Y29tcGxldGVseSB3aXRoIHRoaXMgImV2ZW4gZnVydGhlciIsIHNpbmNlIHRoYXQncyBwb3RlbnRp
YWxseQo+IGFjdGl2ZWx5IGhhcm1mdWwgdG8gaW1wb3J0ZXJzIG9mIGtlcm5lbCBkZXZpY2V0cmVl
cy4KClRoaXMgaXMgcmVsYXRlZCB0byBvbmUgb2YgdGhlIHRoaW5ncyBJIG1lbnRpb25lZCB0byBS
b2IgdGhhdCBJCndhbnRlZCB0byBkaXNjdXNzLgoKVGhpcyB0eXBlIG9mICJlcXVpdmFsZW50IiBl
eHRlbnNpb24gaXMgcHJvYmxlbWF0aWMgZm9yIERULCBvciBJCmd1ZXNzLCBpdCBkb2Vzbid0IHJl
YWxseSBhZGQgYW55IHZhbHVlLiAgSSdtIHN1cmUgdGhlIHBlb3BsZQpyYXRpZnlpbmcgImIiIHRv
IGJlIGVxdWl2YWxlbnQgdG8gInpiYSt6YmIremJzIiBpbnRlbmQgZm9yIGl0CnRvIHNpbXBsaWZ5
IGhvdyB0aGUgc3VwcG9ydGVkIGV4dGVuc2lvbnMgYXJlIHJlcHJlc2VudGVkLgoKQnV0IGl0IGFj
dHVhbGx5IGNvbXBsaWNhdGVzIHRoaW5ncyBmb3IgRFQuICBJZiB5b3UncmUgZ29pbmcKdG8gc3Vw
cG9ydCBqdXN0ICJiIiAod2hpY2ggd291bGQgYmUgc2ltcGxlciBhbmQgbW9yZSBjb25jaXNlKQp0
aGVuIHRoZXJlIG5lZWRzIHRvIGJlIGxvZ2ljIHRoYXQgdHJlYXRzIHRoZSB0d28gcG9zc2liaWxp
dGllcwphcyBlcXVpdmFsZW50LiAgQnV0IG9sZCBzb2Z0d2FyZSB3b24ndCByZWNvZ25pemUgbmV3
IERUIGZpbGVzCnRoYXQgY29udGFpbiBvbmx5IHRoZSBuZXdlciAoZS5nLiAiYiIpIGV4dGVuc2lv
bi4KClNvIEkgYWdyZWUsIHRoZXJlJ3MgYWN0aXZlIGhhcm0gaW4gZG9pbmcgd2hhdCBJIHN1Z2dl
c3RlZC4KCkJ1dCB3aHkgZXZlbiBib3RoZXIgc3VwcG9ydGluZyAiYiIgaWYgeW91IGhhdmUgdG8g
KmFsc28qCnN1cHBvcnQgInpiYSt6YmIremJzIiBpZiB5b3UgdXNlIGl0PyAgSXQgYWRkcyB0aGUg
cG9zc2liaWxpdHkKb2YgbmV3IGVycm9ycyAoImIiIHdpdGhvdXQgInpicyIsIGZvciBleGFtcGxl
KSwgd2hpbGUgbm90CnJlYWxseSBlbmFibGluZyBvciByZXByZXNlbnRpbmcgYW55dGhpbmcgbmV3
LgoKPiBJZiAiYiIgaXMgdG8gYmUgYWxsb3dlZCwgSSdtIG9ubHkgaW4gZmF2b3VyIGlmIGhhdmlu
ZyBpdCByZXF1aXJlcyB0aGUKPiBjb21wb25lbnQgcGFydHMuCgpJJ2Qgb3B0IGZvciBpZ25vcmlu
ZyB0aGUgImIiIGV4dGVuc2lvbiwgYW5kIGFueSBvdGhlcgoic2ltcGxpZmllZCIgZXh0ZW5zaW9u
cyB0aGF0IHNpbXBseSByZXByZXNlbnQgYSBzcGVjaWZpYwpzZXQgb2Ygb3RoZXIgZXh0ZW5zaW9u
cyBhbmQgbm90aGluZyBtb3JlLiAgQXQgbGVhc3QgZm9yIERULgoKVGhhdCBzYWlkLCB0aGlzICJy
dWxlIiB3b3VsZCBoYXZlIHRvIGJlIGZvbGxvd2VkL2FncmVlZCB0bwpieSBhbGwgdXNlcnMgb2Yg
RFQuCgoJCQkJCS1BbGV4CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
