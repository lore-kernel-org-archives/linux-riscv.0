Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EA76C25B77
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 07:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u5L0b1zLPxvxB9Ftw7H3Qtz8EFeY4Gw7Ie4ctk8IzG4=; b=rs/Tpj1qRQQB+q
	lEMwUDDaxAtSJDukTxUpjqxgeD/7ljFBwR4iRDFhFu0lI9T9NvryVce0My6gFM54LpxgVjLgUXAJU
	Dz3cBcHik91kp7tY0tdfQsUC3slKsnrZfYoYUJmBxzt4u5sPRtA0EzQg4VU/Lqrq7CKYCjOUkf2o6
	wr6NKzhiuBqKjGb/d812TjMNjuDhzR3auqtEvx3D7NYdFQw50ybjwJRFLAnalJPlGi7MPNO+Il+iE
	IEBW8m0ZLIwGErFL3op/EXA0JguExb8IXUwNVLSdKEVKoZTM0cBSxkQI9CHJCTFmwsf4WWN78KrKF
	OThXOT1Kp1IUf1nDE1DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9gMZ-00000002Dib-04PP;
	Wed, 22 May 2024 07:26:15 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9gMW-00000002Dhh-0p5M
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 07:26:13 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-574bf7ab218so10367578a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 22 May 2024 00:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1716362769; x=1716967569; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=otCVHUs3Nwj+ovQYLyF48k7PQwF+3UYRrO9JIydnJro=;
        b=c+ag3daFkmF1gG4q9seOnCZMOvPYzDckvj1EsNYrKaduLfhgQIVYiOZhb1ap1ZGNSi
         ac95ccggL/5Q+LKBBQiOsXx0EZ/KlwSsRnFnP/SLj7I8ojCCjNgi+dBACpQjFHA38Zhe
         F8cErBuwRciYaKX0tMT9Ox5qJJdEXaiO+JJ7ZYGUtHAT2L+Ivj6n6jl6OgMQZU9whstq
         rqKcnfKx0w0x8j5jgkdNkCY7PKttbVb/XRiRtS33DBm/EDJ65d2B6teStExGQ+Fc+2C/
         rxqLF2dKMA/SQD9kX+WF2FU9B2RdtbYQmwsGI4STZFiD6NFKbKzRfWF9fEuP4IoXOcPS
         2CIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716362769; x=1716967569;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=otCVHUs3Nwj+ovQYLyF48k7PQwF+3UYRrO9JIydnJro=;
        b=TMXqo0fv9QPTZsL5kZhSeEksqdkJq3C07m11vjZ4wkB1bZcWZ4xJRENtzpU0RhuWQN
         0NyylvWJr9wyan7xzxH6NjXrzc/jAwxcnUos72jkp1pxt/jhIWLXS/artO5xPqL0Egk8
         /OjIvV667GlXJjYu4Zm038RcvprehBQtE4hpQfGBLsMCAgLWukWTnftyaCqXEdaWtY5p
         9LrThhp2Z6kXKn/Sosq6JjK6a6WVtaCfZ+dEcGs7Mp3yvnab31py7X9FoSsRIZUfUTyR
         GNlCKTOzr32s6XefAtxvhRnK+7TfNmfjzWj89K4oRijy+Awmyhh5S2X6riupyJ3/DwqB
         yXDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVByl1wER21W+KciUGzdus9zO8VbqZozt94Fj3OBU9urHExQQe0CxmkfX2xKN6sX9SFr0ExY13LMc0hx7Vlibs3lzc0RbglBizf+5tqQHxk
X-Gm-Message-State: AOJu0YwEvRFpTaWYm3JQ4iPN9mrOo5Hjd8MEh9UMHF9iatq/oU9CqCom
	yTjWcmC6OSKHfy411QaKh+0lANdU5XYGu10nEW6lHBmSjWDV7zJSsrcOva1RYE4=
X-Google-Smtp-Source: AGHT+IF6EAxEE0WmF0iEa+XtzugLxuIFj5baBsfbvmbG+5Y6OKzYuSLxthr/qXaZVtPWpKfIPBryBg==
X-Received: by 2002:a17:906:3a90:b0:a59:9b52:cfc5 with SMTP id a640c23a62f3a-a62280a05a2mr61439366b.37.1716362769340;
        Wed, 22 May 2024 00:26:09 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17b01399sm1765616766b.172.2024.05.22.00.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 00:26:08 -0700 (PDT)
Date: Wed, 22 May 2024 09:26:08 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Evan Green <evan@rivosinc.com>
Cc: Yangyu Chen <cyy@cyyself.name>, linux-riscv@lists.infradead.org, 
	Elliott Hughes <enh@google.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/2] docs: riscv: hwprobe: Clarify misaligned keys are
 values not bitmasks
Message-ID: <20240522-d110bb16f54eebb725e943c2@orel>
References: <tencent_9D721BDDF88C04DBB5151D57711D62524209@qq.com>
 <tencent_338DF690631BAE788C4CC858233E9FBAE006@qq.com>
 <CALs-HssGcNso6vTfbcsiWX1h_46jgDDRcEWcfZCTpxXYnubcng@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALs-HssGcNso6vTfbcsiWX1h_46jgDDRcEWcfZCTpxXYnubcng@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_002612_337303_538805F7 
X-CRM114-Status: GOOD (  34.73  )
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

T24gVHVlLCBNYXkgMjEsIDIwMjQgYXQgMTE6MzY6MDZBTSBHTVQsIEV2YW4gR3JlZW4gd3JvdGU6
Cj4gT24gU2F0LCBNYXkgMTgsIDIwMjQgYXQgOTowMOKAr0FNIFlhbmd5dSBDaGVuIDxjeXlAY3l5
c2VsZi5uYW1lPiB3cm90ZToKPiA+Cj4gPiBUaGUgb3JpZ2luYWwgZG9jdW1lbnRhdGlvbiBzYXlz
IGh3cHJvYmUga2V5cyBhcmUgYml0bWFza3MsIGJ1dCBhY3R1YWxseSwKPiA+IHRoZXkgYXJlIHZh
bHVlcy4gVGhpcyBwYXRjaCBjbGFyaWZpZXMgdGhpcyB0byBhdm9pZCBjb25mdXNpb24uCj4gPgo+
ID4gU2lnbmVkLW9mZi1ieTogWWFuZ3l1IENoZW4gPGN5eUBjeXlzZWxmLm5hbWU+Cj4gCj4gSG0s
IHdlIGFsc28gaGF2ZSB0aGlzIHByb2JsZW0gaW4gdGhlIGNvZGUsIHNpbmNlCj4gaHdwcm9iZV9r
ZXlfaXNfYml0bWFzaygpIHJldHVybnMgdHJ1ZSBmb3IgS0VZX0NQVVBFUkZfMC4gVGhpcyByZXN1
bHRzCj4gaW4gd3JvbmcgaW5mb3JtYXRpb24gYmVpbmcgcmV0dXJuZWQgZm9yIHF1ZXJpZXMgdXNp
bmcgdGhlIFdISUNIX0NQVQo+IGZsYWcuIElmIHVzZXJtb2RlIGFza2VkIGZvciB0aGUgc2V0IG9m
IENQVXMgdGhhdCB3YXMgc3BlY2lmaWNhbGx5IFNMT1cKPiBvciBFTVVMQVRFRCwgdGhlIHJldHVy
bmVkIGNwdXNldCB3b3VsZCBhbHNvIGluY2x1ZGUgY3B1cyB0aGF0IHdlcmUKPiBGQVNULiBJIGJl
bGlldmUgYWxsIG90aGVyIHF1ZXJpZXMgYXJlIG9rYXkuCj4gCj4gVGhlIG9uZS1saW5lciBmaXgg
aXMgdG8ganVzdCBub3QgcmV0dXJuIHRydWUgZm9yIHRoYXQga2V5IGluCj4gaHdwcm9iZV9rZXlf
aXNfYml0bWFzaygpLiBCdXQgdGhhdCdzIHRlY2huaWNhbGx5IHVzZXItdmlzaWJsZTogaWYgc29t
ZQo+IHNvZnR3YXJlIHJlbGllZCBvbiB0aGUgYnVnZ3kgYmVoYXZpb3Igb2YgRkFTVCBjcHVzIGJl
aW5nIHN3ZXB0IHVwIGluCj4gdGhlIHF1ZXJ5IGZvciBTTE9XIG9yIEVNVUxBVEVEIGNwdXMsIHRo
aXMgY2hhbmdlIHdvdWxkIGV4cG9zZSB0aGF0Lgo+IFRoZSBncm93bnVwcy1lYXQtdGhlaXItdmVn
ZXRhYmxlcyB0aGluZyB0byBkbyB3b3VsZCBiZSB0byBkZWZpbmUgYSBuZXcKPiBrZXkgdGhhdCBy
ZXR1cm5zIHRoaXMgc2FtZSB2YWx1ZSwgYnV0IGRvZXNuJ3QgcmV0dXJuIHRydWUgaW4KPiBod3By
b2JlX2tleV9pc19iaXRtYXNrKCkuIFdoYXQgZG8gcGVvcGxlIHRoaW5rPwoKRXZlbiB0aG91Z2gg
SSBhY3R1YWxseSBlbmpveSBlYXRpbmcgdmVnZXRhYmxlcywgSSB0aGluayBpdCdzIHVubGlrZWx5
CnRoYXQgd2UgbmVlZCB0byBiZSBzbyBjYXV0aW91cyBmb3IgdGhpcy4gSSBmZWVsIGxpa2Uga2Vy
bmVsIHVwZGF0ZXMKcHJvdmlkZSBhIGJpdCBvZiBmcmVlZG9tIHRvIGNoYW5nZSByZXN1bHRzIG9m
IGhhcmR3YXJlIHF1ZXJ5IHN5c2NhbGxzLApldmVuIHdoZW4gcnVuIG9uIHRoZSBzYW1lIGhhcmR3
YXJlLiBQYXJ0aWN1bGFybHkgdGhlIEVNVUxBVEVEIHF1ZXJ5LAp3aGljaCBJIGd1ZXNzIGNvdWxk
IGNoYW5nZSB3aXRoIGEgZmlybXdhcmUgdXBkYXRlLiBBbmQsIGV2ZW4gdGhlIFNMT1cKcXVlcnkg
Y291bGQgY2hhbmdlIGlmIHRoZSBwcm9iaW5nIHdhcyBtb2RpZmllZCBkaXJlY3RseSBvciBpbmRp
cmVjdGx5LgpJT1csIGFwcGxpY2F0aW9ucyB0aGF0IHVzZSB0aGUgd2hpY2gtY3B1cyBzeXNjYWxs
IHNob3VsZG4ndCBmcmVhayBvdXQKaWYgdGhleSBkb24ndCBnZXQgdGhlIHNhbWUgY3B1c2V0IGFm
dGVyIGEga2VybmVsIHVwZGF0ZSwgd2hpY2ggbWVhbnMKd2UgY2FuIGRyb3AgdGhlIEZBU1QgY3B1
cyBmcm9tIHRoZSByZXN1bHQuCgpUaGFua3MsCmRyZXcKCj4gCj4gLUV2YW4KPiAKPiA+IC0tLQo+
ID4gIERvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdCB8IDMxICsrKysrKysrKysr
KysrKystLS0tLS0tLS0tLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwg
MTMgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vYXJjaC9y
aXNjdi9od3Byb2JlLnJzdCBiL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdAo+
ID4gaW5kZXggMjM5YmU2M2Y1MDg5Li40YWJmYTNmOWZlNDQgMTAwNjQ0Cj4gPiAtLS0gYS9Eb2N1
bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24v
YXJjaC9yaXNjdi9od3Byb2JlLnJzdAo+ID4gQEAgLTE4OCwyNSArMTg4LDMwIEBAIFRoZSBmb2xs
b3dpbmcga2V5cyBhcmUgZGVmaW5lZDoKPiA+ICAgICAgICAgbWFudWFsIHN0YXJ0aW5nIGZyb20g
Y29tbWl0IDk1Y2YxZjkgKCJBZGQgY2hhbmdlcyByZXF1ZXN0ZWQgYnkgVmVkCj4gPiAgICAgICAg
IGR1cmluZyBzaWdub2ZmIikKPiA+Cj4gPiAtKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9LRVlf
Q1BVUEVSRl8wYDogQSBiaXRtYXNrIHRoYXQgY29udGFpbnMgcGVyZm9ybWFuY2UKPiA+ICsqIDpj
Om1hY3JvOmBSSVNDVl9IV1BST0JFX0tFWV9DUFVQRVJGXzBgOiBBIHZhbHVlIHRoYXQgY29udGFp
bnMgcGVyZm9ybWFuY2UKPiA+ICAgIGluZm9ybWF0aW9uIGFib3V0IHRoZSBzZWxlY3RlZCBzZXQg
b2YgcHJvY2Vzc29ycy4KPiA+Cj4gPiAtICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX01JU0FM
SUdORURfVU5LTk9XTmA6IFRoZSBwZXJmb3JtYW5jZSBvZiBtaXNhbGlnbmVkCj4gPiAtICAgIHNj
YWxhciBhY2Nlc3NlcyBpcyB1bmtub3duLgo+ID4gKyAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9C
RV9NSVNBTElHTkVEX01BU0tgOiBUaGUgYml0bWFzayBvZiB0aGUgbWlzYWxpZ25lZAo+ID4gKyAg
ICBhY2Nlc3MgcGVyZm9ybWFuY2UgZmllbGQgaW4gdGhlIHZhbHVlIG9mIGtleSBgUklTQ1ZfSFdQ
Uk9CRV9LRVlfQ1BVUEVSRl8wYC4KPiA+Cj4gPiAtICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JF
X01JU0FMSUdORURfRU1VTEFURURgOiBNaXNhbGlnbmVkIHNjYWxhciBhY2Nlc3NlcyBhcmUKPiA+
IC0gICAgZW11bGF0ZWQgdmlhIHNvZnR3YXJlLCBlaXRoZXIgaW4gb3IgYmVsb3cgdGhlIGtlcm5l
bC4gIFRoZXNlIGFjY2Vzc2VzIGFyZQo+ID4gLSAgICBhbHdheXMgZXh0cmVtZWx5IHNsb3cuCj4g
PiArICAgIFRoZSBmb2xsb3dpbmcgdmFsdWVzIChub3QgYml0bWFza3MpIGluIHRoaXMgZmllbGQg
YXJlIGRlZmluZWQ6Cj4gPgo+ID4gLSAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9NSVNBTElH
TkVEX1NMT1dgOiBNaXNhbGlnbmVkIHNjYWxhciBhY2Nlc3NlcyBhcmUKPiA+IC0gICAgc2xvd2Vy
IHRoYW4gZXF1aXZhbGVudCBieXRlIGFjY2Vzc2VzLiAgTWlzYWxpZ25lZCBhY2Nlc3NlcyBtYXkg
YmUgc3VwcG9ydGVkCj4gPiAtICAgIGRpcmVjdGx5IGluIGhhcmR3YXJlLCBvciB0cmFwcGVkIGFu
ZCBlbXVsYXRlZCBieSBzb2Z0d2FyZS4KPiA+ICsgICAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9C
RV9NSVNBTElHTkVEX1VOS05PV05gOiBUaGUgcGVyZm9ybWFuY2Ugb2YgbWlzYWxpZ25lZAo+ID4g
KyAgICAgIHNjYWxhciBhY2Nlc3NlcyBpcyB1bmtub3duLgo+ID4KPiA+IC0gICogOmM6bWFjcm86
YFJJU0NWX0hXUFJPQkVfTUlTQUxJR05FRF9GQVNUYDogTWlzYWxpZ25lZCBzY2FsYXIgYWNjZXNz
ZXMgYXJlCj4gPiAtICAgIGZhc3RlciB0aGFuIGVxdWl2YWxlbnQgYnl0ZSBhY2Nlc3Nlcy4KPiA+
ICsgICAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX0VNVUxBVEVEYDogTWlz
YWxpZ25lZCBzY2FsYXIgYWNjZXNzZXMgYXJlCj4gPiArICAgICAgZW11bGF0ZWQgdmlhIHNvZnR3
YXJlLCBlaXRoZXIgaW4gb3IgYmVsb3cgdGhlIGtlcm5lbC4gIFRoZXNlIGFjY2Vzc2VzIGFyZQo+
ID4gKyAgICAgIGFsd2F5cyBleHRyZW1lbHkgc2xvdy4KPiA+Cj4gPiAtICAqIDpjOm1hY3JvOmBS
SVNDVl9IV1BST0JFX01JU0FMSUdORURfVU5TVVBQT1JURURgOiBNaXNhbGlnbmVkIHNjYWxhciBh
Y2Nlc3Nlcwo+ID4gLSAgICBhcmUgbm90IHN1cHBvcnRlZCBhdCBhbGwgYW5kIHdpbGwgZ2VuZXJh
dGUgYSBtaXNhbGlnbmVkIGFkZHJlc3MgZmF1bHQuCj4gPiArICAgICogOmM6bWFjcm86YFJJU0NW
X0hXUFJPQkVfTUlTQUxJR05FRF9TTE9XYDogTWlzYWxpZ25lZCBzY2FsYXIgYWNjZXNzZXMgYXJl
Cj4gPiArICAgICAgc2xvd2VyIHRoYW4gZXF1aXZhbGVudCBieXRlIGFjY2Vzc2VzLiAgTWlzYWxp
Z25lZCBhY2Nlc3NlcyBtYXkgYmUgc3VwcG9ydGVkCj4gPiArICAgICAgZGlyZWN0bHkgaW4gaGFy
ZHdhcmUsIG9yIHRyYXBwZWQgYW5kIGVtdWxhdGVkIGJ5IHNvZnR3YXJlLgo+ID4gKwo+ID4gKyAg
ICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX01JU0FMSUdORURfRkFTVGA6IE1pc2FsaWduZWQg
c2NhbGFyIGFjY2Vzc2VzIGFyZQo+ID4gKyAgICAgIGZhc3RlciB0aGFuIGVxdWl2YWxlbnQgYnl0
ZSBhY2Nlc3Nlcy4KPiA+ICsKPiA+ICsgICAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9NSVNB
TElHTkVEX1VOU1VQUE9SVEVEYDogTWlzYWxpZ25lZCBzY2FsYXIgYWNjZXNzZXMKPiA+ICsgICAg
ICBhcmUgbm90IHN1cHBvcnRlZCBhdCBhbGwgYW5kIHdpbGwgZ2VuZXJhdGUgYSBtaXNhbGlnbmVk
IGFkZHJlc3MgZmF1bHQuCj4gPgo+ID4gICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfS0VZX1pJ
Q0JPWl9CTE9DS19TSVpFYDogQW4gdW5zaWduZWQgaW50IHdoaWNoCj4gPiAgICByZXByZXNlbnRz
IHRoZSBzaXplIG9mIHRoZSBaaWNib3ogYmxvY2sgaW4gYnl0ZXMuCj4gPiAtLQo+ID4gMi40My4w
Cj4gPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
