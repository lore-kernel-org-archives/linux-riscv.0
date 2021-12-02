Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F443C433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Dec 2021 02:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LR1ldrjqC9WjK5YU1MyZBBt+r5lAeOPZ69sQcHiK6+k=; b=ON6Yd//7VRccLy
	Gn4CrwHDwhotuMVxFaFKLcSjQmV6IOSiXGmgeOVvWrFBIUDv4roLRsD3ZyxeErB7XDhped4Ogr3mB
	kQYpNRMgoUZSxkn8nH5r/RxzUSKK+9wmJiFdEnCD8yw9v8eKpirnGkleTKxrp+8WkEBxK5ThcfyCJ
	XyG1Vtvpa5GpGjgnGgBrEXqes5/p3ZYnR6hdxDBfoDgbjHS2mEMT36Ub5jSne0rBBTsjbsL6A/VOD
	jxp9Fp7bemo27DKp3H+MUZWaR6h/SOaEIy33BwYUwZ/q/due/Q3dj/CujOvLkhIbhca+tvN0biY2a
	/RbAooOohiE0Od1GfYPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msbOc-00AbC5-ST; Thu, 02 Dec 2021 02:00:26 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msbOO-00Ab56-E8
 for linux-riscv@lists.infradead.org; Thu, 02 Dec 2021 02:00:14 +0000
Received: by mail-pl1-x630.google.com with SMTP id u11so19131926plf.3
 for <linux-riscv@lists.infradead.org>; Wed, 01 Dec 2021 18:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=ieez22Xn2l5HWg/32xD5LElmnAc6m+5OIzBSW88ykGA=;
 b=G0z4qsx02gTJpOX+id+WDt87iiCC68/pLc8/RHTHy93ZaRCC/cpz/VtsZ5QLq6NhsC
 pztYoE3cxmb1ab05i+mKIC8ML+IoYX2JvCedMYG/dA5g4rEg3w2gyuXKxfic5SWkfGb+
 LTzmn0ERm4vLCwinV2Q7f64T7CvStCYLOXGIoBC/JED1+H3JdUB9Rafl3aySZq2PFK+D
 j8FA4sR8WNSfp7GYg67MnxS2CunppQgmHJnEXulsOfQJjagvmDJOLOMmlhUfNCfaq2x+
 Msm/OAxbLxPfZ954U2c9p631E4TYd+VGgfnvhf+iALAZ45wlstnB6aDZPFFAYACiiRYn
 9c3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ieez22Xn2l5HWg/32xD5LElmnAc6m+5OIzBSW88ykGA=;
 b=3kk6Jm49C0ATuhYZpFBuSFxJeIIu93YJr34nD93UpFH7Zb9cpI13WFnHubfDnAvSkS
 VW1OipeQJ6B+8beg8s0hCDXinqzKaebxgyCw+rXLGV+Rm9MrYP+0YPnN90x2ukd3lrmF
 HGpbBASE3bvZ2Z0b+zvUeXR7m9bH/LhmCt9vkJfi2WxQ5aQYoDqNVESDaLHDzGFESmH7
 roMt5JdkWMJVzcLSuRu/vC6ISeMAqE5uzbgiIiGCOjS+4mRTke8F33B97CvlmXqETU7T
 vdlchkh7fU6Xi/7MRo2jtmVCrycSxLlVHnsp3sZNvuPhSxnjxBu1rRH7S9NUhLY04wj/
 biYw==
X-Gm-Message-State: AOAM532ld2zax5PILDktC0TU2KrayioSvS//LBAWOxS4NWiQS1HTAf6Y
 +tg8IwdICWux2hM1HYbBTfxnMg==
X-Google-Smtp-Source: ABdhPJxNBM72YGsKSZuE+5oJQdw89IebyEem9LDSzk1Pcg1GjafGCYFG2d6Z2Cymjn7sJ6Jwu52nlQ==
X-Received: by 2002:a17:90b:3848:: with SMTP id
 nl8mr2408510pjb.221.1638410408016; 
 Wed, 01 Dec 2021 18:00:08 -0800 (PST)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id lr6sm550689pjb.0.2021.12.01.18.00.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 18:00:07 -0800 (PST)
Date: Thu, 2 Dec 2021 02:00:03 +0000
From: Sean Christopherson <seanjc@google.com>
To: Maxim Levitsky <mlevitsk@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, Anup Patel <anup.patel@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Atish Patra <atish.patra@wdc.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
 linux-mips@vger.kernel.org, kvm@vger.kernel.org,
 kvm-ppc@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 David Matlack <dmatlack@google.com>, Oliver Upton <oupton@google.com>,
 Jing Zhang <jingzhangos@google.com>, Wei Huang <wei.huang2@amd.com>
Subject: Re: [PATCH v2 11/43] KVM: Don't block+unblock when halt-polling is
 successful
Message-ID: <Yagoo7R8P5xVilsj@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-12-seanjc@google.com>
 <cceb33be9e2a6ac504bb95a7b2b8cf5fe0b1ff26.camel@redhat.com>
 <4e883728e3e5201a94eb46b56315afca5e95ad9c.camel@redhat.com>
 <YaUNBfJh35WXMV0M@google.com>
 <496c2fc6-26b0-9b5d-32f4-2f9e9dd6a064@redhat.com>
 <YaUiEquKYi5eqWC0@google.com>
 <880a5727-69d1-72a1-b129-b053781625ad@redhat.com>
 <458c0819a578ba854f00089bc312c8faa177a81a.camel@redhat.com>
 <32eabe7d270e5a466ba2d9345b4270b8fe27700c.camel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <32eabe7d270e5a466ba2d9345b4270b8fe27700c.camel@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211201_180012_578791_C9771DE2 
X-CRM114-Status: GOOD (  25.52  )
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

T24gVGh1LCBEZWMgMDIsIDIwMjEsIE1heGltIExldml0c2t5IHdyb3RlOgo+IE9uIFR1ZSwgMjAy
MS0xMS0zMCBhdCAwMDo1MyArMDIwMCwgTWF4aW0gTGV2aXRza3kgd3JvdGU6Cj4gPiBPbiBNb24s
IDIwMjEtMTEtMjkgYXQgMjA6MTggKzAxMDAsIFBhb2xvIEJvbnppbmkgd3JvdGU6Cj4gPiBCYXNp
Y2FsbHkgd2hhdCBJIHNlZSB0aGF0Cj4gPiAgCj4gPiAxLiB2Q1BVMiBkaXNhYmxlcyBpc19ydW5u
aW5nIGluIGF2aWMgcGh5c2ljYWwgaWQgY2FjaGUKPiA+IDIuIHZDUFUyIGNoZWNrcyB0aGF0IElS
UiBpcyBlbXB0eSBhbmQgaXQgaXMKPiA+IDMuIHZDUFUyIGRvZXMgc2NoZWR1bGUoKTsKPiA+ICAK
PiA+IGFuZCBpdCBrZWVwcyBvbiBzbGVlcGluZyBmb3JldmVyLiBJZiBJIGtpY2sgaXQgdmlhIHNp
Z25hbCAKPiA+IChsaWtlIGp1c3QgZG9pbmcgJ2luZm8gcmVnaXN0ZXJzJyBxZW11IGhtcCBjb21t
YW5kCj4gPiBvciBqdXN0IHN0b3AvY29udCBvbiB0aGUgc2FtZSBobXAgaW50ZXJmYWNlLCB0aGUK
PiA+IHZDUFUgd2FrZXMgdXAgYW5kIG5vdGljZXMgdGhhdCBJUlIgc3VkZGVubHkgaXMgbm90IGVt
cHR5LAo+ID4gYW5kIHRoZSBWTSBjb21lcyBiYWNrIHRvIGxpZmUgKGFuZCB0aGVuIGhhbmdzIGFm
dGVyIGEgd2hpbGUgYWdhaW4KPiA+IHdpdGggdGhlIHNhbWUgcHJvYmxlbS4uLi4pLgo+ID4gIAo+
ID4gQXMgZmFyIGFzIEkgc2VlIGluIHRoZSB0cmFjZXMsIHRoZSBiaXQgaW4gSVJSIGNhbWUgZnJv
bQo+ID4gYW5vdGhlciBWQ1BVIHdobyBkaWRuJ3QgcmVzcGVjdCB0aGUgaXJfcnVubmluZyBiaXQg
YW5kIGRpZG4ndCBnZXQgCj4gPiBBVklDX0lOQ09NUExFVEVfSVBJIFZNZXhpdC4KPiA+IEkgY2Fu
J3QgMTAwJSBwcm92ZSBpdCB5ZXQsIGJ1dCBldmVyeXRoaW5nIGluIHRoZSB0cmFjZSBzaG93cyB0
aGlzLgoKLi4uCgo+IEkgYW0gbm93IGFsbW9zdCBzdXJlIHRoYXQgdGhpcyBpcyBlcnJhdGEgIzEy
MzUuCj4gCj4gSSBoYWQgYXR0YWNoZWQgYSBrdm0tdW5pdC10ZXN0IEkgd3JvdGUgKHBhdGNoIGFn
YWluc3QgbWFzdGVyIG9mCj4gaHR0cHM6Ly9naXRsYWIuY29tL2t2bS11bml0LXRlc3RzL2t2bS11
bml0LXRlc3RzLmdpdC8pIHdoaWNoIGlzIGFibGUgdG8KPiByZXByb2R1Y2UgdGhlIGlzc3VlIG9u
IHN0b2NrIDUuMTUuMCBrZXJuZWwgKCpubyBwYXRjaGVzIGFwcGxpZWQgYXQgYWxsKikKPiBhZnRl
ciBqdXN0IGZldyBzZWNvbmRzLiAgSWYga3ZtIGlzIGxvYWRlZCB3aXRob3V0IGhhbHQtcG9sbGlu
ZyAodGhhdCBpcwo+IGhhbHRfcG9sbF9ucz0wIGlzIHVzZWQpLgo+IAo+IEhhbHQgcG9sbGluZyBh
bmQvb3IgU2VhbidzIHBhdGNoIGFyZSBub3QgdG8gYmxhbWUsIGl0IGp1c3QgY2hhbmdlcyB0aW1l
aW5nLgo+IFdpdGggU2VhbidzIHBhdGNoIEkgZG9uJ3QgbmVlZCB0byBkaXNhYmxlIGhhbGYgcG9s
bGluZy4KCkhtbSwgdGhhdCBzdWdnZXN0cyB0aGUgYnVnL2VycmF0dW0gaXMgZHVlIHRvIHRoZSBD
UFUgY29uc3VtaW5nIHN0YWxlIGRhdGEgZnJvbSAjNApmb3IgdGhlIElzUnVubmluZyBjaGVjayBp
biAjNSwgb3IgcmV0aXJpbmcgdW9wcyBmb3IgdGhlIElzUnVubmluZyBjaGVjayBiZWZvcmUKcmV0
aXJpbmcgdGhlIHZJUlIgdXBkYXRlLiAgSXQgd291bGQgYmUgaGVscGZ1bCBpZiB0aGUgZXJyYXR1
bSBhY3R1YWxseSBwcm92aWRlZAppbmZvIG9uIHRoZSAiaGlnaGx5IHNwZWNpZmljIGFuZCBkZXRh
aWxlZCBzZXQgb2YgaW50ZXJuYWwgdGltaW5nIGNvbmRpdGlvbnMiLiA6LS8KCiAgNC4gTG9va3Vw
IHRoZSB2QVBJQyBiYWNraW5nIHBhZ2UgYWRkcmVzcyBpbiB0aGUgUGh5c2ljYWwgQVBJQyB0YWJs
ZSB1c2luZyB0aGUKICAgICBndWVzdCBwaHlzaWNhbCBBUElDIElEIGFzIGFuIGluZGV4IGludG8g
dGhlIHRhYmxlLgogIDUuIEZvciBldmVyeSB2YWxpZCBkZXN0aW5hdGlvbjoKICAgICAtIEF0b21p
Y2FsbHkgc2V0IHRoZSBhcHByb3ByaWF0ZSBJUlIgYml0IGluIGVhY2ggb2YgdGhlIGRlc3RpbmF0
aW9uc+KAmSB2QVBJQwogICAgICAgYmFja2luZyBwYWdlLgogICAgIC0gQ2hlY2sgdGhlIElzUnVu
bmluZyBzdGF0dXMgb2YgZWFjaCBkZXN0aW5hdGlvbi4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
