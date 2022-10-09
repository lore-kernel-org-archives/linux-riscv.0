Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FDA8C433FE
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Oct 2022 13:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XQeJrffn/7W2ignnFmIiJBCsThgTFb/+L+yfdo1tSj8=; b=coxAdgNRhQO6Vr
	u7NrgLOmGJ/KdeJGfxknaBbddl1e5ip+Wm92mOO9jU1bwZCDbEJBw5xO31AP4M3i6FI8KZvwaCyJm
	AaeWGn6R0sJTAzpQBRquodLnrnHLHEH+Eig2zhoX31PMQc9joPK9UXbbi1JInVuqlRbpwS31ZduFa
	c0aHOhF19sC6IF6/gKEIyK6cKdQQ5HSqkIv+XfstJOE9vqyJMJ0ZAKIQioEvV9EfbB3No2qwUQ1tF
	F8wGnqKrha7ZNfvp9XWOLOBm66zfHHwg3M2OEkYCDEHMFJgUwx4X+dpFnrrze15UWFQDvYZ2W4tpY
	+6RofLjMkFL+/6+nyX1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohWQ3-00FdgF-Pc; Sun, 09 Oct 2022 13:32:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohWQ1-00Fdfv-4U
	for linux-riscv@lists.infradead.org; Sun, 09 Oct 2022 13:32:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C981060B36;
	Sun,  9 Oct 2022 13:32:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14530C433C1;
	Sun,  9 Oct 2022 13:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665322355;
	bh=omCebbcKQnMnAcqHWnEzUn52/ycTpB7PBIc6ozNBYWI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cMimcXVPkDMNqnBaRfDxgNYSWIiEJImJro4rFNQtXruv3/PEKSg0K/oqREzNBNbPR
	 HBMu89SWltVCoQZtZXMXZFRpHrf2FDAS2pwFJtZIUwtX0b/3UjS+3xfLjU6ewQk+QI
	 2tdWD8rUPJE8RMbQGfOzS5xh0kgI8YM7cjkA+ZzwF3wV2CLk1Hy5D6ilKamW6O9q62
	 cVAjJXMC6799bpbpH2i9XfhciWdrjAOauCW1qBv0woiqPOZTZblH2N8lnJOfPtgs7w
	 DJz4xZosLDZEuSOmvG8mzjAWfvIjvAX74MO9FuWEGLPTyRIBgM2fZrizRr2JLHWUiu
	 OE8HRC9FOUnGA==
Date: Sun, 9 Oct 2022 14:32:31 +0100
From: Conor Dooley <conor@kernel.org>
To: Qinglin Pan <panqinglin2020@iscas.ac.cn>
Cc: atishp@atishpatra.org, alex@ghiti.fr, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Subject: Re: [PATCH v1 1/1] riscv: mm: add missing memcpy in kasan_init
Message-ID: <Y0LNb6lJ2eQ7/O21@spud>
References: <CAOnJCU+GHzFSzSdvZKBrFeF4WqPvC5w0r1f4r3S8hLbOagPKgA@mail.gmail.com>
 <20221009083050.3814850-1-panqinglin2020@iscas.ac.cn>
 <Y0KwwUNpfC+JOhQR@spud>
 <2de46c94-0792-7a4b-5bcd-d57fffe1160c@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2de46c94-0792-7a4b-5bcd-d57fffe1160c@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221009_063237_254543_7D1CABAB 
X-CRM114-Status: GOOD (  18.83  )
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

On Sun, Oct 09, 2022 at 09:25:31PM +0800, Qinglin Pan wrote:
> On 10/9/22 7:30 PM, Conor Dooley wrote:
> > On Sun, Oct 09, 2022 at 04:30:50PM +0800, panqinglin2020@iscas.ac.cn wrote:
> > > From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
> > > 
> > > Hi Atish,
> > > 
> > > It seems that the panic is due to the missing memcpy during kasan_init.
> > > Could you please check whether this patch is helpful?
> > 
> > If this does solve the problem it would be:
> > Fixes: 8fbdccd2b173 ("riscv: mm: Support kasan for sv57")
> > right?
> > 
> > Thanks,
> > Conor.
> > 
> 
> Hi Conor,
> 
> Thanks a lot for notification!
> I have change the title and resend it.

Unfortunately I was not suggesting a new title for the patch.. A
"Fixes:" tag goes as part of the sign off block to show what commit a
given patch fixes. Your original title looks fine to me.

Thanks,
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
