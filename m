Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24652C02194
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Feb 2025 20:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q1l/NhgTzbzP3FklCo2oLelLafg4WFFJJAIOpun4WXA=; b=yqtbZnwpIv5I8H
	bb0GvHQtcXc7KpSuDAA6wiNMamFtANk5+p1mRMohHSzqkH5YzY0IZ4zYURRw9+xuHjIsS6iELr880
	PEJSVp0I+0YFh3IOxCwomJe4L70ew1N+uuyhXVruClmnUxsQ2ExKpr3MxeWTCNaPJnDSUPYMCIuuA
	6/MwDCo2ftKodrVlA/r5F47J1A7ojCqyY1HyJ46M84PoBlegtCHojUvzcmsw32fn4y0qDUXI7emH8
	FjziPKX4ILKHA2dOGRBR41JHh3Rwgne0bzbnucw1Kpvo5UCoIOTPk8WShzMuS2bSP/rlFBZr1GkQD
	7//GFYGo7Pv88HczHZYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg8Zm-00000007Uu9-2lUd;
	Thu, 06 Feb 2025 20:34:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg8YO-00000007UcW-1VKY
	for linux-riscv@lists.infradead.org;
	Thu, 06 Feb 2025 20:32:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 20B565C10AD;
	Thu,  6 Feb 2025 20:32:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42420C4CEDD;
	Thu,  6 Feb 2025 20:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738873971;
	bh=tE1MQSssWRPkyAdKF+cx2AexR3VCxsTGGA+pMOq6590=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HduQn2eSwfu1X8WAhqGAhVSKoAKdX/WFlcReTW04EakWFYD6Fa+TCanQX+yFynXnX
	 Ia3x/hwCL8tckRlG6v9iMUvpA8Uv4l15M4577fY9C2hRZEuL2S67OpJ8slLsCnDaTe
	 WvkBSYLIS4A4gbhQnBlg/ST8Mo7bt/xaqr7aGGGRD9JxVVIJCbO+dGGAnh/U9zclXp
	 H825igQZ8LUqxPfnPGDjunZlaresd8EO3sd4YO2C3d/Tkv99XzL7pmxTsrkSRkr0l9
	 kfsxftgqPmq0sC3wjws6X+lKQjOTMAZn8Aiu+tmdw+/TymScPL3kqD2SC9TFUCvJDE
	 5jCDWOgyoN1Eg==
Date: Thu, 6 Feb 2025 12:32:49 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Andy Chiu <andybnac@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/6] RISC-V: add vector crypto extension validation
 checks
Message-ID: <20250206203249.GC1237@sol.localdomain>
References: <20250205-cobbler-unpadded-5580c1f5d946@spud>
 <20250205-quench-entrench-09bed8c8c823@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250205-quench-entrench-09bed8c8c823@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_123252_438125_10C60FD4 
X-CRM114-Status: UNSURE (   8.95  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Feb 05, 2025 at 04:05:08PM +0000, Conor Dooley wrote:
> The 1.0.0 Vector crypto spec states:
> 	The Zvknhb and Zvbc Vector Crypto Extensions --and accordingly
> 	the composite extensions Zvkn and Zvks-- require a Zve64x base,
> 	or application ("V") base Vector Extension. All of the other
> 	Vector Crypto Extensions can be built on any embedded (Zve*) or
> 	application ("V") base Vector Extension.

As previously discussed, the above paragraph incorrectly lists the set of crypto
extensions that require support for 64-bit elements.  I have fixed this in the
latest RISC-V ISA manual.  It looks like this patch would still do the same
thing either way, since it actually just checks that vector is available in some
form.  But this is not the best version of the manual to quote from.

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
