Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB54C433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Mar 2022 13:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=2OqatKRTz54CZ5YjzyZDyU2tVvJ6OyMwiZ5LzrWOGdU=; b=UWsjmyjhOa+7yQErcEe3GkpDiv
	OrdPpev3ifXx/QMAIm16SXNobldDPEqr0nG4alvTDedG7PWfK9yc+ePyzPlU2OaLVmgQIxOUWF0u+
	h6EBOOE1j/2wmGe1QkeS0o6kCcH9jGawx2irDItSQr9WK8RtVst+K2DnmbyWQAjgaOL4yCdFK3TQc
	QGg38Oo1XBxCevBQ1ZSOdkntHkftaEEpqUCQ8NltBsW3OmyQrou2cwQu6LrXFYZKyahAiofCTB2lt
	9vgAtjDEyCI/QF/MJKXnvbMybL638Nb2cWpsHY4bHfCr5/bEkvJ4jC3pfDURiOgTCNyIbHOBEcneO
	yq6LDhgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRDbI-000HiJ-7A; Mon, 07 Mar 2022 13:40:36 +0000
Received: from mail.efficios.com ([167.114.26.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRDbF-000Hf2-56
 for linux-riscv@lists.infradead.org; Mon, 07 Mar 2022 13:40:34 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id E7E7634A695;
 Mon,  7 Mar 2022 08:40:26 -0500 (EST)
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 117-nDLaEQpb; Mon,  7 Mar 2022 08:40:26 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id 6167C34A822;
 Mon,  7 Mar 2022 08:40:26 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 6167C34A822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=default; t=1646660426;
 bh=X8i6ab58es2dQvix8peZ5UYpyKLFLj4FtosoeTa2fwE=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=atOEJCotlyIjaLwtQVnmCQgVkNJ8Q78Qj3DCZjbT/Z1IJJ7qpqkOs5ovt5YXRX6hy
 eJRm2AQDV7scZ8D5Lo8Yxko+TXClCfuVINoupzMxeTfq8ID7wjGax8Z155H3cpWucO
 yo2GwGp61WRNK1itcTfwX5lOIKHzE7MbMxXhWlKZa+P60330mSRT0F32M3oaWqpoqo
 WxxuClxTPEHZ5bB/p+nR1j9GgjC/cFhJfkQ/pcZdB52crNGBFtdsb2F2FhTx848aF3
 OhofRY6YwWs5lZeNL2sT/CnlyuxoD+owq7S1S+2gnfx3kPc8+mXSvO7jzaVgLpYM3B
 JjuMfgsOQomVA==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id DPENuyEUmBDY; Mon,  7 Mar 2022 08:40:26 -0500 (EST)
Received: from mail03.efficios.com (mail03.efficios.com [167.114.26.124])
 by mail.efficios.com (Postfix) with ESMTP id 537FB34A5D6;
 Mon,  7 Mar 2022 08:40:26 -0500 (EST)
Date: Mon, 7 Mar 2022 08:40:26 -0500 (EST)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Vincent Chen <vincent.chen@sifive.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>
Message-ID: <1732504666.125429.1646660426220.JavaMail.zimbra@efficios.com>
In-Reply-To: <CABvJ_xjStvTRF3LDraLADaBY01aUgsjEv6aArFgDv3uh9V9wXQ@mail.gmail.com>
References: <20220302023048.6140-1-vincent.chen@sifive.com>
 <20220302023048.6140-3-vincent.chen@sifive.com>
 <529535828.117301.1646239106382.JavaMail.zimbra@efficios.com>
 <CABvJ_xiSreWvQ5c+_XW8RWSWUvx69qNc7pwrKVWspg0C9Sy2NQ@mail.gmail.com>
 <214245560.121082.1646344238921.JavaMail.zimbra@efficios.com>
 <CABvJ_xjZ+jdNCrnFvDaP=4qczstMv=PbVemN6VA7MiNWbFa+Zw@mail.gmail.com>
 <CABvJ_xjStvTRF3LDraLADaBY01aUgsjEv6aArFgDv3uh9V9wXQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] rseq/selftests: Add support for RISC-V
MIME-Version: 1.0
X-Originating-IP: [167.114.26.124]
X-Mailer: Zimbra 8.8.15_GA_4203 (zclient/8.8.15_GA_4203)
Thread-Topic: rseq/selftests: Add support for RISC-V
Thread-Index: T0iypHpgvGQ5+EV274L4uIIxZE8x8Q==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_054033_345960_7A832A7A 
X-CRM114-Status: GOOD (  18.94  )
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


----- Vincent Chen <vincent.chen@sifive.com> wrote:
> On Fri, Mar 4, 2022 at 2:50 PM Vincent Chen <vincent.chen@sifive.com> wrote:
> >
> > On Fri, Mar 4, 2022 at 5:50 AM Mathieu Desnoyers
> > <mathieu.desnoyers@efficios.com> wrote:
> > >
> > > ----- On Mar 3, 2022, at 2:16 AM, Vincent Chen vincent.chen@sifive.com wrote:
> > >
> > > > On Thu, Mar 3, 2022 at 12:38 AM Mathieu Desnoyers
> > > > <mathieu.desnoyers@efficios.com> wrote:
> > > >>
> > > [...]
> > >
> > > >> > +#if __ORDER_LITTLE_ENDIAN__ == 1234
> > > >>
> > > >> I think we'll want to standardize on this for endianness checking (same as
> > > >> the updated uapi rseq.h):
> > > >>
> > > >> #if defined(__BYTE_ORDER) ? (__BYTE_ORDER == __LITTLE_ENDIAN) :
> > > >> defined(__LITTLE_ENDIAN)
> > > >>
> > > >> We may have to change rseq-mips.h in the rseq selftests to do the same as well
> > > >> rather than
> > > >> using "# ifdef __BIG_ENDIAN".
> > > >>
> > > >
> > > > OK, I can follow it. However, I found the endianness checking in
> > > > include/uapi/linux/rseq.h is
> > > > #if (defined(__BYTE_ORDER) && (__BYTE_ORDER == __BIG_ENDIAN)) ||
> > > > defined(__BIG_ENDIAN)
> > > >
> > > > It is a little different than what you mentioned early. Should I
> > > > follow the format in include/uapi/linux/rseq.h? or both formats are
> > > > OK?
> > > >
> > >
> > > The form "#if (defined(__BYTE_ORDER) && (__BYTE_ORDER == __BIG_ENDIAN)) || defined(__BIG_ENDIAN)
> > > is completely buggy. Don't use that.
> > >
> > > I've sent the fix to Peter to remove the offending #if here:
> > >
> > > https://lore.kernel.org/lkml/1445357149.71067.1643137248305.JavaMail.zimbra@efficios.com/T/#mbbad3961494feefb98cb6d092879e3ea41b33df8
> > >
> > > Please use the correct non-bogus form instead:
> > >
> > > #if defined(__BYTE_ORDER) ? (__BYTE_ORDER == __LITTLE_ENDIAN) : defined(__LITTLE_ENDIAN)
> > >
> > > Thanks,
> > >
> > > Mathieu
> > >
> >
> > I understood. By the way, IIUC, the __BYTE_ORDER and __LITTLE_ENDIAN
> > are defined in the glibc endian.h. However, I find that no file in the
> > rseq folder includes the endian.h. Does it means I should include
> > <endian.h> in the rseq-riscv.h?
> 
> After tracing the hierarchy of include files, I found that endian.h is
> included by pthread.h, and pthread.h is included by param_test.c.
> Therefore, rseq-riscv.h can exclude endian.h. I will follow your
> suggestions to modify my next version patch. Thank you.

You should include what you use. Please include endian.h from the riscv header as well.

Thanks,

Mathieu

> 
> >
> > Thanks,
> > Vincent
> > >
> > > --
> > > Mathieu Desnoyers
> > > EfficiOS Inc.
> > > http://www.efficios.com

-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
