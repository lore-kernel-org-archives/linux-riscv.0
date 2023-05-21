Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16805C7EE2D
	for <linux-riscv@archiver.kernel.org>; Sun, 21 May 2023 12:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hlSxOVNNGwb2MyZHFDXnehNnOOqAXKxMu0PxJYqTzss=; b=SfDv/54N9kPcRH
	EoQrYMstx9O6YS1Lthm8v4STuG+L5r05oUN6dQO3ZiaMYFO+PssWFzAe922K8KrK6pqlDypB1Z/FP
	WOYdi0dO4mAoQzb1pb5kVoxFpP03ytBFT1/8q5mJfjhgzZJ8O9Vw1oYzuZRX2eDczK154PrCz/kfh
	CC5uNfWo17+YucRozSy8vh/oTUg8psp7RuF4wzVTXnLJVmUWBY/m50wUQlhpeYet3sAqV38G9U1OA
	L+UyoyxZERc+hDp0mZDBOZuXKQd1avG7Pw8A3uchW4NQb7qmMbY6vMTLQ+61cVqRoV6Op/YrBF/9H
	atFbBowOOvOODR3u/u9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0iKD-003rkj-0z;
	Sun, 21 May 2023 12:38:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0iKA-003rk0-0c
	for linux-riscv@lists.infradead.org;
	Sun, 21 May 2023 12:38:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DD16E60F63
	for <linux-riscv@lists.infradead.org>; Sun, 21 May 2023 12:38:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5657C4339C
	for <linux-riscv@lists.infradead.org>; Sun, 21 May 2023 12:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684672687;
	bh=F/yfHoeQVFg/Iszqcubt0GmafBS2VeuM5J2EsdRkorE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GsRudyw5Le/vW1MxI7Egj44IrRtSsL2qcnDSjrbRH9Jjk5Ftslq5CeBx+YTYNOVnp
	 zPI4QxGvX6UmdJ2hQXABKjZ/TnJI6Gu1nAdoE/ygYblhEol7yjGpfurUT+q/FbrHCX
	 c6Qpz14ATiApAPJEd846Ff6EFttbhO2GRnsJB3FjQSvchIdGYoOQJSyLiShVsUkTky
	 TT8cxlNuYWxw551hKixFJcTsmMKRBal2jwmyxan9z5XLR2zSSVRCUz3wnPUqfzbRVu
	 66vc1GoxLlK1smyqnhQh5h2wqoKUz8HUL8RSlY5DmMg/uUSnpNutUHzxCbHl9PEYdH
	 2I9XSGQzykHVQ==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-510ddeab704so6266704a12.3
        for <linux-riscv@lists.infradead.org>; Sun, 21 May 2023 05:38:07 -0700 (PDT)
X-Gm-Message-State: AC+VfDx0LH8cfkTy2z+v4QxMih0PhaFJnj+HMbnwzM6/NskleuAa9SF+
	jRhnb3kEp8Tf9E1nbWJU8SLLLJssGF0b+Hb8XDs=
X-Google-Smtp-Source: ACHHUZ7xwFr0B8U2E4m75ywW4UFqxLS+S/YsLcMBNyTGaV28JA5fJc72cb9PwN0LTziFkSud8N29VLDJmUmJXac2joo=
X-Received: by 2002:a05:6402:1210:b0:510:5d6d:552e with SMTP id
 c16-20020a056402121000b005105d6d552emr5870163edw.40.1684672685946; Sun, 21
 May 2023 05:38:05 -0700 (PDT)
MIME-Version: 1.0
References: <mhng-24855381-7da8-4c77-bcaf-a3a53c8cb38b@palmer-ri-x1c9> <668be661-728d-b87f-b827-4345ad07cc61@sifive.com>
In-Reply-To: <668be661-728d-b87f-b827-4345ad07cc61@sifive.com>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 21 May 2023 20:37:54 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTnbeuFMEQewN=AG5BPiP_V6dfwwFqd18HVtOrnS23bqQ@mail.gmail.com>
Message-ID: <CAJF2gTTnbeuFMEQewN=AG5BPiP_V6dfwwFqd18HVtOrnS23bqQ@mail.gmail.com>
Subject: Re: [RFC PATCH 00/22] riscv: s64ilp32: Running 32-bit Linux kernel on
 64-bit supervisor mode
To: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Arnd Bergmann <arnd@arndb.de>, tglx@linutronix.de, 
	peterz@infradead.org, luto@kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, heiko@sntech.de, jszhang@kernel.org, 
	chenhuacai@kernel.org, apatel@ventanamicro.com, atishp@atishpatra.org, 
	Mark Rutland <mark.rutland@arm.com>, bjorn@kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, rppt@kernel.org, 
	anup@brainfault.org, shihua@iscas.ac.cn, jiawei@iscas.ac.cn, 
	liweiwei@iscas.ac.cn, luxufan@iscas.ac.cn, chunyu@iscas.ac.cn, 
	tsu.yubo@gmail.com, wefu@redhat.com, wangjunqiang@iscas.ac.cn, 
	kito.cheng@sifive.com, andy.chiu@sifive.com, vincent.chen@sifive.com, 
	greentime.hu@sifive.com, corbet@lwn.net, wuwei2016@iscas.ac.cn, 
	jrtc27@jrtc27.com, linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, guoren@linux.alibaba.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230521_053810_316894_97D2A44B 
X-CRM114-Status: GOOD (  26.00  )
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

T24gRnJpLCBNYXkgMTksIDIwMjMgYXQgODoxNOKAr0FNIFBhdWwgV2FsbXNsZXkgPHBhdWwud2Fs
bXNsZXlAc2lmaXZlLmNvbT4gd3JvdGU6Cj4KPiBPbiBUaHUsIDE4IE1heSAyMDIzLCBQYWxtZXIg
RGFiYmVsdCB3cm90ZToKPgo+ID4gT24gVGh1LCAxOCBNYXkgMjAyMyAwNjowOTo1MSBQRFQgKC0w
NzAwKSwgZ3VvcmVuQGtlcm5lbC5vcmcgd3JvdGU6Cj4gPgo+ID4gPiBUaGlzIHBhdGNoIHNlcmll
cyBhZGRzIHM2NGlscDMyIHN1cHBvcnQgdG8gcmlzY3YuIFRoZSB0ZXJtIHM2NGlscDMyCj4gPiA+
IG1lYW5zIHNtb2RlLXhsZW49NjQgYW5kIC1tYWJpPWlscDMyIChpbnRzLCBsb25ncywgYW5kIHBv
aW50ZXJzIGFyZSBhbGwKPiA+ID4gMzItYml0KSwgaS5lLiwgcnVubmluZyAzMi1iaXQgTGludXgg
a2VybmVsIG9uIHB1cmUgNjQtYml0IHN1cGVydmlzb3IKPiA+ID4gbW9kZS4gVGhlcmUgaGF2ZSBi
ZWVuIG1hbnkgNjRpbHAzMiBhYmlzIGV4aXN0aW5nLCBzdWNoIGFzIG1pcHMtbjMyIFsxXSwKPiA+
ID4gYXJtLWFhcmNoNjRpbHAzMiBbMl0sIGFuZCB4ODYteDMyIFszXSwgYnV0IHRoZXkgYXJlIGFs
bCBhYm91dCB1c2Vyc3BhY2UuCj4gPiA+IFRodXMsIHRoaXMgc2hvdWxkIGJlIHRoZSBmaXJzdCB0
aW1lIHJ1bm5pbmcgYSAzMi1iaXQgTGludXgga2VybmVsIHdpdGgKPiA+ID4gdGhlIDY0aWxwMzIg
QUJJIGF0IHN1cGVydmlzb3IgbW9kZSAoSWYgbm90LCBjb3JyZWN0IG1lKS4KPiA+Cj4gPiBEb2Vz
IGFueW9uZSBhY3R1YWxseSB3YW50IHRoaXM/ICBBdCBhIGJhcmUgbWluaW11bSB3ZSdkIG5lZWQg
dG8gYWRkIGl0IHRvIHRoZQo+ID4gcHNBQkksIHdoaWNoIHdvdWxkIHByZXN1bWFibHkgYWxzbyBi
ZSByZXF1aXJlZCBvbiB0aGUgY29tcGlsZXIgc2lkZSBvZiB0aGluZ3MuCj4gPgo+ID4gSXQncyBu
b3QgZXZlbiBjbGVhciBhbnlvbmUgd2FudHMgcnY2NC9pbHAzMiBpbiB1c2Vyc3BhY2UsIHRoZSBr
ZXJuZWwgc2VlbXMKPiA+IGxpa2UgaXQnZCBiZSBldmVuIGxlc3Mgd2lkZWx5IHVzZWQuCj4KPiBX
ZSd2ZSBjZXJ0YWlubHkgdGFsa2VkIHRvIGZvbGtzIHdobyBhcmUgaW50ZXJlc3RlZCBpbiBSVjY0
IElMUDMyIHVzZXJzcGFjZQo+IHdpdGggYW4gTFA2NCBrZXJuZWwuICBUaGUgbW90aXZhdGlvbiBp
cyB0aGUgdXN1YWwgb25lOiB0byByZWR1Y2UgZGF0YSBzaXplCj4gYW5kIHRoZXJlZm9yZSAoaWRl
YWxseSkgQk9NIGNvc3QuICBJIHRoaW5rIHRoaXMgd29yaywgaWYgaXQgZ29lcyBmb3J3YXJkLAo+
IHdvdWxkIG5lZWQgdG8gZ28gaGFuZCBpbiBoYW5kIHdpdGggdGhlIFJWSUEgcHNBQkkgZ3JvdXAu
Cj4KPiBUaGUgUlY2NCBJTFAzMiBrZXJuZWwgYW5kIElMUDMyIHVzZXJzcGFjZSBhcHByb2FjaCBp
bXBsZW1lbnRlZCBieSB0aGlzCj4gcGF0Y2ggaXMgaW50cmlndWluZywgYnV0IEkgZ3Vlc3MgZm9y
IG1lLCB0aGUgcXVlc3Rpb24gaXMgd2hldGhlciBpdCdzCj4gd29ydGggdGhlIGV4dHJhIGhhc3Ns
ZSB2cy4gYSBwdXJlIFJWMzIga2VybmVsICYgdXNlcnNwYWNlLgpSdW5uaW5nIHB1cmUgUlYzMiBr
ZXJuZWwgb24gNjQtYml0IGhhcmR3YXJlIGlzIG5vdCBhbiBpbnRlbGxpZ2VudApjaG9pY2UgKHN1
Y2ggYXMgY29ydGV4LWEzNS9hNTMvYTU1KSwgYmVjYXVzZSB0aGV5IHdhc3RlZCA2NC1iaXQgaHcK
Y2FwYWJpbGl0aWVzLCBhbmQgdGhlIGhhcmR3YXJlIGRlc2lnbmVyIHdvdWxkIHdhc3RlIGFkZGl0
aW9uYWwKcmVzb3VyY2VzICYgdGltZSBvbiAzMi1iaXQgbWFjaGluZSAmIHN1cGVydmlzb3IgbW9k
ZXMgKEluIGFybSBpdCBpcwpjYWxsZWQgRUwzL0VMMi9FTDEgbW9kZXMpLiBUaGluayBhYm91dCB0
b28gbWFueSBQTVAgQ1NScywgUE1VIENTUnMsCmFuZCBtb2RlIHN3aXRjaCAuLi4gaXQncyBkZWZp
bml0ZWx5IHdyb25nIHRvIGZvbGxvdyB0aGUKY29ydGV4LWEzNS9hNTMvYTU1IHdheSB0byBkZWFs
IHdpdGggcmlzY3YzMiBvbiBhIDY0LWJpdCBoYXJkd2FyZS4gVGhlCmNoYXB0ZXIgIldoeSBzNjRp
bHAzMiBoYXMgYmV0dGVyIHBlcmZvcm1hbmNlPyIgZ2l2ZSBvdXQgdGhlCmltcHJvdmVtZW50IHYu
cy4gcHVyZSAzMi1iaXQsIEkgcmVwZWF0IGl0IGhlcmU6CgogLSBtZW1jcHkvbWVtc2V0L3N0cmNt
cCAoczY0aWxwMzIgaGFzIGhhbGYgb2YgdGhlIG51bWJlciBvZgppbnN0cnVjdGlvbnMgYW5kIGRv
dWJsZSB0aGUgYmFuZHdpZHRoIHBlciBsb2FkL3N0b3JlIGluc3RydWN0aW9uIHRoYW4KczMyaWxw
MzIuKQoKLSBlYnBmIEpJVCBpcyBhIDY0LWJpdCB2aXJ0dWFsIElTQSwgd2hpY2ggY291bGRuJ3Qg
YmUgc3VmZmljaWVudAptYXBwaW5nIGJ5IHMzMmlscDMyLCBidXQgczY0aWxwMzIgY291bGQgKGp1
c3QgbGlrZSBzNjRscDY0KS4KCiAtIEF0b21pYzY0IChzNjRpbHAzMiBoYXMgdGhlIGV4YWN0IG5h
dGl2ZSBpbnN0cnVjdGlvbnMgbWFwcGluZyBhcwpzNjRscDY0LCBidXQgczMyaWxwMzIgb25seSB1
c2VzIGdlbmVyaWNfYXRvbWljNjQsIGEgdHJhZGVvZmYgJiBsaW1pdGVkCnNvZnR3YXJlIHNvbHV0
aW9uLikKCiAtIDY0LWJpdCBuYXRpdmUgYXJpdGhtZXRpYyBpbnN0cnVjdGlvbnMgZm9yICJsb25n
IGxvbmciIHR5cGUKCiAtIHJpc2N2IHM2NGlscDMyIGNvdWxkIHN1cHBvcnQgY214Y2hnX2RvdWJs
ZSBmb3Igc2x1YiAoVGhlIDJuZCAzMi1iaXQKTGludXggc3VwcG9ydHMgdGhlIGZlYXR1cmUsIHRo
ZSAxc3QgaXMgaTM4Ni4pCgo+Cj4KPiAtIFBhdWwKCgoKLS0gCkJlc3QgUmVnYXJkcwogR3VvIFJl
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
