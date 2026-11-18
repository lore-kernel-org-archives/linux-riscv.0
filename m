Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53FB606A32C
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 15:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iZMRJqdM;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ziyao.cc header.i=@ziyao.cc header.a=rsa-sha256 header.s=zmail header.b=mXGxqpWZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Y1jwz9a63+EpCcIl389zsJADc6tC5eOzNQAzpJ53/SI=; b=iZMRJqdMKpGUnpNWxarxnl40mb
	wyUeXdt56Gi2GPGXfcb0A7+iEoqmbn23mzI/g2IyRYMMbIFtTEG4ijlnT8ToFbDa36enX5ROfs91W
	4RyVZaJGIZynCClmUHqy8f6HwqaiZgEtmDkHv++ytC/n76wS83A5i5vh9vcBp5Lv2Sg2FMSnKiATe
	e3ABV2Lc7rQLfoFvccboAW+rS0d6VyommWwjSb+wXBEV/VBPfBMAAw/1ecb+fNQFV7uxZaQnPPILp
	j75annGLHVAMX5oGj5X3ddAc77LHXia08r4/UwLbruLmwqJAlsJ65Usqi3x+/3sGFexVelyqdjmn5
	JxdVSkwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTi35-00000009Ni8-14Np;
	Wed, 18 Nov 2026 15:58:15 +0000
Received: from sender5-op-o15.zoho.com ([165.173.182.15])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTi32-00000009NgH-1XlD
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 15:58:13 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1795017478; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=aKZyVK/iul+awmkjrZ4kuKN+OjodgmfQHc1HR5F/rOku5wpVcBcGoNgE6xS6qEYjmpalvWBkcRTs6nHxmVTHCt7QU7A1xazObShsDMcV3AG2rifwZ/4KVqKwal8wx9TRNx2wQJvc3rQfpnEgm4boXPeyh2XZ52Wd43uFWjIIJoE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795017478; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=jz/3H3A3oChBMYXVW8k3ME6DCqxX/fivj94e4R405A8=; 
	b=Gksh+Ce5o5nrckoOiOmG43DdjBFNHTT8gI4YnDCHhmIFxgkVLuStLR/Lz+XsPcxIkgCqTlzcQhETZEp/TJ0RAP5tefuMrsaUZmKoIqA13CVVd3UyS1+u9JPzeHE4fJFXiuxljjXYhAfJ3NcThvKRfVLS7CpkFWLSRlSddHVb6Go=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: a=rsa-sha256; b=mXGxqpWZsXT6I8C5aBcHiUxgAzoAL9pA3MtLq4B/joxYe8Bl4z8ZJlHLifcX0H3KKu8mEv0fwDQTJzPMHMTTLjzv61m/Y95MATStaMAcf4A5Oz/dxCNXNr9e5qZhCzsWqXAJ2mN7L5ag++9GRahDBCLdceN/1O4zuAh+q6+rIdI=; c=relaxed/relaxed; s=zmail; d=ziyao.cc; v=1; bh=Usg8X43Ws7OPUhBE58OKMyvzlPQGZ0CY7Z/mpX0bURc=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 17950174745448.173778142830997;
	Wed, 18 Nov 2026 07:57:54 -0800 (PST)
Date: Wed, 18 Nov 2026 15:57:44 +0000
From: Yao Zi <me@ziyao.cc>
To: Yixun Lan <dlan@kernel.org>,
	=?iso-8859-1?Q?Fr=E9d=E9ric_Mah=E9?= <frederic.mahe@cirad.fr>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.co>,
	Haylen Chu <heylenay@4d2.org>,
	Hung-Chun Tseng <alan.tseng.cs@gmail.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, Yao Zi <me@ziyao.cc>
Subject: Re: [PATCH 2/6] clk: spacemit: k1: Keep pll1_aud_245p7 enabled
Message-ID: <av3K-MIfagKY1CcV@pie>
References: <20261117205951.140146-1-frederic.mahe@cirad.fr>
 <20261117205951.140146-3-frederic.mahe@cirad.fr>
 <20261118111528-GKD156369@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261118111528-GKD156369@kernel.org>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/294.994.34
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_075812_492551_684DF051 
X-CRM114-Status: GOOD (  16.44  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 18, 2026 at 11:15:28AM +0000, Yixun Lan wrote:
> Hi Fr=E9d=E9ric,
> =

> I will forward to SpacemiT people, and ask them to clarify..
> =

> On 21:59 Tue 17 Nov     , Fr=E9d=E9ric Mah=E9 wrote:
> > Accesses to the RCPU2 block (0xc0888000) hang once pll1_aud_245p7 is
> Access which register? is the PWM register in RCPU2?
> =

> > gated: the CPU stops responding, even to NMIs. Nothing claims this
> > clock in mainline, so clk_disable_unused() turns it off at boot, and
> > probing an RCPU2 PWM afterwards hangs the board. The RCPU2 clock and
> > reset registers live in the same block.
> > =

> Usually access IP block with clock gated off will cause system bus hang,
> exactly the same scenario as you see here..
> =

> > Mark it critical, as was done for the K3 RCPU clock.
> > =

> It just happen to fix the issue, but doesn't sound like a correct fix,
> usually, it can be fixed with correct clock topology =

> =

> > Tested on a BPI-F3: without this, probing an RCPU2 PWM hangs the
> > board; with it, no hang, also with no PWM in use.
> > =

> ..
> > Written with help from Claude (Anthropic); reviewed and tested on hardw=
are.
> > =

> maybe just "Assisted-by: LLM"

I think this tag has been deprecated in commit 1e035297ffda ("docs:
remove Assisted-by references"), but mentioning code origin is still
required by process/generated-content.rst.

The notice could indeed be moved to the cover letter instead.

-- =

Thanks,
Yao Zi

Meow-mrrp-mrow, I'm a cat.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
