Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B92CC47DD9
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Feb 2024 08:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s1Y3A0kd5ehK/ByQk1NNogsXlH5NFJap2NG+AN/0+zA=; b=d4chPc52y6McIU
	ydiw+VT/B0ZJh5MOEmD7rT4DPZkI03u5rV32Y36VPv1/uwuWpYtVzONeo6yZgYXDHu8L+CshghH5T
	6HV+zwJAnARzfyCbwSkNSCfF40w3LsixTzaunTGcHhEUHEWevoEWEjVkGpspHL80inM1BSaqx4ku+
	nwbd4d738TEkyQXh+0S96xJYrC0QTKymgWyScDgA8UoUCNmwJvHxB2zhqmltGDF2oW5iUFGSh7X5n
	N7mv5aUzv3aXQu3zYiXHxpURKe82p+3t9TSDyR3rE8V+9EXF22eRPe4jwJsfALl5bdqzEn16cbfA+
	MlddRuCV71KcgMN4DH2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfEw5-00000008PWh-0vlc;
	Wed, 28 Feb 2024 08:05:05 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfEw1-00000008PUi-3pGz
	for linux-riscv@lists.infradead.org;
	Wed, 28 Feb 2024 08:05:03 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-33d855caf7dso1078967f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 28 Feb 2024 00:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1709107499; x=1709712299; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vc502tF8ByhugONRdblELIyv+0sQYkGIhK4y3DjwW1c=;
        b=RuQRlOVRF/Po4UwFJrn7gDL1ZtWUDK/iDGyi1FYr1nDm+ZbxFKVbo+EXErIA6YoeuD
         iSnWlJ412B8wppL2pGF/aWgb2NX90IB56bi24z/sl6K5ORDuW1z989pL5S2YPXsN8KnF
         qVFtiP7A6joozWeyPukg2VGhe0MuCwljF3y7MLs2YOj885kSqXl4bBt2lBjx2HzYG+T5
         5YPuPAe3MDHluHq15PE4sSGS4ISSdBjhXOLH+sESE3TUTSY4XchEPLebv4FrfAo6wUmU
         C5oMmanmV/yNO9DXKh/UH8JlFLHKATO8c0ufrzh8EIcM6ZQ3QlJgWomP6YPAvQmkWTSn
         c6aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709107499; x=1709712299;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vc502tF8ByhugONRdblELIyv+0sQYkGIhK4y3DjwW1c=;
        b=vF2xvALKpCtTWPCKjQhfPutZdVdxGZE80Bp9p/rYBZbjIPQQXTD1OQp2tH3iXBc+0l
         UDwFewPu0LQ9suzOjwfSyEpqJUATquo1Vi0htI2N8ANVekAIcwkiThKT7Zia0G9FI0MO
         w65BeVuVvGAfAlO3LDZuqH5IpSSkJyqMgihi9/vkwufeaLL1i93zCy8kiYzoZMGhIEYB
         UMC9NiPBiEXfP5mRGrDXcYL2fcq7Cw99bg/DjlMPdZnsU1vfjnbRwWKPXdltR9oISR+5
         oZHhADc/3SqfiilJErGjxTrmkMiweTXjXkZs7MxuKyVbERaRs5sFo23adkne9x0mudoK
         YOGg==
X-Forwarded-Encrypted: i=1; AJvYcCVMzKzcb0i0wUrX41FKkTk9FLGKnSA8b9ByrVWqdCBd1IfjB3Ifrq4ehAtacolF+ICQpajoGMMACrGEX251KrzyqKa5cSTKKCVbVItzsjcc
X-Gm-Message-State: AOJu0YwX1bI8j6w0JWWmeX11lh+DtUaOFKIok6aYM7I4tGhTmaUjQHMt
	3DxLNIO7uu6+WcPKcRwMCHETdgwqqGr4UKSp4IuYmydAs8+sDikjUoBN7nTPVktMpcpyq9mwkOW
	o
X-Google-Smtp-Source: AGHT+IHXHO94MLl9EWvrABHlZzbmNiVmCMY19lCfuwoyoAY5uHCEF295TutBQdp+jSG71a/1ERu+XA==
X-Received: by 2002:a05:6000:a18:b0:33d:9fee:686f with SMTP id co24-20020a0560000a1800b0033d9fee686fmr9161553wrb.1.1709107499461;
        Wed, 28 Feb 2024 00:04:59 -0800 (PST)
Received: from ?IPV6:2a01:e0a:999:a3a0:ecf0:90fe:8664:ce2? ([2a01:e0a:999:a3a0:ecf0:90fe:8664:ce2])
        by smtp.gmail.com with ESMTPSA id a10-20020a5d4d4a000000b0033d13530134sm13550536wru.106.2024.02.28.00.04.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Feb 2024 00:04:59 -0800 (PST)
Message-ID: <0e0e5ca1-9c8f-4213-a795-9695f2ae234d@rivosinc.com>
Date: Wed, 28 Feb 2024 09:04:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] riscv: Set unalignment speed at compile time
To: Evan Green <evan@rivosinc.com>, Charlie Jenkins <charlie@rivosinc.com>
Cc: Conor Dooley <conor@kernel.org>, Conor Dooley
 <conor.dooley@microchip.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-kernel@vger.kernel.org, Eric Biggers <ebiggers@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Jisheng Zhang <jszhang@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 Charles Lohr <lohr85@gmail.com>
References: <20240216-disable_misaligned_probe_config-v4-0-dc01e581c0ac@rivosinc.com>
 <20240216-disable_misaligned_probe_config-v4-2-dc01e581c0ac@rivosinc.com>
 <20240227-condone-impeach-9469dffc6b47@wendy> <Zd4nMa+x28omuhiF@ghost>
 <20240227-citable-scanning-1fd48c96b758@spud> <Zd414nBtjHcsYWnL@ghost>
 <CALs-HssaGBHrFdavM=VYm+z0vBWKSnoS2b0cAmjnXA_Kji1KdA@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <CALs-HssaGBHrFdavM=VYm+z0vBWKSnoS2b0cAmjnXA_Kji1KdA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_000502_117909_B9A7CC33 
X-CRM114-Status: GOOD (  23.12  )
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

CgpPbiAyNy8wMi8yMDI0IDIwOjQ0LCBFdmFuIEdyZWVuIHdyb3RlOgo+IE9uIFR1ZSwgRmViIDI3
LCAyMDI0IGF0IDExOjIw4oCvQU0gQ2hhcmxpZSBKZW5raW5zIDxjaGFybGllQHJpdm9zaW5jLmNv
bT4gd3JvdGU6Cj4+Cj4+IE9uIFR1ZSwgRmViIDI3LCAyMDI0IGF0IDA2OjQ4OjU0UE0gKzAwMDAs
IENvbm9yIERvb2xleSB3cm90ZToKPj4+IE9uIFR1ZSwgRmViIDI3LCAyMDI0IGF0IDEwOjE3OjIx
QU0gLTA4MDAsIENoYXJsaWUgSmVua2lucyB3cm90ZToKPj4+PiBPbiBUdWUsIEZlYiAyNywgMjAy
NCBhdCAxMTozOToyNUFNICswMDAwLCBDb25vciBEb29sZXkgd3JvdGU6Cj4+Pj4+IE9uIEZyaSwg
RmViIDE2LCAyMDI0IGF0IDEyOjMzOjE5UE0gLTA4MDAsIENoYXJsaWUgSmVua2lucyB3cm90ZToK
Pj4+Cj4+Pj4+PiArY29uZmlnIFJJU0NWX0VNVUxBVEVEX1VOQUxJR05FRF9BQ0NFU1MKPj4+Pj4+
ICsgICAgICAgYm9vbCAiQXNzdW1lIHRoZSBDUFUgZXhwZWN0cyBlbXVsYXRlZCB1bmFsaWduZWQg
bWVtb3J5IGFjY2Vzc2VzIgo+Pj4+Pj4gKyAgICAgICBkZXBlbmRzIG9uIE5PTlBPUlRBQkxFCj4+
Pj4+Cj4+Pj4+IFRoaXMgaXMgcG9ydGFibGUgdG9vLCByaWdodD8KPj4+Pgo+Pj4+IEkgZ3Vlc3Mg
c28/IEkgdGhpbmsgSSB3b3VsZCBwcmVmZXIgdG8gaGF2ZSB0aGUgcHJvYmluZyBiZWluZyB0aGUg
b25seQo+Pj4+IHBvcnRhYmxlIG9wdGlvbi4KPj4+Cj4+PiBJIGR1bm5vLCBJIHRoaW5rIHRoZXJl
IGNvdWxkIGJlIHZhbHVlIHRvIHNvbWVvbmUgaW4gYWx3YXlzIGVtdWxhdGluZwo+Pj4gdGhpcyBp
biB0aGUga2VybmVsIGFuZCBJIGRvbid0IHRoaW5rIHRoYXQgc2hvdWxkIHJlbGVnYXRlIHRoZW0g
dG8gdGhlCj4+PiBuYXVnaHR5IHN0ZXAsIGdpdmVuIGl0IGNhbiB3b3JrIGV2ZXJ5d2hlcmUuCj4+
Cj4+IEFscmlnaHQsIEkgd2lsbCByZW1vdmUgdGhlIG5vbnBvcnRhYmxlLgo+Pgo+Pj4KPj4+Cj4+
Pj4+PiArY29uZmlnIFJJU0NWX1NMT1dfVU5BTElHTkVEX0FDQ0VTUwo+Pj4+Pj4gKyAgICAgICBi
b29sICJBc3N1bWUgdGhlIENQVSBzdXBwb3J0cyBzbG93IHVuYWxpZ25lZCBtZW1vcnkgYWNjZXNz
ZXMiCj4+Pj4+PiArICAgICAgIGRlcGVuZHMgb24gTk9OUE9SVEFCTEUKPj4+Pj4+ICsgICAgICAg
aGVscAo+Pj4+Pj4gKyAgICAgICAgIEFzc3VtZSB0aGF0IHRoZSBDUFUgc3VwcG9ydHMgc2xvdyB1
bmFsaWduZWQgbWVtb3J5IGFjY2Vzc2VzLiBXaGVuCj4+Pj4+PiArICAgICAgICAgZW5hYmxlZCwg
dGhpcyBvcHRpb24gaW1wcm92ZXMgdGhlIHBlcmZvcm1hbmNlIG9mIHRoZSBrZXJuZWwgb24gc3Vj
aAo+Pj4+Pj4gKyAgICAgICAgIENQVXMuCj4+Pj4+Cj4+Pj4+IERvZXMgaXQ/IEFyZSB5b3Ugc3Vy
ZSB0aGF0IGdlbmVyYXRpbmcgdW5hbGlnbmVkIGFjY2Vzc2VzIG9uIHN5c3RlbXMKPj4+Pj4gd2hl
cmUgdGhleSBhcmUgc2xvdyBpcyBhIHBlcmZvcm1hbmNlIGluY3JlYXNlPwo+Pj4+PiBUaGF0IHNh
aWQsIEkgZG9uJ3QgcmVhbGx5IHNlZSB0aGlzIG9wdGlvbiBhY3R1YWxseSBkb2luZyBhbnl0aGlu
ZyBvdGhlcgo+Pj4+PiB0aGFuIHNldHRpbmcgdGhlIHZhbHVlIGZvciBod3Byb2JlLCBzbyBJIGRv
bid0IGFjdHVhbGx5IGtub3cgd2hhdCB0aGUKPj4+Pj4gZWZmZWN0IG9mIHRoaXMgb3B0aW9uIGFj
dHVhbGx5IGlzIG9uIHRoZSBrZXJuZWwncyBwZXJmb3JtYW5jZS4KPj4+Pj4KPj4+Pj4gR2VuZXJh
bGx5IEkgd291bGQgbGlrZSB0byBzdWdnZXN0IGEgY2hhbmdlIGZyb20gIkNQVSIgdG8gInN5c3Rl
bSIgaGVyZSwKPj4+Pj4gc2luY2UgdGhlIHNsb3cgY2FzZXMgdGhhdCBleGlzdCBhcmUgbW9zdGx5
IGJlY2F1c2UgdGhlIHVuYWxpZ25lZCBhY2Nlc3MKPj4+Pj4gaXMgYWN0dWFsbHkgZW11bGF0ZWQg
aW4gZmlybXdhcmUuCj4+Pj4KPj4+PiBJdCB3b3VsZCBiZSBpZGVhbCBpZiAiZW11bGF0ZWQiIHdh
cyB1c2VkIGZvciBhbnkgY2FzZSBvZiBlbXVsYXRlZAo+Pj4+IGFjY2Vzc2VzIChmaXJtd2FyZSBv
ciBpbiB0aGUga2VybmVsKS4gIERvaW5nIGVtdWxhdGVkIGFjY2Vzc2VzIHdpbGwgYmUKPj4+PiBv
cmRlcnMgb2YgbWFnbml0dWRlIHNsb3dlciB0aGFuIGEgcHJvY2Vzc29yIHRoYXQgInNsb3dseSIg
aGFuZGxlcyB0aGUKPj4+PiBhY2Nlc3Nlcy4KPj4+Pgo+Pj4+IFNvIGV2ZW4gaWYgdGhlIHByb2Nl
c3NvciBwZXJmb3JtcyBhICJzbG93IiBhY2Nlc3MsIGl0IGNvdWxkIHN0aWxsIGJlCj4+Pj4gYmVu
ZWZpY2lhbCBmb3IgdGhlIGtlcm5lbCB0byBkbyB0aGUgbWlzYWxpZ25lZCBhY2Nlc3MgcmF0aGVy
IHRoYW4gbWFudWFsCj4+Pj4gZG8gdGhlIGFsaWdubWVudC4KPj4+Cj4+PiBSaWdodC4gQnV0LCBh
dCBsZWFzdCBmcm9tIGEgcHJvYmluZyBwZXJzcGVjdGl2ZSwgU0xPVyBpcyB3aGF0IGdldHMKPj4+
IHNlbGVjdGVkIHdoZW4gZmlybXdhcmUgZW11bGF0ZXMgdGhlIHVuYWxpZ25lZCBhY2Nlc3Mgc28g
dG8gdXNlcnNwYWNlCj4+PiBzZWVpbmcgc2xvdyBtZWFucyB0aGF0IHRoZSBwZXJmb3JtYW5jZSBj
b3VsZCBiZSBob3JyaWZpY2FsbHkgYmFkOgo+Pj4KPj4+IHwgICAgIHJ6Zml2ZToKPj4+IHwgICAg
ICAgICBjcHUwOiBSYXRpbyBvZiBieXRlIGFjY2VzcyB0aW1lIHRvIHVuYWxpZ25lZCB3b3JkIGFj
Y2VzcyBpcwo+Pj4gfCAxLjA1LCB1bmFsaWduZWQgYWNjZXNzZXMgYXJlIGZhc3QKPj4+IHwKPj4+
IHwgICAgIGljaWNsZToKPj4+IHwKPj4+IHwgICAgICAgICBjcHUxOiBSYXRpbyBvZiBieXRlIGFj
Y2VzcyB0aW1lIHRvIHVuYWxpZ25lZCB3b3JkIGFjY2VzcyBpcwo+Pj4gfCAwLjAwLCB1bmFsaWdu
ZWQgYWNjZXNzZXMgYXJlIHNsb3cKPj4+IHwgICAgICAgICBjcHUyOiBSYXRpbyBvZiBieXRlIGFj
Y2VzcyB0aW1lIHRvIHVuYWxpZ25lZCB3b3JkIGFjY2VzcyBpcwo+Pj4gfCAwLjAwLCB1bmFsaWdu
ZWQgYWNjZXNzZXMgYXJlIHNsb3cKPj4+IHwgICAgICAgICBjcHUzOiBSYXRpbyBvZiBieXRlIGFj
Y2VzcyB0aW1lIHRvIHVuYWxpZ25lZCB3b3JkIGFjY2VzcyBpcwo+Pj4gfCAwLjAwLCB1bmFsaWdu
ZWQgYWNjZXNzZXMgYXJlIHNsb3cKPj4+IHwKPj4+IHwgICAgICAgICBjcHUwOiBSYXRpbyBvZiBi
eXRlIGFjY2VzcyB0aW1lIHRvIHVuYWxpZ25lZCB3b3JkIGFjY2VzcyBpcwo+Pj4gfCAwLjAwLCB1
bmFsaWduZWQgYWNjZXNzZXMgYXJlIHNsb3cKPj4+IHwKPj4+IHwgICAgIGsyMTA6Cj4+PiB8Cj4+
PiB8ICAgICAgICAgY3B1MTogUmF0aW8gb2YgYnl0ZSBhY2Nlc3MgdGltZSB0byB1bmFsaWduZWQg
d29yZCBhY2Nlc3MgaXMKPj4+IHwgMC4wMiwgdW5hbGlnbmVkIGFjY2Vzc2VzIGFyZSBzbG93Cj4+
PiB8ICAgICAgICAgY3B1MDogUmF0aW8gb2YgYnl0ZSBhY2Nlc3MgdGltZSB0byB1bmFsaWduZWQg
d29yZCBhY2Nlc3MgaXMKPj4+IHwgMC4wMiwgdW5hbGlnbmVkIGFjY2Vzc2VzIGFyZSBzbG93Cj4+
PiB8Cj4+PiB8ICAgICBzdGFybGlnaHQ6Cj4+PiB8Cj4+PiB8ICAgICAgICAgY3B1MTogUmF0aW8g
b2YgYnl0ZSBhY2Nlc3MgdGltZSB0byB1bmFsaWduZWQgd29yZCBhY2Nlc3MgaXMKPj4+IHwgMC4w
MSwgdW5hbGlnbmVkIGFjY2Vzc2VzIGFyZSBzbG93Cj4+PiB8ICAgICAgICAgY3B1MDogUmF0aW8g
b2YgYnl0ZSBhY2Nlc3MgdGltZSB0byB1bmFsaWduZWQgd29yZCBhY2Nlc3MgaXMKPj4+IHwgMC4w
MiwgdW5hbGlnbmVkIGFjY2Vzc2VzIGFyZSBzbG93Cj4+PiB8Cj4+PiB8ICAgICB2ZXhyaXNjdi9v
cmFuZ2VjcmFiOgo+Pj4gfAo+Pj4gfCAgICAgICAgIGNwdTA6IFJhdGlvIG9mIGJ5dGUgYWNjZXNz
IHRpbWUgdG8gdW5hbGlnbmVkIHdvcmQgYWNjZXNzIGlzCj4+PiB8IDAuMDAsIHVuYWxpZ25lZCBh
Y2Nlc3NlcyBhcmUgc2xvdwo+Pj4gIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9DQU11SE1k
VnRYR2pQOFZGTWl2LTdPTUZ6MVh2ZlUxY3o9Rnc0akwzZmNwNHdPMWV0elFAbWFpbC5nbWFpbC5j
b20vCj4+Cj4+IElmIHRoZSBhY2Nlc3NlcyBhcmUgaG9ycmlmaWNhbGx5IHNsb3cgdGhlbiBtYXli
ZSB0aGV5IHNob3VsZCBiZSBmbGFnZ2VkCj4+IGFzIGVtdWxhdGVkIHJhdGhlciB0aGFuIHNsb3cg
YnkgdGhlIHByb2JlLgo+IAo+IFllYWgsIEkgdGhvdWdodCBhYm91dCB0aGF0IHRvby4gSSBkaWRu
J3QgZmVlbCBsaWtlIEkgaGFkIGVub3VnaCBpbmZvCj4gdG8gY29tZSB1cCB3aXRoIHRoZSBkZWxp
bmVhdGluZyBudW1iZXIgZm9yICJob3JyaWZpY2FsbHkgc2xvdyIuIFBsdXMKPiBDbGVtZW50IGNh
bWUgaW4gd2l0aCBhIHNlcmllcyB0byBkZXRlY3Qgc3BlY2lmaWNhbGx5IHRoYXQgYWNjZXNzZXMg
YXJlCj4gZW11bGF0ZWQgKHRob3VnaCBpdCB3aWxsIG9ubHkgd29yayBvbiBmdXR1cmUgcGxhdGZv
cm1zIHRoYXQgY2FuCj4gZGVsZWdhdGUgdGhlIHRyYXAgdG8gdGhlIGtlcm5lbCkuCgpZZXMsIHRo
ZSBkZWxlZ2F0aW9uIHJlcXVlc3QgbWVjaGFuaXNtIHNob3VsZCBiZSBwYXJ0IG9mIFNCSSAzLjAu
IEF0IHRoYXQKcG9pbnQgd2Ugc2hvdWxkIGJlIGFibGUgdG8gZGV0ZWN0IHByb3Blcmx5IGlmIGFj
Y2Vzc2VzIGFyZSBlbXVsYXRlZCBvcgpzbG93IChwcm92aWRpbmcgdGhlIFNCSSBpbXBsZW1lbnRz
IHRoZSBuZXcgZXh0ZW5zaW9uKS4KCkNsw6ltZW50Cgo+IAo+IC1FdmFuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
