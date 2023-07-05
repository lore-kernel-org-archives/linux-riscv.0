Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F170FEB64DD
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 18:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vluM5cS+01KZKqu/fdy/y5bz+CzNXPko2uXKjBLJQCE=; b=yayj7oQ6zKeeit
	WAM419y71+KfUwrZKQ6Mdp0Kq5DWKQAHc0lN6URPUOXltc5uR9nqBT+0wtZparJYMTn8UAap8qjam
	Klb+UmSpi8L/M52pTA4oN0Dx9XPMjsulzhpXi5PmRok3vhccsGcFqDYeiV+GhMRaQ0Q9v80850Gqx
	xfXbtLRnHfav6VV4NVCjlW6foTN5hoSr1XsPX38Qht1TZw1vw1I+MNDr9D7jrus0viQD6TbOd5YhL
	xUBgU0qtBYqIdPIkcxLAJ7Zu/D1aCkYB1MwmC8YJgpOQiw3kMUpdrKTBMFjctuVxS+5etO8KXM2Gi
	ivjX1J52xpRHqooxqDeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qH73Y-00GiZC-2Z;
	Wed, 05 Jul 2023 18:16:48 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qH73W-00GiVn-0d
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jul 2023 18:16:47 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-40371070eb7so35971cf.1
        for <linux-riscv@lists.infradead.org>; Wed, 05 Jul 2023 11:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688581000; x=1691173000;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SvseMdfzClF+MPNM/24H781NReITore/0VUmVpYyoUI=;
        b=pBDOGSJhgVrZ57UmO4R3xgufvV7auUa98rwGv+itPf8xNYgkd49Vzru+0XCtLwNy2u
         Kphc2VZvU4j2RPeHmbGu9MDCl0E7dhD3VJp4IyT+BS4NKRAbZZdzVeAQSCKRaBBfvDaI
         NwkFFwiV0vR7ZhGkySjEsZwdBfNn58PPCvhWOTdRgUtPY9cCYoOdMQqw4TBgGwEyzD+3
         f6uOilPj1KmMt3OwchjKN/kHRwsQI498jDaxsgkxiQ/iDKPop2nR6MY3YMGVXuYaifuA
         s0h9pq7s41YS0gxjpz5xeukK/MdlA4rUspYxfKJwWMO3KqZpByintAFtPpwHsMg2hgp9
         9hEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688581000; x=1691173000;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SvseMdfzClF+MPNM/24H781NReITore/0VUmVpYyoUI=;
        b=NrHDpzPTo0GhZ/Fu7CCzP63xL/GiLzTCwcX5eGMscRxin+ME7VK2y16ngbb+ksn9I8
         jh10o0u2kPmv8S+5RDxJaU0NExX4fGmcHXafvfhXAT/9j8xRw5ibXqufMN639JiY5JFC
         IccqPFSFCTk9OZkcVkjVAgts1Za3NTu5nxe79al3tM8pmb6z9+hmA0ns3ZmO/Hd/Vspi
         3Go4UV/k1LgOXH9MkoAjlmhdSTE7fk0NfC2v7lDPBLNi1auCVlumlUOWSpU1M1580ucX
         DQw0+oVdYR0UGgH1tk0jwL8vflpqO4wO2Bt+oc852LYKPFb8uPklSdUpGqOp1Ex1U1sC
         gxvw==
X-Gm-Message-State: ABy/qLYo5ck5ezUsZ9y6hjyjSOe5W26phEihfTr3G6NiflAaUkRT0ysN
	WXV2GqGGyaf2XNMHUZoq9Ob/gByjOWpLM4zc5jIhfw==
X-Google-Smtp-Source: APBJJlHHPAHCADMGOtpqExEIHo4pAuoVXPYM60W1cKm1ySWlgGvmriHeyHCfDzchsTSnbmqE7IlXLycziclYclkRLGM=
X-Received: by 2002:ac8:5ac7:0:b0:3f0:af20:1a37 with SMTP id
 d7-20020ac85ac7000000b003f0af201a37mr13421qtd.15.1688581000623; Wed, 05 Jul
 2023 11:16:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230621175002.2832640-1-rananta@google.com> <20230621175002.2832640-3-rananta@google.com>
 <0bdc3105-fc3d-d0e1-60e7-d626171e1057@redhat.com>
In-Reply-To: <0bdc3105-fc3d-d0e1-60e7-d626171e1057@redhat.com>
From: Raghavendra Rao Ananta <rananta@google.com>
Date: Wed, 5 Jul 2023 11:16:29 -0700
Message-ID: <CAJHc60yZEbmbak=5kfFd4v60dtk3k0JHbXKh3nCSB3VjFShGUQ@mail.gmail.com>
Subject: Re: [RESEND PATCH v5 02/11] KVM: arm64: Use kvm_arch_flush_remote_tlbs()
To: Gavin Shan <gshan@redhat.com>
Cc: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Jing Zhang <jingzhangos@google.com>, Colton Lewis <coltonlewis@google.com>, 
	David Matlack <dmatlack@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Zenghui Yu <zenghui.yu@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_111646_233690_1910EC16 
X-CRM114-Status: GOOD (  27.79  )
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

T24gVHVlLCBKdWwgNCwgMjAyMyBhdCA0OjM44oCvUE0gR2F2aW4gU2hhbiA8Z3NoYW5AcmVkaGF0
LmNvbT4gd3JvdGU6Cj4KPiBPbiA2LzIyLzIzIDAzOjQ5LCBSYWdoYXZlbmRyYSBSYW8gQW5hbnRh
IHdyb3RlOgo+ID4gRnJvbTogRGF2aWQgTWF0bGFjayA8ZG1hdGxhY2tAZ29vZ2xlLmNvbT4KPiA+
Cj4gPiBVc2Uga3ZtX2FyY2hfZmx1c2hfcmVtb3RlX3RsYnMoKSBpbnN0ZWFkIG9mCj4gPiBDT05G
SUdfSEFWRV9LVk1fQVJDSF9UTEJfRkxVU0hfQUxMLiBUaGUgdHdvIG1lY2hhbmlzbXMgc29sdmUg
dGhlIHNhbWUKPiA+IHByb2JsZW0sIGFsbG93aW5nIGFyY2hpdGVjdHVyZS1zcGVjaWZpYyBjb2Rl
IHRvIHByb3ZpZGUgYSBub24tSVBJCj4gPiBpbXBsZW1lbnRhdGlvbiBvZiByZW1vdGUgVExCIGZs
dXNoaW5nLgo+ID4KPiA+IERyb3BwaW5nIENPTkZJR19IQVZFX0tWTV9BUkNIX1RMQl9GTFVTSF9B
TEwgYWxsb3dzIEtWTSB0byBzdGFuZGFyZGl6ZQo+ID4gYWxsIGFyY2hpdGVjdHVyZXMgb24ga3Zt
X2FyY2hfZmx1c2hfcmVtb3RlX3RsYnMoKSBpbnN0ZWFkIG9mIG1haW50YWluaW5nCj4gPiB0d28g
bWVjaGFuaXNtcy4KPiA+Cj4gPiBPcHQgdG8gc3RhbmRhcmRpemUgb24ga3ZtX2FyY2hfZmx1c2hf
cmVtb3RlX3RsYnMoKSBzaW5jZSBpdCBhdm9pZHMKPiA+IGR1cGxpY2F0aW5nIHRoZSBnZW5lcmlj
IFRMQiBzdGF0cyBhY3Jvc3MgYXJjaGl0ZWN0dXJlcyB0aGF0IGltcGxlbWVudAo+ID4gdGhlaXIg
b3duIHJlbW90ZSBUTEIgZmx1c2guCj4gPgo+ID4gVGhpcyBhZGRzIGFuIGV4dHJhIGZ1bmN0aW9u
IGNhbGwgdG8gdGhlIEFSTTY0IGt2bV9mbHVzaF9yZW1vdGVfdGxicygpCj4gPiBwYXRoLCBidXQg
dGhhdCBpcyBhIHNtYWxsIGNvc3QgaW4gY29tcGFyaXNvbiB0byBmbHVzaGluZyByZW1vdGUgVExC
cy4KPiA+Cj4gPiBObyBmdW5jdGlvbmFsIGNoYW5nZSBpbnRlbmRlZC4KPiAgICBeXl5eXl5eXl5e
Xl5eXl5eXl5eXl5eXl5eXl5eXgo+Cj4gSXQncyBub3QgdHJ1ZSBhbmQgcGxlYXNlIHJlZmVyIHRv
IHRoZSBiZWxvdyBleHBsYW5hdGlvbi4KPgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IERhdmlkIE1h
dGxhY2sgPGRtYXRsYWNrQGdvb2dsZS5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBSYWdoYXZlbmRy
YSBSYW8gQW5hbnRhIDxyYW5hbnRhQGdvb2dsZS5jb20+Cj4gPiBSZXZpZXdlZC1ieTogWmVuZ2h1
aSBZdSA8emVuZ2h1aS55dUBsaW51eC5kZXY+Cj4gPiBBY2tlZC1ieTogT2xpdmVyIFVwdG9uIDxv
bGl2ZXIudXB0b25AbGludXguZGV2Pgo+ID4gLS0tCj4gPiAgIGFyY2gvYXJtNjQvaW5jbHVkZS9h
c20va3ZtX2hvc3QuaCB8IDMgKysrCj4gPiAgIGFyY2gvYXJtNjQva3ZtL0tjb25maWcgICAgICAg
ICAgICB8IDEgLQo+ID4gICBhcmNoL2FybTY0L2t2bS9tbXUuYyAgICAgICAgICAgICAgfCA2ICsr
Ky0tLQo+ID4gICB2aXJ0L2t2bS9LY29uZmlnICAgICAgICAgICAgICAgICAgfCAzIC0tLQo+ID4g
ICB2aXJ0L2t2bS9rdm1fbWFpbi5jICAgICAgICAgICAgICAgfCAyIC0tCj4gPiAgIDUgZmlsZXMg
Y2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQo+ID4KPgo+IFRoZSBjaGFu
Z2VzIG1ha2Ugc2Vuc2UgYW5kIGxvb2sgZ29vZCB0byBtZS4gSG93ZXZlciwgdGhlcmUgaXMgYSBm
dW5jdGlvbmFsIGNoYW5nZSBiZWNhdXNlCj4gdGhlIGdlbmVyaWMga3ZtX2FyY2hfZmx1c2hfcmVt
b3RlX3RsYnMoKSBpc24ndCBleGFjdGx5IHNhbWUgdG8gQVJNNjQncyB2YXJpYW50LiBTdHJpY3Rs
eQo+IHNwZWFraW5nLCB0aGV5J3JlIG5vdCBpbnRlcmNoYW5nZWFibGUuIEluIHRoZSBnZW5lcmlj
IGZ1bmN0aW9uLCBib3RoIHN0YXRpc3RpY3MgKAo+IHJlbW90ZV90bGJfZmx1c2hfcmVxdWVzdHMg
YW5kIHJlbW90ZV90bGJfZmx1c2gpIGFyZSBpbmNyZWFzZWQuIE9ubHkgdGhlIGZvcm1lciBzdGF0
aXN0aWMKPiBpcyBpbmNyZWFzZWQgaW4gQVJNNjQncyB2YXJpYW50Lgo+Cj4gSXQgbG9va3MgY29y
cmVjdCB0byBpbmNyZWFzZSBib3RoIHN0YXRpc3RpY3MsIGJ1dCB0aGUgY29tbWl0IGxvZyBtYXkg
bmVlZCB0d2VhayB0byByZWZsZWN0Cj4gaXQuIFdpdGggdGhpcyByZXNvbHZlZDoKR29vZCBjYXRj
aCEgSSBhZ3JlZSwgdGhlcmUncyBhIHNsaWdodCBmdW5jdGlvbmFsIGNoYW5nZSBoZXJlIGFuZCBJ
J2xsCmFkanVzdCB0aGUgY29tbWl0IG1lc3NhZ2UgaW4gbXkgbmV4dCByZXZpc2lvbi4KClRoYW5r
IHlvdS4KUmFnaGF2ZW5kcmEKCj4gUmV2aWV3ZWQtYnk6IEdhdmluIFNoYW4gPGdzaGFuQHJlZGhh
dC5jb20+Cj4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL2t2bV9ob3N0
LmggYi9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgKPiA+IGluZGV4IDdlN2UxOWVm
Njk5M2UuLjgxYWI0MWI4NGY0MzYgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL2FybTY0L2luY2x1ZGUv
YXNtL2t2bV9ob3N0LmgKPiA+ICsrKyBiL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20va3ZtX2hvc3Qu
aAo+ID4gQEAgLTEwNzgsNiArMTA3OCw5IEBAIGludCBfX2luaXQga3ZtX3NldF9pcGFfbGltaXQo
dm9pZCk7Cj4gPiAgICNkZWZpbmUgX19LVk1fSEFWRV9BUkNIX1ZNX0FMTE9DCj4gPiAgIHN0cnVj
dCBrdm0gKmt2bV9hcmNoX2FsbG9jX3ZtKHZvaWQpOwo+ID4KPiA+ICsjZGVmaW5lIF9fS1ZNX0hB
VkVfQVJDSF9GTFVTSF9SRU1PVEVfVExCUwo+ID4gK2ludCBrdm1fYXJjaF9mbHVzaF9yZW1vdGVf
dGxicyhzdHJ1Y3Qga3ZtICprdm0pOwo+ID4gKwo+ID4gICBzdGF0aWMgaW5saW5lIGJvb2wga3Zt
X3ZtX2lzX3Byb3RlY3RlZChzdHJ1Y3Qga3ZtICprdm0pCj4gPiAgIHsKPiA+ICAgICAgIHJldHVy
biBmYWxzZTsKPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2t2bS9LY29uZmlnIGIvYXJjaC9h
cm02NC9rdm0vS2NvbmZpZwo+ID4gaW5kZXggZjUzMWRhNmIzNjJlOS4uNmI3MzBmY2ZlZTM3OSAx
MDA2NDQKPiA+IC0tLSBhL2FyY2gvYXJtNjQva3ZtL0tjb25maWcKPiA+ICsrKyBiL2FyY2gvYXJt
NjQva3ZtL0tjb25maWcKPiA+IEBAIC0yNSw3ICsyNSw2IEBAIG1lbnVjb25maWcgS1ZNCj4gPiAg
ICAgICBzZWxlY3QgTU1VX05PVElGSUVSCj4gPiAgICAgICBzZWxlY3QgUFJFRU1QVF9OT1RJRklF
UlMKPiA+ICAgICAgIHNlbGVjdCBIQVZFX0tWTV9DUFVfUkVMQVhfSU5URVJDRVBUCj4gPiAtICAg
ICBzZWxlY3QgSEFWRV9LVk1fQVJDSF9UTEJfRkxVU0hfQUxMCj4gPiAgICAgICBzZWxlY3QgS1ZN
X01NSU8KPiA+ICAgICAgIHNlbGVjdCBLVk1fR0VORVJJQ19ESVJUWUxPR19SRUFEX1BST1RFQ1QK
PiA+ICAgICAgIHNlbGVjdCBLVk1fWEZFUl9UT19HVUVTVF9XT1JLCj4gPiBkaWZmIC0tZ2l0IGEv
YXJjaC9hcm02NC9rdm0vbW11LmMgYi9hcmNoL2FybTY0L2t2bS9tbXUuYwo+ID4gaW5kZXggM2I5
ZDRkMjRjMzYxYS4uZDBhMGQzZGNhOTMxNiAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvYXJtNjQva3Zt
L21tdS5jCj4gPiArKysgYi9hcmNoL2FybTY0L2t2bS9tbXUuYwo+ID4gQEAgLTgxLDE1ICs4MSwx
NSBAQCBzdGF0aWMgYm9vbCBtZW1zbG90X2lzX2xvZ2dpbmcoc3RydWN0IGt2bV9tZW1vcnlfc2xv
dCAqbWVtc2xvdCkKPiA+ICAgfQo+ID4KPiA+ICAgLyoqCj4gPiAtICoga3ZtX2ZsdXNoX3JlbW90
ZV90bGJzKCkgLSBmbHVzaCBhbGwgVk0gVExCIGVudHJpZXMgZm9yIHY3LzgKPiA+ICsgKiBrdm1f
YXJjaF9mbHVzaF9yZW1vdGVfdGxicygpIC0gZmx1c2ggYWxsIFZNIFRMQiBlbnRyaWVzIGZvciB2
Ny84Cj4gPiAgICAqIEBrdm06ICAgIHBvaW50ZXIgdG8ga3ZtIHN0cnVjdHVyZS4KPiA+ICAgICoK
PiA+ICAgICogSW50ZXJmYWNlIHRvIEhZUCBmdW5jdGlvbiB0byBmbHVzaCBhbGwgVk0gVExCIGVu
dHJpZXMKPiA+ICAgICovCj4gPiAtdm9pZCBrdm1fZmx1c2hfcmVtb3RlX3RsYnMoc3RydWN0IGt2
bSAqa3ZtKQo+ID4gK2ludCBrdm1fYXJjaF9mbHVzaF9yZW1vdGVfdGxicyhzdHJ1Y3Qga3ZtICpr
dm0pCj4gPiAgIHsKPiA+IC0gICAgICsra3ZtLT5zdGF0LmdlbmVyaWMucmVtb3RlX3RsYl9mbHVz
aF9yZXF1ZXN0czsKPiA+ICAgICAgIGt2bV9jYWxsX2h5cChfX2t2bV90bGJfZmx1c2hfdm1pZCwg
Jmt2bS0+YXJjaC5tbXUpOwo+ID4gKyAgICAgcmV0dXJuIDA7Cj4gPiAgIH0KPiA+Cj4gPiAgIHN0
YXRpYyBib29sIGt2bV9pc19kZXZpY2VfcGZuKHVuc2lnbmVkIGxvbmcgcGZuKQo+ID4gZGlmZiAt
LWdpdCBhL3ZpcnQva3ZtL0tjb25maWcgYi92aXJ0L2t2bS9LY29uZmlnCj4gPiBpbmRleCBiNzQ5
MTZkZTUxODNhLi40ODRkMDg3MzA2MWNhIDEwMDY0NAo+ID4gLS0tIGEvdmlydC9rdm0vS2NvbmZp
Zwo+ID4gKysrIGIvdmlydC9rdm0vS2NvbmZpZwo+ID4gQEAgLTYyLDkgKzYyLDYgQEAgY29uZmln
IEhBVkVfS1ZNX0NQVV9SRUxBWF9JTlRFUkNFUFQKPiA+ICAgY29uZmlnIEtWTV9WRklPCj4gPiAg
ICAgICAgICBib29sCj4gPgo+ID4gLWNvbmZpZyBIQVZFX0tWTV9BUkNIX1RMQl9GTFVTSF9BTEwK
PiA+IC0gICAgICAgYm9vbAo+ID4gLQo+ID4gICBjb25maWcgSEFWRV9LVk1fSU5WQUxJRF9XQUtF
VVBTCj4gPiAgICAgICAgICBib29sCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3ZpcnQva3ZtL2t2bV9t
YWluLmMgYi92aXJ0L2t2bS9rdm1fbWFpbi5jCj4gPiBpbmRleCBhNDc1ZmY5ZWYxNTZkLi42MDBh
OTg1Yjg2MjE1IDEwMDY0NAo+ID4gLS0tIGEvdmlydC9rdm0va3ZtX21haW4uYwo+ID4gKysrIGIv
dmlydC9rdm0va3ZtX21haW4uYwo+ID4gQEAgLTM1MCw3ICszNTAsNiBAQCBib29sIGt2bV9tYWtl
X2FsbF9jcHVzX3JlcXVlc3Qoc3RydWN0IGt2bSAqa3ZtLCB1bnNpZ25lZCBpbnQgcmVxKQo+ID4g
ICB9Cj4gPiAgIEVYUE9SVF9TWU1CT0xfR1BMKGt2bV9tYWtlX2FsbF9jcHVzX3JlcXVlc3QpOwo+
ID4KPiA+IC0jaWZuZGVmIENPTkZJR19IQVZFX0tWTV9BUkNIX1RMQl9GTFVTSF9BTEwKPiA+ICAg
dm9pZCBrdm1fZmx1c2hfcmVtb3RlX3RsYnMoc3RydWN0IGt2bSAqa3ZtKQo+ID4gICB7Cj4gPiAg
ICAgICArK2t2bS0+c3RhdC5nZW5lcmljLnJlbW90ZV90bGJfZmx1c2hfcmVxdWVzdHM7Cj4gPiBA
QCAtMzcxLDcgKzM3MCw2IEBAIHZvaWQga3ZtX2ZsdXNoX3JlbW90ZV90bGJzKHN0cnVjdCBrdm0g
Kmt2bSkKPiA+ICAgICAgICAgICAgICAgKytrdm0tPnN0YXQuZ2VuZXJpYy5yZW1vdGVfdGxiX2Zs
dXNoOwo+ID4gICB9Cj4gPiAgIEVYUE9SVF9TWU1CT0xfR1BMKGt2bV9mbHVzaF9yZW1vdGVfdGxi
cyk7Cj4gPiAtI2VuZGlmCj4gPgo+ID4gICBzdGF0aWMgdm9pZCBrdm1fZmx1c2hfc2hhZG93X2Fs
bChzdHJ1Y3Qga3ZtICprdm0pCj4gPiAgIHsKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
