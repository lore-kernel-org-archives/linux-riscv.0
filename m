Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD4E606A33B
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 20:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pbbhunre;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GJScaAsK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GjcBm7xTpNafh8anA3ugUYYY71l8vIa4q/CPwpPnQYg=; b=pbbhunreOh+6yFrY9l5WmRNXRX
	tJJFrvaW2bn6BuyZWkaiy7I2FGR5U8d/TkMBWpMwn3iCOdQlzfT82mRKZgg7pjKPBGWKDv/JY4Hds
	CoBJdL+PzNX32teriSiSeyDP21jwMSNNbqG9yuKte37/hEpMNC9bMRSESdWRDfvK9omfi8+KcP48F
	83s2NnPRw5ZLZidOr6a7JgKFMI1FI17NgcYzMFrTjzp4gnVCcms5da6b1zrXolOTAfQ8zv/HhoxVF
	CvjuVZuDNklCKsxMQ201Jz13OYPyYfbNf7oLzFqwQXIssuVDRmBt70sW6FG6V/agf+9DD3eXLsq9T
	Cfa0tjKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOhZC-00000006tCJ-1m6Y;
	Wed, 04 Nov 2026 20:26:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOhZB-00000006tC4-2DXA
	for linux-riscv@lists.infradead.org;
	Wed, 04 Nov 2026 20:26:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D694440325;
	Wed,  4 Nov 2026 20:26:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F7021F00A17;
	Wed,  4 Nov 2026 20:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793824000;
	bh=aghPuIRJUWq9GU43IJYTx4S4suWXwLWy5dvY8oh2ixQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=GJScaAsKHLdEfFmLAXFx3jWP2kmDsO9g1M/dGe7GY5GxgJPJ18Vu3Uwe6l01HTnVp
	 invE5IcmMOonkYnaa1dPR6r+Mm+jYOGl6pGQA51T5qma5V81MCGHcdRdM5kpib5jNi
	 /xhNRn2cH5UBh8tzu4qaHb3khjC8uOQ4f7FQDAZ/QRcbX9fzU31jzz76/8RZdkekJg
	 2xF3aUAOEvtCR2orv5T0Eo+ARZqcVfEYq//Sz6HcobLBxMdu24SbXce0JZdBnSER3N
	 xiVQIiYGbPJng9iv0zJfIJyeHNvcJpFDtpRnJWE2359K91NI3exvLjTt5GfLJyxOyf
	 SGzWVfmN4F1rw==
Date: Wed, 4 Nov 2026 13:26:36 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Jisheng Zhang <jszhang@kernel.org>, 
    Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: RISCV_ISA_SV48 and RISCV_ISA_SV57 should depend
 on MMU
In-Reply-To: <1b1ca4208d725ae0bb834a61636e48728d79cf80.1791973171.git.geert+renesas@glider.be>
Message-ID: <9d72bd63-51f7-7952-f325-68b9f50b757f@kernel.org>
References: <1b1ca4208d725ae0bb834a61636e48728d79cf80.1791973171.git.geert+renesas@glider.be>
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

On Wed, 14 Oct 2026, Geert Uytterhoeven wrote:

> These options are irreleant for nommu systems.
> 
> Fixes: 36de74049ec8cb1a ("riscv: introduce RISCV_ISA_SV48 and RISCV_ISA_SV57")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, queued for v7.4-rc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
