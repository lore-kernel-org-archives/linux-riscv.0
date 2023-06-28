Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32419EB64D7
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jun 2023 05:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q2URX9WIpA1GjC3rsgdhuDyx0JW7RNQAiT3bCdeAiqM=; b=sSGrOwPU0JOYUO
	kFl3rINvS1Tl1GEbZGh/9m0LFm00chzNmSIaWZIMUlxAU6u3qRFahe4IZh8acQYYdSjUoaHkKQvr9
	at3NujjVrsHbWg9sdLGQ7o2raaa8V8rwtjuu+mIxSnDJSPk8kSvfJoyVr/yddmrz0DF+UeZKj5Ejd
	myK0/Owf3yhb9Lh9Ihk5erDBNx/3q2kr84O/XLTisVTjEpUA14IqruNlSRNuvweXTqIwK2Rex8s1H
	SMJ7uAJkSPjmEdJeCsAyELZgLCzcUTJK757owgC9EY76iHT/PwX10M2njo8GLi6Rgiq4cXzOtrX2v
	8ve+vZXx9ifd06i6qnYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEOCN-00Euqy-03;
	Wed, 28 Jun 2023 05:58:39 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEOCJ-00Euph-2h;
	Wed, 28 Jun 2023 05:58:37 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4f004cc54f4so7545448e87.3;
        Tue, 27 Jun 2023 22:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687931912; x=1690523912;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n3aJVivKTsxGgC5bZY9lBEYilnIfeNYiUvGs+4klsT4=;
        b=EyR1u0N2KUtWsReJgPfwuO7azhk6O5y7csrrwvzN5oUccT+wyVRsmCmFMN0M2eAWQn
         dbQsxpKMTLbx/085rciYtvkKO/RoltlLBYUS5nwzudg3UcWJNaAUmH3ac1jJ0GF7jK6x
         hxbNeGLpqI9imb3xmV6UsHBxP8SsmEmtil6HC0aFHJZzZfw3gbbWMJf55z/scE0i6H2s
         N0Dp7uqpMnOlgB8+XKEGGuLEsTvLjzBz1o/6GLA3UTRojiFSP87+tE1PhIyHCS9uYFds
         bFv1+4/uBLPiRnJZ5L429ryfCUqb6E7lpt4WV+YF5kvJaRePDWZM7JI91smTG6vv1m3t
         NXBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687931912; x=1690523912;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n3aJVivKTsxGgC5bZY9lBEYilnIfeNYiUvGs+4klsT4=;
        b=RuvKL8/IKH8WTxoJZ4KczG0cibOQVcEBaRSP5hz1JPD3nL6MG9LIVlwr8bBMbybt/O
         PjF4Ym7rqeaOVLQDAeTENtwo0y81K1HGpHFG1i6EVi6xEnncluX591AhEFQd1N9zN3uk
         raps34Kzh9t6q8g74+dfMTcZ812ZsglT7JdHxoAk6Uii4FcVBeFMLgDf7Er6256lPdf4
         mKqr281zcYi990vTPKDQDm2U8LGPV7g1zL96MOpYYyiPH1HybZvRjhPhWrtQkeSVcwVS
         Hcd0Whi4wHfl3mGDqFyhtimtsUdoSYfdXXUg/B2W8s40gyoen/EydQtWplORAXUUsuFk
         zJiA==
X-Gm-Message-State: AC+VfDwa98WIgDihsB2uI299uof3FVifvyEK9NTu0RrYrjGyOWovkwk5
	WOAnKvJiD36kuZJWZ6Br4gf2j3wUB4dRHD49A8g=
X-Google-Smtp-Source: ACHHUZ6G3GAT9ajCN9HnEnSa14/P//f+PSHHiBNlYEdgWCk+bz3CMGjmyPuJIjqhIuitZ1/YwJeJIdz2FvIiBiB2/A0=
X-Received: by 2002:a05:6512:3d21:b0:4fb:4368:14a1 with SMTP id
 d33-20020a0565123d2100b004fb436814a1mr7873262lfv.18.1687931912362; Tue, 27
 Jun 2023 22:58:32 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1687515463.git.haibo1.xu@intel.com> <341feff384c9f8a20ed4aac6e2dda0440d6b84f2.1687515463.git.haibo1.xu@intel.com>
 <20230627-4d207186c4ef81be43c9d874@orel>
In-Reply-To: <20230627-4d207186c4ef81be43c9d874@orel>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Wed, 28 Jun 2023 13:58:21 +0800
Message-ID: <CAJve8ony9nj9LyCAJjtvthR+ABLvSPHvpeE5e5=wr_z44i20qw@mail.gmail.com>
Subject: Re: [PATCH v4 08/12] KVM: arm64: selftests: Move reject_set check
 logic to a function
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Haibo Xu <haibo1.xu@intel.com>, maz@kernel.org, oliver.upton@linux.dev, 
	seanjc@google.com, Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Shuah Khan <shuah@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, David Matlack <dmatlack@google.com>, 
	Ben Gardon <bgardon@google.com>, Ricardo Koller <ricarkol@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, Vipin Sharma <vipinsh@google.com>, 
	Colton Lewis <coltonlewis@google.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_225835_892238_5E962316 
X-CRM114-Status: GOOD (  28.65  )
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

T24gVHVlLCBKdW4gMjcsIDIwMjMgYXQgNTowOeKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBKdW4gMjMsIDIwMjMgYXQgMDY6NDA6
MTBQTSArMDgwMCwgSGFpYm8gWHUgd3JvdGU6Cj4gPiBObyBmdW5jdGlvbmFsIGNoYW5nZXMuIEp1
c3QgbW92ZSB0aGUgcmVqZWN0X3NldCBjaGVjayBsb2dpYyB0byBhCj4gPiBmdW5jdGlvbiBzbyB3
ZSBjYW4gY2hlY2sgZm9yIHNwZWNpZmljIGVycm5vIGZvciBzcGVjaWZpYyByZWdpc3Rlci4KPiA+
IFRoaXMgaXMgYSBwcmVwYXJhdGlvbiBmb3Igc3VwcG9ydCByZWplY3Rfc2V0IGluIHJpc2N2Lgo+
ID4KPiA+IFN1Z2dlc3RlZC1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNv
bT4KPiA+IFNpZ25lZC1vZmYtYnk6IEhhaWJvIFh1IDxoYWlibzEueHVAaW50ZWwuY29tPgo+ID4g
LS0tCj4gPiAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2FhcmNoNjQvZ2V0LXJlZy1saXN0
LmMgfCA4ICsrKysrKysrCj4gPiAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2dldC1yZWct
bGlzdC5jICAgICAgICAgfCA3ICsrKysrKy0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDE0IGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGlu
Zy9zZWxmdGVzdHMva3ZtL2FhcmNoNjQvZ2V0LXJlZy1saXN0LmMgYi90b29scy90ZXN0aW5nL3Nl
bGZ0ZXN0cy9rdm0vYWFyY2g2NC9nZXQtcmVnLWxpc3QuYwo+ID4gaW5kZXggYWFmMDM1Yzk2OWVj
Li40ZTJlMWZlODMzZWIgMTAwNjQ0Cj4gPiAtLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9r
dm0vYWFyY2g2NC9nZXQtcmVnLWxpc3QuYwo+ID4gKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVz
dHMva3ZtL2FhcmNoNjQvZ2V0LXJlZy1saXN0LmMKPiA+IEBAIC0yNyw2ICsyNywxNCBAQCBib29s
IGZpbHRlcl9yZWcoX191NjQgcmVnKQo+ID4gICAgICAgcmV0dXJuIGZhbHNlOwo+ID4gIH0KPiA+
Cj4gPiArYm9vbCByZWplY3Rfc2V0X2ZhaWwoX191NjQgcmVnKQo+ID4gK3sKPiA+ICsgICAgIGlm
IChyZWcgPT0gS1ZNX1JFR19BUk02NF9TVkVfVkxTKQo+ID4gKyAgICAgICAgICAgICByZXR1cm4g
KGVycm5vICE9IEVQRVJNKTsKPiA+ICsKPiA+ICsgICAgIHJldHVybiBmYWxzZTsKPiA+ICt9Cj4K
PiBJIHRoaW5rIHdlIHNob3VsZCBwYXNzIGVycm5vIGluIGFzIGEgcGFyYW1ldGVyIGFuZCBJIHBy
ZWZlciBwb3NpdGl2ZQo+IHByZWRpY2F0ZSBmdW5jdGlvbnMsIHNvIEknZCBuYW1lIHRoaXMgY2hl
Y2tfcmVqZWN0X3NldCgpIGFuZCByZXZlcnNlCj4gdGhlIGxvZ2ljLiBBbHNvLCB3ZSBkb24ndCB3
YW50IHRvIGNoZWNrIGZvciBLVk1fUkVHX0FSTTY0X1NWRV9WTFMsCj4gYmVjYXVzZSB0aGF0IGR1
cGxpY2F0ZXMgdGhlIHJlamVjdHMgc2V0LiBJIHNlZSBpbiBhIGxhdGVyIHBhdGNoCj4gdGhhdCBy
aXNjdiBuZWVkcyB0byBjaGVjayByZWcgYmVjYXVzZSBkaWZmZXJlbnQgZXJyb3JzIGFyZSB1c2Vk
Cj4gZm9yIGRpZmZlcmVudCByZWdpc3RlcnMsIGJ1dCB0aGF0J3MgYmVjYXVzZSBLVk1fUkVHX1JJ
U0NWX1RJTUVSX1JFRyhzdGF0ZSkKPiB3YXMgZXJyb25lb3VzbHkgYWRkZWQgdG8gdGhlIHJlamVj
dHMgc2V0LiBLVk1fUkVHX1JJU0NWX1RJTUVSX1JFRyhzdGF0ZSkKPiBkb2Vzbid0IGJlbG9uZyB0
aGVyZS4gVGhhdCByZWdpc3RlciBjYW4gYmUgc2V0LCBidXQgaXQgb25seSBzdXBwb3J0cwo+IGNl
cnRhaW4gaW5wdXQsIG90aGVyd2lzZSwgaXQgY29ycmVjdGx5LCByZXN1bHRzIGluIEVJTlZBTC4g
V2UnbGwgbmVlZAo+IHRoZSBjb25jZXB0IG9mIGEgInNraXAgc2V0IiB0byBhdm9pZCB0cmlwcGlu
ZyBvdmVyIHRoYXQgb25lLgo+Cj4gU28sIEkgdGhpbmsgYXJtJ3MgZnVuY3Rpb24gc2hvdWxkIGJl
Cj4KPiAgYm9vbCBjaGVja19yZWplY3Rfc2V0KGludCBlcnJubykKPiAgewo+ICAgICAgcmV0dXJu
IGVycm5vID09IEVQRVJNOwo+ICB9Cj4KPiBhbmQgcmlzY3YncyBzaG91bGQgYmUKPgo+ICBib29s
IGNoZWNrX3JlamVjdF9zZXQoaW50IGVycm5vKQo+ICB7Cj4gICAgICByZXR1cm4gZXJybm8gPT0g
RU9QTk9UU1VQUDsKPiAgfQo+CgpTdXJlLCB3aWxsIGFkZCBhIG5ldyAnc2tpcHNfc2V0JyBtZW1i
ZXIgdG8gJ3N0cnVjdCB2Y3B1X3JlZ19zdWJsaXN0JyBhbmQKbW92ZSBLVk1fUkVHX1JJU0NWX1RJ
TUVSX1JFRyhzdGF0ZSkgcmVnIHRvIGl0LgoKPiA+ICsKPiA+ICAjZGVmaW5lIFJFR19NQVNLIChL
Vk1fUkVHX0FSQ0hfTUFTSyB8IEtWTV9SRUdfU0laRV9NQVNLIHwgS1ZNX1JFR19BUk1fQ09QUk9D
X01BU0spCj4gPgo+ID4gICNkZWZpbmUgQ09SRV9SRUdTX1hYX05SX1dPUkRTICAgICAgICAyCj4g
PiBkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2dldC1yZWctbGlzdC5j
IGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2dldC1yZWctbGlzdC5jCj4gPiBpbmRleCBm
NmFkNzk5MWE4MTIuLmI5NTZlZTQxMDk5NiAxMDA2NDQKPiA+IC0tLSBhL3Rvb2xzL3Rlc3Rpbmcv
c2VsZnRlc3RzL2t2bS9nZXQtcmVnLWxpc3QuYwo+ID4gKysrIGIvdG9vbHMvdGVzdGluZy9zZWxm
dGVzdHMva3ZtL2dldC1yZWctbGlzdC5jCj4gPiBAQCAtOTgsNiArOTgsMTEgQEAgdm9pZCBfX3dl
YWsgcHJpbnRfcmVnKGNvbnN0IGNoYXIgKnByZWZpeCwgX191NjQgaWQpCj4gPiAgICAgICBwcmlu
dGYoIlx0MHglbGx4LFxuIiwgaWQpOwo+ID4gIH0KPiA+Cj4gPiArYm9vbCBfX3dlYWsgcmVqZWN0
X3NldF9mYWlsKF9fdTY0IHJlZykKPiA+ICt7Cj4gPiArICAgICByZXR1cm4gZmFsc2U7Cj4gPiAr
fQo+ID4gKwo+ID4gICNpZmRlZiBfX2FhcmNoNjRfXwo+ID4gIHN0YXRpYyB2b2lkIHByZXBhcmVf
dmNwdV9pbml0KHN0cnVjdCB2Y3B1X3JlZ19saXN0ICpjLCBzdHJ1Y3Qga3ZtX3ZjcHVfaW5pdCAq
aW5pdCkKPiA+ICB7Cj4gPiBAQCAtMjE2LDcgKzIyMSw3IEBAIHN0YXRpYyB2b2lkIHJ1bl90ZXN0
KHN0cnVjdCB2Y3B1X3JlZ19saXN0ICpjKQo+ID4gICAgICAgICAgICAgICAgICAgICAgIGlmIChz
LT5yZWplY3RzX3NldCAmJiBmaW5kX3JlZyhzLT5yZWplY3RzX3NldCwgcy0+cmVqZWN0c19zZXRf
biwgcmVnLmlkKSkgewo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVqZWN0X3Jl
ZyA9IHRydWU7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXQgPSBfX3ZjcHVf
aW9jdGwodmNwdSwgS1ZNX1NFVF9PTkVfUkVHLCAmcmVnKTsKPiA+IC0gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGlmIChyZXQgIT0gLTEgfHwgZXJybm8gIT0gRVBFUk0pIHsKPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGlmIChyZXQgIT0gLTEgfHwgcmVqZWN0X3NldF9mYWls
KHJlZy5pZCkpIHsKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcHJp
bnRmKCIlczogRmFpbGVkIHRvIHJlamVjdCAocmV0PSVkLCBlcnJubz0lZCkgIiwgY29uZmlnX25h
bWUoYyksIHJldCwgZXJybm8pOwo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBwcmludF9yZWcoY29uZmlnX25hbWUoYyksIHJlZy5pZCk7Cj4gPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHB1dGNoYXIoJ1xuJyk7Cj4gPiAtLQo+ID4gMi4zNC4x
Cj4gPgo+Cj4gVGhhbmtzLAo+IGRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
