Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBEF606A337
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Nov 2026 15:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ob57u3g5;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=w2pR9wVL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WFNronv3oGXJTGyrXdWlCS+jgKNnyzKAlfYFjsOOpqI=; b=Ob57u3g5AK/Pg0YJz7u46xWLXu
	fu4B7qzb97G3oxcgK/VWlPKABBiezMaBcFtcAS2YjAiJcGBSOEP4MDIz8RiCUZ56gQGcgrGoQsGWP
	V/xbDLzBlWlMMhv031dCHfF98BEllewBxE9AwLogMKLoDwX6iXXaZ5IO1vIGzDtj6YzCUcQsSbv18
	quYZYAoGoGY0IbrzMzFKFtlI4XAkb/DIfH4gHbCPKT9KyEEcA0IIj5vWucKmmAEUJMJ7SCC/bflOZ
	9ZJEJ0UJKOGHT4ZXJ2DLLYG3hEkqJdKMTN+zqabfP9kPbdEJ/RFTwlEJ/IAQvm2cKhfoHLhO/AR8W
	A4RUbfLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUnLK-0000000HOoq-1shX;
	Sat, 21 Nov 2026 15:49:34 +0000
Received: from out-84.mta0.migadu.com ([2001:41d0:1004:224b::54] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUnLH-0000000HOoF-0g8J
	for linux-riscv@lists.infradead.org;
	Sat, 21 Nov 2026 15:49:33 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=87tG5wTJqa8KKU5Vw1XcYaRFIKmNyRkg1DQIqfjExPM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795276168; v=1; x=1795880968;
 b=w2pR9wVLVUEmNc/0xvbGAfErcyc7Q064cNe2Qb0JIQ8E3trfNPtCcUuXokXWWavloaXnxfRU
 Y3drjX4obip27K21vOfT/kadJGIDVNpdHfim3KoKCHqoBpoWUFI7VggUrR3pFshFi6VvgDpAEym
 dXAczSt5dyLO0XQ6IT/CY/Lk=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 1cf4a9c89376da71;
	Sat, 21 Nov 2026 15:49:28 +0000
X-Mizu-Trace-ID: 1cf4a9c89376da71
X-Migadu-Flow: FLOW_OUT
Date: Sat, 21 Nov 2026 16:48:51 +0100
From: Andrew Jones <andrew.jones@linux.dev>
To: Gong Shuai <gong.shuai@sanechips.com.cn>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Tomasz Jeznach <tomasz.jeznach@linux.dev>, "Joerg Roedel (AMD)" <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>, 
	Andrew Jones <andrew.jones@oss.qualcomm.com>, Fangyu Yu <fangyu.yu@linux.alibaba.com>, 
	Tan Chi <tanchi25@mails.ucas.ac.cn>, Wu Fei <wu.fei9@sanechips.com.cn>, 
	Zhao Qingye <zhao.qingye@sanechips.com.cn>
Subject: Re: [RFC PATCH v3 09/10] iommu/riscv: Add
 riscv_iommu_attach_dev_nested
Message-ID: <awG5Q7pmntSme1A2@orel>
References: <20261119132744.396426-1-gong.shuai@sanechips.com.cn>
 <20261119132744.396426-10-gong.shuai@sanechips.com.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261119132744.396426-10-gong.shuai@sanechips.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_074932_183673_FE4D12D4 
X-CRM114-Status: UNSURE (   8.53  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 19, 2026 at 09:27:43PM +0800, Gong Shuai wrote:
...
> +	if (riscv_iommu_bond_link(s2_parent, dev, nested_domain->viommu->gscid))
> +		return -ENOMEM;
> +
> +	riscv_iommu_iodir_update(iommu, dev, &dc);
> +	riscv_iommu_bond_unlink(info->domain, dev);
> +	info->domain = s2_parent;
> +

When moving between the S2 parent and a nested domain on it, the parent
briefly has two bonds for dev. bond_link() puts the new bond after the
first bond with the same GSCID, which may come before dev's old bond,
and since it's then dev's first bond, bond_unlink() removes it. dev is
left bonded with its old GSCID, so its new GSCID misses invalidations
once no other device's bond has it.

Passing the old domain to bond_unlink(), like I do in [1] for a
different reason, would let it remove the bond matching both dev and
old's GSCID.

[1] https://lore.kernel.org/all/20260928143113.49838-12-andrew.jones@oss.qualcomm.com/

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
