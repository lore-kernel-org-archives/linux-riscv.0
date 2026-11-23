Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80DE5606A327
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 07:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JyicGtID;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L/sdxyYw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zrK+OR5CZuXRYK5fFtO3b6329p4I2lWaG3VCYYL/Z/4=; b=JyicGtIDAt6zZEE06CUYPD/a0V
	JIvuBVCOOrgCeppPE3D79zWjNaD4hHAfnIMsfHmowOU6HMeMhWawMjgVVvPlA/QLlZEA8KFiPjgvf
	stz21Xv1XEWqsCrvaQX8aNrmbXlk7YXSPOmoxUOj6IlkMSTTEA2OjayTASjQ8ttYYhKUUG/0bVlMF
	BTiGvL9ZkeNN0BmpztPnbZth4C8bHMD8UhnopolUEoQISJ1irX8s2Bv7xAgDQv16SF+L1uwlqnNTX
	Xq9jvf0bKbPXCLrlsq9TOyJD5PisjKz5TtvE3LtW1vWYbjaQ7PAuknUsO/W532n62FlC1ufgcH/Gu
	Cqv4TmJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVO5f-00000002QT7-3nnb;
	Mon, 23 Nov 2026 07:03:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVO5D-00000002QO6-3J8O
	for linux-riscv@lists.infradead.org;
	Mon, 23 Nov 2026 07:03:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4511242A19;
	Mon, 23 Nov 2026 07:03:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8D6F1F000C6;
	Mon, 23 Nov 2026 07:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795417403;
	bh=66EgM4zK7IG8zCwjPTbi5vNEz/2nI2TGX5jJdEmsI1w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=L/sdxyYwswL8f2rMWAqr3ihbnMkAIAtcHSXZRSy1l2QDyg2A5hK52dS56/KD4UCo7
	 1ScMdhRxOaGteIvmGFmYqewqT2eyLZrYpFuwojA56X3B23UiCtYFXm8vId9JR350MW
	 9U4SPAhiFXoTw+42YLk72O8/c6kIaTa1XF6dNdym/wWvhVdQ1zCsOhNgtJQ6ufyDVE
	 m+fALj0z0zXsa3XoifoTRsQjrMkTs7CpOnqPalJtmgSlX4AAC+65LdUeDTpOz/we0s
	 y4UHq0Vu3UKF4UdufTGdwVKu8ZGlpr0fM64QnMSUs3yPdgkW/YiLNcq+bVI9sj1qu5
	 vBNGDLVQc1tsA==
Date: Sun, 22 Nov 2026 23:03:21 -0800
From: Drew Fustini <fustini@kernel.org>
To: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Cc: joro@8bytes.org, palmer@dabbelt.com, tony.luck@intel.com,
	reinette.chatre@intel.com, tomasz.jeznach@linux.dev, jgg@ziepe.ca,
	james.morse@arm.com, ben.horgan@arm.com, xiaqinxin@huawei.com,
	will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
	aou@eecs.berkeley.edu, alex@ghiti.fr, Dave.Martin@arm.com,
	babu.moger@amd.com, kevin.tian@intel.com, corbet@lwn.net,
	skhan@linuxfoundation.org, shuah@kernel.org,
	randy.dunlap@infradead.org, cuiyunhui@bytedance.com,
	yuanzhu@bytedance.com, iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	x86@kernel.org
Subject: Re: [RFC PATCH v2 0/4] resctrl: Assign registered devices to
 resource groups
Message-ID: <awPlOY9vr8Mqq2vJ@thelio>
References: <20261116071338.35991-6-zhangzhanpeng.jasper@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261116071338.35991-6-zhangzhanpeng.jasper@bytedance.com>
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

On Mon, Nov 16, 2026 at 03:13:39PM +0800, Zhanpeng Zhang wrote:
> This RFC lets resctrl groups include devices as well as CPU tasks. It
> uses the RISC-V IOMMU QoS ID extension as the first provider and builds
> on Drew Fustini's CBQRI resctrl v12 series [1] on Linux v7.4-rc1.

It does not seem like riscv-iommu in qemu models qosid. Are you testing
this on a hardware implementation?

> Feedback would be particularly helpful on:
> 
>   * The provider registration and lifetime contract, including how to
>     represent devices that share a tagging context.
>   * The bus/name token versus using an existing sysfs identity.
>   * The scope of protection after a command queue failure. If an update
>     leaves the hardware state uncertain, the current code prevents ID
>     reuse by blocking group removal and future mounts, including for
>     groups unrelated to the failed update. Would reserving only the
>     affected old and target IDs be sufficient?

It seems like blocking future mounts would be too much since resctrl
should still be able to handle cpu tasks.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
