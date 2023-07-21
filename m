Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E078EB64DC
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 15:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tgaoe1tD5SU6kEQa8/9u5Np5yIr+wCdLEX4OKzs4LDI=; b=wWwK2h1L4MzrNv
	hGaex+6JBmkvbotU9GT860blTq9SWcfz2wMTlPXvaWo8U/om4B/GrLPTcL7t4BqtmywEfvYYD1Mtk
	BfYiCIzoS9cJ6uCRd5xhBfyCB8FYNhLBUAD7uXinQPV7ymlmfzgsyhMq2NhitKLJ6CuPNV9a120fQ
	l7E5yHK3kFnV5RZUXdDEwn09R/LCkQdip5KF/2SYV3oi/rvPoIEl7ImqYOyNGS2GXNrH6ueMOevte
	hYDoqo7BKzHQAmYtzQ6dTh0zW2q+ZnAGW8Wf+gOnIQFBsHs7xChE0Wr5Ym3Pdd+MabVQ/2Nt5LzNS
	Z+eH8x8Yq4zOEEP1QZuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMroV-00EOsa-2M;
	Fri, 21 Jul 2023 15:13:03 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMroT-00EOr6-0M
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jul 2023 15:13:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689952380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KuECWgmrt4c8ZTlDSWFvVOJXkvdaI59iER7noO41RWI=;
	b=ACJKM0lpqMRDoPycbNRDo96qh8L3SVTz7yMv6yHC/uNz8NR146JasrOlCD9kEeKIAn+tnM
	5zd3RPw1Rtb9ebJBuEPLUFJTedbfpLk4sOsnIv+hLE8UEwLwCDuri1jVjywSQPUub1m1mT
	QhQS1bArsQlLpYGvsSbLqXcsKUOtBq0=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-lZ4-QZnHNFWFRmRrJLtOMw-1; Fri, 21 Jul 2023 11:12:55 -0400
X-MC-Unique: lZ4-QZnHNFWFRmRrJLtOMw-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-4fb7d06a7e6so2073463e87.2
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jul 2023 08:12:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689952374; x=1690557174;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KuECWgmrt4c8ZTlDSWFvVOJXkvdaI59iER7noO41RWI=;
        b=W5Db/kg5BgSiSy5NqmvYeF9FF+s2m2lxjFg/AQq1zfZkIjNW9jPzrcH5/vVVFAcnKN
         kt45QyX5RRmlaJEwr0Yzy6Bx0x7W2oTSTkDTehNEbZRPTiCWfWO9vRlGt26q0ROW2abv
         tAhhPz9hp5bAQSOgIot7UHw29IL59kLvnegI6ZzEQpgMfXTXzJa+yAJyJuuJ3vmuke7O
         0hMUwdUcONbwd1OPv9xe3bnIsl/x3zyVIjCTnXGa8YJCd+NjXwGEttnC1RqGi2dGSX4k
         obpy7Jm9pWdnYXBNKPkUdU7YrHwtrYYyuKY+dDndrnkSWlpeN0KdnL5VWSn3Ah4A6+4m
         8+iA==
X-Gm-Message-State: ABy/qLZBEqiD0KZrWf5i+5Toxsdd31dcEZ2DdecTLuqmp6r7RAlhnem6
	HtKMIPx0qlu54CvIGw4VV0f5NTbqeDfXs76rFdc8u0H6W8vKbrKgJ7ssStml/RKN8vYIkPPK8FH
	NLI2d26e5zfVFGk1gDX+AUNMH+/Gb
X-Received: by 2002:a19:e05b:0:b0:4fb:caed:95c3 with SMTP id g27-20020a19e05b000000b004fbcaed95c3mr1377430lfj.53.1689952374304;
        Fri, 21 Jul 2023 08:12:54 -0700 (PDT)
X-Google-Smtp-Source: APBJJlG7b5XRxViP22WEsYjZVx9eEuQn7vFDvQWd5jPtrRlHnUDSnFTiFx5UF3BQ2XwQWfw7l/MGag==
X-Received: by 2002:a19:e05b:0:b0:4fb:caed:95c3 with SMTP id g27-20020a19e05b000000b004fbcaed95c3mr1377407lfj.53.1689952373968;
        Fri, 21 Jul 2023 08:12:53 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id n1-20020a05640204c100b0051e0f21c43fsm2214094edw.31.2023.07.21.08.12.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jul 2023 08:12:53 -0700 (PDT)
Message-ID: <6519e3f4-7cea-01a6-724e-a0bce10c3c19@redhat.com>
Date: Fri, 21 Jul 2023 17:12:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH v11 16/29] KVM: Allow arch code to track number of
 memslot address spaces per VM
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>, Paul Moore <paul@paul-moore.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-security-module@vger.kernel.org,
 linux-kernel@vger.kernel.org, Chao Peng <chao.p.peng@linux.intel.com>,
 Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 Vishal Annapurve <vannapurve@google.com>,
 Ackerley Tng <ackerleytng@google.com>,
 Maciej Szmigiero <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, David Hildenbrand <david@redhat.com>,
 Quentin Perret <qperret@google.com>, Michael Roth <michael.roth@amd.com>,
 Wang <wei.w.wang@intel.com>, Liam Merwick <liam.merwick@oracle.com>,
 Isaku Yamahata <isaku.yamahata@gmail.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
References: <20230718234512.1690985-1-seanjc@google.com>
 <20230718234512.1690985-17-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230718234512.1690985-17-seanjc@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_081301_427871_46A64A5A 
X-CRM114-Status: UNSURE (   8.41  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 7/19/23 01:44, Sean Christopherson wrote:
> @@ -4725,9 +4725,9 @@ static int kvm_vm_ioctl_check_extension_generic(struct kvm *kvm, long arg)
>   	case KVM_CAP_IRQ_ROUTING:
>   		return KVM_MAX_IRQ_ROUTES;
>   #endif
> -#if KVM_ADDRESS_SPACE_NUM > 1
> +#if KVM_MAX_NR_ADDRESS_SPACES > 1
>   	case KVM_CAP_MULTI_ADDRESS_SPACE:
> -		return KVM_ADDRESS_SPACE_NUM;
> +		return KVM_MAX_NR_ADDRESS_SPACES;
>   #endif

Since this is a VM ioctl, it should return 
kvm_arch_nr_memslot_as_ids(kvm) if kvm != NULL.

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
