Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B285C4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Dec 2023 15:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=hKL6HSunaCmdl292IAn5Owjk/kvRA/eRPgrBoXnw3IU=; b=Shpn0lUsD6LDNa5mStqUla2uww
	VTugPuKx8Qrle7M5j+zMis5zhiddF1zm4OkbXwr6bPOY5zmUdtpxAj16lCken8V27dvjOf6nXldb6
	2r0ay2wYOZGUwcqySeZ1nSoJMqD1TPt31AxfIOfrg3fnrbIdH1t07S6vZDhts+69RiKzb6izDsBWq
	Z35Db2v6eh+fNPfOLlgs2joFcrMHWlftmTwD9sG9ODwoIEYaA+eLpneE6i9llBLlRkVvixN4BY0QN
	k5Rfizy7veOHAvc8h4q6udmLOXclby0V1PvA22U76qld7om19iSA/qVv8lXWm326NoTHv1kXAMLTf
	yy/VVtfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rD4gx-00C4T5-0M;
	Tue, 12 Dec 2023 15:29:03 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rD4gt-00C4Pp-28
	for linux-riscv@lists.infradead.org;
	Tue, 12 Dec 2023 15:29:01 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-dbc68661060so3373181276.2
        for <linux-riscv@lists.infradead.org>; Tue, 12 Dec 2023 07:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702394936; x=1702999736; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ESTPXNxaOVzfRXXRx0Fvol8yzry2uxBEEuLKqef2q4U=;
        b=Dt/H0yK8unMdVoq1+x9uqmfU8kzDSf2AgFWvcmD/ixGhew/qy0qUsEDobO69gfj6w0
         fSzTciy6btyV/No+myo8ggiA8liabWxeoIiLBHMpe0C9PLboil3uVBBBGts+60laPK7S
         TIlk7MExVsLTCZ5ONl6O9nnp+jmQf2o/UpnZK145WGTdm2ehsto1blSgwNml9qvAk2as
         VtxjOij0pvFTeKMb+6hKGhpK5Vxc1+HfH1/N3zCSjXcmaCqpd1auWx2bPI2WeqRhQdH/
         j7sUZj4WUJkJglDMr5FRyTggZdP891uIc2Vj6B4Tu8nTwZTg8CgxLFI0Y3JU6MeNaGFJ
         M/Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702394936; x=1702999736;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ESTPXNxaOVzfRXXRx0Fvol8yzry2uxBEEuLKqef2q4U=;
        b=NGYf4lqvAdIhTa/HsI92fjdMQpTAbRlHNxjCkqogM1BquULjzdUIwwdfhUB/DnfSnW
         h/lS8T/4kR9eQrF822LnrCkG+dfPKj9m++nYGtodoaUvn0XDS4qOfnC+xBWtMC+gQVN1
         u8Rpu1sPkB2aeJWsxIO+omxgNdACmNBlUKpqNtFQttMuw7jsf3Dr/vV6M8L6iUc+nQ40
         lj78GZA+KFPnfE+jwtzHN4sA09RG/AMLdniq4cE8f6WflT7GJ7rfsx2/diUuQGcrvDxm
         qMnb5SEi2yEG21DZtrnqozhKNZLzET0CKrcC7MV+q4uyLwEjqyrwbBmfH+kSv30u1M+J
         ERiw==
X-Gm-Message-State: AOJu0YxHlhofMi9VU8/J+G6UuRYg5JwEk/28/nEwyScTJ3hFImg1n3lb
	pdNOw4TLVaVdbGQIUcvw7o0oEsXzJiM=
X-Google-Smtp-Source: AGHT+IHBX6jt6VDhWuABWGol0Nx+Ii84S8r8nT9g/gNamSIHnZwQhzhs+bFmpCR2BuKO/hKALNdpvESE74w=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:db94:0:b0:db4:7ac:fea6 with SMTP id
 g142-20020a25db94000000b00db407acfea6mr41805ybf.7.1702394935890; Tue, 12 Dec
 2023 07:28:55 -0800 (PST)
Date: Tue, 12 Dec 2023 07:28:54 -0800
In-Reply-To: <CALMp9eTT97oDmQT7pxeOMLQbt-371aMtC2Kev+-kWXVRDVrjeg@mail.gmail.com>
Mime-Version: 1.0
References: <20220921003201.1441511-11-seanjc@google.com> <20231207010302.2240506-1-jmattson@google.com>
 <ZXHw7tykubfG04Um@google.com> <CALMp9eTT97oDmQT7pxeOMLQbt-371aMtC2Kev+-kWXVRDVrjeg@mail.gmail.com>
Message-ID: <ZXh8Nq_y_szj1WN0@google.com>
Subject: Re: [PATCH v4 10/12] KVM: x86: never write to memory from kvm_vcpu_check_block()
From: Sean Christopherson <seanjc@google.com>
To: Jim Mattson <jmattson@google.com>
Cc: alexandru.elisei@arm.com, anup@brainfault.org, aou@eecs.berkeley.edu, 
	atishp@atishpatra.org, borntraeger@linux.ibm.com, chenhuacai@kernel.org, 
	david@redhat.com, frankja@linux.ibm.com, imbrenda@linux.ibm.com, 
	james.morse@arm.com, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, maz@kernel.org, mlevitsk@redhat.com, 
	oliver.upton@linux.dev, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	pbonzini@redhat.com, suzuki.poulose@arm.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_072859_698619_BBEF9938 
X-CRM114-Status: GOOD (  14.20  )
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

T24gU3VuLCBEZWMgMTAsIDIwMjMsIEppbSBNYXR0c29uIHdyb3RlOgo+IE9uIFRodSwgRGVjIDcs
IDIwMjMgYXQgODoyMeKAr0FNIFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNlYW5qY0Bnb29nbGUuY29t
PiB3cm90ZToKPiA+IERvaC4gIFdlIGdvdCB0aGUgbGVzcyBvYnZpb3VzIGNhc2VzIGFuZCBtaXNz
ZWQgdGhlIG9idmlvdXMgb25lLgo+ID4KPiA+IFVnaCwgYW5kIHdlIGFsc28gbWlzc2VkIGEgcmVs
YXRlZCBtZXNzIGluIGt2bV9ndWVzdF9hcGljX2hhc19pbnRlcnJ1cHQoKS4gIFRoYXQKPiA+IHRo
aW5nIHNob3VsZCByZWFsbHkgYmUgZm9sZGVkIGludG8gdm14X2hhc19uZXN0ZWRfZXZlbnRzKCku
Cj4gPgo+ID4gR29vZCBncmF2eS4gIEFuZCB2bXhfaW50ZXJydXB0X2Jsb2NrZWQoKSBkb2VzIHRo
ZSB3cm9uZyB0aGluZyBiZWNhdXNlIHRoYXQKPiA+IHNwZWNpZmljYWxseSBjaGVja3MgaWYgTDEg
aW50ZXJydXB0cyBhcmUgYmxvY2tlZC4KPiA+Cj4gPiBDb21waWxlIHRlc3RlZCBvbmx5LCBhbmQg
ZGVmaW5pdGVseSBuZWVkcyB0byBiZSBjaHVua2VkIGludG8gbXVsdGlwbGUgcGF0Y2hlcywKPiA+
IGJ1dCBJIHRoaW5rIHNvbWV0aGluZyBsaWtlIHRoaXMgbWVzcz8KPiAKPiBUaGUgcHJvcG9zZWQg
cGF0Y2ggZG9lcyBub3QgZml4IHRoZSBwcm9ibGVtLiBJbiBmYWN0LCBpdCBtZXNzZXMgdGhpbmdz
Cj4gdXAgc28gbXVjaCB0aGF0IEkgZG9uJ3QgZ2V0IGFueSB0ZXN0IHJlc3VsdHMgYmFjay4KCkRy
YXQuCgo+IEdvb2dsZSBoYXMgYW4gaW50ZXJuYWwgSy1VLVQgdGVzdCB0aGF0IGRlbW9uc3RyYXRl
cyB0aGUgcHJvYmxlbS4gSQo+IHdpbGwgcG9zdCBpdCBzb29uLgoKUmVjZWl2ZWQsIEknbGwgZGln
IGluIHNvb25pc2gsIHRob3VnaCAic29vbmlzaCIgbWlnaHQgdW5mb3J0dW5hdGVseSBtaWdodCBt
ZWFuCjIwMjQuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
