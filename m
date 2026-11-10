Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F63606ACD2
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 13:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4e7RGTFI;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=mG4SCDnP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TheKRHPCPQlBRhJhMOZ+JC3nR03ILHEMPFLrHqLMc/E=; b=4e7RGTFIztRF4vmKTxWO3Vz2gP
	WpL+lj5ag92njXlZH+VZEygBE1gF09mH9AXldjq5tFQEXOmSXckYwYbOD1JGVyHIkCa7kiTcihTR8
	jYiMTXGJOXtDtoI86tht+rNJkOq9JYF05mmI+mBT9q6yKQ8StfOcIi7D7j3DuIoauQjqw88frX+L9
	2+78b06jSKq8Cvl/GpHe+TllRCaxXvbnyNyLYBgG3i6gpGacPXvArqNS4dLPEGJz3jRkrOnGO8GCu
	Z1+Ha4HMgsBEvI243o29hb0+bGAQ73/ltc8DxY0JWONFIHLyhOFiYLAHAYRd1iRoG0qEuA4WqN0PK
	LBlKNM1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlij-000000040on-1ypr;
	Tue, 10 Nov 2026 13:17:05 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlif-000000040k5-1WnO
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 13:17:03 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-93e55db58cfso173820685a.1
        for <linux-riscv@lists.infradead.org>; Tue, 10 Nov 2026 05:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794316620; x=1794921420; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S4nJQhVDKToBC1JLFzd4gn3MfYBpNet9lByhTADIBpw=;
        b=mG4SCDnP7Upkwr32+kU+OHqIxzpbfd4zpom/Mm2KeQps0uvu9acivvuVajIB2zdx0H
         mr8YzhTb8137Q+DMFtRJYGxpoE0g1zXLgemEZtXG+yJn2AMhBznpNUDVh9GVuRYTwCF9
         x2gWubWT1nhcrcILNJANAacDhbo1ytGa+RLnAjSgm77zafkJXUhQXw3g9t/DLbqBbJEr
         YK2MIB1YmwRgGXZlL6UUQDfC3/YTMocl1nZKC/cAdZJj9uWfHxc+ZhqNoHlZhSgxTI3X
         4FnIJIStzbZtkVKo8opArcqFrNngfp1/wvJYxcFpCdm51UP1KSzrmYizFgohnIr4izw1
         dFQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316620; x=1794921420;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S4nJQhVDKToBC1JLFzd4gn3MfYBpNet9lByhTADIBpw=;
        b=lVxxTh0y/1Bnujj1zicVrUb9AYXqu92uc5OjvWUkrCydFWawcjBbJa2lSZ6cqiLmO5
         gxm1ptseuPP2o0af7A6s40pa2v+UfZUSl8e88HuamLhtYXsnOmDdra1lP6+Xx7hqgoGl
         RF7/rcFVefWGrcRYEJUnvmrV0gufW/Ze7jOo1XjVtlxfXEfJ1kHHb97AIF+rOS9sJzDz
         FYjPbM4t4w5VwQwRlK/lbpvXwzhNZWGGdNbYmJI5f+IDsIyoG3P0qg9JQ5XlBP0AdtTi
         rwR7zayNtvTfPlgiZ8ctyH6FTy+5WoiuV+F3WlMKpUvptEPW5xgXx2Jvqfytz/O5lPBb
         75Iw==
X-Forwarded-Encrypted: i=1; AL+hErHJygK7wH3yVvJkh4Ye7YrksU0kQl8F+NhWB0BcpCiZ7cPC7LQSd9Y2bMef4h8hYoYaJmSYyfZFA0uyBw==@lists.infradead.org
X-Gm-Message-State: APuU4Z8Zq2gjNEhMlPiO96E57lzVtYiCux2qEzVG9l+xIO67FA9Z6qIL
	pvwmY0d+Cwa2/cAoZSEj+9UZ2EPVJdyiabx4ukKu8ic3R9fbtzeXhY5ELz+qSaiMKho=
X-Gm-Gg: AYBFou2SN5hJzqD1d+qnFt+TegJFqmPAd1SY4u34gLkgQW86EdIzOOyL4lIxV4fkUWM
	U0amrle9lJhkRPrcCd20FFZJzxYI1+/SSvBiR9dCouLbAg3va1VA3aUMDtfmr2mLojdUJ1UwBDq
	zwXACIhlHnYKpbn8Qwn5sqbXmW7FoCCbXBW0PZJPkPl95K8nxX94roe9lMR3dhnEDTDnsCcFqs3
	j1X698etbmdAIbLBKXDeFR6D0rA6yu0ursjn9rc6eze7y2MYJazgwC0vR5a8v+GNeN24SpAX5gj
	upLDVbN6jetwyvDcNDkKLLynBuOxG/917Jvr/KH1JrJnfm3nMkoM2Pjb7zGE8gktwYfedUauJtA
	wK4O+uOLxCf7emRAESs2QmasM4keb3RRPxQ50OnPP/j4FceVW5882wUhfeL5DqvrXtT6IaIyV2b
	Ffegqu3RndWiQdl+5WZzKXHRKp5by9lSvKhAiNC+WJX0WXfavhguLzyWk0B2DxIBRbCh/UJlkqH
	1g1TujPoWEnLrGAxBGjGEuC+TKuCXBa79NOYyr0oIvX1ATDvVp+QUvRYkDlhrJ5hcNVcIsvPGhg
	y49f35s3/u7D1f+cghlobRJT5ObBAdNulzlVP522kz84Ew+c5pOHlrUmWz6BUqYSDYZTUC4CUUn
	lZcbz5cQS+9Y=
X-Received: by 2002:a05:620a:1724:b0:942:e4f7:6104 with SMTP id af79cd13be357-9479f3766f2mr439618585a.55.1794316619773;
        Tue, 10 Nov 2026 05:16:59 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e61c333sm220869985a.3.2026.11.10.05.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:16:59 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xQlic-00000005geL-2PDT;
	Tue, 10 Nov 2026 09:16:58 -0400
Date: Tue, 10 Nov 2026 09:16:58 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Gong Shuai <gong.shuai@sanechips.com.cn>
Cc: tanchi25@mails.ucas.ac.cn, alex@ghiti.fr, andrew.jones@oss.qualcomm.com,
	anup@brainfault.org, aou@eecs.berkeley.edu, atish.patra@linux.dev,
	fangyu.yu@linux.alibaba.com, gsh517025@gmail.com,
	iommu@lists.linux.dev, joro@8bytes.org, kevin.tian@intel.com,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, pbonzini@redhat.com, pjw@kernel.org,
	robin.murphy@arm.com, seanjc@google.com, tomasz.jeznach@linux.dev,
	will@kernel.org, wu.fei9@sanechips.com.cn,
	zhao.qingye@sanechips.com.cn
Subject: Re: [RFC PATCH v2 9/9] iommu/riscv: Add riscv_iommu_attach_dev_nested
Message-ID: <20261110131658.GW663069@ziepe.ca>
References: <20261105144944.10193-1-tanchi25@mails.ucas.ac.cn>
 <20261110115137.184160-1-gong.shuai@sanechips.com.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261110115137.184160-1-gong.shuai@sanechips.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_051701_453341_E4251F5A 
X-CRM114-Status: UNSURE (   8.47  )
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

On Tue, Nov 10, 2026 at 07:51:37PM +0800, Gong Shuai wrote:

>   2. Use the guest PSCID directly, but allocate a separate host GSCID for
>      each vIOMMU.

This is the right model. The viommu should allocate the GSCID directly
and keep it for the lifetime of the VM.

>   3. Share the GSCID and maintain a per-vIOMMU mapping from each guest
>      PSCID to a host-allocated PSCID.

AMD is doing this because they don't have something like a GSCID.

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
