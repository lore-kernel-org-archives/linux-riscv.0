Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E880C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Apr 2022 17:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sxvATG8lL9BqxdN7QD/N25IUZ2QcEqghJvuIf346KuM=; b=1km0YbO88b4MGp
	yQWN6Tz6WMF3yfe9LlQ/CKkjPMAsmk0byGicVSmp4Hd8npyQ0z40gB2NUoDAoGt2t5S0YYSyYks6L
	W3d1SKfYa7hpVe+cTtr3qH1wRlqcWOR9c3ExKYCFL5I7RssKJ1Ae9rqwBy4wKKlqJmA4OkBFbtAuF
	Iwrt+XMWn9X+DsDDTeWWCiA7u4kA/D/hUiZLP/0jYM/7JAtr1+2KNK+Pt/B4f3Y1BI7VbdquvFYaZ
	qEhX2cMgJZ9IUwt79+YkThOTcNtCsPvkwQ+TjiGgH9RgKndqP+K+9EsBQlS5RIFziGXC2qxWwx+K9
	/kG28COrQJ8N42/KFXbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbQx5-00G4O5-42; Mon, 04 Apr 2022 17:57:19 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbQx2-00G4NM-KW
 for linux-riscv@lists.infradead.org; Mon, 04 Apr 2022 17:57:17 +0000
Received: by mail-ej1-x633.google.com with SMTP id a6so10687877ejk.0
 for <linux-riscv@lists.infradead.org>; Mon, 04 Apr 2022 10:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LbauJjsyWfyUgbBcVSH3nfrWUAPSnEOj9xP8Lf2uMQc=;
 b=UG944lrMDFa46xw5mJXf3ez+C/4ds1SQUW0we6U55dMyhEZZ7nlsdZThXtaE9WVYzw
 Jfy65lB6zabNtWssWwmJd9J4VR9M1BfJ3erzVCwXOfMJvwO00IoZn6aX0ZU8yKagMGIT
 m/2efF5EDkOSKH0VH5qjuwCWsiLJzSMR4adJbiFDFKN/kHS+ytNGd9JEIUJq19xGg53J
 v1ltJfw45hvtfnHqx3K3wH9zjB7RDEdktgzKQk1rnDUvWEpt6DLklfwHBAJ+DIePeLH+
 MY/AkXEjvBAlDwOi3r2ud91AVrcXv7wmi2UD5ZZ37GjYD6yw1xgCIhWoiGcMF3s7g6z7
 +EDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LbauJjsyWfyUgbBcVSH3nfrWUAPSnEOj9xP8Lf2uMQc=;
 b=1Xu9rEg0fvEFijnXPGhmAOXbfx4CNLsiLnUWl3M9Y08ypgDpQx4uMVInKKIh3lybsy
 zRmgOf5YGgWayedeh6uZzdz//OKTAUFTjEYfTBmEt0i+FoMRNt4dLwRddTt8v00FTFj0
 Qg1Ub7MXDIN2H2Zx32gDswFANYD0nnNMs+6BrD5xmAnNZ+jvMa3eDGw0t/QXWow2Ozne
 lycrpJ40V7GzXfH6qfMpf+L2/+3JzPAyY23MSt9lu/xf4z7HtybVbSmb/0JipRyf9JGa
 ogZUIKVwk2BkYNs3fmKDLb8rS5d50CspmcEFEVR3zUnsqJoBFdBArOku3iJUhABrZ09y
 VuzA==
X-Gm-Message-State: AOAM533nFgDINMGi/IUadBWz9bG06zZqYIz0I3Lo5PF9rsNaOGeBlPhu
 kXsFD59fZ3kNeldfggvLGoulBZWiiceJv0ca3oY=
X-Google-Smtp-Source: ABdhPJz6VPW+goa8wHgWwkrJ9LveFINVQNnHYtPycIFT9TB7eAJpR4uYm/cUBC6mR+k35uivnhYmWtrACl6sZDox9MU=
X-Received: by 2002:a17:906:64ca:b0:6e0:1648:571c with SMTP id
 p10-20020a17090664ca00b006e01648571cmr1191237ejn.477.1649095032585; Mon, 04
 Apr 2022 10:57:12 -0700 (PDT)
MIME-Version: 1.0
References: <Yib9F5SqKda/nH9c@infradead.org>
 <CAK8P3a1dUVsZzhAe81usLSkvH29zHgiV9fhEkWdq7_W+nQBWbg@mail.gmail.com>
 <YkmWh2tss8nXKqc5@infradead.org>
 <CAK8P3a0QdFOJbM72geYTWOKumeKPSCVD8Nje5pBpZWazX0GEnQ@mail.gmail.com>
In-Reply-To: <CAK8P3a0QdFOJbM72geYTWOKumeKPSCVD8Nje5pBpZWazX0GEnQ@mail.gmail.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 4 Apr 2022 10:57:01 -0700
Message-ID: <CAMo8BfKgn0T5RtUTb89fPvygNJJYLy7r1=RZTmTTm=jiDfx1hQ@mail.gmail.com>
Subject: Re: [RFC PULL] remove arch/h8300
To: Arnd Bergmann <arnd@arndb.de>
Cc: Christoph Hellwig <hch@infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel@lists.sourceforge.jp>, 
 "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>,
 Linux-sh list <linux-sh@vger.kernel.org>, 
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Greg Ungerer <gerg@linux-m68k.org>, 
 Damien Le Moal <damien.lemoal@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_105716_699298_76824EFA 
X-CRM114-Status: UNSURE (   8.90  )
X-CRM114-Notice: Please train this message.
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

Hi Arnd,

On Mon, Apr 4, 2022 at 6:07 AM Arnd Bergmann <arnd@arndb.de> wrote:
> 1. xtensa nommu has does not compile in mainline and as far as I can
> tell never did

I have a different picture here. If you look at the logs at
  https://kerneltests.org/builders/qemu-xtensa-master/

there's a line for noMMU config in every one of them:
  Building xtensa:de212:kc705-nommu:nommu_kc705_defconfig ... running
............ passed

Please let me know if you observe any specific build/runtime issues.

-- 
Thanks.
-- Max

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
