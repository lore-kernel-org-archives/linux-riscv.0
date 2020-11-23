Return-Path: <SRS0=TXXs=E5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F119C2D0E4
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2020 07:18:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 985182072C
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2020 07:18:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X2hVNBIi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Nhi41X2p"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 985182072C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TBweOK6wkrV22KQsUaRB3HvQZLj2C/RwrQjOJT7DXIY=; b=X2hVNBIiuB6qoUc0Oc7NdNtwA
	WdJMjYJSMgG516Zl5qaF1E1eAJKRFmepCudD6IhPw1gXxieyRHG4XMZ0DFRy83dFdt9tsluT5LKtD
	ZpzyUcad7OxGQ815KfI6+MiVn9HvQHSgNR0GO62B4gm8mYeSIy7/7TiyxG/VAAMZ1GUImrhKl0xd9
	1l15MLbW34qv9IjmExUPUhHKnfUdUyrymrso+7B2++MU6nihdjGKBcMbRtiPvmN1gJ85DYBQqz2Y2
	BdX9iMupUKL0feJUU+ajVvrapdzrzdx0WEyAByfj6/VCLImD2+hpYXXhQJJRk7RSQFJrIdF/iqtLs
	iNPYzJzlg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kh67L-00025s-UP; Mon, 23 Nov 2020 07:18:31 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kh67J-00025T-86
 for linux-riscv@lists.infradead.org; Mon, 23 Nov 2020 07:18:30 +0000
Received: by mail-ot1-x341.google.com with SMTP id z24so995505oto.6
 for <linux-riscv@lists.infradead.org>; Sun, 22 Nov 2020 23:18:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sfKjG2GvoDhQiB7EpkscGKZ+97rkBF/pnq0LhdxYBSQ=;
 b=Nhi41X2pbTeawhTkWHetJJ8SzZ7jdWhXuzFPECnPqfmjT2n5H0aJE/I9Fhz5WpkOTi
 U1f2uuCWR5MWR2ZUnRWcMSrmka1wwVzu4a6pwiYKsFabNZqQNgXJiJtVdQg6fBKG/ojv
 wQoiop9+kZRRADXjWOAF/gd5OO+gMdZdnWewS7O9jsEwzxEuyzSYSbmjWGXuCLu3smeQ
 aS/po47CbgOhCG5PUD2dzUI/mjZVLQVhLYtj9N8+Ga+eh9ixBzz4dcx2Roiqpt4QI0Al
 kmDFP01bTVN1xbUdqzWFwfsEyaL8LjqdkSyLMg1fWWx/9PneRe4zhP1jMIaBy3BPBPMv
 92TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sfKjG2GvoDhQiB7EpkscGKZ+97rkBF/pnq0LhdxYBSQ=;
 b=Hs4uFqSevUg0ugdkG4oAglkCY14Ahj5a4im4Ft/IIVqy276uoHtCikSLue3+eRqPZC
 wpFP5vA2PiIcNgHhPbRqbXK+H3TVrJF0VTySGCPPDNg8+C5/KRd59yeV0AFuUam8Zn0k
 ZwhYeo3CLEW+BfHxf4AX6ynkfxH7DadrY2uD/dSyRHWIqB+3wSrWYCDxBa2TbdKVUqTj
 gGWN1+i//AnOJYQ5Yo14WiTdAz2gf8UFxi/grGMraOxpl3CgLNWIZOxF9WNbemvrNBKV
 13uqzTtJM381EXqYCl5vOl5VOpvYm9ag7oS8s/x+YReK2bLmJFwnM+ehykQ0XucOSlKu
 bUPQ==
X-Gm-Message-State: AOAM531Q5per2dWZS66D2TS03SvxeF+sbH5KAVIKifE6jcVxBYz4uHrz
 CXaQZ7dmNaMSe8/zsh4GQhR+oy8W1aOqzGJB1VXWNQ==
X-Google-Smtp-Source: ABdhPJweIoXhEjpbvXwglI32aXPOWNF6IbolZiWACHGNa+GuXDBW2FXTa0dak0WYveQO8IuYFPBrvHcq4162/Q4SUIA=
X-Received: by 2002:a9d:6f8f:: with SMTP id h15mr22428460otq.166.1606115907677; 
 Sun, 22 Nov 2020 23:18:27 -0800 (PST)
MIME-Version: 1.0
References: <20201111100608.108842-5-zong.li@sifive.com>
 <mhng-738e4a27-9751-4937-b3ed-efdcdce56f0c@palmerdabbelt-glaptop1>
In-Reply-To: <mhng-738e4a27-9751-4937-b3ed-efdcdce56f0c@palmerdabbelt-glaptop1>
From: Zong Li <zong.li@sifive.com>
Date: Mon, 23 Nov 2020 15:18:17 +0800
Message-ID: <CANXhq0rQtgVNoDJ7DLFcBRwru1H5+4_0LoANCVcGMaB2LmCOMA@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] clk: sifive: Fix the wrong bit field shift
To: Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201123_021829_368672_84D13A70 
X-CRM114-Status: GOOD (  18.23  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Pragnesh Patel <pragnesh.patel@openfive.com>, Yash Shah <yash.shah@sifive.com>,
 Andreas Schwab <schwab@linux-m68k.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, linux-clk@vger.kernel.org,
 Pragnesh Patel <pragnesh.patel@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Nov 21, 2020 at 9:29 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Wed, 11 Nov 2020 02:06:08 PST (-0800), zong.li@sifive.com wrote:
> > The clk enable bit should be 31 instead of 24.
> >
> > Signed-off-by: Zong Li <zong.li@sifive.com>
> > Reported-by: Pragnesh Patel <pragnesh.patel@sifive.com>
> > ---
> >  drivers/clk/sifive/sifive-prci.h | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/clk/sifive/sifive-prci.h b/drivers/clk/sifive/sifive-prci.h
> > index 802fc8fb9c09..da7be9103d4d 100644
> > --- a/drivers/clk/sifive/sifive-prci.h
> > +++ b/drivers/clk/sifive/sifive-prci.h
> > @@ -59,7 +59,7 @@
> >
> >  /* DDRPLLCFG1 */
> >  #define PRCI_DDRPLLCFG1_OFFSET               0x10
> > -#define PRCI_DDRPLLCFG1_CKE_SHIFT    24
> > +#define PRCI_DDRPLLCFG1_CKE_SHIFT    31
> >  #define PRCI_DDRPLLCFG1_CKE_MASK     (0x1 << PRCI_DDRPLLCFG1_CKE_SHIFT)
> >
> >  /* GEMGXLPLLCFG0 */
> > @@ -81,7 +81,7 @@
> >
> >  /* GEMGXLPLLCFG1 */
> >  #define PRCI_GEMGXLPLLCFG1_OFFSET    0x20
> > -#define RCI_GEMGXLPLLCFG1_CKE_SHIFT  24
> > +#define RCI_GEMGXLPLLCFG1_CKE_SHIFT  31
> >  #define PRCI_GEMGXLPLLCFG1_CKE_MASK  (0x1 << PRCI_GEMGXLPLLCFG1_CKE_SHIFT)
> >
> >  /* CORECLKSEL */
>
> Section 7.3 of v1.0 of the FU540 manual says that bit 24 contains the PLL clock
> enable for both of these.  I don't know if that's accurate, but if it is then I
> believe this would break the FU540.  Don't have one to test on, though.

Yes, the manual seems to be wrong and should be corrected. It doesn't
break the FU540 yet because we don't use these fields in s-mode Linux
driver, we set them in m-mode FSBL/U-boot-SPL bootloader during boot
time, and the implementation of FSBL and U-boot-SPL both are correct.
The following link is the U-boot SPL source:

https://github.com/u-boot/u-boot/blob/da09b99ea572cec9a114872e480b798db11f9c6e/drivers/clk/sifive/fu540-prci.c#L128

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
