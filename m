Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513A1606A31E
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Nov 2026 19:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Scn7ka3K;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uWOyYpZy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=peulz5RGETGcAKGdqwRqkVzUqAtO3/FXsLdzP545olg=; b=Scn7ka3K8v5+nsNkXRPO0gvgo3
	ZxsUmUOgB1E42C3WWmKUh4zsT4U/PA+kbSMcRq0zd0SIuY1sorwA315lZeok1mc/Wf4/dSvfwoX/y
	QU/DvqxGKBWw8YoGtZCq3c0WDSubV3mIfGU84t1JJ0X17ImpVpNGMbK8O4NxCSQB0RjhEB+4TQ88y
	ochpNm6MTtROzZpDXugMZEXLgtlBV2aLIbdIYUpB0t39PuKqthzkuIcUC93ENedTVVlERjO0f3Of/
	w/NAm+dgsY3CRSPEfxcD8L3RtbQazq2rmcDgCRsJB1zQCIBCgrhD/tn/PJ8ugp7JtAjs6358mp0WQ
	OHHfPKVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVD5w-00000001cUr-2Hav;
	Sun, 22 Nov 2026 19:19:24 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVD5t-00000001cSb-33VT
	for linux-riscv@lists.infradead.org;
	Sun, 22 Nov 2026 19:19:22 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso25043975e9.3
        for <linux-riscv@lists.infradead.org>; Sun, 22 Nov 2026 11:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795375160; x=1795979960; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JgVB/O5hBKCdOeqZ2JLGG3q/f4KIK1fx085LNchkx34=;
        b=uWOyYpZyUJV96Mip85ftjPpQmaK/PObwZRk1Z0P0dTsuKh2kne5wlwn6cImuMC9XUQ
         HIz8QEIQxCnHHMa7PAi8Dp8RQvSkIiMeZyOtNdBvKRpKnfmIcMHe/j4JyXPnfqHOzvUn
         jLLoWp6r3zYeV8nRTfHZNCDDX6O1YgHwzt5PJMOsn3Y6vIMCzNlyGhwEKXuZgDs0XjzV
         UWXc3CEtHJkqha5fkBw3xiLXZgMzijdAMXWIfMIZM1vIrQWHe5XmDnDPu0k+gzJe3T0Y
         WO5MgZqrqzSXGjDJIIqx26eBLrZgObX6na3YCw3aIvfpzB3edw4kxGkzKa3pIkDNtkUD
         /wFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795375160; x=1795979960;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JgVB/O5hBKCdOeqZ2JLGG3q/f4KIK1fx085LNchkx34=;
        b=KhLbw3HpH58wncnV22dVdQNwdLKPXI4SQcyKnSnxCBTvKg+Ws0lMcWHZ5G0FyifjU4
         GNvoEzG4jC2B0cHwBqSlsZyEFjScex2pf6OrX40tmyNOS2B4KYLjpheDZiaxJVheqgpk
         W0rPzz4NaRxHdMxecanwS2w5Ar+hSla2JKESoSclns00b7LJWLrggKk5vHCVIYt5+8tv
         UDRL51xtrJTIwoRXzMTel4GbgP7lRxgWAOUPJ706/K4rWqYF/cb46CI4L0J4y/up2nOc
         AFF3oNx+tGb84WCFBCnhT9nZBEONQwLukieGSR0Py7YQGI8tOVAx17B9qAn2CdCcqNSM
         yDcw==
X-Forwarded-Encrypted: i=1; AL+hErHfrp6YeGaqoFQzilsSOxhK8OX2GHeMJz9LmMWKXwirqtHTm4q+rs1Tqj//uoXyItE2wc5yb44r36rj/Q==@lists.infradead.org
X-Gm-Message-State: APuU4Z+Av451m8RiI5fc3+WKH2W4AXoUVdsqfOWqgqc9XKFx1tZYCWee
	lMTnfyrgjCehE7viAbypfeWtfVEyRzTKabddciQAXfJ2P+F6FNc6a0E1
X-Gm-Gg: AZFdTZe0RC3SHKN7oztXrUuFIVScxp0X4RHO+2lbQG9oazbX3qFXfBk24na3a3s2qEu
	JHn8oIJ3GWiqpFierlevlIrhdlZoTJi54zbwkFvMXqwkkmTu81zFOH+YBEK73NxDlyNQtxeBL1u
	eRmWvX1K+6PlFgJ+NGXAOblviExoNCFe7q0/QWMeApzyvj+vOT4VQHbvx3pt8kanqTpOps2SMqc
	03z1fXNbNLcgB+YgQIwx/I1C6mxKO8rNNcWGXoDypo1K1yjS37TgZB9nm8MLCASOVVGp3SH317C
	ddq+Sj0gQMddyEu1d+Bty1xm1tGbQlr5iu5z10rS496gYuQ2grDkDfAzE+yQQHQIV6XYlbllYAf
	pCg2MkdN9GWynMCkOALVDoHIcGt3DAfYK4p8ytF9zYoX/MnyNqYuxFNID37ntQatcnbAVOVj8kX
	UHQNC99tmuV3T0YBIcQbHseEqtzUkbemer1iJlwR0W9jnQD0kFF3nCTmVDvmsK5Gt8R3pPGzyht
	5UMcfLyiHf8fRCyJ3KacjbPLr8kIorrHbSb2HNZy7Ij5iHvnRrDZfoUrAagJgJwvNHee1xVv6cC
	VSYFF4all7GVYahREBL9P5pzogXFRmgxy9z3nPnrlFj4qu+PX+6hsXf3/JTOJnUfdw==
X-Received: by 2002:a05:600c:6749:b0:4bb:5f95:c014 with SMTP id 5b1f17b1804b1-4bb8880f283mr208928685e9.19.1795375159763;
        Sun, 22 Nov 2026 11:19:19 -0800 (PST)
Received: from cachyos-x8664.aetlocal ([2001:bb6:e78e:9100:cdb3:c7ee:74a4:5189])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm389657845e9.13.2026.11.22.11.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 11:19:19 -0800 (PST)
From: Mervyn Pretorius <mervynpretorius.oss@gmail.com>
To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andi Shyti <andi.shyti@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Min Lin <linmin@eswincomputing.com>,
	Yulin Lu <luyulin@eswincomputing.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>
Subject: Re: [PATCH v5 7/7] riscv: dts: eswin: add watchdog support
Date: Sun, 22 Nov 2026 19:19:18 +0000
Message-ID: <20261122191918.2184139-1-mervynpretorius.oss@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261015125454.1381941-8-pinkesh.vaghela@einfochips.com>
References: <20261015125454.1381941-1-pinkesh.vaghela@einfochips.com> <20261015125454.1381941-8-pinkesh.vaghela@einfochips.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_111921_788107_C37EA15C 
X-CRM114-Status: UNSURE (   3.63  )
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
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Tested on a DeepComputing FML13V03 (EIC7702X), on top of v7.4-rc3;
details in my reply to the cover letter.

Tested-by: Mervyn Pretorius <mervynpretorius.oss@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
