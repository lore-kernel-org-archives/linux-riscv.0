Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED9DC74A5B
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Mar 2023 15:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OX6DB6HmFcijtUV76C4rOg65mEQdbIzjc2A/jCNNANg=; b=Kwjymu05EzwUkt
	Qrearr22T28YjOLVEWyVA/wyqTXQzJdKrGiC4BOXE6Q/GH4m57KksDKkm3+M9PwJOMvdalncIadGP
	cVMwieQ+6tZKt36RvVKMXZFoNxE1W/POUAWDQGp+XUyJ/rB9yDfFj+V7LyjVRsQ36YaDb6zNFMOjz
	KiS2jZ8kT5ZYDtH31dUAqU+2Hm+KaeDQflb0RVXSC93wGJP2dzMlYkwXS6JxvxXbYGqg1Hw+qI2mw
	X+/uhJB235VBydJ3kT0CI1y4DulyAzeAAigI9QA+yn4iw9xTtYLZSFCTbh46ubz78DeoMOvSXkAJG
	/LNpc/hRyTrTOauzYQXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfNIt-002PKA-2S;
	Thu, 23 Mar 2023 15:56:39 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfNIq-002PJ3-34;
	Thu, 23 Mar 2023 15:56:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id AE930B8218C;
	Thu, 23 Mar 2023 15:56:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAF10C433D2;
	Thu, 23 Mar 2023 15:56:31 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="A63aMhce"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1679586989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E0QDLAcWMz6ZWQvPCSBnzoIiYMLhelgbcARCDPPOWLE=;
	b=A63aMhceMeMggmWfc1r72fOX8m28q7eHiq1pPxSfpctedpOcSEfTjKEPc4NstDyZLL39NB
	zpVsWtSG/hAldFxNq52W742ew8XAvTrO6D29HZpCIGbCRQeHlN3L4e/e1vDfG4BcArU7gR
	0F+SzR1yMXW0XdwaIQSDwaxsPnj0ytQ=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a8981c54 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Thu, 23 Mar 2023 15:56:28 +0000 (UTC)
Date: Thu, 23 Mar 2023 16:56:24 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Jisheng Zhang <jszhang@kernel.org>, Conor Dooley <conor@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, regressions@leemhuis.info,
	regressions@lists.linux.dev
Subject: Re: [PATCH] riscv: require alternatives framework when selecting FPU
 support
Message-ID: <ZBx2qFFiaRSyJubo@zx2c4.com>
References: <ZBruFRwt3rUVngPu@zx2c4.com>
 <20230322120907.2968494-1-Jason@zx2c4.com>
 <20230322124631.7p67thzeblrawsqj@orel>
 <1884bd96-2783-4556-bc57-8b733758baff@spud>
 <20230322192610.sad42xau33ye5ayn@orel>
 <2a3b08ce-5ab1-41b6-ad58-edbeff7b1acb@spud>
 <ad445951-3d13-4644-94d9-e0989cda39c3@spud>
 <CAHmME9qEbUP7cq-iofN=ruSWhsHUva+qqavfEpNzDK_BjQVqxw@mail.gmail.com>
 <af690061-f962-498e-b2df-d2e6119292cf@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <af690061-f962-498e-b2df-d2e6119292cf@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_085637_383885_D3E89F5F 
X-CRM114-Status: GOOD (  15.71  )
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

On Thu, Mar 23, 2023 at 02:49:34PM +0000, Conor Dooley wrote:
> This would requiring picking up your patch Jason, but with an
> "if !XIP_KERNEL" added to the select.

So the risk of making this all work is that we wind up forgetting to add
`select alternatives if !xip` to various places that need it (fpu, kvm,
maybe others? future others?), because it appears to work, thanks to the
code in your patch.

But making it work is also probably a good thing, since we obviously
want the fpu and maybe other things to work on xip kernels.

So maybe we should get rid of the CONFIG_RISCV_ALTERNATIVES knob
entirely, making it "always enabled", and then conditonalize the
alternatives code to BUILD_BUG_ON when called with CONFIG_XIP_KERNEL=y.
Then, this build bug will get hit immediately by
riscv_has_extension_*(), which will then require your patch, which can
run in a `if (IS_ENABLED(XIP_KERNEL))` block or similar.

The result of that will be:
- !xip kernels properly use the fast riscv_has_extension_*() code and
  any alternatives code needed, since it's always selected.
- xip kernels get a BUILD_BUG_ON if they use any alternatives-based code
  that doesn't have a xip fallback yet.

What do you think of that approach?

A "lighter weight" version of that approach would be to just remove all of
the `select RISCV_ALTERNATIVES` lines, and instead make
RISCV_ALTERNATIVES specify `default !XIP_KERNEL`. That would more or
less amount to the above too, though with weirder error cases.

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
