Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87D4EEB64DD
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Aug 2023 09:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CKavvjvRplH063udwbuour7JK3YZAsTxN91knDuwlsM=; b=C7+cqMsQryrTva
	wG/PWaP9s7FuEPEbXgKht0rzZKOlrCkr4MxAMtNEa51sSRCJysdbyIlr6CBobKudAy+gQauTeu6rS
	egePNC0pfZF+0i4aOyybKA05NsmPip6gMUso1p6PGGnLsUey15rhuyEYD9EVqLNdGvYBuZCcI5nKe
	C3jiN0qKsHBH8pEgr+sYzcv7lagfwfKaxowmTYPhyqHE/qJnJS4vI+uh8pLD/hSL1LJNbIWP7Uh1t
	8aI/Lh1MziHEt6MiLI8I+YvgtkLzMrnW+BSGzcPA1WlEo0Go0lpYJmz3o28eAejfygWghLKz57DwJ
	JIC4vByzHeJB4ee0qnew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQm65-001glU-1k;
	Tue, 01 Aug 2023 09:55:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQm64-001glH-0d
	for linux-riscv@bombadil.infradead.org;
	Tue, 01 Aug 2023 09:55:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Gm17gZxC0/vm/Jdu3xQH50fn0wnKiSVhKMApv17FsGQ=; b=R7x++HR1cN/mi7PQQuvSOS44CG
	XJElYAt/L5t8FB07hXAddywZvu192mDaveHBXu7nrbk9L04ivjee55h0gpd32HuhveTF//eNR88H5
	dhz1SQcl94dg4LDHc11N77zdH2idDNOxstqZEL3h+EAF51qOcWK9gptxVY+P/ahFkC5uvEcPyjaEK
	qV0av3VfWi3VP+3dqBQwOzK19TLQOYGmv0/xeh6T0FY+duuAdWtS9GH8oBCbTCS4c6pNc0rqc5sMn
	feT/iMv2i3KmD4zJ9GJR05V5w9r4uSIvpuIUXbOeG2BaI5ToEFhfmr1ro7jpRnulO687U9Kwsv+rA
	iocZwrow==;
Received: from mail-ed1-f54.google.com ([209.85.208.54])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQlZh-00DwfJ-0x
	for linux-riscv@lists.infradead.org;
	Tue, 01 Aug 2023 09:21:55 +0000
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5221cf2bb8cso7936302a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 01 Aug 2023 02:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1690881710; x=1691486510;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Gm17gZxC0/vm/Jdu3xQH50fn0wnKiSVhKMApv17FsGQ=;
        b=dq5CAvhQQ+vveH4MSteCM4KpxWqvSjfMuOapn0LnoQqDOErjMIbbWNheVH/uLc2KIf
         UdBwINkexXsFRjBN8poea9hv+4sXzWagYJkGf39toFnDnN3gA3fyjhZTQCaYda/GblQa
         pkw6dcECiAkZW/+Wy1xwLXzUC7d0jC/4tRCVUhI1fyGS501AuV0YVethzHboQgI7CbyL
         M5k4ZKy5NVWRN6++5pgESXlnIknAxtut14Hcvq275w4blo8RZfULkrUqc81+6hPmItwP
         3fxQ350OyrMQNDnLyh3ELg4ylCq9dGO2couVM6uXKHIXQCaUruaeC2pK2fs6kliqSArs
         ZedQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690881710; x=1691486510;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gm17gZxC0/vm/Jdu3xQH50fn0wnKiSVhKMApv17FsGQ=;
        b=VHcK4MiTZISWuQwXjuLwGVNXWla11UGMBHkipekoV2Wb1Xw4au9Pobs68+UPpOsSSt
         Y7fLfOgvfB96BifahMvqDmdPN+c3dGS0u3swbbI7OOai8zVoz5NI/gHm3UFKk+pLw9/4
         vy/rNyWreBHId0Fco7cyr5zK2ruLiZcDXQsYFzivbnYTC5EZ/IUXC68MybZdRjaoB3t5
         Hwy/2TtynVDwy9pJjQaYnABhtkmT3xmBh8km2ubrOTqqn7TenrBaEeU5c0F0ea7Up7CI
         nGiANctr1Rc8x2w/gmTo6vR9s4wHVfYvQcQeJmgt6L6ndbsZOsROcoKaofmUCZWDfjEe
         2WcQ==
X-Gm-Message-State: ABy/qLbnuQygXh9YKbb0DVfYPaSDdveE2wwxc7Hxa1x4DJGa7zsLAo5X
	8s33PLZOkO3mA3WnVgqaA1QdXw==
X-Google-Smtp-Source: APBJJlGhr0BuIoveysf7HtzpSl2Jm+kRbIcFJ2Y03OXcder2XbQzIJjvsXJoXuSOYODVVZsM7UAnIg==
X-Received: by 2002:a17:906:518a:b0:99b:fdbb:31f1 with SMTP id y10-20020a170906518a00b0099bfdbb31f1mr2052678ejk.16.1690881710061;
        Tue, 01 Aug 2023 02:21:50 -0700 (PDT)
Received: from localhost (212-5-140-29.ip.btc-net.bg. [212.5.140.29])
        by smtp.gmail.com with ESMTPSA id m10-20020a17090607ca00b009931a3adf64sm7529760ejc.17.2023.08.01.02.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Aug 2023 02:21:49 -0700 (PDT)
Date: Tue, 1 Aug 2023 11:21:48 +0200
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
Subject: Re: [PATCH v4.1 1/3] KVM: selftests: Add arch ucall.h and inline
 simple arch hooks
Message-ID: <20230801-3ab43c432cbaafcadbffb092@orel>
References: <20230731203026.1192091-1-seanjc@google.com>
 <20230731203026.1192091-2-seanjc@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230731203026.1192091-2-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_102153_433890_5DD92938 
X-CRM114-Status: GOOD (  13.43  )
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

On Mon, Jul 31, 2023 at 01:30:24PM -0700, Sean Christopherson wrote:
> Add an architecture specific ucall.h and inline the simple arch hooks,
> e.g. the init hook for everything except ARM, and the actual "do ucall"
> hook for everything except x86 (which should be simple, but temporarily
> isn't due to carrying a workaround).
> 
> Having a per-arch ucall header will allow adding a #define for the
> expected KVM exit reason for a ucall that is colocated (for everything
> except x86) with the ucall itself.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  .../selftests/kvm/include/aarch64/ucall.h      | 18 ++++++++++++++++++
>  .../selftests/kvm/include/riscv/ucall.h        | 18 ++++++++++++++++++
>  .../selftests/kvm/include/s390x/ucall.h        | 17 +++++++++++++++++
>  .../selftests/kvm/include/ucall_common.h       |  1 +
>  .../selftests/kvm/include/x86_64/ucall.h       | 11 +++++++++++
>  .../testing/selftests/kvm/lib/aarch64/ucall.c  | 11 +----------
>  tools/testing/selftests/kvm/lib/riscv/ucall.c  | 11 -----------
>  tools/testing/selftests/kvm/lib/s390x/ucall.c  | 10 ----------
>  tools/testing/selftests/kvm/lib/x86_64/ucall.c |  4 ----
>  9 files changed, 66 insertions(+), 35 deletions(-)
>  create mode 100644 tools/testing/selftests/kvm/include/aarch64/ucall.h
>  create mode 100644 tools/testing/selftests/kvm/include/riscv/ucall.h
>  create mode 100644 tools/testing/selftests/kvm/include/s390x/ucall.h
>  create mode 100644 tools/testing/selftests/kvm/include/x86_64/ucall.h
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
