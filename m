Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A2E7C44539
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 12:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RQXTPBPTYYvtKq7iAULj0J4mPHQwN9AvJ0+b2H9ryCg=; b=JFlIiDS6OpKmem
	g2oxd4Ouu3q2p85HODlpZMzIKBZOUD4sEEhVRa7qMhBqoIs38D6Zt5GrYKWhQpT+MWwnfGF1qXJK/
	NbJHvaseixscoR32CzstaDh6BPGfz4YwW1DEJdzEIJ47nzSoGH374d//uUIZOgrMnt/Ld8JaZepGS
	rqf75yw60LYzTnsXkPCWQTGbaGVu4Bt3amIufUDJ/3NDJaa6YU8qAVP5uXC5j+Wy+0O50xb+n0XTh
	uRj0QAeT8r1A2vhXnIPSNPVWmZhylSp/7quBsj1QmoBr/rY6F38u47M4kA/JT6a/BXxFFxDpjssoY
	NTkpwDQRpT+QQPQpAaXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmW7W-0000000BlpW-0BB8;
	Wed, 22 Jul 2026 12:32:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmW7U-0000000Bloo-3Qu8
	for linux-riscv@lists.infradead.org;
	Wed, 22 Jul 2026 12:32:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D3988600DA;
	Wed, 22 Jul 2026 12:32:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 199031F00A3E;
	Wed, 22 Jul 2026 12:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784723535;
	bh=lnxlxmPT8kUh0+TLlrEX3X7DjHb/GZYj15xXsKbQU+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AOHz42z+4saXeEFOaiTY/undQpiA7hP3KHl3uYFTn06AE3Mhx3zoLsWvPzfpUiP61
	 9rc6bO2gzHbfKFdStk1rrYH9PBKSf4qYTIOpwFcqn0/feFC2pEXdPu1ApMntKR7Cb+
	 DuWq0qzjRLr7kmcZvS/sVzmLGwZDlqozAyrk8A0dV++TFZJs5/BqQruQ4PRNfCKgQg
	 bJI9NCNrl1DjCWvflQcmrA6BekG6rGjQxF+geFHZC9I3uPPgecYFmcvrq2Dhm6/M7F
	 070IV4EuaMmmbVkgQOAiFTQfd+fXNb5iaPT8Cl2d+WXFe/Mh90muDiYfbxUvjztGck
	 AdkTT89TrEWxQ==
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfauth.phl.internal (Postfix) with ESMTP id 54003F40066;
	Wed, 22 Jul 2026 08:32:14 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Wed, 22 Jul 2026 08:32:14 -0400
X-ME-Sender: <xms:TrhgatZNom5xPIfbnmufUuE-WODdSzQlV-JLYtwYomLKl9cZIUxmEQ>
    <xme:TrhgaiAj8Y_Cjp87DMQAkcnJjDUkh3G3bTsD4rhV-ERR2t_uDADYW8grH4Epom7Pl
    n3fKTAIQCjsZ4kF6F4S_wDhxlstRyklTnHlvfPaYTyqLK_Q0CuqTAM>
X-ME-Received: <xmr:TrhganVG89-RXwQyvrpLTjXQQgkpKo-txFMsbOaP-PiCPJrrb5GooqryC-y2ZQ>
X-ME-Proxy-Cause: dmFkZTF8TT/vDWioYkWdZrYizKr34no4dSvpXzh8N48LVZZQZqB/wSjKuB1GxsBFuHqNVQ
    GrXfDoi/gTnPqOz9NywDHbklLV/vEBCMTlo8D23V0lP6ETNgoGfqly2ixdUB5oriFaGZo2
    qiBnOauJoAsEkIpLse0B9lrTNjzFyVzGyIDSMUxGH9ACPTK0D4IQE+bulsr/kCy4DszbeL
    JSXNphFwamAJHMjxaf30zIL2ghJ8cmQ7g8OJS+9m/oSB6ikxaU8BzTfXgFMgABSHA1vtSQ
    W4NxwjELXX400Odu2xg9u9q2JVBBqmoBUicprRjUVWwhGw+yeFeCBAErAW/FOV7A2PpuMn
    9PjWNPvSbn+/b2UnKCRuEb4nJ/5rBkwRVvURTJr08kKE5m/A7LCNIbKRilrSyOYDPWpj5Y
    B6GKwBU9s/XY2r6oBoYuqXIPLCm76bG9o89jYu3jVE6+IDvNO1IMQpjjxSliPUy10uPaet
    aBRFjezYyoLJ9fMPWdqBnA+orVErUEMuYSF1LPgx86KqkzFAOSHHRbnylCst0hJFTUB85W
    b+pJzbobJsuV5itUdeBvbv9X6s9T9GxOOglUca5yJwcathV/dqYCXcWP45mdJNn7Pa2hbk
    N4r9BFSofiz8lVpuHU8a9OjXSe7OqRhPlnWa1LzW2FzqBt4yS0wbQRuSOdDQ
X-ME-Proxy: <xmx:Trhgaj3q5Sf-3pZyVZmdUZxTriUbd1Uwraggyq5HpgrVV91QlwTkow>
    <xmx:TrhgagVCe21PH9DpW1S1uAFHSvbvAp9qyBhNij7GChcZR2-XZa7DAg>
    <xmx:TrhgahAb93BVR8yjwUhPvlE4cMmZmYBi27jQcwnSjbdAF4uuPaK3EQ>
    <xmx:TrhgarowJflwoG5gBWCe05wAKGZHyMSa7CIH8mQgQRiGtFczztdJZA>
    <xmx:Trhgal33aXPtJDrx3w-whTOInOBtVcW1cf2rkQxaTtdlHZjjzbR26kt0>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jul 2026 08:32:13 -0400 (EDT)
Date: Wed, 22 Jul 2026 13:32:12 +0100
From: Kiryl Shutsemau <kas@kernel.org>
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	David Hildenbrand <david@kernel.org>, Guo Ren <guoren@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Vishal Moola <vishal.moola@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Morton <akpm@linux-foundation.org>, 
	Junhui Liu <junhui.liu@pigmoral.tech>, Muchun Song <muchun.song@linux.dev>, 
	Nam Cao <namcao@linutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <pjw@kernel.org>, Vivian Wang <wangruikang@iscas.ac.cn>
Subject: Re: [PATCH] riscv/mm: use physical alignment for vmemmap_start_pfn
Message-ID: <amC4KvulXwQe-JyM@thinkstation>
References: <20260716115326.3466926-1-xujiakai2025@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260716115326.3466926-1-xujiakai2025@iscas.ac.cn>
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

On Thu, Jul 16, 2026 at 11:53:25AM +0000, Jiakai Xu wrote:
> RISC-V computes vmemmap_start_pfn by rounding phys_ram_base down to
> VMEMMAP_ADDR_ALIGN. That alignment must therefore be expressed in the
> physical-address domain.
> 
> Commit 476849b0fba4 ("riscv/mm: align vmemmap to maximal folio size")
> attempted to account for the maximal folio alignment by feeding
> MAX_FOLIO_VMEMMAP_ALIGN directly into VMEMMAP_ADDR_ALIGN. However,
> MAX_FOLIO_VMEMMAP_ALIGN is measured in bytes of struct page storage,
> whereas VMEMMAP_ADDR_ALIGN is used to align a physical address.
> 
> The mask-based compound_info encoding requires pfn_to_page(0) to be
> naturally aligned to MAX_FOLIO_VMEMMAP_ALIGN. Commit 9f94db4c7eaa
> ("mm/sparse: check memmap alignment for compound_info_has_mask()")
> added a check for that requirement and exposed the unit mismatch on
> systems such as QEMU virt, where the DRAM base is not aligned to
> MAX_FOLIO_NR_PAGES * PAGE_SIZE.
> 
> Convert MAX_FOLIO_VMEMMAP_ALIGN to the equivalent physical alignment
> before using it in VMEMMAP_ADDR_ALIGN. This keeps the existing
> round_down() logic while making the resulting vmemmap base satisfy the
> mask-alignment requirement.
> 
> Fixes: 476849b0fba4 ("riscv/mm: align vmemmap to maximal folio size")
> Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
> Assisted-by: YuanSheng:DeepSeek-V4-Flash

Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
