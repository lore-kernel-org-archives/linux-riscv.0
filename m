Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D33C433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Nov 2021 02:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:
	In-Reply-To:Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=kHvTB0+ZmzpmiD6neevwQr/UB10+Vj0N01VXDLpYyyo=; b=gy5gAVzIiGs0pU
	+ca5ol8MMJs+42KbSZCmy0JV/q2vRbyRXmG9QOjfjnIWDMssXRjuCVqjnKrCPKlNmHw9noDe3FEPq
	ux83J7XKk1NMRP/M//VZ51ubJ8OXgPG78CFAzP9ehexPsaLTJXJGYHn5grJVoYMo4QDrvwduRbT0a
	Hf5ye20TOW9mZ1lX2DOYIcLqR/+sqYeHLQDqZHmH8y3w8o/RZaMtUEyIgQqQ6c9U8GQQrCQoAVt3I
	m9lSuJn2PWpDvFDK/8H3dk0QoLaP1cL7XNw6NfuYy8TEeETeGXci3Y4HhSNH7iKvnvY9ASiHVdmZX
	br0ezQ+6B069dye9xjvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqnXL-00CgQH-UX; Sat, 27 Nov 2021 02:34:00 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqmYF-00CG1B-O5
 for linux-riscv@lists.infradead.org; Sat, 27 Nov 2021 01:30:53 +0000
Received: by mail-pg1-x52b.google.com with SMTP id t4so9595575pgn.9
 for <linux-riscv@lists.infradead.org>; Fri, 26 Nov 2021 17:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id;
 bh=krSaf44qZp+SCzZWx5eYR1WPcnM46IU0SbFLswTGNpo=;
 b=vSyg2+OCv8NNr+GVnFx5ZptQI1QqpvWnbX1+2QNgsjhPTPlSwtiSrNJOPJ+G56jO/J
 KCGi5oyjJdQHyPu+CZOB+JNmbmI7GLFV4SG409bZKm953le3grK8u7ikp8hYkOFCYmdw
 EXoxTYjm4n3xgtCITEVFU/Zuj+TgGjcGtQDzG7Lt5/E4G1oBWm1XgXMGvDupTa6ALbNL
 VmKKwbZiC14Qe21ALTq+JFLO9k0N+UOkJHZE8hrle0dYk5psWba7TaZbi19WL95UPoBz
 zuc5c8AFHwueJIaPxJaMHQM1O4eQiHDmkI1kuAX3Jp4W8yRv9scPgT/OskSri7skMJzp
 ThBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id;
 bh=krSaf44qZp+SCzZWx5eYR1WPcnM46IU0SbFLswTGNpo=;
 b=EdO1kTgrG1bLFbMhJLXZlY2bxnV9K9VT6qpQPLsz5cEnUwTAwbqW0B/NuBG2Sg4TJK
 H3YsCoSFSUvkS8b32HiHhtzl0mtRz7VI+O1UeRMW3nKW1jzbvjkzN+MT1C7EWjm/Mx/8
 chuULfcHcwh1a1nf16BR4To1VPtA9bNE9L5SH73yOYboXL5BmZOATcjrmlNDZJY1XW4m
 UL97cAiZhb6qzzKXK25m39QH5EYVGWkI+rnUIrU/gNV9Vl6x4MZn+jDFX62qk89jTBXm
 qILVSqx/lQwk76OBRMMHwFDlXqpE5MduuBD6rDI2FNbd2UYBU+SsbRvaoS05AJf0/LSv
 H2OA==
X-Gm-Message-State: AOAM530PhzPpOYNBySBl0FLv5SuDPFKUZKw5mlJOtMsVHFnx7wzKWfOm
 TthX95BKadT35oQ/lfl6bK713w==
X-Google-Smtp-Source: ABdhPJwibnGbqlrciJIlnX43p0ErqmwW6+We/evbbZWxmT1e1YwNNbZ0GMqRZhi/jRB7rXFCr+ZtjA==
X-Received: by 2002:a05:6a00:1305:b0:4a2:75cd:883b with SMTP id
 j5-20020a056a00130500b004a275cd883bmr24729294pfu.44.1637976650262; 
 Fri, 26 Nov 2021 17:30:50 -0800 (PST)
Received: from localhost (c-73-53-62-83.hsd1.wa.comcast.net. [73.53.62.83])
 by smtp.gmail.com with ESMTPSA id e29sm2129630pge.17.2021.11.26.17.30.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 17:30:49 -0800 (PST)
Date: Fri, 26 Nov 2021 17:30:49 -0800 (PST)
X-Google-Original-Date: Fri, 26 Nov 2021 17:29:57 PST (-0800)
Subject: Re: [PATCH v4 00/16] Basic StarFive JH7100 RISC-V SoC support
In-Reply-To: <CANBLGcykFks+EF2m0bdD+j5w43Qy30LBgVnAYJWU+5-WVJH6PA@mail.gmail.com>
CC: Arnd Bergmann <arnd@arndb.de>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, 
 linux-serial@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 robh+dt@kernel.org, 
 mturquette@baylibre.com, sboyd@kernel.org, tglx@linutronix.de,
 Marc Zyngier <maz@kernel.org>, 
 p.zabel@pengutronix.de, linus.walleij@linaro.org,
 Greg KH <gregkh@linuxfoundation.org>, 
 daniel.lezcano@linaro.org, andriy.shevchenko@linux.intel.com,
 jirislaby@kernel.org, 
 luzmaximilian@gmail.com, sagar.kadam@sifive.com, drew@beagleboard.org,
 geert@linux-m68k.org, 
 michael.zhu@starfivetech.com, tekkamanninja@gmail.com, anup.patel@wdc.com,
 mcroce@microsoft.com, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: kernel@esmil.dk
Message-ID: <mhng-5fc3ff6b-1f6e-4efb-8578-20759733887a@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_173051_885247_13ADD6C3 
X-CRM114-Status: GOOD (  37.26  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 16 Nov 2021 09:28:41 PST (-0800), kernel@esmil.dk wrote:
> On Tue, 16 Nov 2021 at 17:08, Arnd Bergmann <arnd@arndb.de> wrote:
>> On Tue, Nov 16, 2021 at 4:01 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
>> >
>> > This series adds support for the StarFive JH7100 RISC-V SoC. The SoC has
>> > many devices that need non-coherent dma operations to work which isn't
>> > upstream yet[1], so this just adds basic support to boot up, get a
>> > serial console, blink an LED and reboot itself. Unlike the Allwinner D1
>> > this chip doesn't use any extra pagetable bits, but instead the DDR RAM
>> > appears twice in the memory map, with and without the cache.
>> >
>> > The JH7100 is a test chip for the upcoming JH7110 and about 300 BeagleV
>> > Starlight Beta boards were sent out with them as part of a now cancelled
>> > BeagleBoard.org project. However StarFive has produced more of the
>> > JH7100s and more boards will be available[2] to buy. I've seen pictures
>> > of the new boards now, so hopefully before the end of the year.
>> >
>> > This series is also available at
>> > https://github.com/esmil/linux/commits/starlight-minimal
>> > ..but a more complete kernel including drivers for non-coherent
>> > peripherals based on this series can be found at
>> > https://github.com/starfive-tech/linux/tree/visionfive
>> >
>> > [1]: https://lore.kernel.org/linux-riscv/20210723214031.3251801-2-atish.patra@wdc.com/
>> > [2]: https://www.linkedin.com/pulse/starfive-release-open-source-single-board-platform-q3-2021-starfive/
>>
>> Thanks for adding me to Cc, I've had a look at the series and didn't
>> see anything
>> wrong with it, and I'm happy to merge it through the SoC tree for the
>> initial support
>> in 5.17, provided you get an Ack from the arch/riscv maintainers for it.
>
> Cool!
>
> @Palmer, do you mind looking through this? Probably patch 1, 15 and 16
> are the most relevant to you.
>
>> Regarding the coherency issue, it's a bit sad to see yet another hacky
>> workaround
>> in the hardware, but as you say this is unrelated to the driver
>> series. I'd actually
>> argue that this one isn't that different from the other hack you
>> describe, except
>> this steals the pagetable bits from the address instead of the reserved flags...
>
> Yeah, it's definitely a hack, but at least it's not using bits the
> spec said was reserved. Hopefully the JH7110 will be fully coherent or
> maybe implement the new Svpbmt extension.

Sorry, this had been sitting on top of my inbox because I hadn't had a 
chance to figure this stuff out.  Emil poked me on IRC about it, but I 
figured I'd just write it here so everyone can see:

IMO there's a huge difference between the StarFive-flavored non-coherent 
stuff (which relies on physical aliasing) and the T-Head-flavored stuff 
(which uses page table bits): the PA-aliasing approach is allowed by the 
ISA, while the page table bits aren't (they're marked as reserved).  IMO 
we should still figure out a way to take the T-Head stuff, as it's the 
real-ist hardware we have, but that's a whole different can of worms.

My worry with this is I've yet to actually be convinced that either of 
these approaches work.  Specifically, neither of them prevents M-mode 
from performing (either directly or as a side effect of something like 
speculation) accesses that violate the attributes we're ascribing to 
regions in Linux.  IIRC I pointed that out in the Svpmbt patch set, 
which has exactly the same set of problems.

That said, I don't really care all that much -- having something here is 
better than nothing, and we've always relied on the HW vendors just 
producing HW that works when it comes to any of the IO stuff (ie, even 
on coherent systems).  These are all drivers so it's really up to those 
folks where the bar is, so as long as everyone's on the page about that 
you're not going to get any objections from me so

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

The SOC tree works for me.  It'd be great to have a shared tag I where I 
can pull in at least the Kconfig.socs stuff, but if that's not easy then 
it's no big deal -- what's in flight there is pretty trivial on my end, 
so we can just deal with the merge conflicts.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
