Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA6E6C04A94
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 03:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YLxmWRCHCo8H7wIyFwtfUUjNZMs7UZmzL8KDVRG/uss=; b=VRy3qDH3duB6SE
	sf6jplHHh0abm9OPKgtGQAASbOULJEDjfJPbbwPSo7PGz4Zq1Q3w/6wrHRc73LjPzQ3lslL+FJ7FF
	3ib6LKbMsdPEcv4oTTp19tpPeQ9zVc6enO4FuZ8RuDOsjC5Bn0sRU9xphvGyQKI7MzCzYvGzNtzxk
	4LNI4nzGKQOdSFPhtbBsck+NSRN85gmf/2Z4Dv5sOjKSf9prgx+dZoW18+fpBgmcJPfw3LdUSbSVR
	W19IgYVXULH7PtTI300cYrRTPx6v7+QaW4tEdd0yGRy68PzQxiQR8JvHdFIXfEs8V0dmnzI5N5qgN
	AUaxlGjy+O++tySSnqOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUIdQ-009G9o-01;
	Fri, 11 Aug 2023 03:16:20 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUIdN-009G8R-1j
	for linux-riscv@lists.infradead.org;
	Fri, 11 Aug 2023 03:16:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691723776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pxVuMV7NfVels7NbA1UkuP4mEMIntZymXRlB6RKGCA0=;
	b=UnsyHOwkneVM7dx6SCMwpg92cMAEkBIslBnukU7hQaQCYrR7lP6TxIQrywYGkNE2iKCqcm
	97fWROoyKylF6AzaW9MHKyqclPizsfRYEmfg4QSCHzli35Xjf6+9rQho9tHY1Ch/u4MfzE
	4sywXyE3v7QaKczA7/lzybIA+vqMGi0=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-477-N_2-ctZEO-y0BsOVtFkiRQ-1; Thu, 10 Aug 2023 23:16:15 -0400
X-MC-Unique: N_2-ctZEO-y0BsOVtFkiRQ-1
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-1b83410b5b6so2776795ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 10 Aug 2023 20:16:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691723774; x=1692328574;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pxVuMV7NfVels7NbA1UkuP4mEMIntZymXRlB6RKGCA0=;
        b=IPDNG4psqMzYV/uVBMBofi1SNIQR5K1TPLIhQnM4hlJZh7uB3gmuz+i2oAUTjwBjDX
         ESxAs4VMqTPptbOSobUrorLpfGPqGx+lz2JfG0wxLxjn7hNMdYXXTMv0lOetyB5v6qU+
         tO91EL4cv1h52KrD8NvW+2/6GahICX1ScxfoJvEPjdqzmXkKvpcKQ7qrP52hFwtGrhPH
         Kihv68MVtSGo6kBB1Na2Bn/nDtOFHmbFDdvgUaSQClDOj8g9FS9LsU198VJTNQJCDFRR
         mOeOdqbRRTU1Td0bWoJ1ooLwQg3TuL1K5fsN3bbJ7aELQyo1BuGZujgsO1KMBb7rBl23
         OT3A==
X-Gm-Message-State: AOJu0Yyl1M1Qbi7m55pgljs9bDREOVxTmwT1VFBqF+ZgAW18C5OyIret
	6JcljjJcukxStbajYBB7pjYDqof3pxDXe7HDzFQT7Nj4Dz05tDSckDlTbIeoOKY2blrJqnrqNl3
	5O4pCpv+OW7QTMaMLAdsbrLXLFfXC
X-Received: by 2002:a17:902:d4ce:b0:1b1:9272:55e2 with SMTP id o14-20020a170902d4ce00b001b1927255e2mr857231plg.3.1691723774433;
        Thu, 10 Aug 2023 20:16:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHh/vwl3upbeZ36WYfzpIGbtQYzH/ApexffsIYFu0eUp+KR2cyRBkYjBzFNVTGEHb4hVszsqw==
X-Received: by 2002:a17:902:d4ce:b0:1b1:9272:55e2 with SMTP id o14-20020a170902d4ce00b001b1927255e2mr857201plg.3.1691723774115;
        Thu, 10 Aug 2023 20:16:14 -0700 (PDT)
Received: from [10.72.112.92] ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id s88-20020a17090a69e100b00265c742a262sm2400175pjj.4.2023.08.10.20.16.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Aug 2023 20:16:13 -0700 (PDT)
Message-ID: <60a2cc0e-df09-4305-6bfc-25b3d864040a@redhat.com>
Date: Fri, 11 Aug 2023 11:16:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v8 08/14] arm64: tlb: Implement __flush_s2_tlb_range_op()
To: Raghavendra Rao Ananta <rananta@google.com>,
 Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>,
 James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Sean Christopherson <seanjc@google.com>, Huacai Chen
 <chenhuacai@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 Jing Zhang <jingzhangos@google.com>, Reiji Watanabe <reijiw@google.com>,
 Colton Lewis <coltonlewis@google.com>, David Matlack <dmatlack@google.com>,
 Fuad Tabba <tabba@google.com>, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, linux-mips@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org
References: <20230808231330.3855936-1-rananta@google.com>
 <20230808231330.3855936-9-rananta@google.com>
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <20230808231330.3855936-9-rananta@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_201617_661165_0E674829 
X-CRM114-Status: GOOD (  11.97  )
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



On 8/9/23 07:13, Raghavendra Rao Ananta wrote:
> Define __flush_s2_tlb_range_op(), as a wrapper over
> __flush_tlb_range_op(), for stage-2 specific range-based TLBI
> operations that doesn't necessarily have to deal with 'asid'
> and 'tlbi_user' arguments.
> 
> Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> ---
>   arch/arm64/include/asm/tlbflush.h | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
> index b9475a852d5be..93f4b397f9a12 100644
> --- a/arch/arm64/include/asm/tlbflush.h
> +++ b/arch/arm64/include/asm/tlbflush.h
> @@ -340,6 +340,9 @@ do {									\
>   	}								\
>   } while (0)
>   
> +#define __flush_s2_tlb_range_op(op, start, pages, stride, tlb_level) \
> +	__flush_tlb_range_op(op, start, pages, stride, 0, tlb_level, false)
> +
>   static inline void __flush_tlb_range(struct vm_area_struct *vma,
>   				     unsigned long start, unsigned long end,
>   				     unsigned long stride, bool last_level,

-- 
Shaoqin


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
