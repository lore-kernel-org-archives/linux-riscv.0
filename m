Return-Path: <SRS0=nier=AA=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79B63C433DF
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 19 Jun 2020 01:34:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41CB120773
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 19 Jun 2020 01:34:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nF/lS08N";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="TnyG/qjo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41CB120773
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mnyBIrnucXjD5JasGEDGQEAckoj03t5PdbNPiajQJmM=; b=nF/lS08Nsy+V4fSIPWUbbDImF
	l2Ri1ZsAk3zo2LsVy6HOvHF584m42FSTAyvWxrRvFQyvlL+bS5MhyHJ2WQtUVZsdJPv63EM6FkYsW
	5hxoWlXCg3r/P+RUy2JHbquPNUrXjrEPTExwpt7D2iBKLmPypS5wp/lhD8WzGp7W6uHHx32JT/aHK
	EFiH86PQJDTcRAcK/vybh98nNY5CO04/AkQpKGv6xWYy0uhMamqT1US9HC7ZbnqnkY1m6+AsHW8Tp
	ogb1RYB5ue65mCMThneQR0AFndIuIHB4Uxtm0XFPC0KPVKB2Y3l3thr3RcLCJovG2PrXgPPi2/ewa
	Wug/wk8Tw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jm5v5-0008Bl-0T; Fri, 19 Jun 2020 01:34:15 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jm5v1-0008BG-Sd
 for linux-riscv@lists.infradead.org; Fri, 19 Jun 2020 01:34:13 +0000
Received: by mail-wm1-x341.google.com with SMTP id f185so7593122wmf.3
 for <linux-riscv@lists.infradead.org>; Thu, 18 Jun 2020 18:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mnyBIrnucXjD5JasGEDGQEAckoj03t5PdbNPiajQJmM=;
 b=TnyG/qjo0RAHRQjUcx6Gty6PDkFh59iqCgsaAgn/9KAcWhyHVEV+EQfqif2tN1tFsi
 le4LCUxAD0eC8bOVQvHEflfKUFqAoba7Ma/G02zOfpIkr6sSEQXQcw/rj5LXUZOdAXdB
 qMbOTwa52sVtmHzNdXJtWZlkz/HFY2/aYEnsg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mnyBIrnucXjD5JasGEDGQEAckoj03t5PdbNPiajQJmM=;
 b=Zd6ikWy0dVcTdAgLYD7F6zLzeCWlICRkvlvzwJDP/8hqEdQq+2TmHLK23AcQvjs08S
 +7wPwxydhKOgxQhj840WUxHCqO65HEBQ93Xh7KjTbB4KE/Zm4fM8FvivrLKfCUc/Ls5A
 65GAbFLvbcOVI4lMN1d+oi1iqjOBgi6WvKkgT20/fHW+LyyeiN01O43UtgeGYCCsUczg
 i2j8ILoGiX/E/DFdtoh/HtjwoiO4D8pFSoqz3O2Yq2t6LOOKFLbqTJkg2MPUGPP86aYI
 4Uf4PYW4ybpaH40KzPSDQxchxppwSrY8Fn0IkBM4CXbE5r9fX8OQ2PKnwub6X6IUUw74
 7utA==
X-Gm-Message-State: AOAM532PIgh8Oy0NhXKkx+7/mQbdXcbj7HDd0wk+n5RXSgYsjw1iqssr
 gn69eLfBEglmA3jKo7I3ydA2QtZCGMxPT4o0ouCr4Eg=
X-Google-Smtp-Source: ABdhPJxTPXhqtjt8u5MTrCXhwxcBgV31ivclBpQBVptXJwmVSyw8Kt7CC5gjKA2Pz49o1pAfAE/pWIPOVzBIQ84fFeg=
X-Received: by 2002:a1c:2e0e:: with SMTP id u14mr1074278wmu.55.1592530450229; 
 Thu, 18 Jun 2020 18:34:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200617203732.2076611-1-atish.patra@wdc.com>
 <CANN689EXQsH3C92fe=QHVEZasWmBiMXPoOB=bRLhK2CP-hdKqQ@mail.gmail.com>
 <CANXhq0qtxyx0+4+dVy3c3R2v5DSWaJsFwc7BcwSRGcufoL6eHA@mail.gmail.com>
In-Reply-To: <CANXhq0qtxyx0+4+dVy3c3R2v5DSWaJsFwc7BcwSRGcufoL6eHA@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 18 Jun 2020 18:33:59 -0700
Message-ID: <CAOnJCUJm9YBK1FtY1YuYLgsJhOYzEwmn7386msW9=HddXptMQw@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Acquire mmap lock before invoking walk_page_range
To: Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200618_183411_926161_82A85DEE 
X-CRM114-Status: GOOD (  10.60  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Mike Rapoport <rppt@linux.ibm.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Daniel Jordan <daniel.m.jordan@oracle.com>, Atish Patra <atish.patra@wdc.com>,
 Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Michel Lespinasse <walken@google.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jun 17, 2020 at 7:29 PM Zong Li <zong.li@sifive.com> wrote:
>
> On Thu, Jun 18, 2020 at 8:01 AM Michel Lespinasse <walken@google.com> wrote:
> >
> > On Wed, Jun 17, 2020 at 1:38 PM Atish Patra <atish.patra@wdc.com> wrote:
> > > As per walk_page_range documentation, mmap lock should be acquired by the
> > > caller before invoking walk_page_range. mmap_assert_locked gets triggered
> > > without that. The details can be found here.
> > >
> > > http://lists.infradead.org/pipermail/linux-riscv/2020-June/010335.html
> > >
> > > Fixes: 395a21ff859c(riscv: add ARCH_HAS_SET_DIRECT_MAP support)
> > > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> >
> > Thanks for the fix.
> >
> > Reviewed-by: Michel Lespinasse <walken@google.com>
>
> It also looks good to me. Thanks for the fix.
>
> Reviewed-by: Zong Li <zong.li@sifive.com>
>

Hi Palmer,
Can you include this one in rc2 PR as well ?
Anybody who gets this issue with their rootfs can't use rc1 without
turning off DEBUG_VM.

-- 
Regards,
Atish

