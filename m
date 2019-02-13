Return-Path: <SRS0=7ZJm=QU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA7CBC282C2
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 09:20:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CFE5222C2
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 09:20:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SxbGWxkb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7CFE5222C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GTrKSgtYKuPQGVh2kglCFC+5vrqY0nJJJ65ady2kExo=; b=SxbGWxkbgMpqpQ
	y8gTlNDVLf9fisDsiKhR+8vGFk0KkFPskuPP+cVIgEdwYUsENMZZxj08wwbR+0EDRm1WF8RO5mWt/
	gpxoIDsewx5WQluoOlrNFpQQ8xBQAU5Oyt/qnBnjFTMgM0GE+IIs5qLoibcFJDppjGhfMSfl9Ucab
	3GR5QeLZttw7Y8kZGRG3OFfYhezGq8Y0zQ6uoO73LI0thVd+GZ9aPdPfwdWLuzxYlk3v2c0wofldN
	1Vq+PnDsttUa3/MpVH60UNfp8wQeTm/FwlzfozG9afuLMi7ddhsWUzvmVhU1mg159pTvJZDK5qlcQ
	fsld1pQkyOYF9LDVqDpw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtqiG-0004F6-6U; Wed, 13 Feb 2019 09:20:16 +0000
Received: from mail-lf1-f68.google.com ([209.85.167.68])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtqiD-0003w6-NH
 for linux-riscv@lists.infradead.org; Wed, 13 Feb 2019 09:20:15 +0000
Received: by mail-lf1-f68.google.com with SMTP id t14so1206095lfk.7
 for <linux-riscv@lists.infradead.org>; Wed, 13 Feb 2019 01:20:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=yV3tHrb36nm7qguc30iL89qUkzz5TfCHBJryEVaPhcI=;
 b=slRRB7Xcjv1ojNu4/xqMfZstoC2Os4mBLoNszUQRAPOxyGpZ0ZzTeat103COJ9LPUR
 8B5j+6eahKas2VGS86PM/lYJ5hbRG4fvu3gHSkCOq9E1wy9mShecaTm3L5Q+DJdQgcnQ
 PGCK0GrY5Su1KLQ7QVccjewf90AQSoOTLTIZbYeHmjjg0HpFvQZByBFwu1HEF8poANh9
 6zRxwmZ6b1Ye2z4/b7Q2dXeFR4kudF6tQ31hZH+iSy7AoNTg2RYQVXMDbRmjmAteU1xm
 L2xBeRTnsapeTSLwmiFcOlhweKOza0v06oBauWGbjCeIvalo2wGwzTxET44u+8hUkQwC
 2cqg==
X-Gm-Message-State: AHQUAubh1JxnSk3ODC7i35LILmRqvdsTaNQqJdMPxB2gOEioA/YEOpv8
 vRjr0mFqfsYaqaeFj6cp+Mo=
X-Google-Smtp-Source: AHgI3IbnucUO9uKFA3Qc3Zzc/Gj1xrQpGuOkq3oZefH7xWneDAvgdVL26JtR4wyuMJIWBKMb6kgMVA==
X-Received: by 2002:a19:ec0e:: with SMTP id b14mr1551184lfa.151.1550049611358; 
 Wed, 13 Feb 2019 01:20:11 -0800 (PST)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se.
 [85.230.190.116])
 by smtp.gmail.com with ESMTPSA id t18sm129617ljc.54.2019.02.13.01.20.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 13 Feb 2019 01:20:10 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.91)
 (envelope-from <johan@kernel.org>)
 id 1gtqi3-0007eO-DY; Wed, 13 Feb 2019 10:20:04 +0100
Date: Wed, 13 Feb 2019 10:20:03 +0100
From: Johan Hovold <johan@kernel.org>
To: Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH v2 0/6] Fixmap support and MM cleanups
Message-ID: <20190213092003.GF28278@localhost>
References: <20190119132650.9978-1-anup.patel@wdc.com>
 <mhng-3acc6cf0-4c86-4929-a653-11e87d0c6b48@palmer-si-x1c4>
 <CAAhSdy25GUFWfkQHBDy6HysVCVFOpv-ZLY6vr+oH34XbqScYFQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy25GUFWfkQHBDy6HysVCVFOpv-ZLY6vr+oH34XbqScYFQ@mail.gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190213_012013_756016_7130BA4F 
X-CRM114-Status: GOOD (  19.73  )
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
Cc: Palmer Dabbelt <palmer@sifive.com>, Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <Atish.Patra@wdc.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Feb 13, 2019 at 01:51:43PM +0530, Anup Patel wrote:
> On Wed, Feb 13, 2019 at 4:45 AM Palmer Dabbelt <palmer@sifive.com> wrote:
> >
> > On Sat, 19 Jan 2019 05:27:53 PST (-0800), Anup Patel wrote:
> > > This patchset does:
> > > 1. Moves MM related code from kernel/setup.c to mm/init.c
> > > 2. Implements compile-time fixed mappings

> > >  arch/riscv/Kconfig               |   3 +
> > >  arch/riscv/include/asm/fixmap.h  |  44 +++++++++++
> > >  arch/riscv/include/asm/pgtable.h |   1 +
> > >  arch/riscv/kernel/setup.c        | 114 ++++++----------------------
> > >  arch/riscv/mm/init.c             | 124 ++++++++++++++++++++++++++++++-
> > >  5 files changed, 189 insertions(+), 97 deletions(-)
> > >  create mode 100644 arch/riscv/include/asm/fixmap.h
> >
> > I'm getting some git issue when trying to merge the third patch via email
> >
> >     $ mhng-pipe-show_stdout 4 | git am -s
> >     Applying: RISC-V: Move setup_bootmem() to mm/init.c
> >     error: patch failed: arch/riscv/kernel/setup.c:163
> >     error: arch/riscv/kernel/setup.c: patch does not apply
> >     Patch failed at 0001 RISC-V: Move setup_bootmem() to mm/init.c
> >     Use 'git am --show-current-patch' to see the failed patch
> >     When you have resolved this problem, run "git am --continue".
> >     If you prefer to skip this patch, run "git am --skip" instead.
> >     To restore the original branch and stop patching, run "git am --abort".
> >
> > can you send a PR with a signed tag?  I'll include this as part of the next
> > merge window.
> >
> > Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
> 
> Okay, I will prepare a PR with following patchsets:
> 1. Fixmap support and MM cleanups (Author: Anup Patel)
> 2. riscv: minor fixes and cleanups (Author: Johan Hovold)
> 3. RISC-V related changes from "Various SMP related fixes" (Author: Atish Patra)
> 
> All above patchsets touch same source files so this will
> help you.

I'd suggest keeping these separate. Your series failed to apply, and it
looks like you've now posted a v4 to address that.

If your series is merged before mine, I'm sure any conflicts are
trivial, or I can always respin.

Atish's series might need another revision, so that one should not be
included either.

Johan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
