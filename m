Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB35EC43334
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jun 2022 06:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ypZ/0DyOF78jV0W2UNbagPMbAerOPbeN9HLhoMMXYvE=; b=TD/vYeWK4mRw3P
	SL9ukqwh+6N683proagT2V8Bl/3U1bbv/RMdAJa7UehmbLYXQojUVsN9UPAeLxP+RSojSA7ScniXU
	0eTLC/KpMXS/CoLYjLclpgjPerwm9YYcX3/7zUm3BnCbGerb5YgatRDROiMYNQ/Ir3u9cKVuZZY5V
	CoozOJ3APNxjiskEcIu9B5liUnvUFzm03VtBVEHCa/QKtfGdq9gGTOJ3jA4DLy38WJUVgPDtcpfbZ
	Jv/k0w8eZ3DhIqoH62USlImhcIHAHuyxlwoEw15+tSroR/plcBZukj0dV7vQgM5tUpxry8b3bFeBv
	/T+4pIYKWUFPv/S/DK4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4cWC-000nkS-IL; Fri, 24 Jun 2022 06:10:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4cW1-000nh8-Lg; Fri, 24 Jun 2022 06:10:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1D62B11FB;
	Thu, 23 Jun 2022 23:09:56 -0700 (PDT)
Received: from [10.162.41.7] (unknown [10.162.41.7])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0BA523F66F;
	Thu, 23 Jun 2022 23:09:48 -0700 (PDT)
Message-ID: <4a20d826-af0f-0d2c-162e-8797c2603ab1@arm.com>
Date: Fri, 24 Jun 2022 11:39:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH V4 02/26] mm/mmap: Define DECLARE_VM_GET_PAGE_PROT
Content-Language: en-US
To: Christoph Hellwig <hch@infradead.org>
Cc: linux-mm@kvack.org, christophe.leroy@csgroup.eu,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, x86@kernel.org, openrisc@lists.librecores.org,
 linux-xtensa@linux-xtensa.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-um@lists.infradead.org, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220624044339.1533882-1-anshuman.khandual@arm.com>
 <20220624044339.1533882-3-anshuman.khandual@arm.com>
 <YrVHEw6bjUf62Eh5@infradead.org>
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <YrVHEw6bjUf62Eh5@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_231001_824154_BCB42246 
X-CRM114-Status: GOOD (  11.90  )
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



On 6/24/22 10:39, Christoph Hellwig wrote:
> On Fri, Jun 24, 2022 at 10:13:15AM +0530, Anshuman Khandual wrote:
>> This just converts the generic vm_get_page_prot() implementation into a new
>> macro i.e DECLARE_VM_GET_PAGE_PROT which later can be used across platforms
>> when enabling them with ARCH_HAS_VM_GET_PAGE_PROT. This does not create any
>> functional change.
> 
> mm.h is a huhe header included by almost everything in the kernel.
> I'd rather have it in something only included in a few files.  If we
> can't find anything suitable it might be worth to add a header just
> for this even.

I guess <linux/pgtable.h> should be better ?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
