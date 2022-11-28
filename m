Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A019C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Nov 2022 16:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q2g9CLy75GFCM3H/CUgSMc+EY1BPyln3aE500DEC9gU=; b=47ro3SRf3O29d0
	B3qUNZFUTSYIPgVN34OEj2iexEVijzwf7m23902qCF54Bd4kgpBTfSIornfXxGubZ1C/wKTMK6ZqC
	dydVFEvin1R6oQkmXDRXCpTmPi4+NFMgtXFkXj6Wmsx04tDr2xSFLukVPdF9+yNtTnbg16fzw8Vpd
	Y27YkoV7bJSgOBBGz6qxQdIOvECSdTdnYDR2jE1Evcv6c3tpFt3z9KgujfFBAmjfAeCkVpyZH0PAO
	hVPiCY6vvN0jRXA02jbIV2tUG+nV//UmiPA0GdBtzsgSuZs7H9lDZpu6aY2XH0Jd2LpkYF6MTrHs0
	jt3geLEUxQJ4eLx1t1BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozgbn-002gmL-Dl; Mon, 28 Nov 2022 16:03:51 +0000
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozgbk-002gks-CZ
	for linux-riscv@lists.infradead.org; Mon, 28 Nov 2022 16:03:49 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id E7CBA21BB4;
	Mon, 28 Nov 2022 16:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1669651426; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G+/cSTvQGSKuihsIOEU271usRMSNRubkrFCCNR/vHtA=;
	b=gvhOdQAhJOZ4d4F6QzPEf/iGvAJG9p9Xc4ACcjX+wne1a7VrqG8PXWZy3ZfROltWvHrvHU
	IU2MMki6K0LM2nM1sKkTeUxn+3boC2eSann5EBDMw1ZYMnhzAexyPjx9XE6EZPrgViqzDt
	fsCq1qb6NvOF9WRaRNPfjAA9ZVbB/nc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1669651426;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G+/cSTvQGSKuihsIOEU271usRMSNRubkrFCCNR/vHtA=;
	b=17hrYVGACstTDz1PANhqhIcXlO7rnmOPs7o0Cu9lacgJq7ncDqe9QrtQOgKoafjwzY+zq2
	YJBS5Fsg57yRZwBw==
Received: from hawking.suse.de (unknown [10.168.4.11])
	by relay2.suse.de (Postfix) with ESMTP id B17632C141;
	Mon, 28 Nov 2022 16:03:46 +0000 (UTC)
Received: by hawking.suse.de (Postfix, from userid 17005)
	id 8E81744002E; Mon, 28 Nov 2022 17:03:46 +0100 (CET)
From: Andreas Schwab <schwab@suse.de>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,  Palmer Dabbelt
 <palmer@dabbelt.com>,  Albert Ou <aou@eecs.berkeley.edu>,  Atish Patra
 <atishp@rivosinc.com>,  linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: head: use 0 as the default text_offset
References: <20221128152442.3403-1-jszhang@kernel.org>
X-Yow: ...Get me a GIN and TONIC!!...make it HAIR TONIC!!
Date: Mon, 28 Nov 2022 17:03:46 +0100
In-Reply-To: <20221128152442.3403-1-jszhang@kernel.org> (Jisheng Zhang's
	message of "Mon, 28 Nov 2022 23:24:42 +0800")
Message-ID: <mvm35a383rx.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_080348_593942_0B83BC17 
X-CRM114-Status: UNSURE (   8.90  )
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

On Nov 28 2022, Jisheng Zhang wrote:

> Commit 0f327f2aaad6 ("RISC-V: Add an Image header that boot loader can
> parse.") adds an image header which "is based on ARM64 boot image
> header and provides an opportunity to combine both ARM64 & RISC-V
> image headers in future.". At that time, arm64's default text_offset
> is 0x80000, this is to give "512 KB of guaranteed BSS space to put
> the swapper page tables" as commit cfa7ede20f13 ("arm64: set TEXT_OFFSET
> to 0x0 in preparation for removing it entirely") pointed out, but
> riscv doesn't need the space, so use 0 as the default text_offset.

Doesn't that clash with the memory reserved for openSBI?

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
