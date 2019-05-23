Return-Path: <SRS0=tx4i=TX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DEC8C282DD
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 23 May 2019 23:51:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 092442175B
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 23 May 2019 23:51:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KDZEUJN4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="CwBpnrcY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 092442175B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=QleAwy3zmiM01HqK4RgFF+4m+SaHDGzvY9yE84af3ew=; b=KDZEUJN4O5Vd4BIliEGl5yfpXV
	BOYYw5sKzlcxteYE6uaQlK+gIh3p1KqbG//gz4ZdAlLJikWrCqELZOTDtkY63W/3qsZnmClMvjZ9+
	CHvYb9VO3Eb/KYyLIQ4dS/ejprDwF9tv8MxKpaaWkbH8IoUpfXzydr9wyNTdHwsyRZboVHbPlU4U9
	Zeivl7AwbK6U9O4Q15K3UK68tFMrvQRN1jYniYk4MEd3jgZxu6+LNDV6R2fFCuRrDmMA0PD+uKU27
	DlmOZObhphqSOLN96yXTFF4UTY+pwXbAQJVHC4joRAYhrCTvM9nWMbqgGUSnYTLuCuDZp6xWhboJ+
	dh9NrCkw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hTxUH-0002tx-E5; Thu, 23 May 2019 23:51:05 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTxUE-0002tO-Sj
 for linux-riscv@lists.infradead.org; Thu, 23 May 2019 23:51:04 +0000
Received: by mail-lf1-x141.google.com with SMTP id n134so5649676lfn.11
 for <linux-riscv@lists.infradead.org>; Thu, 23 May 2019 16:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=fhBZncJ2MpAJBlQB8zRObQZP1s/1ENOk1yYHyMaqLDc=;
 b=CwBpnrcYLEefMJFuxPFCRN4iTwN5WamdydpeCsRT71D0rSxVvB/+yh7YpZYxb0y/st
 5uIc3/aNLUiHEsPWzhZUOxFhlgrSOswawfDUiHAURx0ICrBTwtC4fGeRzeK+bQ9fxzO2
 AUqaFa327tG+7cjZlXV0TpFwev6e76lpur/kCU2/RB8eCN98srXtjhNhv3+3AfiHhVYt
 VOUOoJ5Pj7J83Mghc5cBnVxIjhyDuj/U6gaRNjvAzyqixszSffdBW835Yysw9I2gNvPW
 YuzNr3ULFt2eu7hOGS1lkEYi8akIZfNoRkPNDZvD25cMEQQZ5axf+KYvtbiHXAS7lkDn
 qbMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=fhBZncJ2MpAJBlQB8zRObQZP1s/1ENOk1yYHyMaqLDc=;
 b=eNG4rVKvS80RAhiOcdxHJ1sewaQjgZDFvjxrr/L8GeB0jIOU6N8csKotQ3aNc5RJRq
 VXiyiP4nhWZz/ymAMdCtDKXqiEr2+Bok1NCSC+Z3jDKsrvgiy8pTK95E5ABgk/h7oIh8
 l22hWMv4Gfb3aF9GXp/yr0XtHeKMlRNffj0b7tMdrNsExYAqasnL6uvKomZPgM8ZODdP
 7xmTUc4Oyi5QND1ANGsF6MjhOnvtx39Bx4dVu5sE8gZuPKbRP9wP9I+TgwTJurantuSM
 hChyel/wAW0tIgMoHjW6RDk1lyxih4UV5r6tACjfN/drkq9vu+7Xr8BofXc1dVsFyoC/
 SEZA==
X-Gm-Message-State: APjAAAXM6lLYDQWljQJlJN/l5wq8eT3/XQCJOytATyDIPODvz/XjCk/O
 6dtPteV7aIlSG5zjIRZTMxr/+fr2zTmtjPVaGs5sUA==
X-Google-Smtp-Source: APXvYqxOUSWUQ3jLt0ClnRsVTHOlGj4gBaUGVeolp0BKGbX6O77PYECRjhSrrEERuRToBxdhUEoYFivoa6PmBkssuh0=
X-Received: by 2002:ac2:4286:: with SMTP id m6mr7494929lfh.150.1558655461095; 
 Thu, 23 May 2019 16:51:01 -0700 (PDT)
MIME-Version: 1.0
References: <1558648647-14324-1-git-send-email-alan.mikhak@sifive.com>
In-Reply-To: <1558648647-14324-1-git-send-email-alan.mikhak@sifive.com>
From: Alan Mikhak <alan.mikhak@sifive.com>
Date: Thu, 23 May 2019 16:50:50 -0700
Message-ID: <CABEDWGy8PhHqqRPpZjVrd3VtwxmtxV+Gs-8442e9EvKjFQLELw@mail.gmail.com>
Subject: Re: [PATCH v2] PCI: endpoint: Clear BAR before freeing its space
To: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, kishon@ti.com, 
 lorenzo.pieralisi@arm.com, linux-riscv@lists.infradead.org, 
 Palmer Dabbelt <palmer@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, gustavo.pimentel@synopsys.com,
 wen.yang99@zte.com.cn, kjlu@umn.edu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190523_165102_944778_D3ABC26E 
X-CRM114-Status: GOOD (  11.99  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

+Bjorn Helgaas, +Gustavo Pimentel, +Wen Yang, +Kangjie Lu


On Thu, May 23, 2019 at 2:57 PM Alan Mikhak <alan.mikhak@sifive.com> wrote:
>
> Associated pci_epf_bar structure is needed in pci_epc_clear_bar() but
> would be cleared in pci_epf_free_space(), if called first, and BAR
> would not get cleared.
>
> Signed-off-by: Alan Mikhak <alan.mikhak@sifive.com>
> ---
>  drivers/pci/endpoint/functions/pci-epf-test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pci/endpoint/functions/pci-epf-test.c b/drivers/pci/endpoint/functions/pci-epf-test.c
> index 27806987e93b..f81a219dde5b 100644
> --- a/drivers/pci/endpoint/functions/pci-epf-test.c
> +++ b/drivers/pci/endpoint/functions/pci-epf-test.c
> @@ -381,8 +381,8 @@ static void pci_epf_test_unbind(struct pci_epf *epf)
>                 epf_bar = &epf->bar[bar];
>
>                 if (epf_test->reg[bar]) {
> -                       pci_epf_free_space(epf, epf_test->reg[bar], bar);
>                         pci_epc_clear_bar(epc, epf->func_no, epf_bar);
> +                       pci_epf_free_space(epf, epf_test->reg[bar], bar);
>                 }
>         }
>  }
> --
> 2.7.4
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
