Return-Path: <SRS0=npMT=E7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B8CBC5519F
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2020 12:47:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C11A206E5
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2020 12:47:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1ofI+gWk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C11A206E5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=a5E80nUSxSiWwyfk+//kOOTuC6lDNk+YOoKtr4URxXE=; b=1ofI+gWkLwFODiJIG38cW59CI
	Dw5o/V1RCuIoS4lSXjBy2ts10vtCzKSnv6hFYUZ7xrrH97JfuYbMXGoylv4eZ8x6CaigsNOZ8JRkL
	ruP1iBtp5PjhuEiGNR1orCDckavs6i+4iDvTY2icWjjgJjvmIHnz+/ppavaWuUlabwJOggDUglXhq
	JmRyORinda89YRcHDZ3XcMroIr5hskdOEyTZ8BsP0826O/dPzuR996RLQz+wjdNhIo+01Q+oIDeF5
	aB4k4D3UY3CXe2z6Yl5oG9FI4jtgXF4x7bNRurVxeBtWMCjlRQ5x7ykctOqHSPY26RHCAbnqEJA3h
	TbvH8yJCA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khuCr-000419-CS; Wed, 25 Nov 2020 12:47:33 +0000
Received: from mail-oi1-f193.google.com ([209.85.167.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khuCo-0003zh-Oe
 for linux-riscv@lists.infradead.org; Wed, 25 Nov 2020 12:47:31 +0000
Received: by mail-oi1-f193.google.com with SMTP id c80so2702414oib.2
 for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2020 04:47:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gPUOnTI/GXJjBWfcQKn1UW1GCzqLDHOJc8mxlHuRZhA=;
 b=Ru2QifQqaClzWwlp5LXXqT+WmZnbVP3k/9odAyhAfyiM40BBzZGxktCPnUSZqLxM/N
 Y4m6B6BtnL+W1DpOhgTJCyiogHgxW7Ruz1PwNhDeNItDS+6zUvUqt1KXJVUDosTfW24p
 YirAt1Aq6Iq29pn1aZPnWUrH+dRNrM3cUriVWtXiphf4bMLgS78p340d4xkL+JQ4vRNv
 GtEhRojn2Gq/i0xFp3dVUmWQ68rurhI6BgcjPbkXOdJDuipaJZ8U7e8cOXLIDTR6ry/4
 VmcjUVXidDLy5W4YC1P0NdKO1XK1hRXLvl/0ecKIXRzoHq4B4SWIpTR8XrsZV06P46a4
 HAQA==
X-Gm-Message-State: AOAM532XY9iL0t3psNMKWsrMkee7R8AueBvlm4PM1mdU7sx6z2Oz3z/8
 iugFFtmeM8vsgUZsJnvg0oSEstdyvwZFQMqr40o=
X-Google-Smtp-Source: ABdhPJwikQNqVaFir6QHfyhm6IF2bhFKder5YyspCgClKVn0JsSsIW5TiEWBwEjHR4D8jSSsj5zffkSg2G78j4kq9IU=
X-Received: by 2002:aca:1c0f:: with SMTP id c15mr2142536oic.54.1606308448683; 
 Wed, 25 Nov 2020 04:47:28 -0800 (PST)
MIME-Version: 1.0
References: <20201124185738.3541314-1-geert@linux-m68k.org>
 <CH2PR04MB652231C5B82E9F8184F496D8E7FA0@CH2PR04MB6522.namprd04.prod.outlook.com>
 <CAMuHMdW9dySq3y_Uixv8_7e+Pe2VKw4iGV36mx-DbX6-yzk-Gw@mail.gmail.com>
 <CH2PR04MB652268FD0FB44AA5DF36ACFBE7FA0@CH2PR04MB6522.namprd04.prod.outlook.com>
 <CAMuHMdXEzo4EOw_=MgskNXPrbkP4Ui+dHKZ5iyJ04h453BUAhQ@mail.gmail.com>
 <CH2PR04MB6522E6443C6E12CD28FD1A30E7FA0@CH2PR04MB6522.namprd04.prod.outlook.com>
In-Reply-To: <CH2PR04MB6522E6443C6E12CD28FD1A30E7FA0@CH2PR04MB6522.namprd04.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Nov 2020 13:47:17 +0100
Message-ID: <CAMuHMdW4YC4mNcX28s6HDSc-tuks2H7i-vojsOLbmaCBr2o2Ow@mail.gmail.com>
Subject: Re: [PATCH] riscv: defconfig: k210: Disable CONFIG_VT
To: Damien Le Moal <Damien.LeMoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_074730_897150_31D51E08 
X-CRM114-Status: GOOD (  15.53  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Damien,

On Wed, Nov 25, 2020 at 12:00 PM Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
> On 2020/11/25 18:26, Geert Uytterhoeven wrote:
> > On Wed, Nov 25, 2020 at 10:02 AM Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
> >> On 2020/11/25 17:51, Geert Uytterhoeven wrote:
> >> I was just fiddling with CONFIG_UNIX98_PTYS. Disabling it is OK with the simple
> >> busybox userspace (no telnet/xterm like app running). But it saves only about
> >> 1KB with my toolchain (gcc 9.3). So I left that one enabled. I am surprised that
> >> you see 16K size impact... How big is your image ?
> >>
> >> For me, it is 1.768 MB right now for the sdcard defconfig, with CONFIG_VT
> >> disabled and ext2 enabled.
> >
> > It might depend on how you measure.  "size" says 15 KiB impact for UNIX98
> > ptys, while bloat-o-meter reported less than 7 (my script uses "size").
>
> I look at the size of the arch/riscv/boot/loader.bin file since that is what
> gets loaded in RAM and booted. It is significantly smaller than vmlinux file
> size. E.g. for the sd card defconfig, I have:
>
> vmlinux: 2369920 B
> loader.bin: 1751250 B

Doesn't loader.bin lack bss?
Bss does consume RAM, so you do want to take that into account, too.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
