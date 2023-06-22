Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BD90EB64D8
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jun 2023 15:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gj+8SzSaEI7vacxcRVxcNqcCr5DyGYM/ns0leoR3FSI=; b=axzx7ZAH+r9/69
	90qGvenEzvLwWYU4tzCDNre+R2gfF6Pl+G89SG9bJz3FJoJlZesJc0g9+5P7mGfq/moEk4KzP/cVi
	zWT0y23Jj6fX/fZiCkg+4PRcY6EMCIX+6R+P/E0ABwAlYh3coEEwiAXm75H7jSKb7ssjAnSc6iIIg
	5jUYfeycLf0ET/6CxehuZiuTroc1gY0gsFbhFyqu3xiSDovRnwetSm2PEXD6+TuUFjfjyQR+JDTX5
	3t/0VGeJrDOADc5EwTaGxFD40EypGvFevKT/3No2zVtjiD+nX0a7HR0r+yC8uOJqb5mKbzeLauwId
	t9jqiCPCz77AK/DnrYLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCMXF-0019mz-13;
	Thu, 22 Jun 2023 15:47:49 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCMXC-0019mE-1r
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jun 2023 15:47:48 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-54fb3c168fcso5776796a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 22 Jun 2023 08:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1687448862; x=1690040862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b6IucadOZaLdliSC+0EKZoL0gFNSbZYcMkNalI+YXmk=;
        b=iMANGYNp8xX4S53b67ixkXAEL0RUJmYDmvuN0zfIT0Bq5yTMnb2jfWzh4+zrmztaMW
         uMZQAWtEsYMZdWpEETuJkDziCNNvE+xWgTXqQuqSx1OW1mkwUeG7xIlRgCc3iCbXHUoe
         OS7B36VsmWyeDdFO0FdismStieklErttlbaInMYgKLzJfobl/70lGbUKVcbN4nsiYo/P
         vknrwbyh+0Z0KnRGFtiwbuoK0uTfOXWVVZ/mz0AgoKk4blV8sLsrG62ug304+1TTxJQv
         8eqccFCqEDQISpt7BF/nOaTzuEAg1c642lKakTspT8s75dhZaLjr0S6R6kM6sAMFW7KG
         Bu/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687448862; x=1690040862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b6IucadOZaLdliSC+0EKZoL0gFNSbZYcMkNalI+YXmk=;
        b=KBJ5aB/kn3wl4rCYyOMwgl+ltix+BuqdA666p/B+Dts95dKLsUP6acgXxqeH3vAiTg
         osdTPNpcXCXSObzeJjlCHqot9T63JJmpTm9MbWBmaVKQuSQIGNDi5SXEclr+q9YqQeVt
         QDSJhhEDesXhVjbo1Tv3uF5+weT7APcYofH9/cnhXDFuM7EG4Wc1KRcuB5/qVclfJT+M
         6xhFJwCxD5ELIHMVpKzARYULPGH32qCsTDVmeNnKOGaGXSe8i1vT7p+sCFa8Fc7M1w3B
         bDkPBvAGWLZU50nYFDGcwUuQ0ksvy363IkcVSXdTyOjwHc36uYMniAK/i8YlhzG/5qTE
         OXKw==
X-Gm-Message-State: AC+VfDynjhOT8MG+cLwziP+UUmpPTaV+0xrlfNks+FYSe+8+Vzl2RxoT
	bMhy0maL3KGWBzPbNvdkE/UrHQ==
X-Google-Smtp-Source: ACHHUZ4K+5nqTqrCXiLVI7Zo1f2bxQytJGGl0KejIaCkUuGLsAGFgSHqMu/YIXF36UNs7bLuizb3Rg==
X-Received: by 2002:a05:6a20:c789:b0:11e:18e:a105 with SMTP id hk9-20020a056a20c78900b0011e018ea105mr19406744pzb.55.1687448862421;
        Thu, 22 Jun 2023 08:47:42 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id k8-20020a170902760800b001addf547a6esm5581929pll.17.2023.06.22.08.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 08:47:41 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: bjorn@kernel.org
Cc: andy.chiu@sifive.com,
	linux-riscv@lists.infradead.org,
	palmer@rivosinc.com
Subject: Re: [PATCH] RISC-V: Clobber V registers on syscalls
Date: Thu, 22 Jun 2023 15:47:38 +0000
Message-Id: <20230622154738.6403-1-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <871qi4334n.fsf@all.your.base.are.belong.to.us>
References: <871qi4334n.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_084746_659464_A8024F4A 
X-CRM114-Status: GOOD (  21.70  )
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

T24gVGh1LCBKdW4gMjIsIDIwMjMgYXQgNTo0MOKAr0FNIEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gQW5keSBDaGl1IDxhbmR5LmNoaXVAc2lmaXZlLmNvbT4gd3Jp
dGVzOgo+Cj4gPj4gK3N0YXRpYyBpbmxpbmUgdm9pZCByaXNjdl92X3ZzdGF0ZV9kaXNjYXJkKHN0
cnVjdCBwdF9yZWdzICpyZWdzKQo+ID4+ICt7Cj4gPj4gKyAgICAgICB1bnNpZ25lZCBsb25nIHZs
Owo+ID4+ICsKPiA+PiArICAgICAgIGlmICghcmlzY3Zfdl92c3RhdGVfcXVlcnkocmVncykpCj4g
Pj4gKyAgICAgICAgICAgICAgIHJldHVybjsKPiA+PiArCj4gPj4gKyAgICAgICByaXNjdl92X3Zz
dGF0ZV9vbihyZWdzKTsKPiA+Cj4gPiBEbyB3ZSBuZWVkIHRoaXMgcmlzY3Zfdl92c3RhdGVfb24o
KT8gIElmIGl0IGlzIG5vdCBvbiB3ZSdkIHJldHVybgo+ID4gZWFybHkgaW4gdGhlIHByZXZpb3Vz
ICJpZiIgc3RhdGVtZW50LCByaWdodD8KPgo+IHJpc2N2X3ZfdnN0YXRlX29uKCkganVzdCBzZXQg
dGhlIHN0YXRlIHRvIEluaXRpYWwsIHJpZ2h0PyBPciBkbyB5b3UgbWVhbgo+IHRoYXQgcmlzY3Zf
dl92c3RhdGVfcXVlcnkoKSBpcyB0b28gbXVjaCwgYW5kIHdlIHNob3VsZCBvbmx5IGNoZWNrIGlm
IHRoZQo+IHN0YXRlIGlzIGRpcnR5Pwo+Cj4gPj4gKwo+ID4+ICsgICAgICAgcmlzY3Zfdl9lbmFi
bGUoKTsKPiA+PiArICAgICAgIGFzbSB2b2xhdGlsZSAoCj4gPj4gKyAgICAgICAgICAgICAgICIu
b3B0aW9uIHB1c2hcblx0Igo+ID4+ICsgICAgICAgICAgICAgICAiLm9wdGlvbiBhcmNoLCArdlxu
XHQiCj4gPj4gKyAgICAgICAgICAgICAgICJ2c2V0dmxpICAgICAgICAlMCwgeDAsIGU4LCBtOCwg
dGEsIG1hXG5cdCIKPiA+PiArICAgICAgICAgICAgICAgInZtdi52LmkgICAgICAgIHYwLCAwXG5c
dCIKPiA+PiArICAgICAgICAgICAgICAgInZtdi52LmkgICAgICAgIHY4LCAwXG5cdCIKPiA+PiAr
ICAgICAgICAgICAgICAgInZtdi52LmkgICAgICAgIHYxNiwgMFxuXHQiCj4gPj4gKyAgICAgICAg
ICAgICAgICJ2bXYudi5pICAgICAgICB2MjQsIDBcblx0Igo+ID4+ICsgICAgICAgICAgICAgICAi
Lm9wdGlvbiBwb3Bcblx0Igo+ID4+ICsgICAgICAgICAgICAgICA6ICI9JnIiICh2bCkgOiA6ICJt
ZW1vcnkiKTsKPiA+PiArICAgICAgIHJpc2N2X3ZfZGlzYWJsZSgpOwo+ID4KPiA+IE1heWJlIGNv
bnNpZGVyIGNsZWFuaW5nIHRoZSB2c3RhdGUgKHN0YXR1cy52cykgaGVyZS4gQXMgc3VjaCB3ZSBk
b24ndAo+ID4gaGF2ZSB0byBzYXZlIFYgZHVyaW5nIGNvbnRleHQgc3dpdGNoLgo+Cj4gSXQncyBs
YXRlLCBhbmQgSSdtIHNsb3dlciB0aGFuIHVzdWFsLiBUaGUgcmVncyBhcmUgY2xlYXJlZCwgYW5k
IHRoZQo+IHN0YXRlIGlzIEluaXRpYWwuIE5vIHNhdmUgb24gY29udGV4dCBzd2l0Y2gsIGJ1dCBy
ZXN0b3JlLCByaWdodD8KClllcywgaXQncyBteSBiYWQsIHlvdSBhcmUgcmlnaHQuIEkgc29tZXRp
bWUgbWVzc2VkIGFyb3VuZCB0aGUgInJlYWwiCnN0YXR1cy5WUyB3aXRoIHRoZSBvbmUgaW4gdGhl
IHVzZXJzcGFjZSBjb250ZXh0IDpQCgo+Cj4gPiBPciwgbWF5YmUgd2UgY291bGQgc2V0IHZzdGF0
ZSBhcyBvZmYgZHVyaW5nIHN5c2NhbGwgYW5kIGRpc2NhcmQgVi1yZWcKPiA+ICsgcmVzdG9yZSBz
dGF0dXMuVlMgd2hlbiByZXR1cm5pbmcgYmFjayB0byB1c2Vyc3BhY2U/Cj4KPiBIbW0sIGludGVy
ZXN0aW5nLiBXZSBuZWVkIHRvIHRyYWNrIHRoZSBzdGF0dXMuVlMgdG8gcmVzdG9yZSBzb21ld2hl
cmUuLi4KCk1heWJlIHNvbWV0aGluZyBsaWtlIHRoaXM/CgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS92ZWN0b3IuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmVjdG9yLmgK
aW5kZXggMDRjMGIwN2JmNmNkLi43OWRlOWNhODMzOTEgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vdmVjdG9yLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZWN0b3Iu
aApAQCAtNDMsNiArNDMsMTEgQEAgc3RhdGljIGlubGluZSB2b2lkIHJpc2N2X3ZfdnN0YXRlX29u
KHN0cnVjdCBwdF9yZWdzICpyZWdzKQogCXJlZ3MtPnN0YXR1cyA9IChyZWdzLT5zdGF0dXMgJiB+
U1JfVlMpIHwgU1JfVlNfSU5JVElBTDsKIH0KIAorc3RhdGljIGlubGluZSB2b2lkIHJpc2N2X3Zf
dnN0YXRlX2RpcnR5KHN0cnVjdCBwdF9yZWdzICpyZWdzKQoreworCXJlZ3MtPnN0YXR1cyA9IChy
ZWdzLT5zdGF0dXMgJiB+U1JfVlMpIHwgU1JfVlNfRElSVFk7Cit9CisKIHN0YXRpYyBpbmxpbmUg
Ym9vbCByaXNjdl92X3ZzdGF0ZV9xdWVyeShzdHJ1Y3QgcHRfcmVncyAqcmVncykKIHsKIAlyZXR1
cm4gKHJlZ3MtPnN0YXR1cyAmIFNSX1ZTKSAhPSAwOwpAQCAtMTYzLDYgKzE2OCwyNCBAQCBzdGF0
aWMgaW5saW5lIHZvaWQgX19zd2l0Y2hfdG9fdmVjdG9yKHN0cnVjdCB0YXNrX3N0cnVjdCAqcHJl
diwKIHZvaWQgcmlzY3Zfdl92c3RhdGVfY3RybF9pbml0KHN0cnVjdCB0YXNrX3N0cnVjdCAqdHNr
KTsKIGJvb2wgcmlzY3Zfdl92c3RhdGVfY3RybF91c2VyX2FsbG93ZWQodm9pZCk7CiAKK3N0YXRp
YyBpbmxpbmUgdm9pZCByaXNjdl92X3ZzdGF0ZV9kaXNjYXJkKHN0cnVjdCBwdF9yZWdzICpyZWdz
KQoreworCXVuc2lnbmVkIGxvbmcgdmw7CisKKwlyaXNjdl92X2VuYWJsZSgpOworCWFzbSB2b2xh
dGlsZSAoCisJCQkiLm9wdGlvbiBwdXNoXG5cdCIKKwkJCSIub3B0aW9uIGFyY2gsICt2XG5cdCIK
KwkJCSJ2c2V0dmxpICAgICAgICAlMCwgeDAsIGU4LCBtOCwgdGEsIG1hXG5cdCIKKwkJCSJ2bXYu
di5pICAgICAgICB2MCwgMFxuXHQiCisJCQkidm12LnYuaSAgICAgICAgdjgsIDBcblx0IgorCQkJ
InZtdi52LmkgICAgICAgIHYxNiwgMFxuXHQiCisJCQkidm12LnYuaSAgICAgICAgdjI0LCAwXG5c
dCIKKwkJCSIub3B0aW9uIHBvcFxuXHQiCisJCQk6ICI9JnIiICh2bCkgOiA6ICJtZW1vcnkiKTsK
KwlyaXNjdl92X2Rpc2FibGUoKTsKK30KKwogI2Vsc2UgLyogISBDT05GSUdfUklTQ1ZfSVNBX1Yg
ICovCiAKIHN0cnVjdCBwdF9yZWdzOwpAQCAtMTc4LDYgKzIwMSw4IEBAIHN0YXRpYyBpbmxpbmUg
Ym9vbCByaXNjdl92X3ZzdGF0ZV9jdHJsX3VzZXJfYWxsb3dlZCh2b2lkKSB7IHJldHVybiBmYWxz
ZTsgfQogI2RlZmluZSBfX3N3aXRjaF90b192ZWN0b3IoX19wcmV2LCBfX25leHQpCWRvIHt9IHdo
aWxlICgwKQogI2RlZmluZSByaXNjdl92X3ZzdGF0ZV9vZmYocmVncykJCWRvIHt9IHdoaWxlICgw
KQogI2RlZmluZSByaXNjdl92X3ZzdGF0ZV9vbihyZWdzKQkJCWRvIHt9IHdoaWxlICgwKQorI2Rl
ZmluZSByaXNjdl92X3ZzdGF0ZV9kaXJ0eShyZWdzKQkJZG8ge30gd2hpbGUgKDApCisjZGVmaW5l
IHJpc2N2X3ZfdnN0YXRlX2Rpc2NhcmQocmVncykJCWRvIHt9IHdoaWxlICgwKQogCiAjZW5kaWYg
LyogQ09ORklHX1JJU0NWX0lTQV9WICovCiAKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVs
L3RyYXBzLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCmluZGV4IDI0ZDMwOWM2YWI4ZC4u
ZTM2YjY5YzliMDdmIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCisrKyBi
L2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKQEAgLTI5MSwxMCArMjkxLDE0IEBAIGFzbWxpbmth
Z2UgX192aXNpYmxlIF9fdHJhcF9zZWN0aW9uIHZvaWQgZG9fdHJhcF9lY2FsbF91KHN0cnVjdCBw
dF9yZWdzICpyZWdzKQogewogCWlmICh1c2VyX21vZGUocmVncykpIHsKIAkJdWxvbmcgc3lzY2Fs
bCA9IHJlZ3MtPmE3OworCQlib29sIHZfaXNfb247CiAKIAkJcmVncy0+ZXBjICs9IDQ7CiAJCXJl
Z3MtPm9yaWdfYTAgPSByZWdzLT5hMDsKIAorCQl2X2lzX29uID0gcmlzY3Zfdl92c3RhdGVfcXVl
cnkocmVncyk7CisJCXJpc2N2X3ZfdnN0YXRlX29mZihyZWdzKTsKKwogCQlzeXNjYWxsID0gc3lz
Y2FsbF9lbnRlcl9mcm9tX3VzZXJfbW9kZShyZWdzLCBzeXNjYWxsKTsKIAogCQlpZiAoc3lzY2Fs
bCA8IE5SX3N5c2NhbGxzKQpAQCAtMzAzLDYgKzMwNywxMCBAQCBhc21saW5rYWdlIF9fdmlzaWJs
ZSBfX3RyYXBfc2VjdGlvbiB2b2lkIGRvX3RyYXBfZWNhbGxfdShzdHJ1Y3QgcHRfcmVncyAqcmVn
cykKIAkJCXJlZ3MtPmEwID0gLUVOT1NZUzsKIAogCQlzeXNjYWxsX2V4aXRfdG9fdXNlcl9tb2Rl
KHJlZ3MpOworCQlpZiAodl9pc19vbikgeworCQkJcmlzY3Zfdl92c3RhdGVfZGlzY2FyZChyZWdz
KTsKKwkJCXJpc2N2X3ZfdnN0YXRlX2RpcnR5KHJlZ3MpOworCQl9CiAJfSBlbHNlIHsKIAkJaXJx
ZW50cnlfc3RhdGVfdCBzdGF0ZSA9IGlycWVudHJ5X25taV9lbnRlcihyZWdzKTsKIAo+Cj4KPiBC
asO2cm4KClRoYW5rcywKQW5keQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
