Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FC18C0015E
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Aug 2023 10:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p2A7dpBLCnqG8Q04VmgzMPqEVqF0mHWnGM3dh13gWPg=; b=3ns8C/85LPdgD4
	GklNjsmI0C+a/oN/1dUNxG0ApgHyVTB+CYx954EnbVduwfasBsJz65xUKMPfaFvY8KatE8oyRwSfJ
	I0bGJl10qiKOMrLdEnjbmFhGWDQ1OwKyPrJGIkwkFz7LtsGb+sVliPKte0SWVnpteni2bqeixhzxF
	soMwHxo88l5C6N/KCWra7mPAnJ2H5EB+b0VufX22N0kdb1cuOC4uE/GiZbb0ZPvJA07mLCR1RXoM8
	bEMqSU89e9+2BSarOzuwa4KymB1VIYO4QktlsevtaDIyMM929lNWKMdTW4tt/YhgkYDHUaKhhejpr
	b7qP09jZS4xwPg0LrK6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQmdz-001wuK-1t;
	Tue, 01 Aug 2023 10:30:23 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQlft-001NVB-01
	for linux-riscv@lists.infradead.org;
	Tue, 01 Aug 2023 09:28:18 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-307d58b3efbso4825123f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 01 Aug 2023 02:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1690882095; x=1691486895;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Myyg/9EMvFaXxS0MQuf9oic0JS5pwyGRhUlLiVOQ7cg=;
        b=fiB1wNrdMVHOV+Hak5tY6/WQeG2/xMh3JW+Er/7GZgEk315r4eu5iJ/jskxB51W/7A
         yIo5/hHp2ororTYGxYyJUci5NAE1XhuUNXirOl94zXiEi4OstiUT/0IB6A+3+2eXbsTY
         GPoVQljWS+qj9eDAdXS+SN7qtmXKc4mUdsYBO8FVrGkwysv8cVzWEewINLtbZg6rn1qb
         NAwbLLIM1NL2ICG95xvxohwTQ4wb/b/VFW98inOPDafQPy5vKamBSa6vaGXQTiGWQg09
         7SypcNoiUlhGVLU9kcEP3GvBBe33qWxKJNLJgBwdP/J5ipmt4a3RMq51c9yrKSxx0W3p
         yNaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690882095; x=1691486895;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Myyg/9EMvFaXxS0MQuf9oic0JS5pwyGRhUlLiVOQ7cg=;
        b=cVLiAzXGGjQhFSmvihJpRuvXhxrAVSDDh4bDgTx94gSzUeOgxiE8rogMeuawjsjaBm
         hKmrOEWzWApy8hTtZcsSQ++Gi01lqyoW3romWKasLCcjT1sZL/jQ5YROYBp1mGgH5gOQ
         wQpqUGgowNmRDx5K1tJJX1VGduAyygdo781meU3rSbfepmRF2nQARPXt283zUN0akuL2
         haVCs+gGRjd3DneOKeFdboraBTtVOIUWJ1FG8Lq/wZD1PVuO8HpChoiRFe9E5DsKBA8t
         BgE3eU8PjacbBsZRTW5rdlZwAOu3zLsG9pF4GtSTyb7HQwNpCEmtwU7PKh/sVHFv39xc
         iKyA==
X-Gm-Message-State: ABy/qLY5UC0sko1430aVJN+tvAV2ofK6rliDZYYCVKuRrSSzeUOmFqQ9
	30VdW2E087rJPNjmhbl56A9A1aEmS1FkBCNfcI8zqA==
X-Google-Smtp-Source: APBJJlGm6uA+LAnVlBtxIfLwMvjWRv2Gwia6HLAVmhzKy7IakWIq/kLqxEYhBEJoOBpXfLEql9cNOA==
X-Received: by 2002:a17:906:768d:b0:993:e691:6dd5 with SMTP id o13-20020a170906768d00b00993e6916dd5mr1914773ejm.7.1690881728816;
        Tue, 01 Aug 2023 02:22:08 -0700 (PDT)
Received: from localhost (212-5-140-29.ip.btc-net.bg. [212.5.140.29])
        by smtp.gmail.com with ESMTPSA id x20-20020a1709065ad400b00988be3c1d87sm7375676ejs.116.2023.08.01.02.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Aug 2023 02:22:08 -0700 (PDT)
Date: Tue, 1 Aug 2023 11:22:07 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Aaron Lewis <aaronlewis@google.com>
Subject: Re: [PATCH v4.1 2/3] KVM: selftests: Add #define of expected KVM
 exit reason for ucall
Message-ID: <20230801-121c649de93d2bcd54af14c4@orel>
References: <20230731203026.1192091-1-seanjc@google.com>
 <20230731203026.1192091-3-seanjc@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230731203026.1192091-3-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_022817_045198_3A7A4A80 
X-CRM114-Status: GOOD (  10.42  )
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

On Mon, Jul 31, 2023 at 01:30:25PM -0700, Sean Christopherson wrote:
> Define the expected architecture specific exit reason for a successful
> ucall so that common tests can assert that a ucall occurred without the
> test needing to implement arch specific code.
> 
> Suggested-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  tools/testing/selftests/kvm/include/aarch64/ucall.h | 2 ++
>  tools/testing/selftests/kvm/include/riscv/ucall.h   | 2 ++
>  tools/testing/selftests/kvm/include/s390x/ucall.h   | 2 ++
>  tools/testing/selftests/kvm/include/x86_64/ucall.h  | 2 ++
>  4 files changed, 8 insertions(+)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
