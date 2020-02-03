Return-Path: <SRS0=tMB7=3X=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4594C35247
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2020 15:06:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B75152080C
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2020 15:06:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jmWOmxwy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=carlosedp-com.20150623.gappssmtp.com header.i=@carlosedp-com.20150623.gappssmtp.com header.b="urR6T8w2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B75152080C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=carlosedp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fua2L2gYtaeCa/r27isu8tZyemVSsa+CBo7k3aOse/k=; b=jmWOmxwyFaLEzUt3bOvvpdxDC
	CmMnz9+YvR6Qk+r8TsdNKED/9b5z/a7EYV3sS5d37x88akeAAeYm+znK30CX4ep2KITSgfhDd0Mci
	1GmoV+hgxo85ncO/8sOuUnyLbHjdMxCXTLdLXC+iOXXaNX0QhuvHz8l4+6WUS78mZON4nbMlAvgcJ
	HDuo9p9avOmH0Nt3lwxhTX8voXzLRTxsQscUjKoMmgxP2hl/aipeWDU8GeEXTzfPzk9an3BBTj9fJ
	f64Vy9Uk26K21XSGhYksFHUlX+aRcaBNs8GB/WkOROsdQfGweMZIe3r8L6V70YdepYgZYqPFdyFV/
	MiWT18mhA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iydJ8-0001DS-Kf; Mon, 03 Feb 2020 15:06:38 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iydJ5-0001Cj-TQ
 for linux-riscv@lists.infradead.org; Mon, 03 Feb 2020 15:06:37 +0000
Received: by mail-ot1-x341.google.com with SMTP id h9so13866505otj.11
 for <linux-riscv@lists.infradead.org>; Mon, 03 Feb 2020 07:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=carlosedp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fua2L2gYtaeCa/r27isu8tZyemVSsa+CBo7k3aOse/k=;
 b=urR6T8w2CNi1p6mWdfa/YVOpFJgSkVxsYhejrFCWNJHWymQ0bfdiH4uEE7SB2gnAtn
 15Yaf5ZeqGC1eld+XUO5JVfc+WCpeNjYI/ygw32J7DoqFh7eWAM2rmptQNoc4slgrxvJ
 HYgNi38VDxfeXj8BsVLkhp8CTO7GiZ0GBgZgoEYqT6MajCMKJzCHSEKCcWFKMH8rJ4cx
 E+ErdLF509unqjq9U1/a1agQGUlj/b+w9t3+0SOc+li6yxrmA22dNZ37sw9znxNYy652
 JFoW40eGh+QwBzbjc3v3AXx4Ecp9EkRDx6capAp+hf0BFpNa0HjYtRZn+o7slTxwCd9Z
 I/qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fua2L2gYtaeCa/r27isu8tZyemVSsa+CBo7k3aOse/k=;
 b=VW1Ls8Uff315+qZRyi2mVegoRiCU+OBEI9JT2HRCQQ72/cpyqc6oOh6UxkFIjDSHX4
 5d7tCOKztou4Md6XDcutkEUUS71+zAeymIosXxay6aRN83sS5mVKEyvufKhSXVIRoxl8
 zcoe86B/3bm9UhizXpBVjgh7CM4NkwKGl1YeNianu2KepCo7/rr5i4C50OY3+eMRsTG/
 /Skxa98efD18D6ne4imxYb9Yzl+hbgcJbx5AFhXnwGWn98rqwD44NIPBJXK0+LBJOlz+
 4ijYCivMQixgRj1kZmoioLUCMwN1XJ6d6HFj34J/Q6GG00pWmGkcKIuZ+MvA6PpjnRF1
 uGSw==
X-Gm-Message-State: APjAAAUhG2znFlnEMj+V5GK3wYslDLiol3pFJSNVe68Cb6H/IRsMSGFz
 kIRtLDl830kB2NS91Kg7VFFy6vLNcHnYmg==
X-Google-Smtp-Source: APXvYqxOCPHinAPj1RqshqjtfGDp+UNNWy7OuNWgqsxaKDggj9thHYZvogBmicAUgwJGYE2t+ufWIQ==
X-Received: by 2002:a9d:588d:: with SMTP id x13mr17315308otg.6.1580742392748; 
 Mon, 03 Feb 2020 07:06:32 -0800 (PST)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com.
 [209.85.210.43])
 by smtp.gmail.com with ESMTPSA id t203sm5701717oig.39.2020.02.03.07.06.31
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2020 07:06:31 -0800 (PST)
Received: by mail-ot1-f43.google.com with SMTP id i6so13904914otr.7
 for <linux-riscv@lists.infradead.org>; Mon, 03 Feb 2020 07:06:31 -0800 (PST)
X-Received: by 2002:a05:6830:1498:: with SMTP id
 s24mr19354384otq.79.1580742391135; 
 Mon, 03 Feb 2020 07:06:31 -0800 (PST)
MIME-Version: 1.0
References: <CADnnUqfDnkvCJVqBkDw+gV7_zs5Q_Mb3anQTu+UujjJ8bBk+ng@mail.gmail.com>
 <CAEn-LTrSXHdfp9OPGRSoJCfi8D8Cg8FqS=_-JYpDatAT0X5C0w@mail.gmail.com>
 <CADnnUqciAtweH6KqxvK7Z5ZL-uqOQHujWQBrt+aj2y+31BpuHQ@mail.gmail.com>
 <CADnnUqe1GrqJ5EUQQoPp063bs9SqQkHUSqK_hcWqpkJQcxySTg@mail.gmail.com>
 <CAOnJCULxNeuS3v1UEFAC_uG4heQfR3QCK-STv48LCK1pbH-18A@mail.gmail.com>
 <94ee0543-e0e6-2be4-9168-e0c8a55ca92a@williamgrant.id.au>
 <CADnnUqduWL2gMBASF=8OX8huALW9Z2tWz73kcjDK5GL+xHtsbw@mail.gmail.com>
 <40bc5468-21e8-f6ac-fcb6-eff2efa7fd13@williamgrant.id.au>
 <CAOnJCUKTDTjB8rAov8XLkfT+PAymstcy6y4A75ijRstK6y202A@mail.gmail.com>
In-Reply-To: <CAOnJCUKTDTjB8rAov8XLkfT+PAymstcy6y4A75ijRstK6y202A@mail.gmail.com>
From: Carlos Eduardo de Paula <me@carlosedp.com>
Date: Mon, 3 Feb 2020 12:06:19 -0300
X-Gmail-Original-Message-ID: <CADnnUqfJ=YvFSkpsCMDd9owAE_Pwxkn=mzJ8S2YvYqRff60xxA@mail.gmail.com>
Message-ID: <CADnnUqfJ=YvFSkpsCMDd9owAE_Pwxkn=mzJ8S2YvYqRff60xxA@mail.gmail.com>
Subject: Re: Errors and segmentation fault while building Golang on Kernel
 after v5.4-rc3
To: Atish Patra <atishp@atishpatra.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200203_070635_996877_663F0C1E 
X-CRM114-Status: GOOD (  13.21  )
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
Cc: David Abdurachmanov <david.abdurachmanov@gmail.com>,
 David Abdurachmanov <david.abdurachmanov@sifive.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 William Grant <me@williamgrant.id.au>, Joel Sing <joel@sing.id.au>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Feb 2, 2020 at 9:30 AM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Sat, Feb 1, 2020 at 3:37 PM William Grant <me@williamgrant.id.au> wrote:
> >
> > On 2/2/20 5:58 am, Carlos Eduardo de Paula wrote:
> > > Hi Atish, I've added that patch to latest OpenSBI from master, dd'ed
> > > it to my mmcblk0p3 partition but still got problems building Golang
> > > using kernel v5.5.
> > >
> > > [... snip ...]
> > >
> > > Did it worked for you William?
> > >
> > > Carlos
> >
> > Ah, sorry, I didn't actually test Atish's patch. It's not quite right,
> > since .tlb_range_flush_limit = 0 implies the default is used. I think
> > setting it to 1 should work,
>
> My bad. That's what happens when you are jet lagged and sent a patch
> at 5AM without testing :(.
> Ideally, it should be set to zero. I have fixed the issue in platform
> header and sent a patch series.
>
> http://lists.infradead.org/pipermail/opensbi/2020-February/001060.html
>
> --
> Regards,
> Atish


No worries Atish :)

I've changed the parameter to "1" and confirm that it works.

Built and tested Golang on v5.5.
Carlos

