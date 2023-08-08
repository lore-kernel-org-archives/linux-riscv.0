Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90E05C001B0
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 16:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KXFTiXOPL6oPcMf5b/V9Bm/qL8gT5mTBMcSmLd8muaA=; b=uQwua4v8yRwXcceHg08vX4Czro
	p5WM2ECt8JL/1iMiKV/EXnc/WbWeayl72s3Gh8TWe2XZtKvyiqvpLS1bOTIGQYJ4RRunuZZfkyjJr
	SiAcP4wth/Y75xVdrjeZo0ruyCuVj7UX13Sk8w8dgpuSLdFgu9A3E7JrQaT58k7hJ53Nk851K7Fsc
	Gzz9t7DpxapOwE2pEshZDEHp/Sab3XD3Thx6uMAJoeEiUGvpi2FbfRLN4fcfruMCKahxxst9pggBk
	cvw/ybWuu3NX4mUaoADry6JwUYjm26i2dbu5BAxKnV7KxgZpqP+YWpICUyN14JpkPpm10JntsUfmm
	6HHE/+uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTPnZ-0030XC-1s;
	Tue, 08 Aug 2023 16:43:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTPnW-0030WU-0N;
	Tue, 08 Aug 2023 16:43:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 668DF62503;
	Tue,  8 Aug 2023 16:43:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C06C2C433C8;
	Tue,  8 Aug 2023 16:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691512984;
	bh=qn/5n73aPx19R3sftb3hyCv0xP0bVP4jPYkwssW5D70=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=EI/M+9L9WfV7CfX9Gg3l8wginZaWaHFChW2GM/OsGfB64YDDzgU8NJsfkDrHXAvR5
	 VAaNmxsPoqAHDEiP8QulOu4i3ulD9YXkGKshknFhvU2u/SxvikGwp/YsrNUGVLkPw1
	 FTzl+keanf3MdzsjLZoGYa7oT0z7q0DKG1X4hSjicnx40hnIFKQ1T80kw3emqiyqrU
	 qSJHtLdCG2fha5vwJPzSzfRqjDfWoP2oD1r97l9SogvHJSiPgP8wzPENILebk1zzmj
	 2zFUZQP4wQ/G7opUpEJ2KrCWciEWKfgvHzrrOBU53m0/AjNq+SZusg16vaM6+4MQNT
	 uUWZZf7j9O3Ag==
Received: from disco-boy.misterjones.org ([217.182.43.188] helo=www.loen.fr)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1qTPnS-003BwZ-B2;
	Tue, 08 Aug 2023 17:43:02 +0100
MIME-Version: 1.0
Date: Tue, 08 Aug 2023 17:43:02 +0100
From: Marc Zyngier <maz@kernel.org>
To: Raghavendra Rao Ananta <rananta@google.com>
Cc: Sean Christopherson <seanjc@google.com>, Oliver Upton
 <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, Suzuki K
 Poulose <suzuki.poulose@arm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, Anup
 Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, Jing Zhang
 <jingzhangos@google.com>, Reiji Watanabe <reijiw@google.com>, Colton Lewis
 <coltonlewis@google.com>, David Matlack <dmatlack@google.com>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-mips@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org
Subject: Re: [PATCH v7 02/12] KVM: arm64: Use kvm_arch_flush_remote_tlbs()
In-Reply-To: <CAJHc60yiGnVc=ysdOaNemWaDpTBSk02mRLenK3sN2XtN_Cp98g@mail.gmail.com>
References: <20230722022251.3446223-1-rananta@google.com>
 <20230722022251.3446223-3-rananta@google.com> <87tttpr6qy.wl-maz@kernel.org>
 <ZMgsjx8dwKd4xBGe@google.com> <877cqdqw12.wl-maz@kernel.org>
 <CAJHc60xAUVt5fbhEkOqeC-VF8SWVOt3si=1yxVVAUW=+Hu_wNg@mail.gmail.com>
 <CAJHc60zN-dc2E-fS7fuXgkrfGD9bqW6tMy2GRZxbHOeZv0ZOBw@mail.gmail.com>
 <ZNJaPxTtPRCv0HOl@google.com>
 <CAJHc60yiGnVc=ysdOaNemWaDpTBSk02mRLenK3sN2XtN_Cp98g@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <fc430350dd7d8ac664054a99f1e452c1@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 217.182.43.188
X-SA-Exim-Rcpt-To: rananta@google.com, seanjc@google.com, oliver.upton@linux.dev, james.morse@arm.com, suzuki.poulose@arm.com, pbonzini@redhat.com, chenhuacai@kernel.org, yuzenghui@huawei.com, anup@brainfault.org, atishp@atishpatra.org, jingzhangos@google.com, reijiw@google.com, coltonlewis@google.com, dmatlack@google.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_094306_239283_B355B3C7 
X-CRM114-Status: GOOD (  20.74  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMjAyMy0wOC0wOCAxNzoxOSwgUmFnaGF2ZW5kcmEgUmFvIEFuYW50YSB3cm90ZToKPiBPbiBU
dWUsIEF1ZyA4LCAyMDIzIGF0IDg6MDfigK9BTSBTZWFuIENocmlzdG9waGVyc29uIDxzZWFuamNA
Z29vZ2xlLmNvbT4gCj4gd3JvdGU6Cj4+IAo+PiBPbiBGcmksIEF1ZyAwNCwgMjAyMywgUmFnaGF2
ZW5kcmEgUmFvIEFuYW50YSB3cm90ZToKPj4gPiBPbiBXZWQsIEF1ZyAyLCAyMDIzIGF0IDQ6Mjji
gK9QTSBSYWdoYXZlbmRyYSBSYW8gQW5hbnRhCj4+ID4gPHJhbmFudGFAZ29vZ2xlLmNvbT4gd3Jv
dGU6Cj4+ID4gPgo+PiA+ID4gU3VyZSwgSSdsbCBjaGFuZ2UgaXQgdG8ga3ZtX2FyY2hfZmx1c2hf
dm1fdGxicygpIGluIHY4Lgo+PiA+ID4KPj4gPiBXaGlsZSB3b3JraW5nIG9uIHRoZSByZW5hbWlu
ZywgSSByZWFsaXplZCB0aGF0IHNpbmNlIHRoaXMgZnVuY3Rpb24gaXMKPj4gPiBjYWxsZWQgZnJv
bSBrdm1fbWFpbi5jJ3Mga3ZtX2ZsdXNoX3JlbW90ZV90bGJzKCkuIERvIHdlIHdhbnQgdG8gcmVu
YW1lCj4+ID4gdGhpcyBhbmQgdGhlIG90aGVyIGt2bV9mbHVzaF8qKCkgZnVuY3Rpb25zIHRoYXQg
dGhlIHNlcmllcyBpbnRyb2R1Y2VzCj4+ID4gdG8gbWF0Y2ggdGhlaXIga3ZtX2FyY2hfZmx1c2hf
KigpIGNvdW50ZXJwYXJ0cz8KPj4gCj4+IEhtbSwgaWYgd2UncmUgZ29pbmcgdG8gcmVuYW1lIG9u
ZSBhcmNoIGhvb2ssIHRoZW4geWVzLCBJIHRoaW5rIGl0IAo+PiBtYWtlcyBzZW5zZSB0bwo+PiBy
ZW5hbWUgYWxsIHRoZSBjb21tb24gQVBJcyBhbmQgYXJjaCBob29rcyB0byBtYXRjaC4KPj4gCj4+
IEhvd2V2ZXIsIHg4NiBpcyByaWZlIHdpdGggdGhlICJyZW1vdGVfdGxicyIgbm9tZW5jbGF0dXJl
LCBhbmQgcmVuYW1pbmcgCj4+IHRoZSBjb21tb24KPj4gQVBJcyB3aWxsIGp1c3QgcHVzaCB0aGUg
aW5jb25zaXN0ZW5jaWVzIGludG8geDg2LiAgV2hpbGUgSSAxMDAlIGFncmVlIAo+PiB0aGF0IHRo
ZQo+PiBjdXJyZW50IG5hbWluZyBpcyBmbGF3ZWQsIEkgYW0gbm90IHdpbGxpbmcgdG8gZW5kIHVw
IHdpdGggeDg2IGJlaW5nIAo+PiBwYXJ0aWFsbHkKPj4gY29udmVydGVkLgo+PiAKPj4gSSB0aGlu
ayBJJ20gb2sgcmVuYW1pbmcgYWxsIG9mIHg4NidzIG1hbnkgaG9va3M/ICBCdXQgSSdkIGRlZmlu
aXRlbHkgCj4+IHdhbnQgaW5wdXQKPj4gZnJvbSBtb3JlIHg4NiBmb2xrcywgYW5kIHRoZSBzaXpl
IGFuZCBzY29wZSBvZiB0aGlzIHNlcmllcyB3b3VsZCAKPj4gZXhwbG9kZS4gIFVubGVzcwo+PiBN
YXJjIG9iamVjdHMgYW5kL29yIGhhcyBhIGJldHRlciBpZGVhLCB0aGUgbGVhc3QgYXdmdWwgb3B0
aW9uIGlzIAo+PiBwcm9iYWJseSB0byBpZ25vcmUKPj4gdGhlIHBvb3IgInJlbW90ZV90bGJzIiBu
YW1pbmcgYW5kIHRhY2tsZSBpdCBpbiBhIHNlcGFyYXRlIHNlcmllcy4KPj4gCj4gU3VyZSwgSSB0
aGluayBpdCdzIGJldHRlciB0byBkbyBpdCBpbiBhIHNlcGFyYXRlIHNlcmllcyBhcyB3ZWxsLiBJ
J20KPiBoYXBweSB0byBjYXJyeSBvdXQgdGhlIHRhc2sgYWZ0ZXIgdGhpcyBvbmUgZ2V0cyBtZXJn
ZWQuIEJ1dCwgbGV0J3MKPiB3YWl0IGZvciBNYXJjIGFuZCBvdGhlcnMnIG9waW5pb24gb24gdGhl
IG1hdHRlci4KClllYWgsIGxldCdzIHB1bnQgdGhhdCB0byBhIHNlcGFyYXRlIHNlcmllcy4gSSdt
IG1vcmUgaW50ZXJlc3RlZCBpbgpnZXR0aW5nIHRoaXMgY29kZSBtZXJnZWQgdGhhbiBpbiB0aGUg
aW5ldml0YWJsZSBiaWtlLXNoZWRkaW5nIHRoYXQKd2lsbCByZXN1bHQgZnJvbSBzdWNoIGEgcHJv
cG9zYWwuCgpSYWdoYXZlbmRyYSwgYW55IGNoYW5jZSB5b3UgY291bGQgcmVzcGluIHRoZSBzZXJp
ZXMgdGhpcyB3ZWVrPwpJJ2QgcmVhbGx5IGxpa2UgaXQgdG8gc3BlbmQgc29tZSBxdWFsaXR5IHRp
bWUgaW4gLW5leHQuLi4KClRoYW5rcywKCiAgICAgICAgIE0uCi0tIApKYXp6IGlzIG5vdCBkZWFk
LiBJdCBqdXN0IHNtZWxscyBmdW5ueS4uLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
