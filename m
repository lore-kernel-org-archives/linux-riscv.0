Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86646606A321
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Nov 2026 11:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ul2GOOBf;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VqAxEVHu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=M/l1rgP0EoIFI3QfxbapeLEJxDLq5OONVjMIIaTH56c=; b=Ul2GOOBfNePwrSDd8mR6rZhNu0
	1ARyNeENKERid1MVWVAALuM8YgVfhfDwEhNjO4riAdzZ9NrhQCR4FyyF8WIGOipiGf85SK7HcFnAf
	zAiM+e4akVfPp4VBF8BADXjkfz0OqeVvF5f84C4jaWmehk0WExqPxz9Cq//3dsPzrgxPZqAqvgtHE
	1TuaZuy41/m1iHAQ3/LnWXe/Xd2EuL1UNwri/TgBcTkUVGly5DuEk7L2hdpyLVJ32FWts99abWe31
	kBCyRKXzkPenWjbFEAsz1YuRLAnbBEe+fg+G0U3gmTyp7VwZjwYCIgHcOHsBCSslcCWnt3uiuDE5D
	2DEufPyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ0su-0000000G2Hz-3scY;
	Sun, 08 Nov 2026 11:16:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ0st-0000000G2HM-49Rq;
	Sun, 08 Nov 2026 11:16:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1518361263;
	Sun,  8 Nov 2026 11:16:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8193A1F008A3;
	Sun,  8 Nov 2026 11:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794136586;
	bh=pTL3W/tdk+66hSBUiF9xLt8oJSgQZMOfyjWHi+MQBy8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VqAxEVHuEhhuWlEGb3a6IcRZyzsBZId1gDwYYjwHpernz6+NWTAP7jGbs/6QQjRHm
	 VfC+qplsRTxDZ/vccuWSCdOmu1rpryCd9j8oOPlmOAONo+jZ0pP7qlx51TcZJVCM3O
	 4iJMzChAwjEJhqUqmKqLx4CGsRVFnzhWHguhQIzj5oB6MCGhqckA4UW6rASoF+fTX5
	 JpdLvciQEhY8AEWfhVNGoET/Cln25UEVVxOHtpsexdZf6n15F83LJFciV71ax1+y+A
	 DKcjPsbQQfbr1Te5VsGEHvxAzx4IY2Y7yOmNtDkYNW+9j0GfjPNR2zXAXG/bxyrs6U
	 /OZh+sg//YuIQ==
Date: Sun, 8 Nov 2026 13:16:19 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Chen Pei <cp0613@linux.alibaba.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, alex@ghiti.fr,
	pasha.tatashin@soleen.com, pratyush@kernel.org, graf@amazon.com,
	shuah@kernel.org, guoren@kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
	kexec@lists.infradead.org
Subject: Re: [PATCH v3 3/4] selftests: kho: Add riscv support
Message-ID: <avBaAz0_ZvN-3m4D@kernel.org>
References: <20261106071459.2003-1-cp0613@linux.alibaba.com>
 <20261106071459.2003-4-cp0613@linux.alibaba.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261106071459.2003-4-cp0613@linux.alibaba.com>
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 06, 2026 at 03:14:58PM +0800, Chen Pei wrote:
> Describe the machine the KHO vmtest runner needs to boot riscv64, so the
> test stops being skipped on this architecture.
> 
> Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

>  tools/testing/selftests/kho/riscv.conf | 9 +++++++++
>  tools/testing/selftests/kho/vmtest.sh  | 3 ++-
>  2 files changed, 11 insertions(+), 1 deletion(-)
>  create mode 100644 tools/testing/selftests/kho/riscv.conf

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
