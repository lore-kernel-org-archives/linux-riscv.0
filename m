Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD035606A323
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 12:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BR+ezr+p;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F6t7bW8c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=F4seoTCEVN7kqF4Pm0IZN5+MPPaJGHB4TEspgDjiHiA=; b=BR+ezr+ponYnTw0GTFOBImq5KJ
	010jU3xG1hUzpd3XoBb73EKMrLNuMjftmKF93AbcG8q6g++8oyw/ulHEmwxlbIQxGAWzE34Z3nsB8
	4ntsvpAbn4Zbx2/LW4hO3OPBnSrjrUp8pA1u3qu3++binitEiQVEQUWSrbbYmARfTK7RizbrqLyrE
	j09/L96K48lB7rvGlLUCR+fsOaukl1m2c9d1j/CCrFyhKsvs0GXJRlxq7jP21hvIUoA2zQqa2Dy3I
	GFJi5CArQM1zTFYpnsAfPFLO5quGWufKeOq3uupCc6FLvl7gbxsQcGvF9dInIWL4jBC2V2LHxF94i
	AmTqlygg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvPA-00000002Hhx-1IOH;
	Mon, 16 Nov 2026 12:01:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvP9-00000002Hhk-2u3m
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 12:01:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0075F4554D;
	Mon, 16 Nov 2026 12:01:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 104F11F000C5;
	Mon, 16 Nov 2026 12:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794830506;
	bh=qeFPCLy9FkRqwFrmv1PRC8oZpfkhe5BgMOQRIthVTYg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F6t7bW8c7r5RIcsepWJBIgP7SkeVG6VMdwcRRMjEKOH9EG9EwOkT8SSoQABLeHnwJ
	 33qgxfwpjPkUDG61iTeiEZR1bQZ6jdgRHthOOT2j1WBIB+AQAIW+qwT+FlvwxI2YWw
	 YYch3YSeTe5L8+4P+gzPh1l2Qdn3tPpZK9rIWotUVXHON8WWbbjcetSDBpg+z2c2gB
	 eT6okVPwSw7drEJ2kLPIIvnv35S6JUnSX9oCTXGEPbICi4eRAwrZZRzK7VlMrq7+kv
	 cakp32dzGBuHbVWv6CGe4e4CZyRmc/c5NEAR41Gw3INyFLTvxiI8ZAxGN8OhbAaQRU
	 tUmj8WxBZN73g==
Date: Mon, 16 Nov 2026 13:01:41 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mina Hui-Min Chou <minachou@andestech.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, conor@kernel.org, jic23@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be, 
	magnus.damm@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, randolph@andestech.com, cyyang772@andestech.com, 
	tim609@andestech.com, az70021@gmail.com
Subject: Re: [PATCH v2 13/19] dt-bindings: cache: rename
 andestech,ax45mp-cache to andestech,llcache
Message-ID: <20261116-victorious-mutant-grebe-aefaae@quoll>
References: <20261113071143.1446167-1-minachou@andestech.com>
 <20261113071143.1446167-14-minachou@andestech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261113071143.1446167-14-minachou@andestech.com>
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

On Fri, Nov 13, 2026 at 03:11:37PM +0800, Mina Hui-Min Chou wrote:
> The binding now covers Andes last level caches beyond AX45MP and uses
> andestech,llcache as the generic compatible. Rename the file to match
> it.

No, it doesn't. At least not in next. Anyway not reason to rename the
file.
> 

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
