Return-Path: <SRS0=5I1x=EZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6154EC63697
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Nov 2020 00:39:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E05B022266
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Nov 2020 00:39:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Enl49Vbf";
	dkim=permerror (0-bit key) header.d=wdc.com header.i=@wdc.com header.b="auLqOSDG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E05B022266
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=813shbRp8n0otHzjwNBe0W+PgBBhnHNsDvTpz6CCU74=; b=Enl49Vbfmko0/tNgXADqD2vGK
	KK+iZwKOyhmKcNpP1fgjso5wVVVdZRnrRs8ldZr50ZeCbsYa22V4/RWAZ8bdYQ1L8Yt5RR1iqu2wb
	GPbj5KTYeadGa1j2FyU7dG/Tx7f4pifKlw9VQbLeFkh8U2qBihBpyicKH0oEdrZS5V5ZFn0aunvJY
	lc9mLyQ1r/fZrz4bwDIVB3QwAgfFLGn9yheBWzu3ntDVaL6GXGC043GTvQhqexv1wVPFPTESL2R1i
	lLmIwlXBuSrLTY8dX7ih06GLzYyznxDeu2KjQi2g8BZWwkbYa2wCbjYcx0DuDnmwfuEfissbiVieC
	fc9ecD3cA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfXyl-0006Hd-Dm; Thu, 19 Nov 2020 00:39:15 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfXyD-0006CB-Ba; Thu, 19 Nov 2020 00:38:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1605746721; x=1637282721;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tBpauZx+fMSCAhtcJtgaXTjyMk4K33HNxdPCRgo5eAU=;
 b=auLqOSDGDeUH/ZgE0RfihCrdK7paKWK2VYIGQb40iqFI9VGRXTKVIpqh
 p2hcdL5J8tvKTBaTkJYhHbBsT9pBjRqF822ozxB8EEIZSIwGzmAmERaY8
 RqbgCv3WtD6iw8SUme9R3RY7dAMwTC6BI+g+14BSK6yZzWSLuU8DA/F30
 X/h6cLnLHh7gTl+B8WLv5rhgBLqDzhNSoiS3Vo1vx9owNgdO8fi1v/ymc
 jeuYs/qC8MwZc5rih/OipKrml8bpYI6W8UAjoDoZ/lr5XRsJ/sQRq0PRk
 Qe4yPfBhCM7jnxjfkDWjcaC/Kk2z3Oe0z3PNTqFdB0ge1c5yYczenzgvv w==;
IronPort-SDR: 3bGiiIWpW+OSLnKfbEEqObRNwGP8yerBMu5XBuFBDr3Fw4OQK0yR1VMxEvTzLHUKj1+F3KZKYb
 nW1fXHvzbaf0BQs6KHmPDuGb/oCgLr7HVCPGC7ih47HA2/JZa6jwdPVpm6X16pJp03YwDdnltL
 FUacKfUIoCmhUh7+nGxfcorAUr5icVgOAtbtG7zS+lmngK/Y0+iBs9XPLSzAzXvSjAq7KOMNTB
 53hpy176M34B80cWC27lWLCGuXb83AnKvLbrqYBYEcSIgkymws7qPe4GRpoIUzVhl3ahoCl8MZ
 dNw=
X-IronPort-AV: E=Sophos;i="5.77,488,1596470400"; d="scan'208";a="256529115"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 19 Nov 2020 08:45:18 +0800
IronPort-SDR: LSKsZZ7Eg+8HT398Ev5KTgXC5NXTXksDh6hXzQpih7aL+5IqKBJqy0tN+oNSi2Vku4v2usK3aX
 FafrjtUQtX0C1Syiyf2dZxBPvfOsK3HGCne294B5bbnAHRaZNa39G3Q2BBNTahA1vOBz9f97Rf
 HlEaO68yeEIuOvD9C+FJl8++Kp96zW61KDnN7tl0tqpKSEwgiKgRd/hT3vxM6hGodUSctmS9Hk
 Au3fPe3s5m1ZNXFoUzIdZ0Pp/JJfkmVrvlDTW26ePEsrBFr3FJcFfK6Iz+7kxVvGBJJE2kZKvQ
 ZsFaKZPJJFTPhMzNY3KB6pE7
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2020 16:23:10 -0800
IronPort-SDR: WCaCsrsQeD76vs6BFx7SRimVV5INxI7DErIY0dh+zHL6r7f7mSDPhUNFrE4WqDFTIutVZMMunu
 wqhTxTrVS1A9vDQVtpsuWjd/gi0VH2iIABey0qs6WV6Xv3BZacKVArX7YI67nLhsntgDW28ipN
 Xn4BjRUZbX1axB9UG2WOz118O/X055REKNgOJ3MBAMk7DUnaK/LdNxI5NBZ3Gzj6oL4LbP1s1d
 VwgDTQ2No147z99s/TxQB3G3eNk7wdpCEnmu3aYGSBmgCYjZBFQ4NDa3q2K0v3fseBt1l/zGNy
 6x0=
WDCIronportException: Internal
Received: from 6hj08h2.ad.shared (HELO jedi-01.hgst.com) ([10.86.61.71])
 by uls-op-cesaip02.wdc.com with ESMTP; 18 Nov 2020 16:38:37 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 4/5] riscv: Add support pte_protnone and pmd_protnone if
 CONFIG_NUMA_BALANCING
Date: Wed, 18 Nov 2020 16:38:28 -0800
Message-Id: <20201119003829.1282810-5-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201119003829.1282810-1-atish.patra@wdc.com>
References: <20201119003829.1282810-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_193841_626553_EFFBD5CE 
X-CRM114-Status: GOOD (  14.11  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Atish Patra <atish.patra@wdc.com>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arch@vger.kernel.org,
 Zhengyuan Liu <liuzhengyuan@tj.kylinos.cn>, Baoquan He <bhe@redhat.com>,
 Anup Patel <anup@brainfault.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Steven Price <steven.price@arm.com>, Greentime Hu <greentime.hu@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Greentime Hu <greentime.hu@sifive.com>

These two functions are used to distinguish between PROT_NONENUMA
protections and hinting fault protections.

Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 arch/riscv/include/asm/pgtable.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index a0f8a86236e8..64aba4f7a0ed 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -187,6 +187,11 @@ static inline unsigned long pmd_page_vaddr(pmd_t pmd)
 	return (unsigned long)pfn_to_virt(pmd_val(pmd) >> _PAGE_PFN_SHIFT);
 }
 
+static inline pte_t pmd_pte(pmd_t pmd)
+{
+	return __pte(pmd_val(pmd));
+}
+
 /* Yields the page frame number (PFN) of a page table entry */
 static inline unsigned long pte_pfn(pte_t pte)
 {
@@ -290,6 +295,21 @@ static inline pte_t pte_mkhuge(pte_t pte)
 	return pte;
 }
 
+#ifdef CONFIG_NUMA_BALANCING
+/*
+ * See the comment in include/asm-generic/pgtable.h
+ */
+static inline int pte_protnone(pte_t pte)
+{
+	return (pte_val(pte) & (_PAGE_PRESENT | _PAGE_PROT_NONE)) == _PAGE_PROT_NONE;
+}
+
+static inline int pmd_protnone(pmd_t pmd)
+{
+	return pte_protnone(pmd_pte(pmd));
+}
+#endif
+
 /* Modify page protection bits */
 static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
 {
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
