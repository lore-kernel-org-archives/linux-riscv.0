Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3B2606A330
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 21:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=t3XroPnr;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n4zcQDBy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WGc4Yn+sesB7Q9isfZq2emKh1siPYOCMOy8dy7X+3Tc=; b=t3XroPnr37IE70MJvWXeRIMQS2
	1yY8WLuTg8W5ITJ7iXFOLDf6u376EVWqVaekHhGNOAsrgYI9CPCrY5EbbvsLNKN3vi6Ew0MocZCla
	tNhaDUv9r3j1m6kRrFBacKvJcETcSj7PTE3kmTY2InY9lx0H6G4FFMMcPOla+K83EeuikPLd2X2cm
	+KX3O6ZNcOR4d1/Yu/paZ3CxSYTJvncWRPEkzUrzCGxEW3MDrSzF5jbpDW5zJEWbSXJcvKot2uVH4
	Rdy8/EqFMObAZkxH5iCMS6Z0kuC9LN/q1AMdaE1HZNxSACo8bOldkAOLUDkZew/XndcGHTs3bVVhT
	AFcJmHGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPRFS-0000000DfBN-0GAB;
	Fri, 06 Nov 2026 21:13:22 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPRFP-0000000DfB1-1gcM
	for linux-riscv@lists.infradead.org;
	Fri, 06 Nov 2026 21:13:20 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso10983915e9.3
        for <linux-riscv@lists.infradead.org>; Fri, 06 Nov 2026 13:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793999597; x=1794604397; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KAgB2fssjvIHHivLsh4UbVD8IvzJBAHBr6xJYRkzEJE=;
        b=n4zcQDByeuFtC6V9OLXD7FQfIj5LRBccLB/fUOtzZdINgXRXprWvK6is/QnSFErjez
         gT+4cVmSey+Le62ML1kGDC62q0p3PahRkketvDbZLM+AVbxBKEnqsWU1O5qL6tP46Xw1
         VXvnVAwnHKPPZ6GQBOrxsL50iFNlXH2YQhmlVFOzOlbT1aoL7lw6l48j5bwGBOF8CMAq
         XvW3jL7MLH3hVH6oM2wt9kCH5oxPBZH0kMXhOBBEvmQn6QmV9+y6rRMi/BAIdmOmkPlL
         qnmt2l6yMlfGS6GCB1naEY+Skh+xSEZ7fU9j80RaXHFy9+fT8FqSxAgBeET2Moc7hxvl
         kv3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793999597; x=1794604397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KAgB2fssjvIHHivLsh4UbVD8IvzJBAHBr6xJYRkzEJE=;
        b=Xnic0uSiqnrl74owSFc8wKqm4Y8WBjNxu2A4ent4RIxgj1+c+H9aP4AyxZBg+nBI/b
         z1Dhewb4EwZc13wZCV83MOZxRLPHq3/tiXSmq3hnrDqGxkv5yS24xhvLffynZBjtDYNi
         ubXucbx6k1a64Z3Ip4d+0lgFOh6pJavKCcn7dfSzc7dybz11/Td6FPc4raeFFNTDI1Ig
         P1MJL4bIH2oYKjzb0oSfaErbsYmSTjtMD1nf+Z8+EKHGv9LesNRAqgXg1Y7AGqSfv05C
         xjDTj2WyV973dcGQOMVEc9WvZo6nMnUUnEia11RSpBqxvXrhQbFDmtFYJEBSg+U2yto0
         zwMw==
X-Forwarded-Encrypted: i=1; AKwUvByjYP30GKp/Z9dig0AEfTNr1iO530PC17/nekpV1Hty8Qoh3kbRWbFp4bXJaGPqiJfq+jLMOc4OmbZT1w==@lists.infradead.org
X-Gm-Message-State: APuU4Z8moTNG11BxPpJFpkBRGJz9PCanhYKydqbL6J92QU3hCAx93F4U
	AAxCgod14PRTA5coRlwi+qJKOg+MlAJy+Fn8XOA9b1tRNw9HPGbvFh2g
X-Gm-Gg: AYBFou06vvs6rhL3chFWDS2QDwRy2ipL7rZzjlNF7e1wg5i3yEENjV1Zg2VhqUlwxhc
	JwyMVWcGrdOR2dFVLO8RzlxwJ7ZR9ZTmw4dKPpELJJ5Fby8v2NfRy4mBcGMizimWW34wATgIUEx
	85S2z4FQsc4gKAdce0bmjBdYOSK2hjafx+cup9H0PBtN63aVf8WTh772nmE1TO6Pn+ww6oPK/Fv
	bxPyv/qE5TbDLVeAD2e1bq0vn1aqtU3qMGaT6vHJvzcYVTmVNkobYrwyrNoV6nkQ+YcZOnIiCDN
	1q1SSLBGxauDHzCAxBz+4S5xe0psjco7CG6wCaLsGARqXMMqhi0JNO4T7/CV5Y2WfSAdoz0eamq
	+6Tapi6Vzl3Vb8ZQpr1UMgTgKic9CEpgL0P9+EPi2xTTfbtHituK7Pu1hJqhj58gk35rKtnVTWS
	i2vRW3MMaSsvmbOE4HJpyLVB2AkDxfagkQnaPMf6JUbkTRr8CTHJu0nQH7dq2tgIwK3NYw/VtgQ
	Rpc/as0bUBB3EACmgN8IyAnDHrSoXL1soRR1HVFTHnKUbGoWAcwzzqfuvmmo5s+GCyaEUj/fMmT
	Xi64T+300uG16nrzUj9WXkN1ObRFBHI=
X-Received: by 2002:a05:600c:a013:b0:4a1:f625:2108 with SMTP id 5b1f17b1804b1-4b6e054964cmr57690945e9.33.1793999597217;
        Fri, 06 Nov 2026 13:13:17 -0800 (PST)
Received: from hp-z640.fritz.box ([64.43.161.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7950206e3sm11271025e9.3.2026.11.06.13.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 13:12:57 -0800 (PST)
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
Date: Fri,  6 Nov 2026 21:12:49 +0000
Message-ID: <20261106211249.73440-1-oo.hehir@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <d051c5f2-3df2-4eeb-b324-6e9ce39a6b27@freeshell.de>
References: <20261106184055.3891621-1-oo.hehir@gmail.com> <179fe9e8-322b-4745-8734-d5de5f1e8487@freeshell.de> <20261106195945.4157095-1-oo.hehir@gmail.com> <d051c5f2-3df2-4eeb-b324-6e9ce39a6b27@freeshell.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_131319_448486_7C8B8183 
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
