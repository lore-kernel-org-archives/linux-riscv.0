Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB708C4345F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 May 2024 04:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MOwUDMAV93m2jftN2RNv9r5gRls4dXcz3eUSuO4NeX4=; b=UCkT5toJuvIEin
	4AfiwU3pBBk1Cxl42FFqo/nTyVRaeBFor8Aunpty53/wBx5Maqe6bCgu6bEYvcgBZebVAHNmOfdV3
	9JBDhMKYYKwxQMIloR+fs7JplNYFnP74/8BinBxCrpDBiU8H9MyP0UO5jfgoMiMdgEhoECdLA1w0Z
	OcsemdsqXPj9cArs5ODPd8CV8b4GUPI1zdY1uRANRivBaB2i4V+Oa4SJtvtAua8FOIAQua0aTNGuq
	KaSf/G+PkpkB2W1lN5swwT0GPjbEIRzDtzFR1gTeBDIOhg8uMdg3SYfiYiDJswVYOcQO/5/p2JP09
	FpMEA89wtVfr5bnFKXtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2OES-0000000BRP6-2V5D;
	Thu, 02 May 2024 04:39:45 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2OEP-0000000BROd-0kx9
	for linux-riscv@lists.infradead.org;
	Thu, 02 May 2024 04:39:42 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-53fa455cd94so5788039a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 01 May 2024 21:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714624779; x=1715229579; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dYwMNtU5ISKi/pHw0Eotzjxo72T7kdIEeid7s5bFFZU=;
        b=pvwskxrR06pzl5KQ0wL4ApAHHbIQed6pCATNkbX5qA/kgC6jJ3TLKXYmIlKYyr7y6N
         ReOuDIoK2duuMofIPMfG3voEoBzgdWKY5Prthzz7PUsqReOH8rNQ9GpltEUlkTpJpuuh
         K1QdIcDG3bHa6pve5IeDEQCG3ouo+LHG01hsG7OZON+7jZkeuuwXXKtrJX94/Pe569d3
         a0kKbZVMD1V4mBA4h+qnPo2jjF8wFoY5YLeI7GI+g9xQ3tbSyrYtXeOptEugv4uANZIr
         GY0KLv5svSvi/zUcv/NLRf/Svvyf5OsR00GnlAS1nMCM1awW2A9oqvXpjM/W869wbTKW
         M+1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714624779; x=1715229579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dYwMNtU5ISKi/pHw0Eotzjxo72T7kdIEeid7s5bFFZU=;
        b=LU370NjNUeHPJumTFmpHLXmRlvv1+ie5QZt+WXTePybcCVO4dRb+hiHK8rziQicti9
         wjBZeGYYDGIxlwt01Qj/YK/b6Emv1QVduiRySi+hbc5RiXcKVGeGMk24VyNaGvDX8bsV
         bAuGrvdSXqjFQBEnIjhkTvpa5wlZGYLcev+FtHkh3aUJnmsLq6iNlw1/y5WrJQ+5wWk4
         +MdOoGR5i3n41Vf5fwr8V8joRQK82/A3sd5GY9aUnQ/vEuSrActjHJSog53Q6ZfWsC88
         PRGilBmZlrApqHcV7rgX418OQ4gyiUM9YLkl48JvuMiWGLQ8QLsojyDX9kHS32XgUk/X
         GaWA==
X-Forwarded-Encrypted: i=1; AJvYcCWZP5VHaVUAJBE6hAO8035pvoXKLVo+Gz8Ckq0Nfnyw60Xf26yWThgclGTt/+Q1weJWrwv53RcBtFoEqmNK7rY5F2DoZkxzuKfdFlQ/V0Q6
X-Gm-Message-State: AOJu0YzR5KLhZEw/yVno0Ex/kHo81iHEQ1KsmW4YPfYvTM41pKmPuNGi
	wsIPQnJvKdJNynd5DFvslFAO2aaaJ8lcQ0OcPWQ1hrRGZi46QlJxym6m9zug4MxtdyX1fy9sGv/
	zNfB4+FPkqEyNQWe3xbuFYVWPSIbq/dnH7cBZBA==
X-Google-Smtp-Source: AGHT+IFGOZPSbOG+7q08BpoKEAwkSMY5N4r9BG/M6xWabJ6xt9Bfuyl68UiysrvQmviAyEuWdMP6+zF6WYqEShpC7Aw=
X-Received: by 2002:a05:6a21:150b:b0:1a9:a31a:1b67 with SMTP id
 nq11-20020a056a21150b00b001a9a31a1b67mr1221119pzb.47.1714624779299; Wed, 01
 May 2024 21:39:39 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1714494653.git.tjeznach@rivosinc.com> <b83f81c04d1f3885d860b1eec03761fe63a33183.1714494653.git.tjeznach@rivosinc.com>
 <7c3fc511-6a3b-44d8-94fa-e4fff54f93b9@linux.intel.com>
In-Reply-To: <7c3fc511-6a3b-44d8-94fa-e4fff54f93b9@linux.intel.com>
From: Tomasz Jeznach <tjeznach@rivosinc.com>
Date: Wed, 1 May 2024 21:39:28 -0700
Message-ID: <CAH2o1u6Vh55E=jn7ytp7s6VSQaZ+BqKLY1adz2AA0=OsLm21dw@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] iommu/riscv: Paging domain support
To: Baolu Lu <baolu.lu@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_213941_435408_4BB2298C 
X-CRM114-Status: GOOD (  21.12  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Nick Kossifidis <mick@ics.forth.gr>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBNYXkgMSwgMjAyNCBhdCA4OjUy4oCvUE0gQmFvbHUgTHUgPGJhb2x1Lmx1QGxpbnV4
LmludGVsLmNvbT4gd3JvdGU6Cj4KPiBPbiA1LzEvMjQgNDowMSBBTSwgVG9tYXN6IEplem5hY2gg
d3JvdGU6Cj4gPiArLyoKPiA+ICsgKiBTZW5kIElPVExCLklOVkFMIGZvciB3aG9sZSBhZGRyZXNz
IHNwYWNlIGZvciByYW5nZXMgbGFyZ2VyIHRoYW4gMk1CLgo+ID4gKyAqIFRoaXMgbGltaXQgd2ls
bCBiZSByZXBsYWNlZCB3aXRoIHJhbmdlIGludmFsaWRhdGlvbnMsIGlmIHN1cHBvcnRlZCBieQo+
ID4gKyAqIHRoZSBoYXJkd2FyZSwgd2hlbiBSSVNDLVYgSU9NTVUgYXJjaGl0ZWN0dXJlIHNwZWNp
ZmljYXRpb24gdXBkYXRlIGZvcgo+ID4gKyAqIHJhbmdlIGludmFsaWRhdGlvbnMgdXBkYXRlIHdp
bGwgYmUgYXZhaWxhYmxlLgo+ID4gKyAqLwo+ID4gKyNkZWZpbmUgUklTQ1ZfSU9NTVVfSU9UTEJf
SU5WQUxfTElNSVQgICAgICAgICgyIDw8IDIwKQo+ID4gKwo+ID4gK3N0YXRpYyB2b2lkIHJpc2N2
X2lvbW11X2lvdGxiX2ludmFsKHN0cnVjdCByaXNjdl9pb21tdV9kb21haW4gKmRvbWFpbiwKPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIHN0YXJ0LCB1
bnNpZ25lZCBsb25nIGVuZCkKPiA+ICt7Cj4gPiArICAgICBzdHJ1Y3QgcmlzY3ZfaW9tbXVfYm9u
ZCAqYm9uZDsKPiA+ICsgICAgIHN0cnVjdCByaXNjdl9pb21tdV9kZXZpY2UgKmlvbW11LCAqcHJl
djsKPiA+ICsgICAgIHN0cnVjdCByaXNjdl9pb21tdV9jb21tYW5kIGNtZDsKPiA+ICsgICAgIHVu
c2lnbmVkIGxvbmcgbGVuID0gZW5kIC0gc3RhcnQgKyAxOwo+ID4gKyAgICAgdW5zaWduZWQgbG9u
ZyBpb3ZhOwo+ID4gKwo+ID4gKyAgICAgcmN1X3JlYWRfbG9jaygpOwo+ID4gKwo+ID4gKyAgICAg
cHJldiA9IE5VTEw7Cj4gPiArICAgICBsaXN0X2Zvcl9lYWNoX2VudHJ5X3JjdShib25kLCAmZG9t
YWluLT5ib25kcywgbGlzdCkgewo+ID4gKyAgICAgICAgICAgICBpb21tdSA9IGRldl90b19pb21t
dShib25kLT5kZXYpOwo+ID4gKwo+ID4gKyAgICAgICAgICAgICByaXNjdl9pb21tdV9jbWRfaW52
YWxfdm1hKCZjbWQpOwo+ID4gKyAgICAgICAgICAgICByaXNjdl9pb21tdV9jbWRfaW52YWxfc2V0
X3BzY2lkKCZjbWQsIGRvbWFpbi0+cHNjaWQpOwo+ID4gKyAgICAgICAgICAgICBpZiAobGVuICYm
IGxlbiA+PSBSSVNDVl9JT01NVV9JT1RMQl9JTlZBTF9MSU1JVCkgewo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgIGZvciAoaW92YSA9IHN0YXJ0OyBpb3ZhIDwgZW5kOyBpb3ZhICs9IFBBR0VfU0la
RSkgewo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmlzY3ZfaW9tbXVfY21kX2lu
dmFsX3NldF9hZGRyKCZjbWQsIGlvdmEpOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcmlzY3ZfaW9tbXVfY21kX3NlbmQoaW9tbXUsICZjbWQsIDApOwo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgIH0KPiA+ICsgICAgICAgICAgICAgfSBlbHNlIHsKPiA+ICsgICAgICAgICAgICAg
ICAgICAgICByaXNjdl9pb21tdV9jbWRfc2VuZChpb21tdSwgJmNtZCwgMCk7Cj4gPiArICAgICAg
ICAgICAgIH0KPiA+ICsKPiA+ICsgICAgICAgICAgICAgLyoKPiA+ICsgICAgICAgICAgICAgICog
SU9UTEIgaW52YWxpZGF0aW9uIHJlcXVlc3QgY2FuIGJlIHNhZmVseSBvbWl0dGVkIGlmIGFscmVh
ZHkgc2VudAo+ID4gKyAgICAgICAgICAgICAgKiB0byB0aGUgSU9NTVUgZm9yIHRoZSBzYW1lIFBT
Q0lELCBhbmQgd2l0aCBkb21haW4tPmJvbmRzIGxpc3QKPiA+ICsgICAgICAgICAgICAgICogYXJy
YW5nZWQgYmFzZWQgb24gdGhlIGRldmljZSdzIElPTU1VLCBpdCdzIHN1ZmZpY2llbnQgdG8gY2hl
Y2sKPiA+ICsgICAgICAgICAgICAgICogbGFzdCBkZXZpY2UgdGhlIGludmFsaWRhdGlvbiB3YXMg
c2VudCB0by4KPiA+ICsgICAgICAgICAgICAgICovCj4gPiArICAgICAgICAgICAgIGlmIChpb21t
dSA9PSBwcmV2KQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+ID4gKwo+ID4g
KyAgICAgICAgICAgICBwcmV2ID0gaW9tbXU7Cj4gPiArICAgICAgICAgICAgIHJpc2N2X2lvbW11
X2NtZF9zZW5kKGlvbW11LCAmY21kLCAwKTsKPiA+ICsgICAgIH0KPgo+IEkgZG9uJ3QgcXVpdGUg
Zm9sbG93IHdoeSBub3QgbW92aW5nICJpZiAoaW9tbXUgPT0gcHJldikiIGNoZWNrIHRvIHRoZQo+
IHRvcCBhbmQgcmVtb3ZpbmcgdGhlIGxhc3QgcmlzY3ZfaW9tbXVfY21kX3NlbmQoKS4gTXkgdW5k
ZXJzdGFuZGluZyBpcwo+IHRoYXQgd2UgY291bGQgbWFrZSBpdCBzaW1wbHkgbGlrZSBiZWxvdzoK
Pgo+ICAgICAgICAgcHJldiA9IE5VTEw7Cj4gICAgICAgICBsaXN0X2Zvcl9lYWNoX2VudHJ5X3Jj
dShib25kLCAmZG9tYWluLT5ib25kcywgbGlzdCkgewo+ICAgICAgICAgICAgICAgICBpb21tdSA9
IGRldl90b19pb21tdShib25kLT5kZXYpOwo+ICAgICAgICAgICAgICAgICBpZiAoaW9tbXUgPT0g
cHJldikKPiAgICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPgo+ICAgICAgICAgICAg
ICAgICAvKgo+ICAgICAgICAgICAgICAgICAgKiBTZW5kIGFuIGludmFsaWRhdGlvbiByZXF1ZXN0
IHRvIHRoZSByZXF1ZXN0IHF1ZXVlCj4gICAgICAgICAgICAgICAgICAqIHdpdGhvdXQgd2FpdC4K
PiAgICAgICAgICAgICAgICAgICovCj4gICAgICAgICAgICAgICAgIC4uLiAuLi4KPgo+ICAgICAg
ICAgICAgICAgICBwcmV2ID0gaW9tbXU7Cj4gICAgICAgICB9Cj4KCk9oLiBUaGFua3MgZm9yIHNw
b3R0aW5nIHRoYXQuCkNvZGUgc2VjdGlvbiByZW9yZGVyZWQgdmVyeSBsaWtlbHkgZHVyaW5nIHJl
YmFzaW5nIHBhdGNoZXMuLi4KCj4gPiArCj4gPiArICAgICBwcmV2ID0gTlVMTDsKPiA+ICsgICAg
IGxpc3RfZm9yX2VhY2hfZW50cnlfcmN1KGJvbmQsICZkb21haW4tPmJvbmRzLCBsaXN0KSB7Cj4g
PiArICAgICAgICAgICAgIGlvbW11ID0gZGV2X3RvX2lvbW11KGJvbmQtPmRldik7Cj4gPiArICAg
ICAgICAgICAgIGlmIChpb21tdSA9PSBwcmV2KQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGNv
bnRpbnVlOwo+ID4gKwo+ID4gKyAgICAgICAgICAgICBwcmV2ID0gaW9tbXU7Cj4gPiArICAgICAg
ICAgICAgIHJpc2N2X2lvbW11X2NtZF9pb2ZlbmNlKCZjbWQpOwo+ID4gKyAgICAgICAgICAgICBy
aXNjdl9pb21tdV9jbWRfc2VuZChpb21tdSwgJmNtZCwgUklTQ1ZfSU9NTVVfUVVFVUVfVElNRU9V
VCk7Cj4gPiArICAgICB9Cj4gPiArICAgICByY3VfcmVhZF91bmxvY2soKTsKPiA+ICt9Cj4KPiBC
ZXN0IHJlZ2FyZHMsCj4gYmFvbHUKCkJlc3QgcmVnYXJkcywKLSBUb21hc3oKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
