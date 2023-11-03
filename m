Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13676C4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Nov 2023 23:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=JhFIubkG9XG4ktBwaC2rTkazO3AyA8G/XeGZ8kObHIY=; b=g4rCFmEWzGi1EhzH/1CwTxAzvM
	flWZDVsSu4B8lcXeAg/QSc9SLXd6ihNuqec38uHhUMNccat5vlh1cuWX+gObMfq6M8FrsSJL0I17B
	PoW2+iaqBsBET0atTJ+p1x03ikIiROKvqzHH401+Jhh7ztKz3Z53qXw3E+lp94/HQSJ2xJh2mKZv1
	RIugv5fpNhO6OswqzVbBS+42ui4LOf+vANm2aC11sdD94+4y8px1X4bGurHSs8ykWlZjETbdxLdca
	S8X9ZYhSQV1st11h/pi5vApaPnT1BGqUOVPvBXnreBOdNYcAO0aM1/iXOoLjxYL4Al3I83F4DOArS
	uYUTvULQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qz3Pv-00CJZq-1Q;
	Fri, 03 Nov 2023 23:17:31 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qz3Pr-00CJWo-1K
	for linux-riscv@lists.infradead.org;
	Fri, 03 Nov 2023 23:17:29 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5b053454aeeso36551547b3.0
        for <linux-riscv@lists.infradead.org>; Fri, 03 Nov 2023 16:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699053445; x=1699658245; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wL2niLMenc8rXWamhCVdrH1GL3hMVyvGfUspx7X4DS0=;
        b=Ssz8T6QcyjPr8ep15/HUUGpvhpNtLcmStQGDTcx8Qz1AABbfOrE/BrRD3XbUGptUfj
         tIeZtRtGlEIyDv8mjdyeqvg6auP7RyFMFt6I+n4CJoUaQoerse1MvOhTY7+MVLmdl/Kq
         eT7ul3T8hXFEMEgLLWWb2u3BtqYsGl4k1yO4974e4nH7dX3kvA3vrEr7Sn4x1CzHTDLM
         jcE83MgiAY/lsu8mR4ZwvQUoqVryQFsTlJZ1U0vKSIG0k+Bc1HtKakZtj/k38N2UZjRD
         YxwyoaznqGwyX84I5O8Slax/Z1X0Rx/G+ozmog3D8wYEAgtjOUI11MnP4bqZtYfC+gkk
         sM1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699053445; x=1699658245;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wL2niLMenc8rXWamhCVdrH1GL3hMVyvGfUspx7X4DS0=;
        b=RkNEKaKApiH/iroWde+7Lv4zv7WzgEIOd1x+VPVzsDPxenUb1s+AxRK2Zm7senI9Hq
         WebL26IWw0oU+MqCIl+fnb8t5SG8LT+SYFPjv1d3FCJ4OoVVDQpkOsjRFsUhzb2UfWLO
         ygTO2VQvfTqd5QBrQB1cgxqV18QMmFcJ2K0EQSUYX9ypo6CfX/wpNoUezcQqztKe/QEU
         tJmRA0vi5G150QBtMeXr5B+HfBRqjuQ8e+owTLGS4irzMjFagFuhSVDF6ZR0aZFXch/7
         Df1Ju2h5/iIJ4uSx8rf5Grb443EywcaiR5Xk6pU7eq5fGiMVRSiKFC7f1DwMMCxfeBqZ
         4cCw==
X-Gm-Message-State: AOJu0Yy88nM52opKqNykT/NHrmAKXAudZMtbyNL6jp1jZGHKCFHEQdGL
	jKpSqaLAfSjhxbGdpSmShaZEOHSHhWI=
X-Google-Smtp-Source: AGHT+IGJDyi83TwJx+I35GsLQytKZmA4RJCyClEGAPsqdhhOEgS+Lm1oHaoRVNSHVuwQA3+7WVp40Ul4xUY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:4958:0:b0:59f:3cde:b33a with SMTP id
 w85-20020a814958000000b0059f3cdeb33amr84737ywa.6.1699053444944; Fri, 03 Nov
 2023 16:17:24 -0700 (PDT)
Date: Fri, 3 Nov 2023 16:17:23 -0700
In-Reply-To: <CA+EHjTzGzXnfXHh0m5iHt9m3BxerkUS56EVPDA_az6n2FRnk3w@mail.gmail.com>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-17-seanjc@google.com>
 <CA+EHjTzj4drYKONVOLP19DYpJ4O8kSXcFzw2AKier1QdcFKx_Q@mail.gmail.com>
 <ZUF8A5KpwpA6IKUH@google.com> <CA+EHjTwTT9cFzYTtwT43nLJS01Sgt0NqzUgKAnfo2fiV3tEvXg@mail.gmail.com>
 <ZULJYg5cf1UrNq3e@google.com> <CA+EHjTzGzXnfXHh0m5iHt9m3BxerkUS56EVPDA_az6n2FRnk3w@mail.gmail.com>
Message-ID: <ZUV_g1_3pj62OgF-@google.com>
Subject: Re: [PATCH v13 16/35] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
From: Sean Christopherson <seanjc@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Xu Yilun <yilun.xu@intel.com>, Chao Peng <chao.p.peng@linux.intel.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Anish Moorthy <amoorthy@google.com>, 
	David Matlack <dmatlack@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, 
	"=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?=" <mic@digikod.net>, Vlastimil Babka <vbabka@suse.cz>, 
	Vishal Annapurve <vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Maciej Szmigiero <mail@maciej.szmigiero.name>, David Hildenbrand <david@redhat.com>, 
	Quentin Perret <qperret@google.com>, Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_161727_450456_9DC87F19 
X-CRM114-Status: GOOD (  15.55  )
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

T24gVGh1LCBOb3YgMDIsIDIwMjMsIEZ1YWQgVGFiYmEgd3JvdGU6Cj4gT24gV2VkLCBOb3YgMSwg
MjAyMyBhdCA5OjU14oCvUE0gU2VhbiBDaHJpc3RvcGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5jb20+
IHdyb3RlOgo+ID4gRS5nLiBhIG1pc2JlaGF2aW5nIHVzZXJzcGFjZSBjb3VsZCBwcmVtYXR1cmVs
eSBkZWxldGUgYSBtZW1zbG90LiAgQW5kIHRoZSBtb3JlCj4gPiBmdW4gZXhhbXBsZSBpcyBpbnRy
YWhvc3QgbWlncmF0aW9uLCB3aGVyZSB0aGUgcGxhbiBpcyB0byBhbGxvdyBwb2ludGluZyBtdWx0
aXBsZQo+ID4gZ3Vlc3RfbWVtZmQgZmlsZXMgYXQgYSBzaW5nbGUgZ3Vlc3RfbWVtZmQgaW5vZGU6
Cj4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvY292ZXIuMTY5MTQ0Njk0Ni5naXQuYWNr
ZXJsZXl0bmdAZ29vZ2xlLmNvbQo+ID4KPiA+IFRoZXJlIHdhcyBhIGxvdCBvZiBkaXNjdXNzaW9u
IGZvciB0aGlzLCBidXQgaXQncyBzY2F0dGVyZWQgYWxsIG92ZXIgdGhlIHBsYWNlLgo+ID4gVGhl
IFRMO0RSIGlzIGlzIHRoYXQgdGhlIGlub2RlIHdpbGwgcmVwcmVzZW50IHBoeXNpY2FsIG1lbW9y
eSwgYW5kIGEgZmlsZSB3aWxsCj4gPiByZXByZXNlbnQgYSBnaXZlbiAic3RydWN0IGt2bSIgaW5z
dGFuY2UncyB2aWV3IG9mIHRoYXQgbWVtb3J5LiAgQW5kIHNvIHRoZSBtZW1vcnkKPiA+IGlzbid0
IHJlY2xhaW1lZCB1bnRpbCB0aGUgaW5vZGUgaXMgdHJ1bmNhdGVkL3B1bmNoZWQuCj4gPgo+ID4g
SSBfdGhpbmtfIHRoaXMgcmVmbGVjdHMgdGhlIG1vc3QgcmVjZW50IHBsYW4gZnJvbSB0aGUgZ3Vl
c3RfbWVtZmQgc2lkZToKPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8xMjMzZDc0OTIx
MWMwOGQ1MWY5Y2E1ZDQyNzkzOGQ0N2YwMDhhZjFmLjE2ODk4OTM0MDMuZ2l0LmlzYWt1LnlhbWFo
YXRhQGludGVsLmNvbQoKRG9oLCBzaXR0aW5nIGluIG15IFRPRE8gZm9sZGVyLi4uCgpodHRwczov
L2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMzEwMTYxMTUwMjguOTk2NjU2LTEtbWljaGFlbC5yb3Ro
QGFtZC5jb20KCj4gVGhhbmtzIGZvciBwb2ludGluZyB0aGF0IG91dC4gSSB0aGluayB0aGlzIG1p
Z2h0IGJlIHRoZSB3YXkgdG8gZ28uCj4gSSdsbCBoYXZlIGEgY2xvc2VyIGxvb2sgYXQgdGhpcyBh
bmQgc2VlIGhvdyB0byBnZXQgaXQgdG8gd29yayB3aXRoCj4gcEtWTS4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
