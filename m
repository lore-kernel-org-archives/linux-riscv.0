Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21053C5B543
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 06:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yx++VXr0GRxUmdsCI7MKWAYRBMyTaBWoruJIR7NsXuc=; b=x4FR7ajC7qE1q+
	j+7kj8SsASOOKMSnKrWEf1Dilrxk6324uHVDMwSDD+RSlF7QNJeZYd447nW39aSWSj075jCi9XhA6
	RyxJuhHe98NstQsN3vbpMqOorcIOlIGHZaAJjQKYOec53M+tLiFB5CeEtdgNkkADrPlYdr4ELMQY2
	90p3xDjcY/OITqxqSnde7jYgbi/AaDi2FwX6a7eH+ykctyM9vqxnfMXwd9IX/0HMevpvoixQOES51
	W10i40dCjj3vccX0nj//cYXzU8SmLL5baHClW/oYsDhM4V0tDJjhKnSaQAWH62IoFAR4kn2jG0lVR
	NjQWNTGrdX3GueVnhR8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOsPj-00000005vRQ-3Tzf;
	Tue, 10 Jun 2025 06:24:51 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOsNY-00000005v5D-1t1v
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 06:22:37 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5532a30ac45so4683764e87.0
        for <linux-riscv@lists.infradead.org>; Mon, 09 Jun 2025 23:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749536555; x=1750141355; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DB4ehjm6ObGiT+zk3hEYWsaNwCd4xVOzRB3uomCd3eo=;
        b=Ms86RnwbHx0r0CjWqrQDJjCbcrzWVPDE6Q722L+uF915S99D8HyINf4z3Dm7p57OE+
         7dAslI4b3m158KziWLvGqpSK5FtJGioaO+ZDY2pJ5+TccLoLxowWEyHl9w+zzDwf3YfG
         0QgOpI8QvwurNXHqP+GHEOYX4OMcdhCn7czyQ3P575/IrpvsRhd9Y71L0+08elRUnI+r
         FELuVntNCvteZ9S+z0pCRqHLX8CKQXIlfHbbTIZLs83BdpdfrTmef+n3yjGb0/o7noCz
         PUXqNQAkJgqpZfC6JuYlapxSuMGV8U8wyLURDql1/O5gpWJ7y8uUo7IGVNoNGs/QL/Xo
         DknA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749536555; x=1750141355;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DB4ehjm6ObGiT+zk3hEYWsaNwCd4xVOzRB3uomCd3eo=;
        b=mMWlFtQoZgiqxUkNlC2dFaISssL/J//FyLVuSeOeumo6sJqABnk2JM/taf9xFXau+A
         bVjBIstO2slJnzp9fXp3XL08WQLclAAQeeCpg8i4kU3M+JeFvqYOyJxz0M28O07S/vh+
         7FlQkE8s4QDGK2l4blGIGae690qMmfU9fk7V3zQrUKPhss40ipZVzX2h682URoLmgmKQ
         CREwm4nN17fJb+8nIdgkwn3CkN1h3BEl2BuGU1fUNuXeaShLEkjrXOrqmIiG7esSOcMK
         mB8F7N+5ftJ0jN+0lDcweSfEou4zjg7aL1Wl8BOVf7OCjgONEzquOUMY9TLOIH/kS2rQ
         8q+A==
X-Forwarded-Encrypted: i=1; AJvYcCWOdWRfQipLo5/v3Uq0PrlAcU4SkgbnikFAWXi/anp8kBNioMZ4dkbyV1ScZjRf63CwBaQXv6TdbRLq9w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzq3CPpkJ48mHmJZt1lV3g/Iok5NGI12NeHvadD3GvMpQEAL8VG
	oByR3NqJNp62vClHYjcC+SKzCPlUTwejuOGf/bIrxAnuoYulXPPRyh7eJazqavcQp4cgFbdb3+W
	gYmZS7Gpt/KVPeMIgFIBi3+hdZ+WVbkYqw/XS8HwA2g==
X-Gm-Gg: ASbGncuGcHX7ljrgYouK6y3w2BCE4knCWmOEVIbud2LgryCVTTnj9iELW8lAYIisji5
	5CzALS25lJKHOgQqu0uFdxxAB37HMUVhCDI7Ki1hkZyNXOCnDNyA3JrCSb+RtzPPdogE0X5K1ym
	RtXVp1YfWFpeC0T/BQlYAmq9L1ReKRrXIlM9W96T+l1VJr
X-Google-Smtp-Source: AGHT+IFgemJZ7kG2F8XgEhfvR0SOkaw84uYimQM0ic6wTdIsKvJiAdX6chuiGxpnG0pLj9VEVULnGD9buu+lY7bXnsc=
X-Received: by 2002:a05:6512:3d88:b0:553:29cc:c49c with SMTP id
 2adb3069b0e04-55393181e5emr633542e87.7.1749536554598; Mon, 09 Jun 2025
 23:22:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
 <20250525084710.1665648-13-apatel@ventanamicro.com> <c691cf5e-695e-4a29-b31a-76b3376442b2@linux.dev>
In-Reply-To: <c691cf5e-695e-4a29-b31a-76b3376442b2@linux.dev>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 10 Jun 2025 11:52:22 +0530
X-Gm-Features: AX0GCFvoavACeRUD8FpjiBKHCKwOiwWVItSFykOssn8ajeKua3l6UtUtY_QL-G4
Message-ID: <CAK9=C2U-oFe6QpJZ36yqCzbvv0x6+m8nBYfPOjd61hRaW1cxZQ@mail.gmail.com>
Subject: Re: [PATCH v4 12/23] dt-bindings: Add RPMI system MSI interrupt
 controller bindings
To: Atish Patra <atish.patra@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_232236_486596_DF96EFEC 
X-CRM114-Status: GOOD (  20.96  )
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
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Michael Turquette <mturquette@baylibre.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Anup Patel <anup@brainfault.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Jassi Brar <jassisinghbrar@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Rahul Pathak <rpathak@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrew Jones <ajones@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gU2F0LCBKdW4gNywgMjAyNSBhdCA0OjMz4oCvQU0gQXRpc2ggUGF0cmEgPGF0aXNoLnBhdHJh
QGxpbnV4LmRldj4gd3JvdGU6Cj4KPgo+IE9uIDUvMjUvMjUgMTo0NiBBTSwgQW51cCBQYXRlbCB3
cm90ZToKPiA+IEFkZCBkZXZpY2UgdHJlZSBiaW5kaW5ncyBmb3IgdGhlIFJQTUkgc3lzdGVtIE1T
SSBzZXJ2aWNlIGdyb3VwCj4gPiBiYXNlZCBpbnRlcnJ1cHQgY29udHJvbGxlciBmb3IgdGhlIHN1
cGVydmlzb3Igc29mdHdhcmUuCj4gPgo+ID4gVGhlIFJQTUkgc3lzdGVtIE1TSSBzZXJ2aWNlIGdy
b3VwIGlzIGRlZmluZWQgYnkgdGhlIFJJU0MtVgo+ID4gcGxhdGZvcm0gbWFuYWdlbWVudCBpbnRl
cmZhY2UgKFJQTUkpIHNwZWNpZmljYXRpb24uCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQW51cCBQ
YXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+Cj4gPiAtLS0KPiA+ICAgLi4uL3Jpc2N2LHJw
bWktc3lzdGVtLW1zaS55YW1sICAgICAgICAgICAgICAgIHwgNzQgKysrKysrKysrKysrKysrKysr
Kwo+ID4gICAxIGZpbGUgY2hhbmdlZCwgNzQgaW5zZXJ0aW9ucygrKQo+ID4gICBjcmVhdGUgbW9k
ZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVycnVwdC1jb250
cm9sbGVyL3Jpc2N2LHJwbWktc3lzdGVtLW1zaS55YW1sCj4gPgo+ID4gZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9yaXNj
dixycG1pLXN5c3RlbS1tc2kueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9pbnRlcnJ1cHQtY29udHJvbGxlci9yaXNjdixycG1pLXN5c3RlbS1tc2kueWFtbAo+ID4gbmV3
IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uYWMxM2NlYzA2NjZlCj4g
PiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvcmlzY3YscnBtaS1zeXN0ZW0tbXNpLnlhbWwKPiA+IEBA
IC0wLDAgKzEsNzQgQEAKPiA+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1v
bmx5IE9SIEJTRC0yLUNsYXVzZSkKPiA+ICslWUFNTCAxLjIKPiA+ICstLS0KPiA+ICskaWQ6IGh0
dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2ludGVycnVwdC1jb250cm9sbGVyL3Jpc2N2LHJw
bWktc3lzdGVtLW1zaS55YW1sIwo+ID4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9t
ZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+ID4gKwo+ID4gK3RpdGxlOiBSSVNDLVYgUlBNSSBzeXN0
ZW0gTVNJIHNlcnZpY2UgZ3JvdXAgYmFzZWQgaW50ZXJydXB0IGNvbnRyb2xsZXIKPiA+ICsKPiA+
ICttYWludGFpbmVyczoKPiA+ICsgIC0gQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4K
PiA+ICsKPiA+ICtkZXNjcmlwdGlvbjogfAo+ID4gKyAgVGhlIFJJU0MtViBQbGF0Zm9ybSBNYW5h
Z2VtZW50IEludGVyZmFjZSAoUlBNSSkgWzFdIGRlZmluZXMgYQo+ID4gKyAgbWVzc2FnaW5nIHBy
b3RvY29sIHdoaWNoIGlzIG1vZHVsYXIgYW5kIGV4dGVuc2libGUuIFRoZSBzdXBlcnZpc29yCj4g
PiArICBzb2Z0d2FyZSBjYW4gc2VuZC9yZWNlaXZlIFJQTUkgbWVzc2FnZXMgdmlhIFNCSSBNUFhZ
IGV4dGVuc2lvbiBbMl0KPiA+ICsgIG9yIHNvbWUgZGVkaWNhdGVkIHN1cGVydmlzb3ItbW9kZSBS
UE1JIHRyYW5zcG9ydC4KPiA+ICsKPiA+ICsgIFRoZSBSUE1JIHNwZWNpZmljYXRpb24gWzFdIGRl
ZmluZXMgc3lzdGVtIE1TSSBzZXJ2aWNlIGdyb3VwIHdoaWNoCj4gPiArICBhbGxvdyBhcHBsaWNh
dGlvbiBwcm9jZXNzb3JzIHRvIHJlY2VpdmUgTVNJcyB1cG9uIHN5c3RlbSBldmVudHMKPiA+ICsg
IHN1Y2ggYXMgUDJBIGRvb3JiZWxsLCBncmFjZWZ1bCBzaHV0ZG93bi9yZWJvb3QgcmVxdWVzdCwg
Q1BVIGhvdHBsdWcKPiA+ICsgIGV2ZW50LCBtZW1vcnkgaG90cGx1ZyBldmVudCwgZXRjIGZyb20g
dGhlIHBsYXRmb3JtIG1pY3JvY29udHJvbGxlci4KPiA+ICsgIFRoZSBzdXBlcnZpc29yIHNvZnR3
YXJlIGNhbiBhY2Nlc3MgUlBNSSBzeXN0ZW0gTVNJIHNlcnZpY2UgZ3JvdXAgdmlhCj4gPiArICBT
QkkgTVBYWSBjaGFubmVsIG9yIHNvbWUgZGVkaWNhdGVkIHN1cGVydmlzb3ItbW9kZSBSUE1JIHRy
YW5zcG9ydC4KPiA+ICsKPiA+ICsgID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT0KPiA+ICsgIFJlZmVyZW5jZXMKPiA+ICsgID09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT0KPiA+ICsKPiA+ICsgIFsxXSBSSVNDLVYgUGxhdGZvcm0gTWFu
YWdlbWVudCBJbnRlcmZhY2UgKFJQTUkpCj4gPiArICAgICAgaHR0cHM6Ly9naXRodWIuY29tL3Jp
c2N2LW5vbi1pc2EvcmlzY3YtcnBtaS9yZWxlYXNlcwo+ID4gKwo+ID4gKyAgWzJdIFJJU0MtViBT
dXBlcnZpc29yIEJpbmFyeSBJbnRlcmZhY2UgKFNCSSkKPiA+ICsgICAgICBodHRwczovL2dpdGh1
Yi5jb20vcmlzY3Ytbm9uLWlzYS9yaXNjdi1zYmktZG9jL3JlbGVhc2VzCj4gPiArCj4gbml0OiBT
YW1lIGNvbW1lbnQgYXMgcHJldmlvdXMgcGF0Y2guCgpMaWtlIG1lbnRpb25lZCBpbiB0aGUgcHJl
dmlvdXMgcGF0Y2gsIEkgd2lsbCBhZGQgdGhlIHNwZWMgdmVyc2lvbiB0byB0aGUgdGV4dC4KCj4g
PiArYWxsT2Y6Cj4gPiArICAtICRyZWY6IC9zY2hlbWFzL2ludGVycnVwdC1jb250cm9sbGVyLnlh
bWwjCj4gPiArCj4gPiArcHJvcGVydGllczoKPiA+ICsgIGNvbXBhdGlibGU6Cj4gPiArICAgIGRl
c2NyaXB0aW9uOgo+ID4gKyAgICAgIEludGVuZGVkIGZvciB1c2UgYnkgdGhlIHN1cGVydmlzb3Ig
c29mdHdhcmUuCj4gPiArICAgIGNvbnN0OiByaXNjdixycG1pLXN5c3RlbS1tc2kKPiA+ICsKPiA+
ICsgIG1ib3hlczoKPiA+ICsgICAgbWF4SXRlbXM6IDEKPiA+ICsgICAgZGVzY3JpcHRpb246Cj4g
PiArICAgICAgTWFpbGJveCBjaGFubmVsIG9mIHRoZSB1bmRlcmx5aW5nIFJQTUkgdHJhbnNwb3J0
IG9yIFNCSSBtZXNzYWdlIHByb3h5IGNoYW5uZWwuCj4gPiArCj4gPiArICBtc2ktcGFyZW50OiB0
cnVlCj4gPiArCj4gPiArICBpbnRlcnJ1cHQtY29udHJvbGxlcjogdHJ1ZQo+ID4gKwo+ID4gKyAg
IiNpbnRlcnJ1cHQtY2VsbHMiOgo+ID4gKyAgICBjb25zdDogMQo+ID4gKwo+ID4gK3JlcXVpcmVk
Ogo+ID4gKyAgLSBjb21wYXRpYmxlCj4gPiArICAtIG1ib3hlcwo+ID4gKyAgLSBtc2ktcGFyZW50
Cj4gPiArICAtIGludGVycnVwdC1jb250cm9sbGVyCj4gPiArICAtICIjaW50ZXJydXB0LWNlbGxz
Igo+ID4gKwo+ID4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQo+ID4gKwo+ID4gK2V4YW1w
bGVzOgo+ID4gKyAgLSB8Cj4gPiArICAgIGludGVycnVwdC1jb250cm9sbGVyIHsKPiA+ICsgICAg
ICAgIGNvbXBhdGlibGUgPSAicmlzY3YscnBtaS1zeXN0ZW0tbXNpIjsKPiA+ICsgICAgICAgIG1i
b3hlcyA9IDwmbXB4eV9tYm94IDB4MjAwMCAweDA+Owo+ID4gKyAgICAgICAgbXNpLXBhcmVudCA9
IDwmaW1zaWNfc2xldmVsPjsKPiA+ICsgICAgICAgIGludGVycnVwdC1jb250cm9sbGVyOwo+ID4g
KyAgICAgICAgI2ludGVycnVwdC1jZWxscyA9IDwxPjsKPiA+ICsgICAgfTsKPiA+ICsuLi4KPgo+
IE90aGVyd2lzZSwgTEdUTS4KPiBSZXZpZXdlZC1ieTogQXRpc2ggUGF0cmEgPGF0aXNocEByaXZv
c2luYy5jb20+Cj4KPgo+CgpSZWdhcmRzLApBbnVwCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
