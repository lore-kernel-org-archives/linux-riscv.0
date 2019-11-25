Return-Path: <SRS0=aecs=ZR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE80CC432C0
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Nov 2019 03:20:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F9A820815
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Nov 2019 03:20:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GM3PtFOR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel-com.20150623.gappssmtp.com header.i=@intel-com.20150623.gappssmtp.com header.b="FnZ8CuB8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F9A820815
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AtmAdl6OjRpW/7Y4wBt0PNkws5Ykg5MFjJRZa5nD2ZM=; b=GM3PtFORY5ndNk
	PkUo377zAtzC+5H+IAwftGbFWDZS4OgnaKaxf/j4ukNoIznSD1j005gdFEOZdTEiK76bJiP17zTBv
	13PPZ2+3PvEiIn1FveFawvb/sTaJKGOe+0zj9cZaNjuVvUPbyEXFx7jX/8WObx6CmuzsNSNN7Nhmj
	2IGq8LoOvwsoh4GnbfS+3qwfvpnitDL3aoPX/Ga//52APu4QVjlDfYWzA0O7P8/mdEBtqmdqJQOln
	+05ih4NnC/FNFR2fgNxwEeKq/iPBgMCrqn4qxDY5x6TqrBEoePsvw/vCQ1b1h3JGEbJqZBUP14IMQ
	ZEpb3YTCPp6PQGJAmuIg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZ4vm-0005SD-DU; Mon, 25 Nov 2019 03:20:54 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZ4vj-0005RH-Au
 for linux-riscv@lists.infradead.org; Mon, 25 Nov 2019 03:20:53 +0000
Received: by mail-ot1-x342.google.com with SMTP id z25so11324652oti.5
 for <linux-riscv@lists.infradead.org>; Sun, 24 Nov 2019 19:20:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=72RpSXa/41GCFQnbzlHwP1dZ5nMfYcHZnOpPX9qfEw4=;
 b=FnZ8CuB8Jaav0sZ6IeBLdo0S0pFI6uWktcnFrPh76h3EjcLbUNcef2Oj+ZbeFs8z1i
 IPi1wxSBMPSRHu9zUwmhGZXvDYWlkCpdBJqX9fKQ0oJ24/JAqR9Tnq/ZwwFcrJq2cbze
 RVKynrxQH9feuMHYYhtEeuUvHZs7uGuKLyIaRVMF63rDPw2r2rfgX8hKi234kwQpCj9I
 g+RMn63vlr7Lyo08UsgHp7j/Cu3Qt2kn1ahGy/vO9U9ImJ2jJHSB6xTOOuYLwPOm5+To
 ySOTW8i0jngrZ8BKN7ZKhYVRC3f5Fwj4vBQXEalsLB9uk+TCkoHw4oR5LHOAqdIUyZVS
 O6MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=72RpSXa/41GCFQnbzlHwP1dZ5nMfYcHZnOpPX9qfEw4=;
 b=AciE2nQcP/CqI8KO0DcJ34kBo7F2KXmW2JO4qH6Df6QLreIZbqZG95N4VMMWHeZVUe
 gzJsC7d92DLgg86QucdFXAZOBzNzRN0vtrzOMRtRETx3LrlB2lEgT3PYsA3pvr8xSPjw
 1D4b9TAUFBnsVMYcHoSVGcOH5pS64YnCS8x6FUPKAG+3jkTqx7pDUvkzK8kybpLj6ZWd
 O7feIbd1ULUS3maihhufsEjafSjM3tSu1RkxYM00+wE6eA0+tlsd1+zBITwjJkDR5ACt
 fR8ZbawmpUfwl+sq1383l7sFzvZ4GZ8dfH9Z0DdcQZhZ5u5d54d7WYrevuHPDoteSlrM
 Ze1Q==
X-Gm-Message-State: APjAAAUb8KiVdwgBp45ckQIa3H8zDUCl39+qv/6Nx/4LyyoFtTqSTAf1
 A0PnNLyRZAguR8NjXcCqUVR1NksaZYW5Uv/0/DCLkg==
X-Google-Smtp-Source: APXvYqzSYjUMsNyaW8sZ9zntR3WRn2N4+MrJ+PCBLWVWhT+aI0bg5hzjDQWFOwtMtWQWDKuQMnfbqSflUKrXtF5NdqY=
X-Received: by 2002:a9d:2d89:: with SMTP id g9mr18159633otb.126.1574652049319; 
 Sun, 24 Nov 2019 19:20:49 -0800 (PST)
MIME-Version: 1.0
References: <alpine.DEB.2.21.9999.1911221842200.14532@viisi.sifive.com>
 <20191123092552.1438bc95@lwn.net>
 <alpine.DEB.2.21.9999.1911231523390.14532@viisi.sifive.com>
 <CAPcyv4hmagCVLCTYmmv0U8-YD5BEoQPV=wtm5hbp3MxqwZRQUA@mail.gmail.com>
 <alpine.DEB.2.21.9999.1911231546450.14532@viisi.sifive.com>
 <CAPcyv4hBNfabaZmKs0XF+UT9Py8zJqpNdu5KsToqp305NASKNA@mail.gmail.com>
 <alpine.DEB.2.21.9999.1911231637510.14532@viisi.sifive.com>
 <CAPcyv4iqTR8s0v8jH7haWCBQAzhZinUEsypiH7Ts9FCf+F9Bvg@mail.gmail.com>
 <alpine.DEB.2.21.9999.1911241841210.22625@viisi.sifive.com>
In-Reply-To: <alpine.DEB.2.21.9999.1911241841210.22625@viisi.sifive.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Sun, 24 Nov 2019 19:20:38 -0800
Message-ID: <CAPcyv4gbz996jwQQ5HEJ-L6uqqR+PoA5X6zdDQVnoqcmk+oXPw@mail.gmail.com>
Subject: Re: [PATCH] Documentation: riscv: add patch acceptance guidelines
To: Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191124_192051_437638_9636EE93 
X-CRM114-Status: GOOD (  12.78  )
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
Cc: krste@berkeley.edu, aou@eecs.berkeley.edu, waterman@eecs.berkeley.edu,
 Jonathan Corbet <corbet@lwn.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, palmer@dabbelt.com,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Nov 24, 2019 at 6:49 PM Paul Walmsley <paul.walmsley@sifive.com> wrote:
>
> On Sat, 23 Nov 2019, Dan Williams wrote:
>
> > I'm open to updating the headers to make a section heading that
> > matches what you're trying to convey, however that header definition
> > should be globally agreed upon. I don't want the document that tries
> > to clarify per-subsystem behaviours itself to have per-subsystem
> > permutations. I think we, subsystem maintainers, at least need to be
> > able to agree on the topics we disagree on.
>
> Unless you're planning to, say, follow up with some kind of automated
> process working across all of the profile documents in such a way that it
> would make technical sense for the different sections to be standardized,
> I personally don't see any need at all for profile document
> standardization.  As far as I can tell, these documents are meant for
> humans, rather than computers, to read.  And in the absence of a strong
> technical rationale to limit how maintainers express themselves here, I
> don't think it's justified.
>

It's just a template, you're free to make sub-headings of your own
choosing, but please try to give a contributor that is spanning
subsystems a chance to navigate similar information across profile
documents.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
