Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EC94C433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Apr 2022 17:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=1Mtu//rQdSl16MMjMerVyWTRoJBG1mKvGfNF5vYOs74=; b=xw5qaMlpbC6cy0Ji+KHgsCnYr3
	FI/+sWR5ftd2Vxg+vvtN20JdlqDQLuQTBL81LgJE2L52iucW1aMTomgZD8NblXqGJKxPfXOS1O7PD
	vTpTicC3lcQY+ZUad8+Xx7PFQ61Xq/XX8iyXP6hhKtOyh4O01aWTh6UOYD4zMwunayvrNU4RKxhZa
	y9ey/otYs6F2xc2kk4cM/2PcbDI45sTYxYeuMmUtyEr3fGkZg2I7a2UbFRa2RNCTJJE3MhJv9Few1
	C/7ho7I7Gef2Iitbvh/sKd4HckhkCFuWf5viTveZ0GGf8UYMTvORKq0IgCSz8MNLwInPr26qIBe1X
	XioGN/uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naLUK-006lOF-Nr; Fri, 01 Apr 2022 17:55:08 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naLUI-006lMk-DI
 for linux-riscv@lists.infradead.org; Fri, 01 Apr 2022 17:55:07 +0000
Received: by mail-pf1-x436.google.com with SMTP id bo5so3309387pfb.4
 for <linux-riscv@lists.infradead.org>; Fri, 01 Apr 2022 10:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=iongRgn393jDScHsMFqxrfWy25+LUVsFTFfMXZy7tcs=;
 b=5DHzn4/4Gak55kwk9hNdkaIdBJXQSuh4T7djtDJzEyVrT2bs/etMzwCF9gb2kfNEul
 9abqnu9KEtppYl4M+gl+0S68ffL7FliVVzDB1GoFjkYJOSHBLGHXOKZ/PuVRGbUYLTI1
 T3zkvLghNRE7gM/4+Z7JwQRmRvmMSz+eOqa7Mzrt1vYFEnbdLTa4sdVm9m07qdPQSJ2y
 KfsGbVlqcsdnpZmkuHYhDzaNI19ybF4dyu7UvVLo5JrOjFBJ11ahz2VKexnPKOps8pAc
 JH2qWWmgdW80vC1zACuYuPpYPBuAUrx8ZY8Bmq3FiGr0NYigWvONSc/lDx6nh+sPWE5g
 XrmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=iongRgn393jDScHsMFqxrfWy25+LUVsFTFfMXZy7tcs=;
 b=CmSzMJX0IviCbTGUDM39oBhl4qPUUpRJuFq+btl0XSHw6R1WvzU8fFVWrH3jNiEwvY
 tTUu8Zflx8/fK8I1xLTnted/QqVxEpbqYxqsoBASVH89L0QMB50daXR1m6u4WccXyPiS
 LGlgrHTK3jVpgy0ZC9TqTsfPVYb3oo4Aubkz/HRn2yAiCB86qbAxgcQ8nXPvfDImWwF0
 WwDy96FCJbaYIVRmQw2CsQsxc8qT26ugmDxDKejI+4wDQ4WnB0M9bq8Rc+LROq+47KhI
 3HtXlS+fcGc1IdVg+F+bYw7f1sFgMu1yMX8UmITsh+7EM84wkDrOhpjwYQXZ0/GnFBxR
 gWQw==
X-Gm-Message-State: AOAM532wd+XBdDCNmFDyf5qb3ZfjpVl3l6t/fgWCGTKB6L/GOH8IY69a
 ocut91KyfoxHTJBpu90QecQuNA==
X-Google-Smtp-Source: ABdhPJwppucEmP01bI+aWljh4lysCOjDeGg0qSPNzu3mMPX4N67PpZVKiJX3L9pbyN5EHAHvjjmBRA==
X-Received: by 2002:a63:e716:0:b0:380:85d1:656c with SMTP id
 b22-20020a63e716000000b0038085d1656cmr16301723pgi.321.1648835701412; 
 Fri, 01 Apr 2022 10:55:01 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 hk16-20020a17090b225000b001ca00b81a95sm9533169pjb.22.2022.04.01.10.55.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 10:55:00 -0700 (PDT)
Date: Fri, 01 Apr 2022 10:55:00 -0700 (PDT)
X-Google-Original-Date: Fri, 01 Apr 2022 10:54:57 PDT (-0700)
Subject: Re: [PATCH] riscv: fix build with binutils 2.38
In-Reply-To: <CAHk-=wgv6rXFjTdaumFgDC4ixg6QMOL83sQ2XOqvJC0h5fLX2g@mail.gmail.com>
CC: mkl@pengutronix.de, aurelien@aurel32.net, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Kito Cheng <kito.cheng@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
 linux-sparse@vger.kernel.org, 
 ukl@pengutronix.de, luc.vanoostenryck@gmail.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-c280d48c-477d-4589-baee-255c774b5a51@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_105506_473105_F4C11B33 
X-CRM114-Status: GOOD (  13.89  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 01 Apr 2022 10:14:03 PDT (-0700), Linus Torvalds wrote:
> On Thu, Mar 31, 2022 at 11:53 PM Marc Kleine-Budde <mkl@pengutronix.de> wrote:
>>
>> | WARNING: invalid argument to '-march': 'zicsr_zifencei'
>
> Gaah, it works but still warns because I cut-and-pasted those
> zicsr/zifencei options from some random source that had them
> capitalized and I didn't look closely enough at the reports.
>
> Anyway, hopefully somebody can bother to fix up that. Possibly by
> changing the strncmp to a strnicmp - but I don't know what the rules
> for lower-case vs capitals are for the other options. I'm still busy
> with the kernel merge window, so this gets archived on my side..

I'm gluing sparse to my build tests now, so I'll sort it out (that'll 
also make sure a failure doesn't leak again).  Might not be today, but 
shouldn't take too long.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
