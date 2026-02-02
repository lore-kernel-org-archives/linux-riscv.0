Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3272E7DEFA
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Feb 2026 15:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EPfV1zRYb3k5y+JQhIeIHlHXIaQrXtPrqZj3/XvwQ6g=; b=yxQx2NU1GqOKtn
	27jH67rlJLRDIvfZq4X0KFgS1HBRKB9zi/dMyare6z/37p7FgZqJLC6j7I92ibkzjSwX4L6irW3hZ
	3i0T6FIJt1ADCYy5kmeJzl4R5zBg9cPaV6wbqFWFiaM7v5iwDXGFLq9uwXSYxr+fU1Y8PV9LFKLG0
	2fonw3OuhGP2rEueMNct4vPelcrDwWCmllbwWClGefyTmHkSx3oI5FuYAt5O4IQMaSzHJYZefXy7F
	xRtTuBvLReXgifH4XQTRnMFhIYgKuvT5Ea7+cz42PtGvkX9Mckux3re9I/iaPPkkvjMOAGCDlqpd8
	tc72FYQtA75i2uJFdaFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmwJH-00000005ES8-076l;
	Mon, 02 Feb 2026 15:57:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmwJC-00000005EPi-31Ry
	for linux-riscv@lists.infradead.org;
	Mon, 02 Feb 2026 15:57:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 540314358D;
	Mon,  2 Feb 2026 15:57:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83593C19422;
	Mon,  2 Feb 2026 15:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770047870;
	bh=VrUiLq75DGzOguYtbXE6XDIwgQv8ey6yUw/4kWmprNw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EvtcO+aQ9OQr4h7jVSo1frzhSOxnbEFza5TzKINdvokRgHhzCFihUKNirsH5eRqQI
	 o+nHAnSP3Eoi0bhKqFBJ3u2eSv+qnLcMX9Vd2tQiKRGw4ttIeXYOU/ERlhl5MqOJul
	 PsuLlBgmcEFXn0AuZ32ZOEVEX45Clr5tA5fO+yadkQQj6G6HdMqxFhw3mFdUjHHBXr
	 myrGdBa3SKJ4aSeOQEMvIpP8bh9ers08+Fo6MriW9fAD03sNqBn+9zezmIGd4gom+G
	 jyzYK0M9VwIuZH5OcQeH0iR1bKf5iuEY+RTC0/SsnYMbsljNln0//btttmiAeZNY0x
	 c5pO5QBbZGNjQ==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id AE3FCF40069;
	Mon,  2 Feb 2026 10:57:48 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Mon, 02 Feb 2026 10:57:48 -0500
X-ME-Sender: <xms:fMmAaRmSarQtSgkJL9ElgoWpBN4BS4MNEmLnHRHV6F99rZKMtNTTBw>
    <xme:fMmAaWC0Xz2TieQ8kW0LBdV-hQQhv6v2aDnvjoEeS8YkOBLp3bjHiuklagKlCPa9b
    dWwlqPSveHajPxdOf6gFL3XuztwNv7CRGxmfxMKjoKNaXQmsC2yTAc>
X-ME-Received: <xmr:fMmAaRzu-6Ov4o68ZrAs1fsMHIkekcEygHLprxa3NZwsSl9ugG7hi-6TLMrNdw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddujeektdeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhirhihlhcu
    ufhhuhhtshgvmhgruhcuoehkrghssehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvg
    hrnhephfdufeejhefhkedtuedvfeevjeffvdfhvedtudfgudffjeefieekleehvdetvdev
    necuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepkhhirh
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
X-ME-Proxy: <xmx:fMmAaSfdJDEPUUayeRq0_IedMJFA63QZZDNwuXMpIlsxg_PtDbT70w>
    <xmx:fMmAabwdEqLjU_0sxb900rKtA_5hXCpvTfDBPBc7EdbygooWNN7YqA>
    <xmx:fMmAac4UCTbwO-KzGoscML5ay9adm1RDBg-oUftUQLU47tQtNdtsuQ>
    <xmx:fMmAaYxX3Ch1V6RubEzj8Zil73pfO2J9zLr5vSfJug1YDdj_fvfEzg>
    <xmx:fMmAacbukOcaweQH080ju9vu0XhOswAzy5C2A4J3UVL_JveQqEs5iY8B>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Feb 2026 10:57:46 -0500 (EST)
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
Subject: [PATCHv6 08/17] mm: Make page_zonenum() use head page
Date: Mon,  2 Feb 2026 15:56:24 +0000
Message-ID: <20260202155634.650837-9-kas@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260202155634.650837-1-kas@kernel.org>
References: <20260202155634.650837-1-kas@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_075750_807354_8EBB4E73 
X-CRM114-Status: UNSURE (   9.98  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

With the upcoming changes to HVO, a single page of tail struct pages
will be shared across all huge pages of the same order on a node. Since
huge pages on the same node may belong to different zones, the zone
information stored in shared tail page flags would be incorrect.

Always fetch zone information from the head page, which has unique and
correct zone flags for each compound page.

Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
Acked-by: Zi Yan <ziy@nvidia.com>
---
 include/linux/mmzone.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index be8ce40b5638..192143b5cdc0 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -1219,6 +1219,7 @@ static inline enum zone_type memdesc_zonenum(memdesc_flags_t flags)
 
 static inline enum zone_type page_zonenum(const struct page *page)
 {
+	page = compound_head(page);
 	return memdesc_zonenum(page->flags);
 }
 
-- 
2.51.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
