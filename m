Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F707E7719E
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jan 2025 11:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jwK7y8Ao1TJpMjX6mep/SndqS1bPv1tionDxTsTfQPQ=; b=HmkWT4jr4CIudy
	nQGldT8VgWO2jL6f4sXrSHoC7+iyB1b0e9m0BVpAncO3qsxq8uLvdudWO6Yb+tlyUy+m622H+jN5E
	lsdyIaUOYJ4LoX67jbca2cdob4s/OYM06dkIXwcCojVufn6ps1FoccFHz+fue65aOpZG4PLln+zr8
	mOAuNoKBH27yiBTaf7wshQuU2CwzsluQwXNO35wET6j10K5qgUo7iITiSFolgcrUuIiQPpZojzgty
	ceTB9pZZd287Vqdv0m9J8gSg+2P7UqSIbwLFIe2Ajm1AoWZ4g9T8i0N50DWtsqU8+6RvdGs2iYd/8
	XWBJ2w4aWY44LEA9S4Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXIdn-00000004vH6-1Qsg;
	Mon, 13 Jan 2025 11:29:55 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXIdk-00000004vEa-3Lxf
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jan 2025 11:29:54 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-5f89aa7a101so630611eaf.2
        for <linux-riscv@lists.infradead.org>; Mon, 13 Jan 2025 03:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736767791; x=1737372591; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N1oNLuALwfKPcxcMaw300mn/ndsMj7w+nf7EvNjeH1I=;
        b=TkInEPIZ6mA0ZtuWruj6tezVuK0f+2DQmhWeB2bCLD67Z19eJdm8uBl6Ms/Mlsc8B+
         JT5Od/0VvGh+4lEah5L51Fs7Ccviu7Se0BcU/B45PxvmKR31J5jCKJidFTO1giHCkoWm
         ezdNQbzZv+teEuiNDmCaY12N7++DXcOQQqSGi5GP6uN0YuWB6TtRTFULjHz6X6RGZ+k2
         Um1O+ikjfhDJTPupJNGoP2XN7KzzOMMh57DQbU3+wWJhHhbAKyyURJhMyWFLvPIouyVN
         P7hrJkq0tVuRrsZcvphNYEj6Cv8k8FUeWITYJIxnoHUUUNnxo0HXg2aWO0D1cdfHc8TL
         zf5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736767791; x=1737372591;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N1oNLuALwfKPcxcMaw300mn/ndsMj7w+nf7EvNjeH1I=;
        b=ngd8yAMa3Uqc4nvW5PMwq0sh4LmSIBf7IIM5nHkhiUWJK3FWy5c3XNDz57cAF2pnZv
         l9f/CSK0JlW/ecSeI6SG3dtWfxuKP07ngRRA6gakwtGX9AJ+DTRLvBzchCH2frL0q1ET
         lbovDVRf3kZ36eWo7Z7mIghCkxqM+xxyo4Hp0mNyf82oZpTXOL+abRguFX5eZNo9GQVB
         FniRmTpjWyv+0eVyt8RgW5TiduxkEqz+MIoJCCsSEP8FrJxp3/Ne74c6OjZez58En88h
         SEDWsEodoVdZCU200ssvf1seZ/osqAqw2LHuUAuXMbAVRSXE2nAvrTv0laf8j4Hs8ccz
         TNCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXASVkCw5zmvNexCsh7h2PMKJO8Iixh4RcxLGzB5nVVnm4DkdAw69/dmKAaqt68uBVNy7Gaot+7l/Dwig==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8ZRrLWfshFPyaXshYV4ezOrJCjwY8o4l/Fhr9o7bzsN3DjvwB
	BxBV6IpnAiGX4KVZR+rDe3diLPO9e5hN7W6lkh3/ykRP2Xv4jI4AmgDTrQb7YxYb6flb7FA/sne
	lhpB+5tDhUxVudINBD2ktl7+Swvn+UyKBZqTU9A==
X-Gm-Gg: ASbGncv9ZJbXoW5MPhVDFF4kwZlqe4rFRUG+UbgnS+y3bNHDAl3tOn4/eXHv6Ws0Qw/
	B/DReJG3xHP4CdYVj+peiVWFnDTDQPyfY+sNVdIIe
X-Google-Smtp-Source: AGHT+IFy17OZn7f/tSfO2jEbRT7YAGzCK+oRC58OSKvdfFecQunHYY4uItTShRvfINeTtd4YufQ5rkoxaECN8na/eBk=
X-Received: by 2002:a05:6871:581e:b0:2a3:c59d:f09d with SMTP id
 586e51a60fabf-2aa066ee020mr12295921fac.14.1736767790649; Mon, 13 Jan 2025
 03:29:50 -0800 (PST)
MIME-Version: 1.0
References: <20250113083635.73826-1-cuiyunhui@bytedance.com>
 <20250113083635.73826-2-cuiyunhui@bytedance.com> <20250113-65f27ad723c0f6585f86ae7f@orel>
In-Reply-To: <20250113-65f27ad723c0f6585f86ae7f@orel>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Mon, 13 Jan 2025 19:29:39 +0800
X-Gm-Features: AbW1kvbpyOAFPxL3X1Ko2GPHhJdVip_TGmXjyMWfNjCUNBIKd-MlEVf9Wb9TG1Q
Message-ID: <CAEEQ3w=fgb7Jxg6SP_hp0Z+T0Tfb-_Pa4-CzU8PpGUKA+dHxyA@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v3 2/3] RISC-V: hwprobe: Expose Zicbom
 extension and its block size
To: Andrew Jones <ajones@ventanamicro.com>
Cc: alexghiti@rivosinc.com, andybnac@gmail.com, aou@eecs.berkeley.edu, 
	charlie@rivosinc.com, cleger@rivosinc.com, conor.dooley@microchip.com, 
	conor@kernel.org, corbet@lwn.net, evan@rivosinc.com, jesse@rivosinc.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, samuel.holland@sifive.com, 
	shuah@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_032952_843048_D78D992B 
X-CRM114-Status: GOOD (  23.76  )
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

SGkgZHJldywKCk9uIE1vbiwgSmFuIDEzLCAyMDI1IGF0IDU6MDfigK9QTSBBbmRyZXcgSm9uZXMg
PGFqb25lc0B2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IE9uIE1vbiwgSmFuIDEzLCAyMDI1
IGF0IDA0OjM2OjM0UE0gKzA4MDAsIFl1bmh1aSBDdWkgd3JvdGU6Cj4gPiBFeHBvc2UgWmljYm9t
IHRocm91Z2ggaHdwcm9iZSBhbmQgYWxzbyBwcm92aWRlIGEga2V5IHRvIGV4dHJhY3QgaXRzCj4g
PiByZXNwZWN0aXZlIGJsb2NrIHNpemUuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogWXVuaHVpIEN1
aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+Cj4gPiAtLS0KPiA+ICBEb2N1bWVudGF0aW9uL2Fy
Y2gvcmlzY3YvaHdwcm9iZS5yc3QgIHwgNiArKysrKysKPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2h3cHJvYmUuaCAgICAgIHwgMiArLQo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2Fz
bS9od3Byb2JlLmggfCAyICsrCj4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYyAg
ICAgICB8IDYgKysrKysrCj4gPiAgNCBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vYXJjaC9yaXNj
di9od3Byb2JlLnJzdCBiL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdAo+ID4g
aW5kZXggOTU1ZmJjZDE5Y2U5Li43YTQ3Y2JkYmNmOGUgMTAwNjQ0Cj4gPiAtLS0gYS9Eb2N1bWVu
dGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vYXJj
aC9yaXNjdi9od3Byb2JlLnJzdAo+ID4gQEAgLTk0LDYgKzk0LDkgQEAgVGhlIGZvbGxvd2luZyBr
ZXlzIGFyZSBkZWZpbmVkOgo+ID4gICAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9FWFRfWklD
Qk9aYDogVGhlIFppY2JveiBleHRlbnNpb24gaXMgc3VwcG9ydGVkLCBhcwo+ID4gICAgICAgICBy
YXRpZmllZCBpbiBjb21taXQgM2RkNjA2ZiAoIkNyZWF0ZSBjbW9iYXNlLXYxLjAucGRmIikgb2Yg
cmlzY3YtQ01Pcy4KPiA+Cj4gPiArICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0VYVF9aSUNC
T01gOiBUaGUgWmljYm9tIGV4dGVuc2lvbiBpcyBzdXBwb3J0ZWQsIGFzCj4gPiArICAgICAgIHJh
dGlmaWVkIGluIGNvbW1pdCAzZGQ2MDZmICgiQ3JlYXRlIGNtb2Jhc2UtdjEuMC5wZGYiKSBvZiBy
aXNjdi1DTU9zLgo+ID4gKwo+Cj4gVGhpcyBzaG91bGQgY29tZSBhZnRlciBSSVNDVl9IV1BST0JF
X0VYVF9TVVBNIHNpbmNlIHRoaXMgZG9jdW1lbnQgaGFzIHRoZQo+IGRlZmluZXMgc29ydGVkIGlu
IHRoZSBvcmRlciBpbiB3aGljaCB0aGV5IGFyZSBpbnRyb2R1Y2VkIChhbHRob3VnaCBJCj4gcGVy
c29uYWxseSB3b3VsZG4ndCBtaW5kIGlmIHdlIG9yZGVyZWQgdGhlbSBhbHBoYWJldGljYWxseSBp
bnN0ZWFkKQpPSwoKPgo+ID4gICAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9FWFRfWkJDYCBU
aGUgWmJjIGV4dGVuc2lvbiBpcyBzdXBwb3J0ZWQsIGFzIGRlZmluZWQKPiA+ICAgICAgICAgaW4g
dmVyc2lvbiAxLjAgb2YgdGhlIEJpdC1NYW5pcHVsYXRpb24gSVNBIGV4dGVuc2lvbnMuCj4gPgo+
ID4gQEAgLTI3Myw2ICsyNzYsOSBAQCBUaGUgZm9sbG93aW5nIGtleXMgYXJlIGRlZmluZWQ6Cj4g
PiAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9LRVlfWklDQk9aX0JMT0NLX1NJWkVgOiBBbiB1
bnNpZ25lZCBpbnQgd2hpY2gKPiA+ICAgIHJlcHJlc2VudHMgdGhlIHNpemUgb2YgdGhlIFppY2Jv
eiBibG9jayBpbiBieXRlcy4KPiA+Cj4gPiArKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9LRVlf
WklDQk9NX0JMT0NLX1NJWkVgOiBBbiB1bnNpZ25lZCBpbnQgd2hpY2gKPiA+ICsgIHJlcHJlc2Vu
dHMgdGhlIHNpemUgb2YgdGhlIFppY2JvbSBibG9jayBpbiBieXRlcy4KPiA+ICsKPgo+IFNob3Vs
ZCBiZSBtb3ZlZCBiZWxvdyBSSVNDVl9IV1BST0JFX0tFWV9USU1FX0NTUl9GUkVRCgpXaHkgc2hv
dWxkIGl0IGJlIG1vdmVkIGJlbG93IFJJU0NWX0hXUFJPQkVfS0VZX1RJTUVfQ1NSX0ZSRVE/CgoK
PiA+ICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0tFWV9ISUdIRVNUX1ZJUlRfQUREUkVTU2A6
IEFuIHVuc2lnbmVkIGxvbmcgd2hpY2gKPiA+ICAgIHJlcHJlc2VudCB0aGUgaGlnaGVzdCB1c2Vy
c3BhY2UgdmlydHVhbCBhZGRyZXNzIHVzYWJsZS4KPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9od3Byb2JlLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3cHJv
YmUuaAo+ID4gaW5kZXggMWNlMWRmNmQwZmYzLi44OTM3OWY5YTJlNmUgMTAwNjQ0Cj4gPiAtLS0g
YS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3cHJvYmUuaAo+ID4gKysrIGIvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9od3Byb2JlLmgKPiA+IEBAIC04LDcgKzgsNyBAQAo+ID4KPiA+ICAjaW5jbHVk
ZSA8dWFwaS9hc20vaHdwcm9iZS5oPgo+ID4KPiA+IC0jZGVmaW5lIFJJU0NWX0hXUFJPQkVfTUFY
X0tFWSAxMAo+ID4gKyNkZWZpbmUgUklTQ1ZfSFdQUk9CRV9NQVhfS0VZIDExCj4gPgo+ID4gIHN0
YXRpYyBpbmxpbmUgYm9vbCByaXNjdl9od3Byb2JlX2tleV9pc192YWxpZChfX3M2NCBrZXkpCj4g
PiAgewo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2Jl
LmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oCj4gPiBpbmRleCAzYWYx
NDJiOTlmNzcuLjg5MmRkNzFhMzc5MyAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVk
ZS91YXBpL2FzbS9od3Byb2JlLmgKPiA+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2Fz
bS9od3Byb2JlLmgKPiA+IEBAIC03Myw2ICs3Myw3IEBAIHN0cnVjdCByaXNjdl9od3Byb2JlIHsK
PiA+ICAjZGVmaW5lICAgICAgICAgICAgICBSSVNDVl9IV1BST0JFX0VYVF9aQ01PUCAgICAgICAg
ICgxVUxMIDw8IDQ3KQo+ID4gICNkZWZpbmUgICAgICAgICAgICAgIFJJU0NWX0hXUFJPQkVfRVhU
X1pBV1JTICAgICAgICAgKDFVTEwgPDwgNDgpCj4gPiAgI2RlZmluZSAgICAgICAgICAgICAgUklT
Q1ZfSFdQUk9CRV9FWFRfU1VQTSAgICAgICAgICAoMVVMTCA8PCA0OSkKPiA+ICsjZGVmaW5lICAg
ICAgICAgICAgICBSSVNDVl9IV1BST0JFX0VYVF9aSUNCT00gICAgICAgICgxVUxMIDw8IDUwKQo+
ID4gICNkZWZpbmUgUklTQ1ZfSFdQUk9CRV9LRVlfQ1BVUEVSRl8wICA1Cj4gPiAgI2RlZmluZSAg
ICAgICAgICAgICAgUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX1VOS05PV04gICAgICAgICgwIDw8
IDApCj4gPiAgI2RlZmluZSAgICAgICAgICAgICAgUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX0VN
VUxBVEVEICAgICAgICgxIDw8IDApCj4gPiBAQCAtOTAsNiArOTEsNyBAQCBzdHJ1Y3QgcmlzY3Zf
aHdwcm9iZSB7Cj4gPiAgI2RlZmluZSAgICAgICAgICAgICAgUklTQ1ZfSFdQUk9CRV9NSVNBTElH
TkVEX1NDQUxBUl9GQVNUICAgICAgICAgICAgMwo+ID4gICNkZWZpbmUgICAgICAgICAgICAgIFJJ
U0NWX0hXUFJPQkVfTUlTQUxJR05FRF9TQ0FMQVJfVU5TVVBQT1JURUQgICAgIDQKPiA+ICAjZGVm
aW5lIFJJU0NWX0hXUFJPQkVfS0VZX01JU0FMSUdORURfVkVDVE9SX1BFUkYgICAgIDEwCj4gPiAr
I2RlZmluZSBSSVNDVl9IV1BST0JFX0tFWV9aSUNCT01fQkxPQ0tfU0laRSAgMTEKPgo+IE1vdmUg
YmVsb3cgdGhlIGJpdCBkZWZpbmVzIG9mIFJJU0NWX0hXUFJPQkVfS0VZX01JU0FMSUdORURfVkVD
VE9SX1BFUkYKPiAobm90aWNlIGhvdyBpdHMgYml0IGRlZmluZXMgYXJlIGluZGVudGVkLCBpbmRp
Y2F0aW5nIHRoZXkgYmVsb25nIHRvIGl0KQpPSwoKPgo+ID4gICNkZWZpbmUgICAgICAgICAgICAg
IFJJU0NWX0hXUFJPQkVfTUlTQUxJR05FRF9WRUNUT1JfVU5LTk9XTiAgICAgICAgIDAKPiA+ICAj
ZGVmaW5lICAgICAgICAgICAgICBSSVNDVl9IV1BST0JFX01JU0FMSUdORURfVkVDVE9SX1NMT1cg
ICAgICAgICAgICAyCj4gPiAgI2RlZmluZSAgICAgICAgICAgICAgUklTQ1ZfSFdQUk9CRV9NSVNB
TElHTkVEX1ZFQ1RPUl9GQVNUICAgICAgICAgICAgMwo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3Yva2VybmVsL3N5c19od3Byb2JlLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5j
Cj4gPiBpbmRleCBjYjkzYWRmZmZjNDguLmFmZmNjM2U1OGRmOSAxMDA2NDQKPiA+IC0tLSBhL2Fy
Y2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMKPiA+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVs
L3N5c19od3Byb2JlLmMKPiA+IEBAIC0xMDcsNiArMTA3LDcgQEAgc3RhdGljIHZvaWQgaHdwcm9i
ZV9pc2FfZXh0MChzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSAqcGFpciwKPiA+ICAgICAgICAgICAgICAg
RVhUX0tFWShaQ0IpOwo+ID4gICAgICAgICAgICAgICBFWFRfS0VZKFpDTU9QKTsKPiA+ICAgICAg
ICAgICAgICAgRVhUX0tFWShaSUNCT1opOwo+ID4gKyAgICAgICAgICAgICBFWFRfS0VZKFpJQ0JP
TSk7Cj4KPiBUaGlzIGxpc3QgaXMgaW4gYWxwaGFiZXRpY2FsIG9yZGVyLCB3aGljaCBtZWFucyBa
SUNCT00gc2hvdWxkIGNvbWUgYmVmb3JlCj4gWklDQk9aLgpPSwoKPgo+ID4gICAgICAgICAgICAg
ICBFWFRfS0VZKFpJQ09ORCk7Cj4gPiAgICAgICAgICAgICAgIEVYVF9LRVkoWklISU5UTlRMKTsK
PiA+ICAgICAgICAgICAgICAgRVhUX0tFWShaSUhJTlRQQVVTRSk7Cj4gPiBAQCAtMjc4LDYgKzI3
OSwxMSBAQCBzdGF0aWMgdm9pZCBod3Byb2JlX29uZV9wYWlyKHN0cnVjdCByaXNjdl9od3Byb2Jl
ICpwYWlyLAo+ID4gICAgICAgICAgICAgICBpZiAoaHdwcm9iZV9leHQwX2hhcyhjcHVzLCBSSVND
Vl9IV1BST0JFX0VYVF9aSUNCT1opKQo+ID4gICAgICAgICAgICAgICAgICAgICAgIHBhaXItPnZh
bHVlID0gcmlzY3ZfY2Jvel9ibG9ja19zaXplOwo+ID4gICAgICAgICAgICAgICBicmVhazsKPiA+
ICsgICAgIGNhc2UgUklTQ1ZfSFdQUk9CRV9LRVlfWklDQk9NX0JMT0NLX1NJWkU6Cj4gPiArICAg
ICAgICAgICAgIHBhaXItPnZhbHVlID0gMDsKPiA+ICsgICAgICAgICAgICAgaWYgKGh3cHJvYmVf
ZXh0MF9oYXMoY3B1cywgUklTQ1ZfSFdQUk9CRV9FWFRfWklDQk9NKSkKPiA+ICsgICAgICAgICAg
ICAgICAgICAgICBwYWlyLT52YWx1ZSA9IHJpc2N2X2Nib21fYmxvY2tfc2l6ZTsKPiA+ICsgICAg
ICAgICAgICAgYnJlYWs7Cj4gPiAgICAgICBjYXNlIFJJU0NWX0hXUFJPQkVfS0VZX0hJR0hFU1Rf
VklSVF9BRERSRVNTOgo+ID4gICAgICAgICAgICAgICBwYWlyLT52YWx1ZSA9IHVzZXJfbWF4X3Zp
cnRfYWRkcigpOwo+ID4gICAgICAgICAgICAgICBicmVhazsKPiA+IC0tCj4gPiAyLjM5LjIKPiA+
Cj4KPiBUaGFua3MsCj4gZHJldwoKVGhhbmtzLApZdW5odWkKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
