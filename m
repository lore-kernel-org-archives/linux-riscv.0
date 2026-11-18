Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FFA606A31C
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 03:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bozLeaIC;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CocbHXbo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=P0oBifV5IKgqzQGMQIoyncK0f7C7xtdmdzbkHYueEz4=; b=bozLeaICvbhWZM9+ISB7hJ1yel
	YKJ66OedQmaDLNhhUfp/7P2nkAmeGcB7pVV0yJ0lXnr9WXTETlWpXTbKd1kQ+Mft9iaZaiLP+xSo4
	+TLrhq87IyB8Zi7ohKCe0nrJzD6nInchDuIpc4fkRt3T4vN4RIue0es56zyfuM7YjN9buD2kCvd1w
	p4sUWlqWd28VzUstPfFy4d6eZhWkQVPXV9ZO625VnFKzsgJYowQOQWqgdoehH2LT6tX/IufogatvV
	KMBLfTqWpkr+GkUoHU2eZede5bvxzpYnSQjxLvInJ7uCV7bxEu4kUFpTA1sRNVmxqrTiVbVonhSPc
	Hp4AuPOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTVyE-00000007aL0-0P7Q;
	Wed, 18 Nov 2026 03:04:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTVyC-00000007aKX-3gZ0
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 03:04:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1A986611A8;
	Wed, 18 Nov 2026 03:04:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FC441F000C4;
	Wed, 18 Nov 2026 03:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794971063;
	bh=iDOyOM3pB6qvCaRGy+TLEXidPtXZIfoRsDJEpybu5gE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=CocbHXbo0ZUBEyaxYbB5z1JIMOXCuDfGmh/zmH4falVsmix3goVWMRlsRn67Pn6jS
	 hoD5UmuTvWltwNaDcytohStNc+0jarlboevsJI9lOm5EeY5gFdsnDy2EtP9exKjngT
	 Uwqqyr74pyI7PivDak6FBJN3QU162pwO3B/SFfHFpEpuv0PuqASbdF1AWax3cwpXiP
	 rjtRyvq1fQQHtVI5SL/jMzvTI2krZKlr1NY7fC5ws9GOwoUPcdkPw56/vTQgj56LDF
	 72WReKuFkMg8Te62TBLINGYYY8dv5oq3iWaiwM3CJe7HfdhWlrb5etPmWv43/wppQr
	 Ff/cJZ3aTIh4w==
Date: Tue, 17 Nov 2026 20:04:21 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Conor Dooley <conor@kernel.org>
cc: linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>, 
    Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Alexandre Ghiti <alex@ghiti.fr>, Jisheng Zhang <jszhang@kernel.org>, 
    Andrew Jones <andrew.jones@linux.dev>, 
    Charlie Jenkins <thecharlesjenkins@gmail.com>, 
    Guodong Xu <guodong.xu@oss.qualcomm.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] riscv: remove RISCV_ISA_EXT_BUNDLE[_VALIDATE]
In-Reply-To: <20261106190559.1906130-3-conor@kernel.org>
Message-ID: <9edef307-ec94-2475-47e1-e433a2a80dbf@kernel.org>
References: <20261106190559.1906130-3-conor@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 6 Nov 2026, Conor Dooley wrote:

> From: Conor Dooley <conor.dooley@microchip.com>
> 
> RISCV_ISA_EXT_BUNDLE actually made sense when it was originally added,
> since it presented a simple interface where users (be that in kernel or
> userspace via things they are presented by the kernel) would check the
> exact extension needed for a feature, rather than muddying the water
> with parent extensions. As a result, the kernel does not track the
> status of the parent extension in the bundle, nor expose it to
> userspace.
> 
> This is in comparison to RISCV_ISA_EXT_SUPERSET,
> where the parent extension provided some explicit value, and would have
> to be checked for itself for some potential feature, and therefore we
> actually track the status of both child and parent extensions, and let
> userspace detect them independently.
> 
> Since we added this stuff, there's been some retroactive extension
> releases by RVI that have made previous monolithic extensions into pure
> wrappers that we intended using RISCV_ISA_EXT_BUNDLE for. Since we
> previously tracked that as one extension, and exported it to users as
> one extension, we can't just use RISCV_ISA_EXT_BUNDLE, and have to use
> RISCV_ISA_EXT_SUPERSET instead and nobody seems to know what to use each
> actually for anymore.
> 
> Just delete RISCV_ISA_EXT_BUNDLE for the sake of consistency between
> things that were always a bundle from ratification and for those
> retroactively made into bundles, with the side benefit of being less
> confusing for those adding extensions to the kernel.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Thanks, queued for v7.5.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
