Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0533EE3691
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Feb 2026 14:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QXEtwr0WwrS6pYyx9ddo0UqqxfnPSPY53y0sZYhsPe0=; b=i9V3eEVXDOO3kH
	tqJ/yN3O5/V41LmL1JXFuabT5KEQuZy/OheCcP/HuUvjIGY+/fHe5XxvNsy9nHAvyiA+c1vmcPM2J
	49T/zP9jgI+m2PRsR5sfo572sQ/TS9YNP6z0ISNI308oONvbj6PQxmzGf68vU7sBZHnp7XgYjMdnO
	ZmZlnN++/y/srNYATnNv4gcaDWpNlJgoS/rjTNbpZKcqqf+XbPUIcxdtaQOwYOY5GLkB0vpJVCOzR
	k8Fl9cP/FU62vlvuCtlguvPOTIhkm8Yk43HmdpYzMugkKojzhnCZt3AeMFCtfbJOqxbNG0cgojb6Q
	rJaZbSTjzELePWyAtd1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqXz9-00000002Deu-03xn;
	Thu, 12 Feb 2026 14:48:03 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqXz6-00000002DeY-1DLa
	for linux-riscv@lists.infradead.org;
	Thu, 12 Feb 2026 14:48:01 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2ab46931cf1so1668655ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 12 Feb 2026 06:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770907679; x=1771512479; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RaVpje2PuDDNuSA9HTG3fBT9pKVKtc0HtLGMI/E0PSo=;
        b=T/H7cfqLP7wTIBFjIhmnLj9v0jrTSbZNePr7kESVeGG/wn/Pv45/qaezdlHJOBKIxI
         SDZmBwShBIl3TTe10RtPgEjQBSeeyOC8OA3uNqG/C4n3PM5b6mfsPE/gTp6jY9OGaD1L
         xuYaHCmc//Bc2GKXzdp2bnq5psInexq7oOjTXUqH7+kyr8FogPHGeWiGLwqW8boOl7l9
         WCtz7fLyn+8wCADaBdCRRM9fQ2+RRBiavgjOwzs4mTVVsEQtCenAfkokvjYyqXkS20ks
         a69XQ1VIslP+aCUQBSLU8nfgMkYQM8LJmaEfvEqU9w4QP9Q6UFMFn30xjcSNCItY/bl5
         3ADw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770907679; x=1771512479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RaVpje2PuDDNuSA9HTG3fBT9pKVKtc0HtLGMI/E0PSo=;
        b=vKywkUUy0oO0W977u5UzPGTPpA0BHTkPMGE8br7ZLCEG4AlBt5admd4G3J0zu6S0na
         /sQ7ctIFFPNaIxEQ7tUpPm+HH08+pL4Mt1JlRUhwh/LzDTZ1HBgGeDooprzPZXrj0rd2
         k19hXZITnqooRrpNAkb1+21NfhostieDHxHlfap53ZiisT6xaSkdYC435LQZH8c10c7b
         wpa0cGpSUskigayOp+DE0ltb3DwrxeZyRN5/W5S9o9XsggPFOOVrtU7ophxS26x88IEB
         tkc8ySopAwzPW72QYdX1auwSPeYB8a9zI4XSXGZXFriJjrXOu49zTzX7/46rt49a+xqe
         qKDA==
X-Forwarded-Encrypted: i=1; AJvYcCVxwo68ee11F1Jal2liibBV1kYUpU8cvkgvv0rUnI168VEhOToVfXiauVELFrApAYYzxteu9X/PekpJig==@lists.infradead.org
X-Gm-Message-State: AOJu0YyENYPZznuMg0zVRUkKbC8WC1u2rrbiYX6IsoMjvV6mvwkedZ9/
	d50PKU00kUMDNPtco5rbzGTgfqUta/hqLR1M9qDe8rpm8bDTKiHmdPYu
X-Gm-Gg: AZuq6aJ1pl95DpRPJSLSKiB3dCTvv0ZvBN3nPXHNhhk1PgLI+qv6IBXxeb1VIbjj9bp
	TBh78ibNXTOlMe4VjCs6c/BnB5VFF5yNpuY0JL5v6smziPbUEM2lOqkjWkg2z7RLqNmvtqtQIjQ
	frlTmKeV8h5AVCW+Tl+mtrUbJtZJuFxKaaCXZtYMiT65sOIfCxR3ZG7ALSiqnNgolQ7PR3Q31RJ
	vY9Pdm9lgbrsna7qrbUQS4B8xh32ywq4f2Mue1kXatbSugrF/sBsC3aCwcuprKOk0a2JZmQ/cVJ
	BkhpBxVYGqqqCK0uXvaxQdCD3Fe04c4pZT6R6geQABDnW5DR6iPP/9ZnT0COPhKMxpwvciA3Xby
	ttqsK2M+C3gobAgCAeS7IG0/zALxq32j30sMyzQRPUrisvWAlF73MLx1NJ+KmFFpehCajy5t30d
	rPZz67MJwOHlAcJweZgSMmtu1To96DDZ/ukPIr24fSfWyhDkTgzlu0RPcfp9Pbn5GeQ0mkleCjy
	w==
X-Received: by 2002:a17:902:c94f:b0:2a9:5ac3:a925 with SMTP id d9443c01a7336-2ab3a652937mr30808005ad.3.1770907679293;
        Thu, 12 Feb 2026 06:47:59 -0800 (PST)
Received: from sean-All-Series.. (59-115-196-175.dynamic-ip.hinet.net. [59.115.196.175])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ab2c522a60sm52698565ad.63.2026.02.12.06.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 06:47:58 -0800 (PST)
From: Sean Chang <seanwascoding@gmail.com>
To: conor@kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	seanwascoding@gmail.com
Subject: Re: [PATCH v2] riscv: fix typos in comments/code - CC Conor
Date: Thu, 12 Feb 2026 22:47:12 +0800
Message-Id: <20260212144712.15690-1-seanwascoding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260211-trash-eldest-aebdecd512c4@spud>
References: <20260211-trash-eldest-aebdecd512c4@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_064800_349882_6FD99ACD 
X-CRM114-Status: UNSURE (   4.83  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgQ29ub3IsCgpUaGFua3MgZm9yIHF1aWNrIGZlZWRiYWNrIG9uIHYxIQoKRml4ZWQgeW91ciBj
b21tZW50czoKLSBlbGYuaDogY29vcmVzcGVuZHMg4oaSIGNvcnJlc3BvbmRzICAKLSBwcm9jZXNz
b3IuaDogcmVxdXJpZXMg4oaSIGlzIHJlcXVpcmVkCgp2MiBoZXJlOiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9saW51eC1yaXNjdi8yMDI2MDIxMTE3NTQyOS45NDMyOS0xLXNlYW53YXNjb2RpbmdA
Z21haWwuY29tLwoKUGxlYXNlIHJldmlldyEKClRoYW5rcywKU2VhbgotLS0KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
