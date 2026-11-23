Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42DCB606A31E
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 09:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KNtXsHkq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qiPT81JZd8xmBe1lNjbI9mZY8duI8RXA2mV3GCl9qyc=; b=KNtXsHkqFoay8ybfiG4leDUHvQ
	DLGfwHFEkyUxOMf86ZuTrz/Buhoke5Q9XBPRtCoQkJnJKOzLIMbk4SqRHZgUBymPkg7Xe+zwpZB2u
	UsUzvhh5okEsWY+tczmpqV4HqqU2e47d9AN5+q1g1W9EC/MrkmYH+ZJJYS0Znf/J36xHmFc0STTDH
	fc9tcU1fUR+SilEE4o9GCijcK6bjj+WdeFYgEejFdspCs0adIWQUBnnh5cAaQzshMAoJI86wtDZas
	42D5uFCCGC9regpF45u/Vt0cZeMps8Ly0B/ckTYHmdRriSwHgdGId+rsXp44tXMDc+uipvd9qNLTF
	CXK0htvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQ5s-00000002f98-0Ddz;
	Mon, 23 Nov 2026 09:12:12 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQ4w-00000002f6V-0QUz
	for linux-riscv@lists.infradead.org;
	Mon, 23 Nov 2026 09:12:11 +0000
Received: from 8bytes.org (p549216fa.dip0.t-ipconnect.de [84.146.22.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id BBFB4244C20;
	Mon, 23 Nov 2026 10:11:12 +0100 (CET)
Date: Mon, 23 Nov 2026 10:11:11 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: robin.murphy@arm.com, Andrew Jones <andrew.jones@linux.dev>
Cc: linux-riscv@lists.infradead.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev, jgg@ziepe.ca, jgg@nvidia.com, 
	will@kernel.org, pjw@kernel.org, palmer@dabbelt.com, anup@brainfault.org, 
	tglx@kernel.org, kevin.tian@intel.com, fangyu.yu@linux.alibaba.com, 
	nutty.liu@hotmail.com
Subject: Re: [PATCH v7 0/5] iommu/riscv: Enable MSI remapping and IOMMU_DMA
Message-ID: <awQC8jVJC1mQYUTQ@8bytes.org>
References: <20261022154603.1374754-1-andrew.jones@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261022154603.1374754-1-andrew.jones@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_011135_016290_BA21B7D2 
X-CRM114-Status: UNSURE (   4.51  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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

Robin, can you please have a look at the iommu/dma changes?

Thanks,

-Joerg


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
