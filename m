Return-Path: <SRS0=k4h2=PX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6F86C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 15:39:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95AA820657
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 15:39:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jw/SK5Eu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95AA820657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zk2lBQiZsyA0BpxzGmf+hpViEARd8LNL8l+Bp4F6HgM=; b=jw/SK5EusZiCsq
	zApWlqy9NwBWXSKAsPenxCb40xeH52Y9B8s6vWmm4cFUbZkzMfxl1ibCrleYPVlvXvyMYUW4PUg2I
	bYImoQb0Z/pOi0YARp3i5E0lNE1rT8nlCPomUPw25Af/gCEDYeBv6C68PQURSxI2eF2P0bJUx47H9
	39+yDLi4Mp+05iEdB2x1MjtzMRwuzKXH2069HRA3VMPkIl1n/E548kAsEV3hYbqGPhK83qOcCQlOL
	UnbxDdKqGPj2XNWR0tVYiC86a9s+9vSAWcpsLrW9s12ZjQ8AclEwS1V6c92TPiNKkbrH956ahqfHc
	ebZ/Sw1qe2690mOTRoFg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjQoF-000582-4t; Tue, 15 Jan 2019 15:39:23 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1gjQnX-0004NQ-Au; Tue, 15 Jan 2019 15:38:39 +0000
Date: Tue, 15 Jan 2019 07:38:39 -0800
From: Christoph Hellwig <hch@infradead.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 0/9] mm: PG_reserved cleanups and documentation
Message-ID: <20190115153839.GE26443@infradead.org>
References: <20190114125903.24845-1-david@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190114125903.24845-1-david@redhat.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Michal Hocko <mhocko@suse.com>,
 CHANDAN VN <chandan.vn@samsung.com>, David Airlie <airlied@linux.ie>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Bhupesh Sharma <bhsharma@redhat.com>, Palmer Dabbelt <palmer@sifive.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Stefan Agner <stefan@agner.ch>,
 Michal Hocko <mhocko@kernel.org>, David Howells <dhowells@redhat.com>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 linux-riscv@lists.infradead.org,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 linux-s390@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Pavel Tatashin <pasha.tatashin@oracle.com>,
 Matthew Wilcox <willy@infradead.org>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Matthias Brugger <mbrugger@suse.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Anthony Yznaga <anthony.yznaga@oracle.com>,
 Tobias Klauser <tklauser@distanz.ch>, Laura Abbott <labbott@redhat.com>,
 Fenghua Yu <fenghua.yu@intel.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Kees Cook <keescook@chromium.org>, Vasily Gorbik <gor@linux.ibm.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Marc Zyngier <marc.zyngier@arm.com>,
 Will Deacon <will.deacon@arm.com>, linuxppc-dev@lists.ozlabs.org,
 Kristina Martsenko <kristina.martsenko@arm.com>,
 linux-m68k@lists.linux-m68k.org, Dave Kleikamp <dave.kleikamp@oracle.com>,
 linux-mediatek@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@c-s.fr>, Tony Luck <tony.luck@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Oleg Nesterov <oleg@redhat.com>,
 linux-kernel@vger.kernel.org, Miles Chen <miles.chen@mediatek.com>,
 Mike Rapoport <rppt@linux.vnet.ibm.com>, James Morse <james.morse@arm.com>,
 Souptick Joarder <jrdr.linux@gmail.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Logan Gunthorpe <logang@deltatee.com>, Greg Hackmann <ghackmann@android.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jan 14, 2019 at 01:58:54PM +0100, David Hildenbrand wrote:
> Nothing major changed since the last version. I would be happy about
> additional ACKs. If there are no further comments, can this go via the
> mm-tree in one chunk?
> 
> I was recently going over all users of PG_reserved. Short story: it is
> difficult and sometimes not really clear if setting/checking for
> PG_reserved is only a relict from the past. Easy to break things. I
> guess I now have a pretty good idea wh things are like that
> nowadays and how they evolved.

Any reason you skipped

drivers/gpu/drm/drm_pci.c:drm_pci_alloc()

and 

drivers/gpu/drm/drm_scatter.c:drm_legacy_sg_alloc()

which both look completely bogus as-is?

In fact we should probably just try to kill them off as they have
very few users left.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
