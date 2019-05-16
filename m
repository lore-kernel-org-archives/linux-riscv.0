Return-Path: <SRS0=H4VQ=TQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E39ABC04E53
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 16 May 2019 01:50:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3E0A20873
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 16 May 2019 01:50:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Bb4NC3iB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Pf0mWhiZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3E0A20873
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zj4LZKPEZJ3N/eEAF1fxD3o2HldVqO+O2CXd2GBvd28=; b=Bb4NC3iBHG/F68
	j3cMSo2hcNODCHW/ABiJaPciUOyxcGqMddhUBU4zIaRhiCeQP5dOfeR6Cd90prBhRcYYDDIY8i7gN
	JWC4E0xaF/JEb1AplIn+hWL3AyM+JXoIoAeCLStdsOkZ3Lj7MWUdjDBqLh31f05pAsx2+DvU6E35u
	9BjuddAE8OdxQtPXM979YcdvaWks3ZwDFCKz9uyqA0kQHvKRpa27F10/qUiQQMOsCrruFxFM6wuV/
	G+B5CZsCkZlVtAE+HmSF11DouMZ4cM3josIJsYuj9FiW9MuDH7RWMWhpCt+ApitIkxBF8so0bJ6uj
	whuXfM7V5WnsDcelpQ4g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hR5XH-0002yO-Fs; Thu, 16 May 2019 01:50:19 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hR5XE-0002xg-LY
 for linux-riscv@lists.infradead.org; Thu, 16 May 2019 01:50:17 +0000
Received: by mail-lf1-x12b.google.com with SMTP id y19so1292952lfy.5
 for <linux-riscv@lists.infradead.org>; Wed, 15 May 2019 18:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1eJ7zq+bbWUBl6uTT/Oi/zTtKOAXvl0vTCu6S+eKKjg=;
 b=Pf0mWhiZ+sUUrUff614uWxE95Su9GTskTCzTGgmd97yGl7tdorXVdA608ETMTsE7c3
 iBNGIH0NJh5+rka4Hc+AwsdujnfIVuE43zsq/IOFAGPARTBtQhHQORhBIfx/5qQL23zC
 9nOh30bk37wglCI+MPC+x9M9E1z+6wmtbpzJg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1eJ7zq+bbWUBl6uTT/Oi/zTtKOAXvl0vTCu6S+eKKjg=;
 b=l5/E3EPIwCSZ70S5D0Jq2LJa7Eqg277C0eCs2QUN4fvMNCdDaMYO4pEIWBXO2ogXLk
 cZIUqYS7gm7tb8x63AbK7r07r418cYut52J0oejsUIKL4sD5AUEOf+7x/VRbFff1M97G
 cAwS+SPDI8uc5TNCOLypcXcFeAAOP8qf4H/EdM8fAFwBeo2EftWCsjPkk//41K9y8tgQ
 MtNfS1drEZ0z3qnF0duXL4y6TIS5St1p4HlQS8YfpL2nTyO3qL5UHDSQYbGoOURZoc6U
 zv312TwBugDnorJdIUWxORuz0dABapVMbtGCLF6b1JSjHhDylmeKJlBGKFB7PO8yXKIY
 CCCg==
X-Gm-Message-State: APjAAAWuekJP4uXrdWhU61Q23kYpZSst+SqybhBfrhGMgsFaruvJHUlC
 S3IZoChZ+DTHOZ3JerfQrVr+dKrLEZw=
X-Google-Smtp-Source: APXvYqyXEOZsHGIsP6zmK/0e80uInAUskzLaQikoNPLvFrdh1P4JEepkOUzC3Z6q0yuI8zxh2+XQMg==
X-Received: by 2002:a19:81c7:: with SMTP id c190mr8989739lfd.55.1557971413744; 
 Wed, 15 May 2019 18:50:13 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com.
 [209.85.208.180])
 by smtp.gmail.com with ESMTPSA id v12sm617087ljv.49.2019.05.15.18.50.12
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 15 May 2019 18:50:13 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id 188so1523404ljf.9
 for <linux-riscv@lists.infradead.org>; Wed, 15 May 2019 18:50:12 -0700 (PDT)
X-Received: by 2002:a2e:978f:: with SMTP id y15mr4350081lji.125.1557971412623; 
 Wed, 15 May 2019 18:50:12 -0700 (PDT)
MIME-Version: 1.0
References: <21598eb7-8ff0-2b6b-4cab-c0d1295fd46e@wdc.com>
 <mhng-54fad465-30c1-426c-84c1-99fd4ac827b0@palmer-si-x1e>
In-Reply-To: <mhng-54fad465-30c1-426c-84c1-99fd4ac827b0@palmer-si-x1e>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 15 May 2019 18:49:57 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjBRKqBHe5Au=TpDq3B5p=AFKvpaf_7XSU3Mv0MgfGj+A@mail.gmail.com>
Message-ID: <CAHk-=wjBRKqBHe5Au=TpDq3B5p=AFKvpaf_7XSU3Mv0MgfGj+A@mail.gmail.com>
Subject: Re: [GIT PULL] RISC-V Patches for the 5.2 Merge Window, Part 1
To: Palmer Dabbelt <palmer@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190515_185016_713550_FE1EC0B2 
X-CRM114-Status: UNSURE (   7.86  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: atish.patra@wdc.com, linux-riscv@lists.infradead.org,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, May 15, 2019 at 6:43 PM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> Linus: I'm not sure how to tag this PR as a mistake, so I'm going to just send
> another one.  If this gets merged then I'll handle the follow-on.

Just emailing in the same thread ends up with me hopefully seeing the
"oops, cancel pull request" before I actually pull, so you did the
right thing.

To make sure, you _could_ obviously also just force-remove the tag you
asked me to pull, so that if I miss an email any pull attempt of mine
would just fail.

.., and if were to have ended up pulling before you sent the cancel
email and/or removed the tag, it's obviously all too late, and then
we'd have to fix things up after the fact, but at least this time it
got caught in time.

            Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
