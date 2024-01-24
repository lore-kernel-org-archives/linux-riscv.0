Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75B8BC47DDF
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jan 2024 20:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MPvY9+81Zf1VK+XSPx7XPnvwfSwaKOBfl2Zsrw7wgEU=; b=T6/ATh65IpMbBO
	xI1OMEhj+r+Uxt6LgO5pLbiGxz+znWaK/7ynzuD6ClRYEDD1ELZ0BJILUHrAPRKISXmOH/Eu85GfH
	Dv7Pe2BImICIbQ/om9m7FODqrOa6gD+p5EaqK+J+N6obA5xr0SQTfN2ts6C4sw/oNxYFODT5eOnyM
	14vhTYFNUYji3brnUnwgB//PsugYJk4+lU9zkPCcULFdi4oYWXNhRqWRQjJo59lNm0P7Iw7uhC3Vl
	RLZ1As+l/Sm7uzrnnAb/OST59XTerSKm7mViwtyzXAGJdP/4OI6uKbJRh97/zZXsU6n/GYbv0M6/3
	dkWQdmjfAqWxGxjJN9Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSjSb-004wuV-0V;
	Wed, 24 Jan 2024 20:02:57 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSjSX-004ws1-1V
	for linux-riscv@lists.infradead.org;
	Wed, 24 Jan 2024 20:02:55 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1d75ea3a9b6so28978125ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 24 Jan 2024 12:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1706126572; x=1706731372; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+w2Z/B9DvCeSq6bcxM6bUW3f+gLJiWZyp7gFEq+AuD4=;
        b=Wnm5IQBVCJKfOswDDyQfYogM1P2S43+ULCbrCAlMSZ2ZQZYwjKhX+CtXSi6NiTvhz9
         JED4mmSuqLfHxriL/LFU5fEbLTdV3SQCX5H93iMGpvLAzSM9Fu5TiI1pLannPQlVBh/Q
         lFcprznT/XIxv3Z/sRa0rB8cADYw0Si0OPkICkiBMmddyxcHzW8YHG3KCXGX5mQsrbYD
         XFZ0Pc0ymCG2lH3H+FSiFxmE185lSI5rntdIYzyyOamjXw0igWdcaBfHDmd7ZNqREUs/
         9uW8CHpdqU1iC1RXuUQxSmbss8qPz5NpyHlVkduL1ViyG52dYegxy2vreplCY8Jt6Paf
         ZYow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706126572; x=1706731372;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+w2Z/B9DvCeSq6bcxM6bUW3f+gLJiWZyp7gFEq+AuD4=;
        b=sdxSRAmT7UEWr6wBx9Tjlwx9mbHLm2lxWM7yDOQo04RTI6Wgo7e8xfatMMOT87r9IP
         atm/Vr9FVXpCyDTp3M9jEW2rjG8wmhMcYUaOtIaWKDtZ2NgKdMA75vOhUrcx3YybMQZc
         xHaV/lxTbISKHso/rEhxnWptxdTVWSzVBkNALqciA0P8lmu3F9wkgYVPRplKToy4EbnF
         JqQW85FzNtizYHgCeg6vA4Thu2LqzcSde3rO3vYXwSxpNBtvX6EGJPtURpY0/2MJJ5QW
         5pNMrrXtfG/Lf+0yNB4YEqgDVeTZNE8vBuKQbrkhTPil4NZJHz8q1hp4HOpgJenpokUZ
         23TQ==
X-Gm-Message-State: AOJu0YzSfwOzyiO15bNGXiF9on7EpkblprC+cdRSit/ohX74mOjkvzn8
	mHzIDvidNBHCq4ZfMiYg/A1u6mXyT/bSgZEhF9vaid1xs5f62/bEQRRRiKlf7FLF+41nlvMTWgS
	5
X-Google-Smtp-Source: AGHT+IHmdnAzRy94TdW37rxIReLv8xmTxnle59ObMQ60OBh/Hx1dq+31Zqz4kUmazN7Jz6XbTetWjA==
X-Received: by 2002:a17:902:6b4a:b0:1d5:f10d:2ac6 with SMTP id g10-20020a1709026b4a00b001d5f10d2ac6mr1232352plt.115.1706126571674;
        Wed, 24 Jan 2024 12:02:51 -0800 (PST)
Received: from [192.168.68.110] ([152.234.127.94])
        by smtp.gmail.com with ESMTPSA id d13-20020a170902c18d00b001d7134d149dsm9769222pld.256.2024.01.24.12.02.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jan 2024 12:02:51 -0800 (PST)
Message-ID: <08188a93-0d5b-40bf-aefb-ac74d9c3d0be@ventanamicro.com>
Date: Wed, 24 Jan 2024 17:02:47 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qemu riscv, thead c906, Linux boot regression
Content-Language: en-US
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 qemu-devel@nongnu.org, =?UTF-8?Q?Christoph_M=C3=BCllner?=
 <christoph.muellner@vrull.eu>
Cc: linux-riscv@lists.infradead.org, LIU Zhiwei
 <zhiwei_liu@linux.alibaba.com>, Andrew Jones <ajones@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>, Conor Dooley
 <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>
References: <874jf2rj4g.fsf@all.your.base.are.belong.to.us>
 <78107c83-7035-414c-9a44-af5e234fd5c2@ventanamicro.com>
 <87wmryr0rx.fsf@all.your.base.are.belong.to.us>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <87wmryr0rx.fsf@all.your.base.are.belong.to.us>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_120253_586771_80BCCAFD 
X-CRM114-Status: GOOD (  19.02  )
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

CgpPbiAxLzI0LzI0IDE2OjI2LCBCasO2cm4gVMO2cGVsIHdyb3RlOgo+IERhbmllbCBIZW5yaXF1
ZSBCYXJib3phIDxkYmFyYm96YUB2ZW50YW5hbWljcm8uY29tPiB3cml0ZXM6Cj4gCj4+IE9uIDEv
MjQvMjQgMDk6NDksIEJqw7ZybiBUw7ZwZWwgd3JvdGU6Cj4+PiBIaSEKPj4+Cj4+PiBJIGJ1bXBl
ZCB0aGUgUklTQy1WIExpbnV4IGtlcm5lbCBDSSB0byB1c2UgcWVtdSA4LjIuMCwgYW5kIHJlYWxp
emVkIHRoYXQKPj4+IHRoZWFkIGM5MDYgZGlkbid0IGJvb3QgYW55bW9yZS4gQmlzZWN0aW9uIHBv
aW50cyB0byBjb21taXQgZDZhNDI3ZTJjMGIyCj4+PiAoInRhcmdldC9yaXNjdi9jcHUuYzogcmVz
dHJpY3QgJ21hcmNoaWQnIHZhbHVlIikKPj4+Cj4+PiBSZXZlcnRpbmcgdGhhdCBjb21taXQsIG9y
IHRoZSBoYWNrIGJlbG93IHNvbHZlcyB0aGUgYm9vdCBpc3N1ZToKPj4+Cj4+PiAtLTg8LS0KPj4+
IGRpZmYgLS1naXQgYS90YXJnZXQvcmlzY3YvY3B1LmMgYi90YXJnZXQvcmlzY3YvY3B1LmMKPj4+
IGluZGV4IDhjYmZjN2U3ODFhZC4uZTE4NTk2YzhhNTVhIDEwMDY0NAo+Pj4gLS0tIGEvdGFyZ2V0
L3Jpc2N2L2NwdS5jCj4+PiArKysgYi90YXJnZXQvcmlzY3YvY3B1LmMKPj4+IEBAIC01MDUsNiAr
NTA1LDkgQEAgc3RhdGljIHZvaWQgcnY2NF90aGVhZF9jOTA2X2NwdV9pbml0KE9iamVjdCAqb2Jq
KQo+Pj4gICAgICAgIGNwdS0+Y2ZnLmV4dF94dGhlYWRzeW5jID0gdHJ1ZTsKPj4+ICAgIAo+Pj4g
ICAgICAgIGNwdS0+Y2ZnLm12ZW5kb3JpZCA9IFRIRUFEX1ZFTkRPUl9JRDsKPj4+ICsgICAgY3B1
LT5jZmcubWFyY2hpZCA9ICgoUUVNVV9WRVJTSU9OX01BSk9SIDw8IDE2KSB8Cj4+PiArICAgICAg
ICAgICAgICAgICAgICAgICAgKFFFTVVfVkVSU0lPTl9NSU5PUiA8PCA4KSAgfAo+Pj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgIChRRU1VX1ZFUlNJT05fTUlDUk8pKTsKPj4+ICAgICNpZm5kZWYg
Q09ORklHX1VTRVJfT05MWQo+Pj4gICAgICAgIHNldF9zYXRwX21vZGVfbWF4X3N1cHBvcnRlZChj
cHUsIFZNXzFfMTBfU1YzOSk7Cj4+PiAgICAjZW5kaWYKPj4+IC0tODwtLQo+Pj4KPj4+IEknbSB1
bnN1cmUgd2hhdCB0aGUgY29ycmVjdCBxZW11IHdheSBvZiBhZGRpbmcgYSBkZWZhdWx0IHZhbHVl
IGlzLAo+Pj4gb3IgaWYgYzkwNiBzaG91bGQgaGF2ZSBhIHByb3BlciBtYXJjaGlkLgo+Pgo+PiBJ
biBjYXNlIHlvdSBuZWVkIHRvIHNldCBhICdtYXJjaGlkJyBkaWZmZXJlbnQgdGhhbiB6ZXJvIGZv
ciBjOTA2LCB0aGlzIGhhY2sgd291bGQKPj4gYmUgYSBwcm9wZXIgZml4LiBBcyBtZW50aW9uZWQg
aW4gdGhlIGNvbW1pdCBtc2cgb2YgdGhlIHBhdGNoIHlvdSBtZW50aW9uZWQ6Cj4+Cj4+ICJOYW1l
ZCBDUFVzIHNob3VsZCBzZXQgJ21hcmNoaWQnIHRvIGEgbWVhbmluZ2Z1bCB2YWx1ZSBpbnN0ZWFk
LCBhbmQgZ2VuZXJpYwo+PiAgICBDUFVzIGNhbiBzZXQgdG8gYW55IHZhbGlkIHZhbHVlLiIKPj4K
Pj4gVGhhdCBtZWFucyB0aGF0IGFueSBzcGVjaWZpYyBtYXJjaGlkIHZhbHVlIHRoYXQgdGhlIENQ
VSB1c2VzIG11c3QgdG8gYmUgc2V0Cj4+IGluIGl0cyBvd24gY3B1X2luaXQoKSBmdW5jdGlvbi4K
PiAKPiBHb3QgaXQuIFRoYW5rcywgRGFuaWVsIQo+IAo+IEZvciBjb21wbGV0ZW5lc3MgKHNpbmNl
IGl0IGNhbWUgdXAgb24gdGhlIHdlZWtseSBQVyBjYWxsKTsgQ29ub3IgcG9pbnRlZAo+IG91dCB0
aGF0IHplcm8gKmlzKiBpbmRlZWQgdGhlIHJpZ2h0IG1hcmNoaWQgZm9yIGM5MDYsIGFuZCBpbiBm
YWN0LCB0aGUKPiBub24temVybyBtYXJjaGlkIHByZSBjb21taXQgZDZhNDI3ZTJjMGIyIHdhcyBp
bmNvcnJlY3QuCj4gCj4gUG9zdCBjb21taXQgZDZhNDI3ZTJjMGIyLCB0aGUgY29ycmVjdCBhbHRl
cm5hdGl2ZSBpcyBwaWNrZWQgdXAsIGFuZAo+IEVSUkFUQV9USEVBRF9QQk1UICh1c2luZyBub24t
c3RhbmRhcmQgbWVtb3J5IHR5cGUgYml0cyBpbgo+IHBhZ2UtdGFibGUtZW50cmllcykga2lja3Mg
aW4uIEFGQUlVLCB0aGF0J3Mgbm90IGltcGxlbWVudGVkIGJ5IHFlbXUncwo+IGM5MDYgc3VwcG9y
dCwgd2hpY2ggdGhlbiB0cmFwcy4KCgpUaGlzIGxvb2tzIGxpa2UgYSB2ZXJ5IGdvb2QgcmVhc29u
IHRvIGFjdHVhbGx5IHB1c2ggd2hhdCB5b3UgY2FsbGVkICdoYWNrJyBhcwphIGZpeC4gWWVhaCwg
aW4gdGhlb3J5IHRoYXQgY29tbWl0IGRpZCBub3RoaW5nIHdyb25nLCBidXQgdGhlIHNpZGUgZWZm
ZWN0CihtaXNzaW5nIHN1cHBvcnQgZm9yIG5vbi1zdGFuZGFyZCBtZW1vcnkgdHlwZSBiaXRzKSBp
cyBraW5kIG9mIGEgUUVNVSBwcm9ibGVtLgoKWW91J3JlIHdlbGNvbWUgdG8gZm9ybWF0IHRoYXQg
aGFjayBpbnRvIGEgcGF0Y2gsIGV4cGxhaW5pbmcgaW4gdGhlIGNvbW1pdCBtc2cgd2h5CndlIG5l
ZWQgdG8gc2V0IG1hcmNoaWQgZm9yIGM5MDYgdG8gdGhhdCBzcGVjaWZpYyB2YWx1ZS4gSSdkIGV2
ZW4gYWRkIGEgVE9ETwp0YWcgaW4gcnY2NF90aGVhZF9jOTA2X2NwdV9pbml0KCkgdG8gcmVtaW5k
IHVzIHRoYXQgdGhpcyBpcyBhIGJhbmQtYWlkIGFuZAp0aGF0IHdlIHNob3VsZCByZW1vdmUgaXQg
b25jZSB3ZSBpbXBsZW1lbnQgdGhlIG5lZWRlZCBzdXBwb3J0LgoKCgo+IAo+IFRoYXQncyB0aGUg
dGhlb3J5LiBNYXliZSBDaHJpc3RvcGgga25vd3MgaWYgdGhlIG5vbi1zdGFuZGFyZCBiaXRzIGFy
ZQo+IGltcGxlbWVudGVkIG9yIG5vdD8KPiAKPiBSZWdhcmRsZXNzOyBJIHJlbW92ZWQgYm9vdGlu
ZyBRZW11IFQtaGVhZCBjOTA2IGZyb20gdGhlIENJLCBhbmQgdGhlCj4gYnVpbGQvYm9vdCBwYXNz
ZXMgbmljZWx5IDstKSBbMV0KCkkgdm90ZSBmb3Igc2V0dGluZyBtYXJjaGlkIGluIGM5MDYgY3B1
X2luaXQgYW5kIHJlLWVuYWJsZSBpdCBpbiB0aGUgQ0kuCgoKVGhhbmtzLAoKRGFuaWVsCgo+IAo+
IAo+IEJqw7Zybgo+IAo+IFsxXSBodHRwczovL2dpdGh1Yi5jb20vbGludXgtcmlzY3YvbGludXgt
cmlzY3YvYWN0aW9ucy9ydW5zLzc2NDE3NjQ3NTkvam9iLzIwODE5ODAxMjM1P3ByPTQ0NwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
