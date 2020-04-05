Return-Path: <SRS0=yTIg=5V=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECBEDC2D0F4
	for <infradead-linux-riscv@archiver.kernel.org>; Sun,  5 Apr 2020 14:37:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF4F120672
	for <infradead-linux-riscv@archiver.kernel.org>; Sun,  5 Apr 2020 14:37:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N11rtCy8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lEqjKUhi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF4F120672
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Mg+J5XS0nK+zoa4Dm5ITK5YdaJ7PSdz6gYixjtBG6RI=; b=N11rtCy8BIKrJrYOwnbPEjW3R
	Z9A7JDl+OP7jfRA+0JSqUzln6hVfyPS2z59prEFyNL51EXJw3XCTYflZ2ZP7RWlpqinEUkFPLgsZO
	iC3B4tIvdiKaUs9d7Ua2EFw2d6OMbMRQW7DKFT7oju6b0roUm73A83RE+bKc1aF6AMsbfL3paCOvS
	UmzyjzT0g1blFU0HmvEWqDtokuezlcJkV95Jvsgw5KeXPKoflN85+XGLJnZuIzE9Fa0Ate79srQAT
	PodAJ3yNPY/wyMycLsPp6bYvfrv36JW18VrX5nuifYtfx9llttVwvi8zYfJISeRV6NMyiezkv3bOQ
	LXn/Pb7Jg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jL6Ou-0004PX-2D; Sun, 05 Apr 2020 14:37:28 +0000
Received: from mail-yb1-xb44.google.com ([2607:f8b0:4864:20::b44])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jL6Or-0004L8-2Y
 for linux-riscv@lists.infradead.org; Sun, 05 Apr 2020 14:37:26 +0000
Received: by mail-yb1-xb44.google.com with SMTP id a5so7269414ybo.7
 for <linux-riscv@lists.infradead.org>; Sun, 05 Apr 2020 07:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Mg+J5XS0nK+zoa4Dm5ITK5YdaJ7PSdz6gYixjtBG6RI=;
 b=lEqjKUhi2UaTN5PtzwT/7m5VaXfHxWJhlGqJC8zLutFwjRy57edPXRJnCiDHJyyLx8
 qfxmbARD7wXjfCkxhPUq7WIIJyduJUsdGTHklqQdCG8mezs5TRbe8suxyVCF8aYjALgV
 mw4BRuiQ5RWEEM7nAQKX9PrB+yCk85o2e/bJWJ6F5jeEX/7/tdnxf9cDM0BG54AS7wce
 jtAuzlwSLxo/M29dcyMbLhSInOpimWmJSpxGAP8Uo7OPxHeRnMfd4wSF9MgzwOkCKFXX
 m18mm4NNYiBin6jaRJuJkpnv50s5qlB4X52jTXhOk9+vjAcxL6P7rUVHglNNxvFlmt9A
 MehQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Mg+J5XS0nK+zoa4Dm5ITK5YdaJ7PSdz6gYixjtBG6RI=;
 b=NFjzs7h9f+w+hCXb/sc/O/yQLRR7Jc6/QNjILq7QLB1M9YMoRPuZoeUrLfqdNr/T4s
 TZ86kvIv/9Kk5Y5HM13u1oPQBmvdVIaVzKGlO/hU4UeSzCszEmTQEZx6/vX1JybobFfM
 ktsuJPZfG/ltj1kZIROKFTB6tQSxcPKKeO85MuQcTqFwyk2EuIT6TnIzOC3pb2J+OWzn
 yiZxr9/0FfzIbILqHPANkipGCgUBbULP5ZwAQ6AWAbsEqbzCGa4takOMAWkW5ODH/8Dd
 i/IqLcPa7UuyqX6s9FWgK+WRTyNDvms/D+GNTv2BbP8LaRdz/1RU2pqpA3YqLWs+C23g
 I6pg==
X-Gm-Message-State: AGi0PuYpc5lNQQgFwbanz+cSifSsJ6+98JJ2CW7I8J9f0ptZLpGNNW6l
 uHyYt5c4pnGl/Ktq4nV9lREDwNcuht7Llzy0zZc=
X-Google-Smtp-Source: APiQypITa9uud77MgWOKfv5/bsyn1AtoDPFMqkWwa7SrGmMbocGqNVZM2IwZmmqQHyvfExGpiqMI4qU0IVkaOZx2RVw=
X-Received: by 2002:a5b:344:: with SMTP id q4mr28492863ybp.29.1586097444396;
 Sun, 05 Apr 2020 07:37:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200318011144.91532-1-atish.patra@wdc.com>
 <20200318011144.91532-10-atish.patra@wdc.com>
In-Reply-To: <20200318011144.91532-10-atish.patra@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 5 Apr 2020 22:37:13 +0800
Message-ID: <CAEUhbmW-Peu4UrQvSgSkZWGRwHzKavZ-dXzG8Yhq5C9uiHq42Q@mail.gmail.com>
Subject: Re: [PATCH v11 09/11] RISC-V: Add SBI HSM extension definitions
To: Atish Patra <atish.patra@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200405_073725_227746_19314E50 
X-CRM114-Status: UNSURE (   8.26  )
X-CRM114-Notice: Please train this message.
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Zong Li <zong.li@sifive.com>,
 Nick Hu <nickhu@andestech.com>, Anup Patel <anup@brainfault.org>,
 Anup Patel <anup.patel@wdc.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Vincent Chen <vincent.chen@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Gary Guo <gary@garyguo.net>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Mao Han <han_mao@c-sky.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Mar 18, 2020 at 9:12 AM Atish Patra <atish.patra@wdc.com> wrote:
>
> SBI specification defines HSM extension that allows to start/stop a hart
> by a supervisor anytime. The specification is available at
>
> https://github.com/riscv/riscv-sbi-doc/blob/master/riscv-sbi.adoc
>
> Add those definitions here.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Reviewed-by: Anup Patel <anup.patel@wdc.com>
> ---
>  arch/riscv/include/asm/sbi.h | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

