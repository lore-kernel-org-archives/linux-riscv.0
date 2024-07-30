Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B256C3DA49
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jul 2024 20:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=SD7cN6YPwhnC0engRiUcNxRJWoFml7jDq4aHfeg7pI8=; b=ZqIqWHOcjYCCNeo/OV7SSkACFP
	dWVbEOxIKsoX4JXwMc7NRGT8sjBA9b3OVflhGSbUFzsdPu5VQdyAurF7RKjaUMfhkdWOOrSJCczk+
	Oi54XC2G8KtBWEDzP8CdcjFNVyS2vCYp7uN4cilrMAbCH30n/6xAjQMWZMLYcsLfuB72jtOZDTahy
	fLj285z9aaGVh62z4qFdWYe5JnsKbER9Tx61aa8mhK3kAfG+/8YHaYW+EmbsfsPxHHWyJBu/EgfTp
	7lvdoEJ80ynZ722fLYISVzsYgAI44NRbh7QZh56HcoKtUuDH/rwHId2bhYIHc1G+b9kfahooqRQPZ
	V/APTY7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYtFU-0000000GOrb-1Q80;
	Tue, 30 Jul 2024 20:15:08 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYtFQ-0000000GOp4-2Psu
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jul 2024 20:15:06 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1fc47634e3dso37014295ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jul 2024 13:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722370502; x=1722975302; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=C8yo2cbMxRjf1SYFGiWaoP3WEwWP/CuFq0W0aGvMAlc=;
        b=AZgzCKGhpeAS5u168y5tMvlJ3pcoO1WDVLAyVQ5tJ+Ss22QR7/0cFCBv5paQ1UthIN
         3Minn0sMLo0hmpG0upxKrSVjZqcxFokp12w9P8Y0Ys4/lgurFPAAwpBHNp4UiGkxnMd+
         YB01vltwKR5kHq4fzrOu9rf2uUOBqvM6xM7Q+Q02B73F6X0RsS+ral7c+qBqWusmlki3
         muVhr0t2gTmJ8MEdH42ANgO1zdelbD3Rd9jTGQDB9YMv82kK7+T2VWkAmhrv1SJIwRF4
         YO8t+jBrKAyjcPadFhDghkYoQQAZR0V6VKDFtUM/NK7OOBfJXHtF1GDwgB/vNG7rGJE8
         NqHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722370502; x=1722975302;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C8yo2cbMxRjf1SYFGiWaoP3WEwWP/CuFq0W0aGvMAlc=;
        b=trvaj7WJ6PTY9zoEbV6lYT+Tdi7cXPu2yorcuhKLr2o0OzBZb2bVbTkB2+iq/c5/nl
         A7EKhnbzxS+M51LXWpBsqdJdPIp+Y5lSwL/XhE/U1v8nho1dB/YRIfOYuORU4cSNlOBh
         UL5uePEu0WGwINAxJCqr5Z+g0j5/CfvvdWSXh2czgwb/hIF6Yq4mE0RCurn83VGSf0Jk
         GKVKS6CrGaYyZvWHm6Feo4UOfLXBxoSoXO7swV/jtCqn6DCJegGIbXFoKNz2yD1jVwgq
         QJph7C++mPeQOSbKWFvC20VMRMLo/AvZC888YfpVU49FTDZZhy1M01viXSJ7ZXIXB3FD
         3leg==
X-Forwarded-Encrypted: i=1; AJvYcCWzmVBjB2Gw/1r7aoh5NEdP4Xz2E2/Qxf87qClKcnZBM11gNnLbRBQPI3zORKoZmiflMv1COQTQZ4ovfsq0PXxFXfTMJCZVWg32tS3brpJ1
X-Gm-Message-State: AOJu0YzCzHXuEKYGElwbq1QvdUfcknEOaFTQZjL0zqsRPs7EpxdG2GUm
	MvCo2m5RvNjz+EBO0w31nL3h+VNa5U+r059bwR5ZUPUIbUyh2HrxWCCN7sK0Sy/Y+J1wTsAbq8u
	iHw==
X-Google-Smtp-Source: AGHT+IH9iITYoLB/ZN9Oi4VKGOQu9lhx7HYkDR9WKhrc/jsriwfmp+7ZOuZAysZ686xisdvdjIEEvamlnSs=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:ea01:b0:1fb:54d9:ebb3 with SMTP id
 d9443c01a7336-1ff04828eb3mr5974125ad.6.1722370502109; Tue, 30 Jul 2024
 13:15:02 -0700 (PDT)
Date: Tue, 30 Jul 2024 13:15:00 -0700
In-Reply-To: <63c41e25-2523-4397-96b4-557394281443@redhat.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com> <20240726235234.228822-35-seanjc@google.com>
 <63c41e25-2523-4397-96b4-557394281443@redhat.com>
Message-ID: <ZqlJxJyOdsR206Zc@google.com>
Subject: Re: [PATCH v12 34/84] KVM: Add a helper to lookup a pfn without
 grabbing a reference
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_131504_668542_D4F52F68 
X-CRM114-Status: GOOD (  17.99  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jul 30, 2024, Paolo Bonzini wrote:
> On 7/27/24 01:51, Sean Christopherson wrote:
> > Add a kvm_follow_pfn() wrapper, kvm_lookup_pfn(), to allow looking up a
> > gfn=>pfn mapping without the caller getting a reference to any underlying
> > page.  The API will be used in flows that want to know if a gfn points at
> > a valid pfn, but don't actually need to do anything with the pfn.
> 
> Can you rename the function kvm_gfn_has_pfn(), or kvm_gfn_can_be_mapped(),
> and make it return a bool?

Heh, sure.  I initially planned on having it return a bool, but I couldn't figure
out a name, mainly because the kernel's pfn_valid() makes things like
kvm_gfn_has_valid_pfn() confusing/misleading :-(

> (As an aside, I wonder if reexecute_instruction() could just use
> kvm_is_error_hva(kvm_vcpu_gfn_to_hva(vcpu, gpa_to_gfn(gpa)) instead of going
> all the way to a pfn.  But it's ok to be more restrictive).

Heh #2, I wondered the same thing.  I think it would work?  Verifying that there's
a usable pfn also protects against retrying an access that hit -EHWPOISON, but I'm
prety sure that would require a rare race, and I don't think it could result in
the guest being put into an infinite loop.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
