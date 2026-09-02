Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF7B6C61DD6
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 07:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hkzix7cLsb6s5AnTSfDh5TXOwXPrQNt2vMQuKRIPVTM=; b=CYII4yvmSRmt4M
	jDqXIFRk9uB50mSn7FflsVvHxKE3UwYwMkIv9Q4BW4uzMBd2UErIC596dZs3TFb2ouzZskXUlhfwC
	lH+P4B5vN3A0mbkcRLG08nEj0XZO5aq+tJOjjnxXje218O4v4o2Y8Jyv77An5IKl372IiCCdL0405
	57L44sKMlBv4WBj5MFihvTc9wFEu5OZjSosw4LO/KubCjmPVvxqiKwDaNc3MIwqIvf5uuK/2o8JGF
	m4fGNuK51pnsl8qyAg5YTO7LiNHJFzAi5jyIzqFVO7rSDvT1Yp1x62WcMT47tmk6gdq0Oqv5ILDoP
	mLm7SJEBKZ/Bnr4e4hdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1fRl-0000000Dvhg-1AvS;
	Wed, 02 Sep 2026 07:31:49 +0000
Received: from mail-pj2-x04.google.com ([2607:f8b0:4864:39::4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1fRi-0000000DvgZ-2eWP
	for linux-riscv@lists.infradead.org;
	Wed, 02 Sep 2026 07:31:48 +0000
Received: by mail-pj2-x04.google.com with SMTP id d9443c01a7336-2ccc2e84048so2638205ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 02 Sep 2026 00:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788334306; x=1788939106; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uqv+RTAI4cJSSsg2qdg0AwAoAqWKAsIT2FLXo2GNbW8=;
        b=T2liDEm/t9Mu1l0AYR0Dgeo/F+RZkNWehenuXv8MBEYxE7D9x7HgUGeo0ScFxLowYI
         1myR99mGNebgEpU3c6qd92zk4MDwzck+xjJ6+durkS0KxeO6MidGYJuxjmfDhVaXhlOZ
         kfAzmIB81NP77yx2ub5qaSu60zChgpRYTj+sgzaPONanj8quW/aNJN2wOqFcxQ8Tzd+W
         PDvo57czoAg259iZXfGINTrJeKW/1jBlyCHyhJ0fsm7DU85dbLssPEhhGZ2eI/a7t4sC
         CllKBAHnKwpZfk9+5jhuZgYJ2irbeYAOjYRb7VDCAQnj/wrglblhI0sJJOCuJYRx3mHp
         Wijw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788334306; x=1788939106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uqv+RTAI4cJSSsg2qdg0AwAoAqWKAsIT2FLXo2GNbW8=;
        b=sWFFJyOTC+zzPyxoVWLvZkBYmEEaVyl+339pTmc66n9nt4oRTNT+30uw31m0nSfuF0
         PTFAlb7xSTreXpnos+Y+XQW9QZOOd+hOW5rDbkY1l4JHIHwMklD6MMVT9B8o0Ly0xaLZ
         JQa0EayzhMac+vVpdySScItN1Z5nT3hT3ynRt5j9LLgXc4VG/aMaeSL+Bn3glN6NSnHm
         fuFt9didn7LZxkFmUHruR2WucLmolKSZXg+psLCIVN9mY6t5iEt7pgA97MsDDk6YB46c
         MlIFYeci73jk3d+E/Aa8bDYh0fe0UzXWUR8EgeVYxpoXow/4saYoB/3WM8idFRMItgNq
         MX5w==
X-Forwarded-Encrypted: i=1; AHgh+Rp9SGI9bkROijevwAkIN//U5oJIHcmEfBOioe3dj2nsG/s4075hsfU0IfrvjE2IRgHZrPYEJonxGoxcoQ==@lists.infradead.org
X-Gm-Message-State: AFuF++nkQzC25zSv3BV8Nm3K1gIk5+oEnmYXohFkFZGAAZr6lYe62zb9
	17A1vA9De2zkkktZN93G0ezibkJwYI8OVJZHVoJVXc4JdFABlbe9SjGH
X-Gm-Gg: AR+sD12GOY0BDvuEW6OAES38Oi+da8Pote2ku+d+sZ0WplVQK+CjGgpK821zenIwMTp
	BfdhXr22UDjILJ4VOZPQlFQX61Asi2Wt5F9biwUPugmShwQD37LEt9d5Cb6u6vEIcej7cu1SHb2
	m3guCPJAx6PVoNK/7b2M80NkCWge4xEEKvuMQVrGJeJr1uAJ4VDaromoKaKrG+UGO/0NPBnxBbg
	6ERdujNIg98/ybyWASwM3WqdKIHtdhFnWlUYsGicw303hLmVqVv70b/M7t9+1A1t/gwOYOT/RVm
	HHWldYXzp3uPZ21bKNxMWnGs9tACNxqHMBZds6oD7T8T44QfZf/xIaELuelCeg62Gh4dLHIgPyq
	Fy67cXIgnqRfNjYKha5NVwqCSIq5bzaZksO0XfWdvTOVKSC8Cdli7q7q46yiBqn8Jq1GFDR0+Lu
	KbCm2tpyOaSErHTQ4DgQZjCdQyHZY0nR2187Dt8uq+p3gdJrJhMPXB4BXPeeKgfexgeFobdqW0
X-Received: by 2002:a05:6a20:258e:b0:3d1:39e9:b261 with SMTP id adf61e73a8af0-3d9aa4ca9c0mr4530228637.0.1788334305736;
        Wed, 02 Sep 2026 00:31:45 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85db2adcbedsm926914b3a.20.2026.09.02.00.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 00:31:44 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	robh@kernel.org,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	m.szyprowski@samsung.com
Cc: mark.rutland@arm.com,
	kernel@xen0n.name,
	alex@ghiti.fr,
	hpa@zytor.com,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: [PATCH v6 01/10] mm: memblock: add missing HugeTLB flag name
Date: Wed,  2 Sep 2026 15:31:07 +0800
Message-ID: <20260902073116.802752-2-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902073116.802752-1-chenwandun1@gmail.com>
References: <20260902073116.802752-1-chenwandun1@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_003146_739826_48E8223C 
X-CRM114-Status: UNSURE (   9.56  )
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

From: Meijing Zhao <zhaomeijing@lixiang.com>

Commit 7d163a75f821 ("memblock: make HugeTLB bootmem allocation work
with KHO") added MEMBLOCK_RSRV_HUGETLB but did not add the corresponding
entry to flagname[]. As a result, memblock debugfs cannot report the
flag by name.

Add the missing RSV_HUGETLB entry.

Fixes: 7d163a75f821 ("memblock: make HugeTLB bootmem allocation work with KHO")
Signed-off-by: Meijing Zhao <zhaomeijing@lixiang.com>
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Link: https://lore.kernel.org/lkml/20260821020910.3428585-2-zhaomeijing100@gmail.com/
---
 mm/memblock.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/memblock.c b/mm/memblock.c
index 9ce86349a29f..f2952d725c10 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -2886,6 +2886,7 @@ static const char * const flagname[] = {
 	[ilog2(MEMBLOCK_RSRV_NOINIT)] = "RSV_NIT",
 	[ilog2(MEMBLOCK_RSRV_KERN)] = "RSV_KERN",
 	[ilog2(MEMBLOCK_KHO_SCRATCH)] = "KHO_SCRATCH",
+	[ilog2(MEMBLOCK_RSRV_HUGETLB)] = "RSV_HUGETLB",
 };
 
 static int memblock_debug_show(struct seq_file *m, void *private)
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
