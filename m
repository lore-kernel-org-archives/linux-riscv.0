Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A3F606A329
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 21:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HOwvIPfF;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gGtERGWA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WGc4Yn+sesB7Q9isfZq2emKh1siPYOCMOy8dy7X+3Tc=; b=HOwvIPfF5pSv3Dt9iaJmuHl4iv
	vOMu+L0fCFxBYhdwyxCth5a25jz3Th+T05uwEgtrjXVQpafdHU9lyVznWLq2A9Zs5rZaVjVAmuXLs
	FOoGJf4YCuAtX5iQ/Crmj6Cwa0XyhCzOqyIIApi+/4bARjNfwHLo0QI05BheApPe3q88gHDzltQKB
	BxGJr/pMX0MLz23lyI1x22OACJtSEyHbnz1+rqWfenenmTYBzVgTMaYs7/B9jBH0oaLnyexfwUSHa
	hpgMEr5Jz4BIPZsNQU5t7/xhM54Jzo/SUWNxPZIMJ3Xh+siwOGnW6F0mVq2vegCHoi11s4DuxF1to
	32Oj9/Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPRFY-0000000DfCR-0iqw;
	Fri, 06 Nov 2026 21:13:28 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPRFV-0000000DfBU-3C7y
	for linux-riscv@lists.infradead.org;
	Fri, 06 Nov 2026 21:13:26 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-48e4831c028so1132777f8f.0
        for <linux-riscv@lists.infradead.org>; Fri, 06 Nov 2026 13:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793999604; x=1794604404; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KAgB2fssjvIHHivLsh4UbVD8IvzJBAHBr6xJYRkzEJE=;
        b=gGtERGWArkx01ZOAaHEgWy31j2WjPy5BncSjOlczSBlVROZaSKqsc25V5ffYW/YhUs
         8gpgRTYjFXd+4ljK3nLXPukirCSTckcPJ8gVDF0hJqNOpueka0a4EhpigSDR6sNalKWX
         4UQU1bVLWCdhp+1+u1CYqJbG5NgFS7cPCXfypkC+Lv/ji+awgh8qrE1Rnud4yIZi6yno
         557o5wMbrpbO82UrlB32/wMviN20FAYm8DImeb1l7k3FBGwn+gsaKykumJIiGCufcDm6
         Hxm9dOVtWz1GPjL8kLj+a4B3qxxczdi/dNP2cP4/JuivOQJAbLJsCjYo+XtKCUHfYqrd
         Sm5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793999604; x=1794604404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KAgB2fssjvIHHivLsh4UbVD8IvzJBAHBr6xJYRkzEJE=;
        b=XHRdqFWZnEU/rEQTA3GHZGNifZ6UBhz8vLWNx31+VzIIltJL2xvpfk/cp4IT7X4LQE
         ZR+RLrEtBH2blYTGMwXJRb39H8latux+6swnwXGC47B6aAEPDjW+wE+dzCBukwfvv2fa
         geynYVfrdSkSSkDuuos7nHmQaoKqv7euTJXVREK2zVlip69E8zrk6tE6ZAthNZaM3lXn
         yXZDpRii4tUOiW5ohmtWxQqH0cm1epHj0r8WnO5f3TyC71OoFSyUjWGRfsHeThpab+QJ
         ukjxGhS7Jet3xMyzQ/YvTyeI4/1yjbHLt6A0yvOJZMn/rnl8n+/RrSPNA9EpjLJD7pyN
         ddnQ==
X-Forwarded-Encrypted: i=1; AL+hErHULmTfbtLQyKl9YNEWVg4odvEwA/F+26BSihj+LVf5q8iQLfhrQoetUYPpvk7SaZ5aWE7DUQVCahvfWQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z9ZY1IEfoRnKM4G5ikoHcHmwl31iJV71HqliZ6Hzwvw9zjsZZ05
	78PTagJ0Hyn4aTuMEe4ZBAyChSvt72Kfgv90sH478dO9quWdCg2ERxYy
X-Gm-Gg: AYBFou2lciSGct2GjJ+LSthSLZxRqzhMyqIRCsg4ijn7x7em60MQWEVaZcmcfX9u0g7
	N9T8XWBmdhnSc0HRovsPuextVNM9XeaYREn3+C4uuKKXNnnAJXOl8TJlq5OR0oKLWQFWXIeuffL
	UYv7CkgH5pHUcKi/xx66Idn2gboB0P19gRvPRecP2h3sgh5OlOEqoIGFll/Cb0QgzBFcezlDxts
	ubZPppq/yMtZwqXpLWYfnYk80PwuHj8R8QOT8VkolkeBlpfGm7/1/peHXx+ZKTpss8StdjbXuSH
	Mm6v4jvFvy52CwejKJ2pU/7J44UgE9taglTsFkfg+XbvBubA9XbuDew2mg8jkV9jafD6bgEwEX2
	5ZqUdO6HU1uk2M5uGyMqpWKZO4Byhew/01UT2QuNsQVc4BTnRu5XLuf/Wdb1KSnbRVHacn7uCHp
	8JbLTbhulBISz3KS08qTjODvuU4To9d+29+BgoaZtu/Su8VIkTsyKzyN5eBzIc0BH54xR53Z/dP
	Iag8euSxtXXdNVc+vrU+XyRKi6+rGC33YGBu05wV8IeVTPns8v8NWkT+WsqQGlndjgeQd1+Q6pj
	DPASMrrbTf/faNllhcq/hBt38KndNXKm
X-Received: by 2002:a05:6000:26c6:b0:48e:4a8a:e17f with SMTP id ffacd0b85a97d-49272d1c6e0mr6959875f8f.4.1793999603662;
        Fri, 06 Nov 2026 13:13:23 -0800 (PST)
Received: from hp-z640.fritz.box ([64.43.161.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d7233297sm5824696f8f.27.2026.11.06.13.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 13:13:18 -0800 (PST)
From: Owen O'Hehir <oo.hehir@gmail.com>
To: E Shattow <e@freeshell.de>,
	Conor Dooley <conor@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: starfive: jh7110-common: keep the status power LED on
Date: Fri,  6 Nov 2026 21:13:11 +0000
Message-ID: <20261106211311.73460-1-oo.hehir@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <d051c5f2-3df2-4eeb-b324-6e9ce39a6b27@freeshell.de>
References: <20261106184055.3891621-1-oo.hehir@gmail.com> <179fe9e8-322b-4745-8734-d5de5f1e8487@freeshell.de> <20261106195945.4157095-1-oo.hehir@gmail.com> <d051c5f2-3df2-4eeb-b324-6e9ce39a6b27@freeshell.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_131325_827844_8899726E 
X-CRM114-Status: UNSURE (   4.83  )
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

Hi E,

Ok, fair point.

Conor, could you please drop this patch? Apologies for the hassle.

Owen

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
