Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0CA9EB64DA
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 18:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5lqTNtiWWWty9BrGJajFWl3gNkGO3qjQn+/pZyaAHv4=; b=OwZQW93YL20gMV
	cRPF4ke8MsiEnn6kIz4U4KZ/tZ7e+L7a7IlMvNY7Mtx2JQKy4PUhdDyRTMfAfuQ4uHYAWNA75Sj+Y
	4CH3BlBNh667i+DiYPYgo52A9w3jeSsS+D41FOhpO+4PnazAFevnmenGZd7hI7RsxvjOv/3vEs0Xo
	rXAULrA1s3WaRqYjT4g5Mg35/OjiN53LtSN1gKrinCxYMV6SXnhwX5oPK2Lp+3eQALOGaY7ZyWsQD
	kXgPkpJOgqTOfPyQFubWoGni02W1VN3xtcACJreh2Pda21RZbs23tkgJOWPH2PB8AtXmRfBzQ9zqI
	dbVegS8mtV1uJubc5tXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFJGo-004M3D-1J;
	Fri, 30 Jun 2023 18:55:02 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFJGk-004M2A-2R
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jun 2023 18:55:00 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-98e011f45ffso242051666b.3
        for <linux-riscv@lists.infradead.org>; Fri, 30 Jun 2023 11:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1688151294; x=1690743294;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TNDdxm2uRBanyTPDPNPrPhakFGMtbZ0lo57cu0b88BM=;
        b=TNggm6bHMP4atZhQ+ioXsL1qmmri8OLjdoLgvmJJan5q9l7H02/6zQHP5r7nYWVkuV
         KAIbQTUZPRF9NtiJn1eW3+h0DLyvJFKevKHx76R6dp8pzfxz4QKMF+sbI04NXRZHDhGc
         7bONuGmijwn7chkj6o2ufyCw2HrCk+gA+PzG4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688151294; x=1690743294;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TNDdxm2uRBanyTPDPNPrPhakFGMtbZ0lo57cu0b88BM=;
        b=jO4LYJw3dEEEKZ8nhdqR80fIRmw5mEULQMbgJZonjOul2nEjjW2AEBysNhSjh84Zg4
         T66j8WigiDS0zof4v/nA2exvbzdI6q6Di5SDv49LQkifaThez0h691BinN5stKhHZhZ7
         fwin/nSQ6x+NxZzdi1PYbap929E/6QU29gdCt5Jn1Go/1SwqzQY3DeDAWZg4oNUPZ4fr
         dP+y19C9aOeJxUG/XKtaJDTVDVdxT7PAOijkQmO8fBfEPw4uDIIHUu2gy6MvJgdTkbIN
         QuxIWga43CK9iYz++k0uxkE58+hz8E0RWiIITD793gC5Ddq/vkq4pjZ5s2V5BQ4+Z9zA
         XIWg==
X-Gm-Message-State: ABy/qLY52AMBta/k0iRzPxt/Pb/SSvC2Wzv55zriHHAYGi0Lx46wfh6p
	FYwJ11VQBT0St97eBetlitVTZnABRzSOP9ZtsgcFzQa3
X-Google-Smtp-Source: APBJJlFPYpDzi/6mPyLi75m9SDxPCoFTgTW3d+pcC+hUa8a5OY4mZZsOWds5j7lIskSC1ttWyE0ECw==
X-Received: by 2002:a17:907:212e:b0:969:e95e:e4f3 with SMTP id qo14-20020a170907212e00b00969e95ee4f3mr2337852ejb.55.1688151294484;
        Fri, 30 Jun 2023 11:54:54 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id qk3-20020a170906d9c300b00984822540c9sm8366970ejb.96.2023.06.30.11.54.53
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jun 2023 11:54:54 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-51d95aed33aso2209969a12.3
        for <linux-riscv@lists.infradead.org>; Fri, 30 Jun 2023 11:54:53 -0700 (PDT)
X-Received: by 2002:a50:ee05:0:b0:51d:d4dd:a0e1 with SMTP id
 g5-20020a50ee05000000b0051dd4dda0e1mr1971858eds.15.1688151293677; Fri, 30 Jun
 2023 11:54:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wgqQCAtA4cVev0g3A6RCD16s1p-_TAUeVkGE0_yS2ehyA@mail.gmail.com>
 <mhng-784b868b-bc5c-44b4-ae82-3929f67ac5dc@palmer-ri-x1c9a>
In-Reply-To: <mhng-784b868b-bc5c-44b4-ae82-3929f67ac5dc@palmer-ri-x1c9a>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 30 Jun 2023 11:54:35 -0700
X-Gmail-Original-Message-ID: <CAHk-=whzdoWP5TRA=p=monXZmzo1Wd-gH8GRpcEUKh74nmDgZQ@mail.gmail.com>
Message-ID: <CAHk-=whzdoWP5TRA=p=monXZmzo1Wd-gH8GRpcEUKh74nmDgZQ@mail.gmail.com>
Subject: Re: [GIT PULL] RISC-V Patches for the 6.5 Merge Window, Part 1
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_115458_820062_B83067C6 
X-CRM114-Status: GOOD (  11.21  )
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

On Fri, 30 Jun 2023 at 11:47, Palmer Dabbelt <palmer@rivosinc.com> wrote:
>
> Awesome, thanks.  I poke around the git merge resolution stuff, but I'm
> never 100% sure so I usually just look at the resulting output files and
> then just paste in whatever git says as a heads up ;)

Yup. It's one reason I really prefer to do merges myself - I just have
done *so* many of them over the years (and did them long before git
made them much easier) that I can usually do them in my sleep.

Which obviously doesn't mean I then necessarily always get them right,
but I tend to have a higher success rate just because I'm so used to
them.

Regardless, I like seeing the heads-up for merge conflicts in the pull
requests, if for no other reason than the fact that it sets my
expectations for what I'm going to see.

For example, sometimes it means that I decide I'll just go make a cup
of coffee before tackling the merge at all... Not for something this
trivial, but you get the idea.

                Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
