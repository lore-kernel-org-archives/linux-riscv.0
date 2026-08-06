Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10694C5AC67
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Aug 2026 09:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qt50cNonqanxWbncAKhYkyLQ83/HQDnJibtIiOBdwgo=; b=VVeZTV+WYdKaxg
	ShqR6cXElcxl1o6OiRjEEsQZhl7qo92kRkKVl78cVcB44evDz8lZaU4PaH6+8s9+QErBg/Uc1ANDI
	3LRJlxMMtpFpjzHFOK4a6jSTtM1uuq1cv6G7T/87PkGxfabbAmpO7Wxq9L17vc0hdBIT24bJMvU1G
	Pq1vYjpBGSHb4iCoHdrqHI4x2s68eTldpWgRIOrNxXAXOoMy3UZLldA+rpM2XgQxEK4rC9prSE8RP
	BkM5UoCww9wY6rA3EZCZJKb4Hg1lOkCZazoyqmbAmvxcWVhmYzm5jUdK/oZN14TTnRXTqBwbeKwPR
	KHUEak2C2QW4M7kPwLgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wruWR-00000005PsP-0WrV;
	Thu, 06 Aug 2026 09:36:19 +0000
Received: from mail-pz2-x01.google.com ([2607:f8b0:4864:3b::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wruWL-00000005PnB-18Bv
	for linux-riscv@lists.infradead.org;
	Thu, 06 Aug 2026 09:36:15 +0000
Received: by mail-pz2-x01.google.com with SMTP id 41be03b00d2f7-cbb818e57c9so1074144a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 06 Aug 2026 02:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786008972; x=1786613772; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rxssx1F9jirIGuLt/jYdKLTnwp1BKr8qLnqrQJiF24Q=;
        b=catLnxlEqAboIhCc0f4K9d5FpSZTDYPbWSt3/UQfIPk645LrfEEIsgBrFQjNmh51Xo
         s1qvILZpkCv6+Fd4DFol3Ey4ezMKxvBjgy/4kvf6Ee92Fviv3lunbua0o05EYH5N3RiD
         eCeNFLXasaPpa40lVDb9NfZk2NGfxhVCfSBKQwGC8u63uQo47We8yeDdMjMXRNX4tZy9
         s2Y/1tMqC1zkKe014gIz+F13dr3gaqZQXesJ5Rg6+m1UKMJTmnD+kkwTOcW2RNvz/Jss
         ktyAwtXHsgTZ+4RLbQ0otLEPFFKcQt21+3/gkUAjbCSjgSTN5V7an58QmXj806e16pQg
         /CIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786008972; x=1786613772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rxssx1F9jirIGuLt/jYdKLTnwp1BKr8qLnqrQJiF24Q=;
        b=iCiieHvASZQKSy99z70NjsRy5vPn+PisxEDKd+9033Rq6lhUNhzSbizhftcJqiRwBx
         gV3U7N1yYvHVMJwSK4zLAL29IFUboF7GCmM/zW09mfER3OU1Rqc8sypXuMMsJg/kF1Oi
         LgzjZIH0HsEfuUuv31IpfLOMXuqFRGFLI8Z/Lh6nZL+oCdzbry+4ph0De0EZJqh+4Pvq
         Lgs5J8EVltaJ+ujKvEv74ew3rkKDJlYF0Kehg3igFADfo+3SIsEiI22p+b+6QmQLDNLY
         LYm+jAAhKIKPAyOZH7HKMoqAxjbMxXYceGVQC5L2d5tLly5ymeVlyLR8K+0V+Xdx1nga
         h40w==
X-Forwarded-Encrypted: i=1; AHgh+Rre6J0uY8TBPyYmRvOupWCBUf8iq6aQOwX/nEFknVCX+KTGFG/p4WKZe7POPdmo3APZABhimxq0j4kgXg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2tSgEcez28EWY4+S96hIu5vrRfWAkeeSOSShaIK27QVeF/hDC
	yqUmJmPOQ0u12EsiXaY+V9mbxn4J4GUsw2iFFjCa3N0VMn4MhbdVA2tu
X-Gm-Gg: AR+sD10I+syvVGHtrVufno4DSiEqXOfPl6OaJyTNw3p9vz6nrXR6PiHaPR6UyMjg55j
	9Tm7Myx0A5M78cCI4HtvLy8VUQe2WJ3n+eMvc3kx+Pax+tegMa/uL+v9QJbXiMOAK6x9Ji6wXpu
	sUecOBFnsn3h6EQaCDu3CZweknEBw6zgPVZ+OM8LmUJxrdE6PJzxrarMRKYMRUuq71xNANt0aTz
	S74VZf+FQneAPGCrs4lIH2iHb/JBgv6zSAsyqrfh5JZJMfOsylPx6hI0jcHUDRdlCgA1ikqUCya
	cx2plNYatfQHAaE/qcCnW96/2Rib1Z32hn6rvX6seV5pWoj6f3YFPB/5HAxmPAEFCPjZaap4e/p
	JHOIKsmqf4wITw7L5FDv+Axv88HPo1bJ4NKo/bFI1kydfikXppFMS0/yUcubi06W/dzhICUaJsA
	4Oe49b2ivYgXSAu4zgZS6ROCgR2m+bT6oaVkLdeJYcnVITysneLSOV3CRvQJvdDVNhF/z7orER8
	Q==
X-Received: by 2002:a05:6a00:80e:b0:847:e791:d5c5 with SMTP id d2e1a72fcca58-84f2e0dc989mr14792962b3a.35.1786008972602;
        Thu, 06 Aug 2026 02:36:12 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f453b0aeasm1043878b3a.13.2026.08.06.02.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 02:36:11 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh@kernel.org,
	saravanak@kernel.org,
	rppt@kernel.org,
	baoquan.he@linux.dev,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	m.szyprowski@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-mm@kvack.org,
	kexec@lists.infradead.org,
	iommu@lists.linux.dev
Cc: kernel@xen0n.name,
	alex@ghiti.fr,
	akpm@linux-foundation.org,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com
Subject: [PATCH v5 3/8] of: reserved_mem: mark /reserved-memory entries with MEMBLOCK_NODUMP
Date: Thu,  6 Aug 2026 17:35:14 +0800
Message-ID: <20260806093519.2907771-4-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806093519.2907771-1-chenwandun1@gmail.com>
References: <20260806093519.2907771-1-chenwandun1@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_023614_548827_E6B8D3D6 
X-CRM114-Status: UNSURE (   8.64  )
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

From: Wandun Chen <chenwandun@lixiang.com>

Mark non-dumpable reserved-memory regions with MEMBLOCK_NODUMP so
kdump can omit them from the vmcore.

The marking is guarded by CONFIG_CRASH_DUMP so non-kdump kernels do not
pay the cost of splitting memblock.memory entries at NODUMP boundaries.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
---
 drivers/of/of_reserved_mem.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 7b1616b9c6c2..f38d11df6f15 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -674,6 +674,9 @@ static void __init fdt_init_reserved_mem_node(unsigned long node, const char *un
 			rmem->name ? rmem->name : "unknown");
 	}
 
+	if (IS_ENABLED(CONFIG_CRASH_DUMP) && !rmem->dumpable)
+		memblock_mark_nodump(rmem->base, rmem->size);
+
 	reserved_mem_count++;
 }
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
