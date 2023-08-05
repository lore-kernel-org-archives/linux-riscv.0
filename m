Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCCB4C001DB
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Aug 2023 01:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jaIA+F+dsCHF5V3Fi3o7Q2Tf6/AfHvnA3LP81dVvplg=; b=2vTeX2YGBqyqV4
	GUfwnh/hkT0c44AvEn81Fq5hglBUplDEbXnpogMy/oTlHgHmcibhhLfwQHxa4U8kDS6JF42oAr+WH
	Q3xNiFuSV+hbHJdJpkFi99RWn0xn15d7hyhHPmm+r5Y6KGKyEMfB4t04nXNjP9ZJtCVxJB8xGMRP7
	GaDmjeit6rzh3zRNfAIVBf8sd6VPfecMRFKfC54t+5RRVq4Eke+e2KkVJmYlOuzDqJpyKHfEXDzuI
	TlkMyrLZTnxu2jnfykQ/kbZ0F7lKcuMOl0bMsNZBB92WTtYZ18Mf7RNpmWnxS5aFbqpa7jwvTKYbh
	VyniBrLHbURlnOTNJM0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qS66W-00DXUG-1e;
	Sat, 05 Aug 2023 01:29:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qS66S-00DXTK-1j
	for linux-riscv@lists.infradead.org;
	Sat, 05 Aug 2023 01:29:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CDDE462199
	for <linux-riscv@lists.infradead.org>; Sat,  5 Aug 2023 01:29:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4C35C433A9
	for <linux-riscv@lists.infradead.org>; Sat,  5 Aug 2023 01:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691198949;
	bh=Mi9BT5TmTOYp8D5/MKk0K3shTEe8rrQtwxXzKpBvInE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jVmDVz058rynQRv460/5xFeOfHC4aWI/h8txqFcizdgYszSwCvnnyDiqUgw0yzcli
	 2dmeTeKaW6hiHOf/ywoD/iJW9Y+CbTuAJNpkX0xlNydkzz7s/mTCiYP6ndon8iLLdk
	 tcXRsidnwXgF93D1rElRoDwizOBmeII46BN/3Y0DDkDAropObo8eZwSW7C0mQe8gDm
	 CV+elHGx6yl2lL8UB3/mmGqLBYZxf92dCp+2AoTItHbtrwUUDY2wpcW83HXMvn14eT
	 DKFtKErPMc6TyH6uz2Q61GPoRshL8WBcCNe6xJJE8zeMvV4ZNjIi1c1nuOppiaMhwn
	 fKmCmzZqfZ/NA==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-4fe3c7f16bbso4522624e87.0
        for <linux-riscv@lists.infradead.org>; Fri, 04 Aug 2023 18:29:09 -0700 (PDT)
X-Gm-Message-State: AOJu0YzMpsN2SomoG2Vj3nXGA+2SUsUaE91aQmk0zXGU+YkQwNkRndjQ
	Sc7Zg+EZwcmDqsjcgxPm4BPJ36qvgpfBwzZVo1w=
X-Google-Smtp-Source: AGHT+IE6p4g5OFR65noZcoL88XhtNiTB2Nk7TEaCjoT1P6yXSQxlui/aV3s41RxzO/5Ljhzc5/XXIOsdZMU8RdvdCAY=
X-Received: by 2002:a05:6512:398a:b0:4fe:db6:cb41 with SMTP id
 j10-20020a056512398a00b004fe0db6cb41mr3321948lfu.39.1691198947513; Fri, 04
 Aug 2023 18:29:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230802164701.192791-1-guoren@kernel.org> <20230802164701.192791-8-guoren@kernel.org>
 <20230804-refract-avalanche-9adb6b4b74e9@wendy> <CAJF2gTTfLmCe7eDhfPU1qFTBoVZN8oFACEd4NmTyZaAVtdMK-w@mail.gmail.com>
 <20230804-throwaway-requisite-c73ebe3fee8c@wendy>
In-Reply-To: <20230804-throwaway-requisite-c73ebe3fee8c@wendy>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 5 Aug 2023 09:28:56 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSvjbDF9D0wepAHo65zEkMfg2b+KhsVRpSEK+Qg-q=1gw@mail.gmail.com>
Message-ID: <CAJF2gTSvjbDF9D0wepAHo65zEkMfg2b+KhsVRpSEK+Qg-q=1gw@mail.gmail.com>
Subject: Re: [PATCH V10 07/19] riscv: qspinlock: errata: Introduce ERRATA_THEAD_QSPINLOCK
To: Conor Dooley <conor.dooley@microchip.com>
Cc: paul.walmsley@sifive.com, anup@brainfault.org, peterz@infradead.org, 
	mingo@redhat.com, will@kernel.org, palmer@rivosinc.com, longman@redhat.com, 
	boqun.feng@gmail.com, tglx@linutronix.de, paulmck@kernel.org, 
	rostedt@goodmis.org, rdunlap@infradead.org, catalin.marinas@arm.com, 
	xiaoguang.xing@sophgo.com, bjorn@rivosinc.com, alexghiti@rivosinc.com, 
	keescook@chromium.org, greentime.hu@sifive.com, ajones@ventanamicro.com, 
	jszhang@kernel.org, wefu@redhat.com, wuwei2016@iscas.ac.cn, 
	linux-arch@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-doc@vger.kernel.org, kvm@vger.kernel.org, 
	virtualization@lists.linux-foundation.org, linux-csky@vger.kernel.org, 
	Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_182912_687238_DC000249 
X-CRM114-Status: GOOD (  35.37  )
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

T24gRnJpLCBBdWcgNCwgMjAyMyBhdCA2OjA34oCvUE0gQ29ub3IgRG9vbGV5IDxjb25vci5kb29s
ZXlAbWljcm9jaGlwLmNvbT4gd3JvdGU6Cj4KPiBPbiBGcmksIEF1ZyAwNCwgMjAyMyBhdCAwNTo1
MzozNVBNICswODAwLCBHdW8gUmVuIHdyb3RlOgo+ID4gT24gRnJpLCBBdWcgNCwgMjAyMyBhdCA1
OjA24oCvUE0gQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4gd3JvdGU6
Cj4gPiA+IE9uIFdlZCwgQXVnIDAyLCAyMDIzIGF0IDEyOjQ2OjQ5UE0gLTA0MDAsIGd1b3JlbkBr
ZXJuZWwub3JnIHdyb3RlOgo+ID4gPiA+IEZyb206IEd1byBSZW4gPGd1b3JlbkBsaW51eC5hbGli
YWJhLmNvbT4KPgo+ID4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0
dXJlLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKPiA+ID4gPiBpbmRleCBmOGRi
YmUxYmJkMzQuLmQ5Njk0ZmU0MGE5YSAxMDA2NDQKPiA+ID4gPiAtLS0gYS9hcmNoL3Jpc2N2L2tl
cm5lbC9jcHVmZWF0dXJlLmMKPiA+ID4gPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0
dXJlLmMKPiA+ID4gPiBAQCAtMzQyLDcgKzM0Miw4IEBAIHZvaWQgX19pbml0IHJpc2N2X2ZpbGxf
aHdjYXAodm9pZCkKPiA+ID4gPiAgICAgICAgICAgICAgICAqIHNwaW5sb2NrIHZhbHVlLCB0aGUg
b25seSB3YXkgaXMgdG8gY2hhbmdlIGZyb20gcXVldWVkX3NwaW5sb2NrIHRvCj4gPiA+ID4gICAg
ICAgICAgICAgICAgKiB0aWNrZXRfc3BpbmxvY2ssIGJ1dCBjYW4gbm90IGJlIHZpY2UuCj4gPiA+
ID4gICAgICAgICAgICAgICAgKi8KPiA+ID4gPiAtICAgICAgICAgICAgIGlmICghZm9yY2VfcXNw
aW5sb2NrKSB7Cj4gPiA+ID4gKyAgICAgICAgICAgICBpZiAoIWZvcmNlX3FzcGlubG9jayAmJgo+
ID4gPiA+ICsgICAgICAgICAgICAgICAgICFyaXNjdl9oYXNfZXJyYXRhX3RoZWFkX3FzcGlubG9j
aygpKSB7Cj4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgIHNldF9iaXQoUklTQ1ZfSVNBX0VY
VF9YVElDS0VUTE9DSywgaXNhaW5mby0+aXNhKTsKPiA+ID4KPiA+ID4gSXMgdGhpcyBhIGdlbmVy
aWMgdmVuZG9yIGV4dGVuc2lvbiAobG9sIEAgdGhhdCBtaXNub21lcikgb3IgaXMgaXQgYW4KPiA+
ID4gZXJyYXR1bT8gTWFrZSB5b3VyIG1pbmQgdXAgcGxlYXNlLiBBcyBoYXMgYmVlbiBzYWlkIG9u
IG90aGVyIHNlcmllcywgTkFLCj4gPiA+IHRvIHVzaW5nIG1hcmNoL3ZlbmRvci9pbXAgSURzIGZv
ciBmZWF0dXJlIHByb2JpbmcuCj4gPgo+ID4gVGhlIFJJU0NWX0lTQV9FWFRfWFRJQ0tFVExPQ0sg
aXMgYSBmZWF0dXJlIGV4dGVuc2lvbiBudW1iZXIsCj4KPiBObywgdGhhdCBpcyBub3Qgd2hhdCAi
SVNBX0VYVCIgbWVhbnMsIG5vciB3aGF0IHRoZSBYIGluICJYVElDS0VUTE9DSyIKPiB3b3VsZCBp
bXBseS4KPgo+IFRoZSBjb21tZW50IGFib3ZlIHRoZXNlIHJlYWRzOgo+ICAgVGhlc2UgbWFjcm9z
IHJlcHJlc2VudCB0aGUgbG9naWNhbCBJRHMgb2YgZWFjaCBtdWx0aS1sZXR0ZXIgUklTQy1WIElT
QQo+ICAgZXh0ZW5zaW9uIGFuZCBhcmUgdXNlZCBpbiB0aGUgSVNBIGJpdG1hcC4KPgo+ID4gYW5k
IGl0J3MKPiA+IHNldCBieSBkZWZhdWx0IGZvciBmb3J3YXJkLWNvbXBhdGlibGUuIFdlIGFsc28g
ZGVmaW5lIGEgdmVuZG9yCj4gPiBleHRlbnNpb24gKHJpc2N2X2hhc19lcnJhdGFfdGhlYWRfcXNw
aW5sb2NrKSB0byBmb3JjZSBhbGwgb3VyCj4gPiBwcm9jZXNzb3JzIHRvIHVzZSBxc3BpbmxvY2s7
IG90aGVycyBzdGlsbCBzdGF5IG9uIHRpY2tldF9sb2NrLgo+Cj4gTm8sICJyaXNjdl9oYXNfZXJy
YXRhX3RoZWFkX3FzcGlubG9jaygpIiB3b3VsZCBiZSBhbiBfZXJyYXR1bV8sIG5vdCBhCj4gdmVu
ZG9yIGV4dGVuc2lvbi4gV2UgbmVlZCB0byBoYXZlIGEgZGlzY3Vzc2lvbiBhYm91dCBob3cgdG8g
c3VwcG9ydAo+IG5vbi1zdGFuZGFyZCBleHRlbnNpb25zIGV0Yywgbm90IGFidXNlIGVycmF0YS4g
VGhhdCBkaXNjdXNzaW9uIGhhcyBiZWVuCj4gc3RhcnRlZCBvbiB0aGUgdjAuNy4xIHZlY3RvciBw
YXRjaGVzLCBidXQgaGFzIG5vdCBtYWRlIHByb2dyZXNzIHlldC4KWW91IGNvbnZpbmNlZCBtZSwg
eWVzLCBJIGFidXNlIGVycmF0YSBoZXJlLiBJIHdvdWxkIGNoYW5nZSB0byBMaW51eApzdGFuZGFy
ZCBzdGF0aWNfa2V5IG1lY2hhbmlzbSBuZXh0LgoKPgo+ID4gVGhlIG9ubHkgcG9zc2libGUgY2hh
bmdpbmcgZGlyZWN0aW9uIGlzIGZyb20gcXNwaW5sb2NrIHRvIHRpY2tldF9sb2NrCj4gPiBiZWNh
dXNlIHRpY2tldF9sb2NrIHdvdWxkIGRpcnR5IHRoZSBsb2NrIHZhbHVlLCB3aGljaCBwcmV2ZW50
cwo+ID4gY2hhbmdpbmcgdG8gcXNwaW5sb2NrIG5leHQuIFNvIHN0YXJ0dXAgd2l0aCBxc3Bpbmxv
Y2sgYW5kIGNoYW5nZSB0bwo+ID4gdGlja2V0X2xvY2sgYmVmb3JlIHNtcCB1cC4gWW91IGFsc28g
Y291bGQgdXNlIGNtZGxpbmUgdG8gdHJ5IHFzcGlubG9jawo+ID4gKGZvcmNlX3FzcGlubG9jayku
Cj4KPiBJIGRvbid0IHNlZSB3aGF0IHRoZSByZWxldmFuY2Ugb2YgdGhpcyBpcywgc29ycnkuIEkg
YW0gb25seSBjb21tZW50aW5nCj4gb24gaG93IHlvdSBhcmUgZGVjaWRpbmcgdGhhdCB0aGUgaGFy
ZHdhcmUgaXMgY2FwYWJsZSBvZiB1c2luZyBxc3BpbmxvY2tzLAo+IEkgZG9uJ3QgaW50ZW5kIGdl
dHRpbmcgaW50byB0aGUgZGV0YWlsIHVubGVzcyB0aGUgcG93ZXJzIHRoYXQgYmUgZGVlbQo+IHRo
aXMgc2VyaWVzIHdvcnRod2hpbGUsIGFzIEkgbWVudGlvbmVkOgo+ID4gPiBJJ3ZlIGdvdCBzb21l
IHRob3VnaHRzIG9uIG90aGVyIHBhcnRzIG9mIHRoaXMgc2VyaWVzIHRvbywgYnV0IEknbSBub3QK
PiA+ID4gZ29pbmcgdG8gc3BlbmQgdGltZSBvbiBpdCB1bmxlc3MgdGhlIGxvY2tpbmcgcGVvcGxl
IGFuZCBQYWxtZXIgYXNjZW50Cj4gPiA+IHRvIHRoaXMgc2VyaWVzLgo+CgotLQpCZXN0IFJlZ2Fy
ZHMKIEd1byBSZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
