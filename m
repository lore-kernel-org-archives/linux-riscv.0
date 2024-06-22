Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F35AFC27C4F
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Jun 2024 02:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=44J73GFcMuYisO32eP4CG2TckG/v5Ao1As/O0CRnV+o=; b=WmtHtXg3fTHiK/
	872Qeab5BE2mbzLIz2NWCPfiECpJzRTJvgbtvKsx75ETaQSMpxm69BGH+nQWPNGT/OOogOK6rPhwS
	jDibO6s8QnLWH4fmvJ2lvOedS2kCxqFmc9XixiybGnunOD/VfLzYK/TyQKv2xjyT7a4J0MpTykEs2
	dRzFLWLshvRMfSvJf1sjLl50wPalCd4cWAfFR64poHjLYIvqVeeR3c0MU+W+y0bsXdhqj98YmMHKs
	qGQ3VS3tvQTCfmXZweWTFpbe5nAKZvfU7PzB5UjraM0lV8X5F0T9ctYgPxA0KqmKxCbbwElkHIXJe
	RwyFse4S/QaSsC6FM/Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKqjb-0000000BDcB-1o5I;
	Sat, 22 Jun 2024 02:44:11 +0000
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKqjY-0000000BDaU-3x9K
	for linux-riscv@lists.infradead.org;
	Sat, 22 Jun 2024 02:44:10 +0000
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-24c9f91242dso1302599fac.2
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jun 2024 19:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1719024247; x=1719629047; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ui4xFT5stec6JvODOrN2KjF93fbyz0ONTz3dpTKa1FY=;
        b=XtwcugH3Vw/45vsAl+UZDyJG6eJWSn5cukOYyppdG6mee1N7hZhLv2Ymww66y+vVo3
         hLvP+/NQZmmJSzUygLkWlb+nlgEOBNeCPdcejfuyWYP2+0qwf5v1igucjACCA2CvguZa
         JDdfryNQ+ZluQ0nesudHrAS0+LYjA33jk6m4rg9Z4/nv+ecy/PsFJIxbzlFRhQxZwLE5
         BvGwPvExgnBSSCtzcDlShOZhUEoMQjwL9TF23B0d69vuDFRnIn2cO7GD3jaEH92UgLLQ
         o1WdZLG7o/RVy0AOiJL8XIAYXu57DHWOOEaW28RZpokyFxoHSsQ4hfIvNqviylGv5OXa
         D+bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719024247; x=1719629047;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ui4xFT5stec6JvODOrN2KjF93fbyz0ONTz3dpTKa1FY=;
        b=UM02+DC51+SBXmha0bphZLck4kSEsqwy03mEw/lm3PvTFP+pHAzkIwz+3sA7FMqudm
         AukkoC/XCpjUIb0wUW+RXO/jZ207PJZpu/2QPTJw4ZWVZKfZmmdod5bbNkS41qbG+zZ7
         9Cn0boNRTbNNCSGSQIDoS6WZt8r30rU+pTDD8JyYoLF6uCHuxBOu7ZHcsqjxLSi3L6Fs
         G++pEk44fpAbEpFMX0vWkFzF7e2te3qbg8d0JR+5jZr4ZSzh/4KgluFfKBYVL6pUtXES
         5JSq+Lz9KL3IwWhF1kh382eKacr4NCoQ9oUWNFCXxc89qPyKZ/mrO+mgyjW/UKgIUBwT
         zCtw==
X-Forwarded-Encrypted: i=1; AJvYcCXtPuFfzFLJVtXJa4CPv13lYZiKtAW0JpxSh/yw/Jnj2+81fqMQu4/KL5mloYG+TfuboK82vfE0KateJBajgA/K5NEPy5t9KlS1KKnLJymf
X-Gm-Message-State: AOJu0YySo29vL7cDC8KmNbVOyc/wKzBvh3Ik7qqtnfXVji6BJvViBGSB
	HrF33JnKWIwZIYQUvyu7/O8C06JBQ6SdZ/8dLIHoDHmL1nucFXDCvZvVj6IsjMVzZbbGa/flbm1
	NFuOogAiGklMNg+eIQ5OWm9tBfa+RPVZ1MzAOtg==
X-Google-Smtp-Source: AGHT+IE7bJWYgfKqVWNpGz8Qa1UsuPm+jomiTuPUFmc3fa0G/eoy5t03b7JjTOZso8c35GopoR8gHJNl0Z51H0bvZYU=
X-Received: by 2002:a05:6870:808d:b0:250:8913:7400 with SMTP id
 586e51a60fabf-25c94d5c0b3mr10095865fac.40.1719024247214; Fri, 21 Jun 2024
 19:44:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240621113143.35827-1-cuiyunhui@bytedance.com> <94e8a430-7a2c-49a7-b1d3-74e7e924c2a3@rivosinc.com>
In-Reply-To: <94e8a430-7a2c-49a7-b1d3-74e7e924c2a3@rivosinc.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Sat, 22 Jun 2024 10:43:56 +0800
Message-ID: <CAEEQ3w=apjwEbH6i_s_mhPre0rBoGu7BBgkfaT_5pbCE1dt+vw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v2] RISC-V: Provide the frequency of time
 CSR via hwprobe
To: Jesse Taube <jesse@rivosinc.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, corbet@lwn.net, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, cleger@rivosinc.com, 
	evan@rivosinc.com, conor.dooley@microchip.com, costa.shul@redhat.com, 
	andy.chiu@sifive.com, samitolvanen@google.com, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_194409_016078_05A102B9 
X-CRM114-Status: GOOD (  20.48  )
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

SGkgSmVzc2UsCgoKT24gU2F0LCBKdW4gMjIsIDIwMjQgYXQgNToyNeKAr0FNIEplc3NlIFRhdWJl
IDxqZXNzZUByaXZvc2luYy5jb20+IHdyb3RlOgo+Cj4KPgo+IE9uIDYvMjEvMjQgMDc6MzEsIFl1
bmh1aSBDdWkgd3JvdGU6Cj4gPiBGcm9tOiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5j
LmNvbT4KPiA+Cj4gPiBBIGhhbmRmdWwgb2YgdXNlci12aXNpYmxlIGJlaGF2aW9yIGlzIGJhc2Vk
IG9uIHRoZSBmcmVxdWVuY3kgb2YgdGhlCj4gPiB0aW1lIENTUi4KPiA+Cj4gPiBTaWduZWQtb2Zm
LWJ5OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4KPiA+IFNpZ25lZC1vZmYt
Ynk6IFl1bmh1aSBDdWkgPGN1aXl1bmh1aUBieXRlZGFuY2UuY29tPgo+ID4gLS0tCj4gPiAgIERv
Y3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdCAgfCAyICsrCj4gPiAgIGFyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vaHdwcm9iZS5oICAgICAgfCAyICstCj4gPiAgIGFyY2gvcmlzY3YvaW5j
bHVkZS91YXBpL2FzbS9od3Byb2JlLmggfCAxICsKPiA+ICAgYXJjaC9yaXNjdi9rZXJuZWwvc3lz
X2h3cHJvYmUuYyAgICAgICB8IDUgKysrKysKPiA+ICAgNCBmaWxlcyBjaGFuZ2VkLCA5IGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0IGIvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJv
YmUucnN0Cj4gPiBpbmRleCBmYzAxNWI0NTJlYmYuLmMwN2YxNTlkODkwNiAxMDA2NDQKPiA+IC0t
LSBhL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdAo+ID4gKysrIGIvRG9jdW1l
bnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0Cj4gPiBAQCAtMjI5LDMgKzIyOSw1IEBAIFRo
ZSBmb2xsb3dpbmcga2V5cyBhcmUgZGVmaW5lZDoKPiA+Cj4gPiAgICogOmM6bWFjcm86YFJJU0NW
X0hXUFJPQkVfS0VZX1pJQ0JPWl9CTE9DS19TSVpFYDogQW4gdW5zaWduZWQgaW50IHdoaWNoCj4g
PiAgICAgcmVwcmVzZW50cyB0aGUgc2l6ZSBvZiB0aGUgWmljYm96IGJsb2NrIGluIGJ5dGVzLgo+
ID4gKwo+ID4gKyogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfS0VZX1RJTUVfQ1NSX0ZSRVFgOiBG
cmVxdWVuY3kgKGluIEh6KSBvZiBgbXRpbWVgLgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vaHdwcm9iZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od3Byb2JlLmgK
PiA+IGluZGV4IDYzMDUwN2RmZjVlYS4uMTUwYTk4NzdiMGFmIDEwMDY0NAo+ID4gLS0tIGEvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9od3Byb2JlLmgKPiA+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vaHdwcm9iZS5oCj4gPiBAQCAtOCw3ICs4LDcgQEAKPiA+Cj4gPiAgICNpbmNsdWRlIDx1
YXBpL2FzbS9od3Byb2JlLmg+Cj4gPgo+ID4gLSNkZWZpbmUgUklTQ1ZfSFdQUk9CRV9NQVhfS0VZ
IDYKPiA+ICsjZGVmaW5lIFJJU0NWX0hXUFJPQkVfTUFYX0tFWSA3Cj4KPiBQbGVhc2UgcmViYXNl
IG9udG8gcGFsbWVycyBicmFuY2ggYXMgTUFYX0tFWSBpcyBhbHJlYWR5IDcuCj4KPiBodHRwczov
L2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9wYWxtZXIvbGludXguZ2l0
L2xvZy8/aD1mb3ItbmV4dApPa2F5LCBJIHdpbGwgdXBkYXRlIGl0IG9uIHYzLCB0aGFua3MuCgo+
Cj4gVGhhbmtzLAo+IEplc3NlIFRhdWJlCj4KPiA+Cj4gPiAgIHN0YXRpYyBpbmxpbmUgYm9vbCBy
aXNjdl9od3Byb2JlX2tleV9pc192YWxpZChfX3M2NCBrZXkpCj4gPiAgIHsKPiA+IGRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oIGIvYXJjaC9yaXNjdi9p
bmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaAo+ID4gaW5kZXggN2I5NWZhZGJlYTJhLi4xODc1NDM0
MWZmMTQgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9i
ZS5oCj4gPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oCj4gPiBA
QCAtNzMsNiArNzMsNyBAQCBzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSB7Cj4gPiAgICNkZWZpbmUgICAg
ICAgICAgICAgUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX1VOU1VQUE9SVEVEICAgICg0IDw8IDAp
Cj4gPiAgICNkZWZpbmUgICAgICAgICAgICAgUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX01BU0sg
ICAgICAgICAgICg3IDw8IDApCj4gPiAgICNkZWZpbmUgUklTQ1ZfSFdQUk9CRV9LRVlfWklDQk9a
X0JMT0NLX1NJWkUgNgo+ID4gKyNkZWZpbmUgUklTQ1ZfSFdQUk9CRV9LRVlfVElNRV9DU1JfRlJF
USAgICAgIDcKPiA+ICAgLyogSW5jcmVhc2UgUklTQ1ZfSFdQUk9CRV9NQVhfS0VZIHdoZW4gYWRk
aW5nIGl0ZW1zLiAqLwo+ID4KPiA+ICAgLyogRmxhZ3MgKi8KPiA+IGRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJv
YmUuYwo+ID4gaW5kZXggODNmY2M5MzlkZjY3Li5mYzNiNDBmYjlkZWYgMTAwNjQ0Cj4gPiAtLS0g
YS9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jCj4gPiArKysgYi9hcmNoL3Jpc2N2L2tl
cm5lbC9zeXNfaHdwcm9iZS5jCj4gPiBAQCAtOCw2ICs4LDcgQEAKPiA+ICAgI2luY2x1ZGUgPGFz
bS9jYWNoZWZsdXNoLmg+Cj4gPiAgICNpbmNsdWRlIDxhc20vY3B1ZmVhdHVyZS5oPgo+ID4gICAj
aW5jbHVkZSA8YXNtL2h3cHJvYmUuaD4KPiA+ICsjaW5jbHVkZSA8YXNtL2RlbGF5Lmg+Cj4gPiAg
ICNpbmNsdWRlIDxhc20vc2JpLmg+Cj4gPiAgICNpbmNsdWRlIDxhc20vc3dpdGNoX3RvLmg+Cj4g
PiAgICNpbmNsdWRlIDxhc20vdWFjY2Vzcy5oPgo+ID4gQEAgLTIyNiw2ICsyMjcsMTAgQEAgc3Rh
dGljIHZvaWQgaHdwcm9iZV9vbmVfcGFpcihzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSAqcGFpciwKPiA+
ICAgICAgICAgICAgICAgICAgICAgICBwYWlyLT52YWx1ZSA9IHJpc2N2X2Nib3pfYmxvY2tfc2l6
ZTsKPiA+ICAgICAgICAgICAgICAgYnJlYWs7Cj4gPgo+ID4gKyAgICAgY2FzZSBSSVNDVl9IV1BS
T0JFX0tFWV9USU1FX0NTUl9GUkVROgo+ID4gKyAgICAgICAgICAgICBwYWlyLT52YWx1ZSA9IHJp
c2N2X3RpbWViYXNlOwo+ID4gKyAgICAgICAgICAgICBicmVhazsKPiA+ICsKPiA+ICAgICAgIC8q
Cj4gPiAgICAgICAgKiBGb3IgZm9yd2FyZCBjb21wYXRpYmlsaXR5LCB1bmtub3duIGtleXMgZG9u
J3QgZmFpbCB0aGUgd2hvbGUKPiA+ICAgICAgICAqIGNhbGwsIGJ1dCBnZXQgdGhlaXIgZWxlbWVu
dCBrZXkgc2V0IHRvIC0xIGFuZCB2YWx1ZSBzZXQgdG8gMAoKVGhhbmtzLApZdW5odWkKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
