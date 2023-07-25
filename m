Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37161C001DF
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jul 2023 10:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OjbCCiFU3wFan8kShHl9k2YzZpB0q6OQw3bBdhn6Jhc=; b=kBuYbMdW5VMLQa
	8xPe/fJxCb5nk689GN434QKg0FupUZC4HALDt19zv1EnkuKvbH75UAt78PL+D1GNWo2O4yv8RcMXb
	1F1FFsE3gGpSrR8YT+eqiMjwJ6jIGq4kgMe83g475dL6U8bR5f8BHAvQfh3W+unO3q4E9lktSlTHy
	TgEk5gJZTlR3Wb1Dp1zkdpvaqZo2Ntr0jIcBHnXRvrxLfTMBrnlrZoJd7z2BAh+jEh0INnIxsseNJ
	L+Ofm/IclRdJB2YJmRKOiXYPMMtvQkIjqX61rZhGSC6g46v5pxEVPPmC81ZOkTw3Cki5YjJdJL5ba
	ORAYx/HWJVv8hG64b3FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOFDK-0075re-0x;
	Tue, 25 Jul 2023 10:24:22 +0000
Received: from mga17.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOFDF-0075p4-2g;
	Tue, 25 Jul 2023 10:24:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690280657; x=1721816657;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=z2JgSRr57QfGjyG/fWEsaikXL6iwmaxUOjUdDAVtI0A=;
  b=Vjx3M11ZUyfeHvQjhMQRsqq6fXC/eVDyNDkf+88cTKsf3obYxz4KEIxE
   ZE0ixdm5H6lF/GMuKwlxOvXFSfW7PaE5vN1uif5/rB3az9izliWBHBoD0
   3UtlAZAuvINotxkliRBBetlBBopg5c3o3VcGA5VAstkRJGdplwR8eUab6
   PJ45aLpVhjC55BUSUPc3i/LBIz03NLKCEJ4A5YaZfGFcj/TQ+b89tdSsA
   e6RVeMhS3MS4NEJyW31R/5ywCdR4ikQXNYrOsBxVPqggocBWZe67zZYc5
   OPAFRdjzusmftvOTTsmv8yt09hdblmrpiRsBFy+BZX7L9XyvuSU0qMT4h
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="347956827"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="347956827"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 03:24:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="1056753039"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="1056753039"
Received: from mlytkin-mobl2.ger.corp.intel.com (HELO box.shutemov.name) ([10.252.57.129])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 03:24:05 -0700
Received: by box.shutemov.name (Postfix, from userid 1000)
	id 171E4103A12; Tue, 25 Jul 2023 13:24:03 +0300 (+03)
Date: Tue, 25 Jul 2023 13:24:03 +0300
From: "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
To: Sean Christopherson <seanjc@google.com>,
	Vlastimil Babka <vbabka@suse.cz>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Huacai Chen <chenhuacai@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	Chao Peng <chao.p.peng@linux.intel.com>,
	Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>,
	Yu Zhang <yu.c.zhang@linux.intel.com>,
	Vishal Annapurve <vannapurve@google.com>,
	Ackerley Tng <ackerleytng@google.com>,
	Maciej Szmigiero <mail@maciej.szmigiero.name>,
	David Hildenbrand <david@redhat.com>,
	Quentin Perret <qperret@google.com>,
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>,
	Liam Merwick <liam.merwick@oracle.com>,
	Isaku Yamahata <isaku.yamahata@gmail.com>
Subject: Re: [RFC PATCH v11 10/29] mm: Add AS_UNMOVABLE to mark mapping as
 completely unmovable
Message-ID: <20230725102403.xywjqlhyqkrzjok6@box.shutemov.name>
References: <20230718234512.1690985-1-seanjc@google.com>
 <20230718234512.1690985-11-seanjc@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230718234512.1690985-11-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_032417_905644_6F037863 
X-CRM114-Status: GOOD (  12.24  )
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

On Tue, Jul 18, 2023 at 04:44:53PM -0700, Sean Christopherson wrote:
> diff --git a/mm/compaction.c b/mm/compaction.c
> index dbc9f86b1934..a3d2b132df52 100644
> --- a/mm/compaction.c
> +++ b/mm/compaction.c
> @@ -1047,6 +1047,10 @@ isolate_migratepages_block(struct compact_control *cc, unsigned long low_pfn,
>  		if (!mapping && (folio_ref_count(folio) - 1) > folio_mapcount(folio))
>  			goto isolate_fail_put;
>  
> +		/* The mapping truly isn't movable. */
> +		if (mapping && mapping_unmovable(mapping))
> +			goto isolate_fail_put;
> +

I doubt that it is safe to dereference mapping here. I believe the folio
can be truncated from under us and the mapping freed with the inode.

The folio has to be locked to dereference mapping safely (given that the
mapping is still tied to the folio).

Vlastimil, any comments?

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
