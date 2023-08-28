Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A69CC83F12
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Aug 2023 13:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DJWKTfPY+PhHzCQXIBkpv1upPrA4kzZ3s5OhqoafCvg=; b=PkWQobyyQcitT+
	UFoQ3HgQQpMco/kmWotSnh0K9fkofVpOjjknWCJbySL7jYED2rNVkB6V0hoMfj8kIF432r+mlDEwH
	udHsJReP7AjJtglYNHv9kmOePhHaUPr4nUaelq3gzzSbrNtLkN8V36b3IAfwNUOqZnQRzOoI1rVKK
	TdxIKhd/GAPU+Uq805qYzt/FFzh77KJoLwMFzwqdkP1tAzdsSrIBey7LmlD395VEFiVQ9kokuaHWZ
	hsFP7f831AndQIDGt5EMyRnSZx8xyIehtg8hq6kEugTNHIsKsjzIQ2PxzZ8GscEfU6VlOoE9Jwt7H
	TxdBr7exD9ks3WiUV1Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qacdD-009fLr-2J;
	Mon, 28 Aug 2023 13:50:15 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qacdB-009fLL-10
	for linux-riscv@lists.infradead.org;
	Mon, 28 Aug 2023 13:50:14 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-52a1ce52ef4so4104050a12.2
        for <linux-riscv@lists.infradead.org>; Mon, 28 Aug 2023 06:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693230608; x=1693835408;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eYLHQZ/VfLwLQyibj4IKPDu2aeAoL6UJSE7o4fV5D3k=;
        b=EWucoSA6NQNmv6r92bln9D7hVGM10sQdVq+0ZKodxwMnW2akgpj6isYLJwfpWBTrEY
         mLIuBD3gztqz/r8rkQoCx1e66ihra6fnIEWqjgmggwnDlc3KNhnqyBfWKZL0ly6T+M9q
         bGRGFzIACsDkitfXZY1zyj4s7vtM+QeXWBfYNDiDD1RlzVzcgIsvIwYNQz/ea+FX6/3E
         yo4oeub9+M39khJF7uq5T8SVx1BV0jTo8XEL92te3is5AyAoLlFacJQq0v5WRmNQcZR4
         97+ZDXp/7lS5GvpX/xttTUxPxIR4vgKxQPz+wXtC2bMyb5VhcDxs5LDDkU4kUMlHuxKT
         ztuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693230608; x=1693835408;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eYLHQZ/VfLwLQyibj4IKPDu2aeAoL6UJSE7o4fV5D3k=;
        b=FD8PP2yWoEeJy4AG4GSua/hnPpcGfoQiHgrmdhSFYBegqS+7JM0eW9LXk0Sg05pqly
         vApVYve1A9yspHnCRosF9yo9RzL7c2JxPIlSLyAwXOWC+o9cguOlbZxffu1Dk3+h/MOy
         ife5tdkLl2IkJBTgTGik3+xPaf5LR42fxEjN5EZOXhRFW8lO+P6aup+FGSV/0RQVsknL
         kcNqnNk+UHowxqW53Rr3ZS7fyNUWYVfekXw8Iximu707k7VbSsiR4Tf89iL6NGATwHUQ
         13UfflPGSdbtVcrxy8KOAf0DQnWmzDsUexsyvxjaN2db+nP2S+UMB5Qn3rgikp4KiaCH
         blHA==
X-Gm-Message-State: AOJu0YwwmrnZ20tk/GjCJrjJP3MgASyEXDExlnfgc6BQ8nFm6PhNvim2
	nk9YqqY43Z5G30Aaw3BRFLE=
X-Google-Smtp-Source: AGHT+IEQC34b5l09N1nBCyWKKSCdGRenYmagb8UWJBwQctY4cJS3ep9dRRDx/kNRBmMD95wQPb8IYg==
X-Received: by 2002:a17:906:53d9:b0:9a1:aa7b:482e with SMTP id p25-20020a17090653d900b009a1aa7b482emr13917168ejo.26.1693230607614;
        Mon, 28 Aug 2023 06:50:07 -0700 (PDT)
Received: from nam-dell (ip-217-105-46-58.ip.prioritytelecom.net. [217.105.46.58])
        by smtp.gmail.com with ESMTPSA id p20-20020a17090635d400b0099bd8c1f67esm4696054ejb.109.2023.08.28.06.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 06:50:07 -0700 (PDT)
Date: Mon, 28 Aug 2023 15:50:06 +0200
From: Nam Cao <namcaov@gmail.com>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, guoren@kernel.org
Subject: Re: [PATCH] riscv: provide riscv-specific is_trap_insn()
Message-ID: <ZOymDqhE9STgx4Mm@nam-dell>
References: <20230827205641.46836-1-namcaov@gmail.com>
 <874jkjl4e1.fsf@all.your.base.are.belong.to.us>
 <ZOyhozSq3S36eRSq@nam-dell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZOyhozSq3S36eRSq@nam-dell>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_065013_353951_E4B6055D 
X-CRM114-Status: GOOD (  24.39  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Aug 28, 2023 at 03:31:15PM +0200, Nam Cao wrote:
> On Mon, Aug 28, 2023 at 02:48:06PM +0200, Bj=F6rn T=F6pel wrote:
> > Nam Cao <namcaov@gmail.com> writes:
> > =

> > > uprobes expects is_trap_insn() to return true for any trap instructio=
ns,
> > > not just the one used for installing uprobe. The current default
> > > implementation only returns true for 16-bit c.ebreak if C extension is
> > > enabled. This can confuse uprobes if a 32-bit ebreak generates a trap
> > > exception from userspace: uprobes asks is_trap_insn() who says there =
is no
> > > trap, so uprobes assume a probe was there before but has been removed=
, and
> > > return to the trap instruction. This cause an infinite loop of enteri=
ng
> > > and exiting trap handler.
> > >
> > > Instead of using the default implementation, implement this function
> > > speficially for riscv which checks for both ebreak and c.ebreak.
> > =

> > I took this for a spin, and it indeed fixes this new hang! Nice!
> =

> Great! Thanks for testing it.
>  =

> > However, when I tried setting an uprobe on the ebreak instruction
> > (offset 0x118) from your example [1], the probe does not show up in the
> > trace buffer.
> > =

> > Any ideas?
> =

> >From my understanding, both uprobes and kprobes refuse to install break =
points
> into existing trap instructions. Otherwise, we may conflict with somethin=
g else
> that is also using trap instructions.

I just realize you probably ask this because uprobe can still be installed =
before
applying the patch. But I think that is another bug that my patch also
accidentally fix: uprobes should not install breakpoint into ebreak instruc=
tions,
but it incorrectly does so because it does not even know about the existenc=
e of
32-bit ebreak.

Best regards,
Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
