Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE939C43334
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jun 2022 17:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:
	In-Reply-To:Date:References:Cc:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=TsuHsu8hdoUiC5k5b084O45WApgQ4OwDyrRHc8O6nVY=; b=bqUtFi/8a9yhRLYfHLXSgvNxgB
	fyxLX4CkFGZQJyMo1M4+BEjxKntxEqBKMSgVAQkzglEGP3wdgylynFT+6CwCUeeFaScR3IsE4Q0Rk
	7d/7gIXbgWsQxbRrSUYUpL90qr3lgULwakLX0tUag9fEj1R7y/JERWkVECZRTAzko2gnTyxtjIKuU
	Si2WSXiCvTkAjKM54jIWlpgSnkUgx0djCaBzoKqn1u2mG/SIoZwMcUylCblA8LDM9Xx72ED1AhYpS
	8+QaP28OElbTRHf+2Tc7f5lSNZjK99ckXIfSbR4HrtagGR/YPdVAU3zBR5eqgKQ7MJOrDDv9O7B/G
	TUgOgRhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6yMB-000wdF-4G; Thu, 30 Jun 2022 17:53:35 +0000
Received: from out02.mta.xmission.com ([166.70.13.232])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6yM8-000wZ1-6G
	for linux-riscv@lists.infradead.org; Thu, 30 Jun 2022 17:53:33 +0000
Received: from in02.mta.xmission.com ([166.70.13.52]:44732)
	by out02.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1o6yLn-0020mB-0Z; Thu, 30 Jun 2022 11:53:11 -0600
Received: from ip68-227-174-4.om.om.cox.net ([68.227.174.4]:58068 helo=email.froward.int.ebiederm.org.xmission.com)
	by in02.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1o6yLl-001wdx-Pt; Thu, 30 Jun 2022 11:53:10 -0600
From: "Eric W. Biederman" <ebiederm@xmission.com>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Benjamin LaHaise <bcrl@kvack.org>,  Alexander Viro
 <viro@zeniv.linux.org.uk>,  Kees Cook <keescook@chromium.org>,  Dan
 Williams <dan.j.williams@intel.com>,  Matthew Wilcox
 <willy@infradead.org>,  Jan Kara <jack@suse.cz>,  Jeff Layton
 <jlayton@kernel.org>,  Chuck Lever <chuck.lever@oracle.com>,  Jens Axboe
 <axboe@kernel.dk>,  Pavel Begunkov <asml.silence@gmail.com>,  Thomas
 Gleixner <tglx@linutronix.de>,  Paul Walmsley <paul.walmsley@sifive.com>,
  Palmer Dabbelt <palmer@dabbelt.com>,  Albert Ou <aou@eecs.berkeley.edu>,
  Nathan Chancellor <nathan@kernel.org>,  Nick Desaulniers
 <ndesaulniers@google.com>,  Tom Rix <trix@redhat.com>,
  linux-aio@kvack.org,  linux-fsdevel@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-mm@kvack.org,
  nvdimm@lists.linux.dev,  io-uring@vger.kernel.org,
  linux-riscv@lists.infradead.org,  llvm@lists.linux.dev,  Ira Weiny
 <ira.weiny@intel.com>
References: <20220630163527.9776-1-fmdefrancesco@gmail.com>
Date: Thu, 30 Jun 2022 12:38:08 -0500
In-Reply-To: <20220630163527.9776-1-fmdefrancesco@gmail.com> (Fabio M. De
	Francesco's message of "Thu, 30 Jun 2022 18:35:27 +0200")
Message-ID: <8735fmqcfz.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-XM-SPF: eid=1o6yLl-001wdx-Pt;;;mid=<8735fmqcfz.fsf@email.froward.int.ebiederm.org>;;;hst=in02.mta.xmission.com;;;ip=68.227.174.4;;;frm=ebiederm@xmission.com;;;spf=softfail
X-XM-AID: U2FsdGVkX19nGDcBXv1cJKDV99uQtYu50l8eqi94dLE=
X-SA-Exim-Connect-IP: 68.227.174.4
X-SA-Exim-Mail-From: ebiederm@xmission.com
Subject: Re: [PATCH] fs: Replace kmap{,_atomic}() with kmap_local_page()
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in02.mta.xmission.com)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_105332_266197_F350C7EF 
X-CRM114-Status: GOOD (  22.56  )
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

"Fabio M. De Francesco" <fmdefrancesco@gmail.com> writes:

> The use of kmap() and kmap_atomic() are being deprecated in favor of
> kmap_local_page().
>
> With kmap_local_page(), the mappings are per thread, CPU local and not
> globally visible. Furthermore, the mappings can be acquired from any
> context (including interrupts).
>
> Therefore, use kmap_local_page() in exec.c because these mappings are per
> thread, CPU local, and not globally visible.
>
> Tested with xfstests on a QEMU + KVM 32-bits VM booting a kernel with
> HIGHMEM64GB enabled.

Can someone please refresh my memory on what is going on.

I remember there were limitations that kmap_atomic had that are hard to
meet so something I think it was kmap_local was invented and created
to be the kmap_atomic replacement.

What are the requirements on kmap_local?  In copy_strings
kmap is called in contexts that can sleep in page faults so any
nearly any requirement except a thread local use is invalidated.

As you have described kmap_local above it does not sound like kmap_local
is safe in this context, but that could just be a problem in description
that my poor memory does is not recalling the necessary details to
correct.

Eric

> Suggested-by: Ira Weiny <ira.weiny@intel.com>
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> ---
>  fs/exec.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/fs/exec.c b/fs/exec.c
> index 0989fb8472a1..4a2129c0d422 100644
> --- a/fs/exec.c
> +++ b/fs/exec.c
> @@ -583,11 +583,11 @@ static int copy_strings(int argc, struct user_arg_ptr argv,
>  
>  				if (kmapped_page) {
>  					flush_dcache_page(kmapped_page);
> -					kunmap(kmapped_page);
> +					kunmap_local(kaddr);
>  					put_arg_page(kmapped_page);
>  				}
>  				kmapped_page = page;
> -				kaddr = kmap(kmapped_page);
> +				kaddr = kmap_local_page(kmapped_page);
>  				kpos = pos & PAGE_MASK;
>  				flush_arg_page(bprm, kpos, kmapped_page);
>  			}
> @@ -601,7 +601,7 @@ static int copy_strings(int argc, struct user_arg_ptr argv,
>  out:
>  	if (kmapped_page) {
>  		flush_dcache_page(kmapped_page);
> -		kunmap(kmapped_page);
> +		kunmap_local(kaddr);
>  		put_arg_page(kmapped_page);
>  	}
>  	return ret;
> @@ -883,11 +883,11 @@ int transfer_args_to_stack(struct linux_binprm *bprm,
>  
>  	for (index = MAX_ARG_PAGES - 1; index >= stop; index--) {
>  		unsigned int offset = index == stop ? bprm->p & ~PAGE_MASK : 0;
> -		char *src = kmap(bprm->page[index]) + offset;
> +		char *src = kmap_local_page(bprm->page[index]) + offset;
>  		sp -= PAGE_SIZE - offset;
>  		if (copy_to_user((void *) sp, src, PAGE_SIZE - offset) != 0)
>  			ret = -EFAULT;
> -		kunmap(bprm->page[index]);
> +		kunmap_local(src);
>  		if (ret)
>  			goto out;
>  	}
> @@ -1680,13 +1680,13 @@ int remove_arg_zero(struct linux_binprm *bprm)
>  			ret = -EFAULT;
>  			goto out;
>  		}
> -		kaddr = kmap_atomic(page);
> +		kaddr = kmap_local_page(page);
>  
>  		for (; offset < PAGE_SIZE && kaddr[offset];
>  				offset++, bprm->p++)
>  			;
>  
> -		kunmap_atomic(kaddr);
> +		kunmap_local(kaddr);
>  		put_arg_page(page);
>  	} while (offset == PAGE_SIZE);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
