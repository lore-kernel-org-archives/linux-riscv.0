Return-Path: <SRS0=kxho=ND=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5C49C46475
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 23 Oct 2018 14:31:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A31C920651
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 23 Oct 2018 14:31:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lUZVj5Hv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="nyJ4vHS1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A31C920651
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZJVWEHVfytBkMmolz3oIdhjN6UY1XfhPh40g1KhaS+8=; b=lUZVj5HvmD7YwZ
	ddKk3mxe5b4Q7nX5z2lyYSFTIpkALPfzuJz6+lZNOy+iqzxmHC3KGZBSJdZcNjUBWUqTxK4BjM3Sr
	xjQLZbSHs+Kzm2Dqn8eZRPV49zFQH/9gN+HBMEtTVVDzfjlnrQetGjcoK0btbkrKlpA4x9K+SGdCn
	QV1MYnnOqEWJVCZhl90IYPMRAwn/PYabxWHuuzE6fSH0YWq3xe5uVhfOviPXXP23LgDYj36x5ytSC
	EhOPuLFqaQhEhbkeP4A6BoQIhSgiC/XqwmlkrumGlmMhrnOdLEycQfTSuXSwpmCZ47Znkh9GKAdy8
	J0n0D6RWcxu2J0DXkLgA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gExi4-0006YA-ID; Tue, 23 Oct 2018 14:31:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gExhz-0006NS-Le
 for linux-riscv@lists.infradead.org; Tue, 23 Oct 2018 14:31:01 +0000
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 801E820651
 for <linux-riscv@lists.infradead.org>; Tue, 23 Oct 2018 14:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1540305048;
 bh=6xM7crWbxD95UwlDwb7/RoC0rAz+CQAX/M7qwA8yr0o=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=nyJ4vHS1JiOoxLM7yURdbebRpz4JE6ABHKTO/cCf8xkk4XHo1iGg0NwZevkWURTb0
 +UZa0+houUYOE0i2pgVAKhCqdhuB2nkOYMWDLVco/4j8p4YCC4h8y4n5o9XUn2Zqg/
 y7tOg96x5JwIixHrd0J2d/oidrnEt3q6/sUc/p6E=
Received: by mail-qt1-f173.google.com with SMTP id z9-v6so1677941qto.7
 for <linux-riscv@lists.infradead.org>; Tue, 23 Oct 2018 07:30:48 -0700 (PDT)
X-Gm-Message-State: ABuFfoh3ZU32HQFJKeT+2G6V1E21gb4m/hArk5hBAfwo8+t//LIwsPOk
 NZK9K7ya5YCCGA6RF/PtX8tnqvT2PLw1A9pobQ==
X-Google-Smtp-Source: ACcGV63jeCJDhIZNqn0I0FgsM6E84jjdrLHFwigRvrZenWI/ANsBR4fhiJMAd58RZ3JVG0zm8u/8aZtWOqcPWgm9zxw=
X-Received: by 2002:ac8:2d33:: with SMTP id
 n48-v6mr46236217qta.38.1540305047647; 
 Tue, 23 Oct 2018 07:30:47 -0700 (PDT)
MIME-Version: 1.0
References: <20181022224213.GA25145@bogus>
 <mhng-08dbc241-46e4-411b-ba13-32435abde7ad@palmer-si-x1c4>
In-Reply-To: <mhng-08dbc241-46e4-411b-ba13-32435abde7ad@palmer-si-x1c4>
From: Rob Herring <robh@kernel.org>
Date: Tue, 23 Oct 2018 09:30:35 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKA6_saB7Ak=BZqSth6KAZ1g2srF5BsOQRGdE2+rmcR8w@mail.gmail.com>
Message-ID:
 <CAL_JsqKA6_saB7Ak=BZqSth6KAZ1g2srF5BsOQRGdE2+rmcR8w@mail.gmail.com>
Subject: Re: [PATCH v2] OF: Handle CMDLINE when /chosen node is not present
To: Palmer Dabbelt <palmer@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181023_073059_767048_6F3BDD34 
X-CRM114-Status: GOOD (  18.83  )
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
Cc: Nick Kossifidis <mick@ics.forth.gr>, Linux-MIPS <linux-mips@linux-mips.org>,
 linux-riscv@lists.infradead.org, Frank Rowand <frowand.list@gmail.com>,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181023143035.vvrd-TjEm9AoHrcsfC_eBByYYGMmMTsiKS56zi71BsM@z>

On Mon, Oct 22, 2018 at 5:55 PM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Mon, 22 Oct 2018 15:42:13 PDT (-0700), robh@kernel.org wrote:
> > On Mon, Oct 15, 2018 at 05:20:10PM +0300, Nick Kossifidis wrote:
> >> The /chosen node is optional so we should handle CMDLINE regardless
> >> the presence of /chosen/bootargs. Move handling of CMDLINE in
> >> early_init_dt_scan() instead.
> >
> > I looked at this a while back. I'm not sure this behavior can be changed
> > without breaking some MIPS platforms that could be relying on the
> > current behavior. But trying to make sense of the MIPS code is a
> > challenge and they have some other issues in this area.
> >
> > Can't this be fixed by making /chosen manditory? I'd expect ultimately
> > you are always going to need it.
> >
> > I'd rather not resort to making this per arch. There's also some effort
> > to consolidate cmd line handling[1].
>
> I'd rather make /chosen mandatory on RISC-V than to have per-arch handling, as
> like you've said there's already too much duplication.  That said, it does seem
> like a bug to me because the behavior seems somewhat arbitrary -- an empty
> /chosen node causing the built-in command-line argument handling to go off the
> rails just smells so buggy.

Yes. Probably need to do some archaeology on this code to figure out
some of the expectations.

> If that's the case, could we at least have something like
> "CONFIG_OF_CHOSEN_IS_MANDATORY" that provides a warning when there is no
> /chosen node and is set on architecture where the spec mandates /chosen?

I'd be okay to make it a warning unconditionally. At least then we can
find the cases that deviate and either fix them or understand their
expectations.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
