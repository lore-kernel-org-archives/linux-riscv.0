Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DEB8C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Apr 2022 11:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4TPlBMjmq8ApG0sV/hUh8XORQaXEzsceTnf18aBluHg=; b=VL86kRUq5KNMM6
	WW4SgCH0qTtj0gqt0dM/WFoaX7ZsSXWcDmiK7BvPJ7m+/PZlKgi0WLSQFSUkX7LkxbaLiK3nId/qI
	kViDo+XmgTLEUM/2lcnYmdKAmjCn+5JpAtQ+ppigbBzRnUrxb1qNJLe9rurzIoD18wVn0fF+fwgb/
	1wDmOg64/NQHYlvGF7Z8UtzsrVilIy4Pa4JFiEgfcq7WEKy567s4TZry+SFVO4SZvPuZIxo2dWaHX
	4EHaVpaY32aJWyl1gfyKT4N89SOhmijgpKIoeTRylDUxJjAU7UB+zvHYyABeBvDKsWhXJ1frfhPpO
	QOdapbm9cO9iJ6QpnL/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nexsb-005JLk-51; Thu, 14 Apr 2022 11:43:17 +0000
Received: from mout.kundenserver.de ([212.227.126.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nexsX-005JKi-Vj
 for linux-riscv@lists.infradead.org; Thu, 14 Apr 2022 11:43:15 +0000
Received: from mail-wm1-f43.google.com ([209.85.128.43]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1M5wgF-1nZCaM1PRr-007YNK for <linux-riscv@lists.infradead.org>; Thu, 14 Apr
 2022 13:43:09 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 123-20020a1c1981000000b0038b3616a71aso2991236wmz.4
 for <linux-riscv@lists.infradead.org>; Thu, 14 Apr 2022 04:43:09 -0700 (PDT)
X-Gm-Message-State: AOAM531OBBM3NT1Kk+Ja7uCzWwJlOv1tHG5g6S/QEMR1k8Bz6DtpyNpf
 0xCzGEL2vFG7oMShHjV6EdK4y7dDmtPqIT0T0GA=
X-Google-Smtp-Source: ABdhPJwyuaHiBqp25K63KJ94LjNVOLjmoQMGgnJK2Uo34IKm32rZZPdlVgnEeNBcFHyaIKdZ+bFPSxjnzUfcUiKGIBA=
X-Received: by 2002:a05:600c:25c5:b0:38f:f0b9:4c8c with SMTP id
 5-20020a05600c25c500b0038ff0b94c8cmr2925041wml.20.1649936588976; Thu, 14 Apr
 2022 04:43:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220414014010.28110-1-palmer@rivosinc.com>
In-Reply-To: <20220414014010.28110-1-palmer@rivosinc.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 14 Apr 2022 13:42:52 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1=iBLDC5X-+OEUUvQmcWpPXkuBnk__6g9GNORo9k0zBg@mail.gmail.com>
Message-ID: <CAK8P3a1=iBLDC5X-+OEUUvQmcWpPXkuBnk__6g9GNORo9k0zBg@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: Add CONFIG_{NON,}PORTABLE
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-Provags-ID: V03:K1:MTfXoq3osx43mY+KhgEOlowzCLF1ixLUU1MO6jNsbiwqviNQHzo
 nP900zk9S+9X+1Pr2Xhw7n1GqL4qlW1wMdt8JmizMWtpQh0SRphBLA6GiyiSHgK/dEDU1xK
 bbnDXtjU4BghkMP37xKMTX/aFI4thFdtzXftMGfSCl4kc7vR67WSMb2ZsPxFxwegSNzO/9e
 XhsSj3gAm+TrmOG7ijYxQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:4fFSjotgeDk=:nfaQZ7eEBlb+hENawiT4WR
 dTqlduH1Ax2j6IMWS9cy8EN5MVv0xoDD1M23nHdDcFmcWVAWA4UKpdpAJbAmf6DqhRf/fGFHk
 Lo7czBXr64fB6gew+7dnHKrDVE6YqrsOIJWGfo2AOcZWCve7JnuzR0i7lGLuCp+lSgsWEy9fS
 RRoSrdiyKC4he8/UMpNXJSLB2rFSF3njmzrDS2t+nKD8g0SB1+W4cI6RrCRLhHEb7zNT+s5/o
 Q7XX5KvxFCGp7RyZjSFkDcZxwnOzJsRzmfUgnD10TZPimORrJEloVvrqPa5jKI/rxIz62oiVC
 JZbQQeM680T0l8MAxLLkkSl1dzEBNffrwSPpg3ZHrcFqZXwF1D2dVuPoiartKjXdy8NpI0tdO
 5QN1E8i0HYfKJbQESbVM/5WjoIVWB7KFNY7uQCxmCv2ymTxRAAAGXocQiKhwAjLxNTtlvF+Nn
 og7SxPMZLE7njdR5wht0HrfbLu+VoOBjn2BtD7CwB+FY71PrT3y6YtHVkDZOEsTdKsdVk9DDe
 1lqL/Xakk0OsXEPi3truLtlWZht5QBhp8VIi8PzlN7EiTziGB456q96TMFTwfSR0NJcK+1TuR
 P6s2LgA/+NQaGwPQfswnDV7C+TAWYGh7a6WSLJdZtBEuBDo7f94DTWQyXR/J02tQMedp3s77x
 HFGoccind+acGcUeXmWuD0916qRnoSUDLzc5wme6+RSSWSqJiasTcIm37v64nxMffNF9CRSB/
 lc++TrgMusBSoz8SMlgP9sJHOAhzGOL+8ZG+zpFwV376ktIulf8bwFEUnuEWz5jymZSn5MWlj
 00IyoqNbNhaOzHwbmao7kZSxlbT3tpnq8j+Hl4DqiQyOMbE1cc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_044314_343226_23BD6172 
X-CRM114-Status: UNSURE (   9.94  )
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

On Thu, Apr 14, 2022 at 3:40 AM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>
> From: Palmer Dabbelt <palmer@rivosinc.com>
>
> The RISC-V port has collected a handful of options that are
> fundamentally non-portable.  To prevent users from shooting themselves
> in the foot, hide them all behind a config entry that explicitly calls
> out that non-portable binaries may be produced.
>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
