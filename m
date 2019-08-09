Return-Path: <SRS0=W4pZ=WF=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4AECC31E40
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  9 Aug 2019 14:25:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76CF9208C3
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  9 Aug 2019 14:25:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rfJ6R9L5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="nk6FZnAY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76CF9208C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZKrIEJBujDSCAjQn8aOpqUAhAYKY3lB+Z0uNZs2dvzU=; b=rfJ6R9L5IE1Zrq
	sSV5EJ+Mi0imWS1a8sL2ShSHKFd+plwdL4o07zgiV1ZlF0AVSa1zmQO/x/k//70wtptzD9uap2vcL
	CKoTTArNsyCL6yHfuIrQZ1u5cChB1V8SwPENOHb7LO3G4FjOY5HtLOXlweJqoj6QCvdNeIeCG5qVU
	fTYGgR3UkYBXnEW8jodXlFKtG9T2IY1lpna4TNmIgn02/TlWI9wMS/Hgdii6UJs6wkXhgGPvKK1nQ
	B7GcfsXzm6ITMLLWmLThH5q4a4NjCeFnylGWdhXeSG/V6oQilXpJzLIgNmbXvKuHiCsm+efhtQZNE
	Tc19cHjNRN0NjxbUqAUw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hw5pc-00072G-FP; Fri, 09 Aug 2019 14:25:24 +0000
Received: from mail-vk1-xa42.google.com ([2607:f8b0:4864:20::a42])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hw5pa-00071c-0n
 for linux-riscv@lists.infradead.org; Fri, 09 Aug 2019 14:25:23 +0000
Received: by mail-vk1-xa42.google.com with SMTP id q203so347535vke.5
 for <linux-riscv@lists.infradead.org>; Fri, 09 Aug 2019 07:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iaNaUNE2Lm/DgVn/kiWl1beHyjX5/83GtVA//BN/oCU=;
 b=nk6FZnAYm3f6V38YcMyeSsu0Umh0fsof410CcKVZQaxBC8x/YE8E6oR2ruW26hoC9D
 Zj6QS0XfftZ1LoWs7MHDOd3CmVWpYuokUYAMVyeKYU9BwWdndrSPV2Q0Yy/PaRS1k0mr
 8pspJyF+4DaavEjWM8n7ntRTD5FhspUmjDDUqC6FChsB4BVpzCDu+BwYrwRiIvj4UABy
 yzAmlatWQ4E+MUKHXZOXi8O9/iXBVV3dXwyxpfK0+yldGpI8eRlud78B4DAR22xeCvHH
 Vcq1q7f15wJAHBRnVG2ooSHpngu3PqEw2txKOrLa6G/2dx8v3DeGn+TeCH7JsbM/v/kr
 AyFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iaNaUNE2Lm/DgVn/kiWl1beHyjX5/83GtVA//BN/oCU=;
 b=o4TjFcxFyuwroK/oN1Me6dMTQsHA3NBnih5LysJw4exdj2Eoo32d8VBlEth3zU7Ikq
 uP5mE1fqDFZNiT+rlXavnQZ1NR9WOZRnvI9EZxCGoNqD368T+jOWleUTGDAZCKh62NHW
 Oj5wfa4f311W1cNGNsafdDaaurUidyL8oqkPNNkLmW64IaCi4alJmmnwM11vHsjBnOwY
 vknbn0+F6eLUrs5mgN0kjOrrHfWoXDPpWYwojijT37y7hGpG21SgaSpoqFHziH5NcBIj
 fTenTRgElrbryCYQfwFv5p4NfHSwQmb8cTfDW18MBJGGJvqjWU9OBjHbtsOAjIWz4lGg
 o5Lg==
X-Gm-Message-State: APjAAAUByuBuaUz0qs7X3zDUgRUrV0bFD5oGduUNsgLwpXlfTJ25sKtB
 RbbwP1datCQVppU1bJtjJpXvyXkaCvyzxOBKEuWCMQ==
X-Google-Smtp-Source: APXvYqxlwwv+mIYjMSLT6AYQcdMGIum7Lac0W7UqF0yof/9MA/LBA+pmeTrwvMQqMxircZURRx/x9Iljguiqp22qud4=
X-Received: by 2002:ac5:c24e:: with SMTP id n14mr3363758vkk.23.1565360720450; 
 Fri, 09 Aug 2019 07:25:20 -0700 (PDT)
MIME-Version: 1.0
References: <1562092745-11541-1-git-send-email-sagar.kadam@sifive.com>
 <1562092745-11541-3-git-send-email-sagar.kadam@sifive.com>
 <5d1d10be-d01f-51ca-0a08-c5a52cd467b9@ti.com>
In-Reply-To: <5d1d10be-d01f-51ca-0a08-c5a52cd467b9@ti.com>
From: Sagar Kadam <sagar.kadam@sifive.com>
Date: Fri, 9 Aug 2019 19:55:09 +0530
Message-ID: <CAARK3HnBg2bY5DG=JM+zG9TtNDSRgj5Nqz3+1shiK3AUC-zv9Q@mail.gmail.com>
Subject: Re: [PATCH v7 2/4] mtd: spi-nor: fix nor->addr_width for is25wp256
To: Vignesh Raghavendra <vigneshr@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190809_072522_057864_52B48F11 
X-CRM114-Status: GOOD (  15.63  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, tudor.ambarus@microchip.com,
 richard@nod.at, Palmer Dabbelt <palmer@sifive.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>, miquel.raynal@bootlin.com,
 linux-riscv@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Vignesh,

On Fri, Aug 9, 2019 at 5:05 PM Vignesh Raghavendra <vigneshr@ti.com> wrote:
>
>
>
> On 03/07/19 12:09 AM, Sagar Shrikant Kadam wrote:
> > Use the post bfpt fixup hook for the is25wp256 device as done for
> > is25lp256 device to overwrite the address width advertised by BFPT.
> >
> > For instance the standard devices eg: IS25WP256D-JMLE where J stands
> > for "standard" does not support SFDP.
> >
> > Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
> > ---
>
> Reviewed-by: Vignesh Raghavendra <vigneshr@ti.com>
>
Thankyou for reviewing.

BR,
Sagar
> >  drivers/mtd/spi-nor/spi-nor.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> > index 971f0f3..315eeec 100644
> > --- a/drivers/mtd/spi-nor/spi-nor.c
> > +++ b/drivers/mtd/spi-nor/spi-nor.c
> > @@ -1860,7 +1860,7 @@ static int sr2_bit7_quad_enable(struct spi_nor *nor)
> >       { "is25wp256", INFO(0x9d7019, 0, 64 * 1024, 1024,
> >                       SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> >                       SPI_NOR_4B_OPCODES)
> > -     },
> > +                     .fixups = &is25lp256_fixups },
> >       /* Macronix */
> >       { "mx25l512e",   INFO(0xc22010, 0, 64 * 1024,   1, SECT_4K) },
> >       { "mx25l2005a",  INFO(0xc22012, 0, 64 * 1024,   4, SECT_4K) },
> >
>
> --
> Regards
> Vignesh

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
