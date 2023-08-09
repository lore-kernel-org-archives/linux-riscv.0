Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D5EEB64DD
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 12:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/EYwgT7fyX3qIZm8go5Ym/9LMzQ9Z8y1Af2sgxrIMTU=; b=U88/+guZEvjJgm
	KbYFhoSoIYDeb06GKFqgE8IczV9XByidH165mEGJAFpIAInNtD9KtAJJ8mypKoWvAoZ9x4KaFEs/Y
	Sigoufu4alwAy9OswzImymcEVRwX7iET50XrMlRscjmgV1MiECvbnNZjOZtT8auuGJDyZhwm/VN1V
	appsoS/QK86MEF8adkIlr227fWZOLSQRPAJHqqR94cl0uWjDsNIS82NYMmvPLW2wwugzH5HvZ5DVI
	8dfD7BPBEp7SGizpW5uXLcGH2g4E+NLguwrOxDGM3AVXvSVam5RYQgs3oNdinNLs07exniz9JyVFD
	fR/A98EOyC8gAUsKFsCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTiCP-004snl-2L;
	Wed, 09 Aug 2023 12:22:01 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTiCK-004slS-29
	for linux-riscv@lists.infradead.org;
	Wed, 09 Aug 2023 12:21:59 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-522ab301692so9217516a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 09 Aug 2023 05:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20221208.gappssmtp.com; s=20221208; t=1691583714; x=1692188514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gse4lQ89R/swNYJYWFRKmfEvRYWCgDAQeQk+i+FC3Qc=;
        b=z4Z49MED7B2iO1P22Sflcd12HqFoBF5yfCPEmSnPuw92T8YnUDH2KmdmqK/zmm3Hsv
         Y1A4Myz/vjPMCMyAiAMJtrC215szsuavogK4ztLxqkGSQO7aPAZzUkD1Ozkyv7H3dSaL
         qsE22vwvMjFkqhjUQQdHhf2t+Y2yF2VZL5Bid1o6X2mZ0zwKa1F0dMm02EOtwX7YI8oZ
         kQr4IP0wXNHwqQREssTv7kAUZWMAwp8PYn9E03Y7mqOyy+xa2JAZIQ2g56zk0jeEXZhW
         kRD0s2bF7FjY+mFqcKXFd8fyuF9dqKo3ka5wJ+o55aO6bmVU6NblI+YE2iiYmI3rXl30
         +XNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691583714; x=1692188514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gse4lQ89R/swNYJYWFRKmfEvRYWCgDAQeQk+i+FC3Qc=;
        b=G5R39JUUDpnY35TGHhqx9BoKFY3ILAK28OcsuCntQmmhEXWtJLz1JimC21pEpo4VfO
         iOhqrHeOkBXfhZ0Fk6om8ZdyUCjMRW/ktFtbm8DGXyIpmTo5yfvTCGbJTs2bpHpSWwJm
         snVbMuvfEmKcxLuGwX0HvXiM7k3dTQOMNIIttisQIXKw2hoYjsoa04Mnrz/1t6B3QwRB
         0On5+HRVGx2UKwsidcnDdllbYlN0YtLFTJqvaSMYiDyLL1l8PQq8lIikUPww2154sHIQ
         9Cz/OsaL25Jz4Ow98ddZNCS6cDCL78dtfFx+kmatLh0iZuXyq/1eAXT3iiAFxny+kSCi
         4SZA==
X-Gm-Message-State: AOJu0YycOZSsAy1VUgRRNYrHhmFuAq+MIQaAGIpAR+qTEywq9zL7qK95
	eWzJ7lGyzTcVIzGuiYtXIYB5uNFPoK7HEqKAfFCgZQ==
X-Google-Smtp-Source: AGHT+IEllS//Vo5DIeilEm06so+oXBAZVZjqk1bluFXrO7jOq/QKmFdOTXQUqzX5tkMzooCga5rA10uXjLIWp+wEMZQ=
X-Received: by 2002:aa7:d912:0:b0:522:1e2f:99db with SMTP id
 a18-20020aa7d912000000b005221e2f99dbmr2557441edr.5.1691583713714; Wed, 09 Aug
 2023 05:21:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1690273969.git.haibo1.xu@intel.com> <CAAhSdy0yug=J0nxnnPoLYL=0MiT0w6qgPYOcv0QwMRe+fsQn8Q@mail.gmail.com>
 <87y1ilpz3m.wl-maz@kernel.org>
In-Reply-To: <87y1ilpz3m.wl-maz@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 9 Aug 2023 17:51:41 +0530
Message-ID: <CAAhSdy3f9cyh_b9Z9ah9QOdqWUMzhMV39hxUqVCStOc2FWRYDQ@mail.gmail.com>
Subject: Re: [PATCH v6 00/13] RISCV: Add KVM_GET_REG_LIST API
To: Marc Zyngier <maz@kernel.org>
Cc: oliver.upton@linux.dev, xiaobo55x@gmail.com, ajones@ventanamicro.com, 
	seanjc@google.com, Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Shuah Khan <shuah@kernel.org>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Ricardo Koller <ricarkol@google.com>, Vishal Annapurve <vannapurve@google.com>, 
	Like Xu <likexu@tencent.com>, Vipin Sharma <vipinsh@google.com>, 
	David Matlack <dmatlack@google.com>, Colton Lewis <coltonlewis@google.com>, kvm@vger.kernel.org, 
	Haibo Xu <haibo1.xu@intel.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_052156_913707_62E9B4A1 
X-CRM114-Status: GOOD (  26.18  )
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

SGkgTWFyYywKCk9uIFR1ZSwgQXVnIDgsIDIwMjMgYXQgNDo0MuKAr1BNIE1hcmMgWnluZ2llciA8
bWF6QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gTW9uLCAwNyBBdWcgMjAyMyAwNDo0ODozMyAr
MDEwMCwKPiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPiB3cm90ZToKPiA+Cj4gPiBI
aSBNYXJjLCBIaSBPbGl2ZXIsCj4gPgo+ID4gT24gVHVlLCBKdWwgMjUsIDIwMjMgYXQgMjowNeKA
r1BNIEhhaWJvIFh1IDxoYWlibzEueHVAaW50ZWwuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gS1ZN
X0dFVF9SRUdfTElTVCB3aWxsIGR1bXAgYWxsIHJlZ2lzdGVyIElEcyB0aGF0IGFyZSBhdmFpbGFi
bGUgdG8KPiA+ID4gS1ZNX0dFVC9TRVRfT05FX1JFRyBhbmQgSXQncyB2ZXJ5IHVzZWZ1bCB0byBp
ZGVudGlmeSBzb21lIHBsYXRmb3JtCj4gPiA+IHJlZ3Jlc3Npb24gaXNzdWUgZHVyaW5nIFZNIG1p
Z3JhdGlvbi4KPiA+ID4KPiA+ID4gUGF0Y2ggMS03IHJlLXN0cnVjdHVyZWQgdGhlIGdldC1yZWct
bGlzdCB0ZXN0IGluIGFhcmNoNjQgdG8gbWFrZSBzb21lCj4gPiA+IG9mIHRoZSBjb2RlIGFzIGNv
bW1vbiB0ZXN0IGZyYW1ld29yayB0aGF0IGNhbiBiZSBzaGFyZWQgYnkgcmlzY3YuCj4gPiA+Cj4g
PiA+IFBhdGNoIDggbW92ZSByZWplY3Rfc2V0IGNoZWNrIGxvZ2ljIHRvIGEgZnVuY3Rpb24gc28g
YXMgdG8gY2hlY2sgZm9yCj4gPiA+IGRpZmZlcmVudCBlcnJubyBmb3IgZGlmZmVyZW50IHJlZ2lz
dGVycy4KPiA+ID4gUGF0Y2ggOSBtb3ZlIGZpbmFsaXplX3ZjcHUgYmFjayB0byBydW5fdGVzdCBz
byB0aGF0IHJpc2N2IGNhbiBpbXBsZW1lbnQKPiA+ID4gaXRzIHNwZWNpZmljIG9wZXJhdGlvbi4K
PiA+ID4gUGF0Y2ggMTAgY2hhbmdlIHRvIGRvIHRoZSBnZXQvc2V0IG9wZXJhdGlvbiBvbmx5IG9u
IHByZXNlbnQtYmxlc3NlZCBsaXN0Lgo+ID4gPiBQYXRjaCAxMSBhZGQgdGhlIHNraXBfc2V0IGZh
Y2lsaXRpZXMgc28gdGhhdCByaXNjdiBjYW4gc2tpcCBzZXQgb3BlcmF0aW9uCj4gPiA+IG9uIHNv
bWUgcmVnaXN0ZXJzLgo+ID4gPiBQYXRjaCAxMiBlbmFibGVkIHRoZSBLVk1fR0VUX1JFR19MSVNU
IEFQSSBpbiByaXNjdi4KPiA+ID4gcGF0Y2ggMTMgYWRkZWQgdGhlIGNvcnJlc3BvbmRpbmcga3Nl
bGZ0ZXN0IGZvciBjaGVja2luZyBwb3NzaWJsZQo+ID4gPiByZWdpc3RlciByZWdyZXNzaW9ucy4K
PiA+ID4KPiA+ID4gVGhlIGdldC1yZWctbGlzdCBrdm0gc2VsZnRlc3Qgd2FzIHBvcnRlZCBmcm9t
IGFhcmNoNjQgYW5kIHRlc3RlZCB3aXRoCj4gPiA+IExpbnV4IHY2LjUtcmMzIG9uIGEgUWVtdSBy
aXNjdjY0IHZpcnQgbWFjaGluZS4KPiA+ID4KPiA+ID4gLS0tCj4gPiA+IENoYW5nZWQgc2luY2Ug
djU6Cj4gPiA+ICAgKiBSZWJhc2UgdG8gdjYuNS1yYzMKPiA+ID4gICAqIE1pbm9yIGZpeCBmb3Ig
QW5kcmV3J3MgY29tbWVudHMKPiA+ID4KPiA+ID4gQW5kcmV3IEpvbmVzICg3KToKPiA+ID4gICBL
Vk06IGFybTY0OiBzZWxmdGVzdHM6IFJlcGxhY2Ugc3RyX3dpdGhfaW5kZXggd2l0aCBzdHJkdXBf
cHJpbnRmCj4gPiA+ICAgS1ZNOiBhcm02NDogc2VsZnRlc3RzOiBEcm9wIFNWRSBjYXAgY2hlY2sg
aW4gcHJpbnRfcmVnCj4gPiA+ICAgS1ZNOiBhcm02NDogc2VsZnRlc3RzOiBSZW1vdmUgcHJpbnRf
cmVnJ3MgZGVwZW5kZW5jeSBvbiB2Y3B1X2NvbmZpZwo+ID4gPiAgIEtWTTogYXJtNjQ6IHNlbGZ0
ZXN0czogUmVuYW1lIHZjcHVfY29uZmlnIGFuZCBhZGQgdG8ga3ZtX3V0aWwuaAo+ID4gPiAgIEtW
TTogYXJtNjQ6IHNlbGZ0ZXN0czogRGVsZXRlIGNvcmVfcmVnX2ZpeHVwCj4gPiA+ICAgS1ZNOiBh
cm02NDogc2VsZnRlc3RzOiBTcGxpdCBnZXQtcmVnLWxpc3QgdGVzdCBjb2RlCj4gPiA+ICAgS1ZN
OiBhcm02NDogc2VsZnRlc3RzOiBGaW5pc2ggZ2VuZXJhbGl6aW5nIGdldC1yZWctbGlzdAo+ID4g
Pgo+ID4gPiBIYWlibyBYdSAoNik6Cj4gPiA+ICAgS1ZNOiBhcm02NDogc2VsZnRlc3RzOiBNb3Zl
IHJlamVjdF9zZXQgY2hlY2sgbG9naWMgdG8gYSBmdW5jdGlvbgo+ID4gPiAgIEtWTTogYXJtNjQ6
IHNlbGZ0ZXN0czogTW92ZSBmaW5hbGl6ZV92Y3B1IGJhY2sgdG8gcnVuX3Rlc3QKPiA+ID4gICBL
Vk06IHNlbGZ0ZXN0czogT25seSBkbyBnZXQvc2V0IHRlc3RzIG9uIHByZXNlbnQgYmxlc3NlZCBs
aXN0Cj4gPiA+ICAgS1ZNOiBzZWxmdGVzdHM6IEFkZCBza2lwX3NldCBmYWNpbGl0eSB0byBnZXRf
cmVnX2xpc3QgdGVzdAo+ID4gPiAgIEtWTTogcmlzY3Y6IEFkZCBLVk1fR0VUX1JFR19MSVNUIEFQ
SSBzdXBwb3J0Cj4gPiA+ICAgS1ZNOiByaXNjdjogc2VsZnRlc3RzOiBBZGQgZ2V0LXJlZy1saXN0
IHRlc3QKPiA+Cj4gPiBBcmUgeW91IG9rYXkgZm9yIHRoaXMgc2VyaWVzIHRvIGdvIHRocm91Z2gg
dGhlIEtWTSBSSVNDLVYgdHJlZSA/Cj4KPiBTdXJlLCBzZWVtcyBmaW5lIGZyb20gbXkgcG9pbnQg
b2Ygdmlldy4gQnV0IHBsZWFzZSBwdXQgaXQgb24gYW4KPiBpbW11dGFibGUgdG9waWMgYnJhbmNo
IHNvIHRoYXQgd2UgY2FuIGFsc28gbWVyZ2UgaXQgaW4gdGhlIGFybTY0IHRyZWUsCj4gc2hvdWxk
IHdlIG5lZWQgdG8gcmVzb2x2ZSBhbnkgY29uZmxpY3RzLgoKSSBoYXZlIGNyZWF0ZWQgdG9waWMg
YnJhbmNoIHJpc2N2X2t2bV9nZXRfcmVnX2xpc3QgaW4gdGhlIEtWTSBSSVNDLVYKcmVwbyBodHRw
czovL2dpdGh1Yi5jb20va3ZtLXJpc2N2L2xpbnV4LmdpdC4KClRoaXMgYnJhbmNoIGlzIGJhc2Vk
IHVwb24gTGludXgtNi41LXJjNSBhbmQgYWxzbyBtZXJnZWQgaW50byB0aGUKcmlzY3Zfa3ZtX25l
eHQgYnJhbmNoIGZvciB0aGUgdXBjb21pbmcgbWVyZ2Ugd2luZG93LgoKUmVnYXJkcywKQW51cAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
