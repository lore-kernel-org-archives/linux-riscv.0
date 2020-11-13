Return-Path: <SRS0=nj+O=ET=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59BA4C4742C
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2020 14:16:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C262A2222F
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2020 14:16:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t8CXx3G2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C262A2222F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xD87uVfwJjhc5leuXjwAK0Lxld17DGH6uhwX4SBmMPA=; b=t8CXx3G2u0BMuFkxoLcwrWuAV
	c5j8GH4iCbXkMTAzAxoY+5muHrmi7LMvNuSuD91mB4MtMHA6wVqSIl8Y9TdCKxQEVr5JNCCnnhspT
	OCQareLyNn26/qmVAEO+HrI6/oAGszxsr6N4ySVgEniPSBAh3Bp9SfgYa5gOD/RscFRkluxOei0fR
	9N5/EMbe+fvJUc8fcUwlcLSe6u/yoiFPOXGrozSVEgZuu9A8S7pxuN87gNT7NYpSkz6Fsz0LN/8lA
	nTXQxjqwBJUqqfxU9kHZ3KfYutqOvB3vH1Nbbvc5OVrlZySVkeyXO0juCWJLxQiVchTWTKxKU6UGt
	9SkumK6SQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdZrl-0004ik-T3; Fri, 13 Nov 2020 14:15:53 +0000
Received: from [2002:c35c:fd02::1] (helo=ZenIV.linux.org.uk)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdZrj-0004ha-9n; Fri, 13 Nov 2020 14:15:52 +0000
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kdZra-0058ih-LK; Fri, 13 Nov 2020 14:15:42 +0000
Date: Fri, 13 Nov 2020 14:15:42 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@gmail.com>
Subject: Re: csum_partial() on different archs (selftest/bpf)
Message-ID: <20201113141542.GJ3576660@ZenIV.linux.org.uk>
References: <CAJ+HfNiQbOcqCLxFUP2FMm5QrLXUUaj852Fxe3hn_2JNiucn6g@mail.gmail.com>
 <20201113122440.GA2164@myrica>
 <CAJ+HfNiE5Oa25QgdAdKzfk-=X45hXLKk_t+ZCiSaeFVTzgzsrw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJ+HfNiE5Oa25QgdAdKzfk-=X45hXLKk_t+ZCiSaeFVTzgzsrw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_091551_412352_84401885 
X-CRM114-Status: GOOD (  12.38  )
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Tom Herbert <tom@herbertland.com>, Anders Roxell <anders.roxell@gmail.com>,
 Netdev <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Nov 13, 2020 at 02:22:16PM +0100, Bj=F6rn T=F6pel wrote:

> Folding Al's input to this reply.
> =

> I think the bpf_csum_diff() is supposed to be used in combination with
> another helper(s) (e.g. bpf_l4_csum_replace) so I'd guess the returned
> __wsum should be seen as an opaque value, not something BPF userland
> can rely on.

Why not reduce the sucker modulo 0xffff before returning it?  Incidentally,
implementation is bloody awful:

        /* This is quite flexible, some examples:
         *
         * from_size =3D=3D 0, to_size > 0,  seed :=3D csum --> pushing data
         * from_size > 0,  to_size =3D=3D 0, seed :=3D csum --> pulling data
         * from_size > 0,  to_size > 0,  seed :=3D 0    --> diffing data
         *
         * Even for diffing, from_size and to_size don't need to be equal.
         */
        if (unlikely(((from_size | to_size) & (sizeof(__be32) - 1)) ||
                     diff_size > sizeof(sp->diff)))
                return -EINVAL;

        for (i =3D 0; i < from_size / sizeof(__be32); i++, j++)
                sp->diff[j] =3D ~from[i];
        for (i =3D 0; i <   to_size / sizeof(__be32); i++, j++)
                sp->diff[j] =3D to[i];

        return csum_partial(sp->diff, diff_size, seed);

What the hell is this (copying, scratchpad, etc.) for?  First of all,
_if_ you want to use csum_partial() at all (and I'm not at all sure
that it won't be cheaper to just go over two arrays, doing csum_add()
and csum_sub() resp. - depends upon the realistic sizes), you don't
need to copy anything.  Find the sum of from, find the sum of to and
then subtract (csum_sub()) the old sum from the seed and and add the
new one...

And I would strongly recommend to change the calling conventions of that
thing - make it return __sum16.  And take __sum16 as well...

Again, exposing __wsum to anything that looks like a stable ABI is
a mistake - it's an internal detail that can be easily abused,
causing unpleasant compat problems.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
