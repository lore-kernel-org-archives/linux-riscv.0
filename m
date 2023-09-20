Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F134CE79A9
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 00:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IFn0UJ8888frgCXXGqISl1pbCZQel+fuCiey64y5/ik=; b=YNF4Bkys8Xn0PU
	d8IxloOY7u7NdZqdg0qpe55S0+kn6nk+giRAPUc1kpXkKmdmUDOegcWF5mCT2/aag1Er/JszJSymG
	AdhM82K9ItXlrpxA2c2WQpow7SMUnJueGaEECJkor9rKUp3E2MhgB7uTORTuQSDHozcG2BTjnYdTS
	D7hcJOwRGT/9pY274zVKDB6bfwE0IKgTb7ulsPUN3RKPRCGoEj+wfAR8+XbeNdIlBOfODWdTc292Q
	L+b0VlkhlF04pbxYdUyrQsJlWZLJXfzL4Y14SIbS667Uk1fVRBbCfdqzXazWJcpCrj/fhBUZohzw2
	8Di2sLvC6LSOtY52kywQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qikwb-001VZg-2x;
	Wed, 20 Sep 2023 00:19:53 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qikwY-001VYk-10
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 00:19:51 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-50308217223so5605380e87.3
        for <linux-riscv@lists.infradead.org>; Tue, 19 Sep 2023 17:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1695169185; x=1695773985; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kJ4mXuVIJcPrYgZpolnkEKTjROnXJTN+OmYwBkYq8uA=;
        b=GdWK6WB183NARendL0+45HDDkjhGXuTBsviMT45DBKGAAfOg16N7NYFfdHPKZ77cW4
         UgsXcofKVhJ3L51Iy87EXOiXzJIiB81KhOf/PnLXTpLfrJ98bapoVJGZcpbQHEfd/Uqk
         btlk+c8NLxzOIqX6tj69ksI96q1ZFQbr7klCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695169185; x=1695773985;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kJ4mXuVIJcPrYgZpolnkEKTjROnXJTN+OmYwBkYq8uA=;
        b=o9PM3ZhrfU0w/aXluZqW7XTBVFloZAtP6GMwy2U8junGUnLcAnitZAuTs54PqITvIE
         GqkQf2cGNloetvv6Kn/wg+XCBjJQyJbbU7w5F5+U7e60UPnA0QIgZL7chBy5BZgEcCNs
         HsXrc0wyDnc0tDvA4avGCJu2Zpjfi1IpTNdsqjDE7CsOleOKuT9MoztvoIhyAj8qz8vL
         rz2r7pHdc3ywARWGxZXpHpKx/HlM7BBcRt10BkcX82g2kKhJDDW9mENx1Fa98jpNJZAj
         lKwczuo9UwxAR5d3AXm1ZJzMH2Z9/mthCSQg9XnqnjKJ40YNbGrkRh61nDLJpVxfGjKC
         2etQ==
X-Gm-Message-State: AOJu0YycrKXA4kK+XHX5rac7q5GCg28ibmVMBILS3k5VNZrXaKVv2Pkn
	rJ+XchR2rGanY+Wvm40hcecfX1JL32+8/GS5asLb
X-Google-Smtp-Source: AGHT+IEpUPTF3j7A1L7I2qDVT0o7NVOf4rvfF+ax99OrxxyusJ79xBsaXVhrYj5sQlBYb0CBvAjXQzBPk8dwZHINET8=
X-Received: by 2002:a19:7716:0:b0:503:1875:5ae5 with SMTP id
 s22-20020a197716000000b0050318755ae5mr840402lfc.38.1695169185184; Tue, 19 Sep
 2023 17:19:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230912174928.528414-1-apatel@ventanamicro.com> <20230912174928.528414-3-apatel@ventanamicro.com>
In-Reply-To: <20230912174928.528414-3-apatel@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 19 Sep 2023 17:19:32 -0700
Message-ID: <CAOnJCUK3M4AfLeg1J5AvRt_P413kU-EPNzt1sQ8B9iubOsS_yQ@mail.gmail.com>
Subject: Re: [PATCH v8 02/16] RISC-V: Add riscv_get_intc_hartid() function
To: Anup Patel <apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_171950_377882_A70CB5D1 
X-CRM114-Status: GOOD (  24.57  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Frank Rowand <frowand.list@gmail.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBTZXAgMTIsIDIwMjMgYXQgMTA6NTDigK9BTSBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVu
dGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiBXZSBhZGQgYSBjb21tb24gcmlzY3ZfZ2V0X2ludGNf
aGFydGlkKCkgd2hpY2ggaGVscCBkZXZpY2UgZHJpdmVycyB0bwo+IGdldCBoYXJ0aWQgb2YgdGhl
IEhBUlQgYXNzb2NpYXRlZCB3aXRoIGEgSU5UQyAoaS5lLiBsb2NhbCBpbnRlcnJ1cHQKPiBjb250
cm9sbGVyKSBmd25vZGUuIFRoaXMgbmV3IGZ1bmN0aW9uIGlzIG1vcmUgZ2VuZXJpYyBjb21wYXJl
ZCB0bwo+IHRoZSBleGlzdGluZyByaXNjdl9vZl9wYXJlbnRfaGFydGlkKCkgZnVuY3Rpb24gaGVu
Y2Ugd2UgYWxzbyByZXBsYWNlCj4gdXNlIG9mIHJpc2N2X29mX3BhcmVudF9oYXJ0aWQoKSB3aXRo
IHJpc2N2X2dldF9pbnRjX2hhcnRpZCgpLgo+Cj4gU2lnbmVkLW9mZi1ieTogQW51cCBQYXRlbCA8
YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+Cj4gLS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20v
cHJvY2Vzc29yLmggfCAgNCArKystCj4gIGFyY2gvcmlzY3Yva2VybmVsL2NwdS5jICAgICAgICAg
ICAgfCAxMyArKysrKysrKysrKystCj4gIGRyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW50Yy5j
ICAgfCAgMiArLQo+ICBkcml2ZXJzL2lycWNoaXAvaXJxLXNpZml2ZS1wbGljLmMgIHwgIDMgKyst
Cj4gIDQgZmlsZXMgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPgo+
IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oIGIvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaAo+IGluZGV4IDNlMjNlMTc4NmQwNS4uM2NlNjRi
M2JlYTRlIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcHJvY2Vzc29yLmgK
PiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oCj4gQEAgLTExOSw3ICsx
MTksOSBAQCBzdGF0aWMgaW5saW5lIHZvaWQgd2FpdF9mb3JfaW50ZXJydXB0KHZvaWQpCj4gIHN0
cnVjdCBkZXZpY2Vfbm9kZTsKPiAgaW50IHJpc2N2X29mX3Byb2Nlc3Nvcl9oYXJ0aWQoc3RydWN0
IGRldmljZV9ub2RlICpub2RlLCB1bnNpZ25lZCBsb25nICpoYXJ0aWQpOwo+ICBpbnQgcmlzY3Zf
ZWFybHlfb2ZfcHJvY2Vzc29yX2hhcnRpZChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUsIHVuc2ln
bmVkIGxvbmcgKmhhcnRpZCk7Cj4gLWludCByaXNjdl9vZl9wYXJlbnRfaGFydGlkKHN0cnVjdCBk
ZXZpY2Vfbm9kZSAqbm9kZSwgdW5zaWduZWQgbG9uZyAqaGFydGlkKTsKPiArCj4gK3N0cnVjdCBm
d25vZGVfaGFuZGxlOwo+ICtpbnQgcmlzY3ZfZ2V0X2ludGNfaGFydGlkKHN0cnVjdCBmd25vZGVf
aGFuZGxlICpub2RlLCB1bnNpZ25lZCBsb25nICpoYXJ0aWQpOwo+Cj4gIGV4dGVybiB2b2lkIHJp
c2N2X2ZpbGxfaHdjYXAodm9pZCk7Cj4gIGV4dGVybiBpbnQgYXJjaF9kdXBfdGFza19zdHJ1Y3Qo
c3RydWN0IHRhc2tfc3RydWN0ICpkc3QsIHN0cnVjdCB0YXNrX3N0cnVjdCAqc3JjKTsKPiBkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1LmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHUu
Ywo+IGluZGV4IDE1N2FjZThiMjYyYy4uZWU1ODNlYWMzYzViIDEwMDY0NAo+IC0tLSBhL2FyY2gv
cmlzY3Yva2VybmVsL2NwdS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1LmMKPiBAQCAt
MTIzLDcgKzEyMyw4IEBAIGludCBfX2luaXQgcmlzY3ZfZWFybHlfb2ZfcHJvY2Vzc29yX2hhcnRp
ZChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUsIHVuc2lnbmVkIGxvCj4gICAqIFRvIGFjaGlldmUg
dGhpcywgd2Ugd2FsayB1cCB0aGUgRFQgdHJlZSB1bnRpbCB3ZSBmaW5kIGFuIGFjdGl2ZQo+ICAg
KiBSSVNDLVYgY29yZSAoSEFSVCkgbm9kZSBhbmQgZXh0cmFjdCB0aGUgY3B1aWQgZnJvbSBpdC4K
PiAgICovCj4gLWludCByaXNjdl9vZl9wYXJlbnRfaGFydGlkKHN0cnVjdCBkZXZpY2Vfbm9kZSAq
bm9kZSwgdW5zaWduZWQgbG9uZyAqaGFydGlkKQo+ICtzdGF0aWMgaW50IHJpc2N2X29mX3BhcmVu
dF9oYXJ0aWQoc3RydWN0IGRldmljZV9ub2RlICpub2RlLAo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nICpoYXJ0aWQpCj4gIHsKPiAgICAgICAgIGZvciAo
OyBub2RlOyBub2RlID0gbm9kZS0+cGFyZW50KSB7Cj4gICAgICAgICAgICAgICAgIGlmIChvZl9k
ZXZpY2VfaXNfY29tcGF0aWJsZShub2RlLCAicmlzY3YiKSkgewo+IEBAIC0xMzksNiArMTQwLDE2
IEBAIGludCByaXNjdl9vZl9wYXJlbnRfaGFydGlkKHN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSwg
dW5zaWduZWQgbG9uZyAqaGFydGlkKQo+ICAgICAgICAgcmV0dXJuIC0xOwo+ICB9Cj4KPiArLyog
RmluZCBoYXJ0IElEIG9mIHRoZSBJTlRDIGZ3bm9kZS4gKi8KPiAraW50IHJpc2N2X2dldF9pbnRj
X2hhcnRpZChzdHJ1Y3QgZndub2RlX2hhbmRsZSAqbm9kZSwgdW5zaWduZWQgbG9uZyAqaGFydGlk
KQo+ICt7Cj4gKyAgICAgICAvKiBFeHRlbmQgdGhpcyBmdW5jdGlvbiBBQ1BJIGluIHRoZSBmdXR1
cmUuICovCj4gKyAgICAgICBpZiAoIWlzX29mX25vZGUobm9kZSkpCj4gKyAgICAgICAgICAgICAg
IHJldHVybiAtRU5PREVWOwo+ICsKPiArICAgICAgIHJldHVybiByaXNjdl9vZl9wYXJlbnRfaGFy
dGlkKHRvX29mX25vZGUobm9kZSksIGhhcnRpZCk7Cj4gK30KPiArCj4gIERFRklORV9QRVJfQ1BV
KHN0cnVjdCByaXNjdl9jcHVpbmZvLCByaXNjdl9jcHVpbmZvKTsKPgo+ICB1bnNpZ25lZCBsb25n
IHJpc2N2X2NhY2hlZF9tdmVuZG9yaWQodW5zaWduZWQgaW50IGNwdV9pZCkKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbnRjLmMgYi9kcml2ZXJzL2lycWNoaXAvaXJx
LXJpc2N2LWludGMuYwo+IGluZGV4IDRhZGVlZTFiYzM5MS4uNjVmNGEyYWZiMzgxIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW50Yy5jCj4gKysrIGIvZHJpdmVycy9p
cnFjaGlwL2lycS1yaXNjdi1pbnRjLmMKPiBAQCAtMTQzLDcgKzE0Myw3IEBAIHN0YXRpYyBpbnQg
X19pbml0IHJpc2N2X2ludGNfaW5pdChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUsCj4gICAgICAg
ICBpbnQgcmM7Cj4gICAgICAgICB1bnNpZ25lZCBsb25nIGhhcnRpZDsKPgo+IC0gICAgICAgcmMg
PSByaXNjdl9vZl9wYXJlbnRfaGFydGlkKG5vZGUsICZoYXJ0aWQpOwo+ICsgICAgICAgcmMgPSBy
aXNjdl9nZXRfaW50Y19oYXJ0aWQob2ZfZndub2RlX2hhbmRsZShub2RlKSwgJmhhcnRpZCk7Cj4g
ICAgICAgICBpZiAocmMgPCAwKSB7Cj4gICAgICAgICAgICAgICAgIHByX3dhcm4oInVuYWJsZSB0
byBmaW5kIGhhcnQgaWQgZm9yICVwT0ZcbiIsIG5vZGUpOwo+ICAgICAgICAgICAgICAgICByZXR1
cm4gMDsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pcnFjaGlwL2lycS1zaWZpdmUtcGxpYy5jIGIv
ZHJpdmVycy9pcnFjaGlwL2lycS1zaWZpdmUtcGxpYy5jCj4gaW5kZXggZTE0ODQ5MDViN2JkLi41
NmIwNTQ0YjFmMjcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9pcnFjaGlwL2lycS1zaWZpdmUtcGxp
Yy5jCj4gKysrIGIvZHJpdmVycy9pcnFjaGlwL2lycS1zaWZpdmUtcGxpYy5jCj4gQEAgLTQ3Nyw3
ICs0NzcsOCBAQCBzdGF0aWMgaW50IF9faW5pdCBfX3BsaWNfaW5pdChzdHJ1Y3QgZGV2aWNlX25v
ZGUgKm5vZGUsCj4gICAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4gICAgICAgICAg
ICAgICAgIH0KPgo+IC0gICAgICAgICAgICAgICBlcnJvciA9IHJpc2N2X29mX3BhcmVudF9oYXJ0
aWQocGFyZW50Lm5wLCAmaGFydGlkKTsKPiArICAgICAgICAgICAgICAgZXJyb3IgPSByaXNjdl9n
ZXRfaW50Y19oYXJ0aWQob2ZfZndub2RlX2hhbmRsZShwYXJlbnQubnApLAo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmaGFydGlkKTsKPiAgICAgICAgICAg
ICAgICAgaWYgKGVycm9yIDwgMCkgewo+ICAgICAgICAgICAgICAgICAgICAgICAgIHByX3dhcm4o
ImZhaWxlZCB0byBwYXJzZSBoYXJ0IElEIGZvciBjb250ZXh0ICVkLlxuIiwgaSk7Cj4gICAgICAg
ICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4gLS0KPiAyLjM0LjEKPgoKClJldmlld2VkLWJ5
OiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNvbT4KLS0gClJlZ2FyZHMsCkF0aXNoCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
