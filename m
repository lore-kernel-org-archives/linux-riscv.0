Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B473C4167D
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Nov 2022 12:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uF80/WY65wWa6IAnIavN8JZlkJI2bMzJsITXoB2ZZxc=; b=aDr3tgdimFaPR2
	2wktWbLTvjcyPOUpYzSPK0lmwYlEjeD2rQ/Qd0LpTkapIoiDUBxqXE2hkNafAEg7GEDpA6cZL37UY
	LURZnVEKCfuyo5SMTkGURNoOzN8t9g1mqKxCWl/l6voVuqryLpInKVNvNJ+X9dJcjHRjD1CQfOeV4
	+3vwGNEzMvPjXNHwUaIjGwdmwuJAJufC/VQXachgZoJUuFHqSBnnpR1Vu0xJBu3LbF/mOEZQilK2Y
	xh3Gn7so/miST/PsyyyPNiQsQu/pVssFgkvWr2XCFY51PtXzeDppre9G3DRgIsd88qvsFJ5gIf1yH
	+oUVuOIJDJTlLc54YXtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyXm2-00GOu1-0X; Fri, 25 Nov 2022 12:25:42 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyXly-00GOsG-Nk
	for linux-riscv@lists.infradead.org; Fri, 25 Nov 2022 12:25:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669379139; x=1700915139;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1MH4WmgIg0ZlYvyJXa/5tJQIPZf6/zpnA84EQYEbUiY=;
  b=zTZDnAIEY+rYqAnoXC4f95GvXZnAJgGvvpRkC0R9fsq5++M53u3GU/0a
   7Aq4mgQe9gDthzewiXIjt+PdMpug6Qmhb/pdkvIHFdiTBeZc/g3SYV0dm
   qffng7CQLR3YqNhlXd21PMKvSVpwr0rqNxr1b8vi8bOMKIMeJNV9BX+Yy
   JnGYrK/hlrZeeTHOjhS58nkOZPDW/TuFRpTXzCL+XrOWiOFRZ6yHSqYGy
   7kOoqp61ixV3Wa563dRiImlNzQ3ovSPkz7yc6oF1Cv4ayKIfb0Ua0gTeF
   YkEC+gTDTMrUhynZ3QvwrIJcxqeYFsNAmmTqI+8IWLyX/9iW4Gy3tIyxz
   A==;
X-IronPort-AV: E=Sophos;i="5.96,193,1665471600"; 
   d="scan'208";a="185169434"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 25 Nov 2022 05:25:32 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 25 Nov 2022 05:25:31 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Fri, 25 Nov 2022 05:25:28 -0700
Date: Fri, 25 Nov 2022 12:25:10 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus
 Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Guo Ren <guoren@kernel.org>, Jisheng
 Zhang <jszhang@kernel.org>, Atish Patra <atishp@rivosinc.com>, Anup Patel
	<apatel@ventanamicro.com>, Andrew Jones <ajones@ventanamicro.com>, Nathan
 Chancellor <nathan@kernel.org>, Philipp Tomsich <philipp.tomsich@vrull.eu>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-renesas-soc@vger.kernel.org>, Biju
 Das <biju.das.jz@bp.renesas.com>, Lad Prabhakar
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v4 6/7] dt-bindings: cache: r9a07g043f-l2-cache: Add DT
 binding documentation for L2 cache controller
Message-ID: <Y4C0Jn1hl81ZCxOt@wendy>
References: <20221124172207.153718-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221124172207.153718-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <70d1bfde-f57f-1741-08d3-23e362793595@linaro.org>
 <CA+V-a8s2awLp=YvbhA1Ohe500Oh1easLUcG9V4_FWov7Pf2i6g@mail.gmail.com>
 <9b0f8312-2caa-b9f3-edf3-1b720532f559@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9b0f8312-2caa-b9f3-edf3-1b720532f559@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_042538_853181_938B624B 
X-CRM114-Status: GOOD (  20.62  )
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

On Fri, Nov 25, 2022 at 01:12:18PM +0100, Krzysztof Kozlowski wrote:
> On 25/11/2022 11:34, Lad, Prabhakar wrote:
> >>> +/* Device, Non-bufferable */
> >>> +#define AX45MP_PMACFG_MTYP_DEV_NON_BUF                       (0 << 2)
> >>> +/* Device, bufferable */
> >>> +#define AX45MP_PMACFG_MTYP_DEV_BUF                   (1 << 2)
> >>> +/* Memory, Non-cacheable, Non-bufferable */
> >>> +#define AX45MP_PMACFG_MTYP_MEM_NON_CACHE_NON_BUF     (2 << 2)
> >>> +/* Memory, Non-cacheable, Bufferable */
> >>> +#define AX45MP_PMACFG_MTYP_MEM_NON_CACHE_BUF         (3 << 2)
> >>
> >> What are all these? They don't look like flags, because 3 = 1 | 2...
> >> they don't look like constants, because we do not use shifts in
> >> constants. Are these some register values? I also do not see the header
> >> being used in the code, so why having a bindings header if it is not
> >> used (DTS is not usage...)?
> >>
> > These are register bit values for the MTYP[5:2] field. The DTS example
> > in the binding doc (above) uses these macros. I haven't included the
> > DTS/I patches with this patchset yet do think I should?
> 
> Then why storing it as bindings? Bindings headers describe the interface
> implemented by drivers and used by DTS, but this is not implemented by
> drivers.

IIUC, some of these properties are non-discoverable attributes of the
cache controller. I see two things that could be done here that are
"better" than #defining bits:
- add an RZ/Five specific compatible and use match data to set the
  attributes which is only possible if the pma-regions are set on a
  per SoC basis
- make pma-regions into a child node, in which andestech,non-cacheable
  andestech,non-bufferable etc are properties of the child node

Prabhakar, does that make sense or am I off with my understanding of the
attributes?

Thanks,
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
