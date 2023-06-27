Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4367BEB64D9
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 04:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dg9/x2sI1IP12zfVxwun2SeyOTHPGnFiMI09Tp/N/YE=; b=WhKdyTRX6f/pVC
	FwIav3sceybNNLKcM4ky74SANH9BX4x8+Le3woK77SBtHf6+dGC6DOPREy6LJwVSzBRvwT+ftISrf
	XKinN33trZ0oKKLrQ1msczcMkWV272++37m6I0ni1Vhhe3ysu445/ZOQR5zy0ZmUdL9vto41tgmJ2
	rMzn9X/X+T9v2twVGdK9Wn8l39HsJIKA1VDqih2fYrvOy7L0piI5poMkEM24znvl0Y1zpjDuwZ4fo
	DYfuZEJfuea9CqtoJzC0qqzOJlUs9vQGreOkC3kGH9RjlGIop7dRXUxGHp0aG0rKwIuQgzI/dB4dH
	kWAbZp/jod9Xl0cJKgyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qE00a-00BeYt-1D;
	Tue, 27 Jun 2023 04:08:52 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qE00V-00BeXF-0V
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jun 2023 04:08:51 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-765a5b93b5bso180629985a.3
        for <linux-riscv@lists.infradead.org>; Mon, 26 Jun 2023 21:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1687838924; x=1690430924;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yf8KYm9SDdHCbvMq49yvPwBt6bCyUoPOrxML9Y2T6mw=;
        b=ZwvguHu2TdbTkFgoMUaxXLPUeTYJnhzKqQK2zf57qNwJlYE7hgcqe11Mn7R8Vh9WwL
         XkwWLwVGKFO1m//RZnt6Z1lxG19ZHtIxb6eR0kzjF14fgNCrSin/TBaqkUg/vSotud/r
         l6JM8Kdol+HOhTf/XuN+9W11b3CJeIuHVsVvsh/YKk06E+BZhNi6ozCdse9ENk9lxKH1
         sFllnV3YZ7Ci9X8dO6WPDTfyVp3pRV5Nlz5SMrbwW84IIMeBZt0rRttSLGGbz8MVYTIi
         bzER1GYokqQpdRGORspXeZQqUnl040IsVFuSwpFl9zCBFpjtjLkaOFQoxyX1T96cI6ZR
         yf2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687838924; x=1690430924;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yf8KYm9SDdHCbvMq49yvPwBt6bCyUoPOrxML9Y2T6mw=;
        b=TLrcL00FpbWmtL4J3wPHc4eu5z38jvJhoLOCcbdLUq9kz4orZwUdHcVzhn6CQIU61Z
         xvAGwQduVYXk99B15Z3a/hYe9+oH2zXQDql5gjtfObn4udOKqoZCAL2ZtzoQ1p1r/MxY
         xAZG8kNT853SVUxbzy3StYlWDeW//lvzQCoEMYCWq1dGoQDG14To6SJODyOM1fSnpeOz
         O0aEyBpqZy00QUSP/BuZtMe2aM8qSNMM+XpjUGUOCLjz6Y5C4TQdS7Sq54tPN/juMk6F
         zO0PaFS7DPXivTYbNv6m4n7T7dqiKVYs2UiTc1KYarZDLYDhT1ApE2CKmReQgy6r8UGm
         l2Aw==
X-Gm-Message-State: AC+VfDwO6TXPYoib/+Ku0aoJR7A1M77ZuydsPfOO3wXyveF20dsiRpo0
	diedv+1/1gKg0WSjvDwsRU0CRg==
X-Google-Smtp-Source: ACHHUZ5FqGMKLxJfFONY3IKVLAq1woo1nDE3AeDAOQTrXE9Tfp7KHSu2vl4AxWz+AW/e2Ov3MkKRwg==
X-Received: by 2002:a05:620a:440b:b0:765:3a94:940f with SMTP id v11-20020a05620a440b00b007653a94940fmr19798737qkp.33.1687838924506;
        Mon, 26 Jun 2023 21:08:44 -0700 (PDT)
Received: from x1 ([216.250.210.83])
        by smtp.gmail.com with ESMTPSA id i2-20020a05620a150200b00759300a1ef9sm750770qkk.31.2023.06.26.21.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 21:08:44 -0700 (PDT)
Date: Mon, 26 Jun 2023 21:12:45 -0700
From: Drew Fustini <dfustini@baylibre.com>
To: Atish Patra <atishp@atishpatra.org>
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>,
	OpenSBI <opensbi@lists.infradead.org>,
	U-Boot Mailing List <u-boot@lists.denx.de>,
	"open list:RISC-V" <qemu-riscv@nongnu.org>
Subject: Re: CFP open for RISC-V MC at Linux Plumbers Conference 2023
Message-ID: <ZJphvbTsp6Q4Dfrq@x1>
References: <CAOnJCU+uMF-brnyjA1HLhupYPqL0ebOVu+ivrSn2AewuSrhtBw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOnJCU+uMF-brnyjA1HLhupYPqL0ebOVu+ivrSn2AewuSrhtBw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_210847_424485_F49F11DE 
X-CRM114-Status: UNSURE (   9.33  )
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

On Mon, Jun 19, 2023 at 12:55:39PM -0700, Atish Patra wrote:
> The CFP for topic proposals for the RISC-V micro conference[1] 2023 is open now.
> Please submit your proposal before it's too late!

Thanks for posting. I am looking forward to it!

> The Linux plumbers event will be both in person and remote
> (hybrid)virtual this year. More details can be found here [2].
> 
> We will start accepting proposals after 15th August 2023 to avoid last
> minute visa/travel hassles.
> The conference registration sells out pretty quickly too. Thus, we
> would prefer to sort out the schedule sooner than later.
> 
> The final deadline is 15th October 2023 though.
> 
> [1] https://lpc.events/event/16/contributions/1148/

I think that page is from 2022 and that this would be a better link:
https://lpc.events/blog/current/index.php/2023/06/23/risc-v-microconference-cfp/

Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
