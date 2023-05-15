Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF89C77B7D
	for <linux-riscv@archiver.kernel.org>; Mon, 15 May 2023 06:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BMdaiDn0sYe3QpEvrlSspl2+W7nl9I1t3rIIV2cizIg=; b=dEh4NifAuqDwLi
	PDfFZDBWPxoV5rFpy2fTUjWWWfTaW0UIyJ819uo53GUfufIiSklF550N1O2kPX50aL8I8tQGajUaL
	BRISMV1+mfe4Wio+bxDCJedhGvtNGnkQVd2aS0uodIkz2oKdfDBqno2hxeO4Y62ORrA7E6u/eyVTE
	Jx6DXqzdNf/8vRXCvckjpZdwYuZaYc+0Q2lv9GjJWg9cogK5z7EM/b6aC+gVWhIok782Wi/RC3OCJ
	woupYIRoVWWOWBI1rk2faSJ54RAwq6E02pwXDfjR/TGa9MXkjHor6NjhFUio1iV6iob5S/Ko8RWlj
	ui4rmb+wmPqxeDvKRulg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyRcC-0017eu-2x;
	Mon, 15 May 2023 06:23:24 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyRcA-0017dP-2a;
	Mon, 15 May 2023 06:23:23 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-24eab83867dso10515407a91.3;
        Sun, 14 May 2023 23:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684131801; x=1686723801;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mDHXdNQbYhXSREb9b4s64DzzPtUQRB9+Khu+X4RcHb8=;
        b=ZeNtexfq5V2ww/s02fXWGGUBRJqKqYrmmFjDJafk3vXa/fPrFT799BakZLoKwsVFNv
         izP6vKF1/85VbAMdjmsPkZt3PdteckEBye0bynlcVhmteIZjfeoIQgxsB6+Yy8Qnhtky
         lMqpcHYhWYV8x40rRYT6YecJjtSmGOKV3sutT52Y5Ugx6ho8DMyPGJpGuSHFW3tuHWNO
         5sPWCM/vFD+hzYghT1ekgimxBWT49Z+PxaqsXUgg3gs1E6Af6AHunZaZEv5mqeOHHpp9
         2IqPIgZDENpO7xMJiLYAlPQSOzgURsxOIB/j89xuuAxZiKS7jmnCyvXKTzGVxFDo9Ow6
         Bj5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684131801; x=1686723801;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mDHXdNQbYhXSREb9b4s64DzzPtUQRB9+Khu+X4RcHb8=;
        b=OEBbbMP1V1sadXV7NQJ+9RgywmU+/pDkLB2InMOp8srVgaBxz3FLYLMccaEnv5qLMU
         1TfYwXMUPGO4BpZbxx+nO2WBj456vPgLXdDUFInleRizeWyQtXimQhTgpUkGO4E+BSbA
         i7nonGkm4+AsApvzFn3hM/xzXtnkPAK256YdfkLSGSJjVufYgymHv63r2iFqY94NVxvL
         0Qd2kt8cSlCB4H+AdaCCkqaC94E0tlXlfdCMx9KEOswC4ep5PUYQJmnjH2GVd9ejpujp
         hSsi1YCHIQDE/GwCUB048JnB1ddnq/MkLOdqe78LYxRt8uZU1B3FIlhRoiaaTSMxtgn+
         AOlQ==
X-Gm-Message-State: AC+VfDxMEgghwQUgh0LQeR4/oLvYp/Fup5L5v/iQqDwdVHAgSmx8b7yS
	VjpUaB6D/s5Xd4DVUbbf0Ui6DHwN/MfDLpOIGRI=
X-Google-Smtp-Source: ACHHUZ4GdM02yWWd/RVw6ZxMm0XmPUpxEPRJsgbK9JVDUKhxwEH/odjmbP5Y3hDS8qB0Pue4YJGzxOTNrLFlI4ViqR4=
X-Received: by 2002:a17:90a:db49:b0:250:d137:e2ae with SMTP id
 u9-20020a17090adb4900b00250d137e2aemr17275992pjx.23.1684131800927; Sun, 14
 May 2023 23:23:20 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1683791148.git.haibo1.xu@intel.com> <921fc2e1a91887170e277acb1b52df57480a5736.1683791148.git.haibo1.xu@intel.com>
 <20230511-d0a207eebb30fc88de875e4f@orel>
In-Reply-To: <20230511-d0a207eebb30fc88de875e4f@orel>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Mon, 15 May 2023 14:23:09 +0800
Message-ID: <CAJve8o=3VaQkjtgPnqeTtOcnNLEptUJzekoUgqaZ86K6GAF08A@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv: kvm: Add KVM_GET_REG_LIST API support
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Haibo Xu <haibo1.xu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230514_232322_842950_1DD61949 
X-CRM114-Status: GOOD (  20.00  )
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

T24gRnJpLCBNYXkgMTIsIDIwMjMgYXQgMTI6NDDigK9BTSBBbmRyZXcgSm9uZXMgPGFqb25lc0B2
ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IE9uIFRodSwgTWF5IDExLCAyMDIzIGF0IDA1OjIy
OjQ4UE0gKzA4MDAsIEhhaWJvIFh1IHdyb3RlOgo+ID4gS1ZNX0dFVF9SRUdfTElTVCBBUEkgd2ls
bCByZXR1cm4gYWxsIHJlZ2lzdGVycyB0aGF0IGFyZSBhdmFpbGFibGUgdG8KPiA+IEtWTV9HRVQv
U0VUX09ORV9SRUcgQVBJcy4gSXQncyB2ZXJ5IHVzZWZ1bCB0byBpZGVudGlmeSBzb21lIHBsYXRm
b3JtCj4gPiByZWdyZXNzaW9uIGlzc3VlIGR1cmluZyBWTSBtaWdyYXRpb24uCj4gPgo+ID4gU2lu
Y2UgdGhpcyBBUEkgd2FzIGFscmVhZHkgc3VwcG9ydGVkIG9uIGFybTY0LCBpdCdkIGJlIHN0cmFp
Z2h0Zm9yd2FyZAo+ID4gdG8gZW5hYmxlIGl0IG9uIHJpc2N2IHdpdGggc2ltaWxhciBjb2RlIHN0
cnVjdHVyZS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBIYWlibyBYdSA8aGFpYm8xLnh1QGludGVs
LmNvbT4KPiA+IC0tLQo+ID4gIERvY3VtZW50YXRpb24vdmlydC9rdm0vYXBpLnJzdCB8ICAgMiAr
LQo+ID4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHUuYyAgICAgICAgICB8IDM0NiArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysKPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDM0NyBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdmly
dC9rdm0vYXBpLnJzdCBiL0RvY3VtZW50YXRpb24vdmlydC9rdm0vYXBpLnJzdAo+ID4gaW5kZXgg
YWRkMDY3NzkzYjkwLi4yODBlODlhYmQwMDQgMTAwNjQ0Cj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9u
L3ZpcnQva3ZtL2FwaS5yc3QKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vdmlydC9rdm0vYXBpLnJz
dAo+ID4gQEAgLTM0OTksNyArMzQ5OSw3IEBAIFZDUFUgbWF0Y2hpbmcgdW5kZXJseWluZyBob3N0
Lgo+ID4gIC0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4KPiA+ICA6Q2FwYWJpbGl0eTogYmFzaWMK
PiA+IC06QXJjaGl0ZWN0dXJlczogYXJtNjQsIG1pcHMKPiA+ICs6QXJjaGl0ZWN0dXJlczogYXJt
NjQsIG1pcHMsIHJpc2N2Cj4gPiAgOlR5cGU6IHZjcHUgaW9jdGwKPiA+ICA6UGFyYW1ldGVyczog
c3RydWN0IGt2bV9yZWdfbGlzdCAoaW4vb3V0KQo+ID4gIDpSZXR1cm5zOiAwIG9uIHN1Y2Nlc3M7
IC0xIG9uIGVycm9yCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdS5jIGIvYXJj
aC9yaXNjdi9rdm0vdmNwdS5jCj4gPiBpbmRleCA4YmQ5ZjJhOGEwYjkuLmZiODgzNGU0ZmExNSAx
MDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+ID4gKysrIGIvYXJjaC9yaXNj
di9rdm0vdmNwdS5jCj4gPiBAQCAtNjU3LDYgKzY1NywzMzQgQEAgc3RhdGljIGludCBrdm1fcmlz
Y3ZfdmNwdV9zZXRfcmVnX2lzYV9leHQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAo+ID4gICAgICAg
cmV0dXJuIDA7Cj4gPiAgfQo+ID4KPiA+ICtzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgbnVt
X2NvbmZpZ19yZWdzKHZvaWQpCj4gPiArewo+ID4gKyAgICAgcmV0dXJuIHNpemVvZihzdHJ1Y3Qg
a3ZtX3Jpc2N2X2NvbmZpZykgLyBzaXplb2YodW5zaWduZWQgbG9uZyk7Cj4KPiBXZSBjYW4ndCBh
c3N1bWUgYWxsIGNvbmZpZyByZWdpc3RlcnMgYXJlIHByZXNlbnQuIEZvciBleGFtcGxlLAo+IHpp
Y2JvbSBhbmQgemljYm96IGJsb2NrIHNpemUgcmVnaXN0ZXJzIGFyZSBvbmx5IHByZXNlbnQgd2hl
biB0aGVpcgo+IHJlc3BlY3RpdmUgZXh0ZW5zaW9ucyBhcmUgYXZhaWxhYmxlLgo+Cj4gVGhhbmtz
LAo+IGRyZXcKClllcywgSSB3aWxsIGZpbHRlciBvdXQgdGhlc2Uga2luZHMgb2YgcmVnaXN0ZXJz
IGluIHRoZSBuZXh0IHZlcnNpb24uCgpUaGFua3MsCkhhaWJvCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
