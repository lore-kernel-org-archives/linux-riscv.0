Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF63C4321E
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 19:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5YduSRVw4FfFPa+ZxP8/K/GJY4docXq2xjlzT74f/cU=; b=HtPPbYaHrMT13Z
	H5mH5WzE2Nly+02NJGmDVnUDPJX3ot4sE2aeNMGtL9XlmS1Vj3UOdoAR7VFEIX/vgeQaArxUHW4qf
	T5LTirpKztJREhutfW4aIdYogsxdXiz6YbPJABhiCKpxRxtXsjloNRO4PaqW2UBFqVkffBN87ASJq
	fTX/o6hlOuhzpAuwEKk42XnPVLIrwp4bucY7KRGCVKsd/7XtmuR9QPZu83vysgHEMF/UTjEkFCmNA
	7pd8Q926PbU7QKf2Kb0p1nr73Lp3kcxkKpXN/zZO04Awwg67L/qrJzZwCeAeVg3Io7ZkJ7xBfrlI1
	nd2AxuVhTnWMO9ijSC2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0SkK-0020wM-8F; Wed, 30 Nov 2022 19:27:52 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0SkH-0020uL-Ot
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 19:27:51 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1p0SkG-0004RG-3w; Wed, 30 Nov 2022 20:27:48 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, christoph.muellner@vrull.eu, prabhakar.csengg@gmail.com, philipp.tomsich@vrull.eu, ajones@ventanamicro.com, emil.renner.berthing@canonical.com
Subject: Re: [PATCH v2 08/13] RISC-V: add U-type imm parsing to parse_asm header
Date: Wed, 30 Nov 2022 20:27:47 +0100
Message-ID: <7518802.MhkbZ0Pkbq@diego>
In-Reply-To: <Y4aX+KJ8sC2XRO1E@spud>
References: <20221128102632.435174-1-heiko@sntech.de> <20221128102632.435174-9-heiko@sntech.de> <Y4aX+KJ8sC2XRO1E@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_112749_833581_5EC20D44 
X-CRM114-Status: GOOD (  16.19  )
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

Am Mittwoch, 30. November 2022, 00:38:32 CET schrieb Conor Dooley:
> On Mon, Nov 28, 2022 at 11:26:27AM +0100, Heiko Stuebner wrote:
> > From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> >
> > RISC-V: add U-type imm parsing to parse_asm header
> 
> Ditto.
> 
> > Similar to other existing types, allow extracting the immediate
> > for a U-type instruction.
> > 
> > U-type immediates are special in that regard, that the value
> > in the instruction in bits [31:12] already represents the same
> > bits of the immediate, so no shifting is required.
> > 
> > Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> 
> How is this different to the patch I left an R-b for on v1?

Somehow with having changed so much for v2, it felt strange carrying
over many of the R-b-s. Though yeah, this one could've made it :-)

Heiko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
