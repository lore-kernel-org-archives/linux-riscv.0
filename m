Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBFA606A32C
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 02:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sCv1oLBQ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gwsU4fMU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=UBH9HXHUZDVFU1WzwUWRAs0yiHYn8u05FNxSZalYcFo=; b=sCv1oLBQS9MOzOzyUF/JyWqv37
	idwKeiOkpiIOAh8Hthr8JRIP/fu6L4on5wBfXv/9tTFbe/tydB74O8MYmhKXJNUJrE/s/L5GgTNOJ
	v/E7iRTF+c/tbZeChSfw2NFwVqOzaLxS7oYRjj8VTKY6dCa8iJOiCYtf6yqb2cyVY4KQDqoH0PFrb
	HO68sh/+steZ9oUdTXe16ApEcYju+439It9GnsVMvNWtXdNnATRe4qM+tWxZPSnCdc2XYnE4fu5lk
	HKjJQ3g658+TqC7aVlfseX0HBAE6Wj2R972avTAMZCTt6Kr8UM3x9tY0iamAx87BbXL95WmYHpaWZ
	aobDDcqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTVer-00000007YMw-3L1W;
	Wed, 18 Nov 2026 02:44:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTVep-00000007YMV-2yjm
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 02:44:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 74A0D45067;
	Wed, 18 Nov 2026 02:44:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F4BB1F000C4;
	Wed, 18 Nov 2026 02:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794969863;
	bh=5DmkecMOTxZcIAZAb7P1VP7UPFOxhN7PcQY3b0v1YXY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=gwsU4fMU0b33MQ2MR39aAqpL9POjPT5wykdAHXSvaf5hfwatitC6yk+RAqIGQBips
	 4ow3sZO8g2zlLwD7iYslfmLY4bG98/tsi5FcoSzW30ZC9AgMQyzkFSvvQgeGfSPGdR
	 1rGSrxJEhtzMfesUiPiEabwUGEz6Q0eZKzI4Zo+nGZI+N3qXTN+xnECFlKFaVZYzRD
	 98RQ113mVhV0yfzfix5MmEs9P+rme6X9O+BAIOHvj7A28eN1ugNUuNbfevx6IeK6tE
	 6RywKyhKb1zuQNm7QRmV0u87u4J5RRJb6f9M/2b8GEZJ8WtDVFkjKPo8QNhk3nrwJK
	 g9FgjV14jcP1w==
Date: Tue, 17 Nov 2026 19:44:19 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
cc: Conor Dooley <conor.dooley@microchip.com>, 
    Valentina Fernandez <valentina.fernandezalanis@microchip.com>, 
    Daire McNamara <daire.mcnamara@microchip.com>, 
    Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Yixun Lan <dlan@kernel.org>, 
    Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
    linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
    linux-kernel@vger.kernel.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: k1: Correct missing space
In-Reply-To: <20261113185214.182695-4-krzysztof.kozlowski@oss.qualcomm.com>
Message-ID: <30dae12b-690e-a11d-89b3-bc6eebc1c4da@kernel.org>
References: <20261113185214.182695-3-krzysztof.kozlowski@oss.qualcomm.com> <20261113185214.182695-4-krzysztof.kozlowski@oss.qualcomm.com>
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

On Fri, 13 Nov 2026, Krzysztof Kozlowski wrote:

> Correct minor style issue around white-space - missing space.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Thanks, queued for v7.4-rc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
