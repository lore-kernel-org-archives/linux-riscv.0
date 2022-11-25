Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63B3AC43217
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Nov 2022 16:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Rtt+0GlJD2/JuHfa7BXFZ0eQt1OwKCPavclkRRXPCM=; b=XbeP4ZvWD78pND
	QzaXT9jKYNk1srLA8zn8oM6Iz23X4RtGV9TZ02TWPdiy/WyJxpHcX1XUen+NS1ea/QuMetUf6HCzN
	orNdBswgVM6locpFXDZosUqmJfLVuUVaUbhNmGLyLsN2vJ1/5u2X2MWC/MVeV/L5LyHxgkXhe3uyV
	Fv9AYAeLQWr7HW2fMfP3lufSQDGZPtGTnKfN3AZWHpO9nqj4HBffL3bmpdkBDB/2ehbFMmWXOz+tS
	H4fOSscF+eTysnzghxyQGF0zhGHcWffJcuAMVFyMwBn98y+YLQ48WG7Vh35lUkU7/83WPoJFH+Z4m
	cjdc26mDQYNhlmlhAyBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oybut-000Ual-Ds; Fri, 25 Nov 2022 16:51:07 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oybuq-000UXw-Pa
	for linux-riscv@lists.infradead.org; Fri, 25 Nov 2022 16:51:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0879CB82B93;
	Fri, 25 Nov 2022 16:51:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C106C433C1;
	Fri, 25 Nov 2022 16:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669395061;
	bh=icHKk06I7LpqiDqMP789HRUwYmQW5jPo6VqdPDTS/l0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fW+oXsPKDd4V7QfsuSQ8mi7itl3qhA+l/jsjxp4R/tQbLLacjNOTuvmDFGKAJmST/
	 Ns6JCKP+scAu/e1n0oWRGYl+XJn5quEPOizb96pg6sFF6eAiDtQjwQEB+fM6m0XSyB
	 wxqbHzuB/Z2nnh7UAlOyIMhIcWjoYq3/Qs63H2NIczJ8gBtazTsxtN7MGq3EFAQbC+
	 Qz7olmfgnO2AVTXZb3Bd6FP3CbRufW//0y0ogMGm+tP223+leTuRpplXZF5mYIek/e
	 fNc/5un+ub/9cXPeAUjncq2bqDzMScZw4y9Nnhi3glWGdSG89NAsFp4X3PiY+H8ooG
	 lbp+OS619LKiA==
Date: Fri, 25 Nov 2022 16:50:54 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
	Atish Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v4 6/7] dt-bindings: cache: r9a07g043f-l2-cache: Add DT
 binding documentation for L2 cache controller
Message-ID: <Y4DybtJuw9f5vl/D@spud>
References: <20221124172207.153718-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221124172207.153718-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <70d1bfde-f57f-1741-08d3-23e362793595@linaro.org>
 <CA+V-a8s2awLp=YvbhA1Ohe500Oh1easLUcG9V4_FWov7Pf2i6g@mail.gmail.com>
 <9b0f8312-2caa-b9f3-edf3-1b720532f559@linaro.org>
 <Y4C0Jn1hl81ZCxOt@wendy>
 <ab0e55a2-d99a-328e-4f54-6a75936a1c81@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ab0e55a2-d99a-328e-4f54-6a75936a1c81@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_085105_150417_F0683CB4 
X-CRM114-Status: GOOD (  28.36  )
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

On Fri, Nov 25, 2022 at 04:55:11PM +0100, Krzysztof Kozlowski wrote:
> On 25/11/2022 13:25, Conor Dooley wrote:
> > On Fri, Nov 25, 2022 at 01:12:18PM +0100, Krzysztof Kozlowski wrote:
> >> On 25/11/2022 11:34, Lad, Prabhakar wrote:
> >>>>> +/* Device, Non-bufferable */
> >>>>> +#define AX45MP_PMACFG_MTYP_DEV_NON_BUF                       (0 << 2)
> >>>>> +/* Device, bufferable */
> >>>>> +#define AX45MP_PMACFG_MTYP_DEV_BUF                   (1 << 2)
> >>>>> +/* Memory, Non-cacheable, Non-bufferable */
> >>>>> +#define AX45MP_PMACFG_MTYP_MEM_NON_CACHE_NON_BUF     (2 << 2)
> >>>>> +/* Memory, Non-cacheable, Bufferable */
> >>>>> +#define AX45MP_PMACFG_MTYP_MEM_NON_CACHE_BUF         (3 << 2)
> >>>>
> >>>> What are all these? They don't look like flags, because 3 = 1 | 2...
> >>>> they don't look like constants, because we do not use shifts in
> >>>> constants. Are these some register values? I also do not see the header
> >>>> being used in the code, so why having a bindings header if it is not
> >>>> used (DTS is not usage...)?
> >>>>
> >>> These are register bit values for the MTYP[5:2] field. The DTS example
> >>> in the binding doc (above) uses these macros. I haven't included the
> >>> DTS/I patches with this patchset yet do think I should?
> >>
> >> Then why storing it as bindings? Bindings headers describe the interface
> >> implemented by drivers and used by DTS, but this is not implemented by
> >> drivers.
> > 
> > IIUC, some of these properties are non-discoverable attributes of the
> > cache controller. I see two things that could be done here that are
> > "better" than #defining bits:
> 
> I did not comment about properties. I comment about constants. Why
> register values/offsets/addresses are in this particular case suitable
> for binding headers?

I don't think we disagree here. I'm not in favour of the defines either
here. Perhaps I confused you by accidentally not adding Prabhakar to the
to field.

The dt needs to convey his particular cache implementation's bufferable
and/or coherent regions so I was suggesting alternatives for conveying
this information, without resorting to defines.

> > - add an RZ/Five specific compatible and use match data to set the
> >   attributes which is only possible if the pma-regions are set on a
> >   per SoC basis
> > - make pma-regions into a child node, in which andestech,non-cacheable
> >   andestech,non-bufferable etc are properties of the child node


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
