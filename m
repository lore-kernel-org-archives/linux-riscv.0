Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE1B5E6C5F9
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Dec 2025 06:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n6EUsaXMOreHCaZnWiU9T/HQ/0EIXGaTNMYdBGr4VU4=; b=NOjnXgrwUYu+Rv
	NL7lrt+Y2YLEcWgsnIihN1IVKXMNp9zJTLzh3mwVwpY5ytI8C3wmeZVnb4rb5+cHwH5oO8FbUh6qw
	Kv5EKdOA9sEBSyPQVKQY+8D2YZILoabGVvXEogvNAsVqR2eWtAsIxoSr1X+cPIUUSiKMTEjSY0cpU
	Q5iVMAQhnQnQWltCbj/FJeYGlt9V17Jq40FXCXoVNTMXZmQbA7dtGp5RMDdyAOmsCaAgSmgQTF3bn
	04rzpB0vIUm1NNp785O9g9ozH6GqUYwevrOmtwi5KqMkdNJxygNsGB5NtCpVJyU+z2qNxbsBGpSjN
	kZW/AxDyQlbs5umW9odQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXwF5-0000000EbsY-0fQ4;
	Tue, 23 Dec 2025 06:51:35 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXwF2-0000000Ebs7-0uCh
	for linux-riscv@lists.infradead.org;
	Tue, 23 Dec 2025 06:51:33 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-78fdb90b670so13260217b3.2
        for <linux-riscv@lists.infradead.org>; Mon, 22 Dec 2025 22:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766472690; x=1767077490; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KdzU5XgvSiFIGPVn5c2s3iuFzcmxAWxfG2aXYw1L7PU=;
        b=q0TfQ+4bU3c7ue/sFFm/MSCfSl9Bsyn67Vh3OjIZvgv6D4/AuK9KhB6HC8IzIxD8a7
         XMFt5P7sRkGJvjsv+NBevw+ra9VwxTh3fC8tJj8KHohq/8d7yZp63NJb8V8ArPy9bZCi
         JcnB8cMCAwuQ/jfomMY2S6X4ejclQBRz3dWQSIe93cT5x6BwOJw1aGlBYI+GQz8+ZmW+
         VEb2izCHhB6XAyr1+KUNZQFZAxfJc1Bdkd6AzAx6DZixjZk7cDE5vkjtQ1w5wwP5FuI2
         0BYp47cRLw2wAVz/Yez9SL2lg1CScM3P4jCK+svmHslZJeEdFv+c1FhQRh4pCgqggyUY
         r5ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766472690; x=1767077490;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KdzU5XgvSiFIGPVn5c2s3iuFzcmxAWxfG2aXYw1L7PU=;
        b=YmGKPvfR2yI+ITgO/iGaha4a+C02oE2YDTqaldd4hKIsu3FAr7z4+S6yKKSUO0hW0r
         YIbvR2SdDyVc+/ElSXMVdGjWmGtVAc3vwHyBZNpjWQ+DXK1wcoD5LiAInqjmr+DR6eru
         W1Hm7h8g8mMEVHXj3kHPHi1HHPjLq4ZdEpj0DaL00cRN+hhpMQjGTmN2tCdAXXA9spju
         jR17+wXzeLa9c91vAyQBZFy0tg4OhTt0NQMmYBAY8LdjK4TqTawPzaQq9mAh5csi0zJx
         OyR8t1orND82ZZPNFgH8Tfv35XEGndEO6FwClsOagHMbvJqyWtdYseYYcbrZU3Mycapz
         ViWw==
X-Forwarded-Encrypted: i=1; AJvYcCXdk6NPk5e5HeN5V2UfV5VH0cDmdvBUlD39uBFuAZo9dvD6+X2Dx/ucks59nDeMmjAUC+fHbevZaMqE+Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyp9IAxU2u+QM+KVCaz70vO1KQP7fbba19a5OnUVNoHWtFSezxo
	5ecOVUJ3LIbXxdY27aDDjtRLb3X9iWO5SYTveAcl6trtu/DkKvPIAW+DbAjdfQfUvKj0iXbgqHw
	c0seDeF5LPOIESVQXOLQsxEja/yJObD5WkMBNYprPpw==
X-Gm-Gg: AY/fxX6gGWxDnD6S4IfwhXQY7hQ+j5d33Ojcx+1uaMutmxuFqsZHGLXlllTlepYrSfm
	moEvuMqIVJyhalENsGxQW67f//T4MPnDerTENTsppw8T+GuGeTC7D9Dhx7HJLHeJ4e8/MbJUkC/
	WoSSHhJeFCOWIuTiGFKKHiWhyHffkq9N4JQ0E1pxRMNeOtYCNIczV0oOZjHwyrOyOibKY53jWWe
	okM78QMBf5muhjWT8UfJ2rcFhIMnP6p8hlJVA1yyRxrnNwwymzhNKsl9/u9AJMuQ804OSNWvmM5
	sY1KPVQgnW7ecBIq2Ce/1hJhQdm5RAqUz32PLxQYRFCS
X-Google-Smtp-Source: AGHT+IGmNL6n/ktYY2P21hGRyNmyBz5VgQU71rfGMPE6y6iiO2YzF6JGopeHStmIJhtnYXIbFejF+LdxNejU6VCR4HE=
X-Received: by 2002:a05:690c:6f92:b0:786:4860:21fd with SMTP id
 00721157ae682-78fb41326bdmr118736627b3.39.1766472689846; Mon, 22 Dec 2025
 22:51:29 -0800 (PST)
MIME-Version: 1.0
References: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
 <20251222-k3-basic-dt-v2-7-3af3f3cd0f8a@riscstar.com> <20251222-stitch-preachy-3fab87fd6f0f@spud>
In-Reply-To: <20251222-stitch-preachy-3fab87fd6f0f@spud>
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 23 Dec 2025 14:51:17 +0800
X-Gm-Features: AQt7F2qxl92KhTNHz3KM52pS5CS3ViVH81hlxdbPGwD2ui8M3XvqUbTJbg__Zy0
Message-ID: <CAH1PCMZ7ywZ3unLy0yHYK+fFHk0y=q2cEtPnRi=qSpf=fc75rw@mail.gmail.com>
Subject: Re: [PATCH v2 07/13] dt-bindings: riscv: Add B ISA extension description
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Samuel Holland <samuel.holland@sifive.com>, Anup Patel <anup@brainfault.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Lubomir Rintel <lkundrak@v3.sk>, Yangyu Chen <cyy@cyyself.name>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>, 
	Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, Andrew Jones <ajones@ventanamicro.com>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
	linux-serial@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_225132_524884_13FE4263 
X-CRM114-Status: GOOD (  24.85  )
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

SGksIENvbm9yCgpPbiBUdWUsIERlYyAyMywgMjAyNSBhdCA1OjE34oCvQU0gQ29ub3IgRG9vbGV5
IDxjb25vckBrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIE1vbiwgRGVjIDIyLCAyMDI1IGF0IDA5
OjA0OjE3UE0gKzA4MDAsIEd1b2RvbmcgWHUgd3JvdGU6Cj4gPiBBZGQgZGVzY3JpcHRpb24gb2Yg
dGhlIHNpbmdsZS1sZXR0ZXIgIkIiIGV4dGVubnNpb24gZm9yIEJpdCBNYW5pcHVsYXRpb24uCj4g
PiBCIGlzIG1hbmRhdG9yeSBmb3IgUlZBMjNVNjQuCj4gPgo+ID4gVGhlIEIgZXh0ZW5zaW9uIGlz
IHJhdGlmaWVkIGluIHRoZSAyMDI0MDQxMSB2ZXJzaW9uIG9mIHRoZSB1bnByaXZpbGVnZWQKPiA+
IElTQSBzcGVjaWZpY2F0aW9uLiBBY2NvcmRpbmcgdG8gdGhlIHJhdGlmaWVkIHNwZWMsICJ0aGUg
QiBzdGFuZGFyZAo+ID4gZXh0ZW5zaW9uIGNvbXByaXNlcyBpbnN0cnVjdGlvbnMgcHJvdmlkZWQg
YnkgdGhlIFpiYSwgWmJiLCBhbmQgWmJzCj4gPiBleHRlbnNpb25zLgo+ID4KPiA+IEhlbmNlIGFk
ZCBhIHNjaGVtYSBjaGVjayBydWxlIHRvIGVuZm9yY2UgdGhhdCBCIGltcGxpZXMgWmJhLCBaYmIg
YW5kIFpicy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBHdW9kb25nIFh1IDxndW9kb25nQHJpc2Nz
dGFyLmNvbT4KPiA+IC0tLQo+ID4gdjI6IE5ldyBwYXRjaC4KPiA+IC0tLQo+ID4gIC4uLi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbCAgICAgICAgIHwgMTkgKysrKysr
KysrKysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspCj4gPgo+
ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9l
eHRlbnNpb25zLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3Yv
ZXh0ZW5zaW9ucy55YW1sCj4gPiBpbmRleCA1NjVjYjJjYmI0OWI1NTI5NTkzOTI4MTBhOWI3MzFi
NDMzNDZhNTk0Li4zODVlMWRlYjIzOTk2ZDI5NGU3NjYyNjkzZjEyNTdmOTEwYTZlMTI5IDEwMDY0
NAo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVu
c2lvbnMueWFtbAo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jp
c2N2L2V4dGVuc2lvbnMueWFtbAo+ID4gQEAgLTEwOSw2ICsxMDksMTMgQEAgcHJvcGVydGllczoK
PiA+ICAgICAgICAgICAgICBUaGUgc3RhbmRhcmQgQyBleHRlbnNpb24gZm9yIGNvbXByZXNzZWQg
aW5zdHJ1Y3Rpb25zLCBhcyByYXRpZmllZCBpbgo+ID4gICAgICAgICAgICAgIHRoZSAyMDE5MTIx
MyB2ZXJzaW9uIG9mIHRoZSB1bnByaXZpbGVnZWQgSVNBIHNwZWNpZmljYXRpb24uCj4gPgo+ID4g
KyAgICAgICAgLSBjb25zdDogYgo+ID4gKyAgICAgICAgICBkZXNjcmlwdGlvbjoKPiA+ICsgICAg
ICAgICAgICBUaGUgc3RhbmRhcmQgQiBleHRlbnNpb24gZm9yIGJpdCBtYW5pcHVsYXRpb24gaW5z
dHJ1Y3Rpb25zLCBhcwo+ID4gKyAgICAgICAgICAgIHJhdGlmaWVkIGluIHRoZSAyMDI0MDQxMSB2
ZXJzaW9uIG9mIHRoZSB1bnByaXZpbGVnZWQgSVNBCj4gPiArICAgICAgICAgICAgc3BlY2lmaWNh
dGlvbi4gVGhlIEIgc3RhbmRhcmQgZXh0ZW5zaW9uIGNvbXByaXNlcyBpbnN0cnVjdGlvbnMKPiA+
ICsgICAgICAgICAgICBwcm92aWRlZCBieSB0aGUgWmJhLCBaYmIsIGFuZCBaYnMgZXh0ZW5zaW9u
cy4KPiA+ICsKPiA+ICAgICAgICAgIC0gY29uc3Q6IHYKPiA+ICAgICAgICAgICAgZGVzY3JpcHRp
b246Cj4gPiAgICAgICAgICAgICAgVGhlIHN0YW5kYXJkIFYgZXh0ZW5zaW9uIGZvciB2ZWN0b3Ig
b3BlcmF0aW9ucywgYXMgcmF0aWZpZWQKPiA+IEBAIC03MzUsNiArNzQyLDE4IEBAIHByb3BlcnRp
ZXM6Cj4gPiAgICAgICAgICB0aGVuOgo+ID4gICAgICAgICAgICBjb250YWluczoKPiA+ICAgICAg
ICAgICAgICBjb25zdDogZgo+ID4gKyAgICAgICMgYiBjb21wcmlzZXMgdGhlIGZvbGxvd2luZyBl
eHRlbnNpb25zCj4gPiArICAgICAgLSBpZjoKPiA+ICsgICAgICAgICAgY29udGFpbnM6Cj4gPiAr
ICAgICAgICAgICAgY29uc3Q6IGIKPgo+IFdoYXQncyB0aGUgdmFsdWUgaW4gYWRkaW5nIGIsIGlm
IGl0IGRlcGVuZHMgb24gaGF2aW5nIGFsbCAzIG9mIHRoZQo+IGNvbXBvbmVudHMgZGVmaW5lZCBp
bmRpdmlkdWFsbHkgdG9vPyBDdXJyZW50bHkgYWxsICJzdXBlcnNldCIgdHlwZXMgb2YKPiBleHRl
bnNpb25zIGFyZSBwZXJtaXR0ZWQgd2l0aG91dCB0aGVpciBjb21wb25lbnQgcGFydHMgYWxzbyBi
ZWluZyBkZWZpbmVkLAo+IHRoaXMgZG9lc24ndCBmb2xsb3cgY29udmVudGlvbiBhbmQgdGhlcmVm
b3JlIG5lZWRzIHRvIGJlIGV4cGxhaW5lZC4KPgo+IFlvdSBvYnZpb3VzbHkgbmVlZCB0aGlzIGNv
bnN0cnVjdCBiZWNhdXNlIHRoZSBrZXJuZWwgZG9lcyBub3QgdW5kZXJzdGFuZAo+ICJiIiwgYW5k
IGV2ZW4gaWYgeW91IGFkZGVkIHN1cHBvcnQgZm9yIGludGVycHJldGluZyAiYiIgdG8gdGhlIGtl
cm5lbAo+IHRoaXMgaXMgcHJvYmFibHkgc3RpbGwgbmVlZGVkIHRvIG1ha2Ugc3VyZSB0aGUgQUJJ
IGlzIG1haW50YWluZWQgZm9yCj4gYW55dGhpbmcgaW1wb3J0aW5nIGEgZGV2aWNldHJlZSBmcm9t
IHRoZSBrZXJuZWwuCgpZZXMsIGV4YWN0bHkuIFVubGlrZSBvdGhlciBzaW5nbGUtbGV0dGVyIGV4
dGVuc2lvbnMsICJiIiB3YXMgcmF0aWZpZWQKKEFwci8yMDI0KSBtdWNoIGxhdGVyIHRoYW4gaXRz
IGNvbXBvbmVudHMgemJhL3piYi96YnMgKEp1bi8yMDIxKS4KRXhpc3Rpbmcgc29mdHdhcmUgYW5k
IHRoZSBrZXJuZWwgYWxyZWFkeSBleHBlY3QgdGhlc2UgZXhwbGljaXQgY29tcG9uZW50CnN0cmlu
Z3MsIHNvIGVuZm9yY2luZyB0aGlzIGRlcGVuZGVuY3kgZW5zdXJlcyBjb3JlcyBkZWNsYXJpbmcg
ImIiIHdpbGwKYWxzbyBiZSBjb3JyZWN0bHkgdW5kZXJzdG9vZCBieSBvbGRlciBzb2Z0d2FyZSB0
aGF0IG9ubHkgbG9va3MgZm9yCnpiYS96YmIvemJzLgoKSSB3aWxsIHVwZGF0ZSB0aGUgY29tbWl0
IG1lc3NhZ2UgaW4gdjMgdG8gY2xlYXJseSBleHBsYWluIHRoaXMgcmVhc29uaW5nLgpEb2VzIGl0
IHNvdW5kIGdvb2QgdG8geW91PwoKVGhhbmsgeW91IGZvciB0aGUgcmV2aWV3LgoKQlIsCkd1b2Rv
bmcgWHUKCj4KPiA+ICsgICAgICAgIHRoZW46Cj4gPiArICAgICAgICAgIGFsbE9mOgo+ID4gKyAg
ICAgICAgICAgIC0gY29udGFpbnM6Cj4gPiArICAgICAgICAgICAgICAgIGNvbnN0OiB6YmEKPiA+
ICsgICAgICAgICAgICAtIGNvbnRhaW5zOgo+ID4gKyAgICAgICAgICAgICAgICBjb25zdDogemJi
Cj4gPiArICAgICAgICAgICAgLSBjb250YWluczoKPiA+ICsgICAgICAgICAgICAgICAgY29uc3Q6
IHpicwo+ID4gICAgICAgICMgWmNiIGRlcGVuZHMgb24gWmNhCj4gPiAgICAgICAgLSBpZjoKPiA+
ICAgICAgICAgICAgY29udGFpbnM6Cj4gPgo+ID4gLS0KPiA+IDIuNDMuMAo+ID4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
