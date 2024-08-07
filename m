Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1AF3C52D6F
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Aug 2024 19:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kEfjxMHHkCxpkxqYn6f4f5OuJ1WyUQGPtI+cmftVqXM=; b=eWRu9kO/73h4UK
	tBReNSHbnisDLHIPz2M3xON7F2pxnH6zbPAdbSAS0zicFwiP+cE1FlzZak191bP8cZsNjHC10Oq7P
	BzrVmalBTEnGnjCw9ITNoroAiawgN2BvmyFAZoxldHUknDqk0p7nlbMsIAE6Ufp7VRmbU85tvCGse
	/TKMRTNkgKxuD7bogR5tA83tjtqWerZvnpwl7Ujq08GuRfuM4fTD2wuD67ldyOaKbPUCPEKQqsWs+
	ZTI9NcA7vTQHNxEiQPzveafL+azpHc2D58KPEwfopv/B+Eb/40Dh9t6Keo0qKbQKm+Y3oLFmXxbfM
	7DxBdGdmv7MloY8SLNrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbmi7-000000067BR-15jt;
	Wed, 07 Aug 2024 19:52:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbmi3-000000067Ao-21vp
	for linux-riscv@lists.infradead.org;
	Wed, 07 Aug 2024 19:52:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 75B206120C;
	Wed,  7 Aug 2024 19:52:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29113C32781;
	Wed,  7 Aug 2024 19:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723060354;
	bh=90hg2w0DIVjtDmSndjGo+vZRCd48QERRtZw9Ixqi3aw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J2IB9ZMriyNqe+LfPaLpCetP9AUeViGneQdhlgXzghgFsNT6WcP3LyRvNO1FFgjDz
	 L+c1sQcv+T+fkpVmLPNYJdOCYob8QMHF3Aw6T4ge5D0OOMX2lUHBJ1nFFJGdj0+rfV
	 QnyeqMXf/C+Gt6nX5HduM7PyhIM0QL51/quL2IyBuvQVIgYIHKo66xRLgEeUgyqQVf
	 BffivUb40DnrXkX2ph96A6fzcYgUkGP+Cy6axuIC1xPGcX7Ig+k+Fu7sPJHFHDlwvO
	 AZTFW1Lho7suUagD00eIZ2T9E1jDA+Ap9izWGfjdeMEYVinAjUJJCd3omLsJGkSTef
	 RSszIwlfhKldw==
Date: Wed, 7 Aug 2024 12:52:33 -0700
From: Kees Cook <kees@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: alex@ghiti.fr, sorear@fastmail.com, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org, ebiederm@xmission.com,
	damien.lemoal@wdc.com, gerg@linux-m68k.org, wbx@openadk.org
Subject: Re: [PATCH] binfmt_flat: Fix corruption when not offsetting data
 start
Message-ID: <202408071251.655A07AC@keescook>
References: <3659aee7-8baf-442f-aa81-22bb6fd1a11d@ghiti.fr>
 <mhng-60ec65b8-04ef-4535-94b9-843386bd8922@palmer-ri-x1c9>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-60ec65b8-04ef-4535-94b9-843386bd8922@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240807_125235_591686_5A07F671 
X-CRM114-Status: GOOD (  25.84  )
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

On Wed, Aug 07, 2024 at 07:05:11AM -0700, Palmer Dabbelt wrote:
> On Wed, 24 Apr 2024 13:44:31 PDT (-0700), alex@ghiti.fr wrote:
> > Hi Stefan,
> > 
> > On 26/03/2024 04:20, Stefan O'Rear wrote:
> > > Commit 04d82a6d0881 ("binfmt_flat: allow not offsetting data start")
> > > introduced a RISC-V specific variant of the FLAT format which does not
> > > allocate any space for the (obsolescent) array of shared library
> > > pointers. However, it did not disable the code which initializes the
> > > array, resulting in the corruption of sizeof(long) bytes before the DATA
> > > segment, generally the end of the TEXT segment.
> > > 
> > > Use CONFIG_BINFMT_FLAT_NO_DATA_START_OFFSET to guard initialization the
> > > shared library pointer region so that it will only be initialized if
> > > space is reserved for it.
> > > 
> > > Fixes: 04d82a6d0881 ("binfmt_flat: allow not offsetting data start")
> > > Signed-off-by: Stefan O'Rear <sorear@fastmail.com>
> > > Tested-by: Waldemar Brodkorb <wbx@openadk.org>
> > > ---
> > >   fs/binfmt_flat.c | 2 ++
> > >   1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/fs/binfmt_flat.c b/fs/binfmt_flat.c
> > > index c26545d71d39..70c2b68988f4 100644
> > > --- a/fs/binfmt_flat.c
> > > +++ b/fs/binfmt_flat.c
> > > @@ -879,6 +879,7 @@ static int load_flat_binary(struct linux_binprm *bprm)
> > >   	if (res < 0)
> > >   		return res;
> > > 
> > > +#ifndef CONFIG_BINFMT_FLAT_NO_DATA_START_OFFSET
> > >   	/* Update data segment pointers for all libraries */
> > >   	for (i = 0; i < MAX_SHARED_LIBS; i++) {
> > >   		if (!libinfo.lib_list[i].loaded)
> > > @@ -893,6 +894,7 @@ static int load_flat_binary(struct linux_binprm *bprm)
> > >   				return -EFAULT;
> > >   		}
> > >   	}
> > > +#endif
> > > 
> > >   	set_binfmt(&flat_format);
> > > 
> > 
> > I have this fix on my list for quite some time, will you respin a new
> > version for 6.9?
> 
> IIRC we asked on IRC and Sorear wasn't going to respin the patch, so unless
> someone else wants to pick it up I think it's just going to get lost.

I took a look at this and sent a v2 just now.

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
