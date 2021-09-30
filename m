Return-Path: <SRS0=9UDN=OU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE2A9C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Sep 2021 02:38:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67E3D6162E
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Sep 2021 02:38:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 67E3D6162E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pTRxauyvTq4YdE1sxQuaAYs9390LhOftfj4xyg6y58s=; b=El8zxUqI7kguxf
	+81xyShv/sHlBSSSTgzMPi+MNtqbKCaTrw0mVoFFsP0wLZEgwzzTNVp2IljFM+xZAo6eTNJsHd3Tp
	hT1fTl552jf9zYbTUQ7Wq8aTYUjD6kGVb+18nJtYOVijSfVOQGl5l8dWudhz0JlD0M63M+lcMhv9P
	RGUKEYLP2J8CAVYdagfauVVk9B2CZRxTnxPB5gKdx/flZi7/r6BuF4surA2dRRQESXDdkUvcKl67X
	GAgJwKuNBqBBbfpdbJqVl0Hp/z5PkHg1zHH/HSBgjORt51Kf7Oo3VNXgiREx+9R4X8EMvBOWZWIEF
	PW7jKtnz2zbH0+xQ0DCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVlxL-00Cn0o-Bm; Thu, 30 Sep 2021 02:37:55 +0000
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVlxI-00Cn0C-Pt
 for linux-riscv@lists.infradead.org; Thu, 30 Sep 2021 02:37:54 +0000
Received: by mail-vs1-xe2b.google.com with SMTP id p9so66061vst.9
 for <linux-riscv@lists.infradead.org>; Wed, 29 Sep 2021 19:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FsYqypxg/dr8c8wkXcAf7I6Hd0FSlf0rtrIdWKourdU=;
 b=SaeqEH6gjhtWTbbPlvjvhTi0o4fUIWYNq0JW65SJw7siu39S0ZbRgRH0GVO3MAIXDX
 OVCLvjIO2Thku8+ZEgx/nJpEi+FylTNXWvk4enKtDlDFZ6qMQ9GYYwXYkR1ih/5e8FN9
 Mlzhb4qYw8Dt2N0Rl4u5aI7rN5QLi4x7+S8u9q0UpRZX0sxEZO6KrqlbYVNoCeePZ96G
 VJoqkdMuAhk3ztVa5+SoPpgzXF8orXYDa+WtJTYv7v7xCQx/36rBM63ga2sdP71uUeI6
 rROgxmQy5/Obuo1dWAE9XmrMaZbu0QedLkwAKDzDGke+ctKx60fE5mRVMtVl5vCdrKfT
 5lkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FsYqypxg/dr8c8wkXcAf7I6Hd0FSlf0rtrIdWKourdU=;
 b=qorqT6TmsIn9QuAitIBwbjPF854ElrWRE8a3UDXR9nY+6oraNT24l1xyQsJ+tfmtqJ
 QWt5zinNGYVEpBrrUg+1/HxNfw7Kz3i2tYQKNwAyLxZcJWLGW8WHZGSCuWxjQxrqKNyK
 +LTgxVK0qNEiKsdLs4eV0dhs764mmNJW+mfbFD/Fv2dqvdV7T0A5bgtZBKCSCdyncSWR
 Ae/cJrFHG4v2l84zXiZ8JfLXWNx3mQ1SHng5Diz48mMBiThAMqTk8yHmji2+AjRQAqVr
 P28x6QDRAi2ljLoulWQeLZxmJxNX+bCB1vULdY83SAD/xtrLvJQDr81v4259Y6hB18cG
 txNQ==
X-Gm-Message-State: AOAM533a71m7rR4m2ilk2Oy4MmxUMkhPlSRMEtqJRbUHhjnb1tyvLVmQ
 25gSzpfW1VSRULouckaYqGI/hhpJY+en6cE6+X0=
X-Google-Smtp-Source: ABdhPJyL/1fwFO+VYZjrC4XLhQoSFULZrxT2hJ7vv0nhIyQq1/A3zN0JWW/oay21otY+mUGk75mzScSuK2rdFkxrolE=
X-Received: by 2002:a67:f251:: with SMTP id y17mr2073492vsm.22.1632969470752; 
 Wed, 29 Sep 2021 19:37:50 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1631121222.git.greentime.hu@sifive.com>
 <82fe07af09d223b33c8d4b8986939bcc0d7180a1.1631121222.git.greentime.hu@sifive.com>
In-Reply-To: <82fe07af09d223b33c8d4b8986939bcc0d7180a1.1631121222.git.greentime.hu@sifive.com>
From: Ley Foon Tan <lftan.linux@gmail.com>
Date: Thu, 30 Sep 2021 10:37:39 +0800
Message-ID: <CAFiDJ5_Lp8ejFiNpZw=YvneyEFRj-PD9667Jv_hHy_-7xGf+FQ@mail.gmail.com>
Subject: Re: [RFC PATCH v8 11/21] riscv: Add sigcontext save/restore for vector
To: Greentime Hu <greentime.hu@sifive.com>
Cc: linux-riscv@lists.infradead.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, aou@eecs.berkeley.edu,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 vincent.chen@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210929_193752_867984_253BFBB0 
X-CRM114-Status: GOOD (  17.31  )
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

On Thu, Sep 9, 2021 at 1:49 AM Greentime Hu <greentime.hu@sifive.com> wrote:
>
> This patch adds sigcontext save/restore for vector. The vector registers
> will be saved in datap pointer. The datap pointer will be allocated
> dynamically when the task needs in kernel space. The datap pointer will
> be set right after the __riscv_v_state data structure to save all the
> vector registers in the signal handler stack.
>
> Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> ---
>  arch/riscv/include/uapi/asm/sigcontext.h |  24 ++++
>  arch/riscv/kernel/asm-offsets.c          |   2 +
>  arch/riscv/kernel/setup.c                |   4 +
>  arch/riscv/kernel/signal.c               | 164 ++++++++++++++++++++++-
>  4 files changed, 190 insertions(+), 4 deletions(-)
>

[....]


> +
> +static size_t cal_rt_frame_size(void)
> +{
> +       struct rt_sigframe __user *frame;
> +       static size_t frame_size;
> +       size_t total_context_size = 0;
> +       size_t sc_reserved_size = sizeof(frame->uc.uc_mcontext.__reserved);
> +
> +       if (frame_size)
> +               goto done;
> +
> +       frame_size = sizeof(*frame);
> +
> +       if (has_vector)
> +               total_context_size += rvv_sc_size;
> +       /* Preserved a __riscv_ctx_hdr for END signal context header. */
> +       total_context_size += sizeof(struct __riscv_ctx_hdr);
> +
> +       if (total_context_size > sc_reserved_size)
> +               frame_size += (total_context_size - sc_reserved_size);
> +
> +done:
> +       return round_up(frame_size, 16);

Hi Greentime,

frame_size is static variable here, so it will preserve the value for
the next calling to cal_rt_frame_size().

I think we need update frame_size before return, example:

frame_size =  round_up(frame_size, 16);
return frame_size;


Regards
Ley Foon

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
