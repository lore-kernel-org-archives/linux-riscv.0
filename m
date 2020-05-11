Return-Path: <SRS0=qmG6=6Z=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8A2DC47255
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 May 2020 19:04:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F30020675
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 May 2020 19:04:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R56v623D";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Aityn5qw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F30020675
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YzsKJVzyv809UlovZpoNnJ1plerWdeBBXFFvRwVCLfU=; b=R56v623DNPNLVm7hVplIkuT8F
	tPCf6Au17NzWMkLluyEZ2F6I/YF8j3I3ZT9QOzU6XmuNaxCm1tSivCKw1vlJCi1XY5Lk6yw4m+5gJ
	BRFfgeDNm3wVMYweMsne48XG/HNfIMhyb2AW0dZFlRST1d8lSF4RJX6jMnCcu0kuDYort3WMtbaxO
	fGaTlswzmLKaQWL2lkke70KJ/mjm7bV1HCpt1KExWTo8hS5L8rCDNawAy5YULy66dxX5FX2mqt2rb
	uLjOcAUW3eI0G8Lx39bmnpaUQsVJsd3YCCsvxggtPH59r6tQJqo4KwBkGGedRvfScksAst4LLUq8S
	4Vqp+R1OA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYDj6-0006q1-CI; Mon, 11 May 2020 19:04:32 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYDj3-0006p4-6x
 for linux-riscv@lists.infradead.org; Mon, 11 May 2020 19:04:30 +0000
Received: by mail-lj1-x241.google.com with SMTP id w10so42537ljo.0
 for <linux-riscv@lists.infradead.org>; Mon, 11 May 2020 12:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YzsKJVzyv809UlovZpoNnJ1plerWdeBBXFFvRwVCLfU=;
 b=Aityn5qwpqm1WDEUGTp+1nV456XmvV8CfFEmW41oj4/bMkwJhVeEng5HZPhERMEjHU
 nCY9cggNS6UjKU4dGM6tzdYgB+qfI9VUHZ+DaRJy6199MAVi3dYOMOGDK92kbBygXWj9
 X+8s8UBqSDnkYdebJ7Q86uwTiep2ZsMcMt2rA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YzsKJVzyv809UlovZpoNnJ1plerWdeBBXFFvRwVCLfU=;
 b=YsB8N/SoJfvuBxQT9CCKbD0uQnPachSuozHUFf1ksZtxsxFdSkaJm9+Pn+RNxkB8dw
 8xhACsOEslxTfE+s0XLzjHHRoomcKO5DJEiLsLzEWaVhbdlHRynRhVedBzhVbbXH/kzq
 7wwIJgWGWv9JL68SaCR1VnmncuuVK6Gz6hGLyhHntIraWkazKJ3b1Unn47P4OlLPKMGc
 yZS3cX+5JTUMfbfNx5diqwPs0GzwFPb/TLUdFym5z3yF0DE8MQsYyGSpv956eWbJe+Av
 G6kan73qNnMF1nAMPLqY8OP6CKy15sjIem17CQIdr5MFDcU4LtiUg7BPEKbJH+bXrDeo
 BFNA==
X-Gm-Message-State: AOAM53056IWE/U8Q+BDnp+xJLDHJVsXn3dDpY9vaG6Vml3hyxzXVaJdH
 onUTuaFn1nis5Ys4DD/gVxcVmdW7/M4=
X-Google-Smtp-Source: ABdhPJz/D5cDxs21M6CG2bM4M4QWx5Suk5oCLZhOFNyBWCHqVbW55dkA9QZd++yfFaO2yZg6KyqlKQ==
X-Received: by 2002:a2e:9b53:: with SMTP id o19mr10861657ljj.75.1589223866625; 
 Mon, 11 May 2020 12:04:26 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com.
 [209.85.208.172])
 by smtp.gmail.com with ESMTPSA id x24sm10406989lji.52.2020.05.11.12.04.25
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 May 2020 12:04:25 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id u15so10786715ljd.3
 for <linux-riscv@lists.infradead.org>; Mon, 11 May 2020 12:04:25 -0700 (PDT)
X-Received: by 2002:a2e:9a54:: with SMTP id k20mr11892212ljj.265.1589223865222; 
 Mon, 11 May 2020 12:04:25 -0700 (PDT)
MIME-Version: 1.0
References: <mhng-81c83c19-6f5d-4ed1-a0bb-26accf4b7d3a@palmerdabbelt-glaptop1>
 <CAHk-=win0EVU_GuO=GuJu3Ck0WG1B3+ub-CjncM3B1G9x5d9cw@mail.gmail.com>
 <mvmr1vqkhxb.fsf@suse.de>
In-Reply-To: <mvmr1vqkhxb.fsf@suse.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 11 May 2020 12:04:09 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj8Cks7L2H9ToNWEMmqECYEfX0uyCXpW1OsZ+NAooi2Cw@mail.gmail.com>
Message-ID: <CAHk-=wj8Cks7L2H9ToNWEMmqECYEfX0uyCXpW1OsZ+NAooi2Cw@mail.gmail.com>
Subject: Re: [GIT PULL] RISC-V Fixes for 5.7-rc5
To: Andreas Schwab <schwab@suse.de>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_120429_257261_5E49ED71 
X-CRM114-Status: GOOD (  11.64  )
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
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, May 11, 2020 at 1:13 AM Andreas Schwab <schwab@suse.de> wrote:
>
> On Mai 09 2020, Linus Torvalds wrote:
>
> > glibc depending on kernel version is WRONG. It's bogus. You can't do
> > feature detection based on kernel version, it's fundamentally broken.
> >
> > So I really would prefer to see glibc fixed not to do that stupid
> > thing, instead of adding pointless vdso notes to the kernel.
>
> I'm not aware of any discussion or bug report on this issue.  Any
> pointer?

We've discussed it informally several times, but that really is just
"I remember mentioning this before" than anything else.

Basically, testing kernel versions is pretty much always a bug. You
_will_ get it wrong, sometimes spectacularly (we've had programs
literally break when the major number changed, because they only
checked the minor number).

Other times you'll get it wrong in subtler ways - testing for features
by version number is wrong, if that feature is then disabled by a
config option (a lot of new kernel features work that way).

Or, the already mentioned "distros often port back features to their
older kernels". The latest example of that is Wireguard being ported
back to Ubuntu 20.04 - using kernel version 5.4, even though WG was
actually upstreamed in 5.6.

So the whole "look at kernel version to determine if it does X" is
simply fundamentally wrong.

Why is glibc doing it in the first place? Is it some historical thing
that is simply irrelevant on RISC-V simply because RISC-V doesn't have
that kind of history, perhaps?

                 Linus

