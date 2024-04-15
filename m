Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D96BC00A94
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 06:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vbvyWApAKYVImeVW+B286ygY73B7BjJGNKtfLrf9KyY=; b=1zGzLJDVUrEX0u
	bH8Wah2yODhowxn7xZ/XU/oeRw3nZ0OqsSnn58t6q1FK7gTd89oqfMrrZrbvbT7zqtn0WiDFi3dUv
	mWImMpW9t/Tw5GcInMl+8wAgBJxEkD+/1T9ulqdWvx5MyHiIgr/+59kgadWvPdMmRejnq+neTVs0h
	KEXIUpoSNgQBA5N+zT/Oi4jgFIhblaBYZujfua32dxEKiBQLPgltenwsJz82KpPFQ5q16+uwUaF8a
	nSv3QH27ixlqeJfJ7x/9DpIfBryIzGWseMi6+zAHECbgb0aaGeOHEH6C5kaIZB6TSKFwTeFFFvDxG
	GYDykhOUcS/PkuPwX5kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwG9X-00000007DQM-0UiO;
	Mon, 15 Apr 2024 06:49:19 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwG9T-00000007DMe-0fo8
	for linux-riscv@lists.infradead.org;
	Mon, 15 Apr 2024 06:49:17 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6eff2be3b33so465153b3a.2
        for <linux-riscv@lists.infradead.org>; Sun, 14 Apr 2024 23:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1713163751; x=1713768551; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DErZWi0JRkT/kr88yhBbwPniJ+j3I4IxiglXEXSEUgM=;
        b=lmYWG+OO9KeOaIy2nD39tTzsOMxkjLyW/gg0t+TBdaCDtT7BwRPaxi6SDm1ilT6cL2
         7J/G5ByXzPZihMYvDf1uapyF6jH11s7r5ZElNf4UpMan6dCd8wEAra55+6fSFgm6yZmn
         ZDH3Ksc4/31DaWi5XXRWpk+8FWe0UNS1WWlJBKz1Rl3hENDsZNfLRMteipRIWHN3+JCb
         X92W5CPQuqvYn+ifjoba6373k/TVKVCx5cMF41028YYuhV4SDDrizWleNf3N9Pb7ajLx
         ItNnhjr/TbbqJ3+mZHybU+sp+rj6fdHLXwI1lbYIwcPhsIldqIAnZTlOR4M1C2zEz5Re
         Bvaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713163751; x=1713768551;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DErZWi0JRkT/kr88yhBbwPniJ+j3I4IxiglXEXSEUgM=;
        b=a5qxNefpH0F7Ak8vCSujWQ/3T4/2b/epCyK40/YNn5KnISnB0zMfNG7ysf8ovEWKMx
         yQCH4COt+5EBa7J8N+4Yde4EXA6aLBHHrS+1I3X9UCfb7Ss0NcnNasWnZWvXp58yoi+l
         vM9HngQ2AkC+NgKoCT/zoWz6+ux7rYWzWoWeawbs5TdUol0D7TTQ6+MJN+Mjr3Dn+pSU
         6kuDctPFUDgn7L7hsYERR+CmaoEy5jdakBn8UtvgPSoG4y+sNNUPPDU942RtBl0jqKd7
         BHzXaOFmyQzHBwsQuGBOfj7vgOFK9DsvE+C6fjSvSnZesNidsnU6eMRAIVXOi9sBH7Sy
         j9Vg==
X-Gm-Message-State: AOJu0YxlhB5EA4qQzJJOZqREYr0IJeLoLDE5mRRel8av9KOpeXuKghwn
	waZ/tU9D1ofiFIqtGIk9R1DxzNZfEu6pDBlS36I7WEHxo3RGZGEU6ZsWx4nir6rSpbis+4UpFyj
	zQ/J9jNRypfUPrSxXBw8RxKkq3c2NWRprmlgCPR2Ne7UgZrqVFGYxT3RM78D8VeCTGBBWPGZ7zx
	/18EswFBGTLrUrLw0KF778uxCK+yGT/zX6N0MS1q16aPJAb09KlzqtlH/19A==
X-Google-Smtp-Source: AGHT+IGn1W1xzHSGwkwC4Rv3qdVaNOqbbshITL3vRArjugmKJXVhxAVawHtGIDLdUvZYMVcufJ5VDQ==
X-Received: by 2002:a05:6a21:6da2:b0:1a9:4055:6dca with SMTP id wl34-20020a056a216da200b001a940556dcamr9192611pzb.40.1713163750420;
        Sun, 14 Apr 2024 23:49:10 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id f18-20020a170902ce9200b001e421f98ebdsm7148962plg.280.2024.04.14.23.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Apr 2024 23:49:10 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Cc: greentime.hu@sifive.com,
	vincent.chen@sifive.com,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] RISC-V: KVM: No need to use mask when hart-index-bit is 0
Date: Mon, 15 Apr 2024 14:49:04 +0800
Message-Id: <20240415064905.25184-1-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240414_234915_374642_EE730EC4 
X-CRM114-Status: GOOD (  10.83  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

When the maximum hart number within groups is 1, hart-index-bit is set to
0. Consequently, there is no need to restore the hart ID from IMSIC
addresses and hart-index-bit settings. Currently, QEMU and kvmtool do not
pass correct hart-index-bit values when the maximum hart number is a
power of 2, thereby avoiding this issue. Corresponding patches for QEMU
and kvmtool will also be dispatched.

Fixes: 89d01306e34d ("RISC-V: KVM: Implement device interface for AIA irqchip")
Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 arch/riscv/kvm/aia_device.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kvm/aia_device.c b/arch/riscv/kvm/aia_device.c
index 0eb689351b7d..5cd407c6a8e4 100644
--- a/arch/riscv/kvm/aia_device.c
+++ b/arch/riscv/kvm/aia_device.c
@@ -237,10 +237,11 @@ static gpa_t aia_imsic_ppn(struct kvm_aia *aia, gpa_t addr)
 
 static u32 aia_imsic_hart_index(struct kvm_aia *aia, gpa_t addr)
 {
-	u32 hart, group = 0;
+	u32 hart = 0, group = 0;
 
-	hart = (addr >> (aia->nr_guest_bits + IMSIC_MMIO_PAGE_SHIFT)) &
-		GENMASK_ULL(aia->nr_hart_bits - 1, 0);
+	if (aia->nr_hart_bits)
+		hart = (addr >> (aia->nr_guest_bits + IMSIC_MMIO_PAGE_SHIFT)) &
+		       GENMASK_ULL(aia->nr_hart_bits - 1, 0);
 	if (aia->nr_group_bits)
 		group = (addr >> aia->nr_group_shift) &
 			GENMASK_ULL(aia->nr_group_bits - 1, 0);
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
