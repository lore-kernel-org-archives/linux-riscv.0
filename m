Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0882C001B0
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Aug 2023 22:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=W1wJ8X6eb+oDKXE7YHDGx4NtplbUyIMKWYD0eXlJuPk=; b=3ht8nMP+RXOJe26WmEtdILEGZC
	ZiOzAZ2SCARaTSy4EJI9zqsndqHJ8lEUvpv00HksvAsKpuKYaaWDQajNoJBR7QTGZ4enYKH+yDxdA
	Ox3i4US9P1Oy7nsHALVmvJitPj6MggKbAHVN1QgUJFZfVktPbOukeKy7LBgaxbBuxeellSF6qnow8
	4LMGVLp6jcF4IZ+rcq0OqNQJLyF0Qtp1M5WU3Nd4YPtRn/I15NzR1huMbLxUxFskShJ51C4J11Sgd
	LdPPR/AGxwXz/I8bBIibgheLAosOXtB/8LwynuzevslLTSLnfmSh1aUCZaOzJ2TwadIame5w/oWJA
	Xfn51jDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qW2Yw-002ixL-3D;
	Tue, 15 Aug 2023 22:30:55 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qW2Yt-002iuW-0v
	for linux-riscv@lists.infradead.org;
	Tue, 15 Aug 2023 22:30:52 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-58b7b5cc9d4so25714097b3.0
        for <linux-riscv@lists.infradead.org>; Tue, 15 Aug 2023 15:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692138649; x=1692743449;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gNKxKU9a0k5QwlnHGJaZtqPp9x+MfH7uASd6ddnnEGk=;
        b=N1mh0iZlQU8pl32cDnHblEsftvP+4ptCDqmlHtK9LvQ8rp8vvY5xnNHansnMhCNlf4
         2wft/kVP+IOiuuGI7F76Dxp/VGngrE9p/gcHjSZuJhgCIlyLaQIMxtsoAeBO2HYg2muU
         QTg1bBY2JiuD+HBSAr8OeSuQmC2c2vIHrTZx4r0vBPvyvC711MPVCDG381fy/47Q69LF
         bpsdHZR0fotPIe6D7l2BU6/h4ntZ++swGu8PVbrqzP8YQMYl9lJ9l+3RZSo/GqSWGI2r
         g//wP+QbgTiNuhh+PZn4/YKmCFoJM0+p/xgaZOIW6JPH4jqBZ+tkpSYF/yvRoMaU1+B7
         hYxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692138649; x=1692743449;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gNKxKU9a0k5QwlnHGJaZtqPp9x+MfH7uASd6ddnnEGk=;
        b=KYAD0g+RvYa/jxzqcLaXfCU5+VI0bZN8e8Q+2c0uOofY8kOjMhY1j4IbsbX2u8phmP
         fHw+izwbiRhTlvmqjK8Cc7H1sEqdgg40O6diE8eaVrt5noV5NwK4J/gOQvM0b2Lt/3tx
         jPM1xKuMhPUtgkHALj/QC7taH+C0khA527HSxLtAvVLZRsAr/qe+oEn+LXPN8WfO7KPg
         uWEDPgW83IP640N/fwH4sl6ZKkiVTYfJbINwZJFfPPggMyRnv+BtMyO6zLM9P4V9ZMr8
         PX0bFRt8DihoiaqBjFjTJ6gDzy3gzYexJxS4kW6qFvqFIrDwJdaKK1rO3PawVZr+brwP
         O3dw==
X-Gm-Message-State: AOJu0Ywr8kWLOXsQMPvj04stfm35iTZzoa+sHJMspibKNM2cSCpj7sBn
	o2XiTL2jH9Ml/S9BnDX1RZCA5QYIdj8=
X-Google-Smtp-Source: AGHT+IHjqo/FB8qF6/mUmxkmvTmKIc5leYLXNSH3BL88+7yOIuIDWfQQa40QRwmSX5edxm8UNLTBq+krgbo=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:b60a:0:b0:586:a689:eb69 with SMTP id
 u10-20020a81b60a000000b00586a689eb69mr194454ywh.2.1692138648813; Tue, 15 Aug
 2023 15:30:48 -0700 (PDT)
Date: Tue, 15 Aug 2023 15:30:47 -0700
In-Reply-To: <20230811045127.3308641-2-rananta@google.com>
Mime-Version: 1.0
References: <20230811045127.3308641-1-rananta@google.com> <20230811045127.3308641-2-rananta@google.com>
Message-ID: <ZNv8l3mmC/vtqf3j@google.com>
Subject: Re: [PATCH v9 01/14] KVM: Rename kvm_arch_flush_remote_tlb() to kvm_arch_flush_remote_tlbs()
From: Sean Christopherson <seanjc@google.com>
To: Raghavendra Rao Ananta <rananta@google.com>
Cc: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Jing Zhang <jingzhangos@google.com>, 
	Reiji Watanabe <reijiw@google.com>, Colton Lewis <coltonlewis@google.com>, 
	David Matlack <dmatlack@google.com>, Fuad Tabba <tabba@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, Gavin Shan <gshan@redhat.com>, 
	"Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=" <philmd@linaro.org>, Shaoqin Huang <shahuang@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230815_153051_321608_01477640 
X-CRM114-Status: UNSURE (   8.38  )
X-CRM114-Notice: Please train this message.
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

T24gRnJpLCBBdWcgMTEsIDIwMjMsIFJhZ2hhdmVuZHJhIFJhbyBBbmFudGEgd3JvdGU6Cj4gRnJv
bTogRGF2aWQgTWF0bGFjayA8ZG1hdGxhY2tAZ29vZ2xlLmNvbT4KPiAKPiBSZW5hbWUga3ZtX2Fy
Y2hfZmx1c2hfcmVtb3RlX3RsYigpIGFuZCB0aGUgYXNzb2NpYXRlZCBtYWNybwo+IF9fS1ZNX0hB
VkVfQVJDSF9GTFVTSF9SRU1PVEVfVExCIHRvIGt2bV9hcmNoX2ZsdXNoX3JlbW90ZV90bGJzKCkg
YW5kCj4gX19LVk1fSEFWRV9BUkNIX0ZMVVNIX1JFTU9URV9UTEJTIHJlc3BlY3RpdmVseS4KPiAK
PiBNYWtpbmcgdGhlIG5hbWUgcGx1cmFsIG1hdGNoZXMga3ZtX2ZsdXNoX3JlbW90ZV90bGJzKCkg
YW5kIG1ha2VzIGl0IG1vcmUKPiBjbGVhciB0aGF0IHRoaXMgZnVuY3Rpb24gY2FuIGFmZmVjdCBt
b3JlIHRoYW4gb25lIHJlbW90ZSBUTEIuCj4gCj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW50ZW5k
ZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogRGF2aWQgTWF0bGFjayA8ZG1hdGxhY2tAZ29vZ2xlLmNv
bT4KPiBTaWduZWQtb2ZmLWJ5OiBSYWdoYXZlbmRyYSBSYW8gQW5hbnRhIDxyYW5hbnRhQGdvb2ds
ZS5jb20+Cj4gUmV2aWV3ZWQtYnk6IEdhdmluIFNoYW4gPGdzaGFuQHJlZGhhdC5jb20+Cj4gUmV2
aWV3ZWQtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAbGluYXJvLm9yZz4KPiBS
ZXZpZXdlZC1ieTogU2hhb3FpbiBIdWFuZyA8c2hhaHVhbmdAcmVkaGF0LmNvbT4KPiAtLS0KCkFj
a2VkLWJ5OiBTZWFuIENocmlzdG9waGVyc29uIDxzZWFuamNAZ29vZ2xlLmNvbT4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
