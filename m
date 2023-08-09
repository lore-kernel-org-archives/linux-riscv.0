Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7ABEEB64DD
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 03:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d0zhL4OzNX41IJK2QNXBu7z1SGw+3iEWoU9vQCvI/LQ=; b=eHu6/nq8xDWAk4
	ATpt0WN1gwKsxQaJ/aUAo/iGAZnjt0L4/kxLcsWc1Oq1eWv96it/Q1cVEHtpZSr5Wi5wyE7P485Hv
	e6MX1yHmRuU5IvXIsOBMXTKJg7YS7R46KAbzuFTp2Rg3TmMQEviFy6rPWeaorLMmIE70U6dCZrMnF
	XvCWGpR55kbapprer/nsgOJpDrLo3iWjyS7vji53iZ4RGcZjyUSfVoL9v/kUfNR95txcvOEw0auNH
	7waHjWk+0eGSYX49hqni9LUI5TGehFavK9PXWSPCQnWNURdAVEP/NCg+66mPTwV5n/jv/a0LpG14p
	0kJXX/b8qmKQBRG+IWYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTaBT-003xtW-0G;
	Wed, 09 Aug 2023 03:48:31 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTaBP-003xrZ-0Q
	for linux-riscv@lists.infradead.org;
	Wed, 09 Aug 2023 03:48:28 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-51a52a7d859so998505a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 08 Aug 2023 20:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20221208.gappssmtp.com; s=20221208; t=1691552903; x=1692157703;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wcsclxtm27Oz1sDHzPRuy+Izl0iwle6aRoNm7chV/mE=;
        b=EAu5utSgSArNbjdpW2PWgXWxU171HGHts/s7dBkm0zVj5aCYmQgRY1eVDfdx5vr8cA
         uGKn7OVjBlH4x+6LdBhrQT6Lg9LhLj1yy1RH2qqx1h5mvCbwLwDTmi/MZ0ikszErkW7A
         c2wgoyYGmr5Xx1SM2v4R30bMVFeofVKHtC6o0RiWqEd1AY94fkLRImRdySpiVfKzCHyP
         2nptFLeLbD+hH2/FAjLldDdYM1xVC0YQevFNuibuhkBMw35KddsaCG7bR1RVsurPGN57
         4zXG/WD6m3xLx9dq37bTRRVaAPx+TLrhm8T5caUwPW3f4koGnwh0i2q7yp3JZqW5SBBb
         uphQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691552903; x=1692157703;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wcsclxtm27Oz1sDHzPRuy+Izl0iwle6aRoNm7chV/mE=;
        b=VVcwyENMSPmY5NxBZMHxSuWvPxmvNEBOV4grNUvrTnKAT/gJ5LOXEt3zPyLea7iFN/
         w7CaCCHPRvvuswIQ8ORJzZeL7KvXYZGVKjRUxRr4USu/9z/s+f4pBQpd7OPGZz4M84iq
         zvzasWsxdT3X1X5CU4yby7q9WOkW5kd9UqyiuT4t/600/zIe/AiSCC5BtWxp9uynTrkZ
         bnmNcEHoOVpTDHqTHjBYBvb7HkAZK2g79478yJN/l5KcF0ouxkH7OVWvuzXM/IdhayfQ
         3ps999t78eE+Cdc40uxlk/M6g1jrfVnzmcTpCiVVvzS3rcBlyV32+6mcXSUwejk26WZ1
         gpEg==
X-Gm-Message-State: AOJu0YxWGhcAdpvryffAp4ZiE+K5WajsgQeNDuHe6Ayt4o880GKmBNN9
	aBy1g8uLlLqgWylzwH5pL9kCLpdxkSOOocl3bLkpaA==
X-Google-Smtp-Source: AGHT+IFauvweysXXn8GP5MBQlVkSnEFT74it4SwljMy29zvw5obroURdfY0qKL+rjI6eMwJTbfFGGEzPUIYTUHgx/6I=
X-Received: by 2002:a05:6402:3587:b0:51f:ef58:da87 with SMTP id
 y7-20020a056402358700b0051fef58da87mr14581549edc.2.1691552902500; Tue, 08 Aug
 2023 20:48:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1690273969.git.haibo1.xu@intel.com> <CAAhSdy0yug=J0nxnnPoLYL=0MiT0w6qgPYOcv0QwMRe+fsQn8Q@mail.gmail.com>
 <87y1ilpz3m.wl-maz@kernel.org> <CAJve8onZuOHkAUVY3=QeBPMx5n2F1fGgn57rPp7MB1Q5=vXasA@mail.gmail.com>
In-Reply-To: <CAJve8onZuOHkAUVY3=QeBPMx5n2F1fGgn57rPp7MB1Q5=vXasA@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 9 Aug 2023 09:18:09 +0530
Message-ID: <CAAhSdy277PEBZ4wyUHxQPyN2TugGfhBmC5jUoFTAqMU8vwbt5w@mail.gmail.com>
Subject: Re: [PATCH v6 00/13] RISCV: Add KVM_GET_REG_LIST API
To: Haibo Xu <xiaobo55x@gmail.com>
Cc: Marc Zyngier <maz@kernel.org>, oliver.upton@linux.dev, ajones@ventanamicro.com, 
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
X-CRM114-CacheID: sfid-20230808_204827_354193_1AD7B4BC 
X-CRM114-Status: GOOD (  29.58  )
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

T24gV2VkLCBBdWcgOSwgMjAyMyBhdCA4OjU24oCvQU0gSGFpYm8gWHUgPHhpYW9ibzU1eEBnbWFp
bC5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBBdWcgOCwgMjAyMyBhdCA3OjEy4oCvUE0gTWFyYyBa
eW5naWVyIDxtYXpAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24gTW9uLCAwNyBBdWcgMjAy
MyAwNDo0ODozMyArMDEwMCwKPiA+IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+IHdy
b3RlOgo+ID4gPgo+ID4gPiBIaSBNYXJjLCBIaSBPbGl2ZXIsCj4gPiA+Cj4gPiA+IE9uIFR1ZSwg
SnVsIDI1LCAyMDIzIGF0IDI6MDXigK9QTSBIYWlibyBYdSA8aGFpYm8xLnh1QGludGVsLmNvbT4g
d3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBLVk1fR0VUX1JFR19MSVNUIHdpbGwgZHVtcCBhbGwgcmVn
aXN0ZXIgSURzIHRoYXQgYXJlIGF2YWlsYWJsZSB0bwo+ID4gPiA+IEtWTV9HRVQvU0VUX09ORV9S
RUcgYW5kIEl0J3MgdmVyeSB1c2VmdWwgdG8gaWRlbnRpZnkgc29tZSBwbGF0Zm9ybQo+ID4gPiA+
IHJlZ3Jlc3Npb24gaXNzdWUgZHVyaW5nIFZNIG1pZ3JhdGlvbi4KPiA+ID4gPgo+ID4gPiA+IFBh
dGNoIDEtNyByZS1zdHJ1Y3R1cmVkIHRoZSBnZXQtcmVnLWxpc3QgdGVzdCBpbiBhYXJjaDY0IHRv
IG1ha2Ugc29tZQo+ID4gPiA+IG9mIHRoZSBjb2RlIGFzIGNvbW1vbiB0ZXN0IGZyYW1ld29yayB0
aGF0IGNhbiBiZSBzaGFyZWQgYnkgcmlzY3YuCj4gPiA+ID4KPiA+ID4gPiBQYXRjaCA4IG1vdmUg
cmVqZWN0X3NldCBjaGVjayBsb2dpYyB0byBhIGZ1bmN0aW9uIHNvIGFzIHRvIGNoZWNrIGZvcgo+
ID4gPiA+IGRpZmZlcmVudCBlcnJubyBmb3IgZGlmZmVyZW50IHJlZ2lzdGVycy4KPiA+ID4gPiBQ
YXRjaCA5IG1vdmUgZmluYWxpemVfdmNwdSBiYWNrIHRvIHJ1bl90ZXN0IHNvIHRoYXQgcmlzY3Yg
Y2FuIGltcGxlbWVudAo+ID4gPiA+IGl0cyBzcGVjaWZpYyBvcGVyYXRpb24uCj4gPiA+ID4gUGF0
Y2ggMTAgY2hhbmdlIHRvIGRvIHRoZSBnZXQvc2V0IG9wZXJhdGlvbiBvbmx5IG9uIHByZXNlbnQt
Ymxlc3NlZCBsaXN0Lgo+ID4gPiA+IFBhdGNoIDExIGFkZCB0aGUgc2tpcF9zZXQgZmFjaWxpdGll
cyBzbyB0aGF0IHJpc2N2IGNhbiBza2lwIHNldCBvcGVyYXRpb24KPiA+ID4gPiBvbiBzb21lIHJl
Z2lzdGVycy4KPiA+ID4gPiBQYXRjaCAxMiBlbmFibGVkIHRoZSBLVk1fR0VUX1JFR19MSVNUIEFQ
SSBpbiByaXNjdi4KPiA+ID4gPiBwYXRjaCAxMyBhZGRlZCB0aGUgY29ycmVzcG9uZGluZyBrc2Vs
ZnRlc3QgZm9yIGNoZWNraW5nIHBvc3NpYmxlCj4gPiA+ID4gcmVnaXN0ZXIgcmVncmVzc2lvbnMu
Cj4gPiA+ID4KPiA+ID4gPiBUaGUgZ2V0LXJlZy1saXN0IGt2bSBzZWxmdGVzdCB3YXMgcG9ydGVk
IGZyb20gYWFyY2g2NCBhbmQgdGVzdGVkIHdpdGgKPiA+ID4gPiBMaW51eCB2Ni41LXJjMyBvbiBh
IFFlbXUgcmlzY3Y2NCB2aXJ0IG1hY2hpbmUuCj4gPiA+ID4KPiA+ID4gPiAtLS0KPiA+ID4gPiBD
aGFuZ2VkIHNpbmNlIHY1Ogo+ID4gPiA+ICAgKiBSZWJhc2UgdG8gdjYuNS1yYzMKPiA+ID4gPiAg
ICogTWlub3IgZml4IGZvciBBbmRyZXcncyBjb21tZW50cwo+ID4gPiA+Cj4gPiA+ID4gQW5kcmV3
IEpvbmVzICg3KToKPiA+ID4gPiAgIEtWTTogYXJtNjQ6IHNlbGZ0ZXN0czogUmVwbGFjZSBzdHJf
d2l0aF9pbmRleCB3aXRoIHN0cmR1cF9wcmludGYKPiA+ID4gPiAgIEtWTTogYXJtNjQ6IHNlbGZ0
ZXN0czogRHJvcCBTVkUgY2FwIGNoZWNrIGluIHByaW50X3JlZwo+ID4gPiA+ICAgS1ZNOiBhcm02
NDogc2VsZnRlc3RzOiBSZW1vdmUgcHJpbnRfcmVnJ3MgZGVwZW5kZW5jeSBvbiB2Y3B1X2NvbmZp
Zwo+ID4gPiA+ICAgS1ZNOiBhcm02NDogc2VsZnRlc3RzOiBSZW5hbWUgdmNwdV9jb25maWcgYW5k
IGFkZCB0byBrdm1fdXRpbC5oCj4gPiA+ID4gICBLVk06IGFybTY0OiBzZWxmdGVzdHM6IERlbGV0
ZSBjb3JlX3JlZ19maXh1cAo+ID4gPiA+ICAgS1ZNOiBhcm02NDogc2VsZnRlc3RzOiBTcGxpdCBn
ZXQtcmVnLWxpc3QgdGVzdCBjb2RlCj4gPiA+ID4gICBLVk06IGFybTY0OiBzZWxmdGVzdHM6IEZp
bmlzaCBnZW5lcmFsaXppbmcgZ2V0LXJlZy1saXN0Cj4gPiA+ID4KPiA+ID4gPiBIYWlibyBYdSAo
Nik6Cj4gPiA+ID4gICBLVk06IGFybTY0OiBzZWxmdGVzdHM6IE1vdmUgcmVqZWN0X3NldCBjaGVj
ayBsb2dpYyB0byBhIGZ1bmN0aW9uCj4gPiA+ID4gICBLVk06IGFybTY0OiBzZWxmdGVzdHM6IE1v
dmUgZmluYWxpemVfdmNwdSBiYWNrIHRvIHJ1bl90ZXN0Cj4gPiA+ID4gICBLVk06IHNlbGZ0ZXN0
czogT25seSBkbyBnZXQvc2V0IHRlc3RzIG9uIHByZXNlbnQgYmxlc3NlZCBsaXN0Cj4gPiA+ID4g
ICBLVk06IHNlbGZ0ZXN0czogQWRkIHNraXBfc2V0IGZhY2lsaXR5IHRvIGdldF9yZWdfbGlzdCB0
ZXN0Cj4gPiA+ID4gICBLVk06IHJpc2N2OiBBZGQgS1ZNX0dFVF9SRUdfTElTVCBBUEkgc3VwcG9y
dAo+ID4gPiA+ICAgS1ZNOiByaXNjdjogc2VsZnRlc3RzOiBBZGQgZ2V0LXJlZy1saXN0IHRlc3QK
PiA+ID4KPiA+ID4gQXJlIHlvdSBva2F5IGZvciB0aGlzIHNlcmllcyB0byBnbyB0aHJvdWdoIHRo
ZSBLVk0gUklTQy1WIHRyZWUgPwo+ID4KPiA+IFN1cmUsIHNlZW1zIGZpbmUgZnJvbSBteSBwb2lu
dCBvZiB2aWV3LiBCdXQgcGxlYXNlIHB1dCBpdCBvbiBhbgo+ID4gaW1tdXRhYmxlIHRvcGljIGJy
YW5jaCBzbyB0aGF0IHdlIGNhbiBhbHNvIG1lcmdlIGl0IGluIHRoZSBhcm02NCB0cmVlLAo+ID4g
c2hvdWxkIHdlIG5lZWQgdG8gcmVzb2x2ZSBhbnkgY29uZmxpY3RzLgo+ID4KPgo+IEhpIE1hcmMs
Cj4KPiBUaGFua3MgZm9yIHlvdXIgcmV2aWV3IQo+Cj4gV2hpY2ggdG9waWMgYnJhbmNoIGRvIHlv
dSBwcmVmZXIgb3Igc3VnZ2VzdCB0byB1c2U/Cj4gSSBjYW4gZG8gYSByZWJhc2Ugb24gaXQgYW5k
IGZpeCBhbnkgcG90ZW50aWFsIGNvbmZsaWN0cy4KCkkgd2lsbCBzaGFyZSBhIGJyYW5jaCB3aXRo
IGEgc3RhYmxlIGNvbW1pdCBoaXN0b3J5LgpJIGhhdmUgYWxyZWFkeSByZXNvbHZlZCBjb25mbGlj
dHMgYXQgbXkgZW5kLgoKUmVnYXJkcywKQW51cAoKPgo+IFJlZ2FyZHMsCj4gSGFpYm8KPgo+ID4g
VGhhbmtzLAo+ID4KPiA+ICAgICAgICAgTS4KPiA+Cj4gPiAtLQo+ID4gV2l0aG91dCBkZXZpYXRp
b24gZnJvbSB0aGUgbm9ybSwgcHJvZ3Jlc3MgaXMgbm90IHBvc3NpYmxlLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
