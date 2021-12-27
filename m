Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29BF0C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Dec 2021 22:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=mIqCnhQISWm789S0EBN/eHgSLecWcDavnvDsKsKL0NQ=; b=TxdDzKdG2oNic6
	lfYr+ULOSN0s0OI4AOzOXt2GckT9etLLJwJcvIUnxAnzRAwR34r7o+qPi9h6yRYFiZbBmiiUC3l5F
	PFKjPP1c9AlnxBg0kdKt3Wa73KGdRzzWx+I4qXsfdD2qadaR4XO6tagtBT7QcqXyacz0agFbwrps0
	zHaePb7jBBkhOpn43IUgxUAKNn652VUYszzg7SIg/DUP+bpgrNvyV9vfG3y4aIAjQi8qo6VC8ItHS
	JpaTRSnESru+KIQGFksDWu2Vqf0tkADNLdpyDflCkeJ01DtgBwOg9MaI8xu3mtcBrk5zhroGMlAVG
	+sI5Wywxx+6NdEQNd3iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1yZ1-00HWtN-1P; Mon, 27 Dec 2021 22:33:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1yYy-00HWsx-LA
 for linux-riscv@lists.infradead.org; Mon, 27 Dec 2021 22:33:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 26C586102A;
 Mon, 27 Dec 2021 22:33:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B58DC36AE7;
 Mon, 27 Dec 2021 22:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640644430;
 bh=/sJY7Kisz1PSOFfZV+hFs5yhBktmtLqFb2f5YxJeypg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=qwgGSPvatgMe1CpNXXSX+vv/ERMiU7z545ZfOCpO+f1+4P8hhpXjl+Wdgtyyc9ufd
 eD7w2TB3tYdV6BYtgGkzURzDTm/j3KniZsvqSyNieblnbr1y6Nx1wyJe+l3GqeKXv3
 o+6TyuA9rfBpIzNRhulx//qhQDoQlej1bluDv9OUWVVb/EYOyMeAESrlR2uFi9Bmqo
 fLjgW5tmyq6w3LTfgb8n0DPvlOp2bmTBChMh9OmDnr7ipigWHnLCauzsvWBjlhMiTt
 nJ5NRRTogGH5opz9tvGIIdHy6e6Eux9NyWRjGhXlzV0GuBtCCUx4oP0SdLRUjCsiIO
 /L9526LATEFLQ==
Date: Mon, 27 Dec 2021 16:33:48 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 John Garry <john.garry@huawei.com>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-csky@vger.kernel.org
Subject: Re: [RFC 28/32] PCI: make quirk using inw() depend on HAS_IOPORT
Message-ID: <20211227223348.GA1545446@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211227164317.4146918-29-schnelle@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211227_143352_801411_7107C4C9 
X-CRM114-Status: GOOD (  18.98  )
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

On Mon, Dec 27, 2021 at 05:43:13PM +0100, Niklas Schnelle wrote:
> In the future inw()/outw() and friends will not be compiled on
> architectures without I/O port support.

This commit log actually doesn't say what the patch does.

I'm pretty sure this particular quirk is x86 specific and could
probably be moved to arch/x86/pci/fixup.c, where the #ifdef probably
wouldn't be needed.

If we keep it in drivers/pci, please update the subject line to make
it more specific and match the convention, e.g.,

  PCI: Compile quirk_tigerpoint_bm_sts() only when HAS_IOPORT set

BTW, git complains about some whitespace errors in other patches:

  Applying: char: impi, tpm: depend on HAS_IOPORT
  .git/rebase-apply/patch:92: trailing whitespace.
	    If you have a TPM security chip from Atmel say Yes and it
  .git/rebase-apply/patch:93: trailing whitespace.
	    will be accessible from within Linux.  To compile this driver
  warning: 2 lines add whitespace errors.
  Applying: video: handle HAS_IOPORT dependencies
  .git/rebase-apply/patch:23: trailing whitespace.

  warning: 1 line adds whitespace errors.

> Co-developed-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
> ---
>  drivers/pci/quirks.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
> index 003950c738d2..8624c98c57b2 100644
> --- a/drivers/pci/quirks.c
> +++ b/drivers/pci/quirks.c
> @@ -265,6 +265,7 @@ DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_NEC,	PCI_DEVICE_ID_NEC_CBUS_1,	quirk_isa_d
>  DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_NEC,	PCI_DEVICE_ID_NEC_CBUS_2,	quirk_isa_dma_hangs);
>  DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_NEC,	PCI_DEVICE_ID_NEC_CBUS_3,	quirk_isa_dma_hangs);
>  
> +#ifdef CONFIG_HAS_IOPORT
>  /*
>   * Intel NM10 "TigerPoint" LPC PM1a_STS.BM_STS must be clear
>   * for some HT machines to use C4 w/o hanging.
> @@ -284,6 +285,7 @@ static void quirk_tigerpoint_bm_sts(struct pci_dev *dev)
>  	}
>  }
>  DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_TGP_LPC, quirk_tigerpoint_bm_sts);
> +#endif
>  
>  /* Chipsets where PCI->PCI transfers vanish or hang */
>  static void quirk_nopcipci(struct pci_dev *dev)
> -- 
> 2.32.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
