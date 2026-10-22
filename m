Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9543B606A319
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Oct 2026 19:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bQgDOTaW;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=K3K6wsXa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nQM2ZdzZIvuNCd3XCXgklJs9GtmPUWAlOMmYYo+1PV8=; b=bQgDOTaWZp0trKtSVU51njRiPR
	UXEuEssf4upPW8YiGw+SVxLT8FhjlpFbBii3hM+fVuGECWNwH1mIwphLMpSNTC7feFb7fa8I4lLXT
	pX1/q90Yo9xELWos09dYk7IKpqk3iGhUWXUlEjW9dEOq5ogB9G7U7g3R1Q85vFkXwlnutm9Ar+esg
	oopLZLWKURXtnz+Nt+C3BERUXR5OPws4WyYnVxOVvw0c40Vv/kraibFe2UVK+EaPyExS1ywsqzUgH
	gEbrWfDpQgYNTJ+/E8URn3RubQSF7v9qfr8Fg45eSR6Si4U7QYEDRhE7v9i6cNE+sXixNj28BZp3u
	vfvECEbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJysm-0000000Erzx-2ag5;
	Thu, 22 Oct 2026 19:55:24 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJysk-0000000ErzU-1Xlz
	for linux-riscv@lists.infradead.org;
	Thu, 22 Oct 2026 19:55:23 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5ba3b1199f6so86678e87.3
        for <linux-riscv@lists.infradead.org>; Thu, 22 Oct 2026 12:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792698920; x=1793303720; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9qxA+mjmpSVOmeaS7bsX0MCILV1F3DEdINdxxq5gFnc=;
        b=K3K6wsXah9QO/3ViytOzuKMIHv4M+lvDbgkNafhgtZ3YJ2rTJN4Eu4HTgi2j2g9YgE
         oavAAVrypRWkRsCt3JKIfbYIxhh6+vu4hbLzsszRSra8ZA7vECyKZZqt6xICyFHNm5V2
         vzB90zNKxcSQIqtGvYENc7k8P/7Mzuu/zfYeIZjj2guZ7wBsnG+/lSY3plFMgkzpbGWn
         LUDAUY0vhfEicqZ/LW9zcpmCn6X0xaoYV61irfTH2UWWwvqJc996RsH1ZsRI+xmHSYHZ
         3S1J0IRwM5WvNe0gi3l60KGqpUlICzX0DJa/7R9pDOyK6OI3F9HFlVqgB9QOpt19iuBR
         z1iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792698920; x=1793303720;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9qxA+mjmpSVOmeaS7bsX0MCILV1F3DEdINdxxq5gFnc=;
        b=f+6ANjimNHpZ2SMvY+nFdDkq1M2IUaXU/NVYwVoUgEFPUC4uDfnbIxr3LknpV8Xv6w
         2IcKKxR6os0IvqJTWei+TvrQqzdygy7gMvuG2y9Ym6BBnN4pd4yl7eiAW9NDuhp72jw7
         a/uhp8fiSJrg/wc+wDhKuGrz9iAI66XrNDZrzDK50WZ9aYXEUQJMZbWhYEK7hzI5XfG0
         1qPSKJ3CRXsamRppq1YVluV2dr7/wPleCNLdJwumlahwgQuNX3kTswtHWeJWa1voibRK
         nP4AOoCRsuTq4WuVqVUJnd4P4ZfNqXFPHDU+19WAzhGgznqI97fcd77DgImuyNa1EWzv
         f4SQ==
X-Forwarded-Encrypted: i=1; AKwUvBxdQ95rtPPbP4d0aMpDKopFu3/mUXLqIuichM5ahZkMR/JhVX4OAngI1WhIoy0Y5ha7J3fWhmImYLiLgA==@lists.infradead.org
X-Gm-Message-State: AFq9FYJ7LYV/oMcq8Coqdo+oNwmA07t4NHlTLWKR6/Ruarmt0NvFPwY8
	6iYX2iaNMaaZ2X+NU9hD25mip4SEJyzPHyVK3y0Gl3tHbhjDObg84/La
X-Gm-Gg: AYBFou0m/7P72xIG176lvf66uNSAGbtVddmPUQbJF//AlGy53MvoTl1cV6uvIs+EFvq
	M7SuwDHn98k/5Sxur+eBxjewRMW2WjthvuXo2T9ooJTwdGT/V85fl3lKk+Q4bbb1bGSwmIj1X7r
	z6qKBQzlLaFtHF4Xq095uLjY06lUYN/KgT4j40va2jyH7O4yUV7pfak08hBsknctc2o6UiFGugv
	3RixGhKtmh9+CYCcxIsrh3dEBmduAIzO7ZBTAtBNtTbUFlwaVx4FdEJrmpsVrYD3qe9SxuCSd76
	zeCijsHGC3BKzQqoxQ4yxRAWtByrzDgs7Aav0hQt4qimVLXm6OgOh91I5iQ/N69GM7eotsAwJJJ
	sIhgXcQD/zgrLy+VDajHuYxAB2HECH7RnOwew4wd5I20cxQLSfrFBp5/QO5W9Uu0zxBmKvzhSU8
	ttwa2nhthD1tNNBSyVIHYyMRKr6rrJancAxICh4pviIbGLaaX1xYFEmaEZymlwm2MMAo0EVAnU3
	hsTksM1Kb0dGpvh3L0qBIrmwlv4hW4kPqlS6Y00gsGDeDWva/R0CnY+t7AS+8j4yCjLVYYGlgvM
	kuhDC+wq/hHkgTSSCA==
X-Received: by 2002:a05:6512:a83:b0:5bf:af5a:cf26 with SMTP id 2adb3069b0e04-5bfb06cbcbfmr4297e87.2.1792698919896;
        Thu, 22 Oct 2026 12:55:19 -0700 (PDT)
Received: from ik5070.localdomain (82-131-69-225.ip.elisa.ee. [82.131.69.225])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-5bfb027d0a2sm30503e87.36.2026.10.22.12.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 12:55:18 -0700 (PDT)
From: Indrek Kruusa <indrek.kruusa@gmail.com>
To: Wilken Gottwalt <wilken.gottwalt@posteo.net>
Cc: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>,
	Bjorn Andersson <andersson@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-remoteproc@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] hwspinlock: sun6i: Allwinner D1 and T113 support
Date: Thu, 22 Oct 2026 22:54:26 +0300
Message-ID: <20261022195447.2007440-1-indrek.kruusa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022211952.7293f8b6@posteo.net>
References: <20260927025626.69614-1-tien.nguyenminh@embeddedlinux.blog> <20261022190203.1998156-1-indrek.kruusa@gmail.com> <20261022211952.7293f8b6@posteo.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_125522_417642_0C8C2620 
X-CRM114-Status: UNSURE (   6.47  )
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
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Wilken,

I observed something like a 4.5x slowdown - around 12 us per take/free on
the C906: the loop with the lock runs at ~14.7 us/iteration, the same loop
without it at ~3.3 us.

So yes, the effect is material.

Greetings,
Indrek

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
