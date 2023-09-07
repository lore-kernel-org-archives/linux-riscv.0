Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A900EE14D3
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 09:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YHPjPfXFQbGry7zSAdSiRU0vSnoUJ0UFaXd/rwocMYo=; b=mQdUTst7xwN99I
	kFPfCNV4oPJR3yKCjezCZMMWsiSxYPD1b4Wi/RQDY4yWx0m+SBiRUVXguR2iJNiHxiTlqjcxgedBa
	gnRKvTx/fS8ZoUNYa3ko/02ZM7F/fMhKBCxenWT4t5ZvUlbBS+IJhQx+0xVGnXkRqfLDIjXxEnLhC
	qzNvl0Ey4+b+07dah/mMaLs7ai8OQoPBOACknqeJObkqBf6TomH0DyZHJUna3cY9ov+x/Wzwixxhz
	9mD+tsk3KJqcrklC/7WXO9pYP76RjzgDoFY+LbjFGQLityfhVKFSA2OW7DtWSk+OcLpokJ/dLzeAX
	12yiSQV+RAZSZzTUlnsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeB9v-00BfTg-1U;
	Thu, 07 Sep 2023 09:18:43 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeB9r-00BfTE-2b;
	Thu, 07 Sep 2023 09:18:41 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2bcc187e0b5so13069391fa.1;
        Thu, 07 Sep 2023 02:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694078317; x=1694683117; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EBBEzL7qY3uq6+ZqigJzuGuvME9kRMD/negQGQFd1kU=;
        b=REFIvKdLp+ZfBtmMQrOrnq/2cV6lIxfp2oDkNhZiBc/gXtV0IfEdJQhthMT3PZgUHL
         bgYuvZxgLms9aIT4fKDLqUUNpjQE68RHvUr1lpx74QOH0XgrQHvUyE3yozmkbf88o6Tn
         +sXWD8Tse/4cwRJhs6aaAEjXAiiPAmq+netUSMlbQyuRBZNqexfJaHH/OnW/8qg35cad
         54UwmvniAITvV+f+UQ97IhD8eOF8PJB3S8qyblqboRTFQNslL352528oCSFLI1kHKtXm
         EqSIPwrZ1fIOHfe9gN3EzNjHZxg/f3kA3r+q2nbGVjDpL/664OmWIDAQJ0PBW8fmKEkA
         A1FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694078317; x=1694683117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EBBEzL7qY3uq6+ZqigJzuGuvME9kRMD/negQGQFd1kU=;
        b=XQo+ecPtdG1G5MmWFxCX8jP8xqpXAxsdHcN9ssdeWW4AprokCN24eRKAYyOlYgGxYo
         WysMTZUgSXh5bcOYLtMMFIYyQiV0r5jJGM5WXOsMFK0JLwwGU22w102yfHvW+5x2fNM2
         8redOg7bH1kLwzb1cSA9Hdfv4E1DamXkUlH9HVkXqHFn4rhF9CbWPaNSBz9gWseUtCXX
         zBR1BWKPnMcxWL8nlZEUuelrrx+pMS2UxNincKhCX5oNIQfycuRHRaImVMGj6FlxJtbb
         ZMZoEzNDbCCbaCJIbK9us5lKOt6dfnExwHBZ3t3Ws08rJae9/oq07e6jwMR7p7zmrfYu
         p04A==
X-Gm-Message-State: AOJu0Yya5jTCvgu30bISNoret5J7svNwkaQnj9CiowilAcNFWmY2UFik
	6l/wNOW8YZGpvkAf/+Bnlg86/gmFrpufH2g1YxY=
X-Google-Smtp-Source: AGHT+IF10+wenAf/r4lgyEOBY89UZGCOdwUC3J+LpxGhdoe1wYTW/cIeqheprklSo2IBVjz46fa7sLxs5xkSY5w4zLI=
X-Received: by 2002:a2e:804c:0:b0:2bc:c830:4cbb with SMTP id
 p12-20020a2e804c000000b002bcc8304cbbmr3729686ljg.45.1694078317171; Thu, 07
 Sep 2023 02:18:37 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1693659382.git.haibo1.xu@intel.com> <b6ef1b031e3a581f481cf19a26623388163444b4.1693659382.git.haibo1.xu@intel.com>
 <20230904-aa8b0d8d23d391586686038a@orel> <CAJve8ok5cU+h1K+WJ+aDpB+u+PBo8XosUyyVbMGy-xR0XiWFdw@mail.gmail.com>
 <CAJve8om+dLcG+4trDfG1yx8vhj52RhPZrJoF-emWDX+OPM088A@mail.gmail.com> <20230907-bde62d037a3aaeedfe31f964@orel>
In-Reply-To: <20230907-bde62d037a3aaeedfe31f964@orel>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Thu, 7 Sep 2023 17:18:25 +0800
Message-ID: <CAJve8okJOHofRK=0VRG8QPetOgk_WexEui_3UtEKk+4x1iPwMA@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] KVM: riscv: selftest: Change vcpu_has_ext to a
 common function
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Haibo Xu <haibo1.xu@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, Guo Ren <guoren@kernel.org>, 
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>, wchen <waylingii@gmail.com>, 
	Sean Christopherson <seanjc@google.com>, Ricardo Koller <ricarkol@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, David Matlack <dmatlack@google.com>, 
	Aaron Lewis <aaronlewis@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Ackerley Tng <ackerleytng@google.com>, Mingwei Zhang <mizhang@google.com>, 
	Jim Mattson <jmattson@google.com>, Lei Wang <lei4.wang@intel.com>, 
	Vipin Sharma <vipinsh@google.com>, Maxim Levitsky <mlevitsk@redhat.com>, Like Xu <likexu@tencent.com>, 
	Peter Gonda <pgonda@google.com>, Thomas Huth <thuth@redhat.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	David Woodhouse <dwmw@amazon.co.uk>, Michal Luczaj <mhal@rbox.co>, Paul Durrant <paul@xen.org>, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_021839_867442_C11E8386 
X-CRM114-Status: GOOD (  23.78  )
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

T24gVGh1LCBTZXAgNywgMjAyMyBhdCA1OjAx4oCvUE0gQW5kcmV3IEpvbmVzIDxham9uZXNAdmVu
dGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiBPbiBUaHUsIFNlcCAwNywgMjAyMyBhdCAxMTo1Nzow
MEFNICswODAwLCBIYWlibyBYdSB3cm90ZToKPiA+IE9uIFdlZCwgU2VwIDYsIDIwMjMgYXQgNjox
MOKAr1BNIEhhaWJvIFh1IDx4aWFvYm81NXhAZ21haWwuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4g
T24gTW9uLCBTZXAgNCwgMjAyMyBhdCAxMDowNOKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gT24gU2F0LCBTZXAgMDIsIDIw
MjMgYXQgMDg6NTk6MjlQTSArMDgwMCwgSGFpYm8gWHUgd3JvdGU6Cj4gPiA+ID4gPiBkaWZmIC0t
Z2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jIGIv
dG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jCj4gPiA+ID4g
PiBpbmRleCBkOGVjYWNkMDNlY2YuLmM0MDI4YmYzMmUzZiAxMDA2NDQKPiA+ID4gPiA+IC0tLSBh
L3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNjdi9nZXQtcmVnLWxpc3QuYwo+ID4gPiA+
ID4gKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5j
Cj4gPiA+ID4gPiBAQCAtNDQsMjAgKzQ0LDYgQEAgYm9vbCBjaGVja19yZWplY3Rfc2V0KGludCBl
cnIpCj4gPiA+ID4gPiAgICAgICByZXR1cm4gZXJyID09IEVJTlZBTDsKPiA+ID4gPiA+ICB9Cj4g
PiA+ID4gPgo+ID4gPiA+ID4gLXN0YXRpYyBpbmxpbmUgYm9vbCB2Y3B1X2hhc19leHQoc3RydWN0
IGt2bV92Y3B1ICp2Y3B1LCBpbnQgZXh0KQo+ID4gPiA+ID4gLXsKPiA+ID4gPiA+IC0gICAgIGlu
dCByZXQ7Cj4gPiA+ID4gPiAtICAgICB1bnNpZ25lZCBsb25nIHZhbHVlOwo+ID4gPiA+ID4gLQo+
ID4gPiA+ID4gLSAgICAgcmV0ID0gX192Y3B1X2dldF9yZWcodmNwdSwgUklTQ1ZfSVNBX0VYVF9S
RUcoZXh0KSwgJnZhbHVlKTsKPiA+ID4gPiA+IC0gICAgIGlmIChyZXQpIHsKPiA+ID4gPiA+IC0g
ICAgICAgICAgICAgcHJpbnRmKCJGYWlsZWQgdG8gZ2V0IGV4dCAlZCIsIGV4dCk7Cj4gPiA+ID4g
PiAtICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKPiA+ID4gPiA+IC0gICAgIH0KPiA+ID4gPiA+
IC0KPiA+ID4gPiA+IC0gICAgIHJldHVybiAhIXZhbHVlOwo+ID4gPiA+Cj4gPiA+ID4gZ2V0LXJl
Zy1saXN0IHdpbGwgbm93IGFzc2VydCBvbiBnZXQtcmVnIHdoZW4gYW4gZXh0ZW5zaW9uIGlzbid0
IHByZXNlbnQsCj4gPiA+ID4gcmF0aGVyIHRoYW4gZmFpbGluZyB0aGUgX19URVNUX1JFUVVJUkUo
KSwgd2hpY2ggd291bGQgZG8gYSBza2lwIGluc3RlYWQuCj4gPiA+ID4gV2UgbmVlZCBib3RoIHRo
ZSByZXR1cm4gZmFsc2UgdmVyc2lvbiBhbmQgdGhlIGFzc2VydCB2ZXJzaW9uLgo+ID4gPiA+Cj4g
PiA+Cj4gPiA+IE9rLCBXaWxsIGtlZXAgdGhpcyBvbmUgZm9yIGdldC1yZWctbGlzdCBhbmQgYWRk
IGFub3RoZXIgb25lIGZvcgo+ID4gPiBhcmNoLXRpbWVyIHNwZWNpZmljIHVzYWdlLgo+ID4gPgo+
ID4KPiA+IEp1c3QgdGhvdWdodCBhYm91dCBpdCBhZ2FpbiwgbWF5YmUgd2Ugb25seSBuZWVkIHRo
ZSAicmV0dXJuIGZhbHNlIgo+ID4gdmVyc2lvbiBmb3IgYm90aCBnZXQtcmVnLWxpc3QKPiA+IGFu
ZCBhcmNoLXRpbWVyIHRlc3RzIHNpbmNlIGlmIGFuIGV4dGVuc2lvbiB3YXMgbm90IGF2YWlsYWJs
ZSwgdGhlIHRlc3QKPiA+IGNhbiBiZSBza2lwcGVkIHdpdGggYSBtZXNzYWdlLgo+ID4KPiA+IGJv
b2wgdmNwdV9oYXNfZXh0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgaW50IGV4dCkKPiA+IHsKPiA+
ICAgICAgICB1bnNpZ25lZCBsb25nIHZhbHVlID0gMDsKPiA+Cj4gPiAgICAgICAgX192Y3B1X2dl
dF9yZWcodmNwdSwgUklTQ1ZfSVNBX0VYVF9SRUcoZXh0KSwgJnZhbHVlKTsKPiA+Cj4gPiAgICAg
ICAgcmV0dXJuICEhdmFsdWU7Cj4gPiB9Cj4KPiBZdXAsIEkgaGFkIGFjdHVhbGx5IHNlZW4gdGhh
dCB3aGVuIHJldmlld2luZyBhIGxhdGVyIHBhdGNoIGluIHRoaXMgc2VyaWVzLAo+IGJ1dCBJIHdh
c24ndCBjb25jZXJuZWQgaWYgd2UgYWRkZWQgdGhlIGFzc2VydCB0eXBlIGFueXdheSwgc2luY2Ug
d2UKPiBmcmVxdWVudGx5IGVuZCB1cCB3aXRoIHRoZSB0d28gZnVuY3Rpb24gdHlwZXMgZm9yIEtW
TSBxdWVyaWVzLiBJZiB3ZSBkb24ndAo+IGhhdmUgYSBuZWVkIGZvciBhbiBhc3NlcnQgdHlwZSB5
ZXQsIHRoZW4gd2UgZG9uJ3QgbmVlZCB0byBpbnRyb2R1Y2UgaXQuCj4gSG93ZXZlciwgd2Ugc2hv
dWxkIGludHJvZHVjZSB0aGUgbm9uLWFzc2VydCB0eXBlIGFzIF9fdmNwdV9oYXNfZXh0KCksCj4g
cmVzZXJ2aW5nIHRoZSB2Y3B1X2hhc19leHQoKSBuYW1lIGZvciB0aGUgYXNzZXJ0IHR5cGUsIHBl
ciB0aGUga3ZtCj4gc2VsZnRlc3RzIG5hbWluZyBjb252ZW50aW9uLgo+CgpTdXJlLCB0aGFua3Mh
Cgo+IFRoYW5rcywKPiBkcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
