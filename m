Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14435C02183
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 12:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AMYJ4bdvq1l3VaG8HY2gnu12mMziPAUA5GBbmDOts9U=; b=KI66E/OMWA3nYf
	2TPDD8pt7SIyPVZ8splCflaqtvJVLLmEMbgUYTFhJajOYpr6L9/FZSRn8JKNvbJC+yUD4Z2YBdMr6
	D8cmhyWG360GbxkK2iAZ4Odgvnpl3u/br5biCQQ6yJAqRMKQl3ngBvQ2BdairG3rycF81W4UVtk42
	X0tUkCOpMcfb22AW0xP9M9qc7SSoflAo12kQQNF1Z4sZz2bKGptx8smds+MWrQZ3N34FQVZIXYIV5
	j8Mz5EdyZC2lgPSE144xnYXrD/VR+++wOOb870Dy68aL9ec9bL7Jn+wzFUnhcuYh42YAfqyQSSycB
	B7lqUDmBuoF0AmFzCthA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXgGJ-00000008RDv-45P6;
	Tue, 14 Jan 2025 12:43:15 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXgFy-00000008RB3-2u3z
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jan 2025 12:42:55 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5d647d5df90so9152575a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 14 Jan 2025 04:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1736858573; x=1737463373; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rnsF0zy3GsMYA4HPmzwMOUoBG6xfZOolcTLSwhE6xZE=;
        b=X/l2vZtGx7ttQ6m75zjILEubKIdhFKbFDiIrTEfgb3jjRyltwr3GlF3osKE/kiLt/I
         xrKY0t6ceQo7dY1Cz5EiJ4XX8d+r3SRNLTIzZCuZqMjT0RSAOCxlUa7v9ywM35ATWUuZ
         mX0E7ouFcajN6ji+yeG1o3ypTGZ5K+JLwA7ikZUJpuMFRRz4KjtyoKIgZJ4n7PqvVb4Y
         ejD3rmwrMMUaF0dWuWFR9D0ONIMiCDAzElevmZQ80aZ8+ePpEROW7HTyVidJ81zpA3Ic
         pbmRttqpCp0LNCfqzUNKpffxyJMH4AWajcsrI3x1nvQJZEICXq9hBtYfobj82tauWycc
         rn2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736858573; x=1737463373;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rnsF0zy3GsMYA4HPmzwMOUoBG6xfZOolcTLSwhE6xZE=;
        b=Sh81pgb4nZi+4sVVG6/6eDDeDPK004AZApriDw16FygDcmEdlPeVg59A+OEndEy4sf
         r/PnSmHbBHWpo+lsvYrtuHEyDU5wQRcMmGUDZ9KGtRknuwH/ntBrVFcLRDXQfbgC1zKz
         V9PqKECECVMSWc8bNKz6MZHwOFuc2rUV+023afeOvehEXh70izzqeXixCwxrM5aXIitC
         NAfX2U2x5zbk+sZlla5ECYhWHLa1WjbgiOpqHbsElih0vdeISKW0XI6icM8LUiE3zvnn
         SumkYN/qqmwqmemp8m981+NWJmWc7qi8A7975WOMnfl9ZR4QnZn05uJtq/ZdNZjHhKfw
         Y0VQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7B9flCLrPDT8L+bbyHfK/ZwQuYdRieIqDOmbnHdyzzsNYLkaQjW/d0yhfZH3v79kA0+AuzrkPyabgrg==@lists.infradead.org
X-Gm-Message-State: AOJu0YykRsbLobQplF2UvSYU9R1sP5mkUh32kIsHXQYDGJriqWwQdO57
	XHgrTzj2K+n/aT8yB0q4D0mzg79bETLHmTPHL0ARXwYt+tjrE8uKGy1i3LbF50I=
X-Gm-Gg: ASbGncs2BgFp+Txozw8EG6HauY2L9GH9arOoxZrD0vvUsmt1MNKtm+lSpkJbbEnLeYm
	IUrmpQQwwQt64hXKlDUS1IGTukkKVjqFBPW3tZVrmE62F6+oJrsNTZgE9cRfenmjLIV7AWSldJ1
	vjxoiLLv3GrOvQDYNKhzWIwOnxvrR2ny0bK1rl5NWlkIeEzAPpldtXhXnAa48PHFhb2dbHTHBbM
	8R2+sG2GowWCkwsgNei3HbrIQiTM1UWT5a4mA9+F4PtQ7tJmgpDIslbofRugR9u8p6YH4BtmF+U
	ZaJE4FBdph2n+UYaIcQI70+uTVqR2z+dBl+PTUMiVA==
X-Google-Smtp-Source: AGHT+IGa+w+7nxPE26Y4gseiHljadCRzoNaxIWh+TeYU2ACFrAbllLGBqDkEYDrnuQQTlrSybqPOXA==
X-Received: by 2002:a17:907:c588:b0:ab2:c208:732d with SMTP id a640c23a62f3a-ab2c2087cbbmr2016364966b.40.1736858572698;
        Tue, 14 Jan 2025 04:42:52 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d9903c2d58sm6155924a12.39.2025.01.14.04.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 04:42:52 -0800 (PST)
Date: Tue, 14 Jan 2025 13:42:51 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: Samuel Holland <samuel.holland@sifive.com>, alexghiti@rivosinc.com, 
	andybnac@gmail.com, aou@eecs.berkeley.edu, charlie@rivosinc.com, cleger@rivosinc.com, 
	conor.dooley@microchip.com, conor@kernel.org, corbet@lwn.net, evan@rivosinc.com, 
	jesse@rivosinc.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, shuah@kernel.org
Subject: Re: [External] Re: [PATCH v4 2/3] RISC-V: hwprobe: Expose Zicbom
 extension and its block size
Message-ID: <20250114-6f373c6dd685cf322c89e7d5@orel>
References: <20250114021936.17234-1-cuiyunhui@bytedance.com>
 <20250114021936.17234-3-cuiyunhui@bytedance.com>
 <7c181d03-b0d0-4b81-bbd0-06943a58a287@sifive.com>
 <CAEEQ3wm7-O5U3jjbQ1+XgVvk+G7csMPAxzGoV=K5WczCOsbQ5g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEEQ3wm7-O5U3jjbQ1+XgVvk+G7csMPAxzGoV=K5WczCOsbQ5g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_044254_732644_5383950B 
X-CRM114-Status: GOOD (  28.08  )
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

T24gVHVlLCBKYW4gMTQsIDIwMjUgYXQgMDg6MTc6MDJQTSArMDgwMCwgeXVuaHVpIGN1aSB3cm90
ZToKPiBIaSBTYW11ZWzvvIwKPiAKPiBPbiBUdWUsIEphbiAxNCwgMjAyNSBhdCAxOjI44oCvUE0g
U2FtdWVsIEhvbGxhbmQKPiA8c2FtdWVsLmhvbGxhbmRAc2lmaXZlLmNvbT4gd3JvdGU6Cj4gPgo+
ID4gSGkgWXVuaHVpLAo+ID4KPiA+IE9uIDIwMjUtMDEtMTMgODoxOSBQTSwgWXVuaHVpIEN1aSB3
cm90ZToKPiA+ID4gRXhwb3NlIFppY2JvbSB0aHJvdWdoIGh3cHJvYmUgYW5kIGFsc28gcHJvdmlk
ZSBhIGtleSB0byBleHRyYWN0IGl0cwo+ID4gPiByZXNwZWN0aXZlIGJsb2NrIHNpemUuCj4gPiA+
Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IFl1bmh1aSBDdWkgPGN1aXl1bmh1aUBieXRlZGFuY2UuY29t
Pgo+ID4gPiAtLS0KPiA+ID4gIERvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdCAg
fCA2ICsrKysrKwo+ID4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od3Byb2JlLmggICAgICB8
IDIgKy0KPiA+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmggfCAyICsr
Cj4gPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jICAgICAgIHwgNiArKysrKysK
PiA+ID4gIDQgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+
ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUu
cnN0IGIvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0Cj4gPiA+IGluZGV4IDk1
NWZiY2QxOWNlOS4uMGVhNzc1NGIyMDQ5IDEwMDY0NAo+ID4gPiAtLS0gYS9Eb2N1bWVudGF0aW9u
L2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QKPiA+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9hcmNoL3Jp
c2N2L2h3cHJvYmUucnN0Cj4gPiA+IEBAIC0yNDIsNiArMjQyLDkgQEAgVGhlIGZvbGxvd2luZyBr
ZXlzIGFyZSBkZWZpbmVkOgo+ID4gPiAgICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0VYVF9T
VVBNYDogVGhlIFN1cG0gZXh0ZW5zaW9uIGlzIHN1cHBvcnRlZCBhcwo+ID4gPiAgICAgICAgIGRl
ZmluZWQgaW4gdmVyc2lvbiAxLjAgb2YgdGhlIFJJU0MtViBQb2ludGVyIE1hc2tpbmcgZXh0ZW5z
aW9ucy4KPiA+ID4KPiA+ID4gKyAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9FWFRfWklDQk9N
YDogVGhlIFppY2JvbSBleHRlbnNpb24gaXMgc3VwcG9ydGVkLCBhcwo+ID4gPiArICAgICAgIHJh
dGlmaWVkIGluIGNvbW1pdCAzZGQ2MDZmICgiQ3JlYXRlIGNtb2Jhc2UtdjEuMC5wZGYiKSBvZiBy
aXNjdi1DTU9zLgo+ID4gPiArCj4gPiA+ICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0tFWV9D
UFVQRVJGXzBgOiBEZXByZWNhdGVkLiAgUmV0dXJucyBzaW1pbGFyIHZhbHVlcyB0bwo+ID4gPiAg
ICAgICA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9LRVlfTUlTQUxJR05FRF9TQ0FMQVJfUEVSRmAs
IGJ1dCB0aGUga2V5IHdhcwo+ID4gPiAgICAgICBtaXN0YWtlbmx5IGNsYXNzaWZpZWQgYXMgYSBi
aXRtYXNrIHJhdGhlciB0aGFuIGEgdmFsdWUuCj4gPiA+IEBAIC0yODEsNiArMjg0LDkgQEAgVGhl
IGZvbGxvd2luZyBrZXlzIGFyZSBkZWZpbmVkOgo+ID4gPiAgKiA6YzptYWNybzpgUklTQ1ZfSFdQ
Uk9CRV9LRVlfTUlTQUxJR05FRF9WRUNUT1JfUEVSRmA6IEFuIGVudW0gdmFsdWUgZGVzY3JpYmlu
ZyB0aGUKPiA+ID4gICAgICAgcGVyZm9ybWFuY2Ugb2YgbWlzYWxpZ25lZCB2ZWN0b3IgYWNjZXNz
ZXMgb24gdGhlIHNlbGVjdGVkIHNldCBvZiBwcm9jZXNzb3JzLgo+ID4gPgo+ID4gPiArKiA6Yzpt
YWNybzpgUklTQ1ZfSFdQUk9CRV9LRVlfWklDQk9NX0JMT0NLX1NJWkVgOiBBbiB1bnNpZ25lZCBp
bnQgd2hpY2gKPiA+ID4gKyAgcmVwcmVzZW50cyB0aGUgc2l6ZSBvZiB0aGUgWmljYm9tIGJsb2Nr
IGluIGJ5dGVzLgo+ID4gPiArCj4gPiA+ICAgICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfTUlT
QUxJR05FRF9WRUNUT1JfVU5LTk9XTmA6IFRoZSBwZXJmb3JtYW5jZSBvZiBtaXNhbGlnbmVkCj4g
PiA+ICAgICAgdmVjdG9yIGFjY2Vzc2VzIGlzIHVua25vd24uCj4gPgo+ID4gVGhlIG5ldyBrZXkg
bmVlZHMgdG8gZ28gZnVydGhlciBkb3duLCBiZWxvdyB0aGlzIGxpc3Qgb2YgcG9zc2libGUgdmFs
dWVzIGZvciB0aGUKPiA+IHByZXZpb3VzIGtleS4KPiBJIGd1ZXNzIHlvdSBtZWFuIHRvIHB1dCBp
dCBhZnRlcgo+IFJJU0NWX0hXUFJPQkVfTUlTQUxJR05FRF9WRUNUT1JfVU5TVVBQT1JURUQsIHJp
Z2h0PwoKWWVzLCBub3RpY2UgaG93IGFsbCB0aGUgUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX1ZF
Q1RPUl8qIGRlZmluZXMgYXJlCmluZGVudGVkIHVuZGVyIFJJU0NWX0hXUFJPQkVfS0VZX01JU0FM
SUdORURfVkVDVE9SX1BFUkYgaW5kaWNhdGluZwp0aGV5J3JlIHBhcnQgb2YgdGhlIFJJU0NWX0hX
UFJPQkVfS0VZX01JU0FMSUdORURfVkVDVE9SX1BFUkYgZ3JvdXAuCgpUaGFua3MsCmRyZXcKCj4g
Cj4gPgo+ID4gUmVnYXJkcywKPiA+IFNhbXVlbAo+ID4KPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdwcm9iZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9od3Byb2JlLmgKPiA+ID4gaW5kZXggMWNlMWRmNmQwZmYzLi44OTM3OWY5YTJlNmUgMTAwNjQ0
Cj4gPiA+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdwcm9iZS5oCj4gPiA+ICsrKyBi
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdwcm9iZS5oCj4gPiA+IEBAIC04LDcgKzgsNyBAQAo+
ID4gPgo+ID4gPiAgI2luY2x1ZGUgPHVhcGkvYXNtL2h3cHJvYmUuaD4KPiA+ID4KPiA+ID4gLSNk
ZWZpbmUgUklTQ1ZfSFdQUk9CRV9NQVhfS0VZIDEwCj4gPiA+ICsjZGVmaW5lIFJJU0NWX0hXUFJP
QkVfTUFYX0tFWSAxMQo+ID4gPgo+ID4gPiAgc3RhdGljIGlubGluZSBib29sIHJpc2N2X2h3cHJv
YmVfa2V5X2lzX3ZhbGlkKF9fczY0IGtleSkKPiA+ID4gIHsKPiA+ID4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUv
dWFwaS9hc20vaHdwcm9iZS5oCj4gPiA+IGluZGV4IDNhZjE0MmI5OWY3Ny4uYjE1YzBiZDgzZWYy
IDEwMDY0NAo+ID4gPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5o
Cj4gPiA+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgKPiA+ID4g
QEAgLTczLDYgKzczLDcgQEAgc3RydWN0IHJpc2N2X2h3cHJvYmUgewo+ID4gPiAgI2RlZmluZSAg
ICAgICAgICAgICAgUklTQ1ZfSFdQUk9CRV9FWFRfWkNNT1AgICAgICAgICAoMVVMTCA8PCA0NykK
PiA+ID4gICNkZWZpbmUgICAgICAgICAgICAgIFJJU0NWX0hXUFJPQkVfRVhUX1pBV1JTICAgICAg
ICAgKDFVTEwgPDwgNDgpCj4gPiA+ICAjZGVmaW5lICAgICAgICAgICAgICBSSVNDVl9IV1BST0JF
X0VYVF9TVVBNICAgICAgICAgICgxVUxMIDw8IDQ5KQo+ID4gPiArI2RlZmluZSAgICAgICAgICAg
ICAgUklTQ1ZfSFdQUk9CRV9FWFRfWklDQk9NICAgICAgICAoMVVMTCA8PCA1MCkKPiA+ID4gICNk
ZWZpbmUgUklTQ1ZfSFdQUk9CRV9LRVlfQ1BVUEVSRl8wICA1Cj4gPiA+ICAjZGVmaW5lICAgICAg
ICAgICAgICBSSVNDVl9IV1BST0JFX01JU0FMSUdORURfVU5LTk9XTiAgICAgICAgKDAgPDwgMCkK
PiA+ID4gICNkZWZpbmUgICAgICAgICAgICAgIFJJU0NWX0hXUFJPQkVfTUlTQUxJR05FRF9FTVVM
QVRFRCAgICAgICAoMSA8PCAwKQo+ID4gPiBAQCAtOTQsNiArOTUsNyBAQCBzdHJ1Y3QgcmlzY3Zf
aHdwcm9iZSB7Cj4gPiA+ICAjZGVmaW5lICAgICAgICAgICAgICBSSVNDVl9IV1BST0JFX01JU0FM
SUdORURfVkVDVE9SX1NMT1cgICAgICAgICAgICAyCj4gPiA+ICAjZGVmaW5lICAgICAgICAgICAg
ICBSSVNDVl9IV1BST0JFX01JU0FMSUdORURfVkVDVE9SX0ZBU1QgICAgICAgICAgICAzCj4gPiA+
ICAjZGVmaW5lICAgICAgICAgICAgICBSSVNDVl9IV1BST0JFX01JU0FMSUdORURfVkVDVE9SX1VO
U1VQUE9SVEVEICAgICA0Cj4gPiA+ICsjZGVmaW5lIFJJU0NWX0hXUFJPQkVfS0VZX1pJQ0JPTV9C
TE9DS19TSVpFICAxMQo+ID4gPiAgLyogSW5jcmVhc2UgUklTQ1ZfSFdQUk9CRV9NQVhfS0VZIHdo
ZW4gYWRkaW5nIGl0ZW1zLiAqLwo+ID4gPgo+ID4gPiAgLyogRmxhZ3MgKi8KPiA+ID4gZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMgYi9hcmNoL3Jpc2N2L2tlcm5l
bC9zeXNfaHdwcm9iZS5jCj4gPiA+IGluZGV4IGNiOTNhZGZmZmM0OC4uMDQxNTBlNjJmOTk4IDEw
MDY0NAo+ID4gPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jCj4gPiA+ICsr
KyBiL2FyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMKPiA+ID4gQEAgLTEwNiw2ICsxMDYs
NyBAQCBzdGF0aWMgdm9pZCBod3Byb2JlX2lzYV9leHQwKHN0cnVjdCByaXNjdl9od3Byb2JlICpw
YWlyLAo+ID4gPiAgICAgICAgICAgICAgIEVYVF9LRVkoWkNBKTsKPiA+ID4gICAgICAgICAgICAg
ICBFWFRfS0VZKFpDQik7Cj4gPiA+ICAgICAgICAgICAgICAgRVhUX0tFWShaQ01PUCk7Cj4gPiA+
ICsgICAgICAgICAgICAgRVhUX0tFWShaSUNCT00pOwo+ID4gPiAgICAgICAgICAgICAgIEVYVF9L
RVkoWklDQk9aKTsKPiA+ID4gICAgICAgICAgICAgICBFWFRfS0VZKFpJQ09ORCk7Cj4gPiA+ICAg
ICAgICAgICAgICAgRVhUX0tFWShaSUhJTlROVEwpOwo+ID4gPiBAQCAtMjc4LDYgKzI3OSwxMSBA
QCBzdGF0aWMgdm9pZCBod3Byb2JlX29uZV9wYWlyKHN0cnVjdCByaXNjdl9od3Byb2JlICpwYWly
LAo+ID4gPiAgICAgICAgICAgICAgIGlmIChod3Byb2JlX2V4dDBfaGFzKGNwdXMsIFJJU0NWX0hX
UFJPQkVfRVhUX1pJQ0JPWikpCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICBwYWlyLT52YWx1
ZSA9IHJpc2N2X2Nib3pfYmxvY2tfc2l6ZTsKPiA+ID4gICAgICAgICAgICAgICBicmVhazsKPiA+
ID4gKyAgICAgY2FzZSBSSVNDVl9IV1BST0JFX0tFWV9aSUNCT01fQkxPQ0tfU0laRToKPiA+ID4g
KyAgICAgICAgICAgICBwYWlyLT52YWx1ZSA9IDA7Cj4gPiA+ICsgICAgICAgICAgICAgaWYgKGh3
cHJvYmVfZXh0MF9oYXMoY3B1cywgUklTQ1ZfSFdQUk9CRV9FWFRfWklDQk9NKSkKPiA+ID4gKyAg
ICAgICAgICAgICAgICAgICAgIHBhaXItPnZhbHVlID0gcmlzY3ZfY2JvbV9ibG9ja19zaXplOwo+
ID4gPiArICAgICAgICAgICAgIGJyZWFrOwo+ID4gPiAgICAgICBjYXNlIFJJU0NWX0hXUFJPQkVf
S0VZX0hJR0hFU1RfVklSVF9BRERSRVNTOgo+ID4gPiAgICAgICAgICAgICAgIHBhaXItPnZhbHVl
ID0gdXNlcl9tYXhfdmlydF9hZGRyKCk7Cj4gPiA+ICAgICAgICAgICAgICAgYnJlYWs7Cj4gPgo+
IAo+IFRoYW5rcywKPiBZdW5odWkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
