Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3FDBC636CD
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Feb 2023 18:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SbLsC7FpSkL2K7UPsGPNKtICD00TsoB8fCPhh3SYMl0=; b=AfTyHb1q7dpcfH
	kiJHZHGw8/zUZe2YDa3VZrjf3En6ury0axdBRJqLVlyNIqk1GacFqrusEsfR3DJTppkhzY0JOAhlD
	7WN1BaIg7JYk0c6hznML9STBaTjsj9gWm8k6qREjoy/JFeg4CeSYBkUyNUWu9es+IhO85kP8rs4qM
	EB++LrU3rwIknka9V/BWdd1OJehyWyIoYbq/ecMZ1RKb9XVXRIenxJhYx8seRnFw6mfuaOJ2VoBwo
	jij5FLFFSEz2A8yrGiRQstgBKRi40dZNHwUeDikVYMnVPgkL7cL6BRdYP4OrjCUtLAZbr6vj6oEcX
	sPBdldpR0XUKsMOp9uDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOk7i-006h4R-33; Sun, 05 Feb 2023 18:52:22 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOk7f-006h3m-2W
	for linux-riscv@lists.infradead.org; Sun, 05 Feb 2023 18:52:20 +0000
Received: by mail-ej1-x633.google.com with SMTP id ud5so28567961ejc.4
        for <linux-riscv@lists.infradead.org>; Sun, 05 Feb 2023 10:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FHO7GI+A1DWHNoRePsnR8I5+C4R4p3/7zIJvX3p+LUg=;
        b=HW9XJWDNzeOCSuB6xjuHzGjlFrFpNWXt04d038AYbQHAwGjnEJnVJFaDX127TnFYpL
         ydEGn0SwgrZ26RVkS0s0lgFAxMQXSWztEh7hBcLvV0G2Q3rBSAhctrbX0nTU4l9fQ760
         cFueFrfradqcL9O/I0nJrdeB83AKu6+dYCVG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FHO7GI+A1DWHNoRePsnR8I5+C4R4p3/7zIJvX3p+LUg=;
        b=D8KSd39imuVdKkwJTrc8VhPjQzWRRN/xvkFihIlTxGlZRu4w8xi1c9inCH3b9yNHYg
         KnPGSLNYImmyRzF/Dbj6cnPLMLLBHptAIe+y49a5I+rTIV3aAbXCluGi07V864gmaW9I
         2tGTT6bTCFwEvaIpoQyiRovbrjhI5sD5PK+DOAQilhL7692EvmyuMlchxCmsoY5Mzkuo
         XtvpSP6XpcrUIirV5rCgtf1qT363t6UG6eZpTsgla5YGjVsexKAKJxOL9hrQtePpNqD2
         oDDtCwMbCzuCTRkGfie/7XaW3OuEvvnLLwCvQ+6qjZHMQRnTxHCNkmaNg9XLQAd/6pbq
         v3dw==
X-Gm-Message-State: AO0yUKVarz1hKF9ZOsvyyXLGz0PbKpxxhijvOvUuQhYI3Cy3k5f87o9q
	Ackb1nuIoWtyv5sR4ed5qxmbLvyIv+Bh+GXiVWY=
X-Google-Smtp-Source: AK7set+UzgtSuExmWYccaXKzocxHq1Z9hPMGJYesy5jARXbd8plVqlwTwdjmQ+GRp7ZTUAnDi52bGg==
X-Received: by 2002:a17:907:728b:b0:8a4:7fb9:5656 with SMTP id dt11-20020a170907728b00b008a47fb95656mr263648ejc.57.1675623135864;
        Sun, 05 Feb 2023 10:52:15 -0800 (PST)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id s13-20020a170906c30d00b0088842b00241sm4404732ejz.114.2023.02.05.10.52.14
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Feb 2023 10:52:15 -0800 (PST)
Received: by mail-ej1-f42.google.com with SMTP id k4so28577341eje.1
        for <linux-riscv@lists.infradead.org>; Sun, 05 Feb 2023 10:52:14 -0800 (PST)
X-Received: by 2002:a17:906:892:b0:87a:7098:ca09 with SMTP id
 n18-20020a170906089200b0087a7098ca09mr4354270eje.78.1675623134603; Sun, 05
 Feb 2023 10:52:14 -0800 (PST)
MIME-Version: 1.0
References: <Y9lz6yk113LmC9SI@ZenIV> <Y9l0aBPUEpf1bci9@ZenIV> <92a4aa45-0a7c-a389-798a-2f3e3cfa516f@linux-m68k.org>
In-Reply-To: <92a4aa45-0a7c-a389-798a-2f3e3cfa516f@linux-m68k.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 5 Feb 2023 10:51:57 -0800
X-Gmail-Original-Message-ID: <CAHk-=wirpn8qX5hCyeS0a4GCQH5p-2ACXgzJTj7zjZ5rGux_Bw@mail.gmail.com>
Message-ID: <CAHk-=wirpn8qX5hCyeS0a4GCQH5p-2ACXgzJTj7zjZ5rGux_Bw@mail.gmail.com>
Subject: Re: [PATCH 04/10] m68k: fix livelock in uaccess
To: Finn Thain <fthain@linux-m68k.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>, linux-arch@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>, openrisc@lists.librecores.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	sparclinux@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230205_105219_173014_8C39E171 
X-CRM114-Status: GOOD (  13.13  )
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

On Sat, Feb 4, 2023 at 10:16 PM Finn Thain <fthain@linux-m68k.org> wrote:
>
> That could be a bug I was chasing back in 2021 but never found. The mmap
> stressors in stress-ng were triggering a crash on a Mac Quadras, though
> only rarely. Sometimes it would run all day without a failure.
>
> Last year when I started using GCC 12 to build the kernel, I saw the same
> workload fail again but the failure mode had become a silent hang/livelock
> instead of the oopses I got with GCC 6.
>
> When I press the NMI button after the livelock I always see
> do_page_fault() in the backtrace. So I've been testing your patch. I've
> been running the same stress-ng reproducer for about 12 hours now with no
> failures which looks promising.
>
> In case that stress-ng testing is of use:
> Tested-by: Finn Thain <fthain@linux-m68k.org>

Could you test the thing that Mark Rutland pointed to? He had an
actual test-case for this for the arm64 fixes some years ago.

See

   https://lore.kernel.org/all/Y9pD+TMP+%2FSyfeJm@FVFF77S0Q05N/

for his email with links to his old test-case?

                Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
