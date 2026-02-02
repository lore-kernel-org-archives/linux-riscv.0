Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D7CE7DEFA
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Feb 2026 15:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xe8wutyA8pyMnJdMno4z12yiuDet0QRZiFdDrrXNJUI=; b=mqWT4ZDGFr5g3S
	U54Re31N0fRwdmvgm1lvN8/fBznm/Y/tt+xL2dwWoPzwZjl1lteZJuiispqFzwAtrjEUODkWjl4od
	hpRxb3Nu2ZzppvXTlJaYQMPD9RNAAz/J+KpITTwu7io285Hkj+YjWetuE1DAFIbxoG/zHG4z/7ug6
	BbjdWJiEsNx9p5OOm0Kzdv14gHThrMdbALJ+CnOIismmgz2BT4CG7pYC5hl582L76uhWUb+jOgQ4R
	brjSf6cRDKvTjcwKOeLo9g3JrxjPNchR2f0JwaSjRHUyx9UpFHKeDG+lyx7fDyC9DyZX0Y5McLcBc
	9eQYJi2AQ3wtqqsqWn4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmwIq-00000005ECU-1YBK;
	Mon, 02 Feb 2026 15:57:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmwIo-00000005EBC-3KBb
	for linux-riscv@lists.infradead.org;
	Mon, 02 Feb 2026 15:57:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3B887600B0;
	Mon,  2 Feb 2026 15:57:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65440C2BC86;
	Mon,  2 Feb 2026 15:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770047845;
	bh=4F/Szy/Cik4u0re8XChd+PvOlhHKvV3FFCqDor4py4I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E355jcxZZGEN72iBz16h9Q64pa+MpPpXDaxQyAwPc8LshI23t26aGnlzF4J3nmmNF
	 IBCJBEQj4WiyddKssMF0CZZEE/qB0EyKDy3mR/gw/HPR/Pb47aAUZpDj56Mdz5POam
	 pj4ocJSd/i8vRlT/tG/aaWLTW4BaB6yTOWAlr/yWCFmOcG8qvcjfT/WMr8Ffpn8Mr4
	 mww0vkqWUJw/6nxW9jDXC/ELsXbiLp4Fd+th/i4Fp1d4SWZ/vzcDtDa3cDXioHuSwW
	 WqvkcZLGmFlTGOX79sWS93Bp1w2nfljOM36UnZzwl4XqTyhpr/UZOtCFKdqw4L3Ik8
	 pRpkygn7garVQ==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 87AD9F40069;
	Mon,  2 Feb 2026 10:57:24 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Mon, 02 Feb 2026 10:57:24 -0500
X-ME-Sender: <xms:ZMmAae_3pbGsFF7v_MZEmDRgDY2f7GMkRejfgptjcQ21sK8zJTSYYQ>
    <xme:ZMmAaX5UcOLdks_v7i1vRWtO88mrYxHbW_-fJNidyFhLw5yrbfK5Lg3QklRof27o7
    sglVk5chSgpz4LC87bfKGEh_R-ZdQ-uVYtcrqU2yS7p7bE9BFsKmts>
X-ME-Received: <xmr:ZMmAaeIOk3utiWzPI8eF_K1lpuh-ER9c1IXPRqjS2R-Fq02N-UrDfq0bqwhcFA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddujeektdeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhirhihlhcu
    ufhhuhhtshgvmhgruhcuoehkrghssehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvg
    hrnhephfdufeejhefhkedtuedvfeevjeffvdfhvedtudfgudffjeefieekleehvdetvdev
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepkhhirh
    hilhhlodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieduudeivdeiheeh
    qddvkeeggeegjedvkedqkhgrsheppehkvghrnhgvlhdrohhrghesshhhuhhtvghmohhvrd
    hnrghmvgdpnhgspghrtghpthhtohepvdekpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopegrkhhpmheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoh
    epmhhutghhuhhnrdhsohhngheslhhinhhugidruggvvhdprhgtphhtthhopegurghvihgu
    sehrvgguhhgrthdrtghomhdprhgtphhtthhopeifihhllhihsehinhhfrhgruggvrggurd
    horhhgpdhrtghpthhtohepuhhsrghmrggrrhhifheigedvsehgmhgrihhlrdgtohhmpdhr
    tghpthhtohepfhhvughlsehgohhoghhlvgdrtghomhdprhgtphhtthhopehoshgrlhhvrg
    guohhrsehsuhhsvgdruggvpdhrtghpthhtoheprhhpphhtsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehvsggrsghkrgesshhushgvrdgtii
X-ME-Proxy: <xmx:ZMmAaXW1d65pS8ihA67wf_hRBqAR18KdW0Mev4RAVm5fV6tgKi7OgQ>
    <xmx:ZMmAafJKlnjoDTLfBd38lQaRXg0lCilqWOKaSvUULjJftWd4fIXF8A>
    <xmx:ZMmAaczYts7r83g26Mell3b26W_mF_v-eF1S_kNRLdn9JMEVbOCXUw>
    <xmx:ZMmAabL-FjuRVRpS65ikPOX_oDGGSrBR3c_HvDzbHaC_MiJXf78cNA>
    <xmx:ZMmAafQ9vmeZ028dJBC8OeVsAc-CW9C3OdCX0Mn9hsCgNbY_nmsxO_vs>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Feb 2026 10:57:22 -0500 (EST)
From: Kiryl Shutsemau <kas@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	David Hildenbrand <david@redhat.com>,
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
	Kiryl Shutsemau <kas@kernel.org>
Subject: [PATCHv6 05/17] riscv/mm: Align vmemmap to maximal folio size
Date: Mon,  2 Feb 2026 15:56:21 +0000
Message-ID: <20260202155634.650837-6-kas@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260202155634.650837-1-kas@kernel.org>
References: <20260202155634.650837-1-kas@kernel.org>
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

The upcoming change to the HugeTLB vmemmap optimization (HVO) requires
struct pages of the head page to be naturally aligned with regard to the
folio size.

Align vmemmap to MAX_FOLIO_NR_PAGES.

Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
---
 arch/riscv/mm/init.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 21d534824624..c555b9a4fdce 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -63,7 +63,8 @@ phys_addr_t phys_ram_base __ro_after_init;
 EXPORT_SYMBOL(phys_ram_base);
 
 #ifdef CONFIG_SPARSEMEM_VMEMMAP
-#define VMEMMAP_ADDR_ALIGN	(1ULL << SECTION_SIZE_BITS)
+#define VMEMMAP_ADDR_ALIGN	max(1ULL << SECTION_SIZE_BITS, \
+				    MAX_FOLIO_NR_PAGES * sizeof(struct page))
 
 unsigned long vmemmap_start_pfn __ro_after_init;
 EXPORT_SYMBOL(vmemmap_start_pfn);
-- 
2.51.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
