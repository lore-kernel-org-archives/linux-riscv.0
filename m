Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 757FFCD4F2F
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Nov 2025 04:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2bOU3xNytqgj5jqi+BODmFVSR1Vx4+5spBxgsePo1jA=; b=VeP8WPZBEBoPJc
	mYqqRrojvYeYCQ47wY6pQxmbZJvF7uY03b5sxtl6Cxgz1Mrx7uvxOIThRh8QazJ58iFBP/DH09qJK
	vhDFT6Zj8Zi+MDUa3g5vTddWTgxeJ9e/0VtBBRrQkYUsZGghhY/FMF3/6iwa12c4sFtYts58P0qkq
	KmRaydt96eCPFeeg6jmCefnXnyguSquK8GrltmPkJ4tyDbfOTmIqbkVpGfKUMPuRo5vDlTVmOuJwv
	RFKWLHdGg2mx24/iWr7qxxtqMye0dpEqpe0Fstu7b74T7pTz5MUhpb0ognUk1RQmg/L49FcD/smJD
	4ej5KmCxKLN6hFdsX38g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJOas-00000009s0W-1mZx;
	Thu, 13 Nov 2025 04:05:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJOap-00000009s07-0uGM
	for linux-riscv@lists.infradead.org;
	Thu, 13 Nov 2025 04:05:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 97842150C;
	Wed, 12 Nov 2025 20:05:43 -0800 (PST)
Received: from [10.164.136.41] (unknown [10.164.136.41])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 549963F63F;
	Wed, 12 Nov 2025 20:05:44 -0800 (PST)
Message-ID: <633b4702-f7fa-4ea5-a428-d120191f620f@arm.com>
Date: Thu, 13 Nov 2025 09:35:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/22] mm: replace READ_ONCE() with standard page table
 accessors
To: Samuel Holland <samuel.holland@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
 linux-riscv@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, linux-mm@kvack.org
Cc: devicetree@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>,
 linux-kernel@vger.kernel.org, Mike Rapoport <rppt@kernel.org>,
 Michal Hocko <mhocko@suse.com>, Conor Dooley <conor@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>,
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>, "Liam R . Howlett"
 <Liam.Howlett@oracle.com>, Anshuman Khandual <anshuman.khandual@arm.com>,
 Lance Yang <lance.yang@linux.dev>, Wei Yang <richard.weiyang@gmail.com>
References: <20251113014656.2605447-1-samuel.holland@sifive.com>
 <20251113014656.2605447-3-samuel.holland@sifive.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20251113014656.2605447-3-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_200555_303531_E38A3446 
X-CRM114-Status: UNSURE (   5.98  )
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


On 13/11/25 7:15 am, Samuel Holland wrote:
> From: Anshuman Khandual <anshuman.khandual@arm.com>
>
> Replace all READ_ONCE() with a standard page table accessors i.e
> pxdp_get() that defaults into READ_ONCE() in cases where platform does not
> override.
>
> Link: https://lkml.kernel.org/r/20251007063100.2396936-1-anshuman.khandual@arm.com
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> Acked-by: David Hildenbrand <david@redhat.com>
> Reviewed-by: Lance Yang <lance.yang@linux.dev>
> Reviewed-by: Wei Yang <richard.weiyang@gmail.com>
> Cc: Dev Jain <dev.jain@arm.com>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
>
>   

Reviewed-by: Dev Jain <dev.jain@arm.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
