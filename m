Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE6F606A319
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Oct 2026 05:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oVBIbKGn;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GCSfpTpm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Cy/fDT4gs/FUj8IsdkX5St9KXH9KL8Ec2k1W8fiitJU=; b=oVBIbKGnhlmgNV
	Ye9ah4GlqW4T09vAEtoxHkQjiVcduS5FlwrqyiHhaZtu0XaEBJHMTeyLpshZKUUZ9UE/7b8ffnMfd
	XHkXixk6hDB9czBcsW9aEEWUz2Reqq5YiB13dYYag9VJ0LIIiNC21xL0cZ4WQ8nju+vsx2ntiNhN0
	wnhClbxZ70u50AoGUdN7+dqZGqeciCZqcnHmhT6X9veHCix+43tyhbWpv59zKosPiOV0SnYZ3H2ZI
	Rsq8lF58VU3AN5pgenEjU2JnWx4cDsJ8Ff3GAuPgaWQtWUsYZOBNd2mU0V1jqRi+3riHoVwkAdiRC
	YjmCKHSNIM5R7LqI3WKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ2Uo-00000008sSW-459J;
	Tue, 20 Oct 2026 05:34:46 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ2Ul-00000008sS8-2ilv
	for linux-riscv@lists.infradead.org;
	Tue, 20 Oct 2026 05:34:45 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-93f3c895a0eso152240885a.2
        for <linux-riscv@lists.infradead.org>; Mon, 19 Oct 2026 22:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792474481; x=1793079281; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=flDdnbgpLbuu0srS7vDLug/Gj+E6AwZDNNV7bkNw8vE=;
        b=GCSfpTpmzBI4vmHDsXstAtJRxQV5Phq1NiVOq6Kdrk/dZEzviJ9TcnSm3Hb4YQfZwa
         x7I9BrC3DntpVvvFOkP0NQVGOPgoXxzpKyi8hEr1Rix1IWvVmdtTwsyJHVdLPLFJBha8
         G+dq2Ho/bWcUfcV5zPyxeeUJUY7hWBovDB2161dRopg0NT3U5+t1qQ/DvFnjq3v4cdbN
         e+FDLmdYbwnw9/B6LyrYwYlQw138itTogkfBi5re9kzGfOgOHBr5QoBYnxf5HUrexdTJ
         rfn7hu9xw12u6Hos/VYk/b9Zwpnzi7B3GwZVpEJgwK+bdgnQrB3YEr16VdbtprE437aZ
         Tn/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792474481; x=1793079281;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=flDdnbgpLbuu0srS7vDLug/Gj+E6AwZDNNV7bkNw8vE=;
        b=AMLx96s/YunfbMRdu1KlSsCnWOG+yqiJAJqifObkWG0Gpf6/kz3FHHccU4oQHCIlwa
         uOtb0dZsGUzFYaewIk+mmFo5VpRwlrPJ3302JxekfbGHHTpg5rSgaybjT6oqRQoe7fbr
         unj7xPXfDyBfDKXIegmdQLUW9t9yFNkGRa584jpHPN0WXaIdpwNZoWj8RC7Zp2mb0LYX
         g4sJRXoqp+VTYgr0XTdPDbQCU/IN2h47eqHGIejhHsaNfHV4pGw2Px4qfhy+K808XFKf
         NHhuIDT7vXgkPrDM2pDY2VSRSyjUJUz/UTmvuIijkvyqvO7u2vFv8/IP8tTKq9EueQ8D
         gH6Q==
X-Forwarded-Encrypted: i=1; AKwUvBx5rqzXTccRfaD/f3vtLaB6HotH6u+JhhLEqTq/iLOtNokqnoQhzIz1dbFzOcpEfvuJwaxw6D2Ti3AtDA==@lists.infradead.org
X-Gm-Message-State: AFq9FYIHcAKcp8+PlcgXCu4l2qBdg0DZ52OY2KmujyaDZplb9iHKObjE
	B/MzKUT4d9mhiSPHNS0dv3RSdPlMYfuYT9afFzQooMt1P8g8WnfSR3s8
X-Gm-Gg: AYBFou0dVloGjdFuofaf1AKyp4ZCqzZ5secNKPNDHdJ5N2L4bs2IfRR5wLAkzBXSF/0
	rVRD3VaJERAhuuRpUg0SD4U+e8Enydl7521enhy0l/DKUdB3ToL4UwTEvL+DLzdi2VjFbimysOB
	FyA+LvZmhnaKydxMzMz17II0g2EDEvFFOuOBlnELP6g53G7S67zUyb4pPEXy7zVUg7UXSK2QhXh
	xhwrrc4KIqC9clPbBhVZjKwSeH7RvXxRReD92DGoUZ094lmmDNlgEPiZPjIUNSh7OCx/9GWPr83
	CjcNxkT7jkqemJzYOwI+nYxCtyHA8LjrUbetkGECuFWl4WfC7dYWAf+nL1rYc8TxkxnkDEUuk/x
	RzRBY1IIHz4EXUloYxhD7jHPrQCqD9SpTu+7eKJrQ3PTDSDGKjMCqXkvfe6+M1MOE9S3AMagCpF
	foxGf0o/hsiIMlVMbp710G/xjqfpXvbWwPBSBa8cAu7OpEKUR+BIdZ/V/tdSwBvAaw8H/FkKfVv
	AUuh/wZvu5NHbh+Ern7ng==
X-Received: by 2002:a05:620a:2416:20b0:93f:34c9:925f with SMTP id af79cd13be357-93f34c995bfmr845551685a.17.1792474481518;
        Mon, 19 Oct 2026 22:34:41 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f4b082168sm139455685a.22.2026.10.19.22.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 22:34:40 -0700 (PDT)
From: Yuho Choi <oss.patchbox@gmail.com>
To: Tomasz Jeznach <tomasz.jeznach@linux.dev>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>,
	Zong Li <zong.li@sifive.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH v1 0/2] iommu/riscv: Keep page table pages when IOTLB invalidation fails
Date: Tue, 20 Oct 2026 01:34:22 -0400
Message-ID: <20261020053435.1179054-4-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_223443_695865_7799B5C9 
X-CRM114-Status: UNSURE (   8.39  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

riscv_iommu_iotlb_sync() frees the page table pages on gather->freelist
without knowing whether the invalidation that should have removed the
cached references to them was queued and completed. Patch 1 makes the
command helpers report a failure and leaks the freelist in that case.
Patch 2 fixes riscv_iommu_queue_wait() reporting success when the
command queue stopped on an error before the IOFENCE.C ran, so that
patch 1 also catches that case.

Neither failure is expected on working hardware, but when one happens,
freeing the pages lets the IOMMU walk memory that has a new owner.

The pages that the dma-iommu flush queue frees after flush_iotlb_all()
and the data pages released by iommu_unmap() callers are not covered,
as the IOMMU core does not let those callbacks report a failure.

The issues were found with a static analysis tool from ongoing, not yet
published research, and confirmed by code inspection. Compile-tested
only (ARCH=riscv defconfig with RISCV_IOMMU=y, W=1, each patch).

Yuho Choi (2):
  iommu/riscv: Keep page table pages when IOTLB invalidation fails
  iommu/riscv: Do not report a stalled command queue as completed

 drivers/iommu/riscv/iommu.c | 74 ++++++++++++++++++++++++++-----------
 1 file changed, 53 insertions(+), 21 deletions(-)


base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
