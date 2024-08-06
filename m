Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD179C52D70
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Aug 2024 15:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uQQMEa9vNtNtcjui61JLg0gLERKwg8BstagLtIb9dKI=; b=a7gQr8dTCfR4kf
	Yg2L4yrmLWwF3+0jKmYCubacBsYFpfJY/2a5LCHGDVgnSuK2YC1Yz+pDAx3r0nUDOrjk5xX/WUvLs
	dRHN2oU7wuuH4ysCnqUuctXWoVfiNUdSzhoDDWRcZquRE524ctWLQYuesTxk1406DXsx1RSG6XtUj
	KeUv7Zi827hVXkBf03Kztjwgdo7WJ8jQa461D15iEAy/Mq5Cs5Dimpcwj4Kvs5rNDlrPLsMfc72dD
	6HjQeUqm9jg3LBR0iZyw6Di0PtIvq7pW3IaSZ23mbUl5NCeWAtDGSyfCrk8pTaA14/XdTRogVBcZj
	t3otdIPQYmXo37A6C9/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbLkq-000000027Zq-3jwu;
	Tue, 06 Aug 2024 15:05:40 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbLjZ-0000000274c-1CmH
	for linux-riscv@lists.infradead.org;
	Tue, 06 Aug 2024 15:04:24 +0000
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-39b3e12754eso2790515ab.1
        for <linux-riscv@lists.infradead.org>; Tue, 06 Aug 2024 08:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1722956660; x=1723561460; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sLks5Q0iPBrgmJrvgcvS8LOwX/9jLhdRfGiAtwiNPmc=;
        b=W224Q2Ds6hbK7y5kQzRQ5d7aI+UlKbboAUf2kp0O6VqvQ7dHZVAM0W8e/p14wCZoHZ
         EGpquvxENcWLYxLVGD3oIAVpSwBHtE3bzd7Ol5fXkjLVou77xr46HLQDcHoA2Q0FUrB6
         lB3c3h02nD99QGyfx+HKj9/bL1rFhvGcobUzDfEwddm/mGBiZ+m8KhrpDtwx/0M0GsWk
         sVv/nUtNRHHq62Crh9GuVv6H5r6ZUtBNOQymVYDQqLcpGtPMeJ+ExVvCO4o8znrhGrpf
         1wRU/scS3MnMnDh4Z1uqTn7NfKRjJeBO/2CHsb61c7hrozxxKj7QfKCBpZn7APn5pmUJ
         7teg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722956660; x=1723561460;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sLks5Q0iPBrgmJrvgcvS8LOwX/9jLhdRfGiAtwiNPmc=;
        b=oXhPdj1kaX5/QXd+eec3I3FdiAdLlR7qIei7HageDRlvnx+dc99YV0autasPeLAyJj
         If5nZHVK9AlYC1uHTvS7nxpgGatEilHMcYZaXIUIzcZhsAtdaa0v/i0rrxbrg/C5rC/5
         EJtTWPVB7odY52DP2ee43bDRVJS/iXaPEEENfpNvmUOwYjhPY7qUnz3IyP1MjiixW0g1
         kRQXHEiZfRbOjVeVQXJ16uXBopErauJsmZonNCJGOVXcydAMOF3DMWaUR1Ks8ThXyo3r
         xVIZn+aKbIl7/2pdZMOgGVstVXBHlesJebYgT/erv+X+34QYvU01tRhHSB5ZeaRafTrZ
         XABg==
X-Forwarded-Encrypted: i=1; AJvYcCUu40PrPYG/FGnFxNhd89obW/ZrHu4INr4AYsoqMYXQAIpDzFcSVnjggiaG2gHncdd48BtBN9XkfciVw4/4xy50PTCjOUSq274RcSE+ayAZ
X-Gm-Message-State: AOJu0YxBLjGxTzPSgGigSP/WhkRYfwQTc1Y1ijchZkKxiKJsDJ9pJzmJ
	ZGiq8pMfWib3C9U2jBZSlxrWe1BWsfl+VrUuLE4O2f9k7e4UdJnyTJGRJimNCH7OXG3dk/LPOje
	H3+H9Wxh0WVcRc59m1Ul+U6KJIVuBjo6sIE7WOA==
X-Google-Smtp-Source: AGHT+IGyDNkeg1CkpECSQ0akll4U0MAQSWPOL8L25sxstJveeDCZd19K8yTTFoue56gvit0ch8aH+2CGmbmtibK8NQ8=
X-Received: by 2002:a92:c0d1:0:b0:374:9c67:1df6 with SMTP id
 e9e14a558f8ab-39b1fc23546mr155430195ab.22.1722956659564; Tue, 06 Aug 2024
 08:04:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com> <20240726235234.228822-58-seanjc@google.com>
In-Reply-To: <20240726235234.228822-58-seanjc@google.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 6 Aug 2024 20:34:08 +0530
Message-ID: <CAAhSdy2rvPCuN7ROU4k9pAuyCZUnyDf2DhHjfSa_pA5SG6Q5DA@mail.gmail.com>
Subject: Re: [PATCH v12 57/84] KVM: RISC-V: Mark "struct page" pfns accessed
 before dropping mmu_lock
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_080421_387292_E5DCEC9A 
X-CRM114-Status: GOOD (  13.37  )
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

T24gU2F0LCBKdWwgMjcsIDIwMjQgYXQgNToyNOKAr0FNIFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNl
YW5qY0Bnb29nbGUuY29tPiB3cm90ZToKPgo+IE1hcmsgcGFnZXMgYWNjZXNzZWQgYmVmb3JlIGRy
b3BwaW5nIG1tdV9sb2NrIHdoZW4gZmF1bHRpbmcgaW4gZ3Vlc3QgbWVtb3J5Cj4gc28gdGhhdCBS
SVNDLVYgY2FuIGNvbnZlcnQgdG8ga3ZtX3JlbGVhc2VfZmF1bHRpbl9wYWdlKCkgd2l0aG91dCB0
cmlwcGluZwo+IGl0cyBsb2NrZGVwIGFzc2VydGlvbiBvbiBtbXVfbG9jayBiZWluZyBoZWxkLiAg
TWFya2luZyBwYWdlcyBhY2Nlc3NlZAo+IG91dHNpZGUgb2YgbW11X2xvY2sgaXMgb2sgKG5vdCBn
cmVhdCwgYnV0IHNhZmUpLCBidXQgbWFya2luZyBwYWdlcyBfZGlydHlfCj4gb3V0c2lkZSBvZiBt
bXVfbG9jayBjYW4gbWFrZSBmaWxlc3lzdGVtcyB1bmhhcHB5Lgo+Cj4gU2lnbmVkLW9mZi1ieTog
U2VhbiBDaHJpc3RvcGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5jb20+CgpGb3IgS1ZNIFJJU0MtVjoK
QWNrZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpSZWdhcmRzLApBbnVw
CgoKPiAtLS0KPiAgYXJjaC9yaXNjdi9rdm0vbW11LmMgfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L2t2bS9tbXUuYyBiL2FyY2gvcmlzY3Yva3ZtL21tdS5jCj4gaW5kZXggMDZhYTVhMGQw
NTZkLi44MDZmNjhlNzA2NDIgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vbW11LmMKPiAr
KysgYi9hcmNoL3Jpc2N2L2t2bS9tbXUuYwo+IEBAIC02ODMsMTAgKzY4MywxMCBAQCBpbnQga3Zt
X3Jpc2N2X2dzdGFnZV9tYXAoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAo+ICBvdXRfdW5sb2NrOgo+
ICAgICAgICAgaWYgKCghcmV0IHx8IHJldCA9PSAtRUVYSVNUKSAmJiB3cml0YWJsZSkKPiAgICAg
ICAgICAgICAgICAga3ZtX3NldF9wZm5fZGlydHkoaGZuKTsKPiArICAgICAgIGVsc2UKPiArICAg
ICAgICAgICAgICAga3ZtX3JlbGVhc2VfcGZuX2NsZWFuKGhmbik7Cj4KPiAgICAgICAgIHNwaW5f
dW5sb2NrKCZrdm0tPm1tdV9sb2NrKTsKPiAtICAgICAgIGt2bV9zZXRfcGZuX2FjY2Vzc2VkKGhm
bik7Cj4gLSAgICAgICBrdm1fcmVsZWFzZV9wZm5fY2xlYW4oaGZuKTsKPiAgICAgICAgIHJldHVy
biByZXQ7Cj4gIH0KPgo+IC0tCj4gMi40Ni4wLnJjMS4yMzIuZzk3NTJmOWUxMjMtZ29vZwo+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
