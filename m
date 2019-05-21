Return-Path: <SRS0=Dqti=TV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 995B2C04AAF
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 21 May 2019 05:31:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6758521743
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 21 May 2019 05:31:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y7OazRok";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="kyLq6vqx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6758521743
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qh+xBXYcG4xoVqWGRkZz8y7zGRBlmJv0Wv/gVRT3Rsg=; b=Y7OazRokKr/B3O
	HqBENzVcOXRPU4HSE/s8JX//5E2k13iahM8O7IHml4JXhIt2R3s5r9pa0mgX0eo1L5SfIvGyjd3NN
	8PZCKc+e4cy2T+q99aTDgpWi/gzRNp+/9bFrIJUTT055MFRrm6Y2OH1RB1ib2e4QT0ZyqoGcUk8vT
	wHKwptrt0Dfa1eETDq+lGZ6xgtyu/unuZOCRvioim+ctFZszrW9RdqOgufdccVzuA6p4G8jUNzj4c
	3n04LgCPxCxGgICbSFCa9l4XeoXGmf60YqB7LgkysQbVfyl7jaglqIRfSUNKHqn+ekdS/p6+UsBQ4
	V/gpvJFbnE0nUe0AIZoQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSxNE-0001Di-T6; Tue, 21 May 2019 05:31:40 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSxNC-0001DN-Aj
 for linux-riscv@lists.infradead.org; Tue, 21 May 2019 05:31:39 +0000
Received: by mail-lf1-x144.google.com with SMTP id q17so12046081lfo.4
 for <linux-riscv@lists.infradead.org>; Mon, 20 May 2019 22:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BtJH/XFatQoBOkqt6CnXFYn8cVFYIMDvg7sFFa+676w=;
 b=kyLq6vqxe11UGM5dCp65/VIEmlD+ACNL83MCfoFC4CUz1LW2/BkZq4jQPkPHtoH8Ze
 tbExs1uaTjddyOv7pHBFTilzgdvXBRGSZKZXcpcn8xDRUGBmna44cQXLRF96xO5UXA4u
 eYGAysbsIfGMw15tyeUOW4868nK5HtjkxNHYDXZkLaE0/bvwzSKsmyMn1g8Y97f7epr5
 QPgL7TJOZ7IO8L2Aff3vxpQwf56lh+FleBOwoZLtOZ0xtS8nWiBooOlgBkDp+5b0SYgW
 JtV2bfR2aAL4pJj7ygZJl1GuzifomEgI2FgLpQehqn/Cpw+fhIjwKraPQ3DYgPxGcaM3
 8xHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BtJH/XFatQoBOkqt6CnXFYn8cVFYIMDvg7sFFa+676w=;
 b=n40AymswL5010B6gP0F2QIKsXWiuAmnR7S11lpazGUzEmK5+01uEI3R5yDWlnLFZ1/
 ZqleONpnc5Fk9uIrS3blnanIJhJubp1E6B0wCKYQVuKPK5SpO1xz9imwobvzBBayrcyz
 s08PjwT6iL+pGVR9PFe80MaIx4Q4m+MjKqdOwnbKmpz/jqMr7ZS2Xd/YA54QcWkvuYme
 1lamd08/EI/aYu1yh3PjdATus+Omsb3Mxj2wtv5KZLHnR3/1hh3ILfVkatviXOp2t6cA
 4+Jo+3a+ROdZp11kOMCEgfe0i1h48SyRSq0PzmgMMO9+cIfQlVcjPOhHd8oYec2m+UUs
 zmZQ==
X-Gm-Message-State: APjAAAXI5VoFE2paGUO9ZStS1thgjX68VCyyCALTjqre9GZ6W1tLx0hY
 EvlYlW2t9Z7DOkjivCXkvHBqSEWQswGtTYdETa+yxg==
X-Google-Smtp-Source: APXvYqwTO5cDb3MVcX3rsZTp5AzbDa+LWhvMDys5bBDQIRDcxlANQjUTioD3NEoxscJG3c+mMbm/QAYAZESzHIp/t1k=
X-Received: by 2002:a19:c60f:: with SMTP id w15mr39497034lff.61.1558416695999; 
 Mon, 20 May 2019 22:31:35 -0700 (PDT)
MIME-Version: 1.0
References: <1557142026-15949-1-git-send-email-yash.shah@sifive.com>
 <1557142026-15949-2-git-send-email-yash.shah@sifive.com>
In-Reply-To: <1557142026-15949-2-git-send-email-yash.shah@sifive.com>
From: Yash Shah <yash.shah@sifive.com>
Date: Tue, 21 May 2019 11:00:59 +0530
Message-ID: <CAJ2_jOG9Ag0spbh3YCxavUE5XEAUP1pHcgCZ56Nu2u4TqfrzHQ@mail.gmail.com>
Subject: Re: [PATCH v2] edac: sifive: Add EDAC platform driver for SiFive SoCs
To: linux-edac@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Palmer Dabbelt <palmer@sifive.com>, Borislav Petkov <bp@alien8.de>,
 James Morse <james.morse@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_223138_394378_3CCDCB80 
X-CRM114-Status: UNSURE (   7.68  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: aou@eecs.berkeley.edu, paulmck@linux.ibm.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, nicolas.ferre@microchip.com,
 Sachin Ghadi <sachin.ghadi@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, mchehab@kernel.org,
 davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, May 6, 2019 at 4:57 PM Yash Shah <yash.shah@sifive.com> wrote:
>
> The initial ver of EDAC driver supports:
> - ECC event monitoring and reporting through the EDAC framework for SiFive
>   L2 cache controller.
>
> The EDAC driver registers for notifier events from the L2 cache controller
> driver (arch/riscv/mm/sifive_l2_cache.c) for L2 ECC events
>
> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> Reviewed-by: James Morse <james.morse@arm.com>
> ---
> This patch depends on patch
> 'RISC-V: sifive_l2_cache: Add L2 cache controller driver for SiFive SoCs'
> https://lkml.org/lkml/2019/5/6/255

The prerequisite patch (sifive_l2_cache driver) has been merged into
mainline v5.2-rc1
It should be OK to merge this edac driver now.

- Yash

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
