Return-Path: <SRS0=CmJx=3M=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DD98C32771
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 23 Jan 2020 02:09:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 011D424125
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 23 Jan 2020 02:09:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jqchABhf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="gZz10cQa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 011D424125
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Mime-Version:Message-ID:References:
	In-Reply-To:To:From:Subject:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5gsNXHyzHDiJgy8YcrzY+fMhsyVMGiFXDcVBfNfdEVo=; b=jqchABhfbvz9fi
	PxSPF85JtORaqb4XSPaN0kml9GnIDEZcLQp7ko5wkQKN4GbGK+8/XEuw2+EJz7ZelupnlBHdRHBsZ
	QQ/D4LJ87mUOh8zWq5jNhoBrM+1gHY0h66OofjDtyJxg+mCIGIeTV6Mqc8Rac78rqQHDRZ2t9qFCA
	Iz1XySOiseL7M5FSG5xL8y7B5Oh6hLysHNb4mxTW+FH6GupxyR4J4OuXN7Kgz37r9lRSlp5Va69/g
	I/lFZROIdcR3HpSCQ8H2sI+MKPfCs9nKhZriFu4R3016hgXEkigEJFGssRlwEsPslRp7Vu6YI4b7M
	5Z5u8OU6OQGxKAgMz4BA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iuRva-0005KJ-0B; Thu, 23 Jan 2020 02:09:02 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iuRvX-0005Jz-Fc
 for linux-riscv@lists.infradead.org; Thu, 23 Jan 2020 02:09:01 +0000
Received: by mail-pg1-x542.google.com with SMTP id q127so545814pga.4
 for <linux-riscv@lists.infradead.org>; Wed, 22 Jan 2020 18:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:cc:from:to:in-reply-to:references:message-id
 :mime-version:content-transfer-encoding;
 bh=5gsNXHyzHDiJgy8YcrzY+fMhsyVMGiFXDcVBfNfdEVo=;
 b=gZz10cQaqiqIYtnjl/9xxE2vIX2tteYAe8iGn7d0JSDxybrWLxFOnWVRktCvwYXQdA
 5QqUi46Q6uWx4ael1eLS0feakIgcUg1HHom7iXtTEtUGvCmP1qLJvePauQaq8pCzTu08
 AppG9qgSFcXI328/MHRLwfmU9CkDIqIPIjm26fCQFbx6vy0SjmmlZVvPZyRpjQTX9CS2
 ovVxsnDit6GxS4v3nI/k124EM5fEpOJYb6gbUnNcAjfITA6+0LYSwVBGwTo+VSItbtdN
 wqen8u/1v5vGacJJb30YUx1pvOi99fvsH55hPWaFjve1MH3OdpBXE09URWiziJfTi12c
 NTkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:cc:from:to:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=5gsNXHyzHDiJgy8YcrzY+fMhsyVMGiFXDcVBfNfdEVo=;
 b=dA7hNbHenU7xhKkcvjKme0XuJC3oFA32MqFI5f/SJoW4D9bNpWNBR9zSoiRKx3+B83
 ljzSV4dcGl8KulWVmeKldbTIOlrHRyWmpr26U0iiEuVfxQMvjloVBx4vmrlyS/Rm7Vpf
 qy+7T0lKA1mPmKhz7kVpi2FEYk11rR0HYVZ2OQ1y/txaRzKZ69RQ694T9J1ubyzuKQqX
 bG5VZUG2v0GED3Wdcpw4QB6tvMkNhH9jhj48FLVSgDY2aR9pSOw+mX983K9cQ3a23bmT
 TMrzu1Yja1Vskp8iMgZbS0PjslOJFkdWugVJ9yyzeBRdY0tsBZvBwPdq4qUQaKrG35e7
 9OjA==
X-Gm-Message-State: APjAAAXAD0zEBW63kECblxEBY3vugfLQaif1zCzbQNGo3qfUdnZOvMho
 0fbUwAQCR4UC0k7Yvr74hI3enw==
X-Google-Smtp-Source: APXvYqynPg9BNC9857j3pLW+kIkrUtgKIiKGzykGRIQp06LS0+nPuKG3MQ9oD/XhFKLr67acldXB/Q==
X-Received: by 2002:a63:2308:: with SMTP id j8mr1320556pgj.86.1579745337946;
 Wed, 22 Jan 2020 18:08:57 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:7f69:cd98:a2a2:a03d])
 by smtp.gmail.com with ESMTPSA id q11sm221136pff.111.2020.01.22.18.08.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2020 18:08:57 -0800 (PST)
Date: Wed, 22 Jan 2020 18:08:57 -0800 (PST)
X-Google-Original-Date: Wed, 22 Jan 2020 18:08:54 PST (-0800)
Subject: Re: [PATCH bpf-next v2 2/9] riscv, bpf: add support for far branching
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Bjorn Topel <bjorn.topel@gmail.com>
In-Reply-To: <CAJ+HfNjoO2ihHMh2NHMQfxG8X1zLdzEq6Ywr=b2qD0tNwXreFA@mail.gmail.com>
References: <CAJ+HfNjoO2ihHMh2NHMQfxG8X1zLdzEq6Ywr=b2qD0tNwXreFA@mail.gmail.com>
 <20191216091343.23260-1-bjorn.topel@gmail.com>
 <20191216091343.23260-3-bjorn.topel@gmail.com>
 <mhng-6be38b2a-78df-4016-aaea-f35aa0acd7e0@palmerdabbelt-glaptop>
Message-ID: <mhng-9d460c8a-52e3-4a65-bd23-6210ad1fbf05@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200122_180859_549044_097C62ED 
X-CRM114-Status: GOOD (  25.30  )
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
Cc: daniel@iogearbox.net, netdev@vger.kernel.org, ast@kernel.org,
 lukenels@cs.washington.edu, linux-riscv@lists.infradead.org,
 bpf@vger.kernel.org, xi.wang@gmail.com
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 07 Jan 2020 00:13:56 PST (-0800), Bjorn Topel wrote:
> Back from the holidays; Sorry about the delayed reply.
>
> On Mon, 23 Dec 2019 at 19:03, Palmer Dabbelt <palmerdabbelt@google.com> wrote:
>>
>> On Mon, 16 Dec 2019 01:13:36 PST (-0800), Bjorn Topel wrote:
>> > This commit adds branch relaxation to the BPF JIT, and with that
> [...]
>> > @@ -1557,6 +1569,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
>> >  {
>> >       bool tmp_blinded = false, extra_pass = false;
>> >       struct bpf_prog *tmp, *orig_prog = prog;
>> > +     int pass = 0, prev_ninsns = 0, i;
>> >       struct rv_jit_data *jit_data;
>> >       struct rv_jit_context *ctx;
>> >       unsigned int image_size;
>> > @@ -1596,15 +1609,25 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
>> >               prog = orig_prog;
>> >               goto out_offset;
>> >       }
>> > +     for (i = 0; i < prog->len; i++) {
>> > +             prev_ninsns += 32;
>> > +             ctx->offset[i] = prev_ninsns;
>> > +     }
>>
>> It feels like the first-order implementation is the same as binutils here: the
>> first round is worst cased, after which things can be more exact.  We're only
>> doing one pass in binutils because most of the relaxation happens in the
>> linker, but this approach seems reasonable to me.  I'd be interested in seeing
>> some benchmarks, as it may be worth relaxing these in the binutils linker as
>> well -- I can certainly come up with contrived test cases that aren't relaxed,
>> but I'm not sure how common this is.
>>
>
> Ah, interesting! Let me try to pull out some branch relaxation
> statistics/benchmarks for the BPF selftests.
>
>> My only worry is that that invariant should be more explicit.  Specifically,
>> I'm thinking that every time offset is updated there should be some sort of
>> assertion that the offset is shrinking.  This is enforced structurally in the
>> binutils code because we only generate code once and then move it around, but
>> since you're generating code every time it'd be easy for a bug to sneak in as
>> the JIT gets more complicated.
>>
>
> Hmm, yes. Maybe use a checksum for the program in addition to the
> length invariant, and converge condition would then be prev_len == len
> && prev_crc == crc?

That would work, but it breaks my unfinished optimization below.  I was
thinking something more like "every time offset[i] is updated, check that it
gets smaller and otherwise barf".

>> Since most of the branches should be forward, you'll probably end up with way
>> fewer iterations if you do the optimization passes backwards.
>>
>
> Good idea!
>
>> > -     /* First pass generates the ctx->offset, but does not emit an image. */
>> > -     if (build_body(ctx, extra_pass)) {
>> > -             prog = orig_prog;
>> > -             goto out_offset;
>> > +     for (i = 0; i < 16; i++) {
>> > +             pass++;
>> > +             ctx->ninsns = 0;
>> > +             if (build_body(ctx, extra_pass)) {
>> > +                     prog = orig_prog;
>> > +                     goto out_offset;
>>
>> Isn't this returning a broken program if build_body() errors out the first time
>> through?
>>
>
> Hmm, care to elaborate? I don't see how?

Ya, I don't either any more.  Hopefully I just got confused between prog and
ctx...

>> > +             }
>> > +             build_prologue(ctx);
>> > +             ctx->epilogue_offset = ctx->ninsns;
>> > +             build_epilogue(ctx);
>> > +             if (ctx->ninsns == prev_ninsns)
>> > +                     break;
>> > +             prev_ninsns = ctx->ninsns;
>>
>> IDK how important the performance of the JIT is, but you could probably get
>> away with skipping an iteration by keeping track of some simple metric that
>> determines if it would be possible to
>>
>
> ...to? Given that the programs are getting larger, performance of the
> JIT is important. So, any means the number of passes can be reduced is
> a good thing!

I guess I meant to say "determines if it would be possible to make any
modifications next time".  I was thinking something along the lines of:

* as you run through the program, keep track of the shortest branch distance
* if you didn't remove enough bytes to make that branch cross a relaxation
  boundary, then you know that next time you won't be able to do any useful
  work

You're already computing all the branch lengths, so it's just an extra min().
Since we're assuming a small number of passes (after reversing the relaxation
direction), you'll probably save more work avoiding the extra pass than it'll
take to compute the extra information.  I guess some sort of benchmark would
give a real answer, but it certainly smells like a good idea ;)

>
>
> Thanks for the review/suggestions!
> Björn

