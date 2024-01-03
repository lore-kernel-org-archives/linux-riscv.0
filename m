Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8DB7C3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 19:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Jz6BAscHfgldxyUjz8mOR4XXpNbA8dDKAnOopPyIGs=; b=vLd9hjhkPLWdiu
	Js/ex2AbXk5/tnbs2NNWnkxQ5OBWEtMdHAzS/F64XU73GAxhSUrxr+DHhHiktDL+tq+n1I/FwHAG8
	zJSkWEWZljRnizHEQUV7wgzgzDoxvZuu4ZT9jaM1VAhqDWGl6N39lpEgBmIASwTZFWnrRB1Rn4jNP
	cF2u851sBTpwxcE8NmRZdCyd16u1beJzCm9DVwoIudRiuNM30R/CsMABi8eboAH/U8ZYrrqJnPTjK
	tk8F5Hw1S6SX28swfJkBmaQ+eJfZntiRy5iyB8Y95S2ucpszx2/bB5Gc7LDdPjMm5WtEDQHvDKsao
	u2AqGg3K+y0MJNqzn3Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL7ME-00ByRL-34;
	Wed, 03 Jan 2024 19:56:54 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL7MC-00ByQN-0Y
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jan 2024 19:56:53 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-40d60ad5f0bso69342785e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jan 2024 11:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1704311808; x=1704916608; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yQpfnnWEnHClKL5VeX0EuSbQ/gShXCqkBTi6s+0qxQc=;
        b=lim+HC8ToYHpZBQxeQLmOMpYRBz8sZvpDMyNGhI9Q1Gkjf9pP8koZfXEfBIi5aqBJV
         rMtDOTanmbfa+9uG3XjSqaje0Oxsat54KapXS80VgD6EfEz4kqrJk/aybLvbMtjQ4u+a
         Fkchetvh504ybylV2nwpBILjOHVYDac2pXwW8GrgIQ44l8oB1YroSst7/w8HrXGEXib4
         aQc5j/ln01RgMsii3gKvsRj0YH49cLxkJrWsmm/MERffe6JSR3PLFlujJfzUHE2qw7Bf
         qsa1Jv5Tt5qFCmXFx10rRcurswNY+OnjuD85mw5EPMYME5WOvl1KQKkreFakLVwuoWT7
         pLbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704311808; x=1704916608;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yQpfnnWEnHClKL5VeX0EuSbQ/gShXCqkBTi6s+0qxQc=;
        b=BHoMB7CE1uEvN+l85E8VnxFe7u5zXfmeW5tL22Y3KhRSIPaD/bdrFxHfTKbckynE5I
         0W6ztMVN7P8j6jyWxqrH5HrSjnM+1b2b+mNftaKWiLw5RocpPvwkRknQKBfiFTz7x8/x
         0WSIu2/xZFdITJU3T4laJaNPmQPv7VymZNn+nQvSFmleMSTOdKqIZNPv2zLeV6Ggnxa0
         lqZ5LaLo/g/7ApgaeSidDmHj4aMUXpN7M1abB3eDi5QPcfLNDYiEcz7dCtDJLBnyskzK
         KGChk8l4SOYPJw/MgTjdoiqVPzwzQR1wGrzNpTs59NH4EabrQ+XcjLQaPc4PlLl1ailE
         7RrA==
X-Gm-Message-State: AOJu0YxjIWsN6uI5iaCuPN/ZFzBxe0wDQTfF3NopeICIVPkMTpRrAvcO
	YTA0Iy/guIvd/RYzzUTvbq7OgE2H2GJEzQ==
X-Google-Smtp-Source: AGHT+IHl1CgXWvun0bw1CzClW51Zc4dr0dFkATBjeaM+4RA7PNRbWnHLE7I/Z1940e5jZa5sGKcmUQ==
X-Received: by 2002:a05:600c:4ed0:b0:40d:87be:d6d4 with SMTP id g16-20020a05600c4ed000b0040d87bed6d4mr3150765wmq.68.1704311808267;
        Wed, 03 Jan 2024 11:56:48 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id w18-20020adff9d2000000b003375083ff8esm564320wrr.32.2024.01.03.11.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 11:56:47 -0800 (PST)
Date: Wed, 3 Jan 2024 20:56:47 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Guo Ren <guoren@kernel.org>
Subject: Re: Re: [PATCH V2 2/3] riscv: Add ARCH_HAS_PRETCHW support with Zibop
Message-ID: <20240103-d6e1246e0f45f602a32c5469@orel>
References: <20231231082955.16516-1-guoren@kernel.org>
 <20231231082955.16516-3-guoren@kernel.org>
 <20240102-7e62facbd8322db4dee4b0dd@orel>
 <CAJF2gTRv4UgSHMTp_tOhNGV2mQXBt1dPj6RdB2XXBGfT6iCWSw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTRv4UgSHMTp_tOhNGV2mQXBt1dPj6RdB2XXBGfT6iCWSw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_115652_209543_B0552F70 
X-CRM114-Status: GOOD (  25.61  )
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
Cc: wefu@redhat.com, keescook@chromium.org, peterz@infradead.org, unicorn_wang@outlook.com, atishp@atishpatra.org, chao.wei@sophgo.com, bjorn@rivosinc.com, linux-kernel@vger.kernel.org, xiaoguang.xing@sophgo.com, conor.dooley@microchip.com, leobras@redhat.com, palmer@dabbelt.com, jszhang@kernel.org, paul.walmsley@sifive.com, Guo Ren <guoren@linux.alibaba.com>, panqinglin2020@iscas.ac.cn, linux-riscv@lists.infradead.org, wuwei2016@iscas.ac.cn
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBKYW4gMDMsIDIwMjQgYXQgMDI6MTk6NDlQTSArMDgwMCwgR3VvIFJlbiB3cm90ZToK
PiBPbiBUdWUsIEphbiAyLCAyMDI0IGF0IDY6NDXigK9QTSBBbmRyZXcgSm9uZXMgPGFqb25lc0B2
ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+Cj4gPgo+ID4gcy9aaWJvcC9aaWNib3AvIDw8PCRT
VUJKRUNUCj4gb2theQo+IAo+ID4KPiA+IE9uIFN1biwgRGVjIDMxLCAyMDIzIGF0IDAzOjI5OjUy
QU0gLTA1MDAsIGd1b3JlbkBrZXJuZWwub3JnIHdyb3RlOgo+ID4gPiBGcm9tOiBHdW8gUmVuIDxn
dW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4gPiA+Cj4gPiA+IEVuYWJsZSBMaW51eCBwcmVmZXRj
aHcgcHJpbWl0aXZlIHdpdGggWmlib3AgY3B1ZmVhdHVyZSwgd2hpY2ggcHJlbG9hZHMKPiA+Cj4g
PiBBbHNvIHMvWmlib3AvWmljYm9wLyBoZXJlCj4gb2theSwgdGh4Lgo+IAo+ID4KPiA+ID4gY2Fj
aGUgbGluZSBpbnRvIEwxIGNhY2hlIGZvciB0aGUgbmV4dCB3cml0ZSBvcGVyYXRpb24uCj4gPiA+
Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEd1byBSZW4gPGd1b3JlbkBsaW51eC5hbGliYWJhLmNvbT4K
PiA+ID4gU2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4gPiA+IC0t
LQo+ID4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaCB8IDE2ICsrKysrKysr
KysrKysrKysKPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspCj4gPiA+Cj4g
PiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oIGIvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaAo+ID4gPiBpbmRleCBmMTlmODYxY2RhNTQu
LjhkM2EyYWIzNzY3OCAxMDA2NDQKPiA+ID4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9w
cm9jZXNzb3IuaAo+ID4gPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5o
Cj4gPiA+IEBAIC0xMyw2ICsxMyw5IEBACj4gPiA+ICAjaW5jbHVkZSA8dmRzby9wcm9jZXNzb3Iu
aD4KPiA+ID4KPiA+ID4gICNpbmNsdWRlIDxhc20vcHRyYWNlLmg+Cj4gPiA+ICsjaW5jbHVkZSA8
YXNtL2luc24tZGVmLmg+Cj4gPiA+ICsjaW5jbHVkZSA8YXNtL2FsdGVybmF0aXZlLW1hY3Jvcy5o
Pgo+ID4gPiArI2luY2x1ZGUgPGFzbS9od2NhcC5oPgo+ID4gPgo+ID4gPiAgI2lmZGVmIENPTkZJ
R182NEJJVAo+ID4gPiAgI2RlZmluZSBERUZBVUxUX01BUF9XSU5ET1cgICAoVUwoMSkgPDwgKE1N
QVBfVkFfQklUUyAtIDEpKQo+ID4gPiBAQCAtMTA2LDYgKzEwOSwxOSBAQCBzdGF0aWMgaW5saW5l
IHZvaWQgYXJjaF90aHJlYWRfc3RydWN0X3doaXRlbGlzdCh1bnNpZ25lZCBsb25nICpvZmZzZXQs
Cj4gPiA+ICAjZGVmaW5lIEtTVEtfRUlQKHRzaykgICAgICAgICAgICAgICAgKHRhc2tfcHRfcmVn
cyh0c2spLT5lcGMpCj4gPiA+ICAjZGVmaW5lIEtTVEtfRVNQKHRzaykgICAgICAgICAgICAgICAg
KHRhc2tfcHRfcmVncyh0c2spLT5zcCkKPiA+ID4KPiA+ID4gKyNpZmRlZiBDT05GSUdfUklTQ1Zf
SVNBX1pJQ0JPUAo+ID4gPiArI2RlZmluZSBBUkNIX0hBU19QUkVGRVRDSFcKPiA+ID4gKwo+ID4g
PiArI2RlZmluZSBQUkVGRVRDSFdfQVNNKHgpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgXAo+ID4gPiArICAgICBBTFRFUk5BVElWRShfX25vcHMoMSksIENCT19Q
UkVGRVRDSF9XKHgsIDApLCAwLCAgICAgICAgICAgICAgICAgXAo+ID4gPiArICAgICAgICAgICAg
ICAgICBSSVNDVl9JU0FfRVhUX1pJQ0JPUCwgQ09ORklHX1JJU0NWX0lTQV9aSUNCT1ApCj4gPiA+
ICsKPiA+ID4gKwo+ID4gPiArc3RhdGljIGlubGluZSB2b2lkIHByZWZldGNodyhjb25zdCB2b2lk
ICp4KQo+ID4gPiArewo+ID4gPiArICAgICBfX2FzbV9fIF9fdm9sYXRpbGVfXyhQUkVGRVRDSFdf
QVNNKCUwKSA6IDogInIiICh4KSA6ICJtZW1vcnkiKTsKPiA+ID4gK30KPiA+Cj4gPiBTaG91bGRu
J3Qgd2UgY3JlYXRlIGFuIGludGVyZmFjZSB3aGljaCBleHBvc2VzIHRoZSBvZmZzZXQgaW5wdXQg
b2YKPiA+IHRoZSBpbnN0cnVjdGlvbiwgYWxsb3dpbmcgYSBzZXF1ZW5jZSBvZiBjYWxscyB0byBi
ZSB1bnJvbGxlZD8gQnV0Cj4gPiBJIGd1ZXNzIHRoYXQgY291bGQgYmUgcHV0IG9mZiB1bnRpbCB0
aGVyZSdzIGEgbmVlZCBmb3IgaXQuCj4gSSB3YW50IHRvIHB1dCBpdCBvZmYgdW50aWwgdGhlcmUn
cyBhIHVzZXIuIExldCdzIGtlZXAgdGhlIHdob2xlCj4gaW1tWzExOjBdIHplcm8gZm9yIHRoZSBj
dXJyZW50LgoKWWVhaCwgbXkgc3VnZ2VzdGlvbiBkaWRuJ3QgbWFrZSBzZW5zZSBpbiB0aGlzIGNv
bnRleHQgYW55d2F5IHNpbmNlIHdlIG5lZWQKdG8gbWF0Y2ggdGhlIGludGVyZmFjZSBpbiBsaW51
eC9wcmVmZXRjaC5oLiBDb25zaWRlcmluZyBsaW51eC9wcmVmZXRjaC5oLAppcyB0aGVyZSBzb21l
IHJlYXNvbiB3ZSBkb24ndCBhbHNvIGFkZCBwcmVmZXRjaCgpIGF0IHRoZSBzYW1lIHRpbWU/CgpU
aGFua3MsCmRyZXcKCj4gCj4gPgo+ID4gPiArI2VuZGlmIC8qIENPTkZJR19SSVNDVl9JU0FfWklD
Qk9QICovCj4gPiA+Cj4gPiA+ICAvKiBEbyBuZWNlc3Nhcnkgc2V0dXAgdG8gc3RhcnQgdXAgYSBu
ZXdseSBleGVjdXRlZCB0aHJlYWQuICovCj4gPiA+ICBleHRlcm4gdm9pZCBzdGFydF90aHJlYWQo
c3RydWN0IHB0X3JlZ3MgKnJlZ3MsCj4gPiA+IC0tCj4gPiA+IDIuNDAuMQo+ID4gPgo+ID4KPiA+
IFRoYW5rcywKPiA+IGRyZXcKPiAKPiAKPiAKPiAtLSAKPiBCZXN0IFJlZ2FyZHMKPiAgR3VvIFJl
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
