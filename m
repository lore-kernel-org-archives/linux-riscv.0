Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B281B606A31B
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 21:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mnWmSnrb;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=oY6hUsF2;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Kzv9OIGZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zL9rnEBgCorJwH0i7yi/WEHfLi4NMu+uDwCBL/0qwH0=; b=mnWmSnrb6RreiMEvcyPbyKFPIT
	TEw6vglCqPcddawF33QnQD+UaZjSxCGVPWu3N3WhzsNgEransdxbn6+qIS2UD2EtLgExbD3UKQDwW
	MPWQmb44LOAnnkdoCYJgmK5ZgtaPH2n6k0Ks41xKLOiomcNGgFZZYZRwUq9Aa7c+F/WQzmdSs1VIQ
	i7mqrx8RostYydJryScSKMzfV0+pJrIL/627XUtJGQf4TaWzi90ly4IQDojl6Mcd5ysTod66Y5qMX
	hccx5RDebPyCS7zV6XDrjyfAtIUx9EXK0957JMEUPdMdJL7UmUaAc/dU9lo+3qJPgTNeHzNXVDwHT
	JTd+PQQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP5Ik-0000000AlQh-0I1x;
	Thu, 05 Nov 2026 21:47:18 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP5Ig-0000000AlQC-2oat
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 21:47:16 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793915229;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fWEq7ANjuAxT0SsQWCA6NNqlsk5fygPVddvQlmahPzI=;
	b=oY6hUsF2Jx+NRaoHk81kEfoNEY+zkReOYRbyvhWrJy4CqaCVDc/BA2X+16JJnZXeTPyy5K
	rnI7LOgaXmNRBNvXnGM+EgGTyQOBt8xy/GPCJJQgaXzTHvc7YbxvJ4P6tk8gUAgkWAlsmf
	sNr9aArKBucyyonucqvG9lGYA164GHmgyRp09lEuQIQWmaIW1MF/zmnBWSXF/Xj/QF5MUF
	X4yocNFsZcXQ+IAchbLZ4X70PhEHRpRBxSGeefm1GAopDbSo8s3fyeOCVTnH/EEe1rA1ra
	ApljPya+O4QdZIWd0iQpY1uie2Jn9IvWO6fry+v2OK1AqHjstIqp+DhfZfJCIA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793915229;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fWEq7ANjuAxT0SsQWCA6NNqlsk5fygPVddvQlmahPzI=;
	b=Kzv9OIGZXm3GfDja/e1kGOPpANmqPEdnG3/UWpLWsZ3yo+uGUbKbLNxSzBkZkOCvBFQ7qN
	Yv7wNl+KWROkx+Aw==
To: Daniel Matyas <matyasdaniel006@gmail.com>, dri-devel@lists.freedesktop.org
Cc: Daniel Matyas <matyasdaniel006@gmail.com>,
 linux-staging@lists.linux.dev, Andy Shevchenko <andy@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Alex Lanzano
 <lanzano.alex@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Conor Dooley <conor@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul
 Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [RFC] staging: fbtft: Moving fb_ili9341 (and others) to DRM
In-Reply-To: <20261105201154.37294-2-matyasdaniel006@gmail.com>
References: <20261105201154.37294-2-matyasdaniel006@gmail.com>
Date: Thu, 05 Nov 2026 22:47:06 +0100
Message-ID: <874idv2bol.fsf@yellow.woof>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_134715_016525_81E80537 
X-CRM114-Status: UNSURE (   7.15  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
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

Daniel Matyas <matyasdaniel006@gmail.com> writes:
> Questions:
>  a) Is removing fb_ili9341 acceptable, pointing users of other ILI9341
>     modules to panel-mipi-dbi? The KD233 node would then have no driver.
>  b) Or should KD233 panel support go into a DRM driver first? I don't have
>     its init sequence or physical size, or the board...
>  c) Is removal of all of fbtft already planned?
>  d) Several other fbtft drivers have drm counterparts. Should I inspect those
>  to see if removal is needed?

IIRC the main reason fbtft needs to stay is because it supports parallel
interface which is missing in the DRM drivers.

Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
