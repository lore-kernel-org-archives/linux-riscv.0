Return-Path: <SRS0=HZsE=GQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDFAEC433E0
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Jan 2021 02:57:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5479C23131
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Jan 2021 02:57:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5479C23131
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oNRYP/2mnAESBBX/sRcQPLT0WphlNP2wkime7zMF2e0=; b=FvUdoaLZP0cfvck29uB08IHaW
	r1WxzEdiN0TZfCe7B4QrYOA7FRgFS9si6L9Hykx/Zr39X8PfXnktAXzhztXXuza44ufB5986wjQN0
	8iK6GLSzO6tOKmQMQMgJnuaXJHPe3cLknRdMIdmExX97oe9ra0IK/XiaQ7JQWzb4fwvJUBcHLJWYp
	Wbng6efnaawSCVHrwsG2OfgiszTUXIiAN0TG1anmwfVPZzVkUJhW3eDHtQa7zNpbwVAFb7U7w7RjE
	nggtQKcUxIujUpGDJULLk56F2oXRgyKEYS2hWwl2R9k9LWqk1jdsvbbr4ozSDIO7WzjFOXPeq4BBG
	ENW2fSC4Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzWLt-0001tl-KN; Wed, 13 Jan 2021 02:57:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzWLq-0001sR-7k
 for linux-riscv@lists.infradead.org; Wed, 13 Jan 2021 02:57:39 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D4CFE2312E
 for <linux-riscv@lists.infradead.org>; Wed, 13 Jan 2021 02:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610506656;
 bh=A2X9yAJjMelGsnUZoFeBcSZDu8oKUroi/CJv9/mXNCk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fkC/OTEwMOc1ls89758/bPG65vPCysFvTAGXFqzRzS7YoGiCuSlwPFZ/xouX3dvDs
 R1duE0mjZrHOZmpS6SB3pGEmyGxtk69DuUV19Dnz9phAaYAyGQUhGovoRzkoGfWvg/
 eUqlSevoePa/Si6iEq+dnfrQo7mLrk7TwqqXcXQ6IlLpOVBcMsmdmRr6+RpbcyytPl
 KIJUzE5DePPJgUKkQrT8xVzdDxOwaQdcG8/Mr0KFkFIFyZWtGhMArrs1Yth9Rs7iun
 VnoX7DWj1WbCVrJw+wAYQLpiQy8kclwqkYzhI9AS/SWIpgsZhDxW0QLUAW+Lo0fV3L
 QmuXWtmz3tpHA==
Received: by mail-lf1-f47.google.com with SMTP id o10so541322lfl.13
 for <linux-riscv@lists.infradead.org>; Tue, 12 Jan 2021 18:57:35 -0800 (PST)
X-Gm-Message-State: AOAM530Jq3jH5xhaWbngOtvL5jGwc9c8Lb25ZqvLl9pqUm4XqrxpiqJa
 OoyMJWWeVNw0qnxU+BnEy+Hqs0SUac8nP4buvuU=
X-Google-Smtp-Source: ABdhPJwlhGXDaVk1dHC2iXVm1w5QTAinOx5BgK1PGcETU2AuiXP4xhOlgjZ7sCe4ka/j4bOSE6viYJm2r3RIZu5N+Fk=
X-Received: by 2002:a19:38e:: with SMTP id 136mr852405lfd.346.1610506654053;
 Tue, 12 Jan 2021 18:57:34 -0800 (PST)
MIME-Version: 1.0
References: <20210112023534.117354-1-guoren@kernel.org>
 <CAOnJCUK89rwjfnpMtavbaf-pwBndnS-=kVwsdP2yJnJAwJi-kg@mail.gmail.com>
In-Reply-To: <CAOnJCUK89rwjfnpMtavbaf-pwBndnS-=kVwsdP2yJnJAwJi-kg@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 13 Jan 2021 10:57:22 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQYT-pkUrdoCiZsLX+SwYk89FKO=tgscwwQrdtHEobPpQ@mail.gmail.com>
Message-ID: <CAJF2gTQYT-pkUrdoCiZsLX+SwYk89FKO=tgscwwQrdtHEobPpQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: Remove duplicate definition in pagtable.h
To: Atish Patra <atishp@atishpatra.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210112_215738_374924_D6B1872A 
X-CRM114-Status: GOOD (  17.09  )
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
Cc: Guo Ren <guoren@linux.alibaba.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Pekka Enberg <penberg@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jan 12, 2021 at 4:18 PM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Mon, Jan 11, 2021 at 6:38 PM <guoren@kernel.org> wrote:
> >
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > PAGE_KERNEL_EXEC has been defined above.
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Cc: Palmer Dabbelt <palmer@dabbelt.com>
> > Cc: Pekka Enberg <penberg@kernel.org>
> > ---
> >  arch/riscv/include/asm/pgtable.h | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> > index 41a72861987c..dff51a84e52e 100644
> > --- a/arch/riscv/include/asm/pgtable.h
> > +++ b/arch/riscv/include/asm/pgtable.h
> > @@ -101,7 +101,6 @@
> >  #define PAGE_KERNEL            __pgprot(_PAGE_KERNEL)
> >  #define PAGE_KERNEL_EXEC       __pgprot(_PAGE_KERNEL | _PAGE_EXEC)
> >  #define PAGE_KERNEL_READ       __pgprot(_PAGE_KERNEL & ~_PAGE_WRITE)
> > -#define PAGE_KERNEL_EXEC       __pgprot(_PAGE_KERNEL | _PAGE_EXEC)
> >  #define PAGE_KERNEL_READ_EXEC  __pgprot((_PAGE_KERNEL & ~_PAGE_WRITE) \
> >                                          | _PAGE_EXEC)
> >
> > --
> > 2.17.1
> >
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
>
> It's already on the fixes.
>
> http://lists.infradead.org/pipermail/linux-riscv/2021-January/004134.html
Great, ignore mine :)


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
