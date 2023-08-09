Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 077FBEB64DD
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 05:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pPgikJ58T2LF//vQaezoABocPtAqpwDaEpWODNe1+DM=; b=NUre1gP1Ay57wE
	6XG+8iSvloIXQYhQADB2ohQhMI3ki5Bx/SfbdG04NKKgK6Qai8D5yHbgqgiuBucb+GegBj93vhwDq
	k9g1bQrgJB4eGoOONF9MDCzfhIkpc2DWAmLd1qsul2XHXcVtlmDkCebS0Z5iqFA7GtrNzJrdbL/0/
	xTa9g/vtEP1l3XCnLraioGdHnCrFL7JdpMC5REVAb7aWnA8o+W/KsALRocmR2qkgvaw71ysixMqLk
	nqD9krDGwD9vjXZEcs36aOPWFt92NkK00Q2tKCEsQQMLPqjZHZktPfGF6X8dhfyDAKDXD0Vxc6SDR
	59OU/veEEsRcnLgd+bSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTbLp-00437e-0F;
	Wed, 09 Aug 2023 05:03:17 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTbLm-00436C-1M;
	Wed, 09 Aug 2023 05:03:15 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2b9b6e943ebso6023181fa.1;
        Tue, 08 Aug 2023 22:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691557389; x=1692162189;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j6b8QaOxHHxr0nsnmybM/OZmFkMm6krciNhVPEUkLHM=;
        b=fhVs64I4ddYpd00JLct4M5DXmmqZVvjx/PM5IA0btlXqhs7iDUEO3VxkEF91BxP6Dz
         WJgiF9XR5y4uvxG6IWoY7NHCRglOoZAYWJVo6VGrKhNNaTIDWbKOUU3WRiGAXIqGsDSE
         DK44YS7nhYYxRjSy2NhsWwdbvYRxD6x/XguExxEaFacDNw496QL+DfrN0JlS0HPz1ZLI
         UOLAUlPdagmdXrFv1r2hojgA2g+RVPCvAV8BiMueulCJhnlfNSHOo6YBR6FliCSnwNe5
         XJuhSf8r3sDdpjILN7XbNSBRB+K08tZWxAyUsK9+h6eNtxkVWvNujrFcPD6CM4BfmhGi
         8/Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691557389; x=1692162189;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j6b8QaOxHHxr0nsnmybM/OZmFkMm6krciNhVPEUkLHM=;
        b=mCKHmYvUZJLOHtyO9MXfBRCe0KF7CnXXZ+Uwf14/4GVk8/1ayrHdCDys4flmPPDe4x
         U5nm4XBVHuhuqllGnYseWlyTt7xBNIgxe8fYFbMzUIcKGyjPY/PrKnQupHCBWyFnFojR
         EhS/xh3qaiZsl9S8x4Q14heNONCNfsuKdwWoUBok9l40KVtDgOunATO29MI+VC2HIuJM
         05gq+eqg/VL8wH7NtId3i3bBKD+WP6WRAuft7kXX4J20d/hTQYPMtr71wBppEAFYapHw
         KRtUEXihoj3uGprRVnso9GBparE0HXQ11Sp/X0I9+jWGTjWm3kSeIyoOhBLGZg9ZKtUt
         rchA==
X-Gm-Message-State: AOJu0Yz7Im9s1pGw8EGGMRnpTJXFeQGqTbOXKBYR4TyYlOzGjrfXUi2y
	TKgnnztqpKfWUDmpDfxdpjRXA3kRnAtbGXyq2cI=
X-Google-Smtp-Source: AGHT+IHPj+fZ7S49PElSE5yx8scu586CwNUbYIc0xj64aUe7m/JpkHYOW0tpcJm9OPelp5Q2V/0HR3Dr50Nj19k+svo=
X-Received: by 2002:a05:651c:1713:b0:2b9:d0bf:a3c5 with SMTP id
 be19-20020a05651c171300b002b9d0bfa3c5mr3997983ljb.14.1691557389258; Tue, 08
 Aug 2023 22:03:09 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1690273969.git.haibo1.xu@intel.com> <CAAhSdy0yug=J0nxnnPoLYL=0MiT0w6qgPYOcv0QwMRe+fsQn8Q@mail.gmail.com>
 <87y1ilpz3m.wl-maz@kernel.org> <CAJve8onZuOHkAUVY3=QeBPMx5n2F1fGgn57rPp7MB1Q5=vXasA@mail.gmail.com>
 <CAAhSdy277PEBZ4wyUHxQPyN2TugGfhBmC5jUoFTAqMU8vwbt5w@mail.gmail.com>
In-Reply-To: <CAAhSdy277PEBZ4wyUHxQPyN2TugGfhBmC5jUoFTAqMU8vwbt5w@mail.gmail.com>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Wed, 9 Aug 2023 13:02:57 +0800
Message-ID: <CAJve8o=6ukbqc_8RvgRxpss2c=q8Ltzf=cNdJ2B85fhNSvNgMQ@mail.gmail.com>
Subject: Re: [PATCH v6 00/13] RISCV: Add KVM_GET_REG_LIST API
To: Anup Patel <anup@brainfault.org>
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
X-CRM114-CacheID: sfid-20230808_220314_465446_2AF3DE6A 
X-CRM114-Status: GOOD (  31.10  )
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

T24gV2VkLCBBdWcgOSwgMjAyMyBhdCAxMTo0OOKAr0FNIEFudXAgUGF0ZWwgPGFudXBAYnJhaW5m
YXVsdC5vcmc+IHdyb3RlOgo+Cj4gT24gV2VkLCBBdWcgOSwgMjAyMyBhdCA4OjU24oCvQU0gSGFp
Ym8gWHUgPHhpYW9ibzU1eEBnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIFR1ZSwgQXVnIDgs
IDIwMjMgYXQgNzoxMuKAr1BNIE1hcmMgWnluZ2llciA8bWF6QGtlcm5lbC5vcmc+IHdyb3RlOgo+
ID4gPgo+ID4gPiBPbiBNb24sIDA3IEF1ZyAyMDIzIDA0OjQ4OjMzICswMTAwLAo+ID4gPiBBbnVw
IFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IEhpIE1h
cmMsIEhpIE9saXZlciwKPiA+ID4gPgo+ID4gPiA+IE9uIFR1ZSwgSnVsIDI1LCAyMDIzIGF0IDI6
MDXigK9QTSBIYWlibyBYdSA8aGFpYm8xLnh1QGludGVsLmNvbT4gd3JvdGU6Cj4gPiA+ID4gPgo+
ID4gPiA+ID4gS1ZNX0dFVF9SRUdfTElTVCB3aWxsIGR1bXAgYWxsIHJlZ2lzdGVyIElEcyB0aGF0
IGFyZSBhdmFpbGFibGUgdG8KPiA+ID4gPiA+IEtWTV9HRVQvU0VUX09ORV9SRUcgYW5kIEl0J3Mg
dmVyeSB1c2VmdWwgdG8gaWRlbnRpZnkgc29tZSBwbGF0Zm9ybQo+ID4gPiA+ID4gcmVncmVzc2lv
biBpc3N1ZSBkdXJpbmcgVk0gbWlncmF0aW9uLgo+ID4gPiA+ID4KPiA+ID4gPiA+IFBhdGNoIDEt
NyByZS1zdHJ1Y3R1cmVkIHRoZSBnZXQtcmVnLWxpc3QgdGVzdCBpbiBhYXJjaDY0IHRvIG1ha2Ug
c29tZQo+ID4gPiA+ID4gb2YgdGhlIGNvZGUgYXMgY29tbW9uIHRlc3QgZnJhbWV3b3JrIHRoYXQg
Y2FuIGJlIHNoYXJlZCBieSByaXNjdi4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBQYXRjaCA4IG1vdmUg
cmVqZWN0X3NldCBjaGVjayBsb2dpYyB0byBhIGZ1bmN0aW9uIHNvIGFzIHRvIGNoZWNrIGZvcgo+
ID4gPiA+ID4gZGlmZmVyZW50IGVycm5vIGZvciBkaWZmZXJlbnQgcmVnaXN0ZXJzLgo+ID4gPiA+
ID4gUGF0Y2ggOSBtb3ZlIGZpbmFsaXplX3ZjcHUgYmFjayB0byBydW5fdGVzdCBzbyB0aGF0IHJp
c2N2IGNhbiBpbXBsZW1lbnQKPiA+ID4gPiA+IGl0cyBzcGVjaWZpYyBvcGVyYXRpb24uCj4gPiA+
ID4gPiBQYXRjaCAxMCBjaGFuZ2UgdG8gZG8gdGhlIGdldC9zZXQgb3BlcmF0aW9uIG9ubHkgb24g
cHJlc2VudC1ibGVzc2VkIGxpc3QuCj4gPiA+ID4gPiBQYXRjaCAxMSBhZGQgdGhlIHNraXBfc2V0
IGZhY2lsaXRpZXMgc28gdGhhdCByaXNjdiBjYW4gc2tpcCBzZXQgb3BlcmF0aW9uCj4gPiA+ID4g
PiBvbiBzb21lIHJlZ2lzdGVycy4KPiA+ID4gPiA+IFBhdGNoIDEyIGVuYWJsZWQgdGhlIEtWTV9H
RVRfUkVHX0xJU1QgQVBJIGluIHJpc2N2Lgo+ID4gPiA+ID4gcGF0Y2ggMTMgYWRkZWQgdGhlIGNv
cnJlc3BvbmRpbmcga3NlbGZ0ZXN0IGZvciBjaGVja2luZyBwb3NzaWJsZQo+ID4gPiA+ID4gcmVn
aXN0ZXIgcmVncmVzc2lvbnMuCj4gPiA+ID4gPgo+ID4gPiA+ID4gVGhlIGdldC1yZWctbGlzdCBr
dm0gc2VsZnRlc3Qgd2FzIHBvcnRlZCBmcm9tIGFhcmNoNjQgYW5kIHRlc3RlZCB3aXRoCj4gPiA+
ID4gPiBMaW51eCB2Ni41LXJjMyBvbiBhIFFlbXUgcmlzY3Y2NCB2aXJ0IG1hY2hpbmUuCj4gPiA+
ID4gPgo+ID4gPiA+ID4gLS0tCj4gPiA+ID4gPiBDaGFuZ2VkIHNpbmNlIHY1Ogo+ID4gPiA+ID4g
ICAqIFJlYmFzZSB0byB2Ni41LXJjMwo+ID4gPiA+ID4gICAqIE1pbm9yIGZpeCBmb3IgQW5kcmV3
J3MgY29tbWVudHMKPiA+ID4gPiA+Cj4gPiA+ID4gPiBBbmRyZXcgSm9uZXMgKDcpOgo+ID4gPiA+
ID4gICBLVk06IGFybTY0OiBzZWxmdGVzdHM6IFJlcGxhY2Ugc3RyX3dpdGhfaW5kZXggd2l0aCBz
dHJkdXBfcHJpbnRmCj4gPiA+ID4gPiAgIEtWTTogYXJtNjQ6IHNlbGZ0ZXN0czogRHJvcCBTVkUg
Y2FwIGNoZWNrIGluIHByaW50X3JlZwo+ID4gPiA+ID4gICBLVk06IGFybTY0OiBzZWxmdGVzdHM6
IFJlbW92ZSBwcmludF9yZWcncyBkZXBlbmRlbmN5IG9uIHZjcHVfY29uZmlnCj4gPiA+ID4gPiAg
IEtWTTogYXJtNjQ6IHNlbGZ0ZXN0czogUmVuYW1lIHZjcHVfY29uZmlnIGFuZCBhZGQgdG8ga3Zt
X3V0aWwuaAo+ID4gPiA+ID4gICBLVk06IGFybTY0OiBzZWxmdGVzdHM6IERlbGV0ZSBjb3JlX3Jl
Z19maXh1cAo+ID4gPiA+ID4gICBLVk06IGFybTY0OiBzZWxmdGVzdHM6IFNwbGl0IGdldC1yZWct
bGlzdCB0ZXN0IGNvZGUKPiA+ID4gPiA+ICAgS1ZNOiBhcm02NDogc2VsZnRlc3RzOiBGaW5pc2gg
Z2VuZXJhbGl6aW5nIGdldC1yZWctbGlzdAo+ID4gPiA+ID4KPiA+ID4gPiA+IEhhaWJvIFh1ICg2
KToKPiA+ID4gPiA+ICAgS1ZNOiBhcm02NDogc2VsZnRlc3RzOiBNb3ZlIHJlamVjdF9zZXQgY2hl
Y2sgbG9naWMgdG8gYSBmdW5jdGlvbgo+ID4gPiA+ID4gICBLVk06IGFybTY0OiBzZWxmdGVzdHM6
IE1vdmUgZmluYWxpemVfdmNwdSBiYWNrIHRvIHJ1bl90ZXN0Cj4gPiA+ID4gPiAgIEtWTTogc2Vs
ZnRlc3RzOiBPbmx5IGRvIGdldC9zZXQgdGVzdHMgb24gcHJlc2VudCBibGVzc2VkIGxpc3QKPiA+
ID4gPiA+ICAgS1ZNOiBzZWxmdGVzdHM6IEFkZCBza2lwX3NldCBmYWNpbGl0eSB0byBnZXRfcmVn
X2xpc3QgdGVzdAo+ID4gPiA+ID4gICBLVk06IHJpc2N2OiBBZGQgS1ZNX0dFVF9SRUdfTElTVCBB
UEkgc3VwcG9ydAo+ID4gPiA+ID4gICBLVk06IHJpc2N2OiBzZWxmdGVzdHM6IEFkZCBnZXQtcmVn
LWxpc3QgdGVzdAo+ID4gPiA+Cj4gPiA+ID4gQXJlIHlvdSBva2F5IGZvciB0aGlzIHNlcmllcyB0
byBnbyB0aHJvdWdoIHRoZSBLVk0gUklTQy1WIHRyZWUgPwo+ID4gPgo+ID4gPiBTdXJlLCBzZWVt
cyBmaW5lIGZyb20gbXkgcG9pbnQgb2Ygdmlldy4gQnV0IHBsZWFzZSBwdXQgaXQgb24gYW4KPiA+
ID4gaW1tdXRhYmxlIHRvcGljIGJyYW5jaCBzbyB0aGF0IHdlIGNhbiBhbHNvIG1lcmdlIGl0IGlu
IHRoZSBhcm02NCB0cmVlLAo+ID4gPiBzaG91bGQgd2UgbmVlZCB0byByZXNvbHZlIGFueSBjb25m
bGljdHMuCj4gPiA+Cj4gPgo+ID4gSGkgTWFyYywKPiA+Cj4gPiBUaGFua3MgZm9yIHlvdXIgcmV2
aWV3IQo+ID4KPiA+IFdoaWNoIHRvcGljIGJyYW5jaCBkbyB5b3UgcHJlZmVyIG9yIHN1Z2dlc3Qg
dG8gdXNlPwo+ID4gSSBjYW4gZG8gYSByZWJhc2Ugb24gaXQgYW5kIGZpeCBhbnkgcG90ZW50aWFs
IGNvbmZsaWN0cy4KPgo+IEkgd2lsbCBzaGFyZSBhIGJyYW5jaCB3aXRoIGEgc3RhYmxlIGNvbW1p
dCBoaXN0b3J5Lgo+IEkgaGF2ZSBhbHJlYWR5IHJlc29sdmVkIGNvbmZsaWN0cyBhdCBteSBlbmQu
Cj4KCkNvb2whIFRoYW5rcyBmb3IgeW91ciBoZWxwIQoKPiBSZWdhcmRzLAo+IEFudXAKPgo+ID4K
PiA+IFJlZ2FyZHMsCj4gPiBIYWlibwo+ID4KPiA+ID4gVGhhbmtzLAo+ID4gPgo+ID4gPiAgICAg
ICAgIE0uCj4gPiA+Cj4gPiA+IC0tCj4gPiA+IFdpdGhvdXQgZGV2aWF0aW9uIGZyb20gdGhlIG5v
cm0sIHByb2dyZXNzIGlzIG5vdCBwb3NzaWJsZS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
