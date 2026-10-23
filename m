Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81108606A31B
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Oct 2026 13:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DP2YQxj3;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=a4KzfrOM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kR1m11rlHKkjBEUkoFsH1BLIk46Wf7uG7XkYWp47vyc=; b=DP2YQxj31IUiCwvE3/Ak92XBN+
	2Kczesyqju13MF2DECA4SdTB3AyqhVyK6ExrFc/L2rlBtCEzC0NboVe3aA2TKPvwypIs4sLejbjvP
	Igz++fKES7tOL+WmY51XzE10XFreZEnB1ZfE64YK6FHQWJigz5xCYMVRp4o8yNLoY6UE6B7EY4/RE
	bwK+MEfXJ/KTm8i265s/VzcHBHdsYMz9ytT2yh95ivG/yM5naUqveDlGejwS8ef6xmU/HlM4QBjUb
	XEsSnz4mmXaqqPC2pLcODs0rhEEZaF9/X/oeWckiKavYzd6fUjpm8TAUt6Fhfl9lh3Rbl2HDR+yjo
	1DJT24hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFR5-0000000GOJ3-2HPK;
	Fri, 23 Oct 2026 13:35:58 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFQz-0000000GOIi-3ITV
	for linux-riscv@lists.infradead.org;
	Fri, 23 Oct 2026 13:35:53 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-91b83459526so11050626d6.2
        for <linux-riscv@lists.infradead.org>; Fri, 23 Oct 2026 06:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792762548; x=1793367348; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9CmvWQCO9ciSR83HG89op2Z5oG5Iu+ZEx0weEptYBic=;
        b=a4KzfrOMpgLwejZiWJLR8zYvNpsa75nIFsowq5pg2/9VU7cHE3MRIxm5pFC2Tit4oT
         DTbQiK+K+Q3/6L8U/1WZo2N/4wEfhE6fwy5uAa/TokKpR39lRBD5W3kB7xzciGo71pWW
         lz7KVtIg9XKV7liEm2rcCSsQuH90o8+zt5zPObZKE4EtPm5rJ2S2YO3hyaIqCppMnvEH
         WUOOgEk3XX6LlzYgaTUXPNltNjZYOCAn+oENo1h4SY3b52qAdY42XM1huYiZhEYIxib9
         Lrf/6IDZ5EK0wW4rbDN4U0W37Vvk4nQ697vTenFVXkBRr9sSUAojY2cRW7DBoMpjXgLw
         f1yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792762548; x=1793367348;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9CmvWQCO9ciSR83HG89op2Z5oG5Iu+ZEx0weEptYBic=;
        b=P6ZbJxD7aUB5jcT1FABlsjTT3ZVIrnoQCEXGcOwWLBz6Dkvf2d1s9mxYklprFohosD
         ABaX72R1IlzGvRN40ZcCmNr6yrd+uzM5PnwoMcEgnrYbG7xY/DTSg7F2soElVfVz0vUG
         HdNOfjg3YvMlbOfiYK9W2TZSFnDphjVMPauwYR+w/vgaVmM8aTN9HK6h/a1G91jFQ5Ih
         IUFpB8EHmsCmYP9aHZQRfyofMz8xWy6L1dcwkXG7aknBCxodF498fQ9hNR/jUSjEi6jW
         zC5xq/wmftmlidLNIb1CcKQFXvm8EiHdQHxJRUsLI4CHW6YzParUDxHPkrg8GOqSowYA
         XbJA==
X-Forwarded-Encrypted: i=1; AKwUvBwZcnspIcKJBj4+VDR17a4s/SOtqdDVmIzaq6ArTFQ3hfWI4JTLbKX/sLQ3sGNTUrDvW7ovQ14AwAy9rQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYLX9uKlQPHSFG1rmjkujQ+4A5qH8yiZtr7wFYUNBzW6dkkfO1sn
	ApW3oWq0xn0+mZMbGcuGhywPa3wscuAKhCB3ELKL99nMwOb8ZF8WxfEj6UP6C5TJqHs=
X-Gm-Gg: AYBFou2Pmgq2iwk9QxnjIOEpkTWyDhfq5fEH7uHTbC5LaxB0T8woQTp5A9mpV4V7HH4
	Fc+sQEZa/GFGdgBJrB5iz1bE4xqn+uisoYu1JyhdeMjU4r/Ho9j8Tocyy2CG/qfp++imZccywC7
	oS78/ahsaOjTc+OArNvStQt/+Br64/3KasUBAxtdeDn8cF7MMvzkBJ/L9L5+SAOQACHWhc/Jfjc
	yZDzX/EY+/XtolZ74Ex3UH7UyQPZoEDYm2tuXeUNSbmK3d/eSuyVGq9xxoRhSzt9F52NiHhlZlO
	5ex6439qG1dtZphPlPFpO/St7b9YUbLjk4jecO/gity5ljLI88h1jid0ieTPm+8JAjfkEcORkWq
	6yLAlHo5bsqIC0xMn2224hZrJxSnzhinywjLs7C48yYYA4jbFnYJwC3flaSqF0zVeGC5N9SO/Jk
	Ie99/FikpuooKNSVdfK2ZmzaNKDJ0wIUWhrWknmahdjUVwTdKnb0aLZsz/8cMZOsrFU1l8+Nu8g
	NFBq5FUjb4icgbv6qahwaWXwx1gvfWJ/DkONgJIS4bTSXna2ff7KxdqYxmEqlMezUOOVuUVgcVT
	/7fE9VzVbHWb+PO+OW8OInkVFAQ9aoLys8OCwS0=
X-Received: by 2002:a05:620a:45a7:b0:93e:6723:9de8 with SMTP id af79cd13be357-93f6f823981mr398926785a.59.1792762547650;
        Fri, 23 Oct 2026 06:35:47 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94047b4f603sm17521885a.40.2026.10.23.06.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 06:35:47 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xKFQw-0000000Gghx-2aEb;
	Fri, 23 Oct 2026 10:35:46 -0300
Date: Fri, 23 Oct 2026 10:35:46 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Yuho Choi <oss.patchbox@gmail.com>
Cc: Tomasz Jeznach <tomasz.jeznach@linux.dev>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>,
	Zong Li <zong.li@sifive.com>, Lu Baolu <baolu.lu@linux.intel.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	iommu@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] iommu/riscv: Keep page table pages when IOTLB
 invalidation fails
Message-ID: <20261023133546.GK3381610@ziepe.ca>
References: <20261020053435.1179054-4-oss.patchbox@gmail.com>
 <20261020053435.1179054-5-oss.patchbox@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261020053435.1179054-5-oss.patchbox@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_063549_837324_6C7F0031 
X-CRM114-Status: UNSURE (   8.24  )
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
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 20, 2026 at 01:34:23AM -0400, Yuho Choi wrote:
> riscv_iommu_iotlb_sync() frees the page table pages on gather->freelist
> right after riscv_iommu_iotlb_inval(), which does not report whether the
> invalidation commands could be queued or whether IOFENCE.C completed.
> If either fails, the pages go back to the page allocator while the IOMMU
> may still hold cached entries pointing to them, and whatever their next
> owner writes there can then be walked as page table entries.

Invalidation is not allowed to fail. Drivers always have to free the
pages.

The system is irrecoverably broken if the iommu driver blows up so
much it cannot invalidate.

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
