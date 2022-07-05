Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE3FC43334
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jul 2022 23:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=QR3sLLstgmkcepxPVdygoIxHtWn229DY/vsxFAQYUEE=; b=D317xphbx3oaG93cvZAZFI6HCG
	RQR4FFhu67Ty9ubPHhGur/sNeuEoqZAM4l8dXSAE60RpHf1Kvtv3REZRe+JmUeRSvHMKpm63UNs/b
	rZp+bDJ7A1Em7qjcLsWzzeybjtYWpAhAR7A9oDD30y84oLtbQx7kScaNbPPCmWbrJhIw16Hl3zOo6
	vS6KXXJ4oBJ/FsHCY4qvE0fU/4+8Mw+Iz3YjyiRwy3Ma81BB3sPBbims1kR/JbiLEWYGLZ0NQmF35
	XPd80GE8CCle5mHjoyTT2xiaF6UntSXMZ+85oTCyYh9kZaVLBK9NfB268LoA2eGM9U8CRPXSxZVIL
	cui1OUVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8rfG-003TOD-6f; Tue, 05 Jul 2022 23:09:06 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8rfC-003THw-L3
	for linux-riscv@lists.infradead.org; Tue, 05 Jul 2022 23:09:04 +0000
Received: by mail-pg1-x52b.google.com with SMTP id e132so12645757pgc.5
        for <linux-riscv@lists.infradead.org>; Tue, 05 Jul 2022 16:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=z8EKfgRX0wThVoewP5wZ3r1yeN0h/8IMac2/h3YDe7I=;
        b=BK8FYUugTCWAPVoY2qcCxvo1PCPnf5zl6hjLvKmhg+LKpoNRDnQEndHZLEYRll0zk3
         8FL0J0rgAkwpOjwIYjSb40V2nKDdipnzi3YMb3rG1UJsltyWDElPNfESAUBXuMY40VSV
         o3K6zIhZRY062fYakbVti4zmlBPCCU6+aNVUQqwkgq7RugpXGgtEWBKodCUgr37tOgC7
         pDjKVjpck+Fdaj3qKrzrNmBz5g9rgxHqKfLBTmLvQTsEWJiZqc/mq1uJnV0rTvWBs152
         ar5AR8G+dduxlYGnzVqbQ9NEXybqKzt/XyBzmmYFHjwO1zT+nOSezNkbPTvMg3gmvBkg
         KkvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=z8EKfgRX0wThVoewP5wZ3r1yeN0h/8IMac2/h3YDe7I=;
        b=v4qhp8VPdtmrmOvEK5zSEbJrgnNM0vapEZyWCy4gM1Q9ak0MPa/nBRhbS+WgkQNecg
         eB89WI/uJ93LEGUC0PYTEwF60apC7npbPWgFTijvGmGbI28azYg1Sqsw7lEU55cZTBao
         Gy3GhOKU62Iw7PMQWXefDpHM6Vd8czBbwZame2xl0bepX3FPku72s7npL29jwsK21o91
         UE7R1FjjAivF5qyWjMzO+1sUq22iM+N+gCr3gmpi/wUQvhAiD2v3RBFTVrRFWNyE/gja
         cuci/wsDhWR0R4y6Ndr7hB6Cs3LpckmKL9oGG4vU6QowkBtcRiXKg5aYE7FjsTmvTv1o
         rdOQ==
X-Gm-Message-State: AJIora95R5CBLxmqZyACx0TLSmXZUsNDRHEthZDLFafxV8ve76ooICE1
	EPrTGwQ1+pLTAhP/i5mX0si3FOWpJGtFHQ==
X-Google-Smtp-Source: AGRyM1uaXORTwb0ZRybtB59eAa2VAOw3qiqMgTloECFVIf7k0bbcwET7ZNLv2JIxwd1D/fVc/EuK7g==
X-Received: by 2002:a63:9b0a:0:b0:406:8c31:47e6 with SMTP id r10-20020a639b0a000000b004068c3147e6mr31114432pgd.329.1657062540886;
        Tue, 05 Jul 2022 16:09:00 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id u16-20020a170902e5d000b0016bd16f8acbsm7968883plf.114.2022.07.05.16.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 16:09:00 -0700 (PDT)
Date: Tue, 05 Jul 2022 16:09:00 -0700 (PDT)
X-Google-Original-Date: Tue, 05 Jul 2022 16:08:58 PDT (-0700)
Subject: Re: [PATCH v1 0/6] RISC-V -march handling improvements
In-Reply-To: <20220521212325.lw6fdzsmlwvioggv@mail>
CC: linux-sparse@vger.kernel.org, Kito Cheng <kito.cheng@gmail.com>,
  linux-riscv@lists.infradead.org, mkl@pengutronix.de, aurelien@aurel32.net,
  Linus Torvalds <torvalds@linux-foundation.org>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: luc.vanoostenryck@gmail.com
Message-ID: <mhng-6db3942c-ae4a-497e-bda1-01e7e2661595@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_160902_955819_69F5D39A 
X-CRM114-Status: GOOD (  12.70  )
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

On Sat, 21 May 2022 14:23:25 PDT (-0700), luc.vanoostenryck@gmail.com wrote:
> On Fri, Apr 01, 2022 at 10:00:35PM -0700, Palmer Dabbelt wrote:
>
> Hi,
>
> Thank you for these patches and please accept my apologies
> for this much delayed reply.

No worries, looks like we're about equally slow ;)

> I've just pushed the Zicsr and Zifencei patches since these solve
> an immediate problem and I've some minor questions/objections for
> the other ones.

From looking at sparse/master, it looks like a lot of those comments got 
resolved and merged.  That all looks good to me, I pointed my local 
sparse over to ce1a6720 ("Merge branches 'unreplaced' and 'inline'") and 
will be using that (via `make ... C=1 CF="-Wno-sparse-error"`) in my 
pre-merge testing until something changes.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
