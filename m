Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37529C7EE29
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Jun 2023 02:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TxwJD8TvOOoYalzqEqsF5ibnR0HKd5HZXAA3fZ9zzlc=; b=zFcZtKMWQO3Bvb
	t72FSR7AbWKo41mJIjCKra9xYsAgC04j1p5T41r1d8DlKdAc7ewH0l8RJpHOmybw8OK6lNtXJ/AE/
	EnA3WRyKikA6n/KopUws9pvRQ+WYTIs2yUUQlD9Q6D/qFrHM4nykX5k46v4CgjKDkqMWpOE3lvpVG
	KjtiDEYCMyL4ehSl2nHKCEAEzf4I0+4Fq+E69fTVQwsUYP7pHpbmRdSmhDJ4dDv3P0s2JxY2AFK5h
	fj5T1F/hesbMnvdaDFQ3StkopLohUP0c49yEQ/UwDXPCaXDorx8bRAc7w7I3PmoPp9uLC/QwlMFTS
	jYry5kfcqV7xK7YaoFtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7oWP-00EzYs-0b;
	Sat, 10 Jun 2023 02:40:09 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7oWM-00EzXu-0G;
	Sat, 10 Jun 2023 02:40:07 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-543d32eed7cso897467a12.2;
        Fri, 09 Jun 2023 19:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686364804; x=1688956804;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yMfpDCLRI5dKyF0E3U+UoBzddcbMW1WQlUnfVbM4Nck=;
        b=VSuYniOmVJm4APmLKKeLvXMbE8TljXjUNMlgLVlYqWsuBrwnlWGOug6dLADTZoR5yA
         ephPwS8VQPss1j9EmzvIDKo9ZNOJbRFmv9sLV7BvT81ptJMdJ1Jsf6FY68mSy7Z/yT+w
         zPM8hWOQqosCzowr7LFwZWo/7kb3G0ygsv8PQKDeobDoEJvyEwakZAsJRFlJr3s09+LR
         peQnmNKTDneKDR7PuVNA4OwMT2KzLLl75sKBurccopF5L0tCZRpP3NWJk+wMJGaGWEnw
         +m5cvDgsfjKaJv8Zxh+y+jk/ey/C488Aqi8NbLPpK6egHx1lvb2dC5ffAgMbjTneiznw
         fY8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686364804; x=1688956804;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yMfpDCLRI5dKyF0E3U+UoBzddcbMW1WQlUnfVbM4Nck=;
        b=ef4z4OyCNuxUMF1gQxtBd/Q3zns9afjiVSOmxyXxHWf9ZzwAgL2bVtfumjTTS+R3H/
         7IGAlgCeWN043J5ChaOZR4Au2HjaESC/ye2tvAbOK7SwbnkLzrdo7m/wC0ZE2gdwCGSB
         QwzgadPuNWDTuDwckejNKJnPWNGw3WY6ANF7Ca7iL1xGb4xx0tF0zB9xZlr9fMMivNZ2
         y4ffdlAS1X+QfJIT1d/bn+gCpRpriv3egj0reobDSn+cIQdJF+n/BDoXF++ydR+NAksg
         53F76eRV4zmCBDvZN3Au8WmRZfLBUv9+2KWVFJbAsoEePNSxViSadU4yp5ghTHKFOUj3
         hVXg==
X-Gm-Message-State: AC+VfDzfhvb1HMQ+4BSGYWSGOau8QoHTSghwwg2D6sNL8EVu0q5Wx4Aa
	sZU7j3g0hakbi8D5FFw/TuhDTlRI4tLO6+Z/rTY=
X-Google-Smtp-Source: ACHHUZ6Ncw/ed/aBOi55gkdHjQX9HI8UMmlQmib8fd4hYlllg8RalvCIvinsLeBFbe5+qY0bpgqSSep+1aWI0UyuIEo=
X-Received: by 2002:a05:6a20:7f87:b0:118:5d5a:f26f with SMTP id
 d7-20020a056a207f8700b001185d5af26fmr2768582pzj.12.1686364803807; Fri, 09 Jun
 2023 19:40:03 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1686275310.git.haibo1.xu@intel.com> <450cb59db52ebeaa68f3d77f1bd995618f3612b8.1686275310.git.haibo1.xu@intel.com>
 <20230609-b900162a66c26a004b751b1f@orel>
In-Reply-To: <20230609-b900162a66c26a004b751b1f@orel>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Sat, 10 Jun 2023 10:39:52 +0800
Message-ID: <CAJve8ontMqvxyXWCY2DWziqti5umRuO+YOiWkXqLhyONWWsLKg@mail.gmail.com>
Subject: Re: [PATCH v3 07/10] KVM: arm64: selftests: Finish generalizing get-reg-list
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Haibo Xu <haibo1.xu@intel.com>, maz@kernel.org, oliver.upton@linux.dev, 
	seanjc@google.com, Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Shuah Khan <shuah@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, David Matlack <dmatlack@google.com>, 
	Ben Gardon <bgardon@google.com>, Vipin Sharma <vipinsh@google.com>, 
	Colton Lewis <coltonlewis@google.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_194006_147178_028A6FAA 
X-CRM114-Status: GOOD (  29.52  )
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

T24gRnJpLCBKdW4gOSwgMjAyMyBhdCA4OjMw4oCvUE0gQW5kcmV3IEpvbmVzIDxham9uZXNAdmVu
dGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiBPbiBGcmksIEp1biAwOSwgMjAyMyBhdCAxMDoxMjox
NUFNICswODAwLCBIYWlibyBYdSB3cm90ZToKPiA+IEZyb206IEFuZHJldyBKb25lcyA8YWpvbmVz
QHZlbnRhbmFtaWNyby5jb20+Cj4gPgo+ID4gQWRkIHNvbWUgdW5mb3J0dW5hdGUgI2lmZGVmZmVy
eSB0byBlbnN1cmUgdGhlIGNvbW1vbiBnZXQtcmVnLWxpc3QuYwo+ID4gY2FuIGJlIGNvbXBpbGVk
IGFuZCBydW4gd2l0aCBvdGhlciBhcmNoaXRlY3R1cmVzLiBUaGUgbmV4dAo+ID4gYXJjaGl0ZWN0
dXJlIHRvIHN1cHBvcnQgZ2V0LXJlZy1saXN0IHNob3VsZCBub3cgb25seSBuZWVkIHRvIHByb3Zp
ZGUKPiA+ICQoQVJDSF9ESVIpL2dldC1yZWctbGlzdC5jIHdoZXJlIGFyY2gtc3BlY2lmaWMgcHJp
bnRfcmVnKCkgYW5kCj4gPiB2Y3B1X2NvbmZpZ3NbXSBnZXQgZGVmaW5lZC4KPiA+Cj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgo+ID4gU2ln
bmVkLW9mZi1ieTogSGFpYm8gWHUgPGhhaWJvMS54dUBpbnRlbC5jb20+Cj4gPiAtLS0KPiA+ICB0
b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vZ2V0LXJlZy1saXN0LmMgfCAyNCArKysrKysrKysr
KysrKysrKystLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDQgZGVs
ZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2
bS9nZXQtcmVnLWxpc3QuYyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9nZXQtcmVnLWxp
c3QuYwo+ID4gaW5kZXggNjliYjkxMDg3MDgxLi5jNGJkNWE1MjU5ZGEgMTAwNjQ0Cj4gPiAtLS0g
YS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vZ2V0LXJlZy1saXN0LmMKPiA+ICsrKyBiL3Rv
b2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9nZXQtcmVnLWxpc3QuYwo+ID4gQEAgLTk4LDYgKzk4
LDcgQEAgdm9pZCBfX3dlYWsgcHJpbnRfcmVnKGNvbnN0IGNoYXIgKnByZWZpeCwgX191NjQgaWQp
Cj4gPiAgICAgICBwcmludGYoIlx0MHglbGx4LFxuIiwgaWQpOwo+ID4gIH0KPiA+Cj4gPiArI2lm
ZGVmIF9fYWFyY2g2NF9fCj4gPiAgc3RhdGljIHZvaWQgcHJlcGFyZV92Y3B1X2luaXQoc3RydWN0
IHZjcHVfcmVnX2xpc3QgKmMsIHN0cnVjdCBrdm1fdmNwdV9pbml0ICppbml0KQo+ID4gIHsKPiA+
ICAgICAgIHN0cnVjdCB2Y3B1X3JlZ19zdWJsaXN0ICpzOwo+ID4gQEAgLTEyMCw2ICsxMjEsMjQg
QEAgc3RhdGljIHZvaWQgZmluYWxpemVfdmNwdShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVj
dCB2Y3B1X3JlZ19saXN0ICpjKQo+ID4gICAgICAgfQo+ID4gIH0KPiA+Cj4gPiArc3RhdGljIHN0
cnVjdCBrdm1fdmNwdSAqdmNwdV9jb25maWdfZ2V0X3ZjcHUoc3RydWN0IHZjcHVfcmVnX2xpc3Qg
KmMsIHN0cnVjdCBrdm1fdm0gKnZtKQo+ID4gK3sKPiA+ICsgICAgIHN0cnVjdCBrdm1fdmNwdV9p
bml0IGluaXQgPSB7IC50YXJnZXQgPSAtMSwgfTsKPiA+ICsgICAgIHN0cnVjdCBrdm1fdmNwdSAq
dmNwdTsKPiA+ICsKPiA+ICsgICAgIHByZXBhcmVfdmNwdV9pbml0KGMsICZpbml0KTsKPiA+ICsg
ICAgIHZjcHUgPSBfX3ZtX3ZjcHVfYWRkKHZtLCAwKTsKPiA+ICsgICAgIGFhcmNoNjRfdmNwdV9z
ZXR1cCh2Y3B1LCAmaW5pdCk7Cj4gPiArCj4gPiArICAgICByZXR1cm4gdmNwdTsKPiA+ICt9Cj4g
PiArI2Vsc2UKPiA+ICtzdGF0aWMgc3RydWN0IGt2bV92Y3B1ICp2Y3B1X2NvbmZpZ19nZXRfdmNw
dShzdHJ1Y3QgdmNwdV9yZWdfbGlzdCAqYywgc3RydWN0IGt2bV92bSAqdm0pCj4gPiArewo+ID4g
KyAgICAgcmV0dXJuIF9fdm1fdmNwdV9hZGQodm0sIDApOwo+ID4gK30KPiA+ICsjZW5kaWYKPiA+
ICsKPiA+ICBzdGF0aWMgdm9pZCBjaGVja19zdXBwb3J0ZWQoc3RydWN0IHZjcHVfcmVnX2xpc3Qg
KmMpCj4gPiAgewo+ID4gICAgICAgc3RydWN0IHZjcHVfcmVnX3N1Ymxpc3QgKnM7Cj4gPiBAQCAt
MTM5LDcgKzE1OCw2IEBAIHN0YXRpYyBib29sIHByaW50X2ZpbHRlcmVkOwo+ID4KPiA+ICBzdGF0
aWMgdm9pZCBydW5fdGVzdChzdHJ1Y3QgdmNwdV9yZWdfbGlzdCAqYykKPiA+ICB7Cj4gPiAtICAg
ICBzdHJ1Y3Qga3ZtX3ZjcHVfaW5pdCBpbml0ID0geyAudGFyZ2V0ID0gLTEsIH07Cj4gPiAgICAg
ICBpbnQgbmV3X3JlZ3MgPSAwLCBtaXNzaW5nX3JlZ3MgPSAwLCBpLCBuOwo+ID4gICAgICAgaW50
IGZhaWxlZF9nZXQgPSAwLCBmYWlsZWRfc2V0ID0gMCwgZmFpbGVkX3JlamVjdCA9IDA7Cj4gPiAg
ICAgICBzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHU7Cj4gPiBAQCAtMTQ5LDkgKzE2Nyw3IEBAIHN0YXRp
YyB2b2lkIHJ1bl90ZXN0KHN0cnVjdCB2Y3B1X3JlZ19saXN0ICpjKQo+ID4gICAgICAgY2hlY2tf
c3VwcG9ydGVkKGMpOwo+ID4KPiA+ICAgICAgIHZtID0gdm1fY3JlYXRlX2JhcmVib25lcygpOwo+
ID4gLSAgICAgcHJlcGFyZV92Y3B1X2luaXQoYywgJmluaXQpOwo+ID4gLSAgICAgdmNwdSA9IF9f
dm1fdmNwdV9hZGQodm0sIDApOwo+ID4gLSAgICAgYWFyY2g2NF92Y3B1X3NldHVwKHZjcHUsICZp
bml0KTsKPiA+ICsgICAgIHZjcHUgPSB2Y3B1X2NvbmZpZ19nZXRfdmNwdShjLCB2bSk7Cj4gPiAg
ICAgICBmaW5hbGl6ZV92Y3B1KHZjcHUsIGMpOwo+Cj4gSSBqdXN0IG5vdGljZWQgdGhhdCB0aGlz
IGhhcyBiZWVuIG1vZGlmaWVkIGZyb20gd2hhdCBJIHBvc3RlZCB0byBsZWF2ZQo+IHRoZSBmaW5h
bGl6ZV92Y3B1KCkgY2FsbCBoZXJlLCBkZXNwaXRlIGl0IG5vdyBiZWluZyBpbnNpZGUgdGhlICNp
ZmRlZgo+IF9fYWFyY2g2NF9fLiBUaGF0IGJyZWFrcyB0aGUgcHVycG9zZSBvZiB0aGUgcGF0Y2gu
IFBsZWFzZSBtYWtlIHN1cmUgdGhpcwo+IGZpbGUgY29tcGlsZXMgZm9yIG90aGVyIGFyY2hpdGVj
dHVyZXMgd2l0aG91dCByZXF1aXJpbmcgYWRkaXRpb25hbAo+IHBhdGNoZXMsIHdoaWNoIHdvdWxk
IGtlZXAgdGhlIGNvbW1pdCBtZXNzYWdlIGhvbmVzdC4gWW91IGNhbiBlaXRoZXIKPiByZXZlcnQg
dGhpcyB0byB3aGF0IEkgcG9zdGVkLCBhbmQgdGhlbiByZWFkZCB0aGUgZmluYWxpemVfdmNwdSgp
IGNhbGwgaW4KPiBhbm90aGVyIHBhdGNoLCBvciB5b3UgY2FuIGFkZCBhIGZpbmFsaXplX3ZjcHUo
KSBzdHViIHRvIHRoZSAjZWxzZSBwYXJ0Cj4gb2YgdGhlIGlmZGVmIGluIHRoaXMgcGF0Y2guCj4K
PiBBbHNvIHBsZWFzZSBkb24ndCBtb2RpZnkgcGF0Y2hlcyBhdXRob3JlZCBieSBvdGhlcnMgd2l0
aG91dCBjYWxsaW5nIG91dAo+IHRoZSBtb2RpZmljYXRpb25zIHNvbWV3aGVyZSwgZWl0aGVyIHRo
ZSBjb21taXQgbWVzc2FnZSBvciB1bmRlciB0aGUgLS0tCj4gb2YgdGhlIHBhdGNoIG9yIGluIHRo
ZSBjb3ZlciBsZXR0ZXIuCj4KClRoYW5rcyBmb3IgcG9pbnRpbmcgaXQgb3V0ISBJIHdpbGwgaGF2
ZSBhIGNoZWNrIGFib3V0IGl0LgoKPiBUaGFua3MsCj4gZHJldwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
