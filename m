Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00DECEB8FA3
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Sep 2023 02:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=trNPByeLXv3yFyLDTJssnckgydagjaVT4yIkVe7G+3s=; b=Nk3NC0sUGNkR0J
	IVS1N9Znu14HcMhBhfbKW4XeEXL61uTy2ZgKMaWIz8457+21zwsw3ot99cx9n05pak/J42uKLf0io
	f6V+AR2nVN2/bpdIDrGsroVvM8f6cK8ZYshghQDtZfCOeG50m74BBRLeIGLAKIeNRFMlLVistR+HT
	X7TZA7T3sJiIb6Gc6Jmw4LP72e486iD/r4UfdfnXE/fecCUO33reQzzBtcV23MDSSchvQP3P9xce7
	iXl8E8BXlr5p3NUUZLwpbfmDqKie1qEUzJ3q+DCdB7FMzWnhRSF9K/wf9DZZw6gZE91TPF9C7SpKu
	xd8eDbAGfUJ/H4eu6VaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdi4x-0073xt-2r;
	Wed, 06 Sep 2023 02:15:39 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdi4u-0073wx-20;
	Wed, 06 Sep 2023 02:15:38 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2bcc331f942so5686931fa.0;
        Tue, 05 Sep 2023 19:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693966534; x=1694571334; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8AW5DEjMPwf/WOBjq6Yy/rxPXX4Pw+fsGwtExcVSRjU=;
        b=gs9kwlOKd43Eb7k9MIa66vgDGFr7OPfEqk1PmR5jhSsj77tKX4Q2wO8EHeEOvp5z8k
         CItpnFcfIVuXdA3FSeJEUrSzEjP58NcAd/fn5cSPiEvOXxd3tICW1lujyvEc9cH1lLxX
         nZ21iZDTYEFngx2N7CAX3WnL/zNyUTih50dY6eJ+vqB2gJ8XAOxRExiscfJn906lhxba
         Ds+6J52W5XE/wtPIZD46K4GvHeOCcUjODE4FlF7LO3AWe/mZnMZrzi+Nm0slnkklD49c
         SwSKZsrlVTzjFVAchV9Xk0QBfG+8Ix720uXK2GSxpGbTJF+pGfbYvMT4cnZtWcg2X8Xq
         U/HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693966534; x=1694571334;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8AW5DEjMPwf/WOBjq6Yy/rxPXX4Pw+fsGwtExcVSRjU=;
        b=LLJwlhqz4rZrAin+zUXdcIs1mYZaahAcovdRJAHFc1F9n38azJd2kBGgCtD3vNK1np
         HBDA9D0kM8YHbUiclAITrYF9EthqJ4jRpFiq9x6vIv876aQ+H8IjsLamUQXdvtEA8UPo
         ID3o233Ed4Y9uxdvd/imvR/Kdirwi98MGKnso0N3N2itbJD5q4xAE4BpAnjkS0B3XXAv
         pUfaS7/Beo0ilTgXtjOlnG62TKSoClW07u9kN0UlgM6cmt2t4QYUyYpWqxhzI5Bbq+G6
         q/L79+jiYVnQsdp++tUdLxe1CdRC4MGWElDSB8dWLPag7mKgHs6d2uKRQOX9YEgN9Pcq
         Eyqw==
X-Gm-Message-State: AOJu0Yw4KU08oA0mlXDgfQcCU42s7cmvCjSuBEAB1rrpGC7jYQtCAliR
	XZgcY11TPi7+ss4KHkux3jpwHSYnJ90uGBSxn9A=
X-Google-Smtp-Source: AGHT+IFINadRkT5OvEK7LBs75KJ/A6GYonKZM55L5Tbnd4WVkS+YBQznNFHrs/NRClyfQ2LSLrrokB+J+aTJxpaXGK4=
X-Received: by 2002:a2e:9e56:0:b0:2b6:c3f9:b86b with SMTP id
 g22-20020a2e9e56000000b002b6c3f9b86bmr501791ljk.15.1693966534248; Tue, 05 Sep
 2023 19:15:34 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1693659382.git.haibo1.xu@intel.com> <7affb0387d7272573f7093de7887872e1fb5979b.1693659382.git.haibo1.xu@intel.com>
 <20230904-ba5051a5bf17d17f2711d7dc@orel>
In-Reply-To: <20230904-ba5051a5bf17d17f2711d7dc@orel>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Wed, 6 Sep 2023 10:15:23 +0800
Message-ID: <CAJve8ok7xny2f+J_O0SFZRAiKGMinM9C1YK=OXVpABem=KttnQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] KVM: selftests: Unify the codes for guest
 exception handling
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Haibo Xu <haibo1.xu@intel.com>, Sean Christopherson <seanjc@google.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Guo Ren <guoren@kernel.org>, 
	Greentime Hu <greentime.hu@sifive.com>, wchen <waylingii@gmail.com>, 
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>, Ricardo Koller <ricarkol@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, David Matlack <dmatlack@google.com>, 
	Aaron Lewis <aaronlewis@google.com>, Mingwei Zhang <mizhang@google.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Ackerley Tng <ackerleytng@google.com>, 
	Lei Wang <lei4.wang@intel.com>, Vipin Sharma <vipinsh@google.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Like Xu <likexu@tencent.com>, 
	Peter Gonda <pgonda@google.com>, Thomas Huth <thuth@redhat.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	David Woodhouse <dwmw@amazon.co.uk>, Michal Luczaj <mhal@rbox.co>, zhang songyi <zhang.songyi@zte.com.cn>, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_191536_662279_CEE0F819 
X-CRM114-Status: GOOD (  16.19  )
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

T24gTW9uLCBTZXAgNCwgMjAyMyBhdCA3OjE24oCvUE0gQW5kcmV3IEpvbmVzIDxham9uZXNAdmVu
dGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiBPbiBTYXQsIFNlcCAwMiwgMjAyMyBhdCAwODo1OToy
M1BNICswODAwLCBIYWlibyBYdSB3cm90ZToKPiA+IFJlbmFtZSB0aGUgdm1faW5pdF9kZXNjcmlw
dG9yX3RhYmxlcygpIGFuZCB2Y3B1X2luaXRfdmVjdG9yX3RhYmxlcygpCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXiB2Y3B1X2luaXRfZGVzY3JpcHRvcl90
YWJsZXMoKQo+Cj4gPiBwcm90b3R5cGVzIHRvIHZtX2luaXRfdmVjdG9yX3RhYmxlcygpIGFuZCB2
Y3B1X2luaXRfdmVjdG9yX3RhYmxlcygpCj4gPiByZXNwZWN0aXZlbHksIHNvIHRoYXQgd2UgY2Fu
IHVzZSBjb21tb24gbmFtZXMgZm9yIHRoZSBhcmNoaXRlY3R1cmVzCj4gPiAoeDg2L2FhcmNoNjQv
cmlzY3YpIGFuZCB0aGVuIHB1dCB0aGVtIGluIGEgY29tbW9uIGhlYWRlci4KPiA+Cj4gPiBCeSB0
aGUgd2F5LCB2bV9pbnN0YWxsX2V4Y2VwdGlvbl9oYW5kbGVyKCkgcHJvdG90eXBlIHdlcmUgYWxz
byBtb3ZlZCB0bwo+ID4gdGhlIGNvbW1vbiBoZWFkZXIgc2luY2UgdGhleSBhcmUgY29tbW9ubHkg
dXNlZCBhY3Jvc3MgdGhlIGFyY2hpdGVjdHVyZXMuCj4gPgo+ID4gVGhlIHBhdGNoIGlzIGEgcHJl
cGFyYXRpb24gdG8gc2hhcmUgdGhlIGd1ZXN0IGV4Y2VwdGlvbiBoYW5kbGluZyBjb2Rlcwo+ID4g
aW4gcmlzY3YuCj4gPgo+ID4gU3VnZ2VzdGVkLWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50
YW5hbWljcm8uY29tPgo+ID4gU3VnZ2VzdGVkLWJ5OiBTZWFuIENocmlzdG9waGVyc29uIDxzZWFu
amNAZ29vZ2xlLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IEhhaWJvIFh1IDxoYWlibzEueHVAaW50
ZWwuY29tPgo+ID4gLS0tCj4gPiAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2FhcmNoNjQv
YXJjaF90aW1lci5jICAgICAgICAgIHwgNCArKy0tCj4gPiAgdG9vbHMvdGVzdGluZy9zZWxmdGVz
dHMva3ZtL2FhcmNoNjQvZGVidWctZXhjZXB0aW9ucy5jICAgIHwgNCArKy0tCj4gPiAgdG9vbHMv
dGVzdGluZy9zZWxmdGVzdHMva3ZtL2FhcmNoNjQvcGFnZV9mYXVsdF90ZXN0LmMgICAgIHwgNCAr
Ky0tCj4gPiAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2FhcmNoNjQvdmdpY19pcnEuYyAg
ICAgICAgICAgIHwgNCArKy0tCj4gPiAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2luY2x1
ZGUvYWFyY2g2NC9wcm9jZXNzb3IuaCAgIHwgOCArLS0tLS0tLQo+ID4gIHRvb2xzL3Rlc3Rpbmcv
c2VsZnRlc3RzL2t2bS9pbmNsdWRlL2t2bV91dGlsX2Jhc2UuaCAgICAgICB8IDcgKysrKysrKwo+
ID4gIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9pbmNsdWRlL3g4Nl82NC9wcm9jZXNzb3Iu
aCAgICB8IDUgLS0tLS0KPiA+ICB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vbGliL2FhcmNo
NjQvcHJvY2Vzc29yLmMgICAgICAgfCA2ICsrKy0tLQo+ID4gIHRvb2xzL3Rlc3Rpbmcvc2VsZnRl
c3RzL2t2bS9saWIveDg2XzY0L3Byb2Nlc3Nvci5jICAgICAgICB8IDQgKystLQo+ID4gIHRvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS94ODZfNjQvYW14X3Rlc3QuYyAgICAgICAgICAgICB8IDQg
KystLQo+ID4gIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS94ODZfNjQvZml4X2h5cGVyY2Fs
bF90ZXN0LmMgICB8IDQgKystLQo+ID4gIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS94ODZf
NjQvaHlwZXJ2X2V2bWNzLmMgICAgICAgICB8IDQgKystLQo+ID4gIHRvb2xzL3Rlc3Rpbmcvc2Vs
ZnRlc3RzL2t2bS94ODZfNjQvaHlwZXJ2X2ZlYXR1cmVzLmMgICAgICB8IDggKysrKy0tLS0KPiA+
ICB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0veDg2XzY0L2h5cGVydl9pcGkuYyAgICAgICAg
ICAgfCA2ICsrKy0tLQo+ID4gIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS94ODZfNjQva3Zt
X3B2X3Rlc3QuYyAgICAgICAgICB8IDQgKystLQo+ID4gIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3Rz
L2t2bS94ODZfNjQvbW9uaXRvcl9td2FpdF90ZXN0LmMgICB8IDQgKystLQo+ID4gIC4uLi90ZXN0
aW5nL3NlbGZ0ZXN0cy9rdm0veDg2XzY0L3BtdV9ldmVudF9maWx0ZXJfdGVzdC5jICB8IDggKysr
Ky0tLS0KPiA+ICAuLi4va3ZtL3g4Nl82NC9zbWFsbGVyX21heHBoeWFkZHJfZW11bGF0aW9uX3Rl
c3QuYyAgICAgICAgfCA0ICsrLS0KPiA+ICB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0veDg2
XzY0L3N2bV9pbnRfY3RsX3Rlc3QuYyAgICAgfCA0ICsrLS0KPiA+ICAuLi4vc2VsZnRlc3RzL2t2
bS94ODZfNjQvc3ZtX25lc3RlZF9zaHV0ZG93bl90ZXN0LmMgICAgICAgfCA0ICsrLS0KPiA+ICAu
Li4vc2VsZnRlc3RzL2t2bS94ODZfNjQvc3ZtX25lc3RlZF9zb2Z0X2luamVjdF90ZXN0LmMgICAg
fCA0ICsrLS0KPiA+ICB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0veDg2XzY0L3VjbmFfaW5q
ZWN0aW9uX3Rlc3QuYyAgfCA4ICsrKystLS0tCj4gPiAgLi4uL3NlbGZ0ZXN0cy9rdm0veDg2XzY0
L3VzZXJzcGFjZV9tc3JfZXhpdF90ZXN0LmMgICAgICAgIHwgNCArKy0tCj4gPiAgLi4uL2t2bS94
ODZfNjQvdm14X2V4Y2VwdGlvbl93aXRoX2ludmFsaWRfZ3Vlc3Rfc3RhdGUuYyAgIHwgNCArKy0t
Cj4gPiAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3g4Nl82NC92bXhfcG11X2NhcHNfdGVz
dC5jICAgIHwgNCArKy0tCj4gPiAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3g4Nl82NC94
YXBpY19pcGlfdGVzdC5jICAgICAgIHwgNCArKy0tCj4gPiAgdG9vbHMvdGVzdGluZy9zZWxmdGVz
dHMva3ZtL3g4Nl82NC94Y3IwX2NwdWlkX3Rlc3QuYyAgICAgIHwgNCArKy0tCj4gPiAgdG9vbHMv
dGVzdGluZy9zZWxmdGVzdHMva3ZtL3g4Nl82NC94ZW5fc2hpbmZvX3Rlc3QuYyAgICAgIHwgNCAr
Ky0tCj4gPiAgMjggZmlsZXMgY2hhbmdlZCwgNjYgaW5zZXJ0aW9ucygrKSwgNzAgZGVsZXRpb25z
KC0pCj4gPgo+Cj4gUmV2aWV3ZWQtYnk6IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNy
by5jb20+CgpUaGFua3MgZm9yIHRoZSByZXZpZXchCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
