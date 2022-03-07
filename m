Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B3A6C433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Mar 2022 02:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W1+pb13SoAQdoJvRIJXUPz5dVACztClMiCwwngnwPbY=; b=c0R/OEnrs5CneR
	jGQrnmopAFpUpS89YEAN4CCPjtEtDuyVuvUfNk5Jm67ycVB4fLEB3MgY8Kik0ul24EGbPvMXPgIVk
	Gvx+6DjJNgJdWzOWjR2M1ZXnnSAFHjI1Bb/MmnOKNLtO5Cxq8+Y+IZqct488eW8E/yO4jILiYD/bU
	99FM2VipIlsvdsOTP67T+MA3byOShxtjPCMs0LK7PHtkJfE5z6fM8hyLACc61ccDFaY+6mfzBd2XS
	7Dhrl2affoHtfmimkE1LuQYW7gp7D2Ph+p7dIBTAOKsmLRlpIcrCEof8lZerMADLbDvTAvMjnX+Af
	BLeupLBoRxdK3/98+WFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nR3Nv-00FdjI-NH; Mon, 07 Mar 2022 02:46:07 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nR3Ns-00Fdif-Ak
 for linux-riscv@lists.infradead.org; Mon, 07 Mar 2022 02:46:05 +0000
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-2db2add4516so148822167b3.1
 for <linux-riscv@lists.infradead.org>; Sun, 06 Mar 2022 18:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qKL9sn92RlrlV1rsFPBQcIgi/JhYXQgNPK2p9k+Qq30=;
 b=GTTxUDrcek+bLf0MWT5t54wwDoTi+ca0ymnVQfwZSXw4OMv/kX2MWbd25zod4nPAPN
 YsxItZE+48RE/DqV1pvfFKCiwRrCqFH+6BkgAuMh5jfHbHtQ0+Us6JA9e989RUhd5mwP
 ZyvS0mmZtk4pQi5uHJeNTJOfTcEj0dXVmouIUf60Ze+FH0tNipELFJy3ex9D0hwtxaoz
 pn627nVDI+aHd1IP1rrVQsW2WORSGT4akFrpM5iHpbDkWjoH45qILLp8nHSknNPBhoww
 nabfzjH94SaEgU5JSddvD1tYp6VrXvFiDrmNsPxX/+bnJyyIqw1kf24F4cgBMmcf1aU5
 kRrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qKL9sn92RlrlV1rsFPBQcIgi/JhYXQgNPK2p9k+Qq30=;
 b=vgKcqbc0UaPjDSenRbtSuWO6lFKkSE0JJ+m2vZXPJxN7hX6yGdv6iE41WG0mFXY671
 LSHV5yruaLzB77hJJy6T5UC28o0EwUoiBPa5N39LTmfz06W1kgLpUHARDLcC9TsaS56l
 rQEbEGiRKe7k7ugVHguDExh79Rrp/aGwGZNmP4oVM3An6HkTRGD6hzQ9knB2x5Hd2J1u
 EjWWJ/cdeLDH6hkfapsgNJsn+3DZfzPe87XSNqKitPZEzr2J1MV2lalgm90q7vMXLO9i
 RM75dybumP9m/1Exl4ezYsMyNMseQln55WnM0Z2dKE/MbSBOoH9u94hiutPHtQJa/lig
 sl2w==
X-Gm-Message-State: AOAM532xiukMKCo3v0mZdjqgRYXi9ZDcm32VfPGQkBzn7jJW5uFjbcIo
 WCznKFBorj4GeeWffudkbBxU3XYSBtlHFGi4fHB42w==
X-Google-Smtp-Source: ABdhPJz6SLSSbWt41IHL8uQ9wCru6HqoN+V/J2jxc9BkxA4kDkwitMk4u5M2XwtQlFDor4g7m4ERAcx6xn3Wgnl5CuQ=
X-Received: by 2002:a81:6f54:0:b0:2db:c989:845c with SMTP id
 k81-20020a816f54000000b002dbc989845cmr6991894ywc.298.1646621162230; Sun, 06
 Mar 2022 18:46:02 -0800 (PST)
MIME-Version: 1.0
References: <20220302023048.6140-1-vincent.chen@sifive.com>
 <20220302023048.6140-3-vincent.chen@sifive.com>
 <529535828.117301.1646239106382.JavaMail.zimbra@efficios.com>
 <CABvJ_xiSreWvQ5c+_XW8RWSWUvx69qNc7pwrKVWspg0C9Sy2NQ@mail.gmail.com>
 <214245560.121082.1646344238921.JavaMail.zimbra@efficios.com>
 <CABvJ_xjZ+jdNCrnFvDaP=4qczstMv=PbVemN6VA7MiNWbFa+Zw@mail.gmail.com>
In-Reply-To: <CABvJ_xjZ+jdNCrnFvDaP=4qczstMv=PbVemN6VA7MiNWbFa+Zw@mail.gmail.com>
From: Vincent Chen <vincent.chen@sifive.com>
Date: Mon, 7 Mar 2022 10:45:51 +0800
Message-ID: <CABvJ_xjStvTRF3LDraLADaBY01aUgsjEv6aArFgDv3uh9V9wXQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] rseq/selftests: Add support for RISC-V
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220306_184604_431505_B692EB3D 
X-CRM114-Status: GOOD (  21.08  )
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

On Fri, Mar 4, 2022 at 2:50 PM Vincent Chen <vincent.chen@sifive.com> wrote:
>
> On Fri, Mar 4, 2022 at 5:50 AM Mathieu Desnoyers
> <mathieu.desnoyers@efficios.com> wrote:
> >
> > ----- On Mar 3, 2022, at 2:16 AM, Vincent Chen vincent.chen@sifive.com wrote:
> >
> > > On Thu, Mar 3, 2022 at 12:38 AM Mathieu Desnoyers
> > > <mathieu.desnoyers@efficios.com> wrote:
> > >>
> > [...]
> >
> > >> > +#if __ORDER_LITTLE_ENDIAN__ == 1234
> > >>
> > >> I think we'll want to standardize on this for endianness checking (same as
> > >> the updated uapi rseq.h):
> > >>
> > >> #if defined(__BYTE_ORDER) ? (__BYTE_ORDER == __LITTLE_ENDIAN) :
> > >> defined(__LITTLE_ENDIAN)
> > >>
> > >> We may have to change rseq-mips.h in the rseq selftests to do the same as well
> > >> rather than
> > >> using "# ifdef __BIG_ENDIAN".
> > >>
> > >
> > > OK, I can follow it. However, I found the endianness checking in
> > > include/uapi/linux/rseq.h is
> > > #if (defined(__BYTE_ORDER) && (__BYTE_ORDER == __BIG_ENDIAN)) ||
> > > defined(__BIG_ENDIAN)
> > >
> > > It is a little different than what you mentioned early. Should I
> > > follow the format in include/uapi/linux/rseq.h? or both formats are
> > > OK?
> > >
> >
> > The form "#if (defined(__BYTE_ORDER) && (__BYTE_ORDER == __BIG_ENDIAN)) || defined(__BIG_ENDIAN)
> > is completely buggy. Don't use that.
> >
> > I've sent the fix to Peter to remove the offending #if here:
> >
> > https://lore.kernel.org/lkml/1445357149.71067.1643137248305.JavaMail.zimbra@efficios.com/T/#mbbad3961494feefb98cb6d092879e3ea41b33df8
> >
> > Please use the correct non-bogus form instead:
> >
> > #if defined(__BYTE_ORDER) ? (__BYTE_ORDER == __LITTLE_ENDIAN) : defined(__LITTLE_ENDIAN)
> >
> > Thanks,
> >
> > Mathieu
> >
>
> I understood. By the way, IIUC, the __BYTE_ORDER and __LITTLE_ENDIAN
> are defined in the glibc endian.h. However, I find that no file in the
> rseq folder includes the endian.h. Does it means I should include
> <endian.h> in the rseq-riscv.h?

After tracing the hierarchy of include files, I found that endian.h is
included by pthread.h, and pthread.h is included by param_test.c.
Therefore, rseq-riscv.h can exclude endian.h. I will follow your
suggestions to modify my next version patch. Thank you.

>
> Thanks,
> Vincent
> >
> > --
> > Mathieu Desnoyers
> > EfficiOS Inc.
> > http://www.efficios.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
