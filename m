Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA3F4CCF9E0
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 16:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=mgRcf4heWiqFaZ99Dg0Z+C500Sm1cM1BFq/TEpLAdcU=; b=BeYMx6ZgS/3cV2JM5YpV/5vwN2
	c/JC6Qy80AT/oHMUdwDPo7V8pJzgnzygSWEm2grq+k40BJlOLjmidDwoXi7S/9Fof73G6FGaIRYQh
	j85JotBeI7wXX8LQaNB2dVqMJ2ojGp3nb4YOhuX/PwoW/M1m1tAVu1FnaT4xCeNcatE+8JdBihuSH
	O7AoavHrepTODJG+4H8UrwBWeJvwrK2OA7/P8CEU+P8LjaTJSpUoP1FSzuexxmJ9fhakkp6sdefSw
	dswFUvyVCbzaPO6nAe5EUqbYcxHLodci3jKGkjf7QJRplVxw0+pzvnbRIsOtNrU3zhDca6TZHh6F6
	vi8me2Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCKjY-00000009z9N-0JoO;
	Fri, 24 Oct 2025 16:33:44 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCKjV-00000009z7x-45qf
	for linux-riscv@lists.infradead.org;
	Fri, 24 Oct 2025 16:33:43 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-b6ceba8968dso1603015a12.2
        for <linux-riscv@lists.infradead.org>; Fri, 24 Oct 2025 09:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761323621; x=1761928421; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XmFbq4MgFLvSavBU+dsE5BY6fpPsL4/gR9QPfUGTSHw=;
        b=Sw7kVbF+AyTonYoOyN6CUt7Zub+uplwL6akryrlBxlkQejD3WF1vK8QxSI+Iubzdy2
         JP9A34w8keMStsLuRz6sA4SVXGHjAOZHYTY6IoRjjjbp6p6RXA3Xi4uBHgYGpF4yklRM
         c4IT/NJXVPmaHOXu0Mf0KQDQJ0k0MYYHBpktBVnHEdZEux6/iY3kes4pz2dh+Q/eNVWw
         /HWvISOTIyFkVUOkQs52iXKpt3hgUnlwKL2F91ZgXZfJ2dI4+6vBiZijw3FmHuj+hzNf
         kgfU7pdtpTS4Px7r7EaCsWsc6OJI60CAVrhL11tT8mPzG6peavzot0SjUqJZzOiYNals
         5PFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761323621; x=1761928421;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XmFbq4MgFLvSavBU+dsE5BY6fpPsL4/gR9QPfUGTSHw=;
        b=Ok9anTAVptR8I6wcecSasBlgICl/G6jYYkvU2XhxwCPLt6S/5U8uhd6yVzB5S/j4K3
         1B71PjcqikUszosA08qcSyfKCOIAlygWIvll6JURY+wsBns4S3RXik7gfAnLun/OCwFi
         OlqoONT5FnI8Ex+dzQqsjDgdZ5GLUchSE85DUEY6toXK7k73e/sfxC3zaST4Wd4kjO2G
         iV5b8tThaRyNaKqmXK7R5wtD4jHXhlKQoXPT8SB9BbpLLdr8xV3q97GBH6h951/7WIM+
         ob4z2rrzsablSxvtJJm/1MOXMWva3BMaYhhs7XtEA0/t8Od2qfRn6VK11xmd/q0BycMW
         58YQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrIIA1kTL0OR91lBSKAM//fjEaLJTmBDhGK9Q0ZiKxd5ZpjiP0nsUtc7nwy6Ecvc3trLR317fgWmaxVA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzfAY/WPcfG921+V9nAswYhyAiluVXtzjpRzJsv5HIsVzgs/FwD
	AZA6LBzsolH/NEPRJQ7n0f/qXa3dSawIlnTvCHTXzyEtm+pjdl+pwoYGBAPMWGm/TDDc75y9YQY
	IZIX5pA==
X-Google-Smtp-Source: AGHT+IFeKRRbqSfdPI99mHeasG8LL+kiQGTQFDWiy/7cdPCFgXLMLE3NirNFzhTfpVhc/qoTuLXwCz2Ncvs=
X-Received: from pjot2.prod.google.com ([2002:a17:90a:9502:b0:32f:3fab:c9e7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:244b:b0:30f:7840:2c96
 with SMTP id adf61e73a8af0-334a8629ec6mr34771147637.47.1761323620638; Fri, 24
 Oct 2025 09:33:40 -0700 (PDT)
Date: Fri, 24 Oct 2025 09:33:39 -0700
In-Reply-To: <5dea4a3d-c7b7-48f0-b2d5-7597e0cd5f00@linux.intel.com>
Mime-Version: 1.0
References: <20251017003244.186495-1-seanjc@google.com> <20251017003244.186495-14-seanjc@google.com>
 <5dea4a3d-c7b7-48f0-b2d5-7597e0cd5f00@linux.intel.com>
Message-ID: <aPuqYz3ly5a3__mf@google.com>
Subject: Re: [PATCH v3 13/25] KVM: TDX: Fold tdx_mem_page_record_premap_cnt()
 into its sole caller
From: Sean Christopherson <seanjc@google.com>
To: Binbin Wu <binbin.wu@linux.intel.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	"Kirill A. Shutemov" <kas@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	x86@kernel.org, linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Ira Weiny <ira.weiny@intel.com>, Kai Huang <kai.huang@intel.com>, 
	Michael Roth <michael.roth@amd.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Ackerley Tng <ackerleytng@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_093342_018180_06913EFE 
X-CRM114-Status: GOOD (  15.25  )
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

T24gRnJpLCBPY3QgMjQsIDIwMjUsIEJpbmJpbiBXdSB3cm90ZToKPiAKPiAKPiBPbiAxMC8xNy8y
MDI1IDg6MzIgQU0sIFNlYW4gQ2hyaXN0b3BoZXJzb24gd3JvdGU6Cj4gPiBGb2xkIHRkeF9tZW1f
cGFnZV9yZWNvcmRfcHJlbWFwX2NudCgpIGludG8gdGR4X3NlcHRfc2V0X3ByaXZhdGVfc3B0ZSgp
IGFzCj4gPiBwcm92aWRpbmcgYSBvbmUtb2ZmIGhlbHBlciBmb3IgZWZmZWN0aXZlbHkgdGhyZWUg
bGluZXMgb2YgY29kZSBpcyBhdCBiZXN0IGEKPiA+IHdhc2gsIGFuZCBzcGxpdHRpbmcgdGhlIGNv
ZGUgbWFrZXMgdGhlIGNvbW1lbnQgZm9yIHNtcF9ybWIoKSAgX2V4dHJlbWVseV8KPiA+IGNvbmZ1
c2luZyBhcyB0aGUgY29tbWVudCB0YWxrcyBhYm91dCByZWFkaW5nIGt2bS0+YXJjaC5wcmVfZmF1
bHRfYWxsb3dlZAo+ID4gYmVmb3JlIGt2bV90ZHgtPnN0YXRlLCBidXQgdGhlIGltbWVkaWF0ZWx5
IHZpc2libGUgY29kZSBkb2VzIHRoZSBleGFjdAo+ID4gb3Bwb3NpdGUuCj4gPiAKPiA+IE9wcG9y
dHVuaXN0aWNhbGx5IHJld3JpdGUgdGhlIGNvbW1lbnRzIHRvIG1vcmUgZXhwbGljaXRseSBleHBs
YWluIHdobyBpcwo+ID4gY2hlY2tpbmcgd2hhdCwgYXMgd2VsbCBhcyBfd2h5XyB0aGUgb3JkZXJp
bmcgbWF0dGVycy4KPiA+IAo+ID4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW50ZW5kZWQuCj4gPiAK
PiA+IFJldmlld2VkLWJ5OiBSaWNrIEVkZ2Vjb21iZSA8cmljay5wLmVkZ2Vjb21iZUBpbnRlbC5j
b20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBTZWFuIENocmlzdG9waGVyc29uIDxzZWFuamNAZ29vZ2xl
LmNvbT4KPiAKPiBSZXZpZXdlZC1ieTogQmluYmluIFd1IDxiaW5iaW4ud3VAbGludXguaW50ZWwu
Y29tPgo+IAo+IE9uZSBuaXQgYmVsb3cuCj4gCj4gWy4uLl0KPiA+ICsJLyoKPiA+ICsJICogSWYg
dGhlIFREIGlzbid0IGZpbmFsaXplZC9ydW5uYWJsZSwgdGhlbiB1c2Vyc3BhY2UgaXMgaW5pdGlh
bGl6aW5nCj4gPiArCSAqIHRoZSBWTSBpbWFnZSB2aWEgS1ZNX1REWF9JTklUX01FTV9SRUdJT04u
ICBJbmNyZW1lbnQgdGhlIG51bWJlciBvZgo+ID4gKwkgKiBwYWdlcyB0aGF0IG5lZWQgdG8gYmUg
bWFwcGVkIGFuZCBpbml0aWFsaXplZCB2aWEgVERILk1FTS5QQUdFLkFERC4KPiA+ICsJICogS1ZN
X1REWF9GSU5BTElaRV9WTSBjaGVja3MgdGhlIGNvdW50ZXIgdG8gZW5zdXJlIGFsbCBtYXBwZWQg
cGFnZXMKPiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoF4KPiDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCBOaXQ6IElzIHByZS1tYXBwZWQgYmV0dGVyPwoKWWVhaCwgdXBkYXRlZCAo
YW5kIHRoZW4gaXQgZ2V0cyBkZWxldGVkIGEgZmV3IGNvbW1pdHMgbGF0ZXIgOi0pICkuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
