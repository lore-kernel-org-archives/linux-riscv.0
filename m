Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97155C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Nov 2021 12:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=70BmQ1FOSmEMe+NlJJ1FGuqGA/1R7n282ilkA1k1GIU=; b=Mvje++FaxqQ2vCM1iQIkzQcGJF
	dlAbRfVqlGye7PNm/j+ibwv38VJSACkq1nVcaTEH4igi82OYiQzgtIgFZJf9gjdouV8HExVAapXIX
	YQ2iMN5dTSq/QxQwgtgGaZk2z32Va0YqJfbFFtotFXBnsHa/kVw927dl07LEuvZBIJpXFSwP00VA/
	CISDQ0hx7lP85vHRivC6ZAjp5KRzcHBHCJYsEylKnV/MM82g7UKV3Fhj+FWqGPmmNZ88oJSHoyZ7Z
	dIzZi1kV2Ic4qTvpex9Inlzr54MljfJuF0laHj/OXDmD17NUze6kdWiA1Ph1m4XOpZfC0/6nQCarA
	0ZjecYhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ms1sm-0050D2-Er; Tue, 30 Nov 2021 12:05:12 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ms1sU-00507r-64; Tue, 30 Nov 2021 12:04:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B946BB8188B;
 Tue, 30 Nov 2021 12:04:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66BB0C53FC7;
 Tue, 30 Nov 2021 12:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638273891;
 bh=XZV+A03r+U14NNevxoQ+VNb6roKLqHnitP/KB5VE1bU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZlVLLcdQtjmMpvoqZ3crREGG4Tx9/cX7mlIGiOZd6h9BzUwUxvGRirVIKaUOaxjYT
 j5gtsnHmy3Pom8gpoKBLdTa9+zq0ksimfkkU+GFV8UpMhBa78nezSi2q5jNEQwAhWJ
 xq4G0RHYn2hCaCVVjpP6TiYxrQmuhlZ9TN3UAYwPmlw/EHu8tPf53sycoGgXFr8+3e
 p50fi7NH3GxciImqpxsMc5nV7QmRHXLcBYfxtqsN348RGG9ktb9N6rfUlFESziCNeM
 iyjgvu0+fxThDkF7ypznoZv3ZG7ohR4/74jaqNLB+4LCg4pB1MEHTAlZtTjNGF/jPM
 yrr//SJISMS0w==
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <maz@kernel.org>)
 id 1ms1sP-008rkT-FI; Tue, 30 Nov 2021 12:04:49 +0000
MIME-Version: 1.0
Date: Tue, 30 Nov 2021 12:04:49 +0000
From: Marc Zyngier <maz@kernel.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Sean Christopherson <seanjc@google.com>, Huacai Chen
 <chenhuacai@kernel.org>, Aleksandar Markovic
 <aleksandar.qemu.devel@gmail.com>, Paul Mackerras <paulus@ozlabs.org>, Anup
 Patel <anup.patel@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian
 Borntraeger <borntraeger@de.ibm.com>, Janosch Frank <frankja@linux.ibm.com>,
 James Morse <james.morse@arm.com>, Alexandru Elisei
 <alexandru.elisei@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Atish
 Patra <atish.patra@wdc.com>, David Hildenbrand <david@redhat.com>, Cornelia
 Huck <cohuck@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Vitaly
 Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, Jim
 Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
 linux-mips@vger.kernel.org, kvm@vger.kernel.org, kvm-ppc@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>, Oliver
 Upton <oupton@google.com>, Jing Zhang <jingzhangos@google.com>
Subject: Re: [PATCH v2 10/43] KVM: arm64: Move vGIC v4 handling for WFI out
 arch callback hook
In-Reply-To: <3490c50e-50d2-f906-3383-b87e14b14fab@redhat.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-11-seanjc@google.com>
 <9236e715-c471-e1c8-6117-6f37b908a6bd@redhat.com>
 <875ytjbxpq.wl-maz@kernel.org>
 <be1cf8c7-ed87-b8eb-1bca-0a6c7505d7f8@redhat.com>
 <3490c50e-50d2-f906-3383-b87e14b14fab@redhat.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <4826a7e2dbecc5d57323d18d725d6d69@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: pbonzini@redhat.com, seanjc@google.com,
 chenhuacai@kernel.org, aleksandar.qemu.devel@gmail.com, paulus@ozlabs.org,
 anup.patel@wdc.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, borntraeger@de.ibm.com, frankja@linux.ibm.com,
 james.morse@arm.com, alexandru.elisei@arm.com, suzuki.poulose@arm.com,
 atish.patra@wdc.com, david@redhat.com, cohuck@redhat.com,
 imbrenda@linux.ibm.com, vkuznets@redhat.com, wanpengli@tencent.com,
 jmattson@google.com, joro@8bytes.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org, kvm@vger.kernel.org,
 kvm-ppc@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 dmatlack@google.com, oupton@google.com, jingzhangos@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_040454_531799_9F614D3B 
X-CRM114-Status: GOOD (  15.63  )
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

T24gMjAyMS0xMS0zMCAxMTozOSwgUGFvbG8gQm9uemluaSB3cm90ZToKPiBPbiAxMC8yNi8yMSAx
ODoxMiwgUGFvbG8gQm9uemluaSB3cm90ZToKPj4gT24gMjYvMTAvMjEgMTc6NDEsIE1hcmMgWnlu
Z2llciB3cm90ZToKPj4+PiBUaGlzIG5lZWRzIGEgd29yZCBvbiB3aHkga3ZtX3BzY2lfdmNwdV9z
dXNwZW5kIGRvZXMgbm90IG5lZWQgdGhlCj4+Pj4gaG9va3MuwqAgT3IgaXQgbmVlZHMgdG8gYmUg
Y2hhbmdlZCB0byBhbHNvIHVzZSBrdm1fdmNwdV93ZmkgaW4gdGhlIAo+Pj4+IFBTQ0kKPj4+PiBj
b2RlLCBJIGRvbid0IGtub3cuCj4+Pj4gCj4+Pj4gTWFyYywgY2FuIHlvdSByZXZpZXcgYW5kL29y
IGFkdmlzZT8KPj4+IEkgd2FzIGxvb2tpbmcgYXQgdGhhdCBvdmVyIHRoZSB3ZWVrZW5kLCBhbmQg
dGhhdCdzIGEgcHJlLWV4aXN0aW5nCj4+PiBidWcuIEkgd291bGQgaGF2ZSBhZGRyZXNzZWQgaXQg
aW5kZXBlbmRlbnRseSwgYnV0IGl0IGxvb2tzIGxpa2UgeW91Cj4+PiBhbHJlYWR5IGhhdmUgcXVl
dWVkIHRoZSBwYXRjaC4KPj4gCj4+IEkgaGF2ZSAicXVldWVkIiBpdCwgYnV0IHRoYXQncyBqdXN0
IG15IHF1ZXVlIC0gaXQncyBub3Qgb24ga2VybmVsLm9yZyAKPj4gYW5kIGl0J3Mgbm90IGdvaW5n
IHRvIGJlIGluIDUuMTYsIGF0IGxlYXN0IG5vdCBpbiB0aGUgZmlyc3QgYmF0Y2guCj4+IAo+PiBU
aGVyZSdzIHBsZW50eSBvZiB0aW1lIGZvciBtZSB0byByZWJhc2Ugb24gdG9wIG9mIGEgZml4LCBp
ZiB5b3Ugd2FudCAKPj4gdG8gc2VuZCB0aGUgZml4IHRocm91Z2ggeW91ciBrdm0tYXJtIHB1bGwg
cmVxdWVzdC7CoCBKdXN0IENjIG1lIHNvIHRoYXQgCj4+IEkgdW5kZXJzdGFuZCB3aGF0J3MgZ29p
bmcgb24uCj4gCj4gU2luY2UgYSBtb250aCBoYXMgcGFzc2VkIGFuZCBJIGRpZG4ndCBzZWUgYW55
dGhpbmcgcmVsYXRlZCBpbiB0aGUKPiBLVk0tQVJNIHB1bGwgcmVxdWVzdHMsIEkgYW0gZ29pbmcg
dG8gcXVldWUgdGhpcyBwYXRjaC4gIEFueSBjb25mbGljdHMKPiBjYW4gYmUgcmVzb2x2ZWQgdGhy
b3VnaCBhIGt2bWFybS0+a3ZtIG1lcmdlIG9mIGVpdGhlciBhIHRvcGljIGJyYW5jaAo+IG9yIGEg
dGFnIHRoYXQgaXMgZGVzdGluZWQgdG8gNS4xNi4KCkNhbiB5b3UgYXQgbGVhc3Qgc3BlbGwgb3V0
ICp3aGVuKiB0aGlzIHdpbGwgbGFuZD8KClRoZXJlIGlzLCBpbiBnZW5lcmFsLCBhIGNlcnRhaW4g
bGFjayBvZiBjbGFyaXR5IGFib3V0IHdoYXQgeW91IGFyZSAKcXVldWluZywKd2hlcmUgeW91IGFy
ZSBxdWV1aW5nIGl0LCBhbmQgd2hhdCByZWxlYXNlIGl0IHRhcmdldHMuCgpUaGFua3MsCgogICAg
ICAgICBNLgotLSAKSmF6eiBpcyBub3QgZGVhZC4gSXQganVzdCBzbWVsbHMgZnVubnkuLi4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
