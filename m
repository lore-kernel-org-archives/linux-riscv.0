Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C1C606D808
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 14:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TPSqltcg;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j1RLMMXH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xwn8P2ezrtQKOhB30dOncSG+wOG5ixHvF0y7BgXdzs0=; b=TPSqltcgx9TOLvYpOTE63hQ5aB
	j1i78LgSOOoDF3ZJy72OE+hxhSxWWoXV/z5sUO50Q5aRlHljiE6UxKDHiv79p4fWc2x90MD/+b5SW
	NQ70DilzQxhimQEWRm5ryxlRM2dOlX2b7XgxLwZdGspcSOo5/YFwMIBEQcnA6N0Jr7sFX3TBA9e79
	nRsr90BbYdKfC7uw5FA6ZTViZvtfpUAEhMqZKx2LkXFEqe9ZWz1nePBaFriC1HbhryOQ9rjrfAVq0
	OsGCX1jCu6OIZisuIhODhDmyGPrufbby8XYuZBWYBV6WxhWGakfUat1RdldSkd5VHuM3dfCRVEcXA
	do/cVdBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xObla-00000005bAw-11rh;
	Wed, 04 Nov 2026 14:15:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOblZ-00000005bAj-1JBM
	for linux-riscv@lists.infradead.org;
	Wed, 04 Nov 2026 14:15:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1587D4081B;
	Wed,  4 Nov 2026 14:15:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C18A71F000C1;
	Wed,  4 Nov 2026 14:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793801705;
	bh=dlGw1Vs2nk7w7nEQo4xUi2ZyVkWq2NAceMJqFlWbasQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=j1RLMMXHEyo2f6D1+nzgQCuhYaCy8BEeswjiZLJo8ntXW+jdVF1GBWevzM3w17WfZ
	 +xthdHRgLaRGDsv3+jKY9TB6VuKLHEQfuSjn8j1Quh6rFukilGSkfwftoCwF7sX9gX
	 +8Yq0YKDUOD/7Km4y/qM/JDxomv3bB8pgaPR6ENEKLYqgXEHjlYR51zXMWtxD37P9L
	 G8SH66QYQWQWROlJuKubXFvzKP08ofmjDuc9K4e1Uu3XMshNItX3wEwvlAj5VjDGn9
	 wEKx24WdcqMBV+ocQlu6VT6QerMwlB/JmFkwynL95bIikKijEyAPkojtLjRbJbcVKp
	 Bl97hZpy82pJw==
Date: Wed, 4 Nov 2026 15:14:59 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: Re: [PATCH] dt-bindings: mfd: syscon: add T-Head TH1520 compatibles
Message-ID: <20261104-cryptic-influential-fulmar-7d0a7a@quoll>
References: <20261103054716.1767730-1-zhengxingda@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261103054716.1767730-1-zhengxingda@iscas.ac.cn>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Drew Fustini <fustini@kernel.org>, Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Guo Ren <guoren@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 03, 2026 at 01:47:16PM +0800, Icenowy Zheng wrote:
> T-Head TH1520 has multiple system controllers for the "subsystems" on
> the chip.
> 
> Add them to the syscon binding.
> 
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
