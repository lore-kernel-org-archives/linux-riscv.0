Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3150EC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 22:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EzUCCGLo2W1TKuGVWT4eR25Mfqkj/C0gLbNCBCzPMJA=; b=HUZ6vaqFHxXDy4
	G+gwFINarZgnT/YItW/qO0rbCaAbYEHgPkBqJ7aoHrOova0isj/HC/5Nin0HCIu3lLpcydLGu/ApE
	ehzrdYRl7z1IothxA5WfWvR7/G64Ye5dkPquWX+9/um4h8PuCXwiEmS91WCAF7g/lSzCFe5mKIcH/
	k+x5JYISN95PVNwqrhujg9zvrATsBm7VzM8XHWAxebevgMciIP8EV2U2/L+ze4ZFq7x9upcThTjI7
	fq+gIMcW5IfsGgB1PAWeQp1rhqMttc8bp3PMXEIvclBB2H3ZcZQDSwbKDgac2IEaJ+VY7/BpdAj+m
	DOW4PimZL6xrtjilh5ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDXlz-00G88C-1S;
	Wed, 13 Dec 2023 22:32:11 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDXlv-00G84j-2z
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 22:32:09 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-548ae9a5eeaso1595a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 14:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702506714; x=1703111514; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+PgJaJWhApgF9FmIhLYdcKhchOF9hVT1X2VoAnpn0Ao=;
        b=QPvHctR8OnhhgstE164j0ZLeqsh8eEwyQUncbXuz7/CXf5dKPusuyKJJODmr5iSg2T
         0H0I8IUQWyYPNRDjuB0FtA4bzh2OA2/kTagUjBSA8cwskmarHprzNcv+BHTZwYQiE2zP
         vW3LfSzMXP9ehBmcpKsSXsaayN/Z7iM6Sa76yVEvPkDkRadoXMwgYMjs+s6EkvAibYkB
         zsO3V1vKjalHWcK3F0HDVl002kGsWZMTwvHdLiHMqGOuxcV39/4WZfqLzQBScO5Z1WYT
         kdqoOSQaW+u6O0kLkK3sNqbTBis9NykMTL10k4u/BFHSfp/ysqk6IUQZhSOKurE38pq6
         T/Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702506714; x=1703111514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+PgJaJWhApgF9FmIhLYdcKhchOF9hVT1X2VoAnpn0Ao=;
        b=qO4ogmTmWR9n7XQJadetpaT0eApCXMIL94ukft3vuD7jJTLToXcY+hBUXhFzF2Qe3l
         PKWM87Hf0oRNo0ORFICTxf3yLy/I+oFBhTRhrWyvImsXngCNQ6a1LiSmorA30B0vLBgm
         Z8e2J1RrvmOV8QO6/zES3SirpFVkdErBXWA9X3AqF+yCZNFvPJuxu7XIxyTe65dqlWss
         oJCv32vrwJZdH42CNoIfz5w03BJ9kgVmgifQzPEqRpTzuVUPBhaxRZGcvilGx5KHd/8U
         2u7qWDEosQmW5+sCNbpXBwvYc/uAyv6V6I6iXTULTwrj4IHfFsRFJyEfnQ+KSoSaMOZG
         Exfg==
X-Gm-Message-State: AOJu0Yz4GnCT/4w4okSaf+Zjuab+uyvlYKPh/2ECdnh3rx9E8SULPxc/
	i1/QtdDPmmoi5Fkqz0tRhXjYO61Ag33nIe0a744ltA==
X-Google-Smtp-Source: AGHT+IETGng/qZp64XWpPY6SM575xAjiFlUFwCCdv1u6UWr+/vXroByM0/GH9N8F8x7DGSWZmaydB5N9a7FN1v/1FZ8=
X-Received: by 2002:a05:6402:35c5:b0:551:9870:472 with SMTP id
 z5-20020a05640235c500b0055198700472mr314909edc.1.1702506714443; Wed, 13 Dec
 2023 14:31:54 -0800 (PST)
MIME-Version: 1.0
References: <20220921003201.1441511-11-seanjc@google.com> <20231207010302.2240506-1-jmattson@google.com>
 <ZXHw7tykubfG04Um@google.com> <CALMp9eTT97oDmQT7pxeOMLQbt-371aMtC2Kev+-kWXVRDVrjeg@mail.gmail.com>
 <ZXh8Nq_y_szj1WN0@google.com> <5ca5592b21131f515e296afae006e5bb28b1fb87.camel@redhat.com>
In-Reply-To: <5ca5592b21131f515e296afae006e5bb28b1fb87.camel@redhat.com>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 13 Dec 2023 14:31:40 -0800
Message-ID: <CALMp9eQ69dGSix-9pJdEtEw9T1Mqz9E1eaf1-yGP9k4_nMZogw@mail.gmail.com>
Subject: Re: [PATCH v4 10/12] KVM: x86: never write to memory from kvm_vcpu_check_block()
To: Maxim Levitsky <mlevitsk@redhat.com>
Cc: Sean Christopherson <seanjc@google.com>, alexandru.elisei@arm.com, anup@brainfault.org, 
	aou@eecs.berkeley.edu, atishp@atishpatra.org, borntraeger@linux.ibm.com, 
	chenhuacai@kernel.org, david@redhat.com, frankja@linux.ibm.com, 
	imbrenda@linux.ibm.com, james.morse@arm.com, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	maz@kernel.org, oliver.upton@linux.dev, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, pbonzini@redhat.com, suzuki.poulose@arm.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_143207_961894_AE902EBF 
X-CRM114-Status: GOOD (  28.09  )
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

T24gV2VkLCBEZWMgMTMsIDIwMjMgYXQgMjoyNeKAr1BNIE1heGltIExldml0c2t5IDxtbGV2aXRz
a0ByZWRoYXQuY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgMjAyMy0xMi0xMiBhdCAwNzoyOCAtMDgw
MCwgU2VhbiBDaHJpc3RvcGhlcnNvbiB3cm90ZToKPiA+IE9uIFN1biwgRGVjIDEwLCAyMDIzLCBK
aW0gTWF0dHNvbiB3cm90ZToKPiA+ID4gT24gVGh1LCBEZWMgNywgMjAyMyBhdCA4OjIx4oCvQU0g
U2VhbiBDaHJpc3RvcGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5jb20+IHdyb3RlOgo+ID4gPiA+IERv
aC4gIFdlIGdvdCB0aGUgbGVzcyBvYnZpb3VzIGNhc2VzIGFuZCBtaXNzZWQgdGhlIG9idmlvdXMg
b25lLgo+ID4gPiA+Cj4gPiA+ID4gVWdoLCBhbmQgd2UgYWxzbyBtaXNzZWQgYSByZWxhdGVkIG1l
c3MgaW4ga3ZtX2d1ZXN0X2FwaWNfaGFzX2ludGVycnVwdCgpLiAgVGhhdAo+ID4gPiA+IHRoaW5n
IHNob3VsZCByZWFsbHkgYmUgZm9sZGVkIGludG8gdm14X2hhc19uZXN0ZWRfZXZlbnRzKCkuCj4g
PiA+ID4KPiA+ID4gPiBHb29kIGdyYXZ5LiAgQW5kIHZteF9pbnRlcnJ1cHRfYmxvY2tlZCgpIGRv
ZXMgdGhlIHdyb25nIHRoaW5nIGJlY2F1c2UgdGhhdAo+ID4gPiA+IHNwZWNpZmljYWxseSBjaGVj
a3MgaWYgTDEgaW50ZXJydXB0cyBhcmUgYmxvY2tlZC4KPiA+ID4gPgo+ID4gPiA+IENvbXBpbGUg
dGVzdGVkIG9ubHksIGFuZCBkZWZpbml0ZWx5IG5lZWRzIHRvIGJlIGNodW5rZWQgaW50byBtdWx0
aXBsZSBwYXRjaGVzLAo+ID4gPiA+IGJ1dCBJIHRoaW5rIHNvbWV0aGluZyBsaWtlIHRoaXMgbWVz
cz8KPiA+ID4KPiA+ID4gVGhlIHByb3Bvc2VkIHBhdGNoIGRvZXMgbm90IGZpeCB0aGUgcHJvYmxl
bS4gSW4gZmFjdCwgaXQgbWVzc2VzIHRoaW5ncwo+ID4gPiB1cCBzbyBtdWNoIHRoYXQgSSBkb24n
dCBnZXQgYW55IHRlc3QgcmVzdWx0cyBiYWNrLgo+ID4KPiA+IERyYXQuCj4gPgo+ID4gPiBHb29n
bGUgaGFzIGFuIGludGVybmFsIEstVS1UIHRlc3QgdGhhdCBkZW1vbnN0cmF0ZXMgdGhlIHByb2Js
ZW0uIEkKPiA+ID4gd2lsbCBwb3N0IGl0IHNvb24uCj4gPgo+ID4gUmVjZWl2ZWQsIEknbGwgZGln
IGluIHNvb25pc2gsIHRob3VnaCAic29vbmlzaCIgbWlnaHQgdW5mb3J0dW5hdGVseSBtaWdodCBt
ZWFuCj4gPiAyMDI0Lgo+ID4KPgo+IEhpLAo+Cj4gU28gdGhpcyBpcyB3aGF0IEkgdGhpbms6Cj4K
Pgo+IEtWTSBkb2VzIGhhdmUga3ZtX2d1ZXN0X2FwaWNfaGFzX2ludGVycnVwdCgpIGZvciB0aGlz
IGV4YWN0IHB1cnBvc2UsCj4gdG8gY2hlY2sgaWYgbmVzdGVkIEFQSUN2IGhhcyBhIHBlbmRpbmcg
aW50ZXJydXB0IGJlZm9yZSBoYWx0aW5nLgo+Cj4KPiBIb3dldmVyIHRoZSBwcm9ibGVtIGlzIGJp
Z2dlciAtIHdpdGggQVBJQ3Ygd2UgaGF2ZSBpbiBlc3NlbmNlIDIgcGVuZGluZyBpbnRlcnJ1cHQK
PiBiaXRtYXBzIC0gdGhlIFBJUiBhbmQgdGhlIElSUiwgYW5kIHRvIGtub3cgaWYgdGhlIGd1ZXN0
IGhhcyBhIHBlbmRpbmcgaW50ZXJydXB0Cj4gb25lIGhhcyBpbiB0aGVvcnkgdG8gY29weSBQSVIg
dG8gSVJSLCB0aGVuIHNlZSBpZiB0aGUgbWF4IGlzIGxhcmdlciB0aGVuIHRoZSBjdXJyZW50IFBQ
Ui4KPgo+IFNpbmNlIHdlIGRvbid0IHdhbnQgdG8gd3JpdGUgdG8gZ3Vlc3QgbWVtb3J5LCBhbmQg
dGhlIElSUiBoZXJlIHJlc2lkZXMgaW4gdGhlIGd1ZXN0IG1lbW9yeSwKPiBJIGd1ZXNzIHdlIGhh
dmUgdG8gZG8gYSAnZHJ5LXJ1bicgdmVyc2lvbiBvZiAndm14X2NvbXBsZXRlX25lc3RlZF9wb3N0
ZWRfaW50ZXJydXB0JyBhbmQgY2FsbAo+IGl0IGZyb20gIGt2bV9ndWVzdF9hcGljX2hhc19pbnRl
cnJ1cHQoKS4KPgo+IFdoYXQgZG8geW91IHRoaW5rPyBJIGNhbiBwcmVwYXJlIGEgcGF0Y2ggZm9y
IHRoaXMuCj4KPiBDYW4geW91IHNoYXJlIGEgcmVwcm9kdWNlciBvciB3cml0ZSBhIG5ldyBvbmUg
dGhhdCBjYW4gYmUgc2hhcmVkPwoKU2VlIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2t2bS8yMDIz
MTIxMTE4NTU1Mi4zODU2ODYyLTEtam1hdHRzb25AZ29vZ2xlLmNvbS8uCgo+IEJlc3QgcmVnYXJk
cywKPiAgICAgICAgIE1heGltIExldml0c2t5Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
