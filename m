Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D5BDEDE99E
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 10:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RY74xrAFctTNiO2PQ/m/40UgJ5T9XQuy8zQxoq9i6SE=; b=ApBUWHhevgoFFR
	vhwPJ2Tbs4AwmNpy0JAK4NQk7qI+zevrgrfcO88iAAKmb52D3uSa+9cvspnOR5U4Gc9FXvm/aJlIk
	m44QiJHn/noEHXcLGOGeGT0SK9k/9NkCA6I36irLb0b95p3u7kL7wxvJdn3iFRaxxOzkj7SzdkL+5
	IMMGUYO83/5GU4fbBAclpNtVcztATd7HvlUFe/8F77fmsx1pChHwofrbg+NYVUfL75Cc4yS4G3fXi
	1iCAP7dL4N1M6gwO4BXraF64la8WQro/tNo8zIutbMBJJW4lb8FmiW1M1qbD9Pa6kBw500jIa0hKW
	g86XkIwGL06sUnVN4Kow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgjO9-007xWJ-2W;
	Thu, 14 Sep 2023 10:15:57 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgjO6-007xUv-1s
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 10:15:55 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-31fa666000dso660004f8f.2
        for <linux-riscv@lists.infradead.org>; Thu, 14 Sep 2023 03:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1694686553; x=1695291353; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VyIjI/I6fiuQb5fro76kkYxOSc4xq/0TuIo+mtjDBWI=;
        b=NylWS/Y52di0etaXCFAkV508A0buHJdp9ja4MuNhnNmSfiejb/No9GcQLTrb1HyJSM
         ZS6r0klUcS5iRPZBvQxlBEqclB50jO8r54BN3jGvJHAMPLSKCb4sieX3SdBC6a7C+2PN
         1aRW99fx5LjRx4yNeE9qEIB2T2p+F7bec96Pu1xis24bxNfs886qQFAXQihd7kCoQ3ZN
         jqH/+L8KjdQR+IwZxUilRDvMGmIlrLqdHg/LOYMJmrK1f59kiqknMmN5tfsldQf9Fwrr
         9Y48Fh+Y6EuxmUcM7Xm9YAWut3fRkZcwoGiwgk5i6JjQQ6TB0mLXUphwD+MJW1CKZ/bK
         lyIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694686553; x=1695291353;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VyIjI/I6fiuQb5fro76kkYxOSc4xq/0TuIo+mtjDBWI=;
        b=DFzVlmlCoJlPJTDXk+YyCqY0Hitu7fYYAuR/Yas2MexMdOgOwLVut59czHJLQYzW0B
         j9mBQaFcb2l2ASIGcaZrPr290GTii+wSxsBJ9OT5/zyRdxTB3QKw9D39VdfgUkHovNgm
         Hro2KAYSxgEUKoW66Nlk2egyRQXXichWTmrEfHdJnOXoCOAHzGWj3ke78jYGXElHs/ad
         BMu88aCitiYJj9HvQSuXUeWZfYt6wPYgK9OlXGsEVfkKEcjcb1zUxnMqcCvN24uSlaef
         LBSODFRJqgetxber4gI8MnKlQmcmF6pUaDbn3qI45jwFs2iolzu5x9MaIZB0l/AsWVMc
         SMZQ==
X-Gm-Message-State: AOJu0YzXm7Jq4oZ2Ep3PTUPi0JkSS3clwMl+g03JNHChi2qXmo1a0MRd
	WIJJ27YE9jAWZakwfuapZQTc0A==
X-Google-Smtp-Source: AGHT+IH7ZT746JOyiS+eOvZlolhRQEl4EX2Lm6S0kGQOnu5nvVuWeFGDXcIG88aW5kDFIAcnKh6/BQ==
X-Received: by 2002:adf:d0c3:0:b0:31a:d2f9:7372 with SMTP id z3-20020adfd0c3000000b0031ad2f97372mr4347143wrh.29.1694686552802;
        Thu, 14 Sep 2023 03:15:52 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id k8-20020a5d5248000000b0031fc4c31d77sm1340310wrc.88.2023.09.14.03.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 03:15:51 -0700 (PDT)
Date: Thu, 14 Sep 2023 12:15:50 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Haibo Xu <haibo1.xu@intel.com>, xiaobo55x@gmail.com, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Sean Christopherson <seanjc@google.com>, Ricardo Koller <ricarkol@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Vipin Sharma <vipinsh@google.com>, David Matlack <dmatlack@google.com>, 
	Colton Lewis <coltonlewis@google.com>, Aaron Lewis <aaronlewis@google.com>, 
	Thomas Huth <thuth@redhat.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v3 9/9] KVM: riscv: selftests: Add sstc timer test
Message-ID: <20230914-2232dea1c6d03fb5985755e6@orel>
References: <cover.1694421911.git.haibo1.xu@intel.com>
 <64e0637cd6f22dd7557ed44bd2242001e7830d1c.1694421911.git.haibo1.xu@intel.com>
 <20230914-ee133dd5e804282ce28833d6@orel>
 <20230914-reflector-preshow-786425ad7ae2@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230914-reflector-preshow-786425ad7ae2@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_031554_642903_12ADDA73 
X-CRM114-Status: GOOD (  13.44  )
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

On Thu, Sep 14, 2023 at 10:52:15AM +0100, Conor Dooley wrote:
> On Thu, Sep 14, 2023 at 11:36:01AM +0200, Andrew Jones wrote:
> > > +static inline void cpu_relax(void)
> > > +{
> > > +#ifdef __riscv_zihintpause
> > > +	asm volatile("pause" ::: "memory");
> > > +#else
> > > +	/* Encoding of the pause instruction */
> > > +	asm volatile(".4byte 0x100000F" ::: "memory");
> > > +#endif
> > > +}
> > 
> > cpu_relax() should go to include/riscv/processor.h
> 
> Can the one from asm/vdso/processor.h be reused, or are there special
> considerations preventing that?

We'd need to copy it into tools/arch/riscv/include/asm, but it could be
done. Hmm, now that I look at it, I see we're missing the barrier() call
in this kvm selftests version.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
