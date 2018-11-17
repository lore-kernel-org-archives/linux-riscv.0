Return-Path: <SRS0=yw/l=N4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C630C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 17 Nov 2018 03:10:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E5982089D
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 17 Nov 2018 03:10:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ldAqLKhm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="UC8/H4si"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E5982089D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cz5i153W/eeB1y6kbvpKXUpu6PywDcMd/bdB8vqIkso=; b=ldAqLKhmVjGj3M
	B8GB+9Nj8Zdaij8fJVihxMlU4UnF5q09lJl6ofEfTfAsz3217nuwHSj10HBP/wvwEaf8RTCRHsVip
	e35NZRWlK1FG0jRu9my2KnKq8DApFQz6y2jjvvX0NyHWJ3I3yNH9rqmNiOxMQIZUKp6amCXM87wBk
	eRApfGhd8fNVjlP19Qy2WmAhadYjCvuMyJljQiSDGgpuvQeEbJAucOFgOExe2/fZUhYRS632dQf6Y
	2NpQLb6qQRMtXxRNJ4YqsjGQsfq3WUll8FGDHPsl764iFrkDTh1+2rt39FJTxCoaRyFfNVQwtZrJS
	gpRenMi3Khu0jUIygUrQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gNqzh-0008Uv-Eh; Sat, 17 Nov 2018 03:10:01 +0000
Received: from mail-it1-x141.google.com ([2607:f8b0:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gNqze-0008TW-CQ
 for linux-riscv@lists.infradead.org; Sat, 17 Nov 2018 03:09:59 +0000
Received: by mail-it1-x141.google.com with SMTP id a205-v6so795209itd.4
 for <linux-riscv@lists.infradead.org>; Fri, 16 Nov 2018 19:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GdXTma+heCG1NQmiQLpbKj/0h295HXhNL04xMwtD4/c=;
 b=UC8/H4si50DBfyCs4w0RGJGkRQl6Le9lijQ/wVvOHmGtV3/nBrKrlwKWPO5GNaGClO
 snFE9Dcqcy3Hj1HsmWd/gsGSiM3IJvmvgwz8ur+GQ4gGS9g9PC3zNSrR3+dzzNRN6q0V
 AZ/NL1beNAqFom/oeCzh7eNBS7DIX0XrqpfKaNcDlOQtCfsst3Oet+SyL0DC0VL+YXV4
 X73R8b6+QHzj6kYpFoJC2ELmdLl1Rn7KazVd0ysigqK0pAoFSB5rDCi65C/i5ty3NggY
 5OAXXq2rnY4UlmT5n+sDR8ryRsOOiONoB7X/idKXofo3bJhkEw/FlEXxRa+HICN1KIuz
 grUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GdXTma+heCG1NQmiQLpbKj/0h295HXhNL04xMwtD4/c=;
 b=hTIXWZLfcfSb+M3jGyIuSu6Fr60K9nGUU9Rl37rvFeIaVQ2gPPVZ4oRVsXf84m2KjN
 GYCxVzy6Iw5aYkhjhQHld8hthcEXkGDIJLOfCj+nH8xAjLUeDrSj7TCezVNDlLmQsjW1
 Pb1IX9PHNxP+dF3qTQpAIlub7AxzCgnVw0Bc+X3Yss4cYPiSWZoM1aQJSZaIS3aRLSsp
 qz0Xhx9VIiyEc1UIpR7+CPU6x1ZMuAwGtBssuq9Pio/Bp6SRJxutzUiYiNqRvjDPUbsn
 6ej+PFSWMWQGF17BWdKFL4zOXzucJwSm1m+s+p9el84mplCypzznwglu1i0pgtreUMwE
 O+mg==
X-Gm-Message-State: AA+aEWa+x8cmb/uFbHTQ42b0op/qPeA3DS6NnB336DrB/hzr4Wn30B5Z
 HV8QdttZljqNDKdMBnuZastYiv0iOO3CWbYav6yqvg==
X-Google-Smtp-Source: AFSGD/Xq0iwm/01B4NFxTy4/HI6+AgjJf1B0cgGQlsE4dxnx3ujDZwrNl1JmsaC3hdQAoQu6ewxB1+OJr4wajvhWnGg=
X-Received: by 2002:a24:70ca:: with SMTP id
 f193-v6mr732552itc.59.1542424186888; 
 Fri, 16 Nov 2018 19:09:46 -0800 (PST)
MIME-Version: 1.0
References: <20181108190700.30825-1-david.abdurachmanov@gmail.com>
 <mhng-1888c072-5274-457c-aa26-b9fa9cb246dd@palmer-si-x1c4>
In-Reply-To: <mhng-1888c072-5274-457c-aa26-b9fa9cb246dd@palmer-si-x1c4>
From: Olof Johansson <olof@lixom.net>
Date: Fri, 16 Nov 2018 19:09:36 -0800
Message-ID:
 <CAOesGMjzOkPNv7v_uMMsCw=20NuebPvkLBS5b5eaS9Z6=p1qKg@mail.gmail.com>
Subject: Re: [PATCH] riscv: fix warning in arch/riscv/include/asm/module.h
To: Palmer Dabbelt <palmer@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181116_190958_438494_0B0B5BCE 
X-CRM114-Status: GOOD (  13.22  )
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
Cc: linux-riscv@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 David Abdurachmanov <david.abdurachmanov@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181117030936.oqCluusiBkPDz6orTCxLw_T-pYN8AeuZpPyAu6HMo9w@z>

On Thu, Nov 8, 2018 at 11:32 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Thu, 08 Nov 2018 11:07:00 PST (-0800), david.abdurachmanov@gmail.com wrote:
> > Fixes warning: 'struct module' declared inside parameter list will not be
> > visible outside of this definition or declaration
> >
> > Signed-off-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
> > ---
> >  arch/riscv/include/asm/module.h | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/riscv/include/asm/module.h b/arch/riscv/include/asm/module.h
> > index 349df33808c4..cd2af4b013e3 100644
> > --- a/arch/riscv/include/asm/module.h
> > +++ b/arch/riscv/include/asm/module.h
> > @@ -8,6 +8,7 @@
> >
> >  #define MODULE_ARCH_VERMAGIC    "riscv"
> >
> > +struct module;
> >  u64 module_emit_got_entry(struct module *mod, u64 val);
> >  u64 module_emit_plt_entry(struct module *mod, u64 val);
>
> Works for me.  Looks like arm64 might have exactly the same issue.  I'll roll
> it up into the next RC.

Looks like it's still here in -next. So, patch:

Acked-by: Olof Johansson <olof@lixom.net>

(and it'd be great to pickup together with the 32-bit build fix).


-Olof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
