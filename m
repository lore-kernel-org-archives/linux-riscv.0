Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E837C636D3
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Feb 2023 19:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eq6NqHud24jnmFI3pGSEh2At5VptSTAq6nVQVkjivHQ=; b=jU6jNPkQcZHVYP
	Gc0vq4A65viavLwRv7TlIogdhidKXI1AwiVVIzkwUmynXoErcUg9iD/LNtH2Gw/yOJvmLcClnuJVj
	mwk6yXGgj1sOM2oqusUYFsoOOhHj1BGMCjyA7MxYeUC1FNOlKYLVRi7XyflVt8BnNP4wcNavrjBgz
	blrZRnEL78ysEW5Z36UjtXaLXRsRyPdXw9lED6a4ghJUC+rXcCuh8ngsKgX8cE2wA2cx2ekdWBodF
	8q8vLoLe6dWKg8ZViWVAJIXWKQjvwxotMdpzrvdjbSXA0vsSegXiDAMONRY/DJgW4T+Lg9zJuKIqs
	QhRiCV6mxIVKrDXh9SYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRIUW-00CEUV-SG; Sun, 12 Feb 2023 19:58:28 +0000
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRIUT-00CETZ-Lj
	for linux-riscv@lists.infradead.org; Sun, 12 Feb 2023 19:58:27 +0000
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 2A16E5C012B;
	Sun, 12 Feb 2023 14:58:18 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Sun, 12 Feb 2023 14:58:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1676231898; x=
	1676318298; bh=BAX/eZS/rp8zdgtCVH1E5xu6sGljgUCl3pbEM3xShyM=; b=d
	S7bw+J1T3RwQzqurLDp2HH65fIjZm5+N9Bav++4ZIA/VMPHFofE6nzK2NgCJrUtk
	aW+myjNsR1lq1uZpF18z9Ah9ZB2RSHjZji+l89l9fCXsnJrF9RSUgNs5f9ySrzHJ
	ZR2U7R1y5FxVrG5hj2QBjldBzp5Q1LRTbJU947cBMTlxeF1PkEFRwoc1dooaKSmE
	AiiUpjuV3FxzUodPC9amJwYCfCVkGv0zz3H4b++CZRl3SfOjwlMXQCGtUIJkkqSP
	fNiSqzFyM60L8bLRsyWkG7WfQrEmzh8sCF5Pr4PGF2f53iJpp/P9tnNqLJxU3Xb+
	qVUwYJNoAkfAJx4LP03kA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1676231898; x=
	1676318298; bh=BAX/eZS/rp8zdgtCVH1E5xu6sGljgUCl3pbEM3xShyM=; b=E
	e2utGo91yx56UZgrSnMoYkoYFj7TIUpAsgArolVSHMVK/IYNQgmWu+b/IclAmrSY
	Vu34LwyKY+MY7hFsbeknSHsdlW7JGRdTVOMnCTU8W63tURu+0rLkQ1z5vs5QP7CY
	yDprFe1thRhSsVJGixuZm03k9CG80MlFukM5fdZB/rTCK9sSJsxKbFfImAWdp5Jr
	XTVZm1eLmWahxnWfv4vhChOYOIQf/jYyFaBqLoc0YeMbfYrtwpvRud26lKImHCm2
	XFIGQrE61eiT9YGjJRX9zlsUD2FlTwjpV6TrpzQAhd96Q6MoZbvMytqcxuPfRrLd
	/jpd2frX/pgB6/mK7EBfA==
X-ME-Sender: <xms:2UTpY-M2V1NJdCyDdxkFxRKOPbSixsQB6Id7JA80_spoS9Z_43YO7w>
    <xme:2UTpY89srJLVcpev4nMotuAAlhXHJ50-fWy2p20d0qVs_CR80R5lV5SdhCF5Lz6Mb
    N7SSY_fRPlCH3TisA>
X-ME-Received: <xmr:2UTpY1SmYCWmrcYs8s6HGHUKT1rpMBBwAu74In2qJH5GXvbLBSjT5w6wOYNOItL4g_dkor8TatIjfwFU6FoV80J_-kt1gzowt76waR4_Eogu2uXwcHOeU5iDoA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudehledgudefudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefkffggfgfvvehfhffujggtgfesthejredttdefjeenucfhrhhomhepufgr
    mhhuvghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqne
    cuggftrfgrthhtvghrnhepheettdefgeeuudelvdffleejheejueeludduiedvkeffgeet
    ueevvdelvdetfeejnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhl
    lhgrnhgurdhorhhg
X-ME-Proxy: <xmx:2UTpY-u16TH_31PTkbUL0BtXTCJZyxxKgqYTzQRXoJn49RNMVOQVug>
    <xmx:2UTpY2db2_S-oeCDY_BUcXtX2GhVxsFpuhSIND45puQnac_BbwSIbA>
    <xmx:2UTpYy0RX2tjrcfa7AACmXVnCgt-F3a_31OFUKcwAnCAWjDN9c7IMg>
    <xmx:2kTpY16FBkkvrczNcQmfTJrskpe8Qf-CAvSZmoUa-Vw8h6rQwOBLnQ>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 12 Feb 2023 14:58:17 -0500 (EST)
Message-ID: <273f2829-4371-142f-2948-558d1be36c18@sholland.org>
Date: Sun, 12 Feb 2023 13:58:21 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, palmer@dabbelt.com
Cc: Conor Dooley <conor.dooley@microchip.com>, linux@roeck-us.net,
 linux-riscv@lists.infradead.org, ajones@ventanamicro.com
References: <20230212194735.491785-1-conor@kernel.org>
From: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v1] RISC-V: take text_mutex during alternative patching
In-Reply-To: <20230212194735.491785-1-conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230212_115826_208784_C5B26C30 
X-CRM114-Status: GOOD (  11.75  )
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

On 2/12/23 13:47, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Guenter reported a splat during boot, that Samuel pointed out was the
> lockdep assertion failing in patch_insn_write():
> 
> WARNING: CPU: 0 PID: 0 at arch/riscv/kernel/patch.c:63 patch_insn_write+0x222/0x2f6
> epc : patch_insn_write+0x222/0x2f6
>  ra : patch_insn_write+0x21e/0x2f6
> epc : ffffffff800068c6 ra : ffffffff800068c2 sp : ffffffff81803df0
>  gp : ffffffff81a1ab78 tp : ffffffff81814f80 t0 : ffffffffffffe000
>  t1 : 0000000000000001 t2 : 4c45203a76637369 s0 : ffffffff81803e40
>  s1 : 0000000000000004 a0 : 0000000000000000 a1 : ffffffffffffffff
>  a2 : 0000000000000004 a3 : 0000000000000000 a4 : 0000000000000001
>  a5 : 0000000000000000 a6 : 0000000000000000 a7 : 0000000052464e43
>  s2 : ffffffff80b4889c s3 : 000000000000082c s4 : ffffffff80b48828
>  s5 : 0000000000000828 s6 : ffffffff8131a0a0 s7 : 0000000000000fff
>  s8 : 0000000008000200 s9 : ffffffff8131a520 s10: 0000000000000018
>  s11: 000000000000000b t3 : 0000000000000001 t4 : 000000000000000d
>  t5 : ffffffffd8180000 t6 : ffffffff81803bc8
> status: 0000000200000100 badaddr: 0000000000000000 cause: 0000000000000003
> [<ffffffff800068c6>] patch_insn_write+0x222/0x2f6
> [<ffffffff80006a36>] patch_text_nosync+0xc/0x2a
> [<ffffffff80003b86>] riscv_cpufeature_patch_func+0x52/0x98
> [<ffffffff80003348>] _apply_alternatives+0x46/0x86
> [<ffffffff80c02d36>] apply_boot_alternatives+0x3c/0xfa
> [<ffffffff80c03ad8>] setup_arch+0x584/0x5b8
> [<ffffffff80c0075a>] start_kernel+0xa2/0x8f8
> 
> This issue was exposed by 702e64550b12 ("riscv: fpu: switch has_fpu() to
> riscv_has_extension_likely()"), as it is the patching in has_fpu() that
> triggers the splats in Guenter's report.
> 
> Take the text_mutex before doing any code patching to satisfy lockdep.
> 
> Fixes: ff689fd21cb1 ("riscv: add RISC-V Svpbmt extension support")
> Fixes: a35707c3d850 ("riscv: add memory-type errata for T-Head")
> Fixes: 1a0e5dbd3723 ("riscv: sifive: Add SiFive alternative ports")
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Link: https://lore.kernel.org/all/20230212154333.GA3760469@roeck-us.net/
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> Applies on top of Samuel's critical fixes in his "Fix alternatives
> issues on for-next":
> https://lore.kernel.org/all/20230212021534.59121-1-samuel@sholland.org/
> ---
>  arch/riscv/errata/sifive/errata.c | 3 +++
>  arch/riscv/errata/thead/errata.c  | 8 ++++++--
>  arch/riscv/kernel/cpufeature.c    | 4 ++++
>  3 files changed, 13 insertions(+), 2 deletions(-)

Reviewed-by: Samuel Holland <samuel@sholland.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
