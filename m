Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FBBFC433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Mar 2022 06:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l8ZNfIJXfiDtHuJwIzWQriGyY60qGz6ahbqeE/ab2p8=; b=BlTc9dZ8PSTCIr
	lfiXhTOpVsoif4TldoaUalze9xvyF5uy/0reBbRWweFjMW5Ko6RPASu/Q76y4JqZqS+f8Wi93/IFC
	cThIkv3SI7AW73xqmd03NvowypyqKD+zdG1ZRHBt7JgtNboshSk7b2a2UgOKrnW1r1rXKxZvotXJv
	ZAQsr7p24gf+tx0sDQshYw8uVm5pfIdAXjP5jy1JdlYgj2dSAS8ZjMPU+ua8FRIVHlxJ0wxfzlRA9
	j5k8M8clvRcIx2b3pxdNmk5A7I1e3oSTJmHb9slMnKfacK1cgQhODT7pw0w+tlDdS6sQbfPCrUt1J
	7dl7/mWPL6MfaeeULqyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQ1ls-008fuZ-QA; Fri, 04 Mar 2022 06:50:36 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQ1lp-008ftH-GM
 for linux-riscv@lists.infradead.org; Fri, 04 Mar 2022 06:50:35 +0000
Received: by mail-yb1-xb36.google.com with SMTP id h126so15100854ybc.1
 for <linux-riscv@lists.infradead.org>; Thu, 03 Mar 2022 22:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YB5qEmuKhAanV+FpNSlj1yed6eK8v3cVvYZ8G9Owa7w=;
 b=aZg+2iMGgQW8iWA+GwpzgT7u47ZoULSbtogi5w+NPDNkeeufl1BcMckfLRG4Ln4UDh
 wg3PfN1g8aJSGSrCGNipNX4vl7vzyrRvs4OE2rspuGPwBdWX3ydMgogy+BQaH5FacUz6
 GONgFcIW3Kd2JKidr3QrOj+Czo6ps0gP75tSGhLNhjsb2fj93roxPZISTOfO6FwxHsD7
 ThOgeOJ4IkE4SxHOBYbw6/jO+l29WyEAuWYHtSO1X9a/buOB9YCAVHgHhxBBOMcumNbD
 J2qoikblMd0JlsVGYSr8qFMkN1ZBryghLM4+kq/CLFMg15foKgvtJG7D4KDdXrwcF1C7
 nsvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YB5qEmuKhAanV+FpNSlj1yed6eK8v3cVvYZ8G9Owa7w=;
 b=lSyuiPvSyd39aE0/+yoXPEzhLl7/YZPel+KV1jbbsBKWvhSpJ0Pn2N0KfED/c6R7cJ
 LV5Yw+L2nsXIJYkVZoUB+JLSSNRjAqEK/eYzqiFFeqojI26kXueatsl/6sAdnwkfwtfR
 9Oq8F++nKBLJvtveh348xSbrxtzak/fgeuK2evCPCFLWEqdzWhEuHyGYvkrNUbMNqjmA
 XFWVfseweSA3TYGLKsO+JS0nDVR+scr85cFFfoCEhRfiiWFp/+vyw8tO6EWfmj66I/Hg
 CS4sF2h6fcWwRuRJAzr3aIRFFLQNcYdbHdKJLI0qvZ1s/dXEy3eCL/YkffLbWC+HnHEG
 L54w==
X-Gm-Message-State: AOAM5309Jmzp/qUULBpHNlubC0rZ+Y3OhZCO9jeIhGFxonYC5V/3Sxuo
 6rl4SUsBsIEbUZHuix81pTd6266j5ARM75TdFmGcBw==
X-Google-Smtp-Source: ABdhPJzQyScoAaVC1AU6ZJm65+LyZGMTi/iBiQLP+vQgl8QuoGMgMj6iDSXTa0l3vVbd72s+aYtRxJnSxffYOdvXbUQ=
X-Received: by 2002:a25:b004:0:b0:621:f386:f10a with SMTP id
 q4-20020a25b004000000b00621f386f10amr35919324ybf.314.1646376631614; Thu, 03
 Mar 2022 22:50:31 -0800 (PST)
MIME-Version: 1.0
References: <20220302023048.6140-1-vincent.chen@sifive.com>
 <20220302023048.6140-3-vincent.chen@sifive.com>
 <529535828.117301.1646239106382.JavaMail.zimbra@efficios.com>
 <CABvJ_xiSreWvQ5c+_XW8RWSWUvx69qNc7pwrKVWspg0C9Sy2NQ@mail.gmail.com>
 <214245560.121082.1646344238921.JavaMail.zimbra@efficios.com>
In-Reply-To: <214245560.121082.1646344238921.JavaMail.zimbra@efficios.com>
From: Vincent Chen <vincent.chen@sifive.com>
Date: Fri, 4 Mar 2022 14:50:20 +0800
Message-ID: <CABvJ_xjZ+jdNCrnFvDaP=4qczstMv=PbVemN6VA7MiNWbFa+Zw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] rseq/selftests: Add support for RISC-V
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220303_225033_603466_83950DD8 
X-CRM114-Status: GOOD (  18.60  )
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

On Fri, Mar 4, 2022 at 5:50 AM Mathieu Desnoyers
<mathieu.desnoyers@efficios.com> wrote:
>
> ----- On Mar 3, 2022, at 2:16 AM, Vincent Chen vincent.chen@sifive.com wrote:
>
> > On Thu, Mar 3, 2022 at 12:38 AM Mathieu Desnoyers
> > <mathieu.desnoyers@efficios.com> wrote:
> >>
> [...]
>
> >> > +#if __ORDER_LITTLE_ENDIAN__ == 1234
> >>
> >> I think we'll want to standardize on this for endianness checking (same as
> >> the updated uapi rseq.h):
> >>
> >> #if defined(__BYTE_ORDER) ? (__BYTE_ORDER == __LITTLE_ENDIAN) :
> >> defined(__LITTLE_ENDIAN)
> >>
> >> We may have to change rseq-mips.h in the rseq selftests to do the same as well
> >> rather than
> >> using "# ifdef __BIG_ENDIAN".
> >>
> >
> > OK, I can follow it. However, I found the endianness checking in
> > include/uapi/linux/rseq.h is
> > #if (defined(__BYTE_ORDER) && (__BYTE_ORDER == __BIG_ENDIAN)) ||
> > defined(__BIG_ENDIAN)
> >
> > It is a little different than what you mentioned early. Should I
> > follow the format in include/uapi/linux/rseq.h? or both formats are
> > OK?
> >
>
> The form "#if (defined(__BYTE_ORDER) && (__BYTE_ORDER == __BIG_ENDIAN)) || defined(__BIG_ENDIAN)
> is completely buggy. Don't use that.
>
> I've sent the fix to Peter to remove the offending #if here:
>
> https://lore.kernel.org/lkml/1445357149.71067.1643137248305.JavaMail.zimbra@efficios.com/T/#mbbad3961494feefb98cb6d092879e3ea41b33df8
>
> Please use the correct non-bogus form instead:
>
> #if defined(__BYTE_ORDER) ? (__BYTE_ORDER == __LITTLE_ENDIAN) : defined(__LITTLE_ENDIAN)
>
> Thanks,
>
> Mathieu
>

I understood. By the way, IIUC, the __BYTE_ORDER and __LITTLE_ENDIAN
are defined in the glibc endian.h. However, I find that no file in the
rseq folder includes the endian.h. Does it means I should include
<endian.h> in the rseq-riscv.h?

Thanks,
Vincent
>
> --
> Mathieu Desnoyers
> EfficiOS Inc.
> http://www.efficios.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
