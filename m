Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6342C433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Oct 2022 16:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=FGev3o03bPHFtOWOBjkRgw4SeuzzpUK/o2GCWZnFk98=; b=B7Q0Ify/41EDOizMZGmE+mW7bw
	w9LHtKyHNMuQW5IDiklnHM6KsOrzwiV3eizeZAMwXDasbysEQJ4K27XPT9i1LQzXDKlNPbFQpRmjC
	LGXsU7okVIAOfkmDsl8ARXIYnJomtOoKr1RhlT5KiuK8ghCoVEs5kiuPE1woKQo+tKw9LbYo3LRIO
	vmhtEmc7fRIlIPivtDaocRTRFP3+Bge0twHo4Oa8lfhPDqS6YyirTwLQqTQGvpoCKBFvxJQSi+uDA
	7iequ5RXurZ4eR2lDV3dm5skday7zWa2FKUm4Bjx2LTw6AnYjSe9XyO6lz5NG9hGPP47tgNm4p3bA
	ZZbg50jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojNL7-00FJmo-G5; Fri, 14 Oct 2022 16:15:13 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojNL3-00FJlv-Df
	for linux-riscv@lists.infradead.org; Fri, 14 Oct 2022 16:15:11 +0000
Received: by mail-pj1-x102f.google.com with SMTP id h12so5371708pjk.0
        for <linux-riscv@lists.infradead.org>; Fri, 14 Oct 2022 09:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g2JTvpWhqdC7QPnQwyHctlYw/8ApcYUns74xbNtPUnI=;
        b=SJObCVvZGvsR0fWiJBmulRy7H15F4leY7XP/P6KqvSm696TWIpfy+1DYQmogCJJMjn
         aEqFWpT280AEUH+Tj06tggn5Yve/69B2hm9d2vcpzEHFk1Cm7rC0DHx+4A5aSnitacmu
         ZYpRHn128TXC2SOQIcai9M+kD1FKNwizEqn7fVszRgz86yVB7/JllTByDNxRgAy0hD3l
         eQA4AlWpOhVuRiW4Tx+0AJfW/duILG7AHjcj0EexlEJMzgSuvKSF4XA77MyzmuGE5r8m
         pg/ae1w6+I78rynt0LtC1zq2Mju79VO06XX3evEDWP9KKNEpT5YGSZbrETwoqXFX5gK3
         0cRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g2JTvpWhqdC7QPnQwyHctlYw/8ApcYUns74xbNtPUnI=;
        b=nvTDVuA5NpVXiGzmyG5e2l8U5othPRPm6rPo1d+E3C+6ddsFnPpynG7/voauRg6zzu
         SthC5gpJEst504QyHLeNI9sY7d1Ge7DuZiP4LI0cnLmZT8S4dmAw0ZBwFBjnf0ff8EoS
         khfnB4fywiqcdBnhn4WFRfrrdxeClnfsZx4LIKCW/KQOxmtZo6EfrucGl21KF1cwhRqD
         TPT25+ND4a8iDjLcs+AIT8LQJoyto9t1D/QRppJ8E75ESDQVbsIbjcn6HvkzkcdYQoWw
         nOUGyw3jgjT9pGizr6qbRMnSjnsz8UEC1a4q392Hld9BzwWT5eoXTVJEf83J0CnM3fLL
         2K4A==
X-Gm-Message-State: ACrzQf1OlTK1uV38WhI0ryzlk1rUtQxn+v7f5OdeZRB2/CrHVquMCjFy
	gDlnRm7wEf44lh6dud5iVkM3NRFFdllCTg==
X-Google-Smtp-Source: AMsMyM4XtFNwAVZg6WcTdFidwPxRhe1eL3SGG1J2/YN0OFidCMN6QNzp4/95krLt2G0FHsvh5Z0odQ==
X-Received: by 2002:a17:902:6b0a:b0:178:9a17:5b89 with SMTP id o10-20020a1709026b0a00b001789a175b89mr5945227plk.113.1665764105482;
        Fri, 14 Oct 2022 09:15:05 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id p184-20020a625bc1000000b005618189b0ffsm1935938pfb.104.2022.10.14.09.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 09:15:04 -0700 (PDT)
Date: Fri, 14 Oct 2022 09:15:04 -0700 (PDT)
X-Google-Original-Date: Fri, 14 Oct 2022 08:51:34 PDT (-0700)
Subject: Re: RISC-V Patchwork
In-Reply-To: <Y0ifX4gYDD0DIkYd@spud>
CC: linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-ec7cf859-caaa-4b72-8dd9-d88e81d6126a@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221014_091509_700065_F6B6B646 
X-CRM114-Status: GOOD (  37.62  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 13 Oct 2022 16:29:35 PDT (-0700), Conor Dooley wrote:
> On Thu, Oct 13, 2022 at 04:14:39PM -0700, Palmer Dabbelt wrote:
>> On Tue, 11 Oct 2022 09:07:45 PDT (-0700), Conor Dooley wrote:
>> > Hey,
>> >
>> > As one or two people have already noticed, we've resurrected the
>> > patchwork for the RISC-V list @
>> > https://patchwork.kernel.org/project/linux-riscv/list/
>> >
>> > The patchwork bot should let people know when their patches have been
>> > applied. Hopefully it'll help people track what the status of their
>> > patches are a little better and try to prevent stuff falling through
>> > the cracks in Palmer's inbox.
>> >
>> > As an FYI, the statuses that are intended to be used are:
>> > - New: No action has been taken yet
>> > - Under Review: The maintainer is waiting for review comments from others
>> > - Changes Requested: Either the maintainer or a reviewer requested
>> >   changes in the patch. The patch author is expected to submit a new
>> >   version
>> > - Superseded: There's a new version of the patch available
>> > - Not Applicable: The patch is not intended for the RISC-V tree
>> > - Accepted: The patch has been applied
>> > - Rejected: The patch has been rejected, with reasons stated in an
>> >   email
>> >
>> > I reset patchwork and marked all patches as archived so we would have a
>> > fresh start. If your patch has been archived & not applied by the end of
>> > this merge window, feel free to resend it.
>> >
>> > Thanks,
>> > Conor.
>> >
>> > @Palmer: hopefully I did the scissors thing correctly..
>>
>> b4 doesn't like it, but my old scripts just picked up the whole thing as a
>> patch.  I tossed the above bits, LMK if something went off the rails.
>
> I just copied the suggested scissors format from the git-mailinfo man
> page and pasted that. I didn't know this prior to 5 mins ago, but
> `b4 mbox` splits it on the scissors line, into a patch and an email
> inside the mbox - but for w/e reason, `git am` (or `b4 shazam`) then
> seems to try and apply the email instead of the patch? Or else pasting
> the patch into mutt was a terrible idea? Maybe it's worth mentioning to
> Konstantin that things get messed up here, I'll do it tomorrow if I
> remember.

If the man pages suggest doing this but the tools fail then it's worth 
fixing something, even if it's just the man page ;)

> Unlikely I'll ever really send many more patches with this format so w/e
> at the end of the day.
> Thanks,
> Conor.
>
>>
>> >
>> > -- >8 --
>> > From f886e8a9def4bd3f2fa8a0a4d7e92c94fe72ea72 Mon Sep 17 00:00:00 2001
>> > From: Conor Dooley <conor.dooley@microchip.com>
>> > Date: Tue, 11 Oct 2022 16:49:53 +0100
>> > Subject: [PATCH] MAINTAINERS: add RISC-V's patchwork
>> >
>> > The RISC-V patchwork instance on kernel.org has had some necromancy
>> > performed on it & will be used going forward. The statuses that are
>> > intended to be used are:
>> > - New: No action has been taken yet
>> > - Under Review: The maintainer is waiting for review comments from others
>> > - Changes Requested: Either the maintainer or a reviewer requested
>> >   changes in the patch. The patch author is expected to submit a new
>> >   version
>> > - Superseded: There's a new version of the patch available
>> > - Not Applicable: The patch is not intended for the RISC-V tree
>> > - Accepted: The patch has been applied
>> > - Rejected: The patch has been rejected, with reasons stated in an
>> >   email
>> >
>> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> > ---
>> >  MAINTAINERS | 1 +
>> >  1 file changed, 1 insertion(+)
>> >
>> > diff --git a/MAINTAINERS b/MAINTAINERS
>> > index 8a5012ba6ff9..e2882dc703d8 100644
>> > --- a/MAINTAINERS
>> > +++ b/MAINTAINERS
>> > @@ -17516,6 +17516,7 @@ M:	Palmer Dabbelt <palmer@dabbelt.com>
>> >  M:	Albert Ou <aou@eecs.berkeley.edu>
>> >  L:	linux-riscv@lists.infradead.org
>> >  S:	Supported
>> > +Q:	https://patchwork.kernel.org/project/linux-riscv/list/
>> >  P:	Documentation/riscv/patch-acceptance.rst
>> >  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
>> >  F:	arch/riscv/
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
