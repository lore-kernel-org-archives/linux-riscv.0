Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F17EFECAAD1
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Aug 2022 04:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NeAjiImhTYkzEtPNRS9DIuSF8zR8wTHZ39bYuvPB1PE=; b=mP/H5gWG5VUCkc
	MoZhf7O+1KihJc0jqhwIwqhrpnD+EPdtOy7+IOzYr7rc2GQJpLAvAaikBxdp9WOSNNonDWzHCEaaj
	DyiBL7crsTXvN/sjfCAQ2NAcws/ba18+bVlpijv61DfxA3M0pmH71JStafO8oHmYMk10XzrfalXNL
	go+4C4fs60ttIFGB2ZhfmNFiMjArnUMsrm/gS6NoJ4rNuDFc7o+OexWZocG5W9NpqZbHGQ9YhXPB5
	xk4OC9PGY95/q6Hpn4qjCVe9hmazqFP7TNwOlLb2lXpnmrxrLPsIV5yzHGF34q2WHghvCkwM1ICht
	BtQLQcgksLt5iU3Ee51A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSsqH-00Dzkv-1M; Tue, 30 Aug 2022 04:27:13 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSsqD-00Dzif-Vg
	for linux-riscv@lists.infradead.org; Tue, 30 Aug 2022 04:27:11 +0000
Received: by mail-pj1-x1030.google.com with SMTP id n65-20020a17090a5ac700b001fbb4fad865so10651321pji.1
        for <linux-riscv@lists.infradead.org>; Mon, 29 Aug 2022 21:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=tveQCNdrcl8zzZ90FYJSAQp/xoPHwNHO3f5B145IGDY=;
        b=jz5ryMUneNPtN7GgAbdob+y42sDrVxRuBlqA3QA9oeD1pieZtFXjP021CLo/r+B8bv
         MYbJ7ecSXA82j8N0LGSRSWGBEUhc3gl753fZP/eq9G6cgLilZiGUBe9U0WkOOEPuzjZF
         1K3HPtO4P5guX5tEHivGDwt+5tsoSrBpSv2YMAohOLencXK9GT5KAEjxZPzgLhtXs8hu
         gQg912iU7/NlDTQXrg/CEmP/aR5c+40JbNsB0FzAY+4nR+pg565IYviyzm5c/PrLrHLt
         42P316IO38WW173exoDa9F/uBYTC0uVc+zDhMVmIYiRyS2CFUFzmi4Iwz9ul83sq02Yi
         qJsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=tveQCNdrcl8zzZ90FYJSAQp/xoPHwNHO3f5B145IGDY=;
        b=v4XzsZ5wcw+9PSoATksfxUniOGmCdpgMiGs/+0zPJMscbxsLSUihx5fU1NHO1FmmxV
         vp4WdiSFSWIoX5pd+hliaLeRP/Tbi4ga4q/QKlGx+wuIFaLotwQ0U4iTivxgqnyDJbRZ
         YZDrRlhRO2GJPlo9f0YiV6O5lMuAojwt8XEIR3v2c4b5n7OVpBPEPi5z39P9iSy/mIe0
         SDzNtx/ZTrdqoFcdhCGV4Q2sMHRbw2yerlhgEvDfplZrJZhh4Y1n/CN/6V9sHdQp8yEn
         GJz389e1Z5oLtnzuUurT+JWcCc48Rmmy4YACmt6aSSdvRDo7zHgzTF0DL5wAbzfX+uhi
         EYCg==
X-Gm-Message-State: ACgBeo2tPapLLPfBAptggw3QRT8tepO452Mz9KSm7uZ4QKQKl0lMfvrL
	56Sg7gCkedmjPvVIQe02w7DCew==
X-Google-Smtp-Source: AA6agR6j3CrMGk4TPMCPwBvaE51o8QHOWIUKsxAkxuonGlXOsZKabqIh/v6aYfhgn/tTEr+AwX2Jlw==
X-Received: by 2002:a17:902:efca:b0:174:c901:aa8d with SMTP id ja10-20020a170902efca00b00174c901aa8dmr7736459plb.164.1661833628777;
        Mon, 29 Aug 2022 21:27:08 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id nm21-20020a17090b19d500b001eee8998f2esm7541792pjb.17.2022.08.29.21.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 21:27:08 -0700 (PDT)
Date: Tue, 30 Aug 2022 04:27:04 +0000
From: Sean Christopherson <seanjc@google.com>
To: Andrew Jones <andrew.jones@linux.dev>
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
	Oliver Upton <oliver.upton@linux.dev>,
	Atish Patra <atishp@atishpatra.org>,
	David Hildenbrand <david@redhat.com>, Tom Rix <trix@redhat.com>,
	kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.cs.columbia.edu, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Colton Lewis <coltonlewis@google.com>,
	Peter Gonda <pgonda@google.com>
Subject: Re: [PATCH v5 7/7] KVM: selftests: Add ucall pool based
 implementation
Message-ID: <Yw2RmCujuaOczFTY@google.com>
References: <20220825232522.3997340-1-seanjc@google.com>
 <20220825232522.3997340-8-seanjc@google.com>
 <20220829163627.qbafyl4qz5cxxue5@kamzik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220829163627.qbafyl4qz5cxxue5@kamzik>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_212710_089535_A1EE779E 
X-CRM114-Status: GOOD (  12.01  )
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

On Mon, Aug 29, 2022, Andrew Jones wrote:
> On Thu, Aug 25, 2022 at 11:25:22PM +0000, Sean Christopherson wrote:
> > +static struct ucall *ucall_alloc(void)
> > +{
> > +	struct ucall *uc;
> > +	int i;
> > +
> > +	GUEST_ASSERT(ucall_pool && ucall_pool->in_use);
> 
> ucall_pool->in_use will never be null.
> 
> > +
> > +	for (i = 0; i < KVM_MAX_VCPUS; ++i) {
> > +		if (!atomic_test_and_set_bit(i, ucall_pool->in_use)) {
> > +			uc = &ucall_pool->ucalls[i];
> > +			memset(uc->args, 0, sizeof(uc->args));
> > +			return uc;
> > +		}
> > +	}
> 
> nit: blank line

Got 'em.  Thanks for the reviews, much appreciated!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
