Return-Path: <SRS0=VC1f=KB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F2EAC433ED
	for <linux-riscv@archiver.kernel.org>; Thu,  6 May 2021 16:26:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F079610D2
	for <linux-riscv@archiver.kernel.org>; Thu,  6 May 2021 16:26:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F079610D2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Dmbc3cFttvEJUtxTYooaPb3L8KVE33Db1WwJvvXHP1A=; b=LDc1de0P5glUCMfjcMjmDlxY2
	ei3lIbKWuSAX6gnHviyhhjnOpwKfbIw0LZEomUnt0pd1x5GsXbjXpAunZqrMEc7mfsJkhk/DnfPmY
	OqF1ofjws7hsN+NAHxtmuTaO5LvYQxA4rcRLUCOwt010Xn+dCuCk1OtR9u8YidCqYANdLfCAY80Ep
	Iy+7/Yb8ZpAq/4ugyxKgQi7k14t1Q3P0q17rKD5TiV5FTWm7r/8EPxwl82Zn68nsYEdcTUfncX5c4
	jv9814MFCVwMDmYS2iFCawEl2T1EswJhyKZfNEqKtOM47+rMo4THTX1SfUaKZmhksiNlleiAJd9P+
	GjEFqnznw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1legpf-004nbn-Qt; Thu, 06 May 2021 16:26:35 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1legpa-004nZk-6X
 for linux-riscv@desiato.infradead.org; Thu, 06 May 2021 16:26:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=FHrtdCMpJ6hTGURWAOvHXQBYIp09wPfHcz/BgTusvDM=; b=jYX1LF/nwcorZL0bhfPXNL3p59
 8gAS97LPW88ieOLqz6fLvHBnos89/4XYPQkuPcZxP5EPIHSx4gQ0//UHW15HgowqvP7WHGvpnB6EA
 OPbRaVuFQugk2PLC3YkvRVrd/noD3MOCiKGFfbi+R79AcZMWLU0Y8mh3SiPRKFC0o/DvFRIVQt2a7
 sBOohZw6InU0LLYdLhjodC01o6ruQAWq4XUpEJWV6gC21c4Wd57FPqQJH2++AViO3ckbYFsQvSVW+
 /P28h+gQ2hxN8vgxyBeYYM4lj3gtGe4M5k3plxUAxexv/79P8RtuL90Zd0mc8jhTzQrpwclZjGBP5
 yhVOH0RA==;
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1legpX-006DKn-OR
 for linux-riscv@lists.infradead.org; Thu, 06 May 2021 16:26:28 +0000
Received: by mail-lf1-x130.google.com with SMTP id z13so8673388lft.1
 for <linux-riscv@lists.infradead.org>; Thu, 06 May 2021 09:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FHrtdCMpJ6hTGURWAOvHXQBYIp09wPfHcz/BgTusvDM=;
 b=YcHASyyGjOsvRsAICnwedOYDgqo99c6xqPpr7ONmgJval9FdT1JKTMNjr+ttBlmuX5
 O9G6kxkAdR03YCgYcwQfwppEYuuJ2zUXhOLQFk3IDcuZwcBMwysip7HIWJb7otnMk6Xs
 JntofGvputZEgbhuUDJJvJkIU+sNp9zRECOqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FHrtdCMpJ6hTGURWAOvHXQBYIp09wPfHcz/BgTusvDM=;
 b=U8X52seQthbD/ZqO4puEhTPsxXS4n4B8yzjD+vZgka6II+GiF2wrBLYqX1j+kV7LX8
 xGn0D3AZjf17CLuvmJcFy+/uBmttYpKAIvnXWn9yxu4rXUPIrggSyRh/3TGrHZ5Jqy5r
 MyMeC0Ph03QTgCeOVIOtG+izTmN1gfGtPJtfqugdAKbp39FqhMufOsPS8PJglZgmL3h/
 5TUIjPTorFVS5p3RTxiRCtxWxmhuKmgRzMCdGlVcpzuy3tjUtlEqw2a/KwM6a8dWdbD5
 pmT3OwTnCNr/h6P9utDe82yR83EwApNrLnQ1a6FddqCeWgaOc36VVnXxpuGo8tYHTXNt
 ujVg==
X-Gm-Message-State: AOAM531Xnthx6wP2XpSpJBsh+uSPeDn6Y93DvGx26tH5b4MPAPLmyXL2
 RsfrPUqPMr7lWV2oTWay/Bkxmyy0TJhVkxS+/pg=
X-Google-Smtp-Source: ABdhPJyyC/fgDVTEIdeF148SviTJf6cr2gBy8Lr9A8LheVT6vBEaJebq9XnuzLKJoqnWsvy7s5O+lQ==
X-Received: by 2002:ac2:558f:: with SMTP id v15mr3541577lfg.565.1620318384181; 
 Thu, 06 May 2021 09:26:24 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com.
 [209.85.167.53])
 by smtp.gmail.com with ESMTPSA id p36sm774316lfa.227.2021.05.06.09.26.23
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 May 2021 09:26:24 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id i9so2077729lfe.13
 for <linux-riscv@lists.infradead.org>; Thu, 06 May 2021 09:26:23 -0700 (PDT)
X-Received: by 2002:a19:7504:: with SMTP id y4mr3443217lfe.41.1620318383001;
 Thu, 06 May 2021 09:26:23 -0700 (PDT)
MIME-Version: 1.0
References: <mhng-723be372-8df5-44b9-9e4f-def2eb929f8e@palmerdabbelt-glaptop>
In-Reply-To: <mhng-723be372-8df5-44b9-9e4f-def2eb929f8e@palmerdabbelt-glaptop>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 6 May 2021 09:26:06 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjXY78yyGE4VEqiUix9NU0tZTBDO=DqEeSyJgBwVZ+Q=g@mail.gmail.com>
Message-ID: <CAHk-=wjXY78yyGE4VEqiUix9NU0tZTBDO=DqEeSyJgBwVZ+Q=g@mail.gmail.com>
Subject: Re: [GIT PULL] RISC-V Patches for the 5.13 Merge Window, Part 1
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210506_092627_817820_F9B87E3E 
X-CRM114-Status: GOOD (  10.44  )
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

On Wed, May 5, 2021 at 10:51 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> Here are my conflict resolutions, if that helps:

I think you've unnecessarily done that "+1" twice:

>  +      /* + 1 as memblock_alloc() might increase memblock.reserved.cnt */
>  +      num_resources = memblock.memory.cnt + memblock.reserved.cnt + 1;
>  +      res_idx = num_resources - 1;
>
> -       mem_res_sz = num_resources * sizeof(*mem_res);
> +       /* + 1 as memblock_alloc() might increase memblock.reserved.cnt */
> +       mem_res_sz = (memblock.memory.cnt + memblock.reserved.cnt + 1) * sizeof(*mem_res);
>         mem_res = memblock_alloc(mem_res_sz, SMP_CACHE_BYTES);
>         if (!mem_res)
>                 panic("%s: Failed to allocate %zu bytes\n", __func__, mem_res_sz);

and I kept that as just the first one.

               Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
