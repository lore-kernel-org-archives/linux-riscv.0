Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2375CCD3431
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Sep 2024 12:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fuh/CupeKW9oe+5Rp/+cFnjoXw74AaHMSoNtbLHV7xA=; b=Yb49w5tRMrmi5A
	ufyljMcWd2CmZkjzALUuJdZ432+Fd3azHYnQrlFauzE4F6jKJjOqiDrHqwkrMjQcmIVaBth0w58Uh
	DHw4CQPW2CdKNhj5hjT9LBw2fGT+b9qHmv8O4xCNH09QPXEXVQdiWxHMx4rzBDU/ht8WJZRnk3DGj
	wIwh2DQOvjdLvjGLRAhe42fNwiNqbGVp34OV1iY+qGEpxH24oeojtD/Cb2CKTJ891z2KvL24OoXau
	JLjOen9xb4Cu7AA5eB5cAZ1kbB3X8sK/e5n7V5zxZsY1WOlq4MzfE7uRAymnFG3w6t7JGQcGUBERg
	Si68bRu5Y7NOFmkhq2hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slp3F-00000004LwN-13mr;
	Wed, 04 Sep 2024 12:23:57 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slp1r-00000004LjL-33FJ
	for linux-riscv@lists.infradead.org;
	Wed, 04 Sep 2024 12:23:55 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-3a043869e42so622235ab.0
        for <linux-riscv@lists.infradead.org>; Wed, 04 Sep 2024 05:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1725452550; x=1726057350; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ju9Hq+FgR4Nn2GcAcehqW18ZWQc9xC6Fkglr1yE5YOM=;
        b=tQ6rjFUU1lHAR+s0t9RkStoznhFpUGs0bhrMSkOSyQXKuEliPtYwVzO6bQv2mV4Tae
         eDc6fZVwQ83S85tagwyt9vdwz6bh2ezwV5Ujo/7Q5fIrphm0bLSN9k7fN2yFaWUCbkUm
         CI2+u76Z8YTn1Qx51rJ4Eup3emGlwlXmWyUDRulpxFCtpAP3ajIrqxH5RECV/oz3kEAP
         wrEywbYmqLexfVD9wllMkHPXh6+glXLZMO0wiQXj0A/QK/wraMG4tct8E9g1iOiurN3V
         BQM1BFIJp7IdSojjXztv8mWdZnUIc+giBq0fDyvQqXu2SOpq4T5uHxqCJztujaO7n7RJ
         GIXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725452550; x=1726057350;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ju9Hq+FgR4Nn2GcAcehqW18ZWQc9xC6Fkglr1yE5YOM=;
        b=bBmSHjtyCzmK0J9aR0LMksa6+vdqi1zCIPhA8SrXnwRTwYGp+3eMEx87McZFpZSWKI
         JN+XXf5aFgicFuFBVLiuZpmiV0nA/AUh/ZuOTl3bbIqHRuq3MIk/+hxNHyKN2GElAtrl
         agopu8jOkHaubI5+1tRA9jSyfnWtdhmgMHDf4OUeRj/1VsnG8ZFHzXHaGE7F+jajzfVz
         JHfExhfu5nJYX5EjhKCU7lGmsNjNNTjzo3DRnoaWvJgYhHH0iQlY2iK9mjh9MOr/5LYY
         EwF05TbVKuL2pqYZbnA5pSIHUsWgiGUgOZesUHNqOH69rYN3t5fwPYm8+w/mcwQgnRLJ
         XBlA==
X-Forwarded-Encrypted: i=1; AJvYcCXzty5nDRhdWlEdSRdSoSZlObBM3GEKXZmAquxD+ZFCt+ioxZY2yDnhgObvA23oNjlCQYIAk5a4wD8Wkg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzI7J7DdFxQ2y6lZyLyh3qTtTruNVTbL9c0RC2gNE8QqO39hfA+
	0AYyjcm2MUAdEr6iS7EJBxTkgpwCpQNefAvFXyFWwzT+beGUJmFB/f1tHzWqkWziF/Gd6URv+v2
	BlKEi+IDg4mxpoKMITflt/mBet4TwFMZMWKwEeQ==
X-Google-Smtp-Source: AGHT+IHPjtXAXxUmHhn9hwmGB4/VcwV/vcS/lCwZ+rwRHq9HHhBtYsEB6Vwzvqfdu5MMGbv6xPJ7cpHsv2V3fV8GXEA=
X-Received: by 2002:a05:6e02:1c46:b0:39d:4dab:a533 with SMTP id
 e9e14a558f8ab-39f74f88f94mr14510545ab.0.1725452549998; Wed, 04 Sep 2024
 05:22:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240829010151.2813377-1-samuel.holland@sifive.com> <20240829010151.2813377-11-samuel.holland@sifive.com>
In-Reply-To: <20240829010151.2813377-11-samuel.holland@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 4 Sep 2024 17:52:19 +0530
Message-ID: <CAAhSdy0P6Jxdr1+zQLuisMpMapHWHXkSkzEEBG+wWXbbzf7ASw@mail.gmail.com>
Subject: Re: [PATCH v4 10/10] KVM: riscv: selftests: Add Smnpm and Ssnpm to
 get-reg-list test
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, kasan-dev@googlegroups.com, 
	Atish Patra <atishp@atishpatra.org>, Evgenii Stepanov <eugenis@google.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_052231_974148_C6A9F3CA 
X-CRM114-Status: GOOD (  14.26  )
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

T24gVGh1LCBBdWcgMjksIDIwMjQgYXQgNjozMuKAr0FNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IEFkZCB0ZXN0aW5nIGZvciB0aGUgcG9pbnRl
ciBtYXNraW5nIGV4dGVuc2lvbnMgZXhwb3NlZCB0byBLVk0gZ3Vlc3RzLgo+Cj4gU2lnbmVkLW9m
Zi1ieTogU2FtdWVsIEhvbGxhbmQgPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+CgpMR1RNLgoK
UmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpSZWdhcmRzLApB
bnVwCgo+IC0tLQo+Cj4gKG5vIGNoYW5nZXMgc2luY2UgdjIpCj4KPiBDaGFuZ2VzIGluIHYyOgo+
ICAtIE5ldyBwYXRjaCBmb3IgdjIKPgo+ICB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vcmlz
Y3YvZ2V0LXJlZy1saXN0LmMgfCA4ICsrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2Vy
dGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vcmlz
Y3YvZ2V0LXJlZy1saXN0LmMgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vcmlzY3YvZ2V0
LXJlZy1saXN0LmMKPiBpbmRleCA4ZTM0ZjdmYTQ0ZTkuLjU0YWI0ODRkMDAwMCAxMDA2NDQKPiAt
LS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vcmlzY3YvZ2V0LXJlZy1saXN0LmMKPiAr
KysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vcmlzY3YvZ2V0LXJlZy1saXN0LmMKPiBA
QCAtNDEsOSArNDEsMTEgQEAgYm9vbCBmaWx0ZXJfcmVnKF9fdTY0IHJlZykKPiAgICAgICAgIGNh
c2UgS1ZNX1JFR19SSVNDVl9JU0FfRVhUIHwgS1ZNX1JFR19SSVNDVl9JU0FfU0lOR0xFIHwgS1ZN
X1JJU0NWX0lTQV9FWFRfSToKPiAgICAgICAgIGNhc2UgS1ZNX1JFR19SSVNDVl9JU0FfRVhUIHwg
S1ZNX1JFR19SSVNDVl9JU0FfU0lOR0xFIHwgS1ZNX1JJU0NWX0lTQV9FWFRfTToKPiAgICAgICAg
IGNhc2UgS1ZNX1JFR19SSVNDVl9JU0FfRVhUIHwgS1ZNX1JFR19SSVNDVl9JU0FfU0lOR0xFIHwg
S1ZNX1JJU0NWX0lTQV9FWFRfVjoKPiArICAgICAgIGNhc2UgS1ZNX1JFR19SSVNDVl9JU0FfRVhU
IHwgS1ZNX1JFR19SSVNDVl9JU0FfU0lOR0xFIHwgS1ZNX1JJU0NWX0lTQV9FWFRfU01OUE06Cj4g
ICAgICAgICBjYXNlIEtWTV9SRUdfUklTQ1ZfSVNBX0VYVCB8IEtWTV9SRUdfUklTQ1ZfSVNBX1NJ
TkdMRSB8IEtWTV9SSVNDVl9JU0FfRVhUX1NNU1RBVEVFTjoKPiAgICAgICAgIGNhc2UgS1ZNX1JF
R19SSVNDVl9JU0FfRVhUIHwgS1ZNX1JFR19SSVNDVl9JU0FfU0lOR0xFIHwgS1ZNX1JJU0NWX0lT
QV9FWFRfU1NBSUE6Cj4gICAgICAgICBjYXNlIEtWTV9SRUdfUklTQ1ZfSVNBX0VYVCB8IEtWTV9S
RUdfUklTQ1ZfSVNBX1NJTkdMRSB8IEtWTV9SSVNDVl9JU0FfRVhUX1NTQ09GUE1GOgo+ICsgICAg
ICAgY2FzZSBLVk1fUkVHX1JJU0NWX0lTQV9FWFQgfCBLVk1fUkVHX1JJU0NWX0lTQV9TSU5HTEUg
fCBLVk1fUklTQ1ZfSVNBX0VYVF9TU05QTToKPiAgICAgICAgIGNhc2UgS1ZNX1JFR19SSVNDVl9J
U0FfRVhUIHwgS1ZNX1JFR19SSVNDVl9JU0FfU0lOR0xFIHwgS1ZNX1JJU0NWX0lTQV9FWFRfU1NU
QzoKPiAgICAgICAgIGNhc2UgS1ZNX1JFR19SSVNDVl9JU0FfRVhUIHwgS1ZNX1JFR19SSVNDVl9J
U0FfU0lOR0xFIHwgS1ZNX1JJU0NWX0lTQV9FWFRfU1ZJTlZBTDoKPiAgICAgICAgIGNhc2UgS1ZN
X1JFR19SSVNDVl9JU0FfRVhUIHwgS1ZNX1JFR19SSVNDVl9JU0FfU0lOR0xFIHwgS1ZNX1JJU0NW
X0lTQV9FWFRfU1ZOQVBPVDoKPiBAQCAtNDE0LDkgKzQxNiwxMSBAQCBzdGF0aWMgY29uc3QgY2hh
ciAqaXNhX2V4dF9zaW5nbGVfaWRfdG9fc3RyKF9fdTY0IHJlZ19vZmYpCj4gICAgICAgICAgICAg
ICAgIEtWTV9JU0FfRVhUX0FSUihJKSwKPiAgICAgICAgICAgICAgICAgS1ZNX0lTQV9FWFRfQVJS
KE0pLAo+ICAgICAgICAgICAgICAgICBLVk1fSVNBX0VYVF9BUlIoViksCj4gKyAgICAgICAgICAg
ICAgIEtWTV9JU0FfRVhUX0FSUihTTU5QTSksCj4gICAgICAgICAgICAgICAgIEtWTV9JU0FfRVhU
X0FSUihTTVNUQVRFRU4pLAo+ICAgICAgICAgICAgICAgICBLVk1fSVNBX0VYVF9BUlIoU1NBSUEp
LAo+ICAgICAgICAgICAgICAgICBLVk1fSVNBX0VYVF9BUlIoU1NDT0ZQTUYpLAo+ICsgICAgICAg
ICAgICAgICBLVk1fSVNBX0VYVF9BUlIoU1NOUE0pLAo+ICAgICAgICAgICAgICAgICBLVk1fSVNB
X0VYVF9BUlIoU1NUQyksCj4gICAgICAgICAgICAgICAgIEtWTV9JU0FfRVhUX0FSUihTVklOVkFM
KSwKPiAgICAgICAgICAgICAgICAgS1ZNX0lTQV9FWFRfQVJSKFNWTkFQT1QpLAo+IEBAIC05NDYs
OCArOTUwLDEwIEBAIEtWTV9JU0FfRVhUX1NVQkxJU1RfQ09ORklHKGFpYSwgQUlBKTsKPiAgS1ZN
X0lTQV9FWFRfU1VCTElTVF9DT05GSUcoZnBfZiwgRlBfRik7Cj4gIEtWTV9JU0FfRVhUX1NVQkxJ
U1RfQ09ORklHKGZwX2QsIEZQX0QpOwo+ICBLVk1fSVNBX0VYVF9TSU1QTEVfQ09ORklHKGgsIEgp
Owo+ICtLVk1fSVNBX0VYVF9TSU1QTEVfQ09ORklHKHNtbnBtLCBTTU5QTSk7Cj4gIEtWTV9JU0Ff
RVhUX1NVQkxJU1RfQ09ORklHKHNtc3RhdGVlbiwgU01TVEFURUVOKTsKPiAgS1ZNX0lTQV9FWFRf
U0lNUExFX0NPTkZJRyhzc2NvZnBtZiwgU1NDT0ZQTUYpOwo+ICtLVk1fSVNBX0VYVF9TSU1QTEVf
Q09ORklHKHNzbnBtLCBTU05QTSk7Cj4gIEtWTV9JU0FfRVhUX1NJTVBMRV9DT05GSUcoc3N0Yywg
U1NUQyk7Cj4gIEtWTV9JU0FfRVhUX1NJTVBMRV9DT05GSUcoc3ZpbnZhbCwgU1ZJTlZBTCk7Cj4g
IEtWTV9JU0FfRVhUX1NJTVBMRV9DT05GSUcoc3ZuYXBvdCwgU1ZOQVBPVCk7Cj4gQEAgLTEwMDks
OCArMTAxNSwxMCBAQCBzdHJ1Y3QgdmNwdV9yZWdfbGlzdCAqdmNwdV9jb25maWdzW10gPSB7Cj4g
ICAgICAgICAmY29uZmlnX2ZwX2YsCj4gICAgICAgICAmY29uZmlnX2ZwX2QsCj4gICAgICAgICAm
Y29uZmlnX2gsCj4gKyAgICAgICAmY29uZmlnX3NtbnBtLAo+ICAgICAgICAgJmNvbmZpZ19zbXN0
YXRlZW4sCj4gICAgICAgICAmY29uZmlnX3NzY29mcG1mLAo+ICsgICAgICAgJmNvbmZpZ19zc25w
bSwKPiAgICAgICAgICZjb25maWdfc3N0YywKPiAgICAgICAgICZjb25maWdfc3ZpbnZhbCwKPiAg
ICAgICAgICZjb25maWdfc3ZuYXBvdCwKPiAtLQo+IDIuNDUuMQo+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
