Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DC26EF0702
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Feb 2026 03:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x97wQU4Lc55iMUJvExzmY+JI+mE/apjqpMYOcvNd3ug=; b=mSYLT1gco2jf2j
	lzDrEX9/pG4Rs13JaFe2o3LgcLoqbJLfNpRwWFanDK85POZGNhqMgU9TwdcIlQV3hQGMmAyPEEnqv
	L8XNH9+2+2ogMcUNikR5agdPnjbwy9VhAzseg9vD/iUmWBr6WP4xI1eGwZIrpm4Lm17lpROVzVgJg
	romfNG7Pz+kJQ0HXCeJwDd3PrjvMcHKX01yEXTHtMVpCMLcLkdFUA1i6uHZlR4KmPqAnseorUWKD9
	/XvRCcZbvc3OCWbhFuyWJFB6tjwcG922Dg0uPQjLNIoEgzH0HtiHIhh+7stDyvfo8R9ukH/xgfecV
	rV/StV/RBqtB5LOzWIxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpI4h-0000000EmNE-0Ayk;
	Mon, 09 Feb 2026 03:36:35 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpI4e-0000000EmMi-2XgO
	for linux-riscv@lists.infradead.org;
	Mon, 09 Feb 2026 03:36:34 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-6594382a264so4724168a12.1
        for <linux-riscv@lists.infradead.org>; Sun, 08 Feb 2026 19:36:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770608187; cv=none;
        d=google.com; s=arc-20240605;
        b=Gp4tDTXS1WTGvzebWmmUz2xMxyE1nYtFYWhOPYWlOhe4Pzv4GbjT/Ofiw+ViuZJaz4
         272LIH80MM20HEQZ0uD9U0RDdcO5roWIkpROB6jnfSKkyU/sm18LHXgcn6O+LA1Fi6XS
         eY6R/FD8PDdUMz9JoUz2qIvedvpeY2g5Q8DWYy7e4ovSRr9uIOqGe2XFKS+gTakiZjeM
         Rs/Ajwr4SaM5kElySoy2Fm1Qhz4f1tS5g2ep/H9dGuia2hLA1UDNMOLHvl1q5+9EcQgL
         YX4yoabshVv+oBP6TCjmzhvnCtr0RnH3SZqYgWZu4KPQLWwNysVOGUB3hKtb60ViCTcz
         0+7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dgf3bFVZrp6swEDkel5fmNbp8R9hFafE4rfJYRWPjoA=;
        fh=p8N4nDR62Qj3Qcp47TCdcpHP36vnwebnv05V+tLry4k=;
        b=V8UYtQ9Ybo8GThopt2MyRyJMlJ4WuNWNr4cKwb93U7/kJFjjY+GuvQcYtiK7LpVqic
         5hFoDf7AbpOiGxQ0lrRzXwSrtNksAKL6d8Al8BWQBeHxte5M8/pg3tgHCBhtGenalyWJ
         ccj1M5LuFfWI47Gd4tDJ2GLgBHj6T/Ei6x2ixsPzgaEDG5z4n4U9NNJC2eC9n4SodRF4
         mEZtusOaFkyp7bNKQoq3eGWjE9WLtRbXq/MTSmWSz3OnWupWD8n6EFSL5SJuuZfZacRp
         CldSVP985+urkBCg3VHeksrRGJgDdjVfL12MEI1RztjJjRxuf/eNUF7RBipbm56KCGDe
         YmTQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1770608187; x=1771212987; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dgf3bFVZrp6swEDkel5fmNbp8R9hFafE4rfJYRWPjoA=;
        b=CDAtKcliNmWqlTnbI7tJknpzAiug0JHUSJYIFSmtxu3MabNzWISfTIG2ee9E4Kravv
         5Vbh6z6l2skomj/pSQcelrvQ73c/e22ECzJeiqtucYUwlAivXLulpT7sGhXEotBY5VX2
         aZsiATNZU6e19G/Wo7wEWoW+On5zsC6MI32+4EUQ2rX26lJy2Z/Otir9sajRGsfdPIH1
         UbRkwYu4q6Fg0Ald0OesbxfdS0Sgx89Ewke20vlLeGXHp4h6enfiIIpzi9ptWNffqFyV
         +d3L0pyrQfNaVvSnlkNk4kREu5QMsjicVvtY6RWujco5NitxMZ57I5HpxQeRAzySOPa7
         EIog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770608187; x=1771212987;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dgf3bFVZrp6swEDkel5fmNbp8R9hFafE4rfJYRWPjoA=;
        b=kZU49cs84YohOwQnhQ25rG0LoDTXQJ9Jpfo2jKyR0VtAN7Z6L89xla4lEI9znJw/WQ
         7k4snqawr0ksZCbN+dZRmxTIvYGHrkUZcMZaezHZYPWotB1/aSuSxBt8Te4TQo86GNpT
         4ncwW1sKrG39+kmTtj77hem4lvuF5wMu1ORaU5lqfdcrFGBrKn9JFNquHp+bZzgf5d/D
         Yt8H5a+INePjh8clAir12KsogIUWPOWOa2RhAqMjQ8oqUVu8tWZUDfBcA/XPls5yg28B
         pgWss54ve+7MlrFkd+tIfWmP9xZyiffheGLpjvC9AaHrjhVqLJSn8+6gmD9tljEBs3YV
         qnnA==
X-Forwarded-Encrypted: i=1; AJvYcCUJBDSdohDQyU+/ICTha/DagFzeMj2ZpwQK4cFUus4nNUfBoBX1NUEvTmSCl7oTMDyOmF6wQ3z3eBwrKQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+ZV0mLhbcbPleb7pm/vK8r3vSzv4IXHox7HJWtIWv2j/e6nWu
	/xrW0SIqN7kBvvUKu7FCbkexzhB04spy2hkZ4twE9B3MucOSDXajtLQaYW5drhHCYqIbvSFQ9Io
	nHIb5T789fgOmxmN4t3pgjLQFVwb/NOURQzQgHcQd3Q==
X-Gm-Gg: AZuq6aK5cSWOKzBLalGAPQ7lCWPnNVSsN7IAOtK95+2LwnQje2uIYgLAWhYpTux27Sy
	TEHMQLJbcWy782ywHbyNiDGoI/9pR7cEyvq9gmiLliLRg0+VpdZc819i90q5ABzqb+TUPTxrky4
	zWXaAoCc3I+gnhDaV6OZpjLKV/gV9HA9KFZwWHQ56syQgvCSvJBQ4HIOmXAWHrVJqR+PIT3/MFq
	p7f0TfRB1/bQqEXmVOreTC9z51SkMSh4T6pQ86J0gd0DYRc66Znr8jAb48NOChH5ofk8qKPlUmf
	Y4U7
X-Received: by 2002:a05:6402:5188:b0:658:cc59:1624 with SMTP id
 4fb4d7f45d1cf-65984116e20mr4771993a12.5.1770608187211; Sun, 08 Feb 2026
 19:36:27 -0800 (PST)
MIME-Version: 1.0
References: <20260128-ssqosid-cbqri-v2-0-dca586b091b9@kernel.org>
 <20260128-ssqosid-cbqri-v2-3-dca586b091b9@kernel.org> <CAEEQ3wkqC4jFf1LGgh2c6dgGwT=tuvpFV+D4fiw40P3LZ7_8hg@mail.gmail.com>
 <aYfnbc3T81RRxz5r@gen8>
In-Reply-To: <aYfnbc3T81RRxz5r@gen8>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Mon, 9 Feb 2026 11:36:16 +0800
X-Gm-Features: AZwV_QgwWHnA5m1kxr57YAvjsSYdUx_1aHt2EEPh2W2BDaodUZAsXnYDqE8xcQ8
Message-ID: <CAEEQ3wntQWi_itwA716qjaFBMd18FR3nb6rMz5STw+DGtYjp+A@mail.gmail.com>
Subject: Re: [External] [PATCH RFC v2 03/17] RISC-V: Add support for srmcfg
 CSR from Ssqosid ext
To: Drew Fustini <fustini@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260208_193632_722109_1593B3C0 
X-CRM114-Status: GOOD (  28.51  )
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
Cc: Atish Patra <atish.patra@linux.dev>, Adrien Ricciardi <aricciardi@baylibre.com>, Atish Kumar Patra <atishp@rivosinc.com>, Conor Dooley <conor+dt@kernel.org>, Nicolas Pitre <npitre@baylibre.com>, devicetree@vger.kernel.org, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, guo.wenjia23@zte.com.cn, linux-riscv@lists.infradead.org, Rob Herring <robh@kernel.org>, Peter Newman <peternewman@google.com>, x86@kernel.org, acpica-devel@lists.linux.dev, Robert Moore <robert.moore@intel.com>, liu.qingtao2@zte.com.cn, linux-acpi@vger.kernel.org, Ben Horgan <ben.horgan@arm.com>, James Morse <james.morse@arm.com>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, Dave Martin <Dave.Martin@arm.com>, Len Brown <lenb@kernel.org>, Fenghua Yu <fenghua.yu@intel.com>, Chen Pei <cp0613@linux.alibaba.com>, Albert Ou <aou@eecs.berkeley.edu>, =?UTF-8?Q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>, Babu Moger <babu.moger@amd.com>, Weiwei Li <liwei1518@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, Ved Shanbhogue <ved@rivosinc.com>, Reinette Chatre <reinette.chatre@intel.com>, Vasudevan Srinivasan <vasu@rivosinc.com>, Tony Luck <tony.luck@intel.com>, Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Paul Walmsley <pjw@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgRHJldywKCk9uIFN1biwgRmViIDgsIDIwMjYgYXQgOTozMeKAr0FNIERyZXcgRnVzdGluaSA8
ZnVzdGluaUBrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIE1vbiwgRmViIDAyLCAyMDI2IGF0IDEx
OjE3OjUyQU0gKzA4MDAsIHl1bmh1aSBjdWkgd3JvdGU6Cj4gPiBIaSBEcmV3LAo+ID4KPiA+IE9u
IFRodSwgSmFuIDI5LCAyMDI2IGF0IDQ6MjjigK9BTSBEcmV3IEZ1c3RpbmkgPGZ1c3RpbmlAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4gPiA+Cj4gPiA+IEFkZCBzdXBwb3J0IGZvciB0aGUgc3JtY2ZnIENT
UiBkZWZpbmVkIGluIHRoZSBTc3Fvc2lkIElTQSBleHRlbnNpb24KPiA+ID4gKFN1cGVydmlzb3It
bW9kZSBRdWFsaXR5IG9mIFNlcnZpY2UgSUQpLiBUaGUgQ1NSIGNvbnRhaW5zIHR3byBmaWVsZHM6
Cj4gPiA+Cj4gPiA+ICAgLSBSZXNvdXJjZSBDb250cm9sIElEIChSQ0lEKSB1c2VkIGRldGVybWlu
ZSByZXNvdXJjZSBhbGxvY2F0aW9uCj4gPiA+ICAgLSBNb25pdG9yaW5nIENvdW50ZXIgSUQgKE1D
SUQpIHVzZWQgdG8gdHJhY2sgcmVzb3VyY2UgdXNhZ2UKPiA+ID4KPiA+ID4gUmVxdWVzdHMgZnJv
bSBhIGhhcnQgdG8gc2hhcmVkIHJlc291cmNlcyBsaWtlIGNhY2hlIHdpbGwgYmUgdGFnZ2VkIHdp
dGgKPiA+ID4gdGhlc2UgSURzLiBUaGlzIGFsbG93cyB0aGUgdXNhZ2Ugb2Ygc2hhcmVkIHJlc291
cmNlcyB0byBiZSBhc3NvY2lhdGVkCj4gPiA+IHdpdGggdGhlIHRhc2sgY3VycmVudGx5IHJ1bm5p
bmcgb24gdGhlIGhhcnQuCj4gPiA+Cj4gPiA+IEEgc3JtY2ZnIGZpZWxkIGlzIGFkZGVkIHRvIHRo
cmVhZF9zdHJ1Y3QgYW5kIGhhcyB0aGUgc2FtZSBmb3JtYXQgYXMgdGhlCj4gPiA+IHNybWNmZyBD
U1IuIFRoaXMgYWxsb3dzIHRoZSBzY2hlZHVsZXIgdG8gc2V0IHRoZSBoYXJ0J3Mgc3JtY2ZnIENT
UiB0bwo+ID4gPiBjb250YWluIHRoZSBSQ0lEIGFuZCBNQ0lEIGZvciB0aGUgdGFzayB0aGF0IGlz
IGJlaW5nIHNjaGVkdWxlZCBpbi4gVGhlCj4gPiA+IHNybWNmZyBDU1IgaXMgb25seSB3cml0dGVu
IHRvIGlmIHRoZSB0aHJlYWRfc3RydWN0LnNybWNmZyBpcyBkaWZmZXJlbnQKPiA+ID4gdGhhbiB0
aGUgY3VycmVudCB2YWx1ZSBvZiB0aGUgQ1NSLgo+ID4gPgo+ID4gPiBBIHBlci1jcHUgdmFyaWFi
bGUgY3B1X3NybWNmZyBpcyB1c2VkIHRvIG1pcnJvciB0aGF0IHN0YXRlIG9mIHRoZSBDU1IuCj4g
PiA+IFRoaXMgaXMgYmVjYXVzZSBhY2Nlc3MgdG8gTDFEIGhvdCBtZW1vcnkgc2hvdWxkIGJlIHNl
dmVyYWwgdGltZXMgZmFzdGVyCj4gPiA+IHRoYW4gYSBDU1IgcmVhZC4gQWxzbywgaW4gdGhlIGNh
c2Ugb2YgdmlydHVhbGl6YXRpb24sIGFjY2Vzc2VzIHRvIHRoaXMKPiA+ID4gQ1NSIGFyZSB0cmFw
cGVkIGluIHRoZSBoeXBlcnZpc29yLgo+ID4gPgo+ID4gPiBMaW5rOiBodHRwczovL2dpdGh1Yi5j
b20vcmlzY3YvcmlzY3Ytc3Nxb3NpZC9yZWxlYXNlcy90YWcvdjEuMAo+ID4gPiBDby1kZXZlbG9w
ZWQtYnk6IEtvcm5lbCBEdWzEmWJhIDxtaW5kYWxAc2VtaWhhbGYuY29tPgo+ID4gPiBTaWduZWQt
b2ZmLWJ5OiBLb3JuZWwgRHVsxJliYSA8bWluZGFsQHNlbWloYWxmLmNvbT4KPiA+ID4gW2Z1c3Rp
bmk6IHJlbmFtZSBjc3IsIHJlZmFjdG9yIHN3aXRjaF90bywgcmViYXNlIG9uIHVwc3RyZWFtXQo+
ID4gPiBTaWduZWQtb2ZmLWJ5OiBEcmV3IEZ1c3RpbmkgPGZ1c3RpbmlAa2VybmVsLm9yZz4KPiBb
Li5dCj4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Fvcy5oIGIvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9xb3MuaAo+ID4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4g
PiBpbmRleCAwMDAwMDAwMDAwMDAuLjg0ODMwZDdjNmRjNAo+ID4gPiAtLS0gL2Rldi9udWxsCj4g
PiA+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcW9zLmgKPiA+ID4gQEAgLTAsMCArMSw0
MSBAQAo+ID4gPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgKi8KPiA+ID4g
KyNpZm5kZWYgX0FTTV9SSVNDVl9RT1NfSAo+ID4gPiArI2RlZmluZSBfQVNNX1JJU0NWX1FPU19I
Cj4gPiA+ICsKPiA+ID4gKyNpZmRlZiBDT05GSUdfUklTQ1ZfSVNBX1NTUU9TSUQKPiA+ID4gKwo+
ID4gPiArI2luY2x1ZGUgPGxpbnV4L3NjaGVkLmg+Cj4gPiA+ICsjaW5jbHVkZSA8bGludXgvanVt
cF9sYWJlbC5oPgo+ID4gPiArCj4gPiA+ICsjaW5jbHVkZSA8YXNtL2JhcnJpZXIuaD4KPiA+ID4g
KyNpbmNsdWRlIDxhc20vY3NyLmg+Cj4gPiA+ICsjaW5jbHVkZSA8YXNtL2h3Y2FwLmg+Cj4gPiA+
ICsKPiA+ID4gKy8qIGNhY2hlZCB2YWx1ZSBvZiBzcm1jZmcgY3NyIGZvciBlYWNoIGNwdSAqLwo+
ID4gPiArREVDTEFSRV9QRVJfQ1BVKHUzMiwgY3B1X3NybWNmZyk7Cj4gPiA+ICsKPiA+ID4gK3N0
YXRpYyBpbmxpbmUgdm9pZCBfX3N3aXRjaF90b19zcm1jZmcoc3RydWN0IHRhc2tfc3RydWN0ICpu
ZXh0KQo+ID4gPiArewo+ID4gPiArICAgICAgIHUzMiAqY3B1X3NybWNmZ19wdHIgPSB0aGlzX2Nw
dV9wdHIoJmNwdV9zcm1jZmcpOwo+ID4gPiArICAgICAgIHUzMiB0aHJlYWRfc3JtY2ZnOwo+ID4g
PiArCj4gPiA+ICsgICAgICAgdGhyZWFkX3NybWNmZyA9IFJFQURfT05DRShuZXh0LT50aHJlYWQu
c3JtY2ZnKTsKPiA+Cj4gPgo+ID4gRmlyc3Qgc2V0IHRoZSBjcHVfbGlzdCwgYW5kIHRoZW4gdGhl
IGNvbmRpdGlvbiB0aHJlYWRfc3JtY2ZnICE9Cj4gPiAqY3B1X3NybWNmZ19wdHIgd2lsbCBub3Qg
YmUgc2F0aXNmaWVkLiBJcyBhIGRlZmF1bHQgdmFsdWUgcmVxdWlyZWQKPiA+IGhlcmU/IEJvdGgg
Y29kZSBwYXRocyBmb3IgY3B1X2xpc3QgYW5kIHRhc2tzIGFyZSBjb21wYXJlZCBhZ2FpbnN0IHRo
ZQo+ID4gZGVmYXVsdCB2YWx1ZTsgeW91IG1heSByZWZlciB0byB0aGUgaW1wbGVtZW50YXRpb24g
b2YgbXBhbS4KPgo+IEknbSBoYXZpbmcgdHJvdWJsZSBmaW5kaW5nIGNwdV9saXN0IGJ1dCBJIHRo
aW5rIHRoYXQgaXQgZG9lcyBtYWtlIHNlbnNlCj4gdG8gc2V0IHRoZSBpbml0aWFsIHZhbHVlLgo+
Cj4gV2VyZSB5b3UgdGhpbmtpbmcgSSBzaG91bGQgbG9vayBhdCBtcGFtX3NldF9jcHVfZGVmYXVs
dHMoKSBpbgo+IHRoZSBtcGFtX3Jlc2N0cmxfZ2x1ZV92NCBbMV0gYnJhbmNoPwoKVG8gYmUgZXhh
Y3QsIGl0J3MgImNwdXNfbGlzdCIuICB5ZXAsIHdlIG5lZWQgbG9naWMgc2ltaWxhciB0byB0aGF0
IG9mCmFybTY0X21wYW1fZGVmYXVsdC4KCj4KPiBUaGFua3MsCj4gRHJldwo+Cj4gWzFdIGh0dHBz
Oi8vZ2l0bGFiLmFybS5jb20vbGludXgtYXJtL2xpbnV4LWJoLmdpdAoKVGhhbmtzLApZdW5odWkK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
