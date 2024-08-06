Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7186C52D70
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Aug 2024 15:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m0wWdmWdZmT+nWd9yMlJiw47h4eP7BDbG2ILu+sib4o=; b=LHhJWM1wDdMXwT
	xUetnp+NuSRmoN+ZtjRn1BssjQHJCt7LIIXWmY3xdYLP4fV8DessPfgoL8SdCbYzAXDU9Z5Otzlbx
	9oFYdIa/z0lbx9rCwBjSryOWQv3bVl30zrpDC8Vuj29uLEtsIvJmMiP11U0Bj690xdjQmJs+lrUhT
	UaTyAVDv/Z5Q/48RHs4gsPjJyD5y0SS/QJJqdh15kxF/8++HNHtBpxFXKWmyH46azLR+zgX9lkyUx
	+LsZ6Y+tvz64wKjWG/ECW7XzSC45wnZscvIgJILMnE+Dbey68/0LnJmflAKLlzltz0O/OPExNTNAz
	6skbMXDs2NAenSlWOpTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbLlN-000000027pU-3cg4;
	Tue, 06 Aug 2024 15:06:13 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbLjl-0000000278P-10aS
	for linux-riscv@lists.infradead.org;
	Tue, 06 Aug 2024 15:04:35 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-39b04f0b486so2257555ab.0
        for <linux-riscv@lists.infradead.org>; Tue, 06 Aug 2024 08:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1722956672; x=1723561472; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uLbAu/3JQVhbekGE1m18EyrvzfniM5U0p+PtTw3SPlQ=;
        b=ognfd/kGD2TGmT48H+yBHV3uSoj/boVLmGAXOl7Tm7Mlz514Ga13S9GrKhI8lnB0LL
         kmSHSIxZsk80Nu2zd75pK1QYw3TGnGl9J1/PsYudJgaxz4rRK7XkYUc9Bxw+fpOzaRgH
         olwfL6qmODNXWphKeGg+DpA/WCmmuVjeQYftjJGpjoGsucWu6Q8721vdXDOOAYN0i+yR
         Nmx7EDi3AnWbkxPr8fPWYF/Sj/L4D2O7uupaLmhPscqOwu8dgQiaowOrcMjX6JxnHm8e
         QgmqGYa4pZVDNHswVPkjrtLisDs2aoAooDQkTWrm1NfpGhHblln1Ebl4ZpjJY91l3SBk
         sbrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722956672; x=1723561472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uLbAu/3JQVhbekGE1m18EyrvzfniM5U0p+PtTw3SPlQ=;
        b=iKPA703UHIQzPvW1wzVrKxR4QYcCnoKOSGTyUEg0NHykstZFRjmP9+f6ogGWUHU3Tf
         5s5pcWmfITQmopanonie8DPC1CHfAG02pV6Dx4YwYXMWFoTCJAEjHoYMbVcUj5sf2cZH
         hmMHghktLcDzRg/kkDl6ONYpDjNaKLvBogKXOSkZGPIRzLX6GfeBYoVSnXW9Cm7W+ngq
         NKsW0zUO2kOZlvTnQTguKAqOEkPDtPFx5psbo6DeC63/i+n2wlqeOttlD6/vsT2kqnMg
         OU3FQtD17s2l7VHXVC3QHk9vmyiT9ZPcmOZfCO+TK+wl0AKpr/LWQHsCau2qWMBQwu5S
         t7hQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0YntaqBSno/SqkqcdE56kfqTru0GQARnCVXBCpt+UEZmbY+x4s4Qrxo1yjsm1ShbDoCICqLSNzs+tFD8pqrSPEw/2Wk70en7kDRE2h0Ty
X-Gm-Message-State: AOJu0YyL5s339wEZwmZQVGpEx/hNZ4AeKNghJZbol3ilQEJFuh5+7Prt
	l82S/GktkcdMyhJE1/kPJ6CT9tlbY9P7a/BQobEiqwcowNbnSokphTx2SNlivGcfnsZ/6QsY2mM
	YL2GVndnsr/iEpX1iEXr22DX/cLSmVG+tDb6x1A==
X-Google-Smtp-Source: AGHT+IHdYOEWf6qlsoZVXjSZ7lVz4nHt9XoyHycNquwMn333FMaz4B6ys0O5Sw1BKpWpYjBg2+pZRslO+PRicrnJai8=
X-Received: by 2002:a92:d1cd:0:b0:39a:e86b:a76a with SMTP id
 e9e14a558f8ab-39b1fc2bbbdmr148654105ab.26.1722956671518; Tue, 06 Aug 2024
 08:04:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com> <20240726235234.228822-59-seanjc@google.com>
In-Reply-To: <20240726235234.228822-59-seanjc@google.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 6 Aug 2024 20:34:20 +0530
Message-ID: <CAAhSdy2whfRBm9HBkr=gSwxpFHGwGtB70fKNCqG1-MeHmB1K7w@mail.gmail.com>
Subject: Re: [PATCH v12 58/84] KVM: RISC-V: Use kvm_faultin_pfn() when mapping
 pfns into the guest
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_080433_324759_F926B3C4 
X-CRM114-Status: GOOD (  15.35  )
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

T24gU2F0LCBKdWwgMjcsIDIwMjQgYXQgNToyNOKAr0FNIFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNl
YW5qY0Bnb29nbGUuY29tPiB3cm90ZToKPgo+IENvbnZlcnQgUklTQy1WIHRvIF9fa3ZtX2ZhdWx0
aW5fcGZuKCkra3ZtX3JlbGVhc2VfZmF1bHRpbl9wYWdlKCksIHdoaWNoCj4gYXJlIG5ldyBBUElz
IHRvIGNvbnNvbGlkYXRlIGFyY2ggY29kZSBhbmQgcHJvdmlkZSBjb25zaXN0ZW50IGJlaGF2aW9y
Cj4gYWNyb3NzIGFsbCBLVk0gYXJjaGl0ZWN0dXJlcy4KPgo+IFNpZ25lZC1vZmYtYnk6IFNlYW4g
Q2hyaXN0b3BoZXJzb24gPHNlYW5qY0Bnb29nbGUuY29tPgoKRm9yIEtWTSBSSVNDLVY6CkFja2Vk
LWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKUmVnYXJkcywKQW51cAoKCj4g
LS0tCj4gIGFyY2gvcmlzY3Yva3ZtL21tdS5jIHwgMTEgKysrKy0tLS0tLS0KPiAgMSBmaWxlIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2t2bS9tbXUuYyBiL2FyY2gvcmlzY3Yva3ZtL21tdS5jCj4gaW5kZXggODA2ZjY4
ZTcwNjQyLi5mNzNkNmE3OWE3OGMgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vbW11LmMK
PiArKysgYi9hcmNoL3Jpc2N2L2t2bS9tbXUuYwo+IEBAIC02MDEsNiArNjAxLDcgQEAgaW50IGt2
bV9yaXNjdl9nc3RhZ2VfbWFwKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKPiAgICAgICAgIGJvb2wg
bG9nZ2luZyA9IChtZW1zbG90LT5kaXJ0eV9iaXRtYXAgJiYKPiAgICAgICAgICAgICAgICAgICAg
ICAgICAhKG1lbXNsb3QtPmZsYWdzICYgS1ZNX01FTV9SRUFET05MWSkpID8gdHJ1ZSA6IGZhbHNl
Owo+ICAgICAgICAgdW5zaWduZWQgbG9uZyB2bWFfcGFnZXNpemUsIG1tdV9zZXE7Cj4gKyAgICAg
ICBzdHJ1Y3QgcGFnZSAqcGFnZTsKPgo+ICAgICAgICAgLyogV2UgbmVlZCBtaW5pbXVtIHNlY29u
ZCt0aGlyZCBsZXZlbCBwYWdlcyAqLwo+ICAgICAgICAgcmV0ID0ga3ZtX21tdV90b3B1cF9tZW1v
cnlfY2FjaGUocGNhY2hlLCBnc3RhZ2VfcGdkX2xldmVscyk7Cj4gQEAgLTYzMSw3ICs2MzIsNyBA
QCBpbnQga3ZtX3Jpc2N2X2dzdGFnZV9tYXAoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAo+Cj4gICAg
ICAgICAvKgo+ICAgICAgICAgICogUmVhZCBtbXVfaW52YWxpZGF0ZV9zZXEgc28gdGhhdCBLVk0g
Y2FuIGRldGVjdCBpZiB0aGUgcmVzdWx0cyBvZgo+IC0gICAgICAgICogdm1hX2xvb2t1cCgpIG9y
IGdmbl90b19wZm5fcHJvdCgpIGJlY29tZSBzdGFsZSBwcmlvcnQgdG8gYWNxdWlyaW5nCj4gKyAg
ICAgICAgKiB2bWFfbG9va3VwKCkgb3IgX19rdm1fZmF1bHRpbl9wZm4oKSBiZWNvbWUgc3RhbGUg
cHJpb3J0IHRvIGFjcXVpcmluZwo+ICAgICAgICAgICoga3ZtLT5tbXVfbG9jay4KPiAgICAgICAg
ICAqCj4gICAgICAgICAgKiBSZWx5IG9uIG1tYXBfcmVhZF91bmxvY2soKSBmb3IgYW4gaW1wbGlj
aXQgc21wX3JtYigpLCB3aGljaCBwYWlycwo+IEBAIC02NDcsNyArNjQ4LDcgQEAgaW50IGt2bV9y
aXNjdl9nc3RhZ2VfbWFwKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKPiAgICAgICAgICAgICAgICAg
cmV0dXJuIC1FRkFVTFQ7Cj4gICAgICAgICB9Cj4KPiAtICAgICAgIGhmbiA9IGdmbl90b19wZm5f
cHJvdChrdm0sIGdmbiwgaXNfd3JpdGUsICZ3cml0YWJsZSk7Cj4gKyAgICAgICBoZm4gPSBrdm1f
ZmF1bHRpbl9wZm4odmNwdSwgZ2ZuLCBpc193cml0ZSwgJndyaXRhYmxlLCAmcGFnZSk7Cj4gICAg
ICAgICBpZiAoaGZuID09IEtWTV9QRk5fRVJSX0hXUE9JU09OKSB7Cj4gICAgICAgICAgICAgICAg
IHNlbmRfc2lnX21jZWVycihCVVNfTUNFRVJSX0FSLCAodm9pZCBfX3VzZXIgKilodmEsCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2bWFfcGFnZXNoaWZ0LCBjdXJyZW50KTsKPiBA
QCAtNjgxLDExICs2ODIsNyBAQCBpbnQga3ZtX3Jpc2N2X2dzdGFnZV9tYXAoc3RydWN0IGt2bV92
Y3B1ICp2Y3B1LAo+ICAgICAgICAgICAgICAgICBrdm1fZXJyKCJGYWlsZWQgdG8gbWFwIGluIEct
c3RhZ2VcbiIpOwo+Cj4gIG91dF91bmxvY2s6Cj4gLSAgICAgICBpZiAoKCFyZXQgfHwgcmV0ID09
IC1FRVhJU1QpICYmIHdyaXRhYmxlKQo+IC0gICAgICAgICAgICAgICBrdm1fc2V0X3Bmbl9kaXJ0
eShoZm4pOwo+IC0gICAgICAgZWxzZQo+IC0gICAgICAgICAgICAgICBrdm1fcmVsZWFzZV9wZm5f
Y2xlYW4oaGZuKTsKPiAtCj4gKyAgICAgICBrdm1fcmVsZWFzZV9mYXVsdGluX3BhZ2Uoa3ZtLCBw
YWdlLCByZXQgJiYgcmV0ICE9IC1FRVhJU1QsIHdyaXRhYmxlKTsKPiAgICAgICAgIHNwaW5fdW5s
b2NrKCZrdm0tPm1tdV9sb2NrKTsKPiAgICAgICAgIHJldHVybiByZXQ7Cj4gIH0KPiAtLQo+IDIu
NDYuMC5yYzEuMjMyLmc5NzUyZjllMTIzLWdvb2cKPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
