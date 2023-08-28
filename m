Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75AD0C71153
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Aug 2023 13:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QljzilSe1QePT2RTY7m4qfJmhmL8+kgOrTsQ+V0zFiM=; b=ZsYlzgSdhdaaDm
	xVVIoUI7HKPDsyzjRCqL1yp4Xp2NBLYB9d+WpIC3igr8v9Xcyoz8tjRSA09yZfqKNY+MaWCi4F3dp
	LN4Z0U/Yv+c5JHUA2Bk5iY1ayNvNIMiU2GntRoG6hIbwWNH6SASqyDaMAN7n0WyO7EOh4ZHJuu3kF
	6SSJ1E8pIC+t9P//ABecYy+adFmZCKXf1S7uEvzm+VJIEU5TTaKT8614iIEtmof8iuTS+u9T5gyHu
	5Qomj65oc4oV5M/nx3Bho1YCdrpXRrrJEtFnbs86wkVw6P7YZRfvyOaQg2A6WpVSpsXJfF84qzRdx
	dJEkSL6s3X7h/snx2cpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qacKx-009dgD-36;
	Mon, 28 Aug 2023 13:31:23 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qacKu-009dfs-27
	for linux-riscv@lists.infradead.org;
	Mon, 28 Aug 2023 13:31:21 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-52a3aa99bcdso4608918a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 28 Aug 2023 06:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693229476; x=1693834276;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J4F0xok8iSguLrceI1R+cP2UDwaDgtc8df9nO/kRk58=;
        b=Xq8Ut29lcHD8oi1Nrg6IVUoSD6PllAmapPg+i55jSjGmbEIXHur5rANJGut9k6ay8M
         MGN8cIsMJa3UEltfdTdU5LYnldRBRG8Hgy8aGS88W6VRD9LzTt4hO53OfRoVmdxWq12l
         cKX5365XOMY/PT2KKYqAt34YKAfKQBXo5P+ZNy1+JZRfMCF/m6I9eKuwz4Gf/0AyqbLL
         b7qhUmDqOBMrfpRMlVQPTSzH19nlQ0uNbrcxKA0+Zfh7OPuSQJMjJIV+IsfqNRRio8No
         Hdvzld3O6s/ozWpPApOVg1jXGMHAujS6q91dPkXuhaOw6JrdFq9SUXsvWmxY8JRkN2qD
         3elg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693229476; x=1693834276;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J4F0xok8iSguLrceI1R+cP2UDwaDgtc8df9nO/kRk58=;
        b=JckKMjE0/2dpvoYsKrMPe64WrKSlyPvfX1aQ4fPDRjBuH/HEVOhlFWtqzTWK3pvgE3
         e92fwn5zEXtfS5KofAMyh1S5B9OzzzAzo4cIXmx1woS3CCkgA1pV1wb1d7iR4pts5cPm
         98fCEI8r9HuQ4dKRxC2YDP08gJhGAbj35EYwq/FRwa1rbN78FrhcvUna3HpkBSl4C39t
         LgHkwvBlJPKQETgaTDe5vSPgqsXI0ATWUys4Fj83A6h0RUX5OryCnoCaQf8FvTEz9yNU
         xKJ22t7hiBSp1SL/0xFt+AT4FLSGLSybDHDfQlBVXD7TQ8ZRNhUVr6bAvHqAZtruufqb
         f43w==
X-Gm-Message-State: AOJu0YzPbZy2az46KehDmxAXTbOqq3pjBtcr2eG3YPxBZ2KIUPFkVFf/
	C/1V6LxT+VFPVmu7eZGbGtLfv6duUVY=
X-Google-Smtp-Source: AGHT+IEevoaUFlo+XVGkG/Su7M0zsQH3rcxIRPrBFo25Ik3pI5AToux6RP2Jye1EIsHpMOJ6Ax1p/g==
X-Received: by 2002:a17:906:3152:b0:9a1:d29c:6aaa with SMTP id e18-20020a170906315200b009a1d29c6aaamr11749253eje.39.1693229476398;
        Mon, 28 Aug 2023 06:31:16 -0700 (PDT)
Received: from nam-dell (ip-217-105-46-58.ip.prioritytelecom.net. [217.105.46.58])
        by smtp.gmail.com with ESMTPSA id p23-20020a170906839700b0099d9b50d786sm4670029ejx.199.2023.08.28.06.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 06:31:15 -0700 (PDT)
Date: Mon, 28 Aug 2023 15:31:15 +0200
From: Nam Cao <namcaov@gmail.com>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, guoren@kernel.org
Subject: Re: [PATCH] riscv: provide riscv-specific is_trap_insn()
Message-ID: <ZOyhozSq3S36eRSq@nam-dell>
References: <20230827205641.46836-1-namcaov@gmail.com>
 <874jkjl4e1.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <874jkjl4e1.fsf@all.your.base.are.belong.to.us>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_063120_714924_2FAC8943 
X-CRM114-Status: GOOD (  18.31  )
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

On Mon, Aug 28, 2023 at 02:48:06PM +0200, Bj=F6rn T=F6pel wrote:
> Nam Cao <namcaov@gmail.com> writes:
> =

> > uprobes expects is_trap_insn() to return true for any trap instructions,
> > not just the one used for installing uprobe. The current default
> > implementation only returns true for 16-bit c.ebreak if C extension is
> > enabled. This can confuse uprobes if a 32-bit ebreak generates a trap
> > exception from userspace: uprobes asks is_trap_insn() who says there is=
 no
> > trap, so uprobes assume a probe was there before but has been removed, =
and
> > return to the trap instruction. This cause an infinite loop of entering
> > and exiting trap handler.
> >
> > Instead of using the default implementation, implement this function
> > speficially for riscv which checks for both ebreak and c.ebreak.
> =

> I took this for a spin, and it indeed fixes this new hang! Nice!

Great! Thanks for testing it.
 =

> However, when I tried setting an uprobe on the ebreak instruction
> (offset 0x118) from your example [1], the probe does not show up in the
> trace buffer.
> =

> Any ideas?

From my understanding, both uprobes and kprobes refuse to install break poi=
nts
into existing trap instructions. Otherwise, we may conflict with something =
else
that is also using trap instructions.

Best regards,
Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
