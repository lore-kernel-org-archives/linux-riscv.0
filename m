Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE80C00140
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Aug 2022 14:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jsso5QyfzY76MFdsAxx8vg3Hn+/dKb2fYEp1ltpcZco=; b=3LN7guOl4rJ2mz
	iH0i8LdYNMIlkEbHTNe916HNvO9jPxdByl9ikLywNO7Oz8e83jHnhoXOxdfYQ4ljOP+A/c+BdGwV9
	NCIS3p1mf2zWBGdaJUaKHB/iw/cFpK/1vRBcTyRBPgeCjkDXh0eOfgfcycPBMIb78oupVZdOrGA1Y
	Iv8CzWOEGtfGgJNsqJfgtnzAz841rASQZF3bUu2D8BfHYwlCf2kPNZ5O6sV2SjYY2p1rU2biJgoxx
	CTE/Qm5uPmwCQfkTzK2rr5L1FeKeY2alby+RSJ5cx1P1s36+yJs1PFPHi9qyRIQrjl9CbZbWn4wyE
	MXffyFKjhiO9FIVpofgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIsi9-00Esxf-9O; Tue, 02 Aug 2022 14:17:29 +0000
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIshl-00EsjA-Vy; Tue, 02 Aug 2022 14:17:07 +0000
Received: by mail-io1-xd32.google.com with SMTP id z132so10761706iof.0;
        Tue, 02 Aug 2022 07:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dzbPWwhcEKIUb5XmuwsXZk0WHu1HAmpGHak33W/hz4Y=;
        b=SY+mGld3c8Zk5Jxf7IddnvW31p46/D08XTmBEhxsrkVs4fSRF9TXUtbmjH5o29Gxrt
         bM66MbluvwjQq1o0MRDc/b6vnsKl1e+6ofpDuhtDNVKZb08z8wTfrEPdcJSCiW6ofXiB
         qEuAm4F+ALOKrC2llY5tCHy3VoSjYivoxA06GuVSAfECweP/3IaLqi3p3FY6ucuhokla
         K4mOlgf3XQjAXVMtSZachXXq7XaOA4DS7qtJwOaRv8mXGyQ+Z+gZE4oZIhwUV0zcSiun
         FkleluOQc7MJ6OTzXCqMZT9Pusj5PuHsJNZDnH4IvH4LGi5U09DMZvSX2vIPTdKNG3zj
         mTdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dzbPWwhcEKIUb5XmuwsXZk0WHu1HAmpGHak33W/hz4Y=;
        b=ZY1zYYLivdZn8+A5JG1MZRIOYp3d7eAx/ZL8tx0xj+lFLVvxW3YnD8Hsa6UTESEOkj
         Is68dvsWyZn1ZlBwsxtVkPGzbxWCHMb/0q0vXy2HGIHRaL3l/Ta7qwqW7Ce5STpsF7cU
         UmpZwwSppi7FQD38iHZxTXoL2acqxtKu7ryNDf10aG1StNzLG0P/0+U/oFYtpL7fe4hk
         EY3pHftmRcnD0sTOFH+q86hrEXCCdJNA2wXQQpGXX298wNE/FQU8owvHFEMIh5zzxulw
         V/bSFIkSmcPGOFOFNBp+G7uGtrgqPRLspsEJqnUXvjtxt4B1Ec8YFS9JM+63reMruyJy
         BqpQ==
X-Gm-Message-State: AJIora/LOfRXbhxQiARnHI4El/0mOlFnc6riQnEDz6qnJtD+u+oZ721U
	n2X76GhEZMgf8EuyqXFLZYgWjDovBZuuN/c+O5U=
X-Google-Smtp-Source: AGRyM1uIEC0PcctxDbe0s059lTbpgzq5joEE1C4fgSlA6DPH4iRSwaj5/x2NpdBckrK5+ERUo19alicmxyTxfHdCTU8=
X-Received: by 2002:a05:6638:25cb:b0:341:6546:1534 with SMTP id
 u11-20020a05663825cb00b0034165461534mr8193243jat.308.1659449825119; Tue, 02
 Aug 2022 07:17:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220802015052.10452-1-ojeda@kernel.org> <YukYByl76DKqa+iD@casper.infradead.org>
 <CANiq72k7JKqq5-8Nqf3Q2r2t_sAffC8g86A+v8yBc=W-1--_Tg@mail.gmail.com> <YukrFS9NIMSP/I/Q@infradead.org>
In-Reply-To: <YukrFS9NIMSP/I/Q@infradead.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 2 Aug 2022 16:16:53 +0200
Message-ID: <CANiq72=rRxQf+CLhDBpR7YFYkjSFKQoik082q5_bgh_AMCb3rQ@mail.gmail.com>
Subject: Re: [PATCH v8 00/31] Rust support
To: Christoph Hellwig <hch@infradead.org>
Cc: Matthew Wilcox <willy@infradead.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jarkko Sakkinen <jarkko@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-um@lists.infradead.org, live-patching@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220802_071706_049717_FD4E0768 
X-CRM114-Status: GOOD (  12.14  )
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

On Tue, Aug 2, 2022 at 3:48 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> handwaiving and pointing to git trees is not how Linux development
> works.  Please make sure all the patches go to the relevant lists
> and maintainers first, and actually do have ACKs.

Which hand-waving? In fact, we were requested to do it like this.

As for the Cc's, if any ML wants to be Cc'd for an abstraction we
create, even if no C code is modified on their side, I am more than
happy to Cc them. I can even do that by default, but not everyone may
want to hear about the Rust side just yet, so I have not been doing it
so far.

Cheers,
Miguel

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
