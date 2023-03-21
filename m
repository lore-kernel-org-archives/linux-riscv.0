Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A68F4C74A5B
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Mar 2023 15:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oDDX3t1jkELqB2qHWSTmK4t+EhFqvBDjgkxg3JN8ABQ=; b=UMYYN5oIzg5CpH
	LgECX4IxBpnNr81eoOkUrvxj4vnZEpYem2TrHKt8Bb1TJwNozckz3NcNrQXcyRBLoHANnfg0gGe9z
	+3HGz2o4mZkHDILA907uwv5ldm1mDpI2SN0jb4etSdnuAl02B6txkOeZg0LAYr4jojKx14NsEnUUv
	eoU0eGSRyWJg5jRFFOnQ+onFdUVlGnpeFIRZeKlK1fEUB4nIKj6lsbvL8Sby2SLB713Z0J8kYIrSw
	6tf2ONi1PY1dLoYMKiDBkRWHbIcuTmprPXwqPSjr/2OVQrrIQbmN+szJWjUtX0jO39BJIc6lA9cPr
	vJIdtr1b9sEPphLEracw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pee1Z-00CwKQ-0q;
	Tue, 21 Mar 2023 15:35:45 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pee1V-00CwJC-22
	for linux-riscv@lists.infradead.org;
	Tue, 21 Mar 2023 15:35:43 +0000
Received: by mail-lf1-x135.google.com with SMTP id q16so8801850lfe.10
        for <linux-riscv@lists.infradead.org>; Tue, 21 Mar 2023 08:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1679412937;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gk8jr7BD8uYaCexras91/B4ZP6pQnOkni7RNbE9PM20=;
        b=U7i12C6xejQPRN5PVWzMmpv3+Mu+dcLGFipj5Ks0ekIWt1USoeQqFmJ8AbEe9aYkBS
         HF5nhnN+yIDzTMKCVy73NPstI2OBmbthm8u1xRC0oYyC03+j/zWFscfjDDZp6+KO0eHP
         YZUw5vMw1G5pYyVmmi4hm8J+6g8j0QmcCeWcuAU/qn7yY7kCiai5YeAIMyG4Z1w3S7d9
         W7gpGpO0dl/I+GwWptNv1JhcCmrqS9cCTqH1jkDbSFgLJL2G/W6dfqS4NUgwfgFTnvzh
         k/iTAk9hcAZIapyazy1YJ7bBU5LcoLjDt3uEe15ehpgK0OydV5B/sS96ot6ScSCEIqwQ
         hY6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679412937;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gk8jr7BD8uYaCexras91/B4ZP6pQnOkni7RNbE9PM20=;
        b=nBN7m8CT3KwEPhRzbO0kKnZky9F6cyRRcUZ2l9mXQbj3I1cw6iknlAgM+8hJRlS4Qh
         nGWVJdigXmc1b5XDjXdr6f/6NSkSRwB0Wa6DQj/S5d2W2oQsaYYKvDOPOvgHQX5YQKOR
         Nb7AVTFrX6+6zBNCGlQSHzGc3YhbAODVpvDSznsDgkJSAAuh2MSmSEF4cZg9V2XSZfvi
         z8/QaqM9L47qR7hucXOJDjVgz+kDKsxuBEoedSmt8ZW6vGeFKUndf6znbuk9bbOYnVZF
         3gYyMCZjuYcCU9TBU+XPyngmug8CUF6yKwnVljWkfeN1TJrWHNhN51H2zshAPzdFEis7
         TT2Q==
X-Gm-Message-State: AO0yUKWGb6wgXcz2CqATRkKgot1dnyxr5TLxtwRFTHP0mumeCFsFpwRr
	58MNuWLhbruj9eIMmMuvcHXUeEO+9wVizU/cMZ+4kw==
X-Google-Smtp-Source: AK7set/bcktsXNha36q7gWnQ7ixDJ+mIYGQCBZHspa50UfOaCUrg3gMf6TJwt+lK5HY5F32KPGoi93+d3VvsyHcJ8IE=
X-Received: by 2002:a05:6512:48e:b0:4e1:d025:789e with SMTP id
 v14-20020a056512048e00b004e1d025789emr958503lfq.13.1679412937672; Tue, 21 Mar
 2023 08:35:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230314183220.513101-1-evan@rivosinc.com> <20230314183220.513101-5-evan@rivosinc.com>
 <1846748.tdWV9SEqCh@diego>
In-Reply-To: <1846748.tdWV9SEqCh@diego>
From: Evan Green <evan@rivosinc.com>
Date: Tue, 21 Mar 2023 08:35:01 -0700
Message-ID: <CALs-Hssz-GJ7zY5pnSjbXHzyu-uy3+UYo54rWA8nAjYBaeNk1g@mail.gmail.com>
Subject: Re: [PATCH v4 4/6] RISC-V: hwprobe: Support probing of misaligned
 access performance
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_083541_887122_21E7208E 
X-CRM114-Status: GOOD (  33.48  )
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
Cc: slewis@rivosinc.com, linux-doc@vger.kernel.org, Andrew Bresticker <abrestic@rivosinc.com>, Atish Patra <atishp@rivosinc.com>, Palmer Dabbelt <palmer@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Celeste Liu <coelacanthus@outlook.com>, Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>, Tsukasa OI <research_trasio@irq.a4lg.com>, Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, vineetg@rivosinc.com, Philipp Tomsich <philipp.tomsich@vrull.eu>, Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <apatel@ventanamicro.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Sudeep Holla <sudeep.holla@arm.com>, Guo Ren <guoren@kernel.org>, Wei Fu <wefu@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBNYXIgMTcsIDIwMjMgYXQgMzowOOKAr0FNIEhlaWtvIFN0w7xibmVyIDxoZWlrb0Bz
bnRlY2guZGU+IHdyb3RlOgo+Cj4gSGkgRXZhbiwKPgo+IEFtIERpZW5zdGFnLCAxNC4gTcOkcnog
MjAyMywgMTk6MzI6MTggQ0VUIHNjaHJpZWIgRXZhbiBHcmVlbjoKPiA+IFRoaXMgYWxsb3dzIHVz
ZXJzcGFjZSB0byBzZWxlY3QgdmFyaW91cyByb3V0aW5lcyB0byB1c2UgYmFzZWQgb24gdGhlCj4g
PiBwZXJmb3JtYW5jZSBvZiBtaXNhbGlnbmVkIGFjY2VzcyBvbiB0aGUgdGFyZ2V0IGhhcmR3YXJl
Lgo+Cj4gSSByZWFsbHkgbGlrZSB0aGlzIGltcGxlbWVudGF0aW9uLgo+Cj4gQWxzbyBpbnRlcmVz
dGluZyB0aGF0IFQtSGVhZCBhY3R1YWxseSBoYXMgYSBmYXN0IHVuYWxpZ25lZCBhY2Nlc3MuCj4g
TWF5YmUgdGhhdCBzaG91bGQgYmUgcGFydCBvZiB0aGUgY29tbWl0IG1lc3NhZ2UgKGluY2x1ZGlu
ZyB3ZXJlCj4gdGhpcyBpbmZvcm1hdGlvbiBjb21lcyBmcm9tKQoKVGhhbmtzIEhlaWtvIChhbmQg
Q29ub3IpISBZZXAsIHlvdSBib3RoIG5vdGljZWQgdGhhdCwgSSdsbCBhZGQgYSBkZXNjcmlwdGlv
bi4KCj4KPgo+ID4gQ28tZGV2ZWxvcGVkLWJ5OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9z
aW5jLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3Np
bmMuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogRXZhbiBHcmVlbiA8ZXZhbkByaXZvc2luYy5jb20+
Cj4gPgo+ID4gLS0tCj4gPgo+ID4gQ2hhbmdlcyBpbiB2NDoKPiA+ICAtIEFkZCBuZXdsaW5lcyB0
byBDUFVQRVJGXzAgZG9jdW1lbnRhdGlvbiAoQ29ub3IpCj4gPiAgLSBBZGQgVU5TVVBQT1JURUQg
dmFsdWUgKENvbm9yKQo+ID4gIC0gU3dpdGNoZWQgZnJvbSBEVCB0byBhbHRlcm5hdGl2ZXMtYmFz
ZWQgcHJvYmluZyAoUm9iKQo+ID4gIC0gQ3Jpc3BlbiB1cCBjcHUgaW5kZXggdHlwZSB0byBhbHdh
eXMgYmUgaW50IChDb25vcikKPiA+Cj4gPiBDaGFuZ2VzIGluIHYzOgo+ID4gIC0gSGF2ZSBod3By
b2JlX21pc2FsaWduZWQgcmV0dXJuIGludCBpbnN0ZWFkIG9mIGxvbmcuCj4gPiAgLSBDb25zdGlm
eSBjcHVtYXNrIHBvaW50ZXIgaW4gaHdwcm9iZV9taXNhbGlnbmVkKCkKPiA+ICAtIEZpeCB3YXJu
aW5ncyBpbiBfUEVSRl9PIGxpc3QgZG9jdW1lbnRhdGlvbiwgdXNlIDpjOm1hY3JvOi4KPiA+ICAt
IE1vdmUgaW5jbHVkZSBjcHVmZWF0dXJlLmggdG8gbWlzYWxpZ25lZCBwYXRjaC4KPiA+ICAtIEZp
eCBkb2N1bWVudGF0aW9uIG1pc21hdGNoIGZvciBSSVNDVl9IV1BST0JFX0tFWV9DUFVQRVJGXzAg
KENvbm9yKQo+ID4gIC0gVXNlIGZvcl9lYWNoX3Bvc3NpYmxlX2NwdSgpIGluc3RlYWQgb2YgTlJf
Q1BVUyAoQ29ub3IpCj4gPiAgLSBCcmVhayBlYXJseSBpbiBtaXNhbGlnbmVkIGFjY2VzcyBpdGVy
YXRpb24gKENvbm9yKQo+ID4gIC0gSW5jcmVhc2UgTUlTQUxJR05FRF9NQVNLIGZyb20gMiBiaXRz
IHRvIDMgZm9yIHBvc3NpYmxlIFVOU1VQUE9SVEVEIGZ1dHVyZQo+ID4gICAgdmFsdWUgKENvbm9y
KQo+ID4KPiA+IENoYW5nZXMgaW4gdjI6Cj4gPiAgLSBGaXhlZCBsb2dpYyBlcnJvciBpbiBpZihv
Zl9wcm9wZXJ0eV9yZWFkX3N0cmluZy4uLikgdGhhdCBjYXVzZWQgY3Jhc2gKPiA+ICAtIEluY2x1
ZGUgY3B1ZmVhdHVyZS5oIGluIGNwdWZlYXR1cmUuaCB0byBhdm9pZCB1bmRlY2xhcmVkIHZhcmlh
YmxlCj4gPiAgICB3YXJuaW5nLgo+ID4gIC0gQWRkZWQgYSBfTUFTSyBkZWZpbmUKPiA+ICAtIEZp
eCByYW5kb20gY2hlY2twYXRjaCBjb21wbGFpbnRzCj4gPgo+ID4gIERvY3VtZW50YXRpb24vcmlz
Y3YvaHdwcm9iZS5yc3QgICAgICAgfCAyMSArKysrKysrKysrKysrKysrKysrKwo+ID4gIGFyY2gv
cmlzY3YvZXJyYXRhL3RoZWFkL2VycmF0YS5jICAgICAgfCAgOSArKysrKysrKysKPiA+ICBhcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL2FsdGVybmF0aXZlLmggIHwgIDUgKysrKysKPiA+ICBhcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2NwdWZlYXR1cmUuaCAgIHwgIDIgKysKPiA+ICBhcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL2h3cHJvYmUuaCAgICAgIHwgIDIgKy0KPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUv
dWFwaS9hc20vaHdwcm9iZS5oIHwgIDcgKysrKysrKwo+ID4gIGFyY2gvcmlzY3Yva2VybmVsL2Fs
dGVybmF0aXZlLmMgICAgICAgfCAxOSArKysrKysrKysrKysrKysrKysKPiA+ICBhcmNoL3Jpc2N2
L2tlcm5lbC9jcHVmZWF0dXJlLmMgICAgICAgIHwgIDMgKysrCj4gPiAgYXJjaC9yaXNjdi9rZXJu
ZWwvc21wYm9vdC5jICAgICAgICAgICB8ICAxICsKPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9zeXNf
cmlzY3YuYyAgICAgICAgIHwgMjggKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgMTAg
ZmlsZXMgY2hhbmdlZCwgOTYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4KPiA+IGRp
ZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3Jpc2N2L2h3cHJvYmUucnN0IGIvRG9jdW1lbnRhdGlv
bi9yaXNjdi9od3Byb2JlLnJzdAo+ID4gaW5kZXggOTQ1ZDQ0NjgzYzQwLi45ZjBkZDYyZGNiNWQg
MTAwNjQ0Cj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL3Jpc2N2L2h3cHJvYmUucnN0Cj4gPiArKysg
Yi9Eb2N1bWVudGF0aW9uL3Jpc2N2L2h3cHJvYmUucnN0Cj4gPiBAQCAtNjMsMyArNjMsMjQgQEAg
VGhlIGZvbGxvd2luZyBrZXlzIGFyZSBkZWZpbmVkOgo+ID4KPiA+ICAgICogOmM6bWFjcm86YFJJ
U0NWX0hXUFJPQkVfSU1BX0NgOiBUaGUgQyBleHRlbnNpb24gaXMgc3VwcG9ydGVkLCBhcyBkZWZp
bmVkCj4gPiAgICAgIGJ5IHZlcnNpb24gMi4yIG9mIHRoZSBSSVNDLVYgSVNBIG1hbnVhbC4KPiA+
ICsKPiA+ICsqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0tFWV9DUFVQRVJGXzBgOiBBIGJpdG1h
c2sgdGhhdCBjb250YWlucyBwZXJmb3JtYW5jZQo+ID4gKyAgaW5mb3JtYXRpb24gYWJvdXQgdGhl
IHNlbGVjdGVkIHNldCBvZiBwcm9jZXNzb3JzLgo+ID4gKwo+ID4gKyAgKiA6YzptYWNybzpgUklT
Q1ZfSFdQUk9CRV9NSVNBTElHTkVEX1VOS05PV05gOiBUaGUgcGVyZm9ybWFuY2Ugb2YgbWlzYWxp
Z25lZAo+ID4gKyAgICBhY2Nlc3NlcyBpcyB1bmtub3duLgo+ID4gKwo+ID4gKyAgKiA6YzptYWNy
bzpgUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX0VNVUxBVEVEYDogTWlzYWxpZ25lZCBhY2Nlc3Nl
cyBhcmUKPiA+ICsgICAgZW11bGF0ZWQgdmlhIHNvZnR3YXJlLCBlaXRoZXIgaW4gb3IgYmVsb3cg
dGhlIGtlcm5lbC4gIFRoZXNlIGFjY2Vzc2VzIGFyZQo+ID4gKyAgICBhbHdheXMgZXh0cmVtZWx5
IHNsb3cuCj4gPiArCj4gPiArICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX01JU0FMSUdORURf
U0xPV2A6IE1pc2FsaWduZWQgYWNjZXNzZXMgYXJlIHN1cHBvcnRlZAo+ID4gKyAgICBpbiBoYXJk
d2FyZSwgYnV0IGFyZSBzbG93ZXIgdGhhbiB0aGUgY29vcmVzcG9uZGluZyBhbGlnbmVkIGFjY2Vz
c2VzCj4gPiArICAgIHNlcXVlbmNlcy4KPiA+ICsKPiA+ICsgICogOmM6bWFjcm86YFJJU0NWX0hX
UFJPQkVfTUlTQUxJR05FRF9GQVNUYDogTWlzYWxpZ25lZCBhY2Nlc3NlcyBhcmUgc3VwcG9ydGVk
Cj4gPiArICAgIGluIGhhcmR3YXJlIGFuZCBhcmUgZmFzdGVyIHRoYW4gdGhlIGNvb3Jlc3BvbmRp
bmcgYWxpZ25lZCBhY2Nlc3Nlcwo+ID4gKyAgICBzZXF1ZW5jZXMuCj4gPiArCj4gPiArICAqIDpj
Om1hY3JvOmBSSVNDVl9IV1BST0JFX01JU0FMSUdORURfVU5TVVBQT1JURURgOiBNaXNhbGlnbmVk
IGFjY2Vzc2VzIGFyZQo+ID4gKyAgICBub3Qgc3VwcG9ydGVkIGF0IGFsbCBhbmQgd2lsbCBnZW5l
cmF0ZSBhIG1pc2FsaWduZWQgYWRkcmVzcyBmYXVsdC4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2VycmF0YS90aGVhZC9lcnJhdGEuYyBiL2FyY2gvcmlzY3YvZXJyYXRhL3RoZWFkL2VycmF0
YS5jCj4gPiBpbmRleCBmYWM1NzQyZDFjMWUuLmY0MWE0NWFmNTYwNyAxMDA2NDQKPiA+IC0tLSBh
L2FyY2gvcmlzY3YvZXJyYXRhL3RoZWFkL2VycmF0YS5jCj4gPiArKysgYi9hcmNoL3Jpc2N2L2Vy
cmF0YS90aGVhZC9lcnJhdGEuYwo+ID4gQEAgLTEwLDcgKzEwLDkgQEAKPiA+ICAjaW5jbHVkZSA8
bGludXgvdWFjY2Vzcy5oPgo+ID4gICNpbmNsdWRlIDxhc20vYWx0ZXJuYXRpdmUuaD4KPiA+ICAj
aW5jbHVkZSA8YXNtL2NhY2hlZmx1c2guaD4KPiA+ICsjaW5jbHVkZSA8YXNtL2NwdWZlYXR1cmUu
aD4KPiA+ICAjaW5jbHVkZSA8YXNtL2VycmF0YV9saXN0Lmg+Cj4gPiArI2luY2x1ZGUgPGFzbS9o
d3Byb2JlLmg+Cj4gPiAgI2luY2x1ZGUgPGFzbS9wYXRjaC5oPgo+ID4gICNpbmNsdWRlIDxhc20v
dmVuZG9yaWRfbGlzdC5oPgo+ID4KPiA+IEBAIC0xMDgsMyArMTEwLDEwIEBAIHZvaWQgX19pbml0
X29yX21vZHVsZSB0aGVhZF9lcnJhdGFfcGF0Y2hfZnVuYyhzdHJ1Y3QgYWx0X2VudHJ5ICpiZWdp
biwgc3RydWN0IGFsCj4gPiAgICAgICBpZiAoc3RhZ2UgPT0gUklTQ1ZfQUxURVJOQVRJVkVTX0VB
UkxZX0JPT1QpCj4gPiAgICAgICAgICAgICAgIGxvY2FsX2ZsdXNoX2ljYWNoZV9hbGwoKTsKPiA+
ICB9Cj4gPiArCj4gPiArdm9pZCB0aGVhZF9mZWF0dXJlX3Byb2JlX2Z1bmModW5zaWduZWQgaW50
IGNwdSwgdW5zaWduZWQgbG9uZyBhcmNoaWQsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgdW5zaWduZWQgbG9uZyBpbXBpZCkKPiA+ICt7Cj4gPiArICAgICBpZiAoKGFyY2hpZCA9PSAw
KSAmJiAoaW1waWQgPT0gMCkpCj4gPiArICAgICAgICAgICAgIHBlcl9jcHUobWlzYWxpZ25lZF9h
Y2Nlc3Nfc3BlZWQsIGNwdSkgPSBSSVNDVl9IV1BST0JFX01JU0FMSUdORURfRkFTVDsKPgo+IFdo
ZW4gbG9va2luZyBhdCB0aGlzIGZ1bmN0aW9uIEkgJ20gd29uZGVyaW5nIGlmIHdlIGFsc28gd2Fu
dCB0byBleHBvc2UKPiB0aGUgYWN0aXZlIGVycmF0YXMgc29tZWhvdyAobm90IGluIHRoaXMgcGF0
Y2ggb2YgY291cnNlLCBqdXN0IGluIGdlbmVyYWwpCgpJIHN1cHBvc2UgYXMgQXJuZCBwb2ludGVk
IG91dCBpbiBhIGRpZmZlcmVudCB0aHJlYWQgdGhlcmUncyBzb3J0IG9mIGEKdGVuc2lvbiBiZXR3
ZWVuIHRoaXMgbWVjaGFuaXNtIGFuZCAvcHJvYy9jcHVpbmZvLCB0aGUgdHJhZGl0aW9uYWwgc3Bv
dApmb3IgZXhwb3NpbmcgbW9yZSBzdGFuZGFyZCBjcHUgZmVhdHVyZXMvZXJyYXRhLiBUaG91Z2gg
aWYgd2UgdGhpbmsgb2YKdGhpcyBtZWNoYW5pc20gYXMgYSBzb3J0IG9mIHN1cnJvZ2F0ZSBmb3Ig
Y3B1aWQsIHRoZW4gaXQgcG90ZW50aWFsbHkKZG9lcyBtYWtlIHNlbnNlLiBNeSBndXQgc2F5cyBp
dCdzIGEganVkZ21lbnQgY2FsbC4KCi1FdmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
