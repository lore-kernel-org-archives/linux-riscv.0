Return-Path: <SRS0=5Ln/=PP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06163C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  7 Jan 2019 06:34:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C19E720859
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  7 Jan 2019 06:34:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jCp4twwn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="PVldR4de"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C19E720859
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:References:Message-ID:In-Reply-To:Subject:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yVIvinCe5FQFRdPyqBCcd6A6jgwfC0Ik6CJU/tkun8A=; b=jCp4twwnp8geCj7+1RtX9Msc1
	gNECkDuUcIcgcUs81iaGiJ0XHQWbWDXU+ggLRwIv96LkEUbdnLMXMFgodj1Gstt7U2u7NuQgodRO4
	be2K0gzdB++NmBb0chfgsjksgdMS2XdXAhjyUMILBvJ4wA05+3uKBwfUvyBGMuEM3RYBw6QVk+mk+
	RZhufF1IKXdII1KU7c69ObErGAIiYSYVF+HTzO29PIARBnSHE4u4j0nItZMM5G9JsZP4npI1GXT8T
	5glp7HAjEsxRcYld2HCeBqLbxPx/3anDAG/J2IP60AaglT/HSXFGue1NDyMowC51ShkH0CABf4ob6
	/gv73+48w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ggOUN-0007s2-R0; Mon, 07 Jan 2019 06:34:19 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ggOUK-0007rd-Ja
 for linux-riscv@lists.infradead.org; Mon, 07 Jan 2019 06:34:18 +0000
Received: by mail-pf1-x442.google.com with SMTP id u6so21333490pfh.11
 for <linux-riscv@lists.infradead.org>; Sun, 06 Jan 2019 22:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=5pMOnGbv48uiQlSqacBWufgiXdAIDwznOO2KrHGv4fk=;
 b=PVldR4depEHCU+487RBIwrOYxNYiSQ4+5p65n/MwRdxxyVp5SLgxOWwL/dPVJprWdI
 U9Z6jObPtYhM61q3WywjS+umdSnz+Wgk+fpf3L9CPDX0aRST8XNRzMY08Havs7n8myrs
 UK1TRFcX4EDJ2SgTqi9WPQAq268nj5P5LyH4wk34r+52IO7caiIiVoR7ThvgoMVqr82k
 wlONq88YSC/TsVsGGBbTX4+aQQhG3FZouGufEJgoFOsbGsxVoXWQXgORposN5X/8v+j9
 /A1xkSH3DtoNol2D+D2II36aTnPONG79gLmv5UCFEq/t240j1eqD1U0bQJAVJ01F2tlF
 VH4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=5pMOnGbv48uiQlSqacBWufgiXdAIDwznOO2KrHGv4fk=;
 b=TC4AI/sH8zntjIL72Gg+QB1J2MX5HLrRvlutRinvVnS6KFn1dpYyY9+y9MZF0LBYxg
 neR0mkBOtT7Uz0octf9qGj98d0W/BWB8zBGJPHz/bCCZyokBTmxrT0HICUGHFp9mtcOP
 ML7TwbI01CTy47czaQ1kI0Vh0oXLly7X4y/1kHptCFDAXqCbsjZSQzryfRgNNLJgKLS2
 +rZixbTstbZpJSyzvHVdc/4aHrBGAlY68/Ekszt8Yg//rxXT3VhU0WWVzC0s0yFBfK3K
 kqkxrh/bu4h2BU9fudrw3SoZF5qQmyrtFUSEn8s5LlTpfxK/zrgj5JzOWUw7GF7c1nTB
 yW/A==
X-Gm-Message-State: AJcUukcgaVujHhEdRc3HFX2CaZqRsWrNjbyh9273NeMvIZMvcukxzX0O
 ds2tTUL9EJOGdHaPB8nUucY0jg==
X-Google-Smtp-Source: ALg8bN6ql0L/Hic9EoGD7zWTodxraGVFFvlTI8mNxMo5HWODlobi/+OZBLQCWorxbzU3YBV4LI+f1w==
X-Received: by 2002:a63:2ac9:: with SMTP id q192mr9932131pgq.58.1546842855491; 
 Sun, 06 Jan 2019 22:34:15 -0800 (PST)
Received: from localhost (97-120-245-104.ptld.qwest.net. [97.120.245.104])
 by smtp.gmail.com with ESMTPSA id g11sm92574498pfo.139.2019.01.06.22.34.14
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 06 Jan 2019 22:34:14 -0800 (PST)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-Google-Original-From: Paul Walmsley <paulw@sifive.com>
Date: Sun, 6 Jan 2019 22:34:13 -0800 (PST)
To: G SatishKumar <gsatish.ldd@gmail.com>
Subject: Re: [PATCH] RISCV:IRQ: Adds Err column to /proc/interrupts
In-Reply-To: <1546696272-19152-1-git-send-email-gsatish.ldd@gmail.com>
Message-ID: <alpine.DEB.2.21.9999.1901062233110.7801@viisi.sifive.com>
References: <1546696272-19152-1-git-send-email-gsatish.ldd@gmail.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-589538691-1546842853=:7801"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190106_223416_704140_1C58197B 
X-CRM114-Status: GOOD (  13.23  )
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
Cc: linux-riscv@lists.infradead.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-589538691-1546842853=:7801
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

Hello,

On Sat, 5 Jan 2019, G SatishKumar wrote:

> =09This patch adds extra row showing error count to output of
> =09/proc/interrupts using seq_printf().

Please don't indent your patch descriptions.

> =09seq_printf() API is used when printing to /proc/ files as a
> =09helper functions to return formatted output from =E2=80=98proc_read=E2=
=80=99
> =09callback.
>=20
> =09It adds Err: row to /proc/interrupts

Why?  It's always going to print "0" with this patch.  Does the missing=20
line break something?

>=20
> =09root@(none):~# cat /proc/interrupts
> =09           CPU0
> =09 8:        356  SiFive PLIC   8  virtio0
> =0910:       1717  SiFive PLIC  10  ttyS0
> =09IPI0:         0  Rescheduling interrupts
> =09IPI1:         0  Function call interrupts
> =09Err:          0
>=20
> Signed-off-by: G SatishKumar <gsatish.ldd@gmail.com>
> ---
>  arch/riscv/kernel/irq.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/arch/riscv/kernel/irq.c b/arch/riscv/kernel/irq.c
> index 1d76b60..509c96b 100644
> --- a/arch/riscv/kernel/irq.c
> +++ b/arch/riscv/kernel/irq.c
> @@ -24,9 +24,12 @@
>   */
>  #define INTERRUPT_CAUSE_FLAG=09(1UL << (__riscv_xlen - 1))
> =20
> +unsigned long irq_err_count;
> +
>  int arch_show_interrupts(struct seq_file *p, int prec)
>  {
>  =09show_ipi_stats(p, prec);
> +=09seq_printf(p, "%*s: %10lu\n", prec, "Err", irq_err_count);
>  =09return 0;
>  }
> =20
> --=20
> 2.7.4
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
>=20
--8323329-589538691-1546842853=:7801
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-589538691-1546842853=:7801--

