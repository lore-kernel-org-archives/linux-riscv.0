Return-Path: <SRS0=uYfr=A2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 259B4C433E4
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2020 20:09:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E996C2065D
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2020 20:09:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kUPX2HwC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jnQVra4+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E996C2065D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=s59PBYz5RcczJ1CX4YmfqGjPciOH07UIRWUc0qwkuvY=; b=kUPX2HwCS1mRxPbSz8g1FwDd6
	0Y1nHonNtCkA/YRoKzJHEyjyR8Fe9MjitpcMu3MGRwjQRGM6VqWxsAR5t7rzkskxXOcdGnjd0gpAT
	aA5vAvfsNtLTMPQSawVAgQbgY4oTgzCEKSbJDpxv4rWvJgMehHkGNv4vpeM9uMVozvizS31F1C0Jj
	WtakG6JIfSCtBiR1BYQDAj1aEiwOhJG6koiqZBJP4X4/JY4uNiZzU017Q3khwEckCuYLtCyX+Ym3u
	Ad9WlpTS2TOn5hiHkHFNtnBTZ7/9u3BFSUwyZOP5XHDU73ypMLcJGbKb8PWMPmqR8qFF2J9xSvceG
	52Po2kDaw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvni7-0005gI-7o; Wed, 15 Jul 2020 20:08:59 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvni5-0005fm-MJ
 for linux-riscv@lists.infradead.org; Wed, 15 Jul 2020 20:08:58 +0000
Received: by mail-wm1-x343.google.com with SMTP id 17so7322255wmo.1
 for <linux-riscv@lists.infradead.org>; Wed, 15 Jul 2020 13:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TolZEtxgsV3An5H/SdGdZj4fiN57mXcD++DOPxm6nec=;
 b=jnQVra4+13tS061DNIkTvsRN58izvTQtayCFy3EenQN3TZszDfT5iQLKl4CCwDqXac
 mxK9lP5rUoskc/FzlXEjYSQ22MICw9Ui5tV3HckDCZIIFV+54zKHfWCZgYgTUk+/61nc
 rCKSyiStxwsayPsHroTFsJkBZoB2PHBxrq/zRKBXKsRApgfUlHICMl6a5toV5myHQ/Ij
 Tnn292G6AN8i7Yxz7kQTNMpq6TJF6bVlC9KWpmmPQ5tLqqLvKmon9O8RB9aSvc/bFnK9
 lSmT5ex5uekMteqlOYR7EnNLWRxDWzM69X6xAGMJ0ujYqE03nCF6nbcps76viWv163se
 /4ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TolZEtxgsV3An5H/SdGdZj4fiN57mXcD++DOPxm6nec=;
 b=DTgC0gbCdIGLCk3Bwxx7EygQcERPOTcdFJAjNZYr75+iPTAugQVDNtfgJszOZiKS5D
 csjRqS0uMPrO/vPwjRG7pZTDd9VjI6ihafO5ZcXY7YOPaLl5J/Lcje8Cxe/tzwiqolnQ
 6GKQE+1LnVS+3+mwsrPgxTtiTStjEdPzuog25j8I1UoPINx8sIHZPdpqcSkrVsd5LZNX
 /PyKcqKFuhcIlOMVC62kFrplbn+fojlGKynXpVuk7Z9387obaKH0AbQX6TwJj+aQvQ4l
 Bzp+9cLELXgbdIFy59zP2kYS5FNGW+28R1wQ8ChITtMdrTo752j8aLN0+w1OXCQE+sB6
 bvXw==
X-Gm-Message-State: AOAM533dj4Zm88AhRaYMKnQ5oa5BxRQDTay7Y1FnMo1siF+aaaKM5CDY
 +tIx1T54YwHlmAb0q+sIvrdaF3KJW3CHFc2pMpg=
X-Google-Smtp-Source: ABdhPJxxxn/p48diSigUNGjm4Jnah7ajXIZF5W1reXQTfbH4SrdS7LWBtgRqa0NxXagT2e1CXjGCce/zqJQ+MyLpXa8=
X-Received: by 2002:a1c:ab56:: with SMTP id u83mr1111488wme.94.1594843734608; 
 Wed, 15 Jul 2020 13:08:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200713183711.762244-1-luke.r.nels@gmail.com>
 <CAJ+HfNg_qV=umB9T1U9vRo2pUpmUFfBN44WpAOfMoi75Ymh2dw@mail.gmail.com>
In-Reply-To: <CAJ+HfNg_qV=umB9T1U9vRo2pUpmUFfBN44WpAOfMoi75Ymh2dw@mail.gmail.com>
From: Luke Nelson <luke.r.nels@gmail.com>
Date: Wed, 15 Jul 2020 13:08:43 -0700
Message-ID: <CAB-e3NQFE9rsVZ55Y=jivuBsd1A+V4GWtceqjOz80qtmFsFQVA@mail.gmail.com>
Subject: Re: [RFC PATCH bpf-next 0/3] bpf, riscv: Add compressed instructions
 to rv64 JIT
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200715_160857_757113_52EE32B3 
X-CRM114-Status: GOOD (  10.23  )
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
Cc: Song Liu <songliubraving@fb.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Borkmann <daniel@iogearbox.net>, Netdev <netdev@vger.kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, Luke Nelson <lukenels@cs.washington.edu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 KP Singh <kpsingh@chromium.org>, Yonghong Song <yhs@fb.com>,
 bpf <bpf@vger.kernel.org>, Andrii Nakryiko <andriin@fb.com>,
 Martin KaFai Lau <kafai@fb.com>, Xi Wang <xi.wang@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

>
> First of all; Really nice work. I like this, and it makes the code
> easier to read as well (e.g. emit_mv). I'm a bit curious why you only
> did it for RV64, and not RV32? I have some minor comments on the
> patches. I strongly encourage you to submit this as a proper (non-RFC)
> set for bpf-next.
>

Thanks for the feedback! I'll clean up the patches and address your
comments in the next revision.

The patch adding RVC to the RV32 JIT is forthcoming; some of the
optimizations there are more difficult since the RV32 JIT makes more
use of "internal" jumps whose offsets depend on the sizes of emitted
instructions. I plan to clean up that code and add RVC support in a
future series.

- Luke

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
