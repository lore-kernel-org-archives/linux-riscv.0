Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 644ADCA0EF1
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Aug 2025 13:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=97FzeZSBxQMDZYfjFSaUL/tK63WAajd31G3tUdoswU0=; b=3YTW28RLz0yXcZ
	10pd0QCAq8br1OJ2ZMASKzBH8DGatXNaEkxcNKEA5rU9DxQINI2SK0BL4B5lJuH2myx+yNu1aCAnl
	IZGsdu2ewMz+mzg7Ih2n/Blli0kHzT7G1eGb0UzPgMWiTqJ+B878jzXGxAzYeMsTXi7W32XiHHvzY
	5GHMESXqMZlZgfzKq03V4Ne+MinRVs1oVuaTzRN0G5ecL9XfSnVpydNPgnZ1oXXtmdX0aqtppjg0j
	y75rAs7XK1aY3o1LsnV7Sf+3XzfPC7OFm93WS/oULjEmiOv7ntiDBDylhryzZozERoW70sUj1ZlSs
	ucUPz0MgwZA3v0I3vOpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo03J-00000007U4I-48Fg;
	Mon, 18 Aug 2025 13:37:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unv2q-00000006vLi-1oAR
	for linux-riscv@lists.infradead.org;
	Mon, 18 Aug 2025 08:16:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 035E21596;
	Mon, 18 Aug 2025 01:16:35 -0700 (PDT)
Received: from [10.57.58.12] (unknown [10.57.58.12])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B04543F63F;
	Mon, 18 Aug 2025 01:16:37 -0700 (PDT)
Message-ID: <57c816d6-a9ba-47c9-8f40-3978580b7f67@arm.com>
Date: Mon, 18 Aug 2025 10:16:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] selftests/mm: Add -Wunused family of flags
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
 Peter Xu <peterx@redhat.com>, Leon Romanovsky <leon@kernel.org>,
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, Shuah Khan <shuah@kernel.org>
Cc: kernel@collabora.com
References: <20250731160132.1795351-1-usama.anjum@collabora.com>
 <20250731160132.1795351-5-usama.anjum@collabora.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <20250731160132.1795351-5-usama.anjum@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_011644_518761_5EF74130 
X-CRM114-Status: GOOD (  11.24  )
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

On 31/07/2025 18:01, Muhammad Usama Anjum wrote:
> [...]
>
> diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftests/mm/Makefile
> index 23d4bf6215465..d75f1effcb791 100644
> --- a/tools/testing/selftests/mm/Makefile
> +++ b/tools/testing/selftests/mm/Makefile
> @@ -20,7 +20,6 @@ endif
>  # thus tricking Make (and you!) into believing that All Is Well, in subsequent
>  # make invocations:
>  .DELETE_ON_ERROR:
> -
>  # Avoid accidental wrong builds, due to built-in rules working just a little
>  # bit too well--but not quite as well as required for our situation here.
>  #
> @@ -35,6 +34,7 @@ MAKEFLAGS += --no-builtin-rules
>  
>  CFLAGS = -Wall -O2 -I $(top_srcdir) $(EXTRA_CFLAGS) $(KHDR_INCLUDES) $(TOOLS_INCLUDES)
>  CFLAGS += -Wunreachable-code
> +CFLAGS += -Wunused  -Wunused-parameter -Wunused-function -Wunused-label -Wunused-variable -Wunused-value

-Wall implies all of these except -Wunused-parameter (at least according
to gcc(1)).

As to -Wunused-parameter I am frankly not convinced it's worth the
hassle. We're getting 90 lines changed in patch 6-8 just to mark
parameters as unused, in other words noise to keep the compiler happy.
It is not enabled by default in the kernel proper precisely because it
is so noisy when callbacks are involved.

Patch 5 is clearly an improvement, but I'd rather take it without
actually enabling -Wunused-parameter. The rest of this patch isn't that
useful either IMHO.

- Kevin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
