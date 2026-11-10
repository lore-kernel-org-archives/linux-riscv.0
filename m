Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A0E606A31C
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 06:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DvucRlMi;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FvHx87uR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AvgzNNbjTksA9UCmemuMcuy+BoBzV0YPtcdtSEIblZg=; b=DvucRlMi1XNuykEaM2s/k3qmT+
	GrDwSXDjW++Y4dFXp/pg6C1leSLDi3K6iZKA72MECqrOwIJpjoOBNxGcnsDI1MLEawp3sSA1qEhFX
	BBRciR3DQW39QF+Cx3eJ/YXKGDlwYD7TPXo8ZmpNoVZupPcs0e6JcDyVgWN98qBCFh+pZgyoSm0FR
	Ls+O88ZZjRFpAg9Mo5co9/VGH++2nrYmy4K18K9OEqeCKulElCEYYcdgmMcRm27wY7tgpZXQBbkDv
	Prz9Q1wblZGrxoD5pVJPQIunnFH6p6skbAr8zGb1XnerL1IP3uZjOL3PMxIC9VhiRVT8bg+8rH57j
	5Bxcm3yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfnl-00000002j6V-31y6;
	Tue, 10 Nov 2026 06:57:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfnj-00000002j5l-3Img
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 06:57:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E68C361D28;
	Tue, 10 Nov 2026 06:57:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28DFD1F0089F;
	Tue, 10 Nov 2026 06:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794293870;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FvHx87uRV2aBUNfuhWvTypqzTGByWg8iLqANGrsIeuJW7uaM0OSMwz1WlPtVsrmxG
	 Yq7+x7UNE1R8chUFrD8FbLE6YeoAuFg6uCP8s3g7bNuQ77yokuSRRm4u95PmYq3QWC
	 R712F6LgzeKFLP+yG8Q+e85+pDp0jHOO+6dRyz+qMLBL8+71q4xfWfqYT1KcTf9kMw
	 3cb/6uMfE6KK4BqDKyPDVs7ypHMbvzy5GQ33ZmQVXmEOvPdFl3BLiLDCGsSZFpyNve
	 fI5gwa5iQBPiVE9DdIjdhutjNLpgUTW7+2/fwU1aOIhEaOD0JzqXV9MtnnWcT1lEXM
	 8+j+cZ7IJZsNw==
Date: Tue, 10 Nov 2026 06:57:48 +0000
From: Yixun Lan <dlan@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH v3 2/2] pmdomain: spacemit: Add power domain driver
Message-ID: <20261110065748-GKA1988@kernel.org>
References: <20261108-04-k3-pm-support-v3-0-b9dc0857039b@kernel.org>
 <20261108-04-k3-pm-support-v3-2-b9dc0857039b@kernel.org>
 <DMQHSDTR177I.1HWHAF4FWTFQ5@linux.spacemit.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DMQHSDTR177I.1HWHAF4FWTFQ5@linux.spacemit.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Ulf Hansson <ulfh@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, spacemit@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>, Iker Pedrosa <ikerpedrosam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
