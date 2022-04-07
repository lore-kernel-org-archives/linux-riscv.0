Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC58C433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Apr 2022 06:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g1ZMoEaE3n/tPY6QS8OVMemOMpfgnA95JePxZBzwW7w=; b=DxNK8s3xd1v0N8
	BGvtZRoxfJTXd+tmNdOhEeJ0iNWgsT1N8YaaA97JEFxQOWjMjm1W2EnVSEkYUPmszxyaUA5BvQpoi
	KJEW9nbOTICTWzjemJNF+Vt+v4hgoEXdLtHotl1P85Kh1hxpfFX1vt9UKfc+2NcM423jJVPNTIca3
	PFt8k33pjBb+0hS/S/fQrvMstHaIUvxGb8vanxxzF87f+txX5Il8TIYEUQBxXvuNhEVGIURgfGdrn
	2KvfF4MKQbtf6aTtyEqC1aAmJdG9VhP17Dhh9bOQihxs0y5lEgbvb3KlZnsJYQLoYsImjTRl4vq8/
	10L5YP95i7llDJ43IfEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncLi3-009hFT-Be; Thu, 07 Apr 2022 06:33:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncLhz-009hDw-Jw
 for linux-riscv@lists.infradead.org; Thu, 07 Apr 2022 06:33:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7D60661D50
 for <linux-riscv@lists.infradead.org>; Thu,  7 Apr 2022 06:33:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57A54C385AB
 for <linux-riscv@lists.infradead.org>; Thu,  7 Apr 2022 06:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649313209;
 bh=sDANlglzy7xVa8qGoxcrgCLEkRlQHE1kd8mStA7Kz0c=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Q0EHT5pnwshFeUDmtz85bKrE/NAtBkY1SyxftEQ+3zRMyhbEqMn331qKHMfCHknO2
 /eKy55yCqS3/cnwKSYncJEYLWeMoXNzHjJieYuNYosu3o/3AE5wwf4/dGIlqvIH92E
 TCQ1lch8dSL5pr3JDvT11dqPE3HME8uWGkNmn678PJNs04mbQLEgmrchE1ldjvAH6b
 LpMiv8l+x+FiIxY/VlyANEPnLmmcXht4AYdrUwVBQTaPcmxphV4y48hJRAgffJeSGH
 CJJGAEHjPDfPvvedIGboghdIltzlyaMVa1k9OPT6wE/CoPvQM2NxK5Dyt3GEUPGww0
 OwHjJtonlDkLA==
Received: by mail-vk1-f182.google.com with SMTP id q10so578843vkh.0
 for <linux-riscv@lists.infradead.org>; Wed, 06 Apr 2022 23:33:29 -0700 (PDT)
X-Gm-Message-State: AOAM5326dJ3/yswtWR93apZovgUw+kRD4SChUTJQunUeye907BKvjNw9
 Srmi14hUppUP13tC3Wm7INTZS+jb4280UN29IVc=
X-Google-Smtp-Source: ABdhPJzMCqMoT2Gd6QJ5rs+cItH1+UtCvIzkKAHZRFSnh1VzJk3cciLCRxgzeP2vyn9dXGYHTrgGhuFB+wbWj19KRm8=
X-Received: by 2002:a1f:bd96:0:b0:33f:6185:f723 with SMTP id
 n144-20020a1fbd96000000b0033f6185f723mr4303359vkf.28.1649313208175; Wed, 06
 Apr 2022 23:33:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220406141649.728971-1-guoren@kernel.org>
 <Yk3YUFfvEszb+cXT@kroah.com>
In-Reply-To: <Yk3YUFfvEszb+cXT@kroah.com>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 7 Apr 2022 14:33:17 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQH-cnTx_x3xO=UZRTrhewb0damO_cqtPxhxoZe6bxr8g@mail.gmail.com>
Message-ID: <CAJF2gTQH-cnTx_x3xO=UZRTrhewb0damO_cqtPxhxoZe6bxr8g@mail.gmail.com>
Subject: Re: [PATCH V3] riscv: patch_text: Fixup last cpu should be master
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
 linux-arch <linux-arch@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Guo Ren <guoren@linux.alibaba.com>, 
 Palmer Dabbelt <palmer@rivosinc.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_233331_731088_6D8B8922 
X-CRM114-Status: GOOD (  19.56  )
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

On Thu, Apr 7, 2022 at 2:13 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Wed, Apr 06, 2022 at 10:16:49PM +0800, guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > These patch_text implementations are using stop_machine_cpuslocked
> > infrastructure with atomic cpu_count. The original idea: When the
> > master CPU patch_text, the others should wait for it. But current
> > implementation is using the first CPU as master, which couldn't
> > guarantee the remaining CPUs are waiting. This patch changes the
> > last CPU as the master to solve the potential risk.
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Signed-off-by: Guo Ren <guoren@kernel.org>
> > Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> > Reviewed-by: Masami Hiramatsu <mhiramat@kernel.org>
> > Cc: <stable@vger.kernel.org>
> > ---
> >  arch/riscv/kernel/patch.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> What commit id does this change fix?
Thx for pointing this out, I would follow the rule to add Cc:
<stable@vger.kernel.org>.

>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
