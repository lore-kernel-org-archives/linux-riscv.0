Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9930C433FE
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Apr 2022 07:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lex4hiJdjn7BuwA2ut6Q1/YvqW20W0JOqRHKnmFAvvE=; b=BEGnqv7wwFM0lD
	LT4Y2zIqf1ueGv+628pWnYuTo/oYVD9o6hIY0rS28Y/eXLRsjHX3ghr/BStiNPKm+3mcHeA+EE41F
	DyHcUEd0O6MTrWP94jH8jYxcYTrahlg82RVvQrgDuZmE6Ym7HkZbISuQG49EyGp/L7k2Bfafj77Hs
	17UG1UaGxH02EmNeCRyza7oFsUpgUAQ6pnRBG2/1awF+xHhfJ48dTx1ZLOf3VRHkAlwrrs6TDcRXY
	vPsmY3B6O9nhGzeKUrxEatuVxrgEdenwWmNmIcUso4WZtgkxtk/PYOR/hJf05DP7JvyoJaJXzCh0M
	T7LWikwnRWlv7UCilp/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncMST-009uzw-OA; Thu, 07 Apr 2022 07:21:33 +0000
Received: from mout.kundenserver.de ([212.227.17.24])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncMOe-009t3D-Vx
 for linux-riscv@lists.infradead.org; Thu, 07 Apr 2022 07:17:39 +0000
Received: from mail-wr1-f41.google.com ([209.85.221.41]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MtObA-1nq3Yh1YYI-00urVp for <linux-riscv@lists.infradead.org>; Thu, 07
 Apr 2022 09:17:33 +0200
Received: by mail-wr1-f41.google.com with SMTP id c7so6524008wrd.0
 for <linux-riscv@lists.infradead.org>; Thu, 07 Apr 2022 00:17:33 -0700 (PDT)
X-Gm-Message-State: AOAM532/mcACdNhi7WkMYSGqFqZ/CBTqpjuoJr6DDByCwwt8HandWGBN
 U1mdNSbyiWhHqxaPiBWA+qsF7HSGuIvibhJUObo=
X-Google-Smtp-Source: ABdhPJwmNfPDNFMCTxQF72bGloQ9R7ixTS1WuENFc4sxAk/2DHt8y1oYiTEoK7GHAg/mvQl2A58Tcb9T0D1qJhBrXSI=
X-Received: by 2002:a5d:6505:0:b0:205:9a98:e184 with SMTP id
 x5-20020a5d6505000000b002059a98e184mr8948149wru.317.1649315852910; Thu, 07
 Apr 2022 00:17:32 -0700 (PDT)
MIME-Version: 1.0
References: <Yib9F5SqKda/nH9c@infradead.org>
 <CAK8P3a1dUVsZzhAe81usLSkvH29zHgiV9fhEkWdq7_W+nQBWbg@mail.gmail.com>
 <YkmWh2tss8nXKqc5@infradead.org>
 <CAK8P3a0QdFOJbM72geYTWOKumeKPSCVD8Nje5pBpZWazX0GEnQ@mail.gmail.com>
 <CAMuHMdWcg+171ggdVC4gwbQ=RUf+cYrX3o9uSpDxo-XXEJ5Qgw@mail.gmail.com>
 <c3e7ee64-68fc-ed53-4a90-9f9296583d7c@landley.net>
In-Reply-To: <c3e7ee64-68fc-ed53-4a90-9f9296583d7c@landley.net>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 7 Apr 2022 09:17:17 +0200
X-Gmail-Original-Message-ID: <CAK8P3a14b6djqPw8Dea5uW2PPEABbe0pNXV5EX0529oDrW1ZAg@mail.gmail.com>
Message-ID: <CAK8P3a14b6djqPw8Dea5uW2PPEABbe0pNXV5EX0529oDrW1ZAg@mail.gmail.com>
Subject: Re: [RFC PULL] remove arch/h8300
To: Rob Landley <rob@landley.net>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>, 
 Christoph Hellwig <hch@infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel@lists.sourceforge.jp>, 
 "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>,
 Max Filippov <jcmvbkbc@gmail.com>, 
 Linux-sh list <linux-sh@vger.kernel.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>, 
 Greg Ungerer <gerg@linux-m68k.org>, Damien Le Moal <damien.lemoal@wdc.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, Rich Felker <dalias@libc.org>
X-Provags-ID: V03:K1:epzyr8Ur4r5TmRAsPv/kecTmkPGZF+lg7mZ0E3TP8DZRItvi020
 rcaufT6TuB6Q+zU7ejQ4VTXUGPYrX45IKQ57kVy1CZr+t3mvoVGb78GHpuY7R4hS4uO1IpH
 ytt3kjqagrW+ifyRepNrtgUxamlqnDX7YmyG9864sYz+qE3r1Gw2wZvn7QwyIb0K0DATpc7
 i9c1wgLvK+oS38+I0E76g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:8seG9A9U1TA=:/fucJ2OMvMEPHcXegqVKy5
 3K+6zIml1qpR9VHK8w83+pV46E9pBJ6ngg1WJzI8s1IYx2BvNlrJS3dIICzl3C7DwC0mEXDLf
 fum3zOmXvpwdMVUJCEwJIzqnbcPLzh67fZKcNqtdM0tRJ8scG4YCvRKdBZg8Z3KwsogE1P/S4
 a7mLN4ZeyKJxR8UBI4C4B+1YfL+xB+LvcehAnj93wfO68aws/LfREhFxW3Mq6cI6Q2c0ga7Du
 6bndDvMMg0CJdP1+hy8tLrOZciJfTeLHcbUnXClMwbV5f5qR4zG0kBzs5IyHjgTRe9/WDy0Vx
 AVwNlVam5168KLBYTtwpa9OhA/Q/dVnWN20ZsoLSmjJq4647BbbMf8QNje5bVWaqR5QfFmtX9
 xicklzbTx7GOzsdPj2NKlSHWfSsnNTBEr8+JZywUOJrpo34+aJ4d7zxKhdabiknoqYUCmU7j5
 h0+MLYGTl2hL0UJXfNeeP3og3fSv/aeD9pSfXrkBgTNmhPaqRxamD7Yaw6ZIg66VpO4EpgHPu
 ofQ5oykyRhAbSjKJ9k4FiFuHzM9Su8x1jwLblJi9Xg6iVS2cXYQHonfjuNOCt/6VJY7JsOHLm
 hRyaCYWmkBBZc9PJOvTBXdDaFwqv0TsB5Hwahg57UOwt3oTk6uqSQEzyJCp63iFhSR66anS5c
 zICsxa8Gsunxm3CeQP4RQvA2jLXerYEhgRZfKcelcm4Ai75oHTrKK3xnCWZvBnq8lbczWqtM8
 eozTDXnonFQeXnVH8KA0g5Kd4WUtN2IjpMneMe0PJss7wsXt3tf7J+SSKZLA89593rAGXQlSE
 l2iL2tXp3973WVsakUHyf06wx0rZFCi2D2lTPm9BfaP/mKsoDY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_001737_355605_646A0687 
X-CRM114-Status: GOOD (  12.21  )
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

On Wed, Apr 6, 2022 at 11:25 PM Rob Landley <rob@landley.net> wrote:

> I'm interested in H8300 because it's a tiny architecture (under 6k lines total,
> in 93 files) and thus a good way to see what a minimal Linux port looks like. If
> somebody would like to suggest a different one for that...

Anything that is maintained is usually a better example, and it helps when the
code is not old enough to have accumulated a lot of historic baggage.

The arch/riscv/ code is generally a good example base for others to copy.
It's not nearly as small, but that is mostly because it implements optional
features that could be left out. csky is a smaller example that is also
fairly clean and new, but less featureful.

         Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
