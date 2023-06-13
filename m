Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43626C7EE2E
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jun 2023 13:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wCK7/CkJkAZuVcvDwTpI8BzbsTmfxZLEsDLRTRDtPZs=; b=tV+TeoJrn0b4B7
	o3kXRO+fvSuwbEjEqb3scTAhwpY764311jb85PyEMreEG+xrIDODVvvHRZ6Tdnzs1UTds93OnhYlF
	NzuVtn+cFO1mstYixEVZ6Nc1bddpCgxW18FNHz8ohFAkmJtocWTGisp9P62v6OG3Vn7t0yGe+TfSw
	QgJsQO7TFhZAQMTiHYzU6TIyO1GPGCeIjINVdZYPE4957K9UERxgdswZQezjfzrhAgruRXKhIdodO
	vjqax/RNExmO+jc2ZPJ8aFCTc4JHq9CGy7HsQ2uk2lpknDqZWuUGh6RyNg7Vpog2GNh2swtuLy+j8
	zcgOK/Bq8Zg6VCHcUSxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q93eB-0087Yo-05;
	Tue, 13 Jun 2023 13:01:19 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q93e7-0087Vc-35
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jun 2023 13:01:18 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3f3284dff6cso7561555e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 13 Jun 2023 06:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1686661269; x=1689253269;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MOXAw3N0QLUmhl9VhAasY8VpoF1ITbQ/C2xV1UG3SvY=;
        b=SCzheP188hDhSW3yx/yBltis0n46wXq6+HYX4XK5bSFxYqaiy0CTYRu48aCV9U6yhP
         892Su+mJ27pIwHfwG1dLkluD9LhNwNUQmZzETRnDOiLFxZrKKjqWG8caRWtyHWURvRum
         Y71YuejOUK1oT4F7H7IQsC9MlMZ4QY02q5UjVg2yWEF+xP9UNqsillUJXtyqr4wRG+cc
         XqMCTMF/HsKC5QTE/Qh4yfxITY9MwlIABxJROHykiSAqDz98Qbjmxk0qlG4St4YVs2HN
         k2GodccQxTLjI7qOIiQlffNOzA0E/r7gRoW/p3ga7O0a/roXhPZQodCYygBZlYAgd6tv
         Z+AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686661269; x=1689253269;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MOXAw3N0QLUmhl9VhAasY8VpoF1ITbQ/C2xV1UG3SvY=;
        b=JDbEYId4+i6IQbYk6NkK6TkyR1hCfDsH4C9tXouhTJw3mL0pS4vPzBMxqdxWK+MxPT
         VwcImQSHR/NWyC5/QCY1q6+v5Z1Dq3ELhqy2Qr7kDwXlyUU1Bbo7zfmP7SupewDDpJGg
         +TaRvfxL4mzbPBZNibd8eEBBOCAUN9D/EE5v49xdpBHsyoJcPxi/YXok/kP0mGFziEfu
         bww9L3qhpjL2+WcDBTZpiax94jXGilUpw9icsfwwe8ATRH1y16nag755Im7Mcm7LkAyf
         xthJxc/8gnnGWWxrHXqhjemc5s4WbRtybecG+EoT5uCAR7AwcEiutRR17rb+OOmU2VEq
         gClg==
X-Gm-Message-State: AC+VfDzyuUoaPodTtTpMy1T6FBJHHnh0xpFQML/xY9fAbHMI33Yf1Tit
	EgQ/ee3mQdh4OBRsery0BvUxYA==
X-Google-Smtp-Source: ACHHUZ7souI+dx9fRazMepY3th0ShmUbMRKdVHs47vqo/IJMam4Wbe9ZTuR8tN0WeZs8tAGFUV1zMg==
X-Received: by 2002:a05:600c:3501:b0:3f5:927:2b35 with SMTP id h1-20020a05600c350100b003f509272b35mr9996222wmq.1.1686661268841;
        Tue, 13 Jun 2023 06:01:08 -0700 (PDT)
Received: from ?IPV6:2a01:cb15:81c2:f100:cd4e:ad51:613b:f447? ([2a01:cb15:81c2:f100:cd4e:ad51:613b:f447])
        by smtp.gmail.com with ESMTPSA id z10-20020a05600c114a00b003f7e60622f0sm14406350wmz.6.2023.06.13.06.01.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 06:01:08 -0700 (PDT)
Message-ID: <f686f36b-4c09-5099-3ba4-90f87f914654@rivosinc.com>
Date: Tue, 13 Jun 2023 15:01:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH -next V12 1/3] riscv: stack: Support
 HAVE_IRQ_EXIT_ON_IRQ_STACK
To: guoren@kernel.org, arnd@arndb.de, palmer@rivosinc.com,
 conor.dooley@microchip.com, heiko@sntech.de, jszhang@kernel.org,
 bjorn@kernel.org, greentime.hu@sifive.com, vincent.chen@sifive.com,
 andy.chiu@sifive.com, paul.walmsley@sifive.com
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>
References: <20230529084600.2878130-1-guoren@kernel.org>
 <20230529084600.2878130-2-guoren@kernel.org>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20230529084600.2878130-2-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230613_060115_990724_2D246D8E 
X-CRM114-Status: GOOD (  19.85  )
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

CgpPbiAyOS8wNS8yMDIzIDEwOjQ1LCBndW9yZW5Aa2VybmVsLm9yZyB3cm90ZToKPiBGcm9tOiBH
dW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4gCj4gQWRkIGluZGVwZW5kZW50IGly
cSBzdGFja3MgZm9yIHBlcmNwdSB0byBwcmV2ZW50IGtlcm5lbCBzdGFjayBvdmVyZmxvd3MuCj4g
SXQgaXMgYWxzbyBjb21wYXRpYmxlIHdpdGggVk1BUF9TVEFDSyBieSBhcmNoX2FsbG9jX3ZtYXBf
c3RhY2suCj4gCj4gVGVzdGVkLWJ5OiBKaXNoZW5nIFpoYW5nIDxqc3poYW5nQGtlcm5lbC5vcmc+
Cj4gU2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+IFNp
Z25lZC1vZmYtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgo+IENjOiBDb25vciBEb29s
ZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+IC0tLQo+ICAgYXJjaC9yaXNjdi9LY29u
ZmlnICAgICAgICAgICAgICAgICAgIHwgIDcgKysrKysrCj4gICBhcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2lycV9zdGFjay5oICAgfCAzMiArKysrKysrKysrKysrKysrKysrKysrKysrCj4gICBhcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL3RocmVhZF9pbmZvLmggfCAgMiArKwo+ICAgYXJjaC9yaXNjdi9r
ZXJuZWwvaXJxLmMgICAgICAgICAgICAgIHwgMzMgKysrKysrKysrKysrKysrKysrKysrKysrKysK
PiAgIGFyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMgICAgICAgICAgICB8IDM1ICsrKysrKysrKysr
KysrKysrKysrKysrKysrLS0KPiAgIDUgZmlsZXMgY2hhbmdlZCwgMTA3IGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9pcnFfc3RhY2suaAo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcgYi9h
cmNoL3Jpc2N2L0tjb25maWcKPiBpbmRleCBmYTI1NmYyZTIzYzEuLjQ0YjRjOTY5MGY5NCAxMDA2
NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L0tjb25maWcKPiArKysgYi9hcmNoL3Jpc2N2L0tjb25maWcK
PiBAQCAtNTg4LDYgKzU4OCwxMyBAQCBjb25maWcgRlBVCj4gICAKPiAgIAkgIElmIHlvdSBkb24n
dCBrbm93IHdoYXQgdG8gZG8gaGVyZSwgc2F5IFkuCj4gICAKPiArY29uZmlnIElSUV9TVEFDS1MK
PiArCWJvb2wgIkluZGVwZW5kZW50IGlycSBzdGFja3MiIGlmIEVYUEVSVAo+ICsJZGVmYXVsdCB5
Cj4gKwlzZWxlY3QgSEFWRV9JUlFfRVhJVF9PTl9JUlFfU1RBQ0sKPiArCWhlbHAKPiArCSAgQWRk
IGluZGVwZW5kZW50IGlycSBzdGFja3MgZm9yIHBlcmNwdSB0byBwcmV2ZW50IGtlcm5lbCBzdGFj
ayBvdmVyZmxvd3MuCj4gKwo+ICAgZW5kbWVudSAjICJQbGF0Zm9ybSB0eXBlIgo+ICAgCj4gICBt
ZW51ICJLZXJuZWwgZmVhdHVyZXMiCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vaXJxX3N0YWNrLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2lycV9zdGFjay5oCj4gbmV3
IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLmIwZGNlZTlhM2ZhMgo+IC0t
LSAvZGV2L251bGwKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2lycV9zdGFjay5oCj4g
QEAgLTAsMCArMSwzMiBAQAo+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCAq
Lwo+ICsKPiArI2lmbmRlZiBfQVNNX1JJU0NWX0lSUV9TVEFDS19ICj4gKyNkZWZpbmUgX0FTTV9S
SVNDVl9JUlFfU1RBQ0tfSAo+ICsKPiArI2luY2x1ZGUgPGxpbnV4L2J1Zy5oPgo+ICsjaW5jbHVk
ZSA8bGludXgvZ2ZwLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9rY29uZmlnLmg+Cj4gKyNpbmNsdWRl
IDxsaW51eC92bWFsbG9jLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9wZ3RhYmxlLmg+Cj4gKyNpbmNs
dWRlIDxhc20vdGhyZWFkX2luZm8uaD4KPiArCj4gK0RFQ0xBUkVfUEVSX0NQVSh1bG9uZyAqLCBp
cnFfc3RhY2tfcHRyKTsKPiArCj4gKyNpZmRlZiBDT05GSUdfVk1BUF9TVEFDSwo+ICsvKgo+ICsg
KiBUbyBlbnN1cmUgdGhhdCBWTUFQJ2Qgc3RhY2sgb3ZlcmZsb3cgZGV0ZWN0aW9uIHdvcmtzIGNv
cnJlY3RseSwgYWxsIFZNQVAnZAo+ICsgKiBzdGFja3MgbmVlZCB0byBoYXZlIHRoZSBzYW1lIGFs
aWdubWVudC4KPiArICovCj4gK3N0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9uZyAqYXJjaF9hbGxv
Y192bWFwX3N0YWNrKHNpemVfdCBzdGFja19zaXplLCBpbnQgbm9kZSkKPiArewo+ICsJdm9pZCAq
cDsKPiArCj4gKwlCVUlMRF9CVUdfT04oIUlTX0VOQUJMRUQoQ09ORklHX1ZNQVBfU1RBQ0spKTsK
CkhpIEd1bywKClNpbmNlIHRoaXMgZnVuY3Rpb24gaXMgYWxyZWFkeSBndWFyZGVkIHdpdGggI2lm
ZGVmIENPTkZJR19WTUFQX1NUQUNLLCBJIApndWVzcyB0aGlzIEJVSUxEX0JVR19PTigpIGlzIHVu
bmVjZXNzYXJ5KS4KCkNsw6ltZW50CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
