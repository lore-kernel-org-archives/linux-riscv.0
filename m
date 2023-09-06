Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85286EB8FAF
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Sep 2023 11:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Agk+HE6zPoZxFL+B5anbGwRdZForuuJFW+3vmTY4Lk=; b=dFKLTbxyta3XLS
	VaC/DT0l8VGZjT9TQD4foNUdFSRnoDN5AsEjYGLl0nf5VmFuxi7OZ7RWHcabuHYeQcPH/FMYHS81F
	GNVv6FBR3DCh2196ga1rzTVx+bsA4ZZaBi3d+1AjA//9cC0MSbCcvh4gRTgoPdFYctwSQ163YiRXt
	LQ/D7Pm0COOgx7q/ZmEkj1brl6ikflQ23qIZjy36dMfm4+nfdMyO2AoXCbsMzxkUoOEyXvr+n/FoS
	NmxTE+fR8H5EBe19dt/ZgKVJdFZra//r/PN5P5Ej1EYSXUJRO2Jqv94OsabJcMPhMOI5GYQoI39ch
	hiAySCCciM0dlR8HbygQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdr2I-008zY0-2M;
	Wed, 06 Sep 2023 11:49:31 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdr2G-008zR2-0j
	for linux-riscv@lists.infradead.org;
	Wed, 06 Sep 2023 11:49:30 +0000
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-792975085b2so148672139f.1
        for <linux-riscv@lists.infradead.org>; Wed, 06 Sep 2023 04:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694000963; x=1694605763; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=802AAgv3wz2LTyeTpPVTFVHu+dHOc2J+fZFm2H+OBEw=;
        b=kgKQLwgjbbVWV71zF3W6R4mR1egRFeONULtzgxhUf+q+XaODCLiHEgbESdy4CG3NGZ
         2D7NCCpDAbH75gNrrtTSh+LSIvPF4mnxtahgMnpUl/yjkEFxoFkkOA89HLsJWSHHVdza
         2ZXsa0ZmSctR+nPhoJu+o/iG4MTMz5v7avUVf7WeVUAq2ytblveiQ9WBR//694GjWJYc
         Gnk6+cLrTwYGwbVgBA9FjJF3jUsQhGPshNVV4dQShnUDo/rwzrjoJQvYHJovw7JrmEX4
         Q0MXuLbqVJ9gPuafRgenuYlFCl7bEM0nlk0/4wL+o8lbWi414+RyC5vvUtlulvoBcn1X
         Vz5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694000963; x=1694605763;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=802AAgv3wz2LTyeTpPVTFVHu+dHOc2J+fZFm2H+OBEw=;
        b=GftGxwousqtYE0xp/yt/7lyuW+etjNtr5x9PnZ5aVh2RfZl4V52RR8jvdaCy41u92P
         mvyZ5XAJaMp9a1PXbOtuiFyyxZOCJXjKtSnACTXAP/ccpNUO3mUGUlOsaqJ+qAFxAreE
         EdV2jXMBBYg5RS7bzuM/sory9mNGLrwzG30AkPJNP4oR7tTwTUbjBCxuNwsObxupZnwz
         f+4LK3PlL7bQi/eAlW2BZVdvX9Y0p6kXfA6SXWAHFQbBOXYu7bcq1eg8y/ZflWG7tCZA
         mpou8cRqOWSZAg5k9Of+WcteNOqgCCSYfvAw4T5eXxHJWmtbExt5qGR/fW+r6PX7dySC
         +u1g==
X-Gm-Message-State: AOJu0YzneZjqK9ETOXPbjEBcM3j60lZQNLK2ZOnfcUUYukOiaabT//IA
	wihnQnoHQK0029BYSfjAPbHP0T7eIiXctC5vsaU=
X-Google-Smtp-Source: AGHT+IH6DsqPi8SdheBZsKbjp3rpBzMgs3khBwXDcwUm7Ggzj9VNJPHEk/gmeAu63HwwnE9vy9hfNu4uF24UTfDzyME=
X-Received: by 2002:a05:6602:2246:b0:792:72b8:b8a with SMTP id
 o6-20020a056602224600b0079272b80b8amr16942731ioo.18.1694000963404; Wed, 06
 Sep 2023 04:49:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230801085402.1168351-1-alexghiti@rivosinc.com> <20230801085402.1168351-5-alexghiti@rivosinc.com>
In-Reply-To: <20230801085402.1168351-5-alexghiti@rivosinc.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 6 Sep 2023 12:48:57 +0100
Message-ID: <CA+V-a8t56xDqMTQfoKcsvPF8errkTMydaDz5V6nejLvVfJrW3g@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] riscv: Improve flush_tlb_kernel_range()
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Will Deacon <will@kernel.org>, 
	"Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Nick Piggin <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, Vincent Chen <vincent.chen@sifive.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_044928_268336_06020F3A 
X-CRM114-Status: GOOD (  28.05  )
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

SGkgQWxleGFuZHJlLAoKT24gVHVlLCBBdWcgMSwgMjAyMyBhdCA5OjU44oCvQU0gQWxleGFuZHJl
IEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPiB3cm90ZToKPgo+IFRoaXMgZnVuY3Rpb24g
dXNlZCB0byBzaW1wbHkgZmx1c2ggdGhlIHdob2xlIHRsYiBvZiBhbGwgaGFydHMsIGJlIG1vcmUK
PiBzdWJ0aWxlIGFuZCB0cnkgdG8gb25seSBmbHVzaCB0aGUgcmFuZ2UuCj4KPiBUaGUgcHJvYmxl
bSBpcyB0aGF0IHdlIGNhbiBvbmx5IHVzZSBQQUdFX1NJWkUgYXMgc3RyaWRlIHNpbmNlIHdlIGRv
bid0IGtub3cKPiB0aGUgc2l6ZSBvZiB0aGUgdW5kZXJseWluZyBtYXBwaW5nIGFuZCB0aGVuIHRo
aXMgZnVuY3Rpb24gd2lsbCBiZSBpbXByb3ZlZAo+IG9ubHkgaWYgdGhlIHNpemUgb2YgdGhlIHJl
Z2lvbiB0byBmbHVzaCBpcyA8IHRocmVzaG9sZCAqIFBBR0VfU0laRS4KPgo+IFNpZ25lZC1vZmYt
Ynk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KPiBSZXZpZXdlZC1i
eTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KPiAtLS0KPiAgYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS90bGJmbHVzaC5oIHwgMTEgKysrKystLS0tLQo+ICBhcmNoL3Jpc2N2
L21tL3RsYmZsdXNoLmMgICAgICAgICAgfCAzNCArKysrKysrKysrKysrKysrKysrKysrKy0tLS0t
LS0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0p
Cj4KQWZ0ZXIgYXBwbHlpbmcgdGhpcyBwYXRjaCwgSSBhbSBzZWVpbmcgbW9kdWxlIGxvYWQgaXNz
dWVzIG9uIFJaL0ZpdmUKKGNvbXBsZXRlIGxvZyBbMF0pLiBJIGFtIHRlc3RpbmcgZGVmY29uZmln
ICsgWzFdIChyei9maXZlIHJlbGF0ZWQKY29uZmlncykuCgpBbnkgcG9pbnRlcnMgb24gd2hhdCBj
b3VsZCBiZSBhbiBpc3N1ZSBoZXJlPwoKWzBdIGh0dHBzOi8vcGFzdGUuZGViaWFuLm5ldC8xMjkx
MTE2LwpbMV0gaHR0cHM6Ly9wYXN0ZS5kZWJpYW4ubmV0LzEyOTExMTgvCgpDaGVlcnMsClByYWJo
YWthcgoKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90bGJmbHVzaC5oIGIv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90bGJmbHVzaC5oCj4gaW5kZXggZjVjNGZiMGFlNjQyLi43
NDI2ZmRjZDhlYzUgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90bGJmbHVz
aC5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90bGJmbHVzaC5oCj4gQEAgLTM3LDYg
KzM3LDcgQEAgdm9pZCBmbHVzaF90bGJfbW1fcmFuZ2Uoc3RydWN0IG1tX3N0cnVjdCAqbW0sIHVu
c2lnbmVkIGxvbmcgc3RhcnQsCj4gIHZvaWQgZmx1c2hfdGxiX3BhZ2Uoc3RydWN0IHZtX2FyZWFf
c3RydWN0ICp2bWEsIHVuc2lnbmVkIGxvbmcgYWRkcik7Cj4gIHZvaWQgZmx1c2hfdGxiX3Jhbmdl
KHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLCB1bnNpZ25lZCBsb25nIHN0YXJ0LAo+ICAgICAg
ICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgZW5kKTsKPiArdm9pZCBmbHVzaF90bGJfa2Vy
bmVsX3JhbmdlKHVuc2lnbmVkIGxvbmcgc3RhcnQsIHVuc2lnbmVkIGxvbmcgZW5kKTsKPiAgI2lm
ZGVmIENPTkZJR19UUkFOU1BBUkVOVF9IVUdFUEFHRQo+ICAjZGVmaW5lIF9fSEFWRV9BUkNIX0ZM
VVNIX1BNRF9UTEJfUkFOR0UKPiAgdm9pZCBmbHVzaF9wbWRfdGxiX3JhbmdlKHN0cnVjdCB2bV9h
cmVhX3N0cnVjdCAqdm1hLCB1bnNpZ25lZCBsb25nIHN0YXJ0LAo+IEBAIC01MywxNSArNTQsMTUg
QEAgc3RhdGljIGlubGluZSB2b2lkIGZsdXNoX3RsYl9yYW5nZShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1
Y3QgKnZtYSwKPiAgICAgICAgIGxvY2FsX2ZsdXNoX3RsYl9hbGwoKTsKPiAgfQo+Cj4gLSNkZWZp
bmUgZmx1c2hfdGxiX21tKG1tKSBmbHVzaF90bGJfYWxsKCkKPiAtI2RlZmluZSBmbHVzaF90bGJf
bW1fcmFuZ2UobW0sIHN0YXJ0LCBlbmQsIHBhZ2Vfc2l6ZSkgZmx1c2hfdGxiX2FsbCgpCj4gLSNl
bmRpZiAvKiAhQ09ORklHX1NNUCB8fCAhQ09ORklHX01NVSAqLwo+IC0KPiAgLyogRmx1c2ggYSBy
YW5nZSBvZiBrZXJuZWwgcGFnZXMgKi8KPiAgc3RhdGljIGlubGluZSB2b2lkIGZsdXNoX3RsYl9r
ZXJuZWxfcmFuZ2UodW5zaWduZWQgbG9uZyBzdGFydCwKPiAgICAgICAgIHVuc2lnbmVkIGxvbmcg
ZW5kKQo+ICB7Cj4gLSAgICAgICBmbHVzaF90bGJfYWxsKCk7Cj4gKyAgICAgICBsb2NhbF9mbHVz
aF90bGJfYWxsKCk7Cj4gIH0KPgo+ICsjZGVmaW5lIGZsdXNoX3RsYl9tbShtbSkgZmx1c2hfdGxi
X2FsbCgpCj4gKyNkZWZpbmUgZmx1c2hfdGxiX21tX3JhbmdlKG1tLCBzdGFydCwgZW5kLCBwYWdl
X3NpemUpIGZsdXNoX3RsYl9hbGwoKQo+ICsjZW5kaWYgLyogIUNPTkZJR19TTVAgfHwgIUNPTkZJ
R19NTVUgKi8KPiArCj4gICNlbmRpZiAvKiBfQVNNX1JJU0NWX1RMQkZMVVNIX0ggKi8KPiBkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5jIGIvYXJjaC9yaXNjdi9tbS90bGJmbHVz
aC5jCj4gaW5kZXggMGM5NTVjNDc0ZjNhLi42ODc4MDgwMTM3NTggMTAwNjQ0Cj4gLS0tIGEvYXJj
aC9yaXNjdi9tbS90bGJmbHVzaC5jCj4gKysrIGIvYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5jCj4g
QEAgLTEyMCwxOCArMTIwLDI3IEBAIHN0YXRpYyB2b2lkIF9fZmx1c2hfdGxiX3JhbmdlKHN0cnVj
dCBtbV9zdHJ1Y3QgKm1tLCB1bnNpZ25lZCBsb25nIHN0YXJ0LAo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgc2l6ZSwgdW5zaWduZWQgbG9uZyBzdHJpZGUpCj4g
IHsKPiAgICAgICAgIHN0cnVjdCBmbHVzaF90bGJfcmFuZ2VfZGF0YSBmdGQ7Cj4gLSAgICAgICBz
dHJ1Y3QgY3B1bWFzayAqY21hc2sgPSBtbV9jcHVtYXNrKG1tKTsKPiAtICAgICAgIHVuc2lnbmVk
IGludCBjcHVpZDsKPiArICAgICAgIHN0cnVjdCBjcHVtYXNrICpjbWFzaywgZnVsbF9jbWFzazsK
PiAgICAgICAgIGJvb2wgYnJvYWRjYXN0Owo+Cj4gLSAgICAgICBpZiAoY3B1bWFza19lbXB0eShj
bWFzaykpCj4gLSAgICAgICAgICAgICAgIHJldHVybjsKPiArICAgICAgIGlmIChtbSkgewo+ICsg
ICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgY3B1aWQ7Cj4gKwo+ICsgICAgICAgICAgICAgICBj
bWFzayA9IG1tX2NwdW1hc2sobW0pOwo+ICsgICAgICAgICAgICAgICBpZiAoY3B1bWFza19lbXB0
eShjbWFzaykpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuOwo+ICsKPiArICAgICAg
ICAgICAgICAgY3B1aWQgPSBnZXRfY3B1KCk7Cj4gKyAgICAgICAgICAgICAgIC8qIGNoZWNrIGlm
IHRoZSB0bGJmbHVzaCBuZWVkcyB0byBiZSBzZW50IHRvIG90aGVyIENQVXMgKi8KPiArICAgICAg
ICAgICAgICAgYnJvYWRjYXN0ID0gY3B1bWFza19hbnlfYnV0KGNtYXNrLCBjcHVpZCkgPCBucl9j
cHVfaWRzOwo+ICsgICAgICAgfSBlbHNlIHsKPiArICAgICAgICAgICAgICAgY3B1bWFza19zZXRh
bGwoJmZ1bGxfY21hc2spOwo+ICsgICAgICAgICAgICAgICBjbWFzayA9ICZmdWxsX2NtYXNrOwo+
ICsgICAgICAgICAgICAgICBicm9hZGNhc3QgPSB0cnVlOwo+ICsgICAgICAgfQo+Cj4gLSAgICAg
ICBjcHVpZCA9IGdldF9jcHUoKTsKPiAtICAgICAgIC8qIGNoZWNrIGlmIHRoZSB0bGJmbHVzaCBu
ZWVkcyB0byBiZSBzZW50IHRvIG90aGVyIENQVXMgKi8KPiAtICAgICAgIGJyb2FkY2FzdCA9IGNw
dW1hc2tfYW55X2J1dChjbWFzaywgY3B1aWQpIDwgbnJfY3B1X2lkczsKPiAgICAgICAgIGlmIChz
dGF0aWNfYnJhbmNoX3VubGlrZWx5KCZ1c2VfYXNpZF9hbGxvY2F0b3IpKSB7Cj4gLSAgICAgICAg
ICAgICAgIHVuc2lnbmVkIGxvbmcgYXNpZCA9IGF0b21pY19sb25nX3JlYWQoJm1tLT5jb250ZXh0
LmlkKSAmIGFzaWRfbWFzazsKPiArICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBhc2lkID0g
bW0gPyBhdG9taWNfbG9uZ19yZWFkKCZtbS0+Y29udGV4dC5pZCkgJiBhc2lkX21hc2sgOiAwOwo+
Cj4gICAgICAgICAgICAgICAgIGlmIChicm9hZGNhc3QpIHsKPiAgICAgICAgICAgICAgICAgICAg
ICAgICBpZiAocmlzY3ZfdXNlX2lwaV9mb3JfcmZlbmNlKCkpIHsKPiBAQCAtMTY1LDcgKzE3NCw4
IEBAIHN0YXRpYyB2b2lkIF9fZmx1c2hfdGxiX3JhbmdlKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCB1
bnNpZ25lZCBsb25nIHN0YXJ0LAo+ICAgICAgICAgICAgICAgICB9Cj4gICAgICAgICB9Cj4KPiAt
ICAgICAgIHB1dF9jcHUoKTsKPiArICAgICAgIGlmIChtbSkKPiArICAgICAgICAgICAgICAgcHV0
X2NwdSgpOwo+ICB9Cj4KPiAgdm9pZCBmbHVzaF90bGJfbW0oc3RydWN0IG1tX3N0cnVjdCAqbW0p
Cj4gQEAgLTE5Niw2ICsyMDYsMTIgQEAgdm9pZCBmbHVzaF90bGJfcmFuZ2Uoc3RydWN0IHZtX2Fy
ZWFfc3RydWN0ICp2bWEsIHVuc2lnbmVkIGxvbmcgc3RhcnQsCj4KPiAgICAgICAgIF9fZmx1c2hf
dGxiX3JhbmdlKHZtYS0+dm1fbW0sIHN0YXJ0LCBlbmQgLSBzdGFydCwgc3RyaWRlX3NpemUpOwo+
ICB9Cj4gKwo+ICt2b2lkIGZsdXNoX3RsYl9rZXJuZWxfcmFuZ2UodW5zaWduZWQgbG9uZyBzdGFy
dCwgdW5zaWduZWQgbG9uZyBlbmQpCj4gK3sKPiArICAgICAgIF9fZmx1c2hfdGxiX3JhbmdlKE5V
TEwsIHN0YXJ0LCBlbmQsIFBBR0VfU0laRSk7Cj4gK30KPiArCj4gICNpZmRlZiBDT05GSUdfVFJB
TlNQQVJFTlRfSFVHRVBBR0UKPiAgdm9pZCBmbHVzaF9wbWRfdGxiX3JhbmdlKHN0cnVjdCB2bV9h
cmVhX3N0cnVjdCAqdm1hLCB1bnNpZ25lZCBsb25nIHN0YXJ0LAo+ICAgICAgICAgICAgICAgICAg
ICAgICAgIHVuc2lnbmVkIGxvbmcgZW5kKQo+IC0tCj4gMi4zOS4yCj4KPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
