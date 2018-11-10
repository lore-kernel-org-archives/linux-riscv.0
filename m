Return-Path: <SRS0=valo=NV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA51DC43441
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 10 Nov 2018 18:00:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86D8F20840
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 10 Nov 2018 18:00:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AJ0+y2qB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NKNw3d/9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86D8F20840
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SNwn1TAA/lvbzNbFX4M2ykVOBoBVp4witUJYGb2knqI=; b=AJ0+y2qB7AMAPG
	F+0xJvs+TgEQOmTJMBIW7aQelI1UTvNmsEcPP35I/axLWqluMJbYhD1WHIoDPuqTdAP5XL2t95bex
	u8NJxDvCdgIFnxgUvsfM5hi/LxIhYdHNzJuHo4e+XPqfgSw8Wh75LEkvWVqCYBwNcbPjY4Yor0U3c
	YIhdqDHotSVSwuDi398gGglchjwvODTJee+sYYaumdkS1x8HMyreeJjELt6VIoArDQtrhIUIMJy+C
	vk46qGXtUpvOYcadO7KNvQ3lpmGFU+0nIMk/xifYB7Hz/HtkW1CWrb4/xRL8SMqyAPcN7lonUsqns
	EDSFZTKQOY//HIiIYgkA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gLXZ0-0004gL-Rz; Sat, 10 Nov 2018 18:00:54 +0000
Received: from mail-vs1-xe41.google.com ([2607:f8b0:4864:20::e41])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLXYy-0004e9-4f
 for linux-riscv@lists.infradead.org; Sat, 10 Nov 2018 18:00:53 +0000
Received: by mail-vs1-xe41.google.com with SMTP id e7so2922142vsc.2
 for <linux-riscv@lists.infradead.org>; Sat, 10 Nov 2018 10:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qsNviNvSBfzsupGdOT2s8gD9m3BbXa7zKTc0EuR6jLM=;
 b=NKNw3d/9MKmbpsRk0OO7TWULxcA6nPVrDavmSgKqJZMENYCU206LD/yIbFvVr/1H+b
 Zp25dUBtdAbCNW4TKcnLkOTVM6ow0ssQRn9V4gxWDHNj22qi4pxM53KGs/hdIxFLjkch
 eu5AapWSj0htatNi4SghF1K4W1tUz+DXyMhkrVNSA24viinondePALJwGZ4EFY56e/+e
 2/fTuPtWTNU6PDE7OjTHUfhDErQynhST4Hc3ElcQZDn574zC/ogR4I7EEZ0oc6O5N9u+
 9g8H1zK5BPTNd48GT80gIL02XTUw8/ttZZ65kuj7Wy+NmCBMW/5kru2i+q/ExxTbu+dE
 fpag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qsNviNvSBfzsupGdOT2s8gD9m3BbXa7zKTc0EuR6jLM=;
 b=KIdSL1FtDrox99bAm4VyiVcPBRYfkOqqK6fHCYacX0aCrQJ2lfSf7vBeuT3CBhz6hP
 arQDHhp6YrjfpMMi5p3FkQj4VI1YFd5ELkN2pDfsqhtuykZ5uWll/olK+ld9WC/jDeX3
 AxDK36KAOiXyNDzHQKOj//PjAh6R0ji3lbJQlnO2kA/q1+HcVj0FXtZgmh6XYEIihepn
 9sayzwSVQzxnLP8e9IQgWjJE+TW1MQN4J2e5co6Iuo0Q1MTua57Jmc+0ehrNbFGLEoY5
 RdgNiWu2cXOipJ4l+/VrkB/E9RwjTMd6X24d1X1UiDLQzeb/poCi34pQsX/rOFsM3ARC
 FK0g==
X-Gm-Message-State: AGRZ1gI9n5I1yheDuQ/9cfp5rP1XHfR41wEb/LaHFLTFlTeAD2U55pFp
 EdDjD820lsAVMN1/bLzscJvHF6JoGR78I1xgKnY=
X-Google-Smtp-Source: AJdET5cfui4rLAQROKZd8iBwIp8oPKQMuE2Gv4dVYK1w53rZ7L8UvZGJGWkYJe5RtXrBhcLWcWpsdmhLoGD5p9AF4Lg=
X-Received: by 2002:a67:485:: with SMTP id 127mr5978156vse.54.1541872840057;
 Sat, 10 Nov 2018 10:00:40 -0800 (PST)
MIME-Version: 1.0
References: <4aef7216-726c-f565-5c0f-cebd2aefb46d@wdc.com>
 <CAPweEDySAg6LCTNOKHB2Ax3tJNySi9XQzG4d1msSQQepwDi8Vw@mail.gmail.com>
 <2e5329eff04e2b0bc2433b5d974bf10f@mailhost.ics.forth.gr>
 <CAPweEDz-7oRg2UWPkvTDdfi36Z4PQLAuLdL3-Sy-kmkGEJ=44A@mail.gmail.com>
 <CAP6exYKfhtgXz4nVSwXasicbE+8ZbKwp-15_xGFHfFoK9yi9-g@mail.gmail.com>
 <CAEz=sokxTJk=0EnRnLeG6LkaZiW-Dr4nmz=2JDgZm893NM-adQ@mail.gmail.com>
 <CAPweEDzZGEi87o5bBPeU6c7qHCtCJNcOHL0Uz1uUOPQak56X_Q@mail.gmail.com>
 <CAEz=songRyvbEgYfxKP0WyuAdZnKsqfrCk8CCxSsCGGHeUFixA@mail.gmail.com>
 <CAPweEDw=5sy5d-LA5hLQEu+oyf9T5GCkMxDEut9q06zff_-9qQ@mail.gmail.com>
In-Reply-To: <CAPweEDw=5sy5d-LA5hLQEu+oyf9T5GCkMxDEut9q06zff_-9qQ@mail.gmail.com>
From: Samuel Falvo II <sam.falvo@gmail.com>
Date: Sat, 10 Nov 2018 10:03:19 -0800
Message-ID:
 <CAEz=sokGf2_kXALgz0gOxMFv5fhQAubaUjkvH31MQaeHm5bcPA@mail.gmail.com>
Subject: Re: [sw-dev] SBI extension proposal v2
To: Luke Kenneth Casson Leighton <lkcl@lkcl.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181110_100052_181550_7A279D8E 
X-CRM114-Status: UNSURE (   6.72  )
X-CRM114-Notice: Please train this message.
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
Cc: mark.rutland@arm.com, hch@infradead.org, Damien.LeMoal@wdc.com,
 olof.johansson@gmail.com, alankao@andestech.com, "Chang,
 Abner" <abner.chang@hpe.com>, atish.patra@wdc.com,
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@sifive.com>,
 agraf@suse.de, zong@andestech.com, ron minnich <rminnich@gmail.com>,
 sw-dev@groups.riscv.org, paul.walmsley@sifive.com, mick@ics.forth.gr,
 Alistair.Francis@wdc.com, linux-riscv@lists.infradead.org,
 Andrew Waterman <andrew@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181110180319.egMLpvPjTrja9tbFQwNvW3cS1ZRd-YmIhL3N1x0XzxE@z>

On Sat, Nov 10, 2018 at 9:55 AM Luke Kenneth Casson Leighton
<lkcl@lkcl.net> wrote:
>  *snort* yeah.  is that a good enough reason to terminate all and any
> discussion of enhancing a general-purpose generic API that has several
> other beneficial use-cases?  reminds me of the adage "guns don't kill
> people: people kill people".

I think you are misunderstanding what I'm writing.

My tale is one of caution, not prevention.  I'm OK with having a BIOS.
History shows that the problems on the PC platform all started when
the BIOS *disappeared*; when it *stopped* *being* a BIOS.

My claim is that Ron's reaction is, while well-intentioned and has
solid roots in first-hand experience, nonetheless a bit extreme.  Not
having any BIOS at all is, in my estimation, worse than having one
that is 50 years old.

-- 
Samuel A. Falvo II

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
