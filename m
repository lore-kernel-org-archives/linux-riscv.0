Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB64606A321
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 10:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SuqUyiaS;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dDDKU9D/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=prCpfmUKQe5L4OGBF2rrzmLWdq31DXrTJEEKpP7RncU=; b=SuqUyiaSzLp/PNw0Pe+JO78ugg
	XGByFEMWDyU/Zf4ZXwT0kQp9SpfYMJS4B+pBJKCGSsWtr5iacD7swnJP0dpazOMAYUA0f/ip8byUf
	VeHU0pta47WJ6I3VfNY3KukQbs/9CvxUe5VLXAgIhYxAr4uUB+Kd721LSLd4/npo/1FhfMjj3eSsC
	6Y5KPINahDrgRgrPK1TyoXIb1ozEAPY4s7Xom/EAZV/ec0r0YEoxWPDykbaCpLVcByPvhaE+cVYf1
	vKr3NZdtxBb+lGh+zoVqd3uYlXWRfVeMXNaFKh5+crhquLageQdKJQ8LP2AnwloERSaQjQjt3WLMV
	1DqtsI6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQMNm-00000000NYK-0YqO;
	Mon, 09 Nov 2026 10:13:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQMNl-00000000NYA-11Mt
	for linux-riscv@lists.infradead.org;
	Mon, 09 Nov 2026 10:13:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9BC2440B54;
	Mon,  9 Nov 2026 10:13:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4CDD1F0089F;
	Mon,  9 Nov 2026 10:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794219224;
	bh=4cWcD/bzjuW1+x/I/VRjXTyV5V9MtoyJBu7/LrrJqG8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=dDDKU9D/nbWI947P/bqB5TRveB13WIcUMrx4AadpGAkSwI0GFbW14VGyiZS4uv6rA
	 KzKRBVbQ5xQHo4/+PKwOkCSwquxGwMEHIi1vpoQySTsu5iolONOgG2szMYlzITqfou
	 ziGzvfsqEdQ4yqkzrRjC/JrqQ1e0fXFITCG0JX4BiSHNg8eql6+gG44X2OaY7Z2E9c
	 iRk5l2/tLeq93iV+5xnpgfjLK/T3MpP3me724MKMPKXslzCdYCF0hHXQpk3jmyEzfO
	 d02a0eGdESWAtKs7tGHWv/ew1dkyKo8wyEJ0ZUQNfmVfWvaQc3HEiABnuD5334cH4L
	 HuKOTKOw8Kv+w==
From: Thomas Gleixner <tglx@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.dev>, Anup Patel
 <anup@brainfault.org>, Radu Rendec <radu@rendec.net>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Anup Patel <apatel@ventanamicro.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Troy Mitchell <troy.mitchell@linux.dev>
Subject: Re: [PATCH] irqchip/riscv-aplic: Process pending affinity changes
 on EOI
In-Reply-To: <20261104-aplic-affinity-fix-v1-1-e538cd76e563@linux.dev>
References: <20261104-aplic-affinity-fix-v1-1-e538cd76e563@linux.dev>
Date: Mon, 09 Nov 2026 11:13:41 +0100
Message-ID: <87pkweuxbe.ffs@fw13>
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 04 2026 at 14:21, Troy Mitchell wrote:
> IMSIC rejects an affinity change with -EBUSY while a previous vector
> move is still in flight, and the IRQ core then records the new mask as
> pending. The change is meant to be applied by irq_move_irq() in the
> IMSIC irq_ack callback, but APLIC MSI interrupts are handled by
> handle_fasteoi_irq(), which does not call irq_ack.

Which is a bug when the interrupt is edge type.

Edge type interrupts are fire and forget from the device point of
view. So you want handle_edge_irq() for them, which issues the ack()
_before_ the handler is invoked. Otherwise you can lose interrupts.

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
