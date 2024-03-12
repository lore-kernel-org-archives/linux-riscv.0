Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D301BC54E49
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 04:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fgJ74rYjdBBpHKUKQ0dACzGZrbLZolfl9I9Mf0/Zfhw=; b=Y9lkPa/GfpOyFc
	btS1+mfwIdPYt6M3yhEIx0SiHdmc4hLDaOzuquCqan5aocLN0o6pAM845HBsUbMh684WlgITF8KO6
	2CLtJD2u//oP5uyyxxB4OJX7SqJI4xaNlH/g21nid9Uo9TtneWOVey8KkpXbpMb+46yADNwz0pEJ7
	Y3cuzmkKL1fTl6zFod0qsWM7jACusVJrmOZprkxm5HkGZ3Ec3N2Sq3ePK697DMRjw5I6JpvmoveTo
	auXv+cxQk9xFmF64tHI1F6UWnylas1YzM4c8YHnJuO1xp/I39aT1rqZrF1f5/cwceDhbYGGAA3CkA
	qvqr1d3jm8JoSPq10ZGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rju5J-00000004JTu-1V9c;
	Tue, 12 Mar 2024 04:49:53 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rju5G-00000004JTC-0thL
	for linux-riscv@lists.infradead.org;
	Tue, 12 Mar 2024 04:49:51 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-78831914027so151979085a.1
        for <linux-riscv@lists.infradead.org>; Mon, 11 Mar 2024 21:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710218987; x=1710823787; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rIABD3xrOV6lbD0atPCna5W6iLuX8k+wmWPwoUXIcbE=;
        b=CrePXZ6hy1udL45Lh8RLvx8epXlP5bvZzwM9u5XQtrb2fEiXUSmwuLd7mS7y7ty71Y
         P+Cv5P4o3opc9WkRnBOEDxpA6GB/JmfeY8ZQPvFNF2fZb4PCCx5RMYyShoWwHXNNIuw7
         K5ETsbdeLcMSH69XFpa9UPEnzjgQ6bHUys2plJQPatInKxN1AVdFzgEkPnRBYlInOoPr
         khk19+n/4SPxby9I3dg+B6e9iyNVfLDDOmp/DyV+2mnKVUPjtkBXrX/Ro0LUH+kiTGZ/
         2UKTGbxxiLf8sKmx5Lotd+BDE0zLPoHB7T2/Z+XfVnxCkrMyMWqvJQSr4CKSk3Nsch8S
         o6SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710218987; x=1710823787;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rIABD3xrOV6lbD0atPCna5W6iLuX8k+wmWPwoUXIcbE=;
        b=aoFZDpNKRIC1L1Qtdt0Gom2bOciqPr85rXMflDJtzBkovunWohK5QYJfhQE+YIFiV9
         tjfLOep/A38hI7q2uYO2GeQbfnVI34CSZGPu/g+Thn0gNGDhBAewPnrsmZ67EI0ZqXEf
         ApaTVuzumbYQJOSGwFhsnuIs/2bAwbT8fuPy+haHqsOFbHL7VeV/UPVjJLq0A03EMvU0
         UE3R6UBeOJUr4kW/rhK/k7KAGTM8hailQB/8+308IkqubJEg/l6ZLJ0NBifdZZOI3ZL5
         92xVD3C7FNmROqkfGZQ2GhZyqjC+02XXFOnR442rFypcNJedLZ/RTAtq059dwCc7u6HC
         iaXw==
X-Gm-Message-State: AOJu0Yx4hJzTlKBFRz53xaxnsOY6SID2YMtbdYxa8E518W9e4p0AKZtm
	VJ9wPvPJtWxmt/wulKqQA/Zni8VdhBrvzA+DMzEhKl6JXY8BQshpvDmrdo7jQHE=
X-Google-Smtp-Source: AGHT+IFA/O4DSQ/zBGau35l/jeDYdumQhEHGFW7M+UkysrJ/TnlWi2Zj0tf1HE71XMAQ4yLj/76Ypg==
X-Received: by 2002:a05:620a:3b81:b0:788:2525:d2f1 with SMTP id ye1-20020a05620a3b8100b007882525d2f1mr9200241qkn.65.1710218987012;
        Mon, 11 Mar 2024 21:49:47 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.8.176])
        by smtp.gmail.com with ESMTPSA id a2-20020a05620a16c200b007887d30dbb7sm188891qkn.60.2024.03.11.21.49.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Mar 2024 21:49:46 -0700 (PDT)
Message-ID: <e3a0ecb1-5fb3-4330-8490-2d113a06b85e@sifive.com>
Date: Mon, 11 Mar 2024 23:49:45 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/4] riscv/barrier: tidying up barrier-related macro
Content-Language: en-US
To: Eric Chan <ericchancf@google.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 conor.dooley@microchip.com, parri.andrea@gmail.com,
 emil.renner.berthing@canonical.com
References: <20240217131206.3667544-1-ericchancf@google.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20240217131206.3667544-1-ericchancf@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_214950_342945_4BBB75A6 
X-CRM114-Status: GOOD (  14.23  )
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

On 2024-02-17 7:12 AM, Eric Chan wrote:
> This series makes barrier-related macro more neat and clear.
> This is a follow-up to [0-3], change to multiple patches,
> for readability, create new message thread.
> 
> v5 -> v6: [PATCH 1/4] let this change to pass review by checkpatch.pl
> instead of overwriting again in [PATCH 4/4]. for [PATCH 4/4] change
> the error message example in commit message to make it more relevant
> 
> v4 -> v5: [PATCH 3/4] __atomic_acquire_fence and __atomic_release_fence
> omit-the-fence-on-uniprocessor optimization, and fix the typo of
> RISCV_RELEASE_BARRIER when spliting the patch in v3.
> 
> v3 -> v4: fix [PATCH 1/4] commit message weird line breaks and let
> [PATCH 3/4] fix the form that can pass the checking of checkpatch.pl.
> 
> v2 -> v3: split the patch into multiple patches for one problem per patch.
> Also review the changelog to make the description more precise.
> 
> v1 -> v2: makes compilation pass with allyesconfig instead of
> defconfig only, also satisfy scripts/checkpatch.pl.
> - (__asm__ __volatile__ (RISCV_FENCE_ASM(p, s) : : : "memory"))
> + ({ __asm__ __volatile__ (RISCV_FENCE_ASM(p, s) : : : "memory"); })
> 
> [0](v1/v2) https://lore.kernel.org/lkml/20240209125048.4078639-1-ericchancf@google.com/
> [1] (v3) https://lore.kernel.org/lkml/20240213142856.2416073-1-ericchancf@google.com/
> [2] (v4) https://lore.kernel.org/lkml/20240213200923.2547570-1-ericchancf@google.com/
> [4] (v5) https://lore.kernel.org/lkml/20240213223810.2595804-1-ericchancf@google.com/
> 
> Eric Chan (4):
>   riscv/barrier: Define __{mb,rmb,wmb}
>   riscv/barrier: Define RISCV_FULL_BARRIER
>   riscv/barrier: Consolidate fence definitions
>   riscv/barrier: Resolve checkpatch.pl error
> 
>  arch/riscv/include/asm/atomic.h  | 17 ++++++++---------
>  arch/riscv/include/asm/barrier.h | 21 ++++++++++-----------
>  arch/riscv/include/asm/cmpxchg.h |  5 ++---
>  arch/riscv/include/asm/fence.h   | 10 ++++++++--
>  arch/riscv/include/asm/io.h      |  8 ++++----
>  arch/riscv/include/asm/mmio.h    |  5 +++--
>  arch/riscv/include/asm/mmiowb.h  |  2 +-
>  7 files changed, 36 insertions(+), 32 deletions(-)

For the series:

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Tested-by: Samuel Holland <samuel.holland@sifive.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
