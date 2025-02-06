Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF0EC02194
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Feb 2025 10:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TL9sUQK++NQwjcz6UTj0+N271Huz2PBTu9kwoOKqj1Q=; b=3T4UPt+OzNXZMV
	LKTg0Zu8SEQLkymSaEl4pJPaAm8iF8fj3BV0bOrCEeX3qwGoEjFIEIZEGpYh1EDmBh1rggqm5NV0+
	DkuEMUjSJj+6BhI2b8OOWGf8paV3l3hRKBt3XMq8Z/5y2rRAeXm0wbs/G3ikQNRW7wCxmRs59nqSF
	ZiWYg4Ci0UD5Upc7jaV/cCLbj89crS03U4NfKJublqtgsAPqjEHoWr0pNNNRwK7xGU5TodfjyLe2g
	D7gjP+V8BKxZZNV2jOT2epSfKDWkaoqw2HJNMp3VXgPBKDdyeZ9u60NQh2qlKrdpBl+pqcRJgdh/e
	u7hwCvCBD7dw4487iBMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfyuB-00000005x0V-0uB8;
	Thu, 06 Feb 2025 10:14:43 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfyoe-00000005wJg-3Bsl
	for linux-riscv@lists.infradead.org;
	Thu, 06 Feb 2025 10:09:01 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-38db34a5c5fso299018f8f.2
        for <linux-riscv@lists.infradead.org>; Thu, 06 Feb 2025 02:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738836539; x=1739441339; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HHNWXRaZn35IBHeh9gLStj7vRKvHzbcw+Ykh7peDMJo=;
        b=nnBodRi2e+PV18IVDoDcS9QSC+HaTHKPyHu2kiZrkXmfqpFIBvebByolDwFjwQA/li
         Vuj9e8ne/weRP9nL843zup6nse881kpri+1+9NdgoWgE/Oh9DQ8dXD8jWp0jE0zRPKXn
         mkFr93movELkNyEXeyAh6x1WeMH94LzG3JGLs8Mqj7n+RYgl0T3j9bFN6omGSuzyl/WK
         /VwMhLmc0jeA+bWKKHK0G7757w1p0yuxHzhNcauNoyfLKaOfpienH5/V/wjZbV+MWH1Q
         B/DsBVcUrLvl+WsoN7B/IoLgGUfTIqzQ+Shu7sZg5hXkSKb/7TFrYvTLQ74zFmu694kW
         Upuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738836539; x=1739441339;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HHNWXRaZn35IBHeh9gLStj7vRKvHzbcw+Ykh7peDMJo=;
        b=v0pu2yqLYIZd9Cw25qCtLqJC2LuW5g+Q2SYfETWNvFsdAqeiJE9hnUlvolLkjA2fKo
         PwaemudzG1DYPlK1eUQZNY4BA2+gJrnRN4B6uoWxInObrDjxZlGLlNdHVUqRZRQpIuRe
         k7mgI+T7lwfMFMRdBEMOsI3/ebl2wanMnweh13RB1hQyGc0asDF/VX7b+VEuvEGv+ous
         BjvhCySrGrVQ7n7IjIsIBxOzw8cXaLAtbsScFXhVAJqumbsjVUcqHlsLKWzeHuk0dgGD
         vCJ0jMOPXDvmrKfpx/4CuvlOX+NIiPTo/CDID8f/ik4DEwAIT6AfMTQNI5M46awjj75X
         /RVw==
X-Forwarded-Encrypted: i=1; AJvYcCWYNXBpVPN3b8LC+G8UKEErlya6U6m5cv+S8OuRLwl/dUnXelHjKd+ivD6slBaeh7T4YfqquDgSDpBQVg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwPD9rb0JoKyHlvwcN7eSE5A8iOu9329LBXXKBGgw3t9M8M6A3o
	HdL6+sHprIVSKbowZKcFfZoA4WIq6Pz4H3dGlasRFnMwkUX7lEoh3/W6i/6picA=
X-Gm-Gg: ASbGnct1g+Hb9ajwO/ts318zcb4HKErrFyMiVofNLRzQir2+fxoFt8xpg8CzUKdaqNW
	dm+vbcGq9hxMNexh5xa2vDFj36FQCcX6CjOaV65c9ztVM+YunpJzXIgRgRn4SyprFzrk/pS/KWa
	GnxzthS4XIRksiY1wq9UVPSpHg7IS4gNrRnDpWK6QzcJPOdh7+jJdbyHRBwL5wSSz64nmbr/JQz
	QxSjDhQ0+87bQsHA8pXomOuSG993TMckK6zN12gcgoj52kmR3xYob2gVC7F+wygaH4PsPdKor+n
	gdkiFITN/GQyE24CGHWHI9Nv5tusXk0++IxBFd/JnMYLx+2guhfWkD3iInT5
X-Google-Smtp-Source: AGHT+IEPRHxanM+T5eT9IVRe1kwymDZy+oedZwXm5TLIzbZUEi4iRfkFJCBFo3lzCe7x+J94vw/6zg==
X-Received: by 2002:a05:6000:1886:b0:38d:b2bd:aef with SMTP id ffacd0b85a97d-38db48ca7f6mr5156444f8f.41.1738836538830;
        Thu, 06 Feb 2025 02:08:58 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dc9ffd8sm13929015e9.10.2025.02.06.02.08.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 02:08:58 -0800 (PST)
Message-ID: <0df559c7-920d-4d89-b1c8-75380750e7e1@rivosinc.com>
Date: Thu, 6 Feb 2025 11:08:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] RISC-V: add vector extension validation checks
To: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Eric Biggers <ebiggers@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Andy Chiu <andybnac@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250205-cobbler-unpadded-5580c1f5d946@spud>
 <20250205-defensive-lent-04936dac6bdd@spud>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250205-defensive-lent-04936dac6bdd@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_020900_799957_DDF4365B 
X-CRM114-Status: GOOD (  27.58  )
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

CgpPbiAwNS8wMi8yMDI1IDE3OjA1LCBDb25vciBEb29sZXkgd3JvdGU6Cj4gRnJvbTogQ29ub3Ig
RG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPiAKPiBVc2luZyBDbGVtZW50J3Mg
bmV3IHZhbGlkYXRpb24gY2FsbGJhY2tzLCBzdXBwb3J0IGNoZWNraW5nIHRoYXQKPiBkZXBlbmRl
bmNpZXMgaGF2ZSBiZWVuIHNhdGlzZmllZCBmb3IgdGhlIHZlY3RvciBleHRlbnNpb25zLiBGcm9t
IHRoZQo+IGtlcm5lbCdzIHBlcmZlY3RpdmUsIGl0J3Mgbm90IHJlcXVpcmVkIHRvIGRpZmZlcmVu
dGlhdGUgYmV0d2VlbiB0aGUKPiBjb25kaXRpb25zIGZvciBhbGwgdGhlIHZhcmlvdXMgdmVjdG9y
IHN1YnNldHMgLSBpdCdzIHRoZSBmaXJtd2FyZSdzIGpvYgo+IHRvIG5vdCByZXBvcnQgaW1wb3Nz
aWJsZSBjb21iaW5hdGlvbnMuIEluc3RlYWQsIHRoZSBrZXJuZWwgb25seSBoYXMgdG8KPiBjaGVj
ayB0aGF0IHRoZSBjb3JyZWN0IGNvbmZpZyBvcHRpb25zIGFyZSBlbmFibGVkIGFuZCB0byBlbmZv
cmNlIGl0cwo+IHJlcXVpcmVtZW50IG9mIHRoZSBkIGV4dGVuc2lvbiBiZWluZyBwcmVzZW50IGZv
ciBGUFUgc3VwcG9ydC4KPiAKPiBTaW5jZSB2ZWN0b3Igd2lsbCBub3cgYmUgZGlzYWJsZWQgcHJv
YWN0aXZlbHksIHRoZXJlJ3Mgbm8gbmVlZCB0byBjbGVhcgo+IHRoZSBiaXQgaW4gZWxmX2h3Y2Fw
IGluIHJpc2N2X2ZpbGxfaHdjYXAoKSBhbnkgbG9uZ2VyLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENv
bm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4gLS0tCj4gIGFyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vY3B1ZmVhdHVyZS5oIHwgIDMgKysKPiAgYXJjaC9yaXNjdi9rZXJuZWwv
Y3B1ZmVhdHVyZS5jICAgICAgfCA1NyArKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLQo+ICAy
IGZpbGVzIGNoYW5nZWQsIDQwIGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWZlYXR1cmUuaCBiL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vY3B1ZmVhdHVyZS5oCj4gaW5kZXggNTY5MTQwZDZlNjM5Li41ZDk0Mjdj
Y2JjN2EgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jcHVmZWF0dXJlLmgK
PiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWZlYXR1cmUuaAo+IEBAIC01Niw2ICs1
Niw5IEBAIHZvaWQgX19pbml0IHJpc2N2X3VzZXJfaXNhX2VuYWJsZSh2b2lkKTsKPiAgI2RlZmlu
ZSBfX1JJU0NWX0lTQV9FWFRfQlVORExFKF9uYW1lLCBfYnVuZGxlZF9leHRzKSBcCj4gIAlfUklT
Q1ZfSVNBX0VYVF9EQVRBKF9uYW1lLCBSSVNDVl9JU0FfRVhUX0lOVkFMSUQsIF9idW5kbGVkX2V4
dHMsIFwKPiAgCQkJICAgIEFSUkFZX1NJWkUoX2J1bmRsZWRfZXh0cyksIE5VTEwpCj4gKyNkZWZp
bmUgX19SSVNDVl9JU0FfRVhUX0JVTkRMRV9WQUxJREFURShfbmFtZSwgX2J1bmRsZWRfZXh0cywg
X3ZhbGlkYXRlKSBcCj4gKwlfUklTQ1ZfSVNBX0VYVF9EQVRBKF9uYW1lLCBSSVNDVl9JU0FfRVhU
X0lOVkFMSUQsIF9idW5kbGVkX2V4dHMsIFwKPiArCQkJICAgIEFSUkFZX1NJWkUoX2J1bmRsZWRf
ZXh0cyksIF92YWxpZGF0ZSkKPiAgCj4gIC8qIFVzZWQgdG8gZGVjbGFyZSBleHRlbnNpb25zIHRo
YXQgYXJlIGEgc3VwZXJzZXQgb2Ygb3RoZXIgZXh0ZW5zaW9ucyAoWnZiYiBmb3IgaW5zdGFuY2Up
ICovCj4gICNkZWZpbmUgX19SSVNDVl9JU0FfRVhUX1NVUEVSU0VUKF9uYW1lLCBfaWQsIF9zdWJf
ZXh0cykgXAo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgYi9h
cmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKPiBpbmRleCBjNmJhNzUwNTM2YzMuLjQwYTI0
YjA4ZDkwNSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKPiAr
KysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKPiBAQCAtMTA5LDYgKzEwOSwzNSBA
QCBzdGF0aWMgaW50IHJpc2N2X2V4dF96aWNib3pfdmFsaWRhdGUoY29uc3Qgc3RydWN0IHJpc2N2
X2lzYV9leHRfZGF0YSAqZGF0YSwKPiAgCXJldHVybiAwOwo+ICB9Cj4gIAo+ICtzdGF0aWMgaW50
IHJpc2N2X2V4dF92ZWN0b3JfeF92YWxpZGF0ZShjb25zdCBzdHJ1Y3QgcmlzY3ZfaXNhX2V4dF9k
YXRhICpkYXRhLAo+ICsJCQkJICAgICAgIGNvbnN0IHVuc2lnbmVkIGxvbmcgKmlzYV9iaXRtYXAp
Cj4gK3sKPiArCWlmICghSVNfRU5BQkxFRChDT05GSUdfUklTQ1ZfSVNBX1YpKQo+ICsJCXJldHVy
biAtRUlOVkFMOwo+ICsKPiArCXJldHVybiAwOwo+ICt9Cj4gKwo+ICtzdGF0aWMgaW50IHJpc2N2
X2V4dF92ZWN0b3JfZmxvYXRfdmFsaWRhdGUoY29uc3Qgc3RydWN0IHJpc2N2X2lzYV9leHRfZGF0
YSAqZGF0YSwKPiArCQkJCQkgICBjb25zdCB1bnNpZ25lZCBsb25nICppc2FfYml0bWFwKQo+ICt7
Cj4gKwlpZiAoIUlTX0VOQUJMRUQoQ09ORklHX1JJU0NWX0lTQV9WKSkKPiArCQlyZXR1cm4gLUVJ
TlZBTDsKPiArCj4gKwlpZiAoIUlTX0VOQUJMRUQoQ09ORklHX0ZQVSkpCj4gKwkJcmV0dXJuIC1F
SU5WQUw7Cj4gKwo+ICsJLyoKPiArCSAqIFRoZSBrZXJuZWwgZG9lc24ndCBzdXBwb3J0IHN5c3Rl
bXMgdGhhdCBkb24ndCBpbXBsZW1lbnQgYm90aCBvZgo+ICsJICogRiBhbmQgRCwgc28gaWYgYW55
IG9mIHRoZSB2ZWN0b3IgZXh0ZW5zaW9ucyB0aGF0IGRvIGZsb2F0aW5nIHBvaW50Cj4gKwkgKiBh
cmUgdG8gYmUgdXNhYmxlLCBib3RoIGZsb2F0aW5nIHBvaW50IGV4dGVuc2lvbnMgbmVlZCB0byBi
ZSB1c2FibGUuCj4gKwkgKi8KPiArCWlmICghX19yaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJs
ZShpc2FfYml0bWFwLCBSSVNDVl9JU0FfRVhUX2QpKQo+ICsJCXJldHVybiAtRUlOVkFMOwo+ICsK
PiArCXJldHVybiAwOwo+ICt9Cj4gKwo+ICBzdGF0aWMgaW50IHJpc2N2X2V4dF96Y2FfZGVwZW5k
cyhjb25zdCBzdHJ1Y3QgcmlzY3ZfaXNhX2V4dF9kYXRhICpkYXRhLAo+ICAJCQkJIGNvbnN0IHVu
c2lnbmVkIGxvbmcgKmlzYV9iaXRtYXApCj4gIHsKPiBAQCAtMzI2LDEyICszNTUsMTAgQEAgY29u
c3Qgc3RydWN0IHJpc2N2X2lzYV9leHRfZGF0YSByaXNjdl9pc2FfZXh0W10gPSB7Cj4gIAlfX1JJ
U0NWX0lTQV9FWFRfREFUQShkLCBSSVNDVl9JU0FfRVhUX2QpLAo+ICAJX19SSVNDVl9JU0FfRVhU
X0RBVEEocSwgUklTQ1ZfSVNBX0VYVF9xKSwKPiAgCV9fUklTQ1ZfSVNBX0VYVF9TVVBFUlNFVChj
LCBSSVNDVl9JU0FfRVhUX2MsIHJpc2N2X2NfZXh0cyksCj4gLQlfX1JJU0NWX0lTQV9FWFRfU1VQ
RVJTRVQodiwgUklTQ1ZfSVNBX0VYVF92LCByaXNjdl92X2V4dHMpLAo+ICsJX19SSVNDVl9JU0Ff
RVhUX1NVUEVSU0VUX1ZBTElEQVRFKHYsIFJJU0NWX0lTQV9FWFRfdiwgcmlzY3Zfdl9leHRzLCBy
aXNjdl9leHRfdmVjdG9yX2Zsb2F0X3ZhbGlkYXRlKSwKPiAgCV9fUklTQ1ZfSVNBX0VYVF9EQVRB
KGgsIFJJU0NWX0lTQV9FWFRfaCksCj4gLQlfX1JJU0NWX0lTQV9FWFRfU1VQRVJTRVRfVkFMSURB
VEUoemljYm9tLCBSSVNDVl9JU0FfRVhUX1pJQ0JPTSwgcmlzY3ZfeGxpbnV4ZW52Y2ZnX2V4dHMs
Cj4gLQkJCQkJICByaXNjdl9leHRfemljYm9tX3ZhbGlkYXRlKSwKPiAtCV9fUklTQ1ZfSVNBX0VY
VF9TVVBFUlNFVF9WQUxJREFURSh6aWNib3osIFJJU0NWX0lTQV9FWFRfWklDQk9aLCByaXNjdl94
bGludXhlbnZjZmdfZXh0cywKPiAtCQkJCQkgIHJpc2N2X2V4dF96aWNib3pfdmFsaWRhdGUpLAo+
ICsJX19SSVNDVl9JU0FfRVhUX1NVUEVSU0VUX1ZBTElEQVRFKHppY2JvbSwgUklTQ1ZfSVNBX0VY
VF9aSUNCT00sIHJpc2N2X3hsaW51eGVudmNmZ19leHRzLCByaXNjdl9leHRfemljYm9tX3ZhbGlk
YXRlKSwKPiArCV9fUklTQ1ZfSVNBX0VYVF9TVVBFUlNFVF9WQUxJREFURSh6aWNib3osIFJJU0NW
X0lTQV9FWFRfWklDQk9aLCByaXNjdl94bGludXhlbnZjZmdfZXh0cywgcmlzY3ZfZXh0X3ppY2Jv
el92YWxpZGF0ZSksCgpIZXkgQ29ub3IsCgpUaGlzIGNodW5rIHNlZW1zIHRvIGp1c3QgcmVtb3Zl
IGxpbmUgd3JhcHBpbmcgZm9yIGV4aXN0aW5nIGNvZGUsIG5vdApzdXJlIGlmIHRoaXMgaXMgaW50
ZW5kZWQuCgpUaGFua3MsCgpDbMOpbWVudAoKCj4gIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6aWNj
cnNlLCBSSVNDVl9JU0FfRVhUX1pJQ0NSU0UpLAo+ICAJX19SSVNDVl9JU0FfRVhUX0RBVEEoemlj
bnRyLCBSSVNDVl9JU0FfRVhUX1pJQ05UUiksCj4gIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6aWNv
bmQsIFJJU0NWX0lTQV9FWFRfWklDT05EKSwKPiBAQCAtMzcyLDExICszOTksMTEgQEAgY29uc3Qg
c3RydWN0IHJpc2N2X2lzYV9leHRfZGF0YSByaXNjdl9pc2FfZXh0W10gPSB7Cj4gIAlfX1JJU0NW
X0lTQV9FWFRfREFUQSh6dHNvLCBSSVNDVl9JU0FfRVhUX1pUU08pLAo+ICAJX19SSVNDVl9JU0Ff
RVhUX1NVUEVSU0VUKHp2YmIsIFJJU0NWX0lTQV9FWFRfWlZCQiwgcmlzY3ZfenZiYl9leHRzKSwK
PiAgCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHp2YmMsIFJJU0NWX0lTQV9FWFRfWlZCQyksCj4gLQlf
X1JJU0NWX0lTQV9FWFRfU1VQRVJTRVQoenZlMzJmLCBSSVNDVl9JU0FfRVhUX1pWRTMyRiwgcmlz
Y3ZfenZlMzJmX2V4dHMpLAo+IC0JX19SSVNDVl9JU0FfRVhUX0RBVEEoenZlMzJ4LCBSSVNDVl9J
U0FfRVhUX1pWRTMyWCksCj4gLQlfX1JJU0NWX0lTQV9FWFRfU1VQRVJTRVQoenZlNjRkLCBSSVND
Vl9JU0FfRVhUX1pWRTY0RCwgcmlzY3ZfenZlNjRkX2V4dHMpLAo+IC0JX19SSVNDVl9JU0FfRVhU
X1NVUEVSU0VUKHp2ZTY0ZiwgUklTQ1ZfSVNBX0VYVF9aVkU2NEYsIHJpc2N2X3p2ZTY0Zl9leHRz
KSwKPiAtCV9fUklTQ1ZfSVNBX0VYVF9TVVBFUlNFVCh6dmU2NHgsIFJJU0NWX0lTQV9FWFRfWlZF
NjRYLCByaXNjdl96dmU2NHhfZXh0cyksCj4gKwlfX1JJU0NWX0lTQV9FWFRfU1VQRVJTRVRfVkFM
SURBVEUoenZlMzJmLCBSSVNDVl9JU0FfRVhUX1pWRTMyRiwgcmlzY3ZfenZlMzJmX2V4dHMsIHJp
c2N2X2V4dF92ZWN0b3JfZmxvYXRfdmFsaWRhdGUpLAo+ICsJX19SSVNDVl9JU0FfRVhUX0RBVEFf
VkFMSURBVEUoenZlMzJ4LCBSSVNDVl9JU0FfRVhUX1pWRTMyWCwgcmlzY3ZfZXh0X3ZlY3Rvcl94
X3ZhbGlkYXRlKSwKPiArCV9fUklTQ1ZfSVNBX0VYVF9TVVBFUlNFVF9WQUxJREFURSh6dmU2NGQs
IFJJU0NWX0lTQV9FWFRfWlZFNjRELCByaXNjdl96dmU2NGRfZXh0cywgcmlzY3ZfZXh0X3ZlY3Rv
cl9mbG9hdF92YWxpZGF0ZSksCj4gKwlfX1JJU0NWX0lTQV9FWFRfU1VQRVJTRVRfVkFMSURBVEUo
enZlNjRmLCBSSVNDVl9JU0FfRVhUX1pWRTY0RiwgcmlzY3ZfenZlNjRmX2V4dHMsIHJpc2N2X2V4
dF92ZWN0b3JfZmxvYXRfdmFsaWRhdGUpLAo+ICsJX19SSVNDVl9JU0FfRVhUX1NVUEVSU0VUX1ZB
TElEQVRFKHp2ZTY0eCwgUklTQ1ZfSVNBX0VYVF9aVkU2NFgsIHJpc2N2X3p2ZTY0eF9leHRzLCBy
aXNjdl9leHRfdmVjdG9yX3hfdmFsaWRhdGUpLAo+ICAJX19SSVNDVl9JU0FfRVhUX0RBVEEoenZm
aCwgUklTQ1ZfSVNBX0VYVF9aVkZIKSwKPiAgCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHp2ZmhtaW4s
IFJJU0NWX0lTQV9FWFRfWlZGSE1JTiksCj4gIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6dmtiLCBS
SVNDVl9JU0FfRVhUX1pWS0IpLAo+IEBAIC05NjAsMTYgKzk4Nyw2IEBAIHZvaWQgX19pbml0IHJp
c2N2X2ZpbGxfaHdjYXAodm9pZCkKPiAgCQlyaXNjdl92X3NldHVwX3ZzaXplKCk7Cj4gIAl9Cj4g
IAo+IC0JaWYgKGVsZl9od2NhcCAmIENPTVBBVF9IV0NBUF9JU0FfVikgewo+IC0JCS8qCj4gLQkJ
ICogSVNBIHN0cmluZyBpbiBkZXZpY2UgdHJlZSBtaWdodCBoYXZlICd2JyBmbGFnLCBidXQKPiAt
CQkgKiBDT05GSUdfUklTQ1ZfSVNBX1YgaXMgZGlzYWJsZWQgaW4ga2VybmVsLgo+IC0JCSAqIENs
ZWFyIFYgZmxhZyBpbiBlbGZfaHdjYXAgaWYgQ09ORklHX1JJU0NWX0lTQV9WIGlzIGRpc2FibGVk
Lgo+IC0JCSAqLwo+IC0JCWlmICghSVNfRU5BQkxFRChDT05GSUdfUklTQ1ZfSVNBX1YpKQo+IC0J
CQllbGZfaHdjYXAgJj0gfkNPTVBBVF9IV0NBUF9JU0FfVjsKPiAtCX0KPiAtCj4gIAltZW1zZXQo
cHJpbnRfc3RyLCAwLCBzaXplb2YocHJpbnRfc3RyKSk7Cj4gIAlmb3IgKGkgPSAwLCBqID0gMDsg
aSA8IE5VTV9BTFBIQV9FWFRTOyBpKyspCj4gIAkJaWYgKHJpc2N2X2lzYVswXSAmIEJJVF9NQVNL
KGkpKQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
