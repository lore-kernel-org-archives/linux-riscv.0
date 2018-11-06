Return-Path: <SRS0=W42x=NR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3E62C32789
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  6 Nov 2018 21:25:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3A87206BA
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  6 Nov 2018 21:25:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Wf9TPRQj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="euAJIe9M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3A87206BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jht227SOR5yuATyrGXGXz6uMs/ePRV8d6uZbl8ThV9s=; b=Wf9TPRQj9n9MBa
	FFpy2iACX17txMJqLeQQmq7wnMvmA0F20wsHcwox2hOcAuD3v8rGKXbLYnPd5y1LLk1pip7hVV0G6
	1RTKb32nb5lF7XsQxA3F/3YFDdM9hYDS1a2HuTBjo1y7F6oZfxTEtnyjthn1ZGD6U/H5rw1lMqf/N
	ma30NY4wvYE6VbNaufdekhLqT4w2GQmoIKhgtdoVBSTpG5KnL7Dlu+1Ig7MFfM6SrxYFZn6upN/Yf
	1g/XEN19iNyyHIuY0Fm7H7wrpov7TpwSm2ulxBWZCyn7fz+ww87oXu9v6ajgJ1auBSRE4UYQDtrmy
	ZO9lqe+6xBfRox7hC5Pw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gK8r5-0002bz-8l; Tue, 06 Nov 2018 21:25:47 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gK8r1-0002b9-Pm
 for linux-riscv@lists.infradead.org; Tue, 06 Nov 2018 21:25:45 +0000
Received: by mail-ot1-x344.google.com with SMTP id c32so12862332otb.8
 for <linux-riscv@lists.infradead.org>; Tue, 06 Nov 2018 13:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6Fuve3pXzZ2+HQbAzrYsq43N10dVgg4dVpwsKvp6UQw=;
 b=euAJIe9MTPuRD+2ksa5bVtfQuxADI2Z26U8PWtLUrLf2U/JHm5kW+XBbn1oCo7aw8I
 ECiyQmNeY+xy3keAQlz0lzh1mAvZl92pshsQ1X5UJszj0uz+hphkpP1Tr63lGguW5cYP
 VdmzIKFg4X58fQI+icUh1eYjnSwZ3K4zGbtkcIQz56NlffDyProJW1X7of0L8nCmn3oY
 hPC0b2bYgHp8DnIHLdpfiTZecvT8Z/MWbCsmjFsG9c20ZxrCZSstlG2+6Jak4Xz1X/aH
 NPwTKPuajXemwQ2Y14Z8ORi46Mxgpoe3/E2voYlbp+hR9XjSRxpiReZLLArc+dBYkjk2
 a6HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6Fuve3pXzZ2+HQbAzrYsq43N10dVgg4dVpwsKvp6UQw=;
 b=i28PYlAUJl9Qny3DmkjXi8Xh74jBUyjHMi8ycpCvcVOUecQMEryZdd+cvqxmek60hW
 MIU/JpvixpXcJovqKA2Pu2+3btWEWXEEQpBbS/lPd8kdD/v0wDEEysmCqlvW5YqSKJsD
 S/bl5nAX67QsU6DYQGY0+kADKyVxUI+9h/4ATWtHOaTJKgPa8A2W3YKtaxjmBJjlZOm7
 bu48tKZHe88WvfkZdqB+3+RLhuEyO40Jg6xlk4rog5vKQT7ixI1K9m8ZsOW2TqGC0QNE
 xtT1W8IasnCVTPeLumscZe69q7LbWSZrRwArepnaM+XFW71n/F2DCHqUMNQCyQ7eOs9r
 GLDg==
X-Gm-Message-State: AGRZ1gJdMl9AEIXo3DT4F9E/faC2iZhLXD3A/PHnYWQ2dDgIkmW6HmTm
 6XP0oBbmi+jvHBHLFfSLEhiSPBoHv9MOxVd2s6U=
X-Google-Smtp-Source: AJdET5fO81U8WFWLm1XEpwNJ0RkiqNhf+rJDVjIfTFMv13mlhdRVywiILE82AydBZGGXYh3Cwj29So4+EZxDVRgxcZc=
X-Received: by 2002:a9d:dc3:: with SMTP id 61mr8355261ots.345.1541539532360;
 Tue, 06 Nov 2018 13:25:32 -0800 (PST)
MIME-Version: 1.0
References: <20181029104854.17432-1-david.abdurachmanov@gmail.com>
 <CAHC9VhSaGo0BmX5AsTcnppiVz2Lz8BFkjRA0jg_uuPix3Ziiog@mail.gmail.com>
In-Reply-To: <CAHC9VhSaGo0BmX5AsTcnppiVz2Lz8BFkjRA0jg_uuPix3Ziiog@mail.gmail.com>
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
Date: Tue, 6 Nov 2018 22:25:20 +0100
Message-ID:
 <CAEn-LTqQgQkA1XyihEg0MpADLPQADf3Ej2noUp29UtbcEaf0RA@mail.gmail.com>
Subject: Re: [PATCH 0/2] riscv: add audit support
To: Paul Moore <paul@paul-moore.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181106_132543_835990_3E336603 
X-CRM114-Status: GOOD (  23.63  )
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
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@sifive.com>,
 linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu, linux-audit@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181106212520.Aai_6lOhZ2JkfAOMc77HWzMty7N-zdylr8viIzOX1pM@z>

On Tue, Nov 6, 2018 at 9:06 PM Paul Moore <paul@paul-moore.com> wrote:
>
> On Mon, Oct 29, 2018 at 6:49 AM David Abdurachmanov
> <david.abdurachmanov@gmail.com> wrote:
> > This patchset adds system call audit support on riscv (riscv32 &
> > riscv64).
> >
> > The pachset was prepared on top of v4.19 tag.
> >
> > audit-userspace changes were submitted. See:
> > https://github.com/linux-audit/audit-userspace/pull/73
> >
> > Tested the following manually:
> > - auditctl (checked several different example rules from internet)
> > - aulast
> > - aulastlog
> > - ausearch
> > - ausyscall
> > - aureport
> > - autrace (compared some syscalls to strace: order and return
> >   value/input arguments seem to be correct)
> > - /proc/self/loginuid (required by DNF [package manager])
> >
> > I looked into audit-testsuite and with some adjustments results are:
> >
> > Failed 4/14 test programs. 19/88 subtests failed.
>
> I realize that the test suite failures are likely not due to your
> code, but rather shortcomings in the test suite itself, but I think it
> is important to resolve these problems before we commit the kernel
> changes.
>
> You mention Fedora 29/RISCV below, is that the distro you are using
> for testing?  Also, are you using a stock kernel config from the
> distro or your own?
>
> > The failing tests were due to missing CONFIG_IP_NF_MANGLE ...
>
> Assuming a general purpose like Fedora, that seems like an odd
> omission.  Any chance you can rebuild your kernel with the mangle
> table?

When we build Fedora, the kernel is not built in a standard way. It's only
build statically and contains minimal setup. We also don't do loadable
kernel modules, because there wasn't support for it months ago. It's
not tested yet by us.

I did rebuild with CONFIG_IP_NF_MANGLE, but I think, there was more
stuff missing. Have to look again.

I am experimenting on building kernel in normal Fedora way, but there
are some issues right now. It also takes 12-24 hours for a single attempt.

>
> > ... 'id -Z' not printing categories (don't know why) ...
>
> Are you seeing the MLS/MCS sensitivity level, s0, or are you not
> seeing any of the MLS/MCS fields?

I boot my VM "selinux=1 enforcing=0".

[root@fedora-riscv ~]# semanage login -l

Login Name           SELinux User         MLS/MCS Range        Service

__default__          unconfined_u         s0-s0:c0.c1023       *
root                 unconfined_u         s0-s0:c0.c1023       *
[root@fedora-riscv ~]# id -Z
unconfined_u:unconfined_r:unconfined_t:s0

>
> > ... not having loadable kernel module support enablled ...
>
> Much like the netfilter config, any chance you can enable this in your kernel?

Experimenting, not sure if it works yet.

>
> > ... and syscall_socketcall not being relevant for new arches.
>
> We will probably need to make that ABI dependent in the test suite.
>
> > audit-testsuite with adjustments:
> > https://github.com/davidlt/audit-testsuite/tree/riscv64
> >
> > Depends on:
> > [PATCH 1/2] Move EM_RISCV into elf-em.h
> > http://lists.infradead.org/pipermail/linux-riscv/2018-October/001885.html
> >
> > This should solve DNF issues in Fedora 29/RISCV.
>
> --
> paul moore
> www.paul-moore.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
