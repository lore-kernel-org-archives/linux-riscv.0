Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A995EC43458
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jul 2026 05:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Zsdt0IZdoNDyfXaB1FaEFp3y9HXOWkCxqw/8VM02Hs=; b=PAarWDCKppUevB
	GZVfWjod1rbSayCvjdR6spLlPosdZKmza+0aNMajXdsWgsAHn+iaFNu2tXPP26RcdgO6W8PU8ANce
	sgFmBfBRGtBF+fFVwCFmJrhfxtFDkvgyl7PbxR8p7RBLWiDojriPErON5vqdCYiSLv0MEjpKEnEVo
	VCTLIUHE56/SjqDyttF2Q0QJD7ykrN20LlYhmhf5rye5H2YgK/PFajsIzz1XgKvPHflgs/hOYofLk
	R3o9a9XcUcs9VCAymADzhIFYi476degiwyGuBefUGokw+a22qCOxQR+d3jjyy0X/dqxXWMy9ietwv
	kIRIrXvTJ4C5iRmtpz/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgxyV-0000000E6WW-1zd1;
	Tue, 07 Jul 2026 05:04:03 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgxyS-0000000E6Vy-1fzY
	for linux-riscv@lists.infradead.org;
	Tue, 07 Jul 2026 05:04:02 +0000
Received: from [10.213.6.103] (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowAAnytKviExqhn4OBQ--.11100S2;
	Tue, 07 Jul 2026 13:03:44 +0800 (CST)
Message-ID: <99eac2ba-a4e5-4885-aa81-b0c43f6fc4b2@iscas.ac.cn>
Date: Tue, 7 Jul 2026 13:03:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] mm/sparse-vmemmap: flush_cache_vmap() after
 hotplugging vmemmap
To: Alexandre Ghiti <alex@ghiti.fr>, Andrew Morton
 <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, Muchun Song <muchun.song@linux.dev>
References: <20260707-mark-after-vmemmap-populate-v5-1-77d1ded3cae3@iscas.ac.cn>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <20260707-mark-after-vmemmap-populate-v5-1-77d1ded3cae3@iscas.ac.cn>
X-CM-TRANSID: qwCowAAnytKviExqhn4OBQ--.11100S2
X-Coremail-Antispam: 1UD129KBjvJXoWrtr1fJr4UZry3GF43Aw4fKrg_yoW8Jr47pr
	Z7Can8tFs5Wryayw48u342grna9ws3t3y8JF4Fvr1j9wn8WFyjgrnxKayvgF97u3s3uayj
	krs8u34DWFyDZ3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvGb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
	8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr1j6F
	4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkI
	wI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr
	0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
	17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcV
	C0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY
	6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa
	73UjIFyTuYvjxUqP8nDUUUU
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_220400_811565_41DBFE08 
X-CRM114-Status: GOOD (  13.01  )
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

Please disregard. I made a mistake while submitting this patch.

I'll send a fixed v6 later. Sorry.

On 7/7/26 12:10, Vivian Wang wrote:
> section_activate() does not flush TLB after populating new vmemmap
> pages. On most architectures, this is okay. However it is a problem on
> RISC-V since there the TLB caching non-present entries is permitted,
> which causes spurious faults on some hardwares.
>
> This seems to be most easily reproduced with DEBUG_VM=y and
> PAGE_POISONING=y, which causes these newly mapped struct pages to be
> poisoned i.e. written to immediately after mapping.
>
> Extend the RISC-V flush_cache_vmap() to also handle the vmemmap range,
> and call it after hotplugging vmemmap, which gets the possible spurious
> fault handled in the exception handler.
>
> At least for now, the only other architecture with both
> SPARSEMEM_VMEMMAP and flush_cache_vmap() is PowerPC, which has a similar
> problem with newly valid PTEs. But there flush_cache_vmap() is just a
> ptesync. So it should be safe to do this for generic code while having
> minimal performance impact.
>
> Suggested-by: Muchun Song <muchun.song@linux.dev>
> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
> ---
[...]


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
