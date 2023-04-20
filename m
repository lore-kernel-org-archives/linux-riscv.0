Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7870C77B73
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Apr 2023 20:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=3Y37mGe9AtLa/K36l3Pj+KFaT4B2ZbSmRji04BKGAWg=; b=E0EYZWq6EQTgX5u7rV6E+bC9MT
	A8xwIEJSsghpIrr6n/bEAvpDu7fVVcJJ5BzBmBRMd99CnJs1sVC49n9q9dGXIPTui5cvuFLkmtEBe
	EjFjTtP7ank8DCplrKQGFPGWfBwbBh7wWDbU4NV3sZAFk/0U0I/FKJ0Ril1IFEPXpPtVA3wG09uft
	zMxiyCoq0fLWkBCcYUIhPRnXEjubOtXmpFQovjwLWe2iqIFJla5NOx79b4kHQzi/Xom7aoL1jSdT5
	jOpisQbWD6Ys2XSpTs4AzOnj5NPEMBoorwX1uC7yACA1kMgD1SMm9pe8LHxS/l/HDpMIr8SxtBzk5
	1g8+yMqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppamc-008wBZ-19;
	Thu, 20 Apr 2023 20:21:34 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppamZ-008wAc-2Y
	for linux-riscv@lists.infradead.org;
	Thu, 20 Apr 2023 20:21:33 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-24736ac595aso1193561a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 20 Apr 2023 13:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1682022090; x=1684614090;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mpTOoqFwr6PXx8ZhPhp2F5vKR6FTzxj9fbkenjMTw+I=;
        b=ayMsf68dO1AJVJrABTkUhl1NMkj9wzJIuYm23qPHqGOJfv8Tzmr/MMZxooBdbFWuv6
         cTmzvZGQL22AByne/8vqNIb7Ula7gng50G2+VKpqMx484CV6DQsedQ06XTaeu+DQM49b
         Xv9bZenL7yQF4ga4/MTIH59v2WCdxiBmdnXbayZvn5qNdcPSs6tpTkKYHX2oOZ/dvVZJ
         7iBN8GopMbKfBq0gxr0rs7bCE35mGMrwZMp+IWcuRhn8r0n6FUEqG0/jssdTgwXjPBGo
         QXUjX+PVWO6OKOdititLEBWM39bjy4BtfGL6XjtBawa9+EgUy4H8fBEsjKUgS+1l2k/k
         uAwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682022090; x=1684614090;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mpTOoqFwr6PXx8ZhPhp2F5vKR6FTzxj9fbkenjMTw+I=;
        b=k+HvHC3eiXZhrYQaVrFqxVOtAsHwCHayDFn8T4FPeyI/31NsUYjKtFqKmSbcrZK+gS
         6LNdhmyIjQnTIjTNHYqpo8I528+GWcG25hoCObUZOf7hArxYjZGdqKlys7aYMbdn+qg8
         6IzCFxlGdYb56X8LNrfd8fW7PoHKQiSetXJv95egQNRWDg9JjQknaxkOCZSWbRx5fPQW
         Rxw/csbqPj2ZRk0yU0IDFQHmFkjIx/wWOpaNvwerXeOibB7GNpWHTJT/o+TbOy33sYj5
         vHgU8cPUVUK9bQkkZ0nNwAA/IigxmA4yaBzC2rTzz+FqR5M/k93UayDa+QyXMqriB6NA
         +t9A==
X-Gm-Message-State: AAQBX9ef6lJhae1zsvySPV3NsJVw1d6oFCfq3NQuC5VbVT9bfElEtAZh
	NL4dLT5WQDro1331XCir4HMEDXTFAiI=
X-Google-Smtp-Source: AKy350bOw0CcGSD5HxBsCHP7eQv+pVq4+ffvtFW6Bs0RrLmmQY0i686r1Bx3KLV/2OwqstA5HB5kaL3ma/k=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90a:470b:b0:247:e66:1d90 with SMTP id
 h11-20020a17090a470b00b002470e661d90mr728232pjg.6.1682022090286; Thu, 20 Apr
 2023 13:21:30 -0700 (PDT)
Date: Thu, 20 Apr 2023 13:21:28 -0700
In-Reply-To: <CAHBxVyE+SkQ-jpbupmJU4fpuiXY_GufnANDBUuO5bMHDsudeYg@mail.gmail.com>
Mime-Version: 1.0
References: <20230419221716.3603068-1-atishp@rivosinc.com> <ZEFopfs5Ij/AIkee@google.com>
 <CAHBxVyE+SkQ-jpbupmJU4fpuiXY_GufnANDBUuO5bMHDsudeYg@mail.gmail.com>
Message-ID: <ZEGeyLYCIj75Hmwa@google.com>
Subject: Re: [RFC 00/48] RISC-V CoVE support
From: Sean Christopherson <seanjc@google.com>
To: Atish Kumar Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <ajones@ventanamicro.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	"=?iso-8859-1?Q?Bj=F6rn_T=F6pel?=" <bjorn@rivosinc.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, linux-coco@lists.linux.dev, 
	Dylan Reid <dylan@rivosinc.com>, abrestic@rivosinc.com, 
	Samuel Ortiz <sameo@rivosinc.com>, Christoph Hellwig <hch@infradead.org>, 
	Conor Dooley <conor.dooley@microchip.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guo Ren <guoren@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Jiri Slaby <jirislaby@kernel.org>, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Rajnesh Kanwal <rkanwal@rivosinc.com>, Uladzislau Rezki <urezki@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_132131_851675_27CB8569 
X-CRM114-Status: GOOD (  20.90  )
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

T24gRnJpLCBBcHIgMjEsIDIwMjMsIEF0aXNoIEt1bWFyIFBhdHJhIHdyb3RlOgo+IE9uIFRodSwg
QXByIDIwLCAyMDIzIGF0IDEwOjAw4oCvUE0gU2VhbiBDaHJpc3RvcGhlcnNvbiA8c2VhbmpjQGdv
b2dsZS5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIFdlZCwgQXByIDE5LCAyMDIzLCBBdGlzaCBQYXRy
YSB3cm90ZToKPiA+ID4gMi4gTGF6eSBnc3RhZ2UgcGFnZSBhbGxvY2F0aW9uIHZzIHVwZnJvbnQg
YWxsb2NhdGlvbiB3aXRoIHBhZ2UgcG9vbC4KPiA+ID4gQ3VycmVudGx5LCBhbGwgZ3N0YWdlIG1h
cHBpbmdzIGhhcHBlbiBhdCBydW50aW1lIGR1cmluZyB0aGUgZmF1bHQuIFRoaXMgaXMgZXhwZW5z
aXZlCj4gPiA+IGFzIHdlIG5lZWQgdG8gY29udmVydCB0aGF0IHBhZ2UgdG8gY29uZmlkZW50aWFs
IG1lbW9yeSBhcyB3ZWxsLiBBIHBhZ2UgcG9vbCBmcmFtZXdvcmsKPiA+ID4gbWF5IGJlIGEgYmV0
dGVyIGNob2ljZSB3aGljaCBjYW4gaG9sZCBhbGwgdGhlIGNvbmZpZGVudGlhbCBwYWdlcyB3aGlj
aCBjYW4gYmUKPiA+ID4gcHJlLWFsbG9jYXRlZCB1cGZyb250LiBBIGdlbmVyaWMgcGFnZSBwb29s
IGluZnJhc3RydWN0dXJlIG1heSBiZW5lZml0IG90aGVyIENDIHNvbHV0aW9ucyA/Cj4gPgo+ID4g
SSdtIHNvcnJ5LCB3aGF0PyAgRG8geSdhbGwgcmVhbGx5IG5vdCBwYXkgYW55IGF0dGVudGlvbiB0
byB3aGF0IGlzIGhhcHBlbmluZwo+ID4gb3V0c2lkZSBvZiB0aGUgUklTQy1WIHdvcmxkPwo+ID4K
PiA+IFdlLCB3aGVyZSAid2UiIGlzIEtWTSB4ODYgYW5kIEFSTSwgd2l0aCBmb2xrcyBjb250cmli
dXRpbmcgZnJvbSA1KyBjb21wYW5pbmVzLAo+ID4gaGF2ZSBiZWVuIHdvcmtpbmcgb24gdGhpcyBw
cm9ibGVtIGZvciBnb2luZyBvbiB0aHJlZSAqeWVhcnMqLiAgQW5kIHRoYXQncyBqdXN0Cj4gPiBm
cm9tIHRoZSBmaXJzdCBwdWJsaWMgcG9zdGluZ1sxXSwgdGhlcmUgaGF2ZSBiZWVuIGRpc2N1c3Np
b25zIGFib3V0IGhvdyB0byBhcHByb2FjaAo+ID4gdGhpcyBmb3IgZXZlbiBsb25nZXIuICBUaGVy
ZSBoYXZlIGJlZW4gbXVsdGlwbGUgcmVsYXRlZCBwcmVzZW50YXRpb25zIGF0IEtWTSBGb3J1bSwK
PiA+IHNvbWV0aGluZyBsaWtlIDQgb3IgNSBqdXN0IGF0IEtWTSBGb3J1bSAyMDIyIGFsb25lLgo+
ID4KPiAKPiBJIGRpZCBtZW50aW9uIGFib3V0IHRoYXQgaW4gdGhlIDFzdCBpdGVtIGluIHRoZSBU
T0RPIGxpc3QuCgpNeSBhcG9sb2dpZXMsIEkgY29tcGxldGVseSBtaXNzZWQgdGhlIHRvZG8gbGlz
dC4KCj4gVGhhbmtzIGZvciB5b3VyIHN1Z2dlc3Rpb24uIEl0IHNlZW1zIHdlIHNob3VsZCBqdXN0
IGRpcmVjdGx5IG1vdmUgdG8KPiByZXN0cmljdGVkbWVtIGFzYXAuCgpZZXMgcGxlYXNlLCBmb3Ig
dGhlIHNha2Ugb2YgZXZlcnlvbmUgaW52b2x2ZWQuICBJdCB3aWxsIGxpa2VseSBzYXZlIHlvdSBm
cm9tCnJ1bm5pbmcgaW50byB0aGUgc2FtZSBwaXRmYWxscyB0aGF0IHg4NiBhbmQgQVJNIGFscmVh
ZHkgZW5jb3VudGVyZWQsIGFuZCB0aGUgbW9yZQpleWViYWxscyBhbmQgdXNlIGNhc2VzIG9uIHdo
YXRldmVyIHJlc3RyaWN0ZW1lbSBlbmRzIHVwIGJlaW5nIGNhbGxlZCwgdGhlIGJldHRlci4KClRo
YW5rcyEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
