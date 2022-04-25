Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3E2DC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Apr 2022 13:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R3+SFi4w24juA+Qf9el0XdEzfhfto03PM2eXSClqZEY=; b=C0DcRISERi362G
	k8nUgGVmMnPJFvF0E58uytBd90Mn5nh/zjVKdrNVTk83TmUYQg2usLu/XLv0s/dhGAz3zB1zxZt92
	2ktlgelix8SjACjJ4gldXTc9ZQk2kgO3SrAg6037P0CAjnFVvhRkyZJx2SvHF4a0HMXq6MJHo2xxE
	U8Po6BDANXeIPd2UnIeKbj29rQaf87oXd2+NqF/s98QUHQyxTTptoNXbp1Ab5EZy/qgHZpKDfuWvF
	bZGGL0mpg6IKMZ1atAmOEYqaSvuLdkrYCLvCow4IvFaheXxAhgACL65gGqZpgYMRL6gl1bvnD+ETu
	IiIc1n5x4y6cIxESjtYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1niyuI-009hqD-LF; Mon, 25 Apr 2022 13:37:38 +0000
Received: from mail-qk1-f175.google.com ([209.85.222.175])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niyt6-009hIy-1r
 for linux-riscv@lists.infradead.org; Mon, 25 Apr 2022 13:36:29 +0000
Received: by mail-qk1-f175.google.com with SMTP id q75so10734003qke.6
 for <linux-riscv@lists.infradead.org>; Mon, 25 Apr 2022 06:36:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PzcuAypNSBrA4FzOmCGUdXDr2QqOvBWfChPUdUSxH4Y=;
 b=rZsZozzVHBLkBuw1PFWK8eR02/frYE5YCYkLIYL/Em7XNq+1vyq5cHMNg7FEjbNfH4
 oAO1capFlD/DbsVUxZ0EEsCgs3Qhl7GbQxP2mHb0fMf17t1ex+/OWjzoQqeTcxJq7i4J
 kofX0jeOrLEPXy9/QFHuPb1+jzjnyFE6prhkQIViqFFTDTrRVI+pE6PMyisF93ZGJfJ6
 /jSLZHAwtG+b3WqmaHzbohsFrxZXN2uBY5AW7RM8qOj4i6bGYZTmCEx7nlkRLcEIcQoD
 jmYBXQ8ek1HyhgNawtB28L4Tthv/JnDFtcU+pncIzjEOtBBsowrN7J3XVomgIxJ7IdZn
 yErg==
X-Gm-Message-State: AOAM531NeQC2bWvqNLvItPIsvA/kjyLH2HA6L1QkQ5+BYVDS/JZoyieA
 VAXj4JEo6tJC1KuU+XERnr+d6VTFE73p5Q==
X-Google-Smtp-Source: ABdhPJyLlDyAmy1wEIh/MoxordMbuVUNd7AqeIODQlH18yo5w59XSlYOUOgwamSG+Gx+Pe5/0rOIHw==
X-Received: by 2002:a05:620a:4142:b0:69e:89a1:1521 with SMTP id
 k2-20020a05620a414200b0069e89a11521mr9927934qko.158.1650893778290; 
 Mon, 25 Apr 2022 06:36:18 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com.
 [209.85.128.178]) by smtp.gmail.com with ESMTPSA id
 a7-20020a05622a064700b002e238d6db02sm6548452qtb.54.2022.04.25.06.36.17
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 06:36:17 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-2f7ca2ce255so48919567b3.7
 for <linux-riscv@lists.infradead.org>; Mon, 25 Apr 2022 06:36:17 -0700 (PDT)
X-Received: by 2002:a81:8489:0:b0:2f7:edff:239f with SMTP id
 u131-20020a818489000000b002f7edff239fmr4168152ywf.256.1650893777557; Mon, 25
 Apr 2022 06:36:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220422211055.9278-1-palmer@rivosinc.com>
 <CAMuHMdV7d4XfStMiSmU3eZBb3mdHdsvqJZff358Rf3Cb-Kzx+Q@mail.gmail.com>
 <CAK9=C2WTY8+-98XuxRYTaRe4aVJufaB5wr35KRoTKEttUM7JzQ@mail.gmail.com>
In-Reply-To: <CAK9=C2WTY8+-98XuxRYTaRe4aVJufaB5wr35KRoTKEttUM7JzQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 25 Apr 2022 15:36:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV4aZ1U2CGjSOSvFsq-rHKq34wyS-TMvR=7kX68YQHFjQ@mail.gmail.com>
Message-ID: <CAMuHMdV4aZ1U2CGjSOSvFsq-rHKq34wyS-TMvR=7kX68YQHFjQ@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Allow the used to downgrade to sv48 when HW
 supports sv57
To: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>,
 Alexandre Ghiti <alexandre.ghiti@canonical.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_063627_828668_F7808D3E 
X-CRM114-Status: GOOD (  31.25  )
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

Hi Anup,

On Mon, Apr 25, 2022 at 3:14 PM Anup Patel <apatel@ventanamicro.com> wrote:
> On Mon, Apr 25, 2022 at 6:12 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Fri, Apr 22, 2022 at 11:42 PM Palmer Dabbelt <palmer@rivosinc.com> wrote:
> > > Similar to the previous patch, this allows a dt-selected downgrade to
> > > sv48 on systems that support sv57 in case users don't need the extra VA
> > > bits and want to save memory or improve performance.
> > >
> > > Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> > > ---
> > > This is on top of the patches from Alex's set that I dropped.
> >
> > You mean "[PATCH v3 13/13] riscv: Allow user to downgrade to sv39
> > when hw supports sv48 if !KASAN"?
> > 20211206104657.433304-14-alexandre.ghiti@canonical.com
> >
> > For both: "DT describes hardware, not software policy"?
>
> It is possible that HW is designed to support both Sv48 and Sv39 but
> there is some errata due to which Sv48 does not work correctly ?

In that case, I assume the software has to disable Sv48 on its own?
Fixed hardware should use a different compatible value, so software
will know when the issue is fixed, and the feature can be used.
How else is DTB backwards-compatibility supposed to work?

> We should allow users to downgrade the MMU mode, due to
> their own reasons. In fact, users can also disable an extension
> by not showing it in the DT ISA string.

That sounds like a software policy, too.
What is wrong with a kernel command line option?
If you want it in your DTB, you can add it to chosen/bootargs.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
