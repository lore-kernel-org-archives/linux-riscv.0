Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A56EAC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Dec 2022 02:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cyEWpV77rZNbIEC/fLTNdBCH3nDTXI4qxrxo3xDwQMk=; b=LspBOByOZ/o3Pq
	1V9R71kQh1YWKVMfKxC1EJAhlW25ILtz2uo5ALES4YONxWxKtbPUzaEPDiqdWdGYRssAIFP7DO8/C
	hIVJEVYclJGvAX456PknHaPKMfLXvkz6K0rVTlQMW3fzZnsznWcgd6XaiDmgD5qrUritMdwG4uI9h
	LQZocHiW9FGfPz9EV8scuH3/N7IaA+bOsZ/xvTneu/tBP5LB6AdV12kEqxqZaKaSRBXEefUepFLwQ
	2dBla1Ps3fGRtInh9GnBKhn7qsbfrIdn1iTEBy7iu300YrHpDC8qqINB3Rw9kpW5wS+A/WWT2mUOz
	zQVlg1aufcTYGsSxocTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8BYp-006FHY-5I; Thu, 22 Dec 2022 02:43:55 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8BYl-006FGB-4E
	for linux-riscv@lists.infradead.org; Thu, 22 Dec 2022 02:43:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id F2CB7B81CF9
	for <linux-riscv@lists.infradead.org>; Thu, 22 Dec 2022 02:43:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6A6AC433F0
	for <linux-riscv@lists.infradead.org>; Thu, 22 Dec 2022 02:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671677026;
	bh=yxnzZUA0xjvsbpIhYk19s4CAr9dBFI/3AXajE2I3niY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LtkYQT/VmmOhbI81qcF25cW6HBqEzOTUAIwGDmuG4/mFEVfbfwDRJk58eABtRgjKs
	 aAdRk3AZY0Eh1sNFx+sJ0Y9sNvh8k6XP6FYveoE57ycX0N8rLVYii17Zd649RmWQNZ
	 9AKya3fsttxQg30HivOL71rUQw29M2Jb57OkWFPZyP8Q1tbki4zR9m0QSdW8SVz0zG
	 6MG997lgiT758SCEjW4H+3wsunUGixfXOXXBZruUkaISkxRGbY56FGjIAfhSDA/3XX
	 Wi+eaGTyOwqJcbUn0HnKdO2K+sis2Sqj+ihkOcgMWs1eky1b2iecgdeUGDHOVZLFw2
	 faIvsn5n1sNUQ==
Received: by mail-ed1-f45.google.com with SMTP id a16so1120459edb.9
        for <linux-riscv@lists.infradead.org>; Wed, 21 Dec 2022 18:43:45 -0800 (PST)
X-Gm-Message-State: AFqh2krwJoV3KLjGkBygnrN9TYGfyC94saA8ErZPDPLCxqTu7tUtUO/M
	bzd6GHF3YK20CaOnfcExXYCHboXG0MiSJ2Wb9gQ=
X-Google-Smtp-Source: AMrXdXs6Nk5eiVeyzwxOygjsZZ8dYQcPxJ4ZE8LFyieWNnm14AVVOQQkloslgTt3QfLMJQWkVasAKO6bP04pZHMr1Gg=
X-Received: by 2002:a05:6402:d72:b0:475:de4a:3740 with SMTP id
 ec50-20020a0564020d7200b00475de4a3740mr368067edb.117.1671677023985; Wed, 21
 Dec 2022 18:43:43 -0800 (PST)
MIME-Version: 1.0
References: <20221120101049.2078117-1-guoren@kernel.org> <Y3tPEDvM3aVJmVxF@wendy>
 <CAJF2gTS0FDgV3toa9wZxPhK2G+f4vCtrru7q3R4FXnMkxYmu-w@mail.gmail.com> <20221222001902.zcbwlvqaitvsfb33@mail.google.com>
In-Reply-To: <20221222001902.zcbwlvqaitvsfb33@mail.google.com>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 22 Dec 2022 10:43:32 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSBLk9+V5hvXTNWWi9m7W7PxNNrMo_YgbZNia5oE=7X6Q@mail.gmail.com>
Message-ID: <CAJF2gTSBLk9+V5hvXTNWWi9m7W7PxNNrMo_YgbZNia5oE=7X6Q@mail.gmail.com>
Subject: Re: [PATCH V2] riscv: patch: Fixup lockdep warning in stop_machine
To: Changbin Du <changbin.du@gmail.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, aou@eecs.berkeley.edu, mhiramat@kernel.org, 
	changbin.du@intel.com, zong.li@sifive.com, rostedt@goodmis.org, 
	boqun.feng@gmail.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221221_184351_504630_C554241A 
X-CRM114-Status: GOOD (  21.91  )
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

On Thu, Dec 22, 2022 at 8:19 AM Changbin Du <changbin.du@gmail.com> wrote:
>
> Hello,
> Does this patch get merged into riscv tree now? This problem has been there for a long
> time. (I suppose you have received my previous reponse.)
You could take the patch and update it to v3 with your SoB :)

>
> On Mon, Nov 21, 2022 at 07:09:45PM +0800, Guo Ren wrote:
> > On Mon, Nov 21, 2022 at 6:13 PM Conor Dooley <conor.dooley@microchip.com> wrote:
> > >
> > > On Sun, Nov 20, 2022 at 05:10:49AM -0500, guoren@kernel.org wrote:
> > > > From: Changbin Du <changbin.du@gmail.com>
> > >
> > > > Fixes: 0ff7c3b33127 ("riscv: Use text_mutex instead of patch_lock")
> > > > Cc: Changbin Du <changbin.du@gmail.com>
> > > > Co-developed-by: Guo Ren <guoren@kernel.org>
> > > > Signed-off-by: Guo Ren <guoren@kernel.org>
> > > > Cc: Zong Li <zong.li@sifive.com>
> > > > Cc: Palmer Dabbelt <palmer@dabbelt.com>
> > > > ---
> > >
> > > Hey Guo Ren,
> > >
> > > FYI you're missing a SoB from Chanbin on this patch. They gave one in
> > > their v1 though so you should be able to re-use that?
> > I'm waiting for his SoB. I don't think I could directly use his SoB in
> > v1. I need him to confirm my rewritten commit log for lockdep
> > analysis.
> >
> > >
> > > Thanks,
> > > Conor.
> > >
> > > > Changes in v2:
> > > >  - Rewrite commit log with lockdep explanation [Guo Ren]
> > > >  - Rebase on v6.1 [Guo Ren]
> > > >
> > > > v1:
> > > > https://lore.kernel.org/linux-riscv/20210417023532.354714-1-changbin.du@gmail.com/
> > >
> >
> >
> > --
> > Best Regards
> >  Guo Ren
>
> --
> Cheers,
> Changbin Du



-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
