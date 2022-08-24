Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A99C00140
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Aug 2022 15:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ECeMUjCFrz3+zCdqRTIihALq4Ty/ligkNbOWxvW8Qyo=; b=UZEyrggVyspY7B
	gFypWQSZyfIV4k9DDGqaIG4DoIb4unxCrnXy7HvbvUHkUk1XXj+7MxF8laU2DUi9OdrRENr4afo2D
	G3dVTXZY2/QiKQ4w/IWrBByGFsfstcpkd6Q4REJgm8V/8McOO0wg8pHVnT56jVIFE6lrlXfykPzw+
	ax+X44DNdRVWRj10J8YVz/VdkYYDYkVShLgpdwdAwtWoYMoxTFmIH/hHzzU/idRRNrugeBpA7+fuO
	hyUTITN035ZXcGkLY9ukOaZeWQTShRhCOfYULsIB8/IgSIl2ypV7jonNUFTmkTrl/ugsr9i81eTY6
	thmxsgMDsOiETgFwDS0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQsMd-00E4YF-7Q; Wed, 24 Aug 2022 15:32:19 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQsMa-00E4Uf-Qo
	for linux-riscv@lists.infradead.org; Wed, 24 Aug 2022 15:32:18 +0000
Received: by mail-pg1-x52f.google.com with SMTP id w13so10262160pgq.7
        for <linux-riscv@lists.infradead.org>; Wed, 24 Aug 2022 08:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=UZnSHBhLdMOKtTsvoHUMcnhpm7mRfzt47Yx1rwe6TYo=;
        b=ZLLZ1sQgjDCQZCR6iPbiV+dqJNVFlqF98MJZe+fMBspnKcQ1UNH5o3QOOx9DF7zBKA
         4NTZQU8BcU6LZoqrr74W5W2rChziUMwFRSTTGrC513hiwIJ39DS6AjzTbmueQdO2STE0
         t09KkGjDmYbiMqWw8kicU5n4mAAvwqsvfR4L8kRTE4YxLV1mXG0u1f2lpXeh4xy6gdFe
         Wv/tpw2JwZvjKVZthEj5z4x1vSTS+evVhLMdntp8ICLZ2wM3nwRTCYJP9MatbCfSirsX
         fcVMxPNOyrjAZQmeXvPefg+H+k8Jj7MzekfI//odudIng7UsH3Qp7cbIUqf69180zIUj
         AbYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=UZnSHBhLdMOKtTsvoHUMcnhpm7mRfzt47Yx1rwe6TYo=;
        b=XqTxBt0XR+9f2nO5zd5HbVz3I6MmiDzrKlltAZLsaa7V21IhcNQmlwFogUXPSdVTs2
         SdEKHbIKjWjDC643RAqGzCDji7ADMH76FqQETSjjUaUhRZoytPZFlZGPk4ZiIqNJZG0z
         jyTZsgBVZodiOLDEvjcbEfQKGocGa/SaYl9qfMNpnGR88gAaoo8KuItSD3ANNTyTlTXm
         +sQxWMNU5bfR/BByaeSghpFs5xP+wOrugFv7n1bXrHAueZ49Yd68kBuIujHgApuL5K1k
         VOASycXJ3zoMCDKthP4TKpAwIICUpMA1hhf1huuHCHmlQE2uTtzakoRAOxUz5h3bLwaR
         u7VA==
X-Gm-Message-State: ACgBeo1wxGDt/JJ3tQPZtJsUGRtfV+7XLJAMMh61IbMzNYwAuGbKpsqK
	rMJq0tBNFqpfQrUxjEmsJBOlNQ==
X-Google-Smtp-Source: AA6agR5QWDXsHQ6VWlCNVAAXtH2sA1tM24WXPqXY0c9+lwwnmRBfulv0M4b7+RjikXl1y2MhtN3W7Q==
X-Received: by 2002:a63:8343:0:b0:42b:3b1a:89f6 with SMTP id h64-20020a638343000000b0042b3b1a89f6mr859171pge.26.1661355131607;
        Wed, 24 Aug 2022 08:32:11 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id d5-20020a17090ad3c500b001f53705ee92sm1567101pjw.6.2022.08.24.08.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Aug 2022 08:32:11 -0700 (PDT)
Date: Wed, 24 Aug 2022 15:32:07 +0000
From: Sean Christopherson <seanjc@google.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	James Morse <james.morse@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Atish Patra <atishp@atishpatra.org>,
	David Hildenbrand <david@redhat.com>, Tom Rix <trix@redhat.com>,
	kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.cs.columbia.edu, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Colton Lewis <coltonlewis@google.com>,
	Peter Gonda <pgonda@google.com>,
	Andrew Jones <andrew.jones@linux.dev>
Subject: Re: [PATCH v4 5/6] KVM: selftests: Make arm64's MMIO ucall multi-VM
 friendly
Message-ID: <YwZEdzHtWEfCpr7B@google.com>
References: <20220824032115.3563686-1-seanjc@google.com>
 <20220824032115.3563686-6-seanjc@google.com>
 <YwY9BYDUeiT87/Vs@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YwY9BYDUeiT87/Vs@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220824_083216_885393_7815CF00 
X-CRM114-Status: GOOD (  15.78  )
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

On Wed, Aug 24, 2022, Oliver Upton wrote:
> Hi Sean,
> 
> On Wed, Aug 24, 2022 at 03:21:14AM +0000, Sean Christopherson wrote:
> > +/*
> > + * Sync a global pointer to the guest that has a per-VM value, in which case
> > + * writes to the host copy of the "global" must be serialized (in case a test
> > + * is being truly crazy and spawning multiple VMs concurrently).
> > + */
> 
> Do we even care about writes to the host's copy of the global pointer?
> I don't see how the host pointer is used beyond serializing writes into
> a guest.
> 
> IOW, it looks as though we could skip the whole global illusion
> altogether and write straight into guest memory.

*sigh*

This exact thought crossed my mind when I first looked at this code, but somehow
I couldn't come up with the obvious solution of using a temporary on-stack variable
to hold the desired value.

Something like this should work.

#define write_guest_global(vm, g, val) ({			\
	typeof(g) *_p = addr_gva2hva(vm, (vm_vaddr_t)&(g));	\
	typeof(g) _val = val;					\
								\
	memcpy(_p, &(_val), sizeof(g));				\
})

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
