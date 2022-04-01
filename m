Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39576C433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Apr 2022 17:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bZOgohe/Cff6dFcraOuG2OqOP4L07pNPj7qj00MaG9A=; b=OAlvhNbcEIBgjH
	BaoRFIzb/Ha7PtcbjA8vP0hwiB4g9uaJv51q5xn8E7SqVjdBio1vXJ8Eyu/NnN4t5/j7Cx33d6Psz
	Dd1o6awO2K5KuUNV7kxiaoNdD2bBrPMvrxXoDsngEcaFwPjB05wZhHvi0+AuXLV5kHA1xO6+u3oDh
	Y0wFD78IOkzvqdD4JCU9LzkX6/Wd8TYxJ075hl3JIPKEsDiyive2QE6C/av3OsFG7FriTsrcEwsKn
	bbzmirJ7OOXlfE7YCwJN5AGphpqV9cMKec4SEh6bASjg7LHkyHY9bU2iTFj/6uHv91dXSkSnq4koF
	/mlF5FirOyT+3UZ4sevg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naKr0-006fEb-KX; Fri, 01 Apr 2022 17:14:30 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naKqw-006fDP-2x
 for linux-riscv@lists.infradead.org; Fri, 01 Apr 2022 17:14:29 +0000
Received: by mail-lj1-x236.google.com with SMTP id bx37so1039532ljb.4
 for <linux-riscv@lists.infradead.org>; Fri, 01 Apr 2022 10:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=utfv8DeU9QsQM5/Vhd4xkBU7PeKTZq1L4vDvZwcxU/A=;
 b=RnYrwK0OqKnAVMAa4S1NjLBhVOO5o1T9pT3+R/Z0DJQ7ZgcmyVh1fGfFWydC77Dqk6
 hTO+1etbZAy6rFIPVfziiLYn8Bbd9Z/nyH1w1uyvvh+s3For3BVIs9E5KDS2UJIJ/4fI
 s8CBuVIr9splx36gLjUC3J3QaGOu8QUc2VPlA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=utfv8DeU9QsQM5/Vhd4xkBU7PeKTZq1L4vDvZwcxU/A=;
 b=bndChLp/RR5nqDCV22noZQDGrVuc+NRNAFA7zJQcUMftClm6YFy/4eYVC7v1hnxwrp
 UhTQqhG7MTglqibMoLMNcJGiNBJmmaJAvdTqauUV5vi7eBkuy5kxE5JB+luQwiW4OEBq
 LixuKlzKrRfUDmesWeHU3aBdTw54+x7EeXwxq11ZhnGK2g16hsELfrnlhqnTWAQgi/au
 Q1aN+H7INT7iI3wPfEFTMAtTy/z6nNFSXX0zuVH8baTWYMv9zK4YNx3YiqAkkW2IMbub
 08sx0C+rSblYldgoM2+/l6fuLKTctgG7TPoPJ5JaUzmt9PvnwOUnf8jXaprf1/VikoWk
 VCIw==
X-Gm-Message-State: AOAM533ngIEJ5/I2QXcFHbjMP1xHmN/sdET+gBTnYM545PZMXeEGhtU6
 IXlEOy+VIqkeKkHPf1f5PTSwRY784CiqV2/YV6k=
X-Google-Smtp-Source: ABdhPJzXuPAw/Tpnj2BU1zPqP0xIsaEcl+L9VhAL9Ub0yVAoNNcwRMP95EX0nL8J99q7GapRQYTUbA==
X-Received: by 2002:a2e:90cb:0:b0:24b:457:63ea with SMTP id
 o11-20020a2e90cb000000b0024b045763eamr1970998ljg.153.1648833261014; 
 Fri, 01 Apr 2022 10:14:21 -0700 (PDT)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com.
 [209.85.208.170]) by smtp.gmail.com with ESMTPSA id
 j3-20020a196e03000000b0044a6e47c27esm291119lfc.48.2022.04.01.10.14.20
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Apr 2022 10:14:20 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id b43so4745888ljr.10
 for <linux-riscv@lists.infradead.org>; Fri, 01 Apr 2022 10:14:20 -0700 (PDT)
X-Received: by 2002:a2e:9041:0:b0:24a:ce83:dcb4 with SMTP id
 n1-20020a2e9041000000b0024ace83dcb4mr14079887ljg.291.1648833259843; Fri, 01
 Apr 2022 10:14:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220126171442.1338740-1-aurelien@aurel32.net>
 <20220331103247.y33wvkxk5vfbqohf@pengutronix.de>
 <20220331103913.2vlneq6clnheuty6@pengutronix.de>
 <20220331105112.7t3qgtilhortkiq4@pengutronix.de>
 <CAHk-=wjnuMD091mNbY=fRm-qFyhMjbtfiwkAFKyFehyR8bPB5A@mail.gmail.com>
 <20220401065309.dizbkleyw44auhbo@pengutronix.de>
In-Reply-To: <20220401065309.dizbkleyw44auhbo@pengutronix.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 1 Apr 2022 10:14:03 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgv6rXFjTdaumFgDC4ixg6QMOL83sQ2XOqvJC0h5fLX2g@mail.gmail.com>
Message-ID: <CAHk-=wgv6rXFjTdaumFgDC4ixg6QMOL83sQ2XOqvJC0h5fLX2g@mail.gmail.com>
Subject: Re: [PATCH] riscv: fix build with binutils 2.38
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Aurelien Jarno <aurelien@aurel32.net>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 stable <stable@vger.kernel.org>, 
 Kito Cheng <kito.cheng@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>, 
 Sparse Mailing-list <linux-sparse@vger.kernel.org>, ukl@pengutronix.de, 
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_101428_770692_661B32BA 
X-CRM114-Status: GOOD (  10.71  )
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

On Thu, Mar 31, 2022 at 11:53 PM Marc Kleine-Budde <mkl@pengutronix.de> wrote:
>
> | WARNING: invalid argument to '-march': 'zicsr_zifencei'

Gaah, it works but still warns because I cut-and-pasted those
zicsr/zifencei options from some random source that had them
capitalized and I didn't look closely enough at the reports.

Anyway, hopefully somebody can bother to fix up that. Possibly by
changing the strncmp to a strnicmp - but I don't know what the rules
for lower-case vs capitals are for the other options. I'm still busy
with the kernel merge window, so this gets archived on my side..

             Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
