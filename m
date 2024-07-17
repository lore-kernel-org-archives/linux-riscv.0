Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CAB9C3DA49
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jul 2024 01:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ACBi6LdzwKa8FpZtM8PoqDP4agu3O1hB8z0euNaAjA=; b=3s7WEE/cuc39CH
	piDGSJBwoZtQifKHM7lzVihOgK8Jqa4tCx367yMRvWJqWuP3Fn4GIhJ8u78izqxE5kQrDAH3H/hrD
	UoCr/otOo641hZ6q9ah07y/HYC4TNLLhweGVSSewx9Y7WLSJams9PI4QNY1t92swUMnp06Tkq+roF
	XQhBX5ZyTjxS52iYaPbSUk5vYaDwS+3QQ1KGHi62/9ujl7u212084OcieAROd8/4sWIa1hjRWr/5Z
	HSJ6qgozZHDR+LbO0iH5VoLoIXn7a4STwnJVRyMvFP/FfyJkrEGlF7zAE4YIeebm+3Fb4dxg8TM/B
	fcTMM/9ka4UUX5IBgqPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTtL6-0000000CFWx-31mn;
	Wed, 17 Jul 2024 01:20:16 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTtL3-0000000CFVx-42AZ
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jul 2024 01:20:15 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-5ce739c2650so259047eaf.1
        for <linux-riscv@lists.infradead.org>; Tue, 16 Jul 2024 18:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1721179213; x=1721784013; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9nWt97Wp1ilQQ7306SFKA4eqa96SFpHMWiUAQ0dXXdU=;
        b=Mvl966bSGEKKpJX+AmRVm0JDCi6sIHoNqqFgRDbZxPECdmWrBi8nIWwZmE+NgKnp1r
         aLve1HdlPsH4pWsqfFFN8zfKDiBzVi4iTkAlRTP6dZDV0OGtYr/lMkK7I/G25pd4BdeR
         R7ap0Tdi3O7l6qzzU2pbrgq8KIklMM5KvHf2cX86QROOG2vjbPMaPYvfS7suq2V4par7
         k48pJ7kpti9xP+6hJym8pvfkJkdMfYyN7USMHMuqgjB3YWe1+9jNnXqnZHN2dmlTRJOf
         h1MrdNiq+74ySHZvtxUxzTARzWYuLA7UwNxM78g1xA66QiX1AVWRKPhNQ7ok/iQp4KcX
         KGKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721179213; x=1721784013;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9nWt97Wp1ilQQ7306SFKA4eqa96SFpHMWiUAQ0dXXdU=;
        b=FpME6HnBQVdv6QJEPeSh7/VElhpYqXB/oWK4Zwr9tZxfkd6xlcPg5hxriSekXnt4cX
         vwgSrFd3BgArDFEu3IuEuTwdIWTmIFGcunvIymFGrkII9fdMzSUTZJkuyeECI/38cyNd
         Ius4x3KH43aUvvsethYSvDFxqJuEQIjdTumEzjxe6lzaNBXeRGh0Z3qsi90/qq1MyRHD
         JpYKhWJyq/RZnldg+S9GswZewg0ENPqYEcCcRxMj+IX6bqRnXeVS7ZMk/1umH0fsxkdM
         s/QyzPSGfRCjnK1LDWZLpQobabDSp2RQxUQfmRNO307S5RrBfjGy8tFzD9P4RACVOkH6
         uw1g==
X-Forwarded-Encrypted: i=1; AJvYcCUuU6vpGhlf9Fi+tq1WTibkFgHlI4jaO0S/0k4Bh7zf64u4ThWquPY6D5E7YNh738vGYR0d/ee7Az0VqE9xeNUYDvQc71gEp9bj3owu+s2Q
X-Gm-Message-State: AOJu0Yxaiu2OXv0rOLbGnDzAhw9cms6vXZcfl5AuVf+QZveyO2pvyVgk
	zWiG6rGaRz4+ypbY+M9aYddbJqvlUMugoARzDlFp//QXIAldgEubdBErcODDiq8U4dpsauO8c+5
	93eXlbocmlI08PMUramFMqeF9TA2e6MbSQ/XR0XhK43h4/qCO5U4=
X-Google-Smtp-Source: AGHT+IEdqlnLhH1SU4NcfSupxzMGDotYQmQJspVQzJ54YXo8sjG+54XN8uSiJk9j88aDuSknwc/Vf7SWxf/zLjPIw60=
X-Received: by 2002:a05:6820:198a:b0:5c4:2c2a:2358 with SMTP id
 006d021491bc7-5d41c9e3c87mr404796eaf.6.1721179213034; Tue, 16 Jul 2024
 18:20:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240716090521.1752166-1-nick.hu@sifive.com> <CAAhSdy1pjg=etzNNu-E+-VDmU5gLkS2jYhdO29pPN23OQ5=NiA@mail.gmail.com>
In-Reply-To: <CAAhSdy1pjg=etzNNu-E+-VDmU5gLkS2jYhdO29pPN23OQ5=NiA@mail.gmail.com>
From: Nick Hu <nick.hu@sifive.com>
Date: Wed, 17 Jul 2024 09:20:01 +0800
Message-ID: <CAKddAkB7r59sazmksi491Ubn0A-2C=Qhg=00thOSN=ZWzoVqjQ@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Enable the IPI before workqueue_online_cpu()
To: Anup Patel <anup@brainfault.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	tglx@linutronix.de, peterz@infradead.org, samuel.holland@sifive.com, 
	tj@kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	greentime.hu@sifive.com, zong.li@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_182014_063088_7045032D 
X-CRM114-Status: GOOD (  18.97  )
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

SGkgQW51cAoKT24gVHVlLCBKdWwgMTYsIDIwMjQgYXQgNjo1MeKAr1BNIEFudXAgUGF0ZWwgPGFu
dXBAYnJhaW5mYXVsdC5vcmc+IHdyb3RlOgo+Cj4gT24gVHVlLCBKdWwgMTYsIDIwMjQgYXQgMjoz
NeKAr1BNIE5pY2sgSHUgPG5pY2suaHVAc2lmaXZlLmNvbT4gd3JvdGU6Cj4gPgo+ID4gU29tZXRp
bWVzIHRoZSBob3RwbHVnIGNwdSBzdGFsbHMgYXQgdGhlIGFyY2hfY3B1X2lkbGUoKSBmb3IgYSB3
aGlsZSBhZnRlcgo+ID4gd29ya3F1ZXVlX29ubGluZV9jcHUoKS4gV2hlbiBjcHUgc3RhbGxzIGF0
IHRoZSBpZGxlIGxvb3AsIHRoZSByZXNjaGVkdWxlCj4gPiBJUEkgaXMgcGVuZGluZy4gSG93ZXZl
ciB0aGUgZW5hYmxlIGJpdCBpcyBub3QgZW5hYmxlZCB5ZXQgc28gdGhlIGNwdSBzdGFsbHMKPiA+
IGF0IFdGSSB1bnRpbCB3YXRjaGRvZyB0aW1lb3V0LiBUaGVyZWZvcmUgZW5hYmxlIHRoZSBJUEkg
YmVmb3JlIHRoZQo+ID4gd29ya3F1ZXVlX29ubGluZV9jcHUoKSB0byBmaXggdGhlIGlzc3VlLgo+
ID4KPiA+IEZpeGVzOiA2M2M1NDg0ZTc0OTUgKCJ3b3JrcXVldWU6IEFkZCBtdWx0aXBsZSBhZmZp
bml0eSBzY29wZXMgYW5kIGludGVyZmFjZSB0byBzZWxlY3QgdGhlbSIpCj4gPiBTaWduZWQtb2Zm
LWJ5OiBOaWNrIEh1IDxuaWNrLmh1QHNpZml2ZS5jb20+Cj4gPiAtLS0KPiA+ICBhcmNoL3Jpc2N2
L2tlcm5lbC9zYmktaXBpLmMgfCAyICstCj4gPiAgaW5jbHVkZS9saW51eC9jcHVob3RwbHVnLmgg
IHwgMSArCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLWlwaS5jIGIvYXJj
aC9yaXNjdi9rZXJuZWwvc2JpLWlwaS5jCj4gPiBpbmRleCAxMDI2ZTIyOTU1Y2MuLmUwNWU2OGRl
ODg3MSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3NiaS1pcGkuYwo+ID4gKysr
IGIvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLWlwaS5jCj4gPiBAQCAtNzEsNyArNzEsNyBAQCB2b2lk
IF9faW5pdCBzYmlfaXBpX2luaXQodm9pZCkKPiA+ICAgICAgICAgICogdGhlIG1hc2tpbmcvdW5t
YXNraW5nIG9mIHZpcnR1YWwgSVBJcyBpcyBkb25lCj4gPiAgICAgICAgICAqIHZpYSBnZW5lcmlj
IElQSS1NdXgKPiA+ICAgICAgICAgICovCj4gPiAtICAgICAgIGNwdWhwX3NldHVwX3N0YXRlKENQ
VUhQX0FQX09OTElORV9EWU4sCj4gPiArICAgICAgIGNwdWhwX3NldHVwX3N0YXRlKENQVUhQX0FQ
X0lSUV9SSVNDVl9TV0lOVF9TVEFSVElORywKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ImlycWNoaXAvc2JpLWlwaTpzdGFydGluZyIsCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAg
IHNiaV9pcGlfc3RhcnRpbmdfY3B1LCBOVUxMKTsKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9saW51eC9jcHVob3RwbHVnLmggYi9pbmNsdWRlL2xpbnV4L2NwdWhvdHBsdWcuaAo+ID4gaW5k
ZXggN2E1Nzg1ZjQwNWI2Li41N2RjZjEyMjliMjcgMTAwNjQ0Cj4gPiAtLS0gYS9pbmNsdWRlL2xp
bnV4L2NwdWhvdHBsdWcuaAo+ID4gKysrIGIvaW5jbHVkZS9saW51eC9jcHVob3RwbHVnLmgKPiA+
IEBAIC0xNDcsNiArMTQ3LDcgQEAgZW51bSBjcHVocF9zdGF0ZSB7Cj4gPiAgICAgICAgIENQVUhQ
X0FQX0lSUV9MT09OR0FSQ0hfU1RBUlRJTkcsCj4gPiAgICAgICAgIENQVUhQX0FQX0lSUV9TSUZJ
VkVfUExJQ19TVEFSVElORywKPiA+ICAgICAgICAgQ1BVSFBfQVBfSVJRX1JJU0NWX0lNU0lDX1NU
QVJUSU5HLAo+ID4gKyAgICAgICBDUFVIUF9BUF9JUlFfUklTQ1ZfU1dJTlRfU1RBUlRJTkcsCj4K
PiBUaGlzIGlzIGEgbWlzbGVhZGluZyBuYW1lLgo+Cj4gSSBzdWdnZXN0IHMvX1JJU0NWX1NXSU5U
Xy9fUklTQ1ZfU0JJX0lQSV8vIC4KPgpHb29kIHBvaW50LgpJJ2xsIHVwZGF0ZSBpdCBpbiB0aGUg
bmV4dCB2ZXJzaW9uLgpUaGFuayB5b3UgZm9yIHRoZSBmZWVkYmFjay4KCj4gPiAgICAgICAgQ1BV
SFBfQVBfQVJNX01WRUJVX0NPSEVSRU5DWSwKPiA+ICAgICAgICAgQ1BVSFBfQVBfUEVSRl9YODZf
QU1EX1VOQ09SRV9TVEFSVElORywKPiA+ICAgICAgICAgQ1BVSFBfQVBfUEVSRl9YODZfU1RBUlRJ
TkcsCj4gPiAtLQo+ID4gMi4zNC4xCj4gPgo+Cj4gUmVnYXJkcywKPiBBbnVwCgpSZWdhcmRzLApO
aWNrCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
