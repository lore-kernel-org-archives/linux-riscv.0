Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02960C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Dec 2022 13:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+pQ5Kdv4CKx2kJrj8OVjdmYfxqg62uIbKB0CyGuaH6k=; b=hbf2MOzVbMwwlm
	1ovvIfE0UvVzfxyZFw/XEoBUL0PEDmY7Pw/GZPWgNFY56RNa3FKmAgpkJEVO8n2iiu2jacocCLM5h
	5LQ2md+N0i8neBJw34wnWbbcCjXlOZLjSOnLhGV4jfzCWr4sJgkyxROiGyKnBji2GTudxWRBXsn39
	bFmGsrRpFsKmdddr/0UwtPumwitRQohL3+Z4UFWROpGIZkhfSjfSKTC7fQSfwAp7u5PtsvaCfMZmT
	xensejQ3fOp7+zoFe53QK29zYs1soEAA5LJ4HDUHtxlpFJ95nUe0O4zH0uTAm4mIMLccgotATKPtq
	2+w/ut8BmQH0PIW6vigw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8Lcc-00COjJ-JY; Thu, 22 Dec 2022 13:28:30 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8Kbj-00Bobx-AS
	for linux-riscv@lists.infradead.org; Thu, 22 Dec 2022 12:23:33 +0000
Received: by mail-pl1-x631.google.com with SMTP id d3so1844880plr.10
        for <linux-riscv@lists.infradead.org>; Thu, 22 Dec 2022 04:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CdDJgwcsu5IyO/nuycFje+XP9l7MwqwDfx8pJnx7g2s=;
        b=TbbkdmEquZ8ax5xCrAzKcVDlsBIaTTf22DVcmgmUFw8mZd7+B/9Cz1EMXOraEfYMqf
         4B9oSbeoPU9eAEQytGfErllWh4mntzrLqCYI5PyMEfiNqoPSevXWpC3zTJZZjKUOgm1r
         XB3JI6MkHl0Orysi3+Q631izlGY4bFSMlO+YzEjxd4LJw9CtGDrGL7QprDwbSMF4OiCS
         G1JyotmRXYDscPd25UAJY/6kiSQU2Hz5BYpoCwoXNlKDSjtJ+XFwOC38g9PcINnpPLZi
         JemXbGaXgt+fhScPxbd7cTaOkf0FKu+nHxpaVhwob1sFDyUYWG1ggZZHlUeKkrr7qIKl
         070Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CdDJgwcsu5IyO/nuycFje+XP9l7MwqwDfx8pJnx7g2s=;
        b=Lboksqoreoi851hDV1k2W7b+hIaeQVipWHnsP9iwXOuQyPrWN3TEoMUazzBde94gVe
         87IM13/Lvu+vUOyQ9pClViUonmnjy0H9gIECXi9yBhCGcnHo+zafPV3pCGV8OKN6iJhC
         QcW7vm4gGCxOI6LdjqGaEzKUb+0vPzMqhe8bsCFULkqW37mtD2t7Vh2N2338FcqVBvda
         u6Gl0UiCi4tdNJTXnAZ37ZmLbnFWLHbDtbCm4mYvAhC0KT9tPO+gxzbkTrqiB8kth8U8
         3FgTD+vE3ByJY7JyjKrcAk48Cv+wCBOVUOJ81n5TVjC4dScwhEZVAcIHmmTqaLofC4lB
         LD+Q==
X-Gm-Message-State: AFqh2krdxadyTbNhJOwyhBHGbG6raimOTlNevMo7GqmIbg/+IuMDY7d1
	82GEwYRVpL7mincp4DdsSP8=
X-Google-Smtp-Source: AMrXdXvUgAJCEXRg2JsQw1FsDW8qth/OvPTUYapUPOTmEwnfbwOlkUP+po2PO2z/JQh09iPbbBMTlg==
X-Received: by 2002:a17:90a:9606:b0:219:f7e5:cb56 with SMTP id v6-20020a17090a960600b00219f7e5cb56mr6329664pjo.20.1671711808368;
        Thu, 22 Dec 2022 04:23:28 -0800 (PST)
Received: from mail.google.com ([103.135.102.144])
        by smtp.gmail.com with ESMTPSA id f10-20020a63510a000000b004351358f056sm636149pgb.85.2022.12.22.04.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Dec 2022 04:23:27 -0800 (PST)
Date: Thu, 22 Dec 2022 20:23:26 +0800
From: Changbin Du <changbin.du@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Changbin Du <changbin.du@gmail.com>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>, palmer@dabbelt.com,
	paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
	mhiramat@kernel.org, changbin.du@intel.com, zong.li@sifive.com,
	rostedt@goodmis.org, boqun.feng@gmail.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2] riscv: patch: Fixup lockdep warning in stop_machine
Message-ID: <20221222122326.4ephcsa76lmrsfxw@mail.google.com>
References: <20221120101049.2078117-1-guoren@kernel.org>
 <Y3tPEDvM3aVJmVxF@wendy>
 <CAJF2gTS0FDgV3toa9wZxPhK2G+f4vCtrru7q3R4FXnMkxYmu-w@mail.gmail.com>
 <20221222001902.zcbwlvqaitvsfb33@mail.google.com>
 <5CA9DB64-CE90-490A-835B-0FC4550E5D9A@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5CA9DB64-CE90-490A-835B-0FC4550E5D9A@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_042331_445683_72B64D84 
X-CRM114-Status: GOOD (  21.70  )
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

On Thu, Dec 22, 2022 at 12:29:56AM +0000, Conor Dooley wrote:
> 
> 
> On 22 December 2022 00:19:02 GMT, Changbin Du <changbin.du@gmail.com> wrote:
> >Hello,
> >Does this patch get merged into riscv tree now? This problem has been there for a long
> >time. (I suppose you have received my previous reponse.)
> 
> As far as I can tell, this patch is still missing a sign-off from you.
> There's nothing in response to this thread that I can see which provides one.
> 
Just replied the patch and added my SoB. Thanks!

> >
> >On Mon, Nov 21, 2022 at 07:09:45PM +0800, Guo Ren wrote:
> >> On Mon, Nov 21, 2022 at 6:13 PM Conor Dooley <conor.dooley@microchip.com> wrote:
> >> >
> >> > On Sun, Nov 20, 2022 at 05:10:49AM -0500, guoren@kernel.org wrote:
> >> > > From: Changbin Du <changbin.du@gmail.com>
> >> >
> >> > > Fixes: 0ff7c3b33127 ("riscv: Use text_mutex instead of patch_lock")
> >> > > Cc: Changbin Du <changbin.du@gmail.com>
> >> > > Co-developed-by: Guo Ren <guoren@kernel.org>
> >> > > Signed-off-by: Guo Ren <guoren@kernel.org>
> >> > > Cc: Zong Li <zong.li@sifive.com>
> >> > > Cc: Palmer Dabbelt <palmer@dabbelt.com>
> >> > > ---
> >> >
> >> > Hey Guo Ren,
> >> >
> >> > FYI you're missing a SoB from Chanbin on this patch. They gave one in
> >> > their v1 though so you should be able to re-use that?
> >> I'm waiting for his SoB. I don't think I could directly use his SoB in
> >> v1. I need him to confirm my rewritten commit log for lockdep
> >> analysis.
> >> 
> >> >
> >> > Thanks,
> >> > Conor.
> >> >
> >> > > Changes in v2:
> >> > >  - Rewrite commit log with lockdep explanation [Guo Ren]
> >> > >  - Rebase on v6.1 [Guo Ren]
> >> > >
> >> > > v1:
> >> > > https://lore.kernel.org/linux-riscv/20210417023532.354714-1-changbin.du@gmail.com/
> >> >
> >> 
> >> 
> >> -- 
> >> Best Regards
> >>  Guo Ren
> >

-- 
Cheers,
Changbin Du

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
