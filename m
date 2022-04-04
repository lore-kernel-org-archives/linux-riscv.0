Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7BB6C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Apr 2022 23:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gOn06JpT0bEQfFPkLlnRRA2HRcO/telgLKoPb1Vq/UA=; b=ofYLH8AFhHB6qC
	jrYrVQkFelBdOholch1FUQGRuvbsxY11zrNxg1n4kVre5/ya5PZMaklG1jAMymiIm19q0hInVgBSS
	8QlPUPkBkdvsqv4EpSXzLAvkkLnTruoIgz8eXLko8wYBiQTi1uPxq1Q1H4zAbybUef51pex8zDmrF
	XULD2l+stgB1L4z2Jsnv53KAZphNIRKvZcFhj2W5emqSl/Af3psaUPeIXPty/P3RAHddQkTKukY/F
	6P4F6ZUohWy7yDZsOR7JsXK7RZM2Chl/qTpfxLKxq9G9aeTuqTC5WDwZJ2erh0EbAeLissomNhByL
	JsHviYkVc59jE7u5kssw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbWBh-00Ggwt-Qa; Mon, 04 Apr 2022 23:32:45 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbWBf-00GgvT-9l
 for linux-riscv@lists.infradead.org; Mon, 04 Apr 2022 23:32:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1649115163; x=1680651163;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=pLgGUw+vPL0f2qNaYJgXPaqC3PncPyo5PXkVMywvCnI=;
 b=m+J5IRjrZVXgH6XerGxLWWbqnCaXMHQzTthjsZurxT9BojGj3PWfUaxW
 0iscKTIwJtOn8ZFOkGfQFt/icstoqdjuUO3k0Rv6G9GE+S/iBPKBvF82J
 cpqkzbOdrLGqBY1ED9G2cHLXtuWDs8qwUoA5T/QkDCNTupIsLX3bBtT6d
 4N4QPWiHTdb1ILT6sQCHRfDlzT4EgH766HIGnd1y3ftJfkizJwijOfUKO
 CJOCzZ/kz987zxRQY+Z7UKxgnMs9aakV5GeU8PrAtY/X7/JDp1ir3Sr56
 dxrO4+8qeFNU9Guqd+4YbbtRqOylHJOQQRw2SV8f21c8uZ0lPld8TtoAc A==;
X-IronPort-AV: E=Sophos;i="5.90,235,1643644800"; d="scan'208";a="301247773"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 05 Apr 2022 07:32:39 +0800
IronPort-SDR: GOFFNd52E7KKOGFcBe54Nr6HQdfRugPmQMi8RuAHFQtMSAhOiXqR/SHew9BQ/MmxzcxtwZ+8y4
 mWDWtE8XKRumHaJw0BcQppDbpNJVqC3j6TmKn33Nq+rC5Z9+wpEn+Ussj0MtL92DXBUjuLT74F
 gvy7EoCbXmLFgI7iB89LEDNt8Ana2s9o3KdwH4jQl223gVuMhvHf0ozKlwKjSO3mdLZ4ZLAMf+
 xJh9WIl/gzSuE73S2RG/SyKIA32Zja5yoeAMgTEwUjPKQ8lgvWBKo/IUBZMRi02q1I8YCsOvXW
 F/qbxUqsd0KX0CoPllAsPtUo
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Apr 2022 16:03:23 -0700
IronPort-SDR: Vr7WFUkmm7CV03kvUq8jRsJuLjWIqBvJmn44XQ1rtPJKk5Rjpf2nOFrZx5/EZDj3/d/DE16OGs
 DBqMGpBOTl0eqYvNnICcRSgJ24hQJMxO8TzC4De7wJrMJUfVPDD6Gwz0EETEFkQWt+AmIO4hMG
 r42ijbnAfBOGqxmeXbgYsLFblrLL91lmog6GuuB7oCipWhqMAP8Xe6+Hnz8nviglJLujl3N6GF
 CDHwItnfAm6o9QpwDGkLjnXNRMf9LjbcF4hFZJl6A2l7OXADmljyxQsuYiSOzOf3SXYcPdVIZD
 mP8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Apr 2022 16:32:40 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KXRs33Mb1z1SVp4
 for <linux-riscv@lists.infradead.org>; Mon,  4 Apr 2022 16:32:39 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1649115158; x=1651707159; bh=pLgGUw+vPL0f2qNaYJgXPaqC3PncPyo5PXk
 VMywvCnI=; b=DsQwEUOHxmoyYjbqt0O4dSEqkX6mn74teU8i5hG7gGn19np5Ssm
 GIE656sjlT9QTO3LfPnL96yX2h8GQmo+jZkabPUKMYyiiamMchLR0GjFhoTnbt7g
 oIbfU5S45I5mjqIj61A0TuY78vyQxp1vqMtubbVkB1juisa1031oQi7wbhIxApAP
 PAG5Yx1VSgEoWuALJtCtcayHafDyEFR7YD5eTEJWmU5Zgj3mZHTH6jhqQd6FYPZD
 9a6e2IhJLN5XGMJ3eK+8g5G1VN/EUfgvifjiux9bfsgE6vdYi3pLEjjvCVIGM7+X
 i6X8v1nLKnVL1NVU/Sr+/ilU+zfNKL956BA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id 4nMp8nIIAG0N for <linux-riscv@lists.infradead.org>;
 Mon,  4 Apr 2022 16:32:38 -0700 (PDT)
Received: from [10.225.163.2] (unknown [10.225.163.2])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KXRs01Sxyz1Rvlx;
 Mon,  4 Apr 2022 16:32:36 -0700 (PDT)
Message-ID: <ff20532f-7399-5fcb-d867-772a3e0fc8f1@opensource.wdc.com>
Date: Tue, 5 Apr 2022 08:32:35 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PULL] remove arch/h8300
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Christoph Hellwig <hch@infradead.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 "moderated list:H8/300 ARCHITECTURE"
 <uclinux-h8-devel@lists.sourceforge.jp>,
 "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Linux-sh list <linux-sh@vger.kernel.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Greg Ungerer <gerg@linux-m68k.org>, Damien Le Moal <damien.lemoal@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
References: <Yib9F5SqKda/nH9c@infradead.org>
 <CAK8P3a1dUVsZzhAe81usLSkvH29zHgiV9fhEkWdq7_W+nQBWbg@mail.gmail.com>
 <YkmWh2tss8nXKqc5@infradead.org>
 <CAK8P3a0QdFOJbM72geYTWOKumeKPSCVD8Nje5pBpZWazX0GEnQ@mail.gmail.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <CAK8P3a0QdFOJbM72geYTWOKumeKPSCVD8Nje5pBpZWazX0GEnQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_163243_448945_994B7D1B 
X-CRM114-Status: GOOD (  29.36  )
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

On 4/4/22 22:07, Arnd Bergmann wrote:
> On Sun, Apr 3, 2022 at 2:43 PM Christoph Hellwig <hch@infradead.org> wrote:
>>
>> On Tue, Mar 08, 2022 at 09:19:16AM +0100, Arnd Bergmann wrote:
>>> If there are no other objections, I'll just queue this up for 5.18 in
>>> the asm-generic
>>> tree along with the nds32 removal.
>>
>> So it is the last day of te merge window and arch/h8300 is till there.
>> And checking nw the removal has also not made it to linux-next.  Looks
>> like it is so stale that even the removal gets ignored :(
> 
> I was really hoping that someone else would at least comment.
> I've queued it up now for 5.19.
> 
> Should we garbage-collect some of the other nommu platforms where
> we're here? Some of them are just as stale:
> 
> 1. xtensa nommu has does not compile in mainline and as far as I can
> tell never did
>    (there was https://github.com/jcmvbkbc/linux-xtensa/tree/xtensa-5.6-esp32,
> which
>    worked at some point, but I don't think there was enough interest
> to get in merged)
> 
> 2. arch/sh Hitachi/Renesas sh2 (non-j2) support appears to be in a similar state
>     to h8300, I don't think anyone would miss it
> 
> 8<----- This may we where we want to draw the line ----
> 
> 3. arch/sh j2 support was added in 2016 and doesn't see a lot of
> changes, but I think
>     Rich still cares about it and wants to add J32 support (with MMU)
> in the future
> 
> 4. m68k Dragonball, Coldfire v2 and Coldfire v3 are just as obsolete as SH2 as
>    hardware is concerned, but Greg Ungerer keeps maintaining it, along with the
>    newer Coldfire v4 (with MMU)
> 
> 5. K210 was added in 2020. I assume you still want to keep it.

Still working on this one, I would like to keep it.

> 
> 7. Arm32 has several Cortex-M based platforms that are mainly kept for
>     legacy users (in particular stm32) or educational value.
> 
> 
>        Arnd
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
