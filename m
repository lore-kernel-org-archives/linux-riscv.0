Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4BAEC001B0
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 23:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=stCDWhSr2vRGuVti0YS6plNKCrawnEUnBog1+fyOn8o=; b=G7zTPpJIlHWFabO1KSdDPkcXL0
	apO88MuWwU/cR99gwdXT3bAndjyjT5tZbEjaJUzgk5vNiI5AfCGDMdqWzRSMpx7z6Giqv/h2/tpi8
	vG5Ztp6GgyShUF3vXEZ12fiU41iyvsW6bVzN8Qqw6higkzpVruUAuq68fRnqxkxZI+5mHX/dL/WoZ
	K7zPcvK+sEwKsTXudNUk5LFU0on0OAXHxo0OOS7fod+VhhjqUGTihAWRgGgtcjl+AfXQUk3Gusk23
	nt8eZKpJYRjpTpw6sv6EwcD2g0vTAzBZe3lPQ/4l4UgL4K9jD7Nm6U6NOEd3azxwLeZAaEe4EdLm6
	yx2D6haA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUEhw-008slH-2k;
	Thu, 10 Aug 2023 23:04:44 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUEht-008sja-04
	for linux-riscv@lists.infradead.org;
	Thu, 10 Aug 2023 23:04:42 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-53ff4f39c0fso1850987a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 10 Aug 2023 16:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691708678; x=1692313478;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A2HZ014dOId2hDwWOJ0bOX1N/o8JyjLLT0vxMFHcIcY=;
        b=0MC+1qS5aT0RvDrX5IaHMaXhXaErKLPRBrB/Qhb9rgmY/6FUVskutRGKLGqj7dY8hZ
         QRIRnikH8YFjNgr26no9dHROZf3p60slPbecWPaWe27AiUFJ/WfBafaaXTbrUs3CVUqu
         hhLtZXslkxOrFt2TQSZEudUex+ICR4f926CQFKIQGIAZBOvLfcMDtMJtl8z9MxExyF3m
         HSUPnDnmO71AFEjYA9qJQWTjeQSK/GOn7SK1H5NcSqwjW6Q/phOxevKNgs7Q+RASqjqg
         bTDAPkdoWEjWPz8yPMRjP0Nlq0K15tkZPNotUJ4eWFH3He4oVgHfl1pkxkzx7sTODcyz
         lDyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691708678; x=1692313478;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=A2HZ014dOId2hDwWOJ0bOX1N/o8JyjLLT0vxMFHcIcY=;
        b=OuR72dswoge2ZF/jQMODT1J51Ah6Noo57lzb9UL/9gYjjh6HgcwPl+ccpRWmqd6Tnx
         mh6d4JlXGSOPsspBmo8kPUFpPiS4Btf3BiqnW4O7y0py5Tm+4aG3xrXYhyl6DXCh326L
         enY8jfER35E3bcs/XrT81dkP82SVzlM8W98+tDALsa6GNScGQYN4dxRdiDu67htzYZkf
         GuI0UdGKU+yBtaGf6naDLm1cMHUebPV3TRmGmoAKBvDwcoMCJ+m8XjCors1rTt8VVdSN
         j5RoCLm8dzHYfjhHY08q/BVw/4Ykde+Z38C3zVghkLATUqj5FTrfQp3AvsfUvhNkzrVX
         VnxQ==
X-Gm-Message-State: AOJu0Yzd9CxBqzL5iALK2ZjzK+lLBihQmFLztXlwsJhOjN87E3BN6+Wx
	2adkggTzsr95U+4Ek+v78257qMQowtk=
X-Google-Smtp-Source: AGHT+IEllgdOFrNBSktZ3B9czod0DT40RFdbG9IKB+P9/wA8Lbl3UGUkI/mcLGmHPzlm/kyI0BgShEUaX90=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a63:7e10:0:b0:563:e825:7f3a with SMTP id
 z16-20020a637e10000000b00563e8257f3amr14811pgc.11.1691708678622; Thu, 10 Aug
 2023 16:04:38 -0700 (PDT)
Date: Thu, 10 Aug 2023 16:04:37 -0700
In-Reply-To: <CAJHc60w0By2Q+PCsfwReGXsN5zf5k1ww3Ov4m9Eb-pFH-UKBDg@mail.gmail.com>
Mime-Version: 1.0
References: <20230808231330.3855936-1-rananta@google.com> <20230808231330.3855936-3-rananta@google.com>
 <c33b0518-6e64-7acf-efa8-f404fce1ccac@redhat.com> <CAJHc60yCJANBQOizaoSPhEJH9e8a9C6n68x4qdVkOhVZiiWqkw@mail.gmail.com>
 <30e45ef3-309a-63de-e085-be1645c1be79@redhat.com> <CAJHc60x=bhXS3PahuRPwRVdqN4LeX-PBdjdEeCEomhf2YAJ1mw@mail.gmail.com>
 <ZNVfsxdYKu9Nt+j+@google.com> <CAJHc60w0By2Q+PCsfwReGXsN5zf5k1ww3Ov4m9Eb-pFH-UKBDg@mail.gmail.com>
Message-ID: <ZNVtBQvjM45tmbce@google.com>
Subject: Re: [PATCH v8 02/14] KVM: Declare kvm_arch_flush_remote_tlbs() globally
From: Sean Christopherson <seanjc@google.com>
To: Raghavendra Rao Ananta <rananta@google.com>
Cc: Shaoqin Huang <shahuang@redhat.com>, Gavin Shan <gshan@redhat.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Jing Zhang <jingzhangos@google.com>, 
	Reiji Watanabe <reijiw@google.com>, Colton Lewis <coltonlewis@google.com>, 
	David Matlack <dmatlack@google.com>, Fuad Tabba <tabba@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_160441_071932_E0A7B58C 
X-CRM114-Status: GOOD (  32.32  )
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

T24gVGh1LCBBdWcgMTAsIDIwMjMsIFJhZ2hhdmVuZHJhIFJhbyBBbmFudGEgd3JvdGU6Cj4gT24g
VGh1LCBBdWcgMTAsIDIwMjMgYXQgMzoyMOKAr1BNIFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNlYW5q
Y0Bnb29nbGUuY29tPiB3cm90ZToKPiA+IE9uIFRodSwgQXVnIDEwLCAyMDIzLCBSYWdoYXZlbmRy
YSBSYW8gQW5hbnRhIHdyb3RlOgo+ID4gPiBBZnRlciBkb2luZyBzb21lIGV4cGVyaW1lbnRzLCBJ
IHRoaW5rIGl0IHdvcmtzIGJlY2F1c2Ugb2YgdGhlIG9yZGVyIGluCj4gPiA+IHdoaWNoIHRoZSBp
bmxpbmUtZGVmaW5pdGlvbiBhbmQgdGhlIGRlY2xhcmF0aW9uIGFyZSBsYWlkIG91dC4gSWYgdGhl
Cj4gPiA+ICdpbmxpbmUnIHBhcnQgb2YgdGhlIGZ1bmN0aW9uIGNvbWVzIGZpcnN0IGFuZCB0aGVu
IHRoZSBkZWNsYXJhdGlvbiwgd2UKPiA+ID4gZG9uJ3Qgc2VlIGFueSBlcnJvci4gSG93ZXZlciBp
ZiB0aGUgcG9zaXRpb25zIHdlcmUgcmV2ZXJzZWQsIHdlIHdvdWxkCj4gPiA+IHNlZSBhbiBlcnJv
ci4gKEknbSBub3Qgc3VyZSB3aGF0IHRoZSB0ZWNobmljYWwgcmVhc29uIGZvciB0aGlzIGlzKS4K
PiA+ID4KPiA+ID4gSnVzdCB0byBiZSBzYWZlLCBJIGNhbiBtb3ZlIHRoZSBkZWZpbml0aW9uIHRv
IGFyY2gveDg2L2t2bS9tbXUvbW11LmMKPiA+ID4gYXMgYSBub24taW5saW5lIGZ1bmN0aW9uLgo+
ID4KPiA+IE5vIG5lZWQsIGFzbS9rdm1faG9zdC5oIF9tdXN0XyBiZSBpbmNsdWRlZCBiZWZvcmUg
dGhlIGRlY2xhcmF0aW9uLCBvdGhlcndpc2UgdGhlCj4gPiBkZWNsYXJhdGlvbiB3b3VsZG4ndCBi
ZSBtYWRlIGJlY2F1c2UgX19LVk1fSEFWRV9BUkNIX0ZMVVNIX1JFTU9URV9UTEJTIHdvdWxkbid0
Cj4gPiBiZSBkZWZpbmVkLiAgSS5lLiB3ZSB3b24ndCBydW4gaW50byBpc3N1ZXMgd2hlcmUgdGhl
IG5vbi1zdGF0aWMgZGVjbGFyYXRpb24gY29tZXMKPiA+IGJlZm9yZSB0aGUgc3RhdGljIGlubGlu
ZSBkZWZpbml0aW9uLgo+ID4KPiA+IEM5OSBleHBsaWNpdGx5IGNvdmVycyB0aGlzIGNhc2U6Cj4g
Pgo+ID4gICA2LjIuMiBMaW5rYWdlcyBvZiBpZGVudGlmaWVycwo+ID4KPiA+ICAgLi4uCj4gPgo+
ID4gICBJZiB0aGUgZGVjbGFyYXRpb24gb2YgYSBmaWxlIHNjb3BlIGlkZW50aWZpZXIgZm9yIGFu
IG9iamVjdCBvciBhIGZ1bmN0aW9uIGNvbnRhaW5zIHRoZSBzdG9yYWdlLQo+ID4gICBjbGFzcyBz
cGVjaWZpZXIgc3RhdGljLCB0aGUgaWRlbnRpZmllciBoYXMgaW50ZXJuYWwgbGlua2FnZS4KPiA+
Cj4gPiAgIEZvciBhbiBpZGVudGlmaWVyIGRlY2xhcmVkIHdpdGggdGhlIHN0b3JhZ2UtY2xhc3Mg
c3BlY2lmaWVyIGV4dGVybiBpbiBhIHNjb3BlIGluIHdoaWNoIGEKPiA+ICAgcHJpb3IgZGVjbGFy
YXRpb24gb2YgdGhhdCBpZGVudGlmaWVyIGlzIHZpc2libGUgaWYgdGhlIHByaW9yIGRlY2xhcmF0
aW9uIHNwZWNpZmllcyBpbnRlcm5hbCBvcgo+ID4gICBleHRlcm5hbCBsaW5rYWdlLCB0aGUgbGlu
a2FnZSBvZiB0aGUgaWRlbnRpZmllciBhdCB0aGUgbGF0ZXIgZGVjbGFyYXRpb24gaXMgdGhlIHNh
bWUgYXMgdGhlCj4gPiAgIGxpbmthZ2Ugc3BlY2lmaWVkIGF0IHRoZSBwcmlvciBkZWNsYXJhdGlv
bi4gSWYgbm8gcHJpb3IgZGVjbGFyYXRpb24gaXMgdmlzaWJsZSwgb3IgaWYgdGhlIHByaW9yCj4g
PiAgIGRlY2xhcmF0aW9uIHNwZWNpZmllcyBubyBsaW5rYWdlLCB0aGVuIHRoZSBpZGVudGlmaWVy
IGhhcyBleHRlcm5hbCBsaW5rYWdlLgo+ID4KPiA+IEluIHNob3J0LCBiZWNhdXNlIHRoZSAic3Rh
dGljIGlubGluZSIgZGVjbGFyZWQgaW50ZXJuYWwgbGlua2FnZSBmaXJzdCwgaXQgd2lucy4KPiBU
aGFua3MgZm9yIHNoYXJpbmcgdGhpcyEgSSBjYW4ga2VlcCB0aGUgJ3N0YXRpYyBpbmxpbmUnIGRl
ZmluaXRpb24gYXMKPiBpcyB0aGVuLiBIb3dldmVyLCBzaW5jZSBhIGxhdGVyIHBhdGNoIChwYXRj
aC0wNS8xNCkgZGVmaW5lcwo+IGt2bV9hcmNoX2ZsdXNoX3JlbW90ZV90bGJzX3JhbmdlKCkgaW4g
YXJjaC94ODYva3ZtL21tdS9tbXUuYywgZG8geW91Cj4gdGhpbmsgd2UgY2FuIG1vdmUgdGhpcyBk
ZWZpbml0aW9uIHRvIHRoZSAuYyBmaWxlIGFzIHdlbGwgZm9yCj4gY29uc2lzdGVuY3k/CgpXZSAi
Y2FuIiwgYnV0IEkgZG9uJ3Qgc2VlIGFueSByZWFzb24gdG8gZG8gc28uICBUcnlpbmcgdG8gbWFr
ZSBoZWxwZXJzIGNvbnNpc3RlbnRseQppbmxpbmUgb3Igbm90IGlzIHVzdWFsbHkgYSBmb29scyBl
cnJhbmQuICBBbmQgaW4gdGhpcyBjYXNlLCBJJ2QgYWN0dWFsbHkgcmF0aGVyIGdvCnRoZSBvcHBv
c2l0ZSBkaXJlY3Rpb24gYW5kIG1ha2UgdGhlIHJhbmdlIHZhcmlhbnQgYW4gaW5saW5lLgoKSGEh
ICBBbmQgSSBjYW4ganVzdGlmeSB0aGF0IHdpdGggbWluaW1hbCBlZmZvcnQuICBUaGUgYmVsb3cg
bWFrZXMgdGhlIGhlbHBlciBhCnN0cmFpZ2h0IHBhc3N0aHJvdWdoIGZvciBDT05GSUdfSFlQRVJW
PW4gYnVpbGRzLCBhdCB3aGljaCBwb2ludCBJIHRoaW5rIGl0IG1ha2VzCnNlbnNlIGZvciBpdCB0
byBiZSBpbmxpbmUuCgpJZiBpdCB3b24ndCBzbG93IHlvdXIgc2VyaWVzIGRvd24gZXZlbiBtb3Jl
LCBhbnkgb2JqZWN0aW9uIHRvIHNsaWRpbmcgdGhlIGJlbG93CnBhdGNoIGluIHNvbWV3aGVyZSBi
ZWZvcmUgcGF0Y2ggNT8gIEFuZCB0aGVuIGFkZCBhIHBhdGNoIHRvIGlubGluZSB0aGUgcmFuZ2Ut
YmFzZWQKaGVscGVyPwoKRGlzY2xhaW1lcjogY29tcGlsZSB0ZXN0ZWQgb25seS4KCi0tLQpGcm9t
OiBTZWFuIENocmlzdG9waGVyc29uIDxzZWFuamNAZ29vZ2xlLmNvbT4KRGF0ZTogVGh1LCAxMCBB
dWcgMjAyMyAxNTo1ODo1MyAtMDcwMApTdWJqZWN0OiBbUEFUQ0hdIEtWTTogeDg2L21tdTogRGVj
bGFyZSBmbHVzaF9yZW1vdGVfdGxic3tfcmFuZ2V9KCkgaG9va3MgaWZmCiBIWVBFUlYhPW4KCkRl
Y2xhcmUgdGhlIGt2bV94ODZfb3BzIGhvb2tzIHVzZWQgdG8gd2lyZSB1cCBwYXJhdmlydCBUTEIg
Zmx1c2hlcyB3aGVuCnJ1bm5pbmcgdW5kZXIgSHlwZXItViBpZiBhbmQgb25seSBpZiBDT05GSUdf
SFlQRVJWIT1uLiAgV3JhcHBpbmcgeWV0IG1vcmUKY29kZSB3aXRoIElTX0VOQUJMRUQoQ09ORklH
X0hZUEVSVikgZWxpbWluYXRlcyBhIGhhbmRmdWwgb2YgY29uZGl0aW9uYWwKYnJhbmNoZXMsIGFu
ZCBtYWtlcyBpdCBzdXBlciBvYnZpb3VzIHdoeSB0aGUgaG9va3MgKm1pZ2h0KiBiZSB2YWxpZC4K
ClNpZ25lZC1vZmYtYnk6IFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNlYW5qY0Bnb29nbGUuY29tPgot
LS0KIGFyY2gveDg2L2luY2x1ZGUvYXNtL2t2bS14ODYtb3BzLmggfCAyICsrCiBhcmNoL3g4Ni9p
bmNsdWRlL2FzbS9rdm1faG9zdC5oICAgIHwgNCArKysrCiBhcmNoL3g4Ni9rdm0vbW11L21tdS5j
ICAgICAgICAgICAgIHwgNiArKysrKysKIDMgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bS14ODYtb3BzLmggYi9hcmNo
L3g4Ni9pbmNsdWRlL2FzbS9rdm0teDg2LW9wcy5oCmluZGV4IDEzYmMyMTJjZDRiYy4uNmJjMWFi
MDYyN2I3IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm0teDg2LW9wcy5oCisr
KyBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bS14ODYtb3BzLmgKQEAgLTU0LDggKzU0LDEwIEBA
IEtWTV9YODZfT1Aoc2V0X3JmbGFncykKIEtWTV9YODZfT1AoZ2V0X2lmX2ZsYWcpCiBLVk1fWDg2
X09QKGZsdXNoX3RsYl9hbGwpCiBLVk1fWDg2X09QKGZsdXNoX3RsYl9jdXJyZW50KQorI2lmIElT
X0VOQUJMRUQoQ09ORklHX0hZUEVSVikKIEtWTV9YODZfT1BfT1BUSU9OQUwoZmx1c2hfcmVtb3Rl
X3RsYnMpCiBLVk1fWDg2X09QX09QVElPTkFMKGZsdXNoX3JlbW90ZV90bGJzX3JhbmdlKQorI2Vu
ZGlmCiBLVk1fWDg2X09QKGZsdXNoX3RsYl9ndmEpCiBLVk1fWDg2X09QKGZsdXNoX3RsYl9ndWVz
dCkKIEtWTV9YODZfT1AodmNwdV9wcmVfcnVuKQpkaWZmIC0tZ2l0IGEvYXJjaC94ODYvaW5jbHVk
ZS9hc20va3ZtX2hvc3QuaCBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgKaW5kZXgg
NjBkNDMwYjQ2NTBmLi4wNGZjODAxMTJkZmUgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2luY2x1ZGUv
YXNtL2t2bV9ob3N0LmgKKysrIGIvYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaApAQCAt
MTYwNCw5ICsxNjA0LDExIEBAIHN0cnVjdCBrdm1feDg2X29wcyB7CiAKIAl2b2lkICgqZmx1c2hf
dGxiX2FsbCkoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKIAl2b2lkICgqZmx1c2hfdGxiX2N1cnJl
bnQpKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7CisjaWYgSVNfRU5BQkxFRChDT05GSUdfSFlQRVJW
KQogCWludCAgKCpmbHVzaF9yZW1vdGVfdGxicykoc3RydWN0IGt2bSAqa3ZtKTsKIAlpbnQgICgq
Zmx1c2hfcmVtb3RlX3RsYnNfcmFuZ2UpKHN0cnVjdCBrdm0gKmt2bSwgZ2ZuX3QgZ2ZuLAogCQkJ
CQlnZm5fdCBucl9wYWdlcyk7CisjZW5kaWYKIAogCS8qCiAJICogRmx1c2ggYW55IFRMQiBlbnRy
aWVzIGFzc29jaWF0ZWQgd2l0aCB0aGUgZ2l2ZW4gR1ZBLgpAQCAtMTgxNCw2ICsxODE2LDcgQEAg
c3RhdGljIGlubGluZSBzdHJ1Y3Qga3ZtICprdm1fYXJjaF9hbGxvY192bSh2b2lkKQogI2RlZmlu
ZSBfX0tWTV9IQVZFX0FSQ0hfVk1fRlJFRQogdm9pZCBrdm1fYXJjaF9mcmVlX3ZtKHN0cnVjdCBr
dm0gKmt2bSk7CiAKKyNpZiBJU19FTkFCTEVEKENPTkZJR19IWVBFUlYpCiAjZGVmaW5lIF9fS1ZN
X0hBVkVfQVJDSF9GTFVTSF9SRU1PVEVfVExCCiBzdGF0aWMgaW5saW5lIGludCBrdm1fYXJjaF9m
bHVzaF9yZW1vdGVfdGxiKHN0cnVjdCBrdm0gKmt2bSkKIHsKQEAgLTE4MjMsNiArMTgyNiw3IEBA
IHN0YXRpYyBpbmxpbmUgaW50IGt2bV9hcmNoX2ZsdXNoX3JlbW90ZV90bGIoc3RydWN0IGt2bSAq
a3ZtKQogCWVsc2UKIAkJcmV0dXJuIC1FTk9UU1VQUDsKIH0KKyNlbmRpZgogCiAjZGVmaW5lIGt2
bV9hcmNoX3BtaV9pbl9ndWVzdCh2Y3B1KSBcCiAJKCh2Y3B1KSAmJiAodmNwdSktPmFyY2guaGFu
ZGxpbmdfaW50cl9mcm9tX2d1ZXN0KQpkaWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL21tdS9tbXUu
YyBiL2FyY2gveDg2L2t2bS9tbXUvbW11LmMKaW5kZXggOWU0Y2Q4YjRhMjAyLi4wMTg5ZGZlY2Nl
MWYgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2t2bS9tbXUvbW11LmMKKysrIGIvYXJjaC94ODYva3Zt
L21tdS9tbXUuYwpAQCAtMjcxLDE4ICsyNzEsMjQgQEAgc3RhdGljIGlubGluZSB1bnNpZ25lZCBs
b25nIGt2bV9tbXVfZ2V0X2d1ZXN0X3BnZChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCiAKIHN0YXRp
YyBpbmxpbmUgYm9vbCBrdm1fYXZhaWxhYmxlX2ZsdXNoX3JlbW90ZV90bGJzX3JhbmdlKHZvaWQp
CiB7CisjaWYgSVNfRU5BQkxFRChDT05GSUdfSFlQRVJWKQogCXJldHVybiBrdm1feDg2X29wcy5m
bHVzaF9yZW1vdGVfdGxic19yYW5nZTsKKyNlbHNlCisJcmV0dXJuIGZhbHNlOworI2VuZGlmCiB9
CiAKIHZvaWQga3ZtX2ZsdXNoX3JlbW90ZV90bGJzX3JhbmdlKHN0cnVjdCBrdm0gKmt2bSwgZ2Zu
X3Qgc3RhcnRfZ2ZuLAogCQkJCSBnZm5fdCBucl9wYWdlcykKIHsKKyNpZiBJU19FTkFCTEVEKENP
TkZJR19IWVBFUlYpCiAJaW50IHJldCA9IC1FT1BOT1RTVVBQOwogCiAJaWYgKGt2bV94ODZfb3Bz
LmZsdXNoX3JlbW90ZV90bGJzX3JhbmdlKQogCQlyZXQgPSBzdGF0aWNfY2FsbChrdm1feDg2X2Zs
dXNoX3JlbW90ZV90bGJzX3JhbmdlKShrdm0sIHN0YXJ0X2dmbiwKIAkJCQkJCQkJICAgbnJfcGFn
ZXMpOwogCWlmIChyZXQpCisjZW5kaWYKIAkJa3ZtX2ZsdXNoX3JlbW90ZV90bGJzKGt2bSk7CiB9
CiAKCmJhc2UtY29tbWl0OiBiYzllNjg4MjAyNzRjMDI1ODQwZDMwNTZkNjNmOTM4ZDc0Y2EzNWJi
Ci0tIAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
