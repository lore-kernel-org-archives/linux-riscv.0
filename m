Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A09CCD4851
	for <linux-riscv@archiver.kernel.org>; Wed, 13 May 2026 07:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PZ5kBLE0oYGex4jTXCRa80rNRfQtI1KLi7PuqjNKux4=; b=G/vT2xaG/W90M6
	EmsOFbftnUkLXRWE6wNEMUbkZk5P0RnEX9JLDZhPdJK4uadTXr0f97lyA8anT3mO6N4wW68ls3LHc
	cgNcn2/uNvhF6jnqIvQEW9hQ8pn80Ffi0SK+jKPHsOmoL2nE6TXVWJ9ZbdDcm55+RMyOk4R8CRpB7
	gM4zdQELQLttmWhWFid5QQqcb19iPGj5aQHJTN0+lqQQ1tOR80OGu0uQx/YN580vbBjBxkyGRFtRM
	5L7qx9AFE3Sb6CNJbpUUCyKq3goCQnlWswboxaqgxZYXfzIlBvfaxmsXelpPLkMm6gpHb9AKZ/YAc
	IStYNg7ep+B+OD25EMqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN4KY-00000001dTR-2Ggn;
	Wed, 13 May 2026 07:48:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN4KX-00000001dT9-1ZBV
	for linux-riscv@lists.infradead.org;
	Wed, 13 May 2026 07:48:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7143C60129;
	Wed, 13 May 2026 07:48:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1816C2BCB7;
	Wed, 13 May 2026 07:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778658512;
	bh=r4IxZmFlVD6+qhE10Ci/nmAv6mfJj/vjrOXEkC9+www=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZT6ISFIzu+Vn4cYjVcrFExPJzjr5uartsU2ffXTYNxfWMkiznJ5VUCp1O7zxV2ujR
	 Q5QrVnMqYVS+Szcv10XqtNkE4eHEW1mlTZo/OfJVHGopvReozaAZ+CzupuXfPODnlW
	 GzqtA4fmyHKa8T1jlzMqoqtiv7sxAx7VX+QVKHP0/0kerfJH3uHLQwTxM4DhPVvKCp
	 meUwbkhFBEUwewBsZVAZ46ekPYnLwUzcuNQSOTYTdvPOMqU2nCJ4+tFXMAIOfwejXO
	 WKm12f1p/rOJjNpQGoaWjrX1Hdg2o/3bVjDCNBjQFPHOCyuwcnQChl6DPaoJsTbq8Q
	 lkvBhA8uK4+nA==
Date: Wed, 13 May 2026 07:48:28 +0000
From: Yixun Lan <dlan@kernel.org>
To: Andre Heider <a.heider@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/6] riscv: dts: spacemit: k1-musepi-pro: add PMIC and
 power infrastructure
Message-ID: <20260513074828-GKB3624092@kernel.org>
References: <20260513071958.29574-1-a.heider@gmail.com>
 <20260513071958.29574-2-a.heider@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260513071958.29574-2-a.heider@gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 09:19 Wed 13 May     , Andre Heider wrote:
> Enable i2c8 and add the connected SpacemiT P1 PMIC with its related regulators
got a warning here, commit message should limit to 75 characters..

> for the board's power infrastructure and voltage regulation support.
> 
> Signed-off-by: Andre Heider <a.heider@gmail.com>

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
