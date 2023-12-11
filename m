Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7393AC4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 19:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/iBS4wjzB9pKeDDvD5ldXwSp2e3UCs9nCrmN+Qal4O4=; b=yLRtbeHbJjVHXD
	w4J0YYn5CPuyEQZ94ViSZm4fggcxmme0TAlcqT5ftgBzUZkBrF7bHCaB/wAxjzsLosZ4tjhTDX85R
	HgirbLmoHDgKjTZt8prJt34u1mMs0Hd4EF+apOcop9EQCMppqYmgOtUZhdneb2ZLuqvuvMHZd1qng
	ElBoFznP5y8Tfc4gYa/bElKUN3BSNUb3nhjk06VIL8S9P/7S43byNVGZWmr71ulafYa5LQ5i8dItQ
	+D6Twxn/P37GzMYj3BwPGM2Y+TAIKHfDQ2/UGRbt2zEwFg/eTDzoZ1D7sz918hLLvPk5qbQZv21oc
	QZrnE87gPk7VFkZTWEAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCmKl-007jzD-1P;
	Mon, 11 Dec 2023 19:52:55 +0000
Received: from mail-ot1-f42.google.com ([209.85.210.42])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCmKh-007juR-0P;
	Mon, 11 Dec 2023 19:52:52 +0000
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6d9f4682c7bso404559a34.1;
        Mon, 11 Dec 2023 11:52:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702324368; x=1702929168;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=shxc1fqYRYQGn0MQr4gOJAnY5PC0ECh8gGcd5gbYepM=;
        b=Sld6oazJfg4BRy7TEzj7kmo/cc5Ll/tIeInxSJWvkB8IY0B5CD7PrQFAK/8hkyTLvA
         A43Wa/XE2k3/5ROVdYUKwN1mJPrwMwp5UWymkV/Y7u8Me3vgmX+xwYASkQW5TXAuoNpk
         mRI4Rf50SdHoT0fE6sDMDFaHEo9FEJDkY0UUNpQdbb7HnDU7cET4gUR1fNdRZCH2WCtB
         pfAqJjjhB/+qd9gCkdam4gGbUssqVVm3wyfXQmzTHrMsPdbxzrtzEd0T4lUCpTSjlJn5
         YajSgepnRmqbzqbOY218ru4CkUqQuX0kFCrQWbjMWYk7XerVujp9tz0gsxSxHRez1oiG
         n6Dg==
X-Gm-Message-State: AOJu0Yw2gNwdR7ZcirR11/denBxRwp1yNCGO7DNg/9w/7PN8+VQ+J9Sh
	d5d68RXxua7m89CGAWIRpb3N/oOFIoaxS6nq6Yo=
X-Google-Smtp-Source: AGHT+IGjJ9dqMdEvqbPS4C+aNBObN65m/Uv+AIgbHvjx5d2sI4uQBJx39nF2HMC2W+Wq43gY2UcNwwiDLRyn45Z6BNI=
X-Received: by 2002:a05:6820:2a18:b0:590:9027:7ab0 with SMTP id
 dr24-20020a0568202a1800b0059090277ab0mr7447038oob.0.1702324368365; Mon, 11
 Dec 2023 11:52:48 -0800 (PST)
MIME-Version: 1.0
References: <20231211104855.558096-1-vincent.guittot@linaro.org>
In-Reply-To: <20231211104855.558096-1-vincent.guittot@linaro.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 11 Dec 2023 20:52:37 +0100
Message-ID: <CAJZ5v0i37gGqt=oGC4BxJ4hT5pxhAdL7dPxGf7w3D8THqwAOwQ@mail.gmail.com>
Subject: Re: [PATCH v7 0/7] consolidate and cleanup CPU capacity
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	sudeep.holla@arm.com, gregkh@linuxfoundation.org, rafael@kernel.org, 
	mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, bristot@redhat.com, vschneid@redhat.com, 
	viresh.kumar@linaro.org, lenb@kernel.org, robert.moore@intel.com, 
	lukasz.luba@arm.com, ionela.voinescu@arm.com, pierre.gondois@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-acpi@vger.kernel.org, conor.dooley@microchip.com, suagrfillet@gmail.com, 
	ajones@ventanamicro.com, lftan@kernel.org, beata.michalska@arm.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_115251_187082_B0C81B3E 
X-CRM114-Status: GOOD (  25.80  )
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

T24gTW9uLCBEZWMgMTEsIDIwMjMgYXQgMTE6NDnigK9BTSBWaW5jZW50IEd1aXR0b3QKPHZpbmNl
bnQuZ3VpdHRvdEBsaW5hcm8ub3JnPiB3cm90ZToKPgo+IFRoaXMgaXMgdGhlIDFzdCBwYXJ0IG9m
IGNvbnNvbGlkYXRpbmcgaG93IHRoZSBtYXggY29tcHV0ZSBjYXBhY2l0eSBpcwo+IHVzZWQgaW4g
dGhlIHNjaGVkdWxlciBhbmQgaG93IHdlIGNhbGN1bGF0ZSB0aGUgZnJlcXVlbmN5IGZvciBhIGxl
dmVsIG9mCj4gdXRpbGl6YXRpb24uCj4KPiBGaXggc29tZSB1bmNvbnNpc3RhbmN5IHdoZW4gY29t
cHV0aW5nIGZyZXF1ZW5jeSBmb3IgYW4gdXRpbGl6YXRpb24uIFRoZXJlCj4gY2FuIGJlIGEgbWlz
bWF0Y2ggYmV0d2VlbiBlbmVyZ3kgbW9kZWwgYW5kIHNjaGVkdXRpbC4KPgo+IE5leHQgc3RlcCB3
aWxsIGJlIHRvIG1ha2UgYSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9yaWdpbmFsCj4gbWF4IGNv
bXB1dGUgY2FwYWNpdHkgb2YgYSBDUFUgYW5kIHdoYXQgaXMgY3VycmVudGx5IGF2YWlsYWJsZSB3
aGVuCj4gdGhlcmUgaXMgYSBjYXBwaW5nIGFwcGx5aW5nIGZvcmV2ZXIgKGkuZS4gc2Vjb25kcyBv
ciBtb3JlKS4KPgo+IENoYW5nZXMgc2luY2UgdjY6Cj4gLSBSZWJhc2Ugb24gdGlwL3NjaGVkL2Nv
cmUgYW5kIGZpeCBhIGNvbmZsaWN0Cj4gLSBBZGQgdGFncwo+Cj4gQ2hhbmdlcyBzaW5jZSB2NToK
PiAtIFJlbW92ZSB1c2VsZXNzIHJldHVybiBpbiBmcmVxX2ludl9zZXRfbWF4X3JhdGlvKCkKPiAt
IEFkZCB0YWdzCj4KPiBDaGFuZ2VzIHNpbmNlIHY0Ogo+IC0gQ2FwaXRhbGl6ZSB0aGUgdmVyYiBp
biBzdWJqZWN0Cj4gLSBSZW1vdmUgdXNsZXNzIHBhcmVudGhlc2VzIGluIGNwcGNfZ2V0X2RtaV9t
YXhfa2h6KCkKPiAtIFVzZSBmcmVxX3JlZiBwYXR0ZXJuIGV2ZXJ5d2hlcmUKPiAtIEZpeCBNSHog
LyBrSHogdW5pdHMgY29udmVyc2lvbiBmb3IgY3BwY19jcHVmcmVxCj4gLSBNb3ZlIGRlZmF1bHQg
ZGVmaW5pdGlvbiBvZiBhcmNoX3NjYWxlX2ZyZXFfcmVmKCkgaW4KPiAgIGluY2x1ZGUvbGludXgv
c2NoZWQvdG9wb2xvZ3kuaCBiZXNpZGUgYXJjaF9zY2FsZV9jcHVfY2FwYWNpdHkKPiAgIHdoaWNo
IGZhY2VzIHNpbWlsYXIgZGVmYXVsdCBkZWNsYXJhdGlvbiBiZWhhdmlvci4gVGhpcyBsb2NhdGlv
biBjb3ZlcnMKPiAgIGFsbCBjYXNlcyB3aXRoIGFyY2ggYW5kIENPTkZJR18qIHdoaWNoIHdhcyBu
b3QgdGhlIGNhc2Ugd2l0aCBwcmV2aW91cwo+ICAgYXR0ZW1wdHMuCj4KPiBDaGFuZ2VzIHNpbmNl
IHYzOgo+IC0gU3BsaXQgcGF0Y2ggNSBjcHVmcmVxL2NwcGMKPiAtIEZpeCB0b3BvbG9neV9pbml0
X2NwdV9jYXBhY2l0eV9jcHBjKCkKPiAtIEZpeCBpbml0IGlmIEFNVSByYXRpbwo+IC0gQWRkZWQg
c29tZSB0YWdzCj4KPiBDaGFuZ2VzIHNpbmNlIHYyOgo+IC0gUmVtb3ZlIHRoZSAxc3QgcGF0Y2gg
d2hpY2ggaGFzIGJlZW4gcXVldWVkIGluIHRpcAo+IC0gUmV3b3JrIGhvdyB0byBpbml0aWFsaXpl
IHRoZSByZWZlcmVuY2UgZnJlcXVlbmN5IGZvciBjcHBjX2NwdWZyZXEgYW5kCj4gICBjaGFuZ2Ug
dG9wb2xvZ3lfaW5pdF9jcHVfY2FwYWNpdHlfY3BwYygpIHRvIGFsc28gc2V0IGNhcGFjaXR5X3Jl
Zl9mcmVxCj4gLSBBZGQgYSBSRkMgdG8gY29udmVydCBBTVUgdG8gdXNlIGFyY2hfc2NhbGVfZnJl
cV9yZWYgYW5kIG1vdmUgdGhlIGNvbmZpZwo+ICAgb2YgdGhlIEFNVSByYXRpbyB0byBiZSBkb25l
IHdoZW4gaW50aWFsaXppbmcgY3B1IGNhcGFjaXR5IGFuZAo+ICAgY2FwYWNpdHlfcmVmX2ZyZXEK
PiAtIEFkZGVkIHNvbWUgdGFncwo+Cj4gQ2hhbmdlcyBzaW5jZSB2MToKPiAtIEZpeCB0eXBvcwo+
IC0gQWRkZWQgY2hhbmdlcyBpbiBjcHVmcmVxIHRvIHVzZSBhcmNoX3NjYWxlX2ZyZXFfcmVmKCkg
d2hlbiBjYWxsaW5nCj4gICBhcmNoX3NldF9mcmVxX3NjYWxlIChwYXRjaCAzKS4KPiAtIGFyY2hf
c2NhbGVfZnJlcV9yZWYoKSBpcyBhbHdheXMgZGVmaW5lZCBhbmQgcmV0dXJucyAwIChhcyBwcm9w
b3NlZAo+ICAgYnkgSW9uZWxhKSB3aGVuIG5vdCBkZWZpbmVkIGJ5IHRoZSBhcmNoLiBUaGlzIHNp
bXBsaWZpZXMgdGhlIGNvZGUgd2l0aAo+ICAgdGhlIGFkZGl0aW9uIG9mIHBhdGNoIDMuCj4gLSBT
aW1wbGlmeSBFbmVyZ3kgTW9kZWwgd2hpY2ggYWx3YXlzIHVzZXMgYXJjaF9zY2FsZV9mcmVxX3Jl
ZigpLiBUaGUKPiAgIGxhdHRlciByZXR1cm5zIDAgd2hlbiBub3QgZGVmaW5lZCBieSBhcmNoIGlu
c3RlYWQgb2YgbGFzdCBpdGVtIG9mIHRoZQo+ICAgcGVyZiBkb21haW4uIFRoaXMgaXMgbm90IGEg
cHJvYmxlbSBiZWNhdXNlIHRoZSBmdW5jdGlvbiBpcyBvbmx5IGRlZmluZWQKPiAgIGZvciBjb21w
aWxhdGlvbiBwdXJwb3NlIGluIHRoaXMgY2FzZSBhbmQgd2UgZG9uJ3QgY2FyZSBhYm91dCB0aGUK
PiAgIHJldHVybmVkIHZhbHVlLiAocGF0Y2ggNSkKPiAtIEFkZGVkIGNoYW5nZXMgaW4gY3BwYyBj
cHVmcmVxIHRvIHNldCBjYXBhY2l0eV9yZWZfZnJlcSAocGF0Y2ggNikKPiAtIEFkZGVkIHJldmll
d2VkIHRhZyBmb3IgcGF0Y2ggMSB3aGljaCBnb3QgYSBtaW5vciBjaGFuZ2UgYnV0IG5vdCBmb3IK
PiAgIG90aGVycyBhcyBJIGRpZCBzb21lIGNoYW5nZXMgd2hpY2ggY291bGQgbWFrZSBwcmV2aW91
cyByZXZpZXdlZCB0YWcKPiAgIG5vIG1vcmUgcmVsZXZhbnQuCj4KPiBWaW5jZW50IEd1aXR0b3Qg
KDcpOgo+ICAgdG9wb2xvZ3k6IEFkZCBhIG5ldyBhcmNoX3NjYWxlX2ZyZXFfcmVmZXJlbmNlCj4g
ICBjcHVmcmVxOiBVc2UgdGhlIGZpeGVkIGFuZCBjb2hlcmVudCBmcmVxdWVuY3kgZm9yIHNjYWxp
bmcgY2FwYWNpdHkKPiAgIGNwdWZyZXEvc2NoZWR1dGlsOiBVc2UgYSBmaXhlZCByZWZlcmVuY2Ug
ZnJlcXVlbmN5Cj4gICBlbmVyZ3lfbW9kZWw6IFVzZSBhIGZpeGVkIHJlZmVyZW5jZSBmcmVxdWVu
Y3kKPiAgIGNwdWZyZXEvY3BwYzogTW92ZSBhbmQgcmVuYW1lIGNwcGNfY3B1ZnJlcV97cGVyZl90
b19raHp8a2h6X3RvX3BlcmZ9Cj4gICBjcHVmcmVxL2NwcGM6IFNldCB0aGUgZnJlcXVlbmN5IHVz
ZWQgZm9yIGNvbXB1dGluZyB0aGUgY2FwYWNpdHkKPiAgIGFybTY0L2FtdTogVXNlIGNhcGFjaXR5
X3JlZl9mcmVxIHRvIHNldCBBTVUgcmF0aW8KClRoaXMgc2VyaWVzIHRvdWNoZXMgbXVsdGlwbGUg
cGxhY2VzLCBidXQgbW9zdGx5IHNjaGVkdXRpbCwgY3B1ZnJlcSBhbmQKdGhlIEVNLCBzbyBwbGVh
c2UgbGV0IG1lIGtub3cgaWYgeW91IHdhbnQgbWUgdG8gcGljayBpdCB1cC4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
