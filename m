Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ECBFC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Nov 2021 11:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R4mX7dQMjgGAnb4s+4/LNYbw7wC4w6n1YDJh8GhwFZE=; b=hDvQ+TGF+ZnGQt
	QBSFfkO+jwmFl9fL4EZWkPHhg2ytL48Y7NRhTdCZzj4KluoeHvaW25dNB5Pz0UIGQgxDzZzGVoSLy
	im9bTkCkXxCuYLrX72QzauHMFZ1PD3TqDsaBfCK1aMvntvSAZd4W/4J59tvQTM2+TtxdR2TASmXL6
	+K+ph9xY51rIhxwpYUfdukuK7EEChPS+apQEJdRpZvou8BbqQ/+eszzKCu6cmVdDxSQH9/tFLqC0E
	0JWmxssAcPCmEqqxE6pUN8jdP5YhKdi5JIkeHiX1VZyb3zQQN/owolwXtRyxY339aRX33oabG15Ol
	v8njnnXOXMBTM7rDiqmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ms1U5-004tWn-Bz; Tue, 30 Nov 2021 11:39:41 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ms1Tr-004tU9-Al; Tue, 30 Nov 2021 11:39:28 +0000
Received: by mail-ed1-x536.google.com with SMTP id w1so85663163edc.6;
 Tue, 30 Nov 2021 03:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=yGHiGFZ+rE1fvnI8baTnrP2jm+L8strqrdJ5iul7hp0=;
 b=c6P0wlF3uxLM9zmSs2xQkvwdYDteITQrAo0DrsrznSF9sEOH28QP1fFa6xhItTgTpS
 KkU6+3vbY7zvYbaGplUg6NAOHI1i7wZaB3YsPHKiJwSv7fAraYSJOmBsIPcxDa1GRc0A
 PiiJWBQEcwSH6cUNsH7cKZjAdxgXOazBahtafC3Gs9rh9Srzhdp4SMH53zgHkiQE4Got
 FG3pFo/MwoBD/bEwOxiDmocGqSzd1aaMmn3Q9da/d+qNqxzu9ZAjjXwyK04+bd+g1kuu
 faXB8tkRVfsTXc+ZCCEjhbpUn7X9sEvfPMvPv6y6fB24K84rc8fMZl0EoSsfLlnsoaMi
 6+Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=yGHiGFZ+rE1fvnI8baTnrP2jm+L8strqrdJ5iul7hp0=;
 b=xV6JhFLFyQYeanhshq7DS1qfFrBbJGOai5YWts60HmhpXrbJXJuOkFBbbpDPurGrOa
 EuhROXTQr3quguR711FWxWlck2J8JTRVxMcpwPwgKUvJIucpsFdPx4EAA2aEF7jUlq7H
 KWlbWKJ+roiRbpG2OcBPyG1mAN2YPkiE32iWjk+Qp2kdwW2FStQqricMiOdZUkKEX8Xs
 sS20c0EQ0/eTHWyhZb5IlUO0ZIQxf3CkYt4M71HNX0B5e/HlD1fRU/LsPOQoF5Uypm4I
 z55Om+iG3vfzj+fxbYPW6fPUy4fvNQbaVPa3fzWwS2ZuCR/vcTJU+8k5qM/a+NSL6AqO
 R7VA==
X-Gm-Message-State: AOAM5329TD1VRCQQqxHJEVm3+6KD/6i8/RZ9jaDFcmrvdSVfF0A1QSJF
 SS7ky6wJK3ZB4Has4D4thSs=
X-Google-Smtp-Source: ABdhPJzBmlKlxbZEZjGdZkld9KClqoQPE65iifbnAftOVfFURI+3gCywK4yL4F/szmL3PzOccPRpRg==
X-Received: by 2002:a17:906:6a1a:: with SMTP id
 qw26mr67292465ejc.489.1638272364301; 
 Tue, 30 Nov 2021 03:39:24 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id m22sm11049796eda.97.2021.11.30.03.39.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Nov 2021 03:39:23 -0800 (PST)
Message-ID: <3490c50e-50d2-f906-3383-b87e14b14fab@redhat.com>
Date: Tue, 30 Nov 2021 12:39:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 10/43] KVM: arm64: Move vGIC v4 handling for WFI out
 arch callback hook
Content-Language: en-US
From: Paolo Bonzini <pbonzini@redhat.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, Anup Patel <anup.patel@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Atish Patra
 <atish.patra@wdc.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Claudio Imbrenda
 <imbrenda@linux.ibm.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>,
 Joerg Roedel <joro@8bytes.org>, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org,
 kvm@vger.kernel.org, kvm-ppc@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 David Matlack <dmatlack@google.com>, Oliver Upton <oupton@google.com>,
 Jing Zhang <jingzhangos@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-11-seanjc@google.com>
 <9236e715-c471-e1c8-6117-6f37b908a6bd@redhat.com>
 <875ytjbxpq.wl-maz@kernel.org>
 <be1cf8c7-ed87-b8eb-1bca-0a6c7505d7f8@redhat.com>
In-Reply-To: <be1cf8c7-ed87-b8eb-1bca-0a6c7505d7f8@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_033927_408888_CA6FAD8E 
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMTAvMjYvMjEgMTg6MTIsIFBhb2xvIEJvbnppbmkgd3JvdGU6Cj4gT24gMjYvMTAvMjEgMTc6
NDEsIE1hcmMgWnluZ2llciB3cm90ZToKPj4+IFRoaXMgbmVlZHMgYSB3b3JkIG9uIHdoeSBrdm1f
cHNjaV92Y3B1X3N1c3BlbmQgZG9lcyBub3QgbmVlZCB0aGUKPj4+IGhvb2tzLsKgIE9yIGl0IG5l
ZWRzIHRvIGJlIGNoYW5nZWQgdG8gYWxzbyB1c2Uga3ZtX3ZjcHVfd2ZpIGluIHRoZSBQU0NJCj4+
PiBjb2RlLCBJIGRvbid0IGtub3cuCj4+Pgo+Pj4gTWFyYywgY2FuIHlvdSByZXZpZXcgYW5kL29y
IGFkdmlzZT8KPj4gSSB3YXMgbG9va2luZyBhdCB0aGF0IG92ZXIgdGhlIHdlZWtlbmQsIGFuZCB0
aGF0J3MgYSBwcmUtZXhpc3RpbmcKPj4gYnVnLiBJIHdvdWxkIGhhdmUgYWRkcmVzc2VkIGl0IGlu
ZGVwZW5kZW50bHksIGJ1dCBpdCBsb29rcyBsaWtlIHlvdQo+PiBhbHJlYWR5IGhhdmUgcXVldWVk
IHRoZSBwYXRjaC4KPiAKPiBJIGhhdmUgInF1ZXVlZCIgaXQsIGJ1dCB0aGF0J3MganVzdCBteSBx
dWV1ZSAtIGl0J3Mgbm90IG9uIGtlcm5lbC5vcmcgCj4gYW5kIGl0J3Mgbm90IGdvaW5nIHRvIGJl
IGluIDUuMTYsIGF0IGxlYXN0IG5vdCBpbiB0aGUgZmlyc3QgYmF0Y2guCj4gCj4gVGhlcmUncyBw
bGVudHkgb2YgdGltZSBmb3IgbWUgdG8gcmViYXNlIG9uIHRvcCBvZiBhIGZpeCwgaWYgeW91IHdh
bnQgdG8gCj4gc2VuZCB0aGUgZml4IHRocm91Z2ggeW91ciBrdm0tYXJtIHB1bGwgcmVxdWVzdC7C
oCBKdXN0IENjIG1lIHNvIHRoYXQgSSAKPiB1bmRlcnN0YW5kIHdoYXQncyBnb2luZyBvbi4KClNp
bmNlIGEgbW9udGggaGFzIHBhc3NlZCBhbmQgSSBkaWRuJ3Qgc2VlIGFueXRoaW5nIHJlbGF0ZWQg
aW4gdGhlIApLVk0tQVJNIHB1bGwgcmVxdWVzdHMsIEkgYW0gZ29pbmcgdG8gcXVldWUgdGhpcyBw
YXRjaC4gIEFueSBjb25mbGljdHMgCmNhbiBiZSByZXNvbHZlZCB0aHJvdWdoIGEga3ZtYXJtLT5r
dm0gbWVyZ2Ugb2YgZWl0aGVyIGEgdG9waWMgYnJhbmNoIG9yIAphIHRhZyB0aGF0IGlzIGRlc3Rp
bmVkIHRvIDUuMTYuCgpQYW9sbwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
