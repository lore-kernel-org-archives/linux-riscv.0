Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95469FD4F19
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Mar 2026 18:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NEcAo1N2VBzFApjQpSgmkMOdpqgHPcdiHWbs+afCk/0=; b=g3rsrJxgfj520b
	uuN7ak8i+d5pKmnUjjcY4MPTA0em2y+lTAhU13m1AEbIwT2UoL1k6fV68xENtR0adrN1MoVHo/oV8
	aAFGf/v7w53v6V/w5ETc4pDF+r6rFG6ZSL+12NATpj9uTjNFMYoCI/UBrMmLxxPpG2ufVkbtx75MF
	6vkNT2GKwQlT+Gx3Borqin/4aDdO5EIX6i0+HFtLNGHFmfzMaXTiGRdxwAaArThLUl+99ew/rGmYw
	5rdvaTHL8bxFNDVeTe13g1776dlRnJ2NLd2I0Evv6iOQBzy1zEQ3R9lL8R4LJUl8M3/l135ge15lH
	4zvzX6CtsPFlNetL1tbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w01kh-0000000A4UK-1CkA;
	Tue, 10 Mar 2026 18:24:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w01kf-0000000A4Tw-0JQ0
	for linux-riscv@lists.infradead.org;
	Tue, 10 Mar 2026 18:24:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9E801436F0;
	Tue, 10 Mar 2026 18:24:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1E11C19423;
	Tue, 10 Mar 2026 18:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773167056;
	bh=60fgkUWv92rLl/BzDoW4SUNLQP2bHEZxw7UrCs7abIg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pBppPdW33AdnO65LirAuuQCuyc0yAjz8IHfD6Oz5XBSkkHJ4wuk2hYjfgZ3+f0xCw
	 /8RSI8DCAXhS68OOaLJ7lVQ7/LmOS6sIfejXfD133JUwwwOeSZRq0TafcfVCi3uUqX
	 X/nW/eLSQEDtJPxN89fDZ56h9OJf0TMwb3rtmVtpGbYzxFL79IDtSlBoXA/tldrgQJ
	 km/C1+XfbFv00YK3gqf2X3uRB8TxlJaAVj7QoI3dagJt4seqgfTcwpkRvk9K7g3G0O
	 DDnR293hcji+pqLfGbQcKFqu9W92EAok8L75heenXeInVBRvyeUKJpNar1vGwMtXP3
	 4Dw6y+qHWUTvw==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org,
	Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	stable@vger.kernel.org,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Valentina.FernandezAlanis@microchip.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] firmware: microchip: fail auto-update probe if no flash found
Date: Tue, 10 Mar 2026 18:24:11 +0000
Message-ID: <20260310-gyration-smasher-1eb31125b2b6@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260303-emphatic-roundness-8fe5cd8c3159@spud>
References: <20260303-emphatic-roundness-8fe5cd8c3159@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=836; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=hWgL2DzJiZOmEy7GIVpd1Ka6l//mB6IOSxtqxJ4xxNo=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJkbEs88+LWhQ4RZ7uH3mW/rL5ee0hfQmM4ne/7Fpi2Lr x/Pz93T3VHKwiDGxSArpsiSeLuvRWr9H5cdzj1vYeawMoEMYeDiFICJeAsyMvyttczhfnZpstkb nxIm723tHa+O/hR9teby+gmJKllfoxYy/A8r/c26O3uug/fn2fX2la92TmV45tfVujT8SNG/GaY s57gB
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_112417_136375_C6B90B9D 
X-CRM114-Status: GOOD (  11.83  )
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

From: Conor Dooley <conor.dooley@microchip.com>

On Tue, 03 Mar 2026 11:24:06 +0000, Conor Dooley wrote:
> There's no point letting the driver probe if there is no flash, as
> trying to do a firmware upload will fail. Move the code that attempts
> to get the flash from firmware upload to probe, and let it emit a
> message to users stating why auto-update is not supported.
> The code currently could have a problem if there's a flash in
> devicetree, but the system controller driver fails to get a pointer to
> it from the mtd subsystem, which will cause
> mpfs_sys_controller_get_flash() to return an error. Check for errors and
> null, instead of just null, in the new clause.
> 
> [...]

Applied to riscv-soc-fixes, thanks!

[1/1] firmware: microchip: fail auto-update probe if no flash found
      https://git.kernel.org/conor/c/c30b2509164f

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
