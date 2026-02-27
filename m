Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33820FD530A
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Feb 2026 19:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZT374lJg36y3F+hVGcDh+AfpnfpV1/MhofMMEpExmLc=; b=0KcFHZUNeA8xaH
	iUiOoCYk5FM96InUOTJ0Csq3ZONFD691jUyDJBRNGtM9znu+cL/EEcUJBVbcpGaq2ka0rpf6+4D+W
	rwzIJy1lANVguoJivw0cyDQXFXZc58kgWhb7owvfSKDmqEbqp0tysEpNvOF+WX5uVVEMr9DAWtqQo
	Oj0ysEc3FQz3LOQo7ebiqfmk2WR1nhlIOJYRA7fqQ8HTBwDG5bD3WZVAT97GsfhlllJIWg6TSp4bI
	iqoTAwRhg1Z/nmQXmo/L8U7co9TNjzfq7i9H1Zf73yf3tbYSY2wSHDe7Zx3C5oGPDa1ScGuyx4kpZ
	38B3jKyHTgVvwI6w9bcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw3kL-000000092qr-07XL;
	Fri, 27 Feb 2026 19:43:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw3kI-000000092mc-10ei
	for linux-riscv@lists.infradead.org;
	Fri, 27 Feb 2026 19:43:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 82CF36013C;
	Fri, 27 Feb 2026 19:43:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76356C4AF09;
	Fri, 27 Feb 2026 19:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772221409;
	bh=gud3FwwIClhEmyWoGuFCwJEp0m9beXo/gim58y+k7v0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iPVMHXXhYAi0AhUZq3bW+X6MD/K0c5MSJn+TsC8AOtTtbUFFz3ffyRMS0WviVcGni
	 62mT9OgURd3x7sv9fsxrJdolzd8si5WsvQEnHCXatGff/w2mfIPm56k+FiSk3tMIEx
	 CEyiWsjiEmW2J3Wh+7A+aIkbR1VAVxg68k2FmcxZALEpLRU3hLg0e6NHfNLuwcvyey
	 NEVR96YD+9liaOwCJT+40rJsnlUv4jAWNMgIFVrp8pymkDJ8sCDTP+uSzW//0vE0dU
	 UbN920BfT5alOYAzmv118aWwusSku8OQvk2Rya/EOE3wrXtpYPaR3F9sdfvr4+XMob
	 rG0F1Izfn9mWg==
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id 9B017F40069;
	Fri, 27 Feb 2026 14:43:27 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Fri, 27 Feb 2026 14:43:27 -0500
X-ME-Sender: <xms:3_OhabA1ohqHXNU5qyJNz3ayihbTvK3cA9c3NeIZ0xeM1MM9lSR44A>
    <xme:3_OhaasFPoEyIuUpNv0wUZw1T9AsYpGPB5jur1OagdNAAOFIcXX1o6UmejzHply7o
    JEos8QXdiJ4oJkKjwD55DpkuqErIqIWSxv7Y6t9b0j31TPHUpEvWJo>
X-ME-Received: <xmr:3_OhaQvt0UEdCKMeu209siQA0Vdm7tWGKBCe5XARr7O-MZNZ_FnsHw8613Kmpg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvgeelkeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepfdfmihhrhihl
    ucfuhhhuthhsvghmrghuucdlofgvthgrmddfuceokhgrsheskhgvrhhnvghlrdhorhhgqe
    enucggtffrrghtthgvrhhnpefhudejfedvgeekffefvdekheekkeeuveeftdelheegteel
    gfefveevueekhfdtteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehkihhrihhllhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidq
    udeiudduiedvieehhedqvdekgeeggeejvdekqdhkrghspeepkhgvrhhnvghlrdhorhhgse
    hshhhuthgvmhhovhdrnhgrmhgvpdhnsggprhgtphhtthhopedvkedpmhhouggvpehsmhht
    phhouhhtpdhrtghpthhtoheprghkphhmsehlihhnuhigqdhfohhunhgurghtihhonhdroh
    hrghdprhgtphhtthhopehmuhgthhhunhdrshhonhhgsehlihhnuhigrdguvghvpdhrtghp
    thhtohepuggrvhhiugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfihilhhlhiesih
    hnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehushgrmhgrrghrihhfieegvdesghhm
    rghilhdrtghomhdprhgtphhtthhopehfvhgulhesghhoohhglhgvrdgtohhmpdhrtghpth
    htohepohhsrghlvhgrughorhesshhushgvrdguvgdprhgtphhtthhopehrphhptheskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepvhgsrggskhgrsehsuhhsvgdrtgii
X-ME-Proxy: <xmx:3_Ohaeoioe6Sa8G-eKF1PjQM_fcot6QQ33vWyXbkJpHqPYj2ARiGUA>
    <xmx:3_OhacMDbWD03RKTDgNiXsK3q3RADUxdVRA8AkVqkGTiT-ahMXTrJw>
    <xmx:3_OhaclP2w1F1T-XaqMUWS1tmoLoPcwYmLOvusoieMwy1eq--4aKDw>
    <xmx:3_OhaWv2wPdXpDysvWUxivqmsQUB-r_81ttU6zXN3TjjdRLKNtFNHA>
    <xmx:3_OhabntOD3aP2UuglbO6GtArK7Cb_eZZ84aMTLBBXwLLWMSJplqa7Q9>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Feb 2026 14:43:27 -0500 (EST)
From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	David Hildenbrand <david@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Usama Arif <usamaarif642@gmail.com>,
	Frank van der Linden <fvdl@google.com>
Cc: Oscar Salvador <osalvador@suse.de>,
	Mike Rapoport <rppt@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Zi Yan <ziy@nvidia.com>,
	Baoquan He <bhe@redhat.com>,
	Michal Hocko <mhocko@suse.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kernel-team@meta.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	"Kiryl Shutsemau (Meta)" <kas@kernel.org>
Subject: [PATCHv7 11/18] x86/vdso: Undefine CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP for vdso32
Date: Fri, 27 Feb 2026 19:42:49 +0000
Message-ID: <20260227194302.274384-12-kas@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260227194302.274384-1-kas@kernel.org>
References: <20260227194302.274384-1-kas@kernel.org>
MIME-Version: 1.0
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

The 32-bit VDSO build on x86_64 uses fake_32bit_build.h to undefine
various kernel configuration options that are not suitable for the
VDSO context or may cause build issues when including kernel headers.

Undefine CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP in fake_32bit_build.h to
prepare for change in  HugeTLB Vmemmap Optimization.

Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 arch/x86/entry/vdso/vdso32/fake_32bit_build.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/entry/vdso/vdso32/fake_32bit_build.h b/arch/x86/entry/vdso/vdso32/fake_32bit_build.h
index db1b15f686e3..bc3e549795c3 100644
--- a/arch/x86/entry/vdso/vdso32/fake_32bit_build.h
+++ b/arch/x86/entry/vdso/vdso32/fake_32bit_build.h
@@ -11,6 +11,7 @@
 #undef CONFIG_PGTABLE_LEVELS
 #undef CONFIG_ILLEGAL_POINTER_VALUE
 #undef CONFIG_SPARSEMEM_VMEMMAP
+#undef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
 #undef CONFIG_NR_CPUS
 #undef CONFIG_PARAVIRT_XXL
 
-- 
2.51.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
