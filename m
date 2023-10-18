Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 819F9CDB47E
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 17:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EH55pzv3twaKYBv4QIrh9NNZTQB+X5hH6s0IfebfoaU=; b=H46TGB/PzZAa1f
	HTcF6/ebuL7aTLakmwN/zcQdh7ctv/VWMYfDGoUcrJwQSbcXDMko32nQ/QzHCyGU/OLiS42sA6XU5
	+Bt//Nj9kPJepR5H6HBRcI6q0e87AOCGJD8pvaElaeOLTeFF3Ijc4IaoDAkHH8299sW7U7dHDvAt7
	xVBtRpbACfnEG4F/0ZlbrAW5VRlndxb84IqjGRpcZoZEimxWJXWV/hnyjEJgQtXezo0dR1Wvg+fGW
	nQAE86QagGGNphQAkHHnYAemteTsk2b2buM9lHS1e7/rfETYr+EkPAmhHJDDOz+FNzL6MNBKH+Ub5
	c4WP1qRvj2KCNtO83rUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtAc7-00FMoc-1g;
	Wed, 18 Oct 2023 17:45:47 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtAc4-00FMnw-1a
	for linux-riscv@lists.infradead.org;
	Wed, 18 Oct 2023 17:45:46 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2c50cd16f3bso74652501fa.2
        for <linux-riscv@lists.infradead.org>; Wed, 18 Oct 2023 10:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697651143; x=1698255943; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xHadPeMbwC2xjZjhyzQo2TzXpSpoTFPJhsEQY4iQg+4=;
        b=Y9ejaPwpzXKaehnPjhEWVJRgfmuXAJ6L5j4idfFxg8jtJp7mOK+Wx+f7UHNVZl1SCY
         NFhJ9+Id2244KaODtrdqAC4fHa757rt6ar6BLkyOO152miV+FdsW1/4+C1p4PhAqmkyE
         fwnA21RNwUp/HjhZLknTyM0uirMn2MoXlurLGNXp3eT0wmdsnMVbrNaYeRndpqeTfZqE
         chpNfD8+ONOA4bLYrDwgR3iOx8+oEQp26T6N3lFyAUghTC4HBegEwn8NpAAexfxI4QXb
         GS+rl27AqBb3t4vFluNwLvm+mjH+3e6f1y2nHayKtZJBsMnXj/Bq2sD+mLTARrmGgjjQ
         +S9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697651143; x=1698255943;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xHadPeMbwC2xjZjhyzQo2TzXpSpoTFPJhsEQY4iQg+4=;
        b=NRPmFN7uL4UwLAy9piaPA92hvld8BsUi3bDCzyXZGh0RnFaFUgQ5mgnEqLsQmudWV7
         55Qyuiee4SmwlX3FG9/rc03/G4M4rBevu8StgGxUlCPpUIkSUelcpfBBH2sP3cQDlhQI
         cXV2QHp5qZmIOjDD75ahIiKXyfmIETrmeUfc20vRqGSwccbFmwEoo+HetWSpCNns6hex
         wCSZhxC7X0oVX+65TnO69RTt4KBBqA7vXTAYGOyR6Q6La6gQUYR0sHrPoYSdhXnICKYD
         K+V0VDxXNCtRy9MwlaTL2A0pB8loroo7c2ilUPUqa8ATQ3eoyu2ld3tP5jXI6m5wWLYw
         z+1w==
X-Gm-Message-State: AOJu0YwK4ZNEDKa+QwzJJ3EComXER/FikSQxIyg2U2WqjbTCS38PdWQI
	m2Ur8OSaLmeY1VFclWs9vKHKNSBlORYpb6znV3m+gA==
X-Google-Smtp-Source: AGHT+IF0Qm+imyEQ605WJaqcgBCjou2M4E+StpMU1j6f3I4T8OP3Gvxt6S2uZ4MvstkkZp8oaiAgvOEmwpOTuXOShyE=
X-Received: by 2002:a2e:b8c5:0:b0:2c5:8db:1c7b with SMTP id
 s5-20020a2eb8c5000000b002c508db1c7bmr5726942ljp.2.1697651142704; Wed, 18 Oct
 2023 10:45:42 -0700 (PDT)
MIME-Version: 1.0
References: <20231017131456.2053396-1-cleger@rivosinc.com> <20231017131456.2053396-2-cleger@rivosinc.com>
 <CALs-HssL=wNwj9nRuZwpZhy1CB9p9-X=OqgwBw9zvgA7hA4fEg@mail.gmail.com>
 <20231018-scrap-bankable-a0f321d97a46@spud> <20231018-flagpole-footpad-07a6228485f3@spud>
In-Reply-To: <20231018-flagpole-footpad-07a6228485f3@spud>
From: Evan Green <evan@rivosinc.com>
Date: Wed, 18 Oct 2023 10:45:06 -0700
Message-ID: <CALs-HsteDO0PvAKKQje7wU0f4z8w2V3f7WiHh5+LvQeVaSua1w@mail.gmail.com>
Subject: Re: [PATCH v2 01/19] riscv: hwprobe: factorize hwprobe ISA extension reporting
To: Conor Dooley <conor@kernel.org>
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Jones <ajones@ventanamicro.com>, 
	Samuel Ortiz <sameo@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_104544_552607_65989D5E 
X-CRM114-Status: GOOD (  26.82  )
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

T24gV2VkLCBPY3QgMTgsIDIwMjMgYXQgMTA6MzfigK9BTSBDb25vciBEb29sZXkgPGNvbm9yQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gV2VkLCBPY3QgMTgsIDIwMjMgYXQgMDY6MzM6MzRQTSAr
MDEwMCwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+ID4gT24gV2VkLCBPY3QgMTgsIDIwMjMgYXQgMTA6
MjQ6MTVBTSAtMDcwMCwgRXZhbiBHcmVlbiB3cm90ZToKPiA+ID4gT24gVHVlLCBPY3QgMTcsIDIw
MjMgYXQgNjoxNeKAr0FNIENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4gd3Jv
dGU6Cj4gPiA+ID4KPiA+ID4gPiBGYWN0b3JpemUgSVNBIGV4dGVuc2lvbiByZXBvcnRpbmcgYnkg
dXNpbmcgYSBtYWNybyByYXRoZXIgdGhhbgo+ID4gPiA+IGNvcHkvcGFzdGluZyBleHRlbnNpb24g
bmFtZXMuIFRoaXMgd2lsbCBhbGxvdyBhZGRpbmcgbmV3IGV4dGVuc2lvbnMgbW9yZQo+ID4gPiA+
IGVhc2lseS4KPiA+ID4gPgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8
Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KPiA+ID4gPiAtLS0KPiA+ID4gPiAgYXJjaC9yaXNjdi9rZXJu
ZWwvc3lzX3Jpc2N2LmMgfCAzMiArKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLQo+ID4g
PiA+ICAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCj4g
PiA+ID4KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX3Jpc2N2LmMg
Yi9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3YuYwo+ID4gPiA+IGluZGV4IDQ3MzE1OWI1ZjMw
My4uZTIwNzg3NGU2ODZlIDEwMDY0NAo+ID4gPiA+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3N5
c19yaXNjdi5jCj4gPiA+ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX3Jpc2N2LmMKPiA+
ID4gPiBAQCAtMTQ1LDIwICsxNDUsMjQgQEAgc3RhdGljIHZvaWQgaHdwcm9iZV9pc2FfZXh0MChz
dHJ1Y3QgcmlzY3ZfaHdwcm9iZSAqcGFpciwKPiA+ID4gPiAgICAgICAgIGZvcl9lYWNoX2NwdShj
cHUsIGNwdXMpIHsKPiA+ID4gPiAgICAgICAgICAgICAgICAgc3RydWN0IHJpc2N2X2lzYWluZm8g
KmlzYWluZm8gPSAmaGFydF9pc2FbY3B1XTsKPiA+ID4gPgo+ID4gPiA+IC0gICAgICAgICAgICAg
ICBpZiAocmlzY3ZfaXNhX2V4dGVuc2lvbl9hdmFpbGFibGUoaXNhaW5mby0+aXNhLCBaQkEpKQo+
ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIHBhaXItPnZhbHVlIHw9IFJJU0NWX0hXUFJP
QkVfRVhUX1pCQTsKPiA+ID4gPiAtICAgICAgICAgICAgICAgZWxzZQo+ID4gPiA+IC0gICAgICAg
ICAgICAgICAgICAgICAgIG1pc3NpbmcgfD0gUklTQ1ZfSFdQUk9CRV9FWFRfWkJBOwo+ID4gPiA+
IC0KPiA+ID4gPiAtICAgICAgICAgICAgICAgaWYgKHJpc2N2X2lzYV9leHRlbnNpb25fYXZhaWxh
YmxlKGlzYWluZm8tPmlzYSwgWkJCKSkKPiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICBw
YWlyLT52YWx1ZSB8PSBSSVNDVl9IV1BST0JFX0VYVF9aQkI7Cj4gPiA+ID4gLSAgICAgICAgICAg
ICAgIGVsc2UKPiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICBtaXNzaW5nIHw9IFJJU0NW
X0hXUFJPQkVfRVhUX1pCQjsKPiA+ID4gPiAtCj4gPiA+ID4gLSAgICAgICAgICAgICAgIGlmIChy
aXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJsZShpc2FpbmZvLT5pc2EsIFpCUykpCj4gPiA+ID4g
LSAgICAgICAgICAgICAgICAgICAgICAgcGFpci0+dmFsdWUgfD0gUklTQ1ZfSFdQUk9CRV9FWFRf
WkJTOwo+ID4gPiA+IC0gICAgICAgICAgICAgICBlbHNlCj4gPiA+ID4gLSAgICAgICAgICAgICAg
ICAgICAgICAgbWlzc2luZyB8PSBSSVNDVl9IV1BST0JFX0VYVF9aQlM7Cj4gPiA+ID4gKyNkZWZp
bmUgQ0hFQ0tfSVNBX0VYVChfX2V4dCkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBcCj4gPiA+ID4gKyAgICAgICAgICAgICAgIGRvIHsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiA+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgaWYgKHJpc2N2X2lzYV9leHRlbnNpb25fYXZhaWxh
YmxlKGlzYWluZm8tPmlzYSwgX19leHQpKSBcCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBwYWlyLT52YWx1ZSB8PSBSSVNDVl9IV1BST0JFX0VYVF8jI19fZXh0OyAgICAg
ICBcCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgZWxzZSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiA+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBtaXNzaW5nIHw9IFJJU0NWX0hXUFJPQkVfRVhUXyMjX19leHQ7
ICAgICAgICAgICBcCj4gPiA+ID4gKyAgICAgICAgICAgICAgIH0gd2hpbGUgKGZhbHNlKQo+ID4g
PiA+ICsKPiA+ID4gPiArICAgICAgICAgICAgICAgLyoKPiA+ID4gPiArICAgICAgICAgICAgICAg
ICogT25seSB1c2UgQ0hFQ0tfSVNBX0VYVCgpIGZvciBleHRlbnNpb25zIHdoaWNoIGNhbiBiZSBl
eHBvc2VkCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAqIHRvIHVzZXJzcGFjZSwgcmVnYXJkbGVz
cyBvZiB0aGUga2VybmVsJ3MgY29uZmlndXJhdGlvbiwgYXMgbm8KPiA+ID4gPiArICAgICAgICAg
ICAgICAgICogb3RoZXIgY2hlY2tzLCBiZXNpZGVzIHByZXNlbmNlIGluIHRoZSBoYXJ0X2lzYSBi
aXRtYXAsIGFyZQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgKiBtYWRlLgo+ID4gPgo+ID4gPiBU
aGlzIGNvbW1lbnQgYWxsdWRlcyB0byBhIGRhbmdlcm91cyB0cmFwLCBidXQgSSdtIGhhdmluZyB0
cm91YmxlCj4gPiA+IHVuZGVyc3RhbmRpbmcgd2hhdCBpdCBpcy4KPiA+Cj4gPiBZb3UgY2Fubm90
LCBmb3IgZXhhbXBsZSwgdXNlIHRoaXMgZm9yIGNvbW11bmljYXRpbmcgdGhlIHByZXNlbmNlIG9m
IEYgb3IKPiA+IEQsIHNpbmNlIHRoZXkgcmVxdWlyZSBhIGNvbmZpZyBvcHRpb24gdG8gYmUgc2V0
IGJlZm9yZSB0aGVpciB1c2UgaXMKPiA+IHNhZmUuCj4KPiBGdW5uaWx5IGVub3VnaCwgdGhpcyBj
b21tZW50IGlzIGltbWVkaWF0ZWx5IGNvbnRyYWRpY3RlZCBieSB0aGUgdmVjdG9yCj4gc3Vic2V0
IGV4dGVuc2lvbnMsIHdoZXJlIHRoZXNlIENIRUNLX0lTQV9FWFQoKSBtYWNyb3MgYXJlIHVzZWQg
d3JhcHBlZAo+IGluIGhhc192ZWN0b3IoKS4gVGhlIGNvZGUgbG9va3MgdmFsaWQgdG8gbWUsIHNp
bmNlIGhhc192ZWN0b3IoKSBjb250YWlucwo+IHRoZSBLY29uZmlnIGNoZWNrLCBidXQgZG9lcyBm
bHkgaW4gdGhlIGZhY2Ugb2YgdGhpcyBjb21tZW50LgoKCk9oaCwgZ290IGl0LiBUaGUgd29yZCAi
Y2FuIiBpcyBkb2luZyBhIGxvdCBvZiBoZWF2eSBsaWZ0aW5nIGluIHRoYXQKY29tbWVudC4gU28g
bWF5YmUgc29tZXRoaW5nIGxpa2U6ICJUaGlzIG1hY3JvIHBlcmZvcm1zIGxpdHRsZSBpbiB0aGUK
d2F5IG9mIGV4dGVuc2lvbi1zcGVjaWZpYyBrZXJuZWwgcmVhZGluZXNzIGNoZWNrcy4gSXQncyBh
c3N1bWVkIG90aGVyCmdhdGluZyBmYWN0b3JzIGxpa2UgcmVxdWlyZWQgS2NvbmZpZyBzZXR0aW5n
cyBoYXZlIGFscmVhZHkgYmVlbgpjb25maXJtZWQgdG8gc3VwcG9ydCBleHBvc2luZyB0aGUgZ2l2
ZW4gZXh0ZW5zaW9uIHRvIHVzZXJtb2RlIi4gLi4uCkJ1dCwgeW91IGtub3csIG1ha2UgaXQgc3Bh
cmtsZS4KCi1FdmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
