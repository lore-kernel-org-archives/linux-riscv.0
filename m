Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDBA2C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Mar 2022 19:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=pDY60A9oBaLyf0hgdqOn6RSjbw8Uf9ZAPWPZYXEFFGE=; b=e3cG2hEl29zs2EgcEpsxjsZeKv
	5Ts16mdNpF1SflttauqJKijXkaPX5W7PalCZ4eATFO2mT3K4b/utfhDDgEsJV9dK5qxtIkPThJhoM
	cc67bb2rFeHiltnJw5TkOcSXlEA/PmVD2g46iRu00QGsFkcdZJL+7NMpoC0OIsJ1Bl1AwKwNWF0R1
	Ha7nBYiu3U/miGt1Abk7mY+k6VO8r7Z0mJntsSVtujGY3dkUr1dcdnMc85WNjLiYa3jf5TbThMell
	h8JyFCN3AwWZV1agTLLoSkiNju5rudsk52d+aajgtZnQhdmx2wOf05Nojkl5Sc5IZJGNVCUWDP9Dd
	68vyotXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1na0gz-003Szv-65; Thu, 31 Mar 2022 19:42:49 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1na0gw-003Sxa-VZ
 for linux-riscv@lists.infradead.org; Thu, 31 Mar 2022 19:42:48 +0000
Received: by mail-pj1-x1032.google.com with SMTP id d30so445617pjk.0
 for <linux-riscv@lists.infradead.org>; Thu, 31 Mar 2022 12:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=FLmyF/ADmt/SVOlekhuzZ5m0Y9Svgpyvb8XZ74qoiUI=;
 b=pD5w7XtghtGzZsLNW7+14BYv/55evR2ezIh8Iq4+xg6pZOAnWHAiX9ZRBAu0XS59Wf
 N74V4845Tv6DT+5Dm0o+pl3vuVQhHgw4cU5/HMOhaaoznrq5Hw2C32QqBfTAwa8MARTd
 ywo04mo3WS6B4A3l358e75e/CyMVVMxAEgCdCbsWZWfkJEVwqyWNWTnzCJh65WGHttNZ
 P3PDq6ZYQ7bvnFUniZ2NB67FbZmFgD95V8kqLwtvOyGU2Vtg2UAWl31CBNCyBZyOgaTM
 4J5tj9IrSs6JLK7mJiXkDy+g5HAlbFgO7fPSUUhfcS1SkngyOhlzj8LcWQMJNHsKluL+
 rrWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=FLmyF/ADmt/SVOlekhuzZ5m0Y9Svgpyvb8XZ74qoiUI=;
 b=BQPF+hYM/lQp1pTYuTGx12J7xo4AisYIMIe3ECVXaTa9zoVgML+HDfJ3KZIIdjp5Dg
 pJV8JT3qsRSql7NWVnrRCON7s865kuhVdFCF7hundpWn9TBhgSttdFibo0yPH5QDM1xi
 3YVrLr49tMvtb8lhJzEtTb/SjfYhAcMY2pU2sLpbNyLXqBP94HlycA6YyZ/t8M0doV4z
 esOe4Pwu6ec0IOjpCzDih+SR+obSAaJDWrk/pmdoyks8aJsa6RqkpYtftBQOOeZ5iHTm
 GASQgNV/uEESTwkEUF1TSP9aVIdC0544G/v7+ipPgXQ/ikF3n7asU0lN8fSIGob+eDNb
 q7/Q==
X-Gm-Message-State: AOAM531JkTsjWNsN+ehrKOxIWgo3eg+ja2QNMh5Vanwn2QPxqQ3caUFI
 bWUtgKyKjAoWfZ7t3vtDonpFHw==
X-Google-Smtp-Source: ABdhPJxaGZz1vhPYU1kLfpDIJMLn2dWkfNb3LGwg9IPLvlr/r2wlcOtYuaK9JMWEpE/iAoqv3DfpXQ==
X-Received: by 2002:a17:90b:2242:b0:1c6:80e3:71b6 with SMTP id
 hk2-20020a17090b224200b001c680e371b6mr7866471pjb.152.1648755757630; 
 Thu, 31 Mar 2022 12:42:37 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 r8-20020a17090a0ac800b001c9e35d3a3asm155420pje.24.2022.03.31.12.42.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 12:42:36 -0700 (PDT)
Date: Thu, 31 Mar 2022 12:42:36 -0700 (PDT)
X-Google-Original-Date: Thu, 31 Mar 2022 12:42:29 PDT (-0700)
Subject: Re: [PATCH] riscv: fix build with binutils 2.38
In-Reply-To: <CAHk-=wjnuMD091mNbY=fRm-qFyhMjbtfiwkAFKyFehyR8bPB5A@mail.gmail.com>
CC: mkl@pengutronix.de, aurelien@aurel32.net, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Kito Cheng <kito.cheng@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
 linux-sparse@vger.kernel.org, 
 ukl@pengutronix.de, luc.vanoostenryck@gmail.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-7e447636-2324-406b-9cfc-e5cf766b1737@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_124247_040283_98D7128C 
X-CRM114-Status: GOOD (  17.02  )
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

On Thu, 31 Mar 2022 11:16:53 PDT (-0700), Linus Torvalds wrote:
> On Thu, Mar 31, 2022 at 3:51 AM Marc Kleine-Budde <mkl@pengutronix.de> wrote:
>>
>> Cc += linux-sparse, Uwe, Luc Van Oostenryck
>>
>> tl;dr:
>>
>> A recent change in the kernel regarding the riscv -march handling breaks
>> current sparse.

Sorry about that, looks like I'm not running sparse as part of my 
testing.  I'll add it, but it might take a bit as I'm assuming there 
will be a bunch of issues it points out.

> Gaah. Normally sparse doesn't even look at the -march flag, but for
> riscv it does, because it's meaningful for the predefined macros.
>
> Maybe that 'die()' shouldn't be so fatal. And maybe add a few more
> extensions (but ignore them) to the parsing.
>
> Something ENTIRELY UNTESTED like the attached.

Converting this to a warning seems reasonable to me, as then we're not 
as coupled to the sparse version.  The current crop of extensions don't 
set anything exciting for Linux, but there are some on the horizon that 
likely will -- hopefully having sparse in my test setup should be 
sufficient to dig those up, though.

As far as the new extension go: "Counters" isn't an ISA extension, and 
"e" defines "__riscv_32e".  It'd also be slightly saner to match on 
"_Zifencei", but that probably doesn't matter (GCC is sufficiently 
strict here).  Looks like there's also some oddities in the sparse ISA 
string parsing, I'll go clean them up as I get it running locally.

We could also stop relying on the compiler's defines, which would avoid 
this problem entirely, but IIRC that was discussed when decided to 
modify sparse in the first place and we went this way (though I don't 
remember why).  That would keep everything inside the kernel.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
