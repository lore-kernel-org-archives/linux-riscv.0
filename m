Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF5DC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jan 2022 17:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fTSf2Tj+3ukef1ZDCSzBtb+Il/OH18qk4seGuAtZMFI=; b=LMwJEsrAu/HJLN
	pP4POdBxbQAMg9jFzpZBkZSkWrF/yS1jT4X1EcOSS5zxMg2LhnmSSeLhT/lnmeQKNSsi/qxq5V0zN
	3lF5FeCsFVs/fREY73oW5oxDj36ASBzX1WMAHPlk/tg4q6Na5FamgPu7xdrtE/KEYwmyCPjt8HvQm
	xrkPB/KNAdpzfDvm2uxcEPexXTPZz3hdF2rQneWdLBuX9+OSMhWiUuF0uhLlhFVpgJm93c2i8+UY2
	HrV+USGNTVN584rN3E6zZj2Kwse4gRHD2HrzSqmT+i3nzrb6Q5GzhwGbe3CnXLmlnr5cwh88EUlAM
	dpwhlzrMIoxRS6p6zi8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nC2kW-0047Cc-5p; Mon, 24 Jan 2022 17:03:24 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nC2kT-0047Be-O6
 for linux-riscv@lists.infradead.org; Mon, 24 Jan 2022 17:03:23 +0000
Received: by mail-lj1-x234.google.com with SMTP id t9so1058463lji.12
 for <linux-riscv@lists.infradead.org>; Mon, 24 Jan 2022 09:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w4LPuie2gZC/4gV/HI33snifTw+KkH8sPMZQ+z2ss9g=;
 b=GMNghxZcUBO0n0fyg056ZLP7pohxEmoQNb+q9Gx3aJL7yN5OgP3L3sAXKKeG0FS2FZ
 Z6pDM9krJxdYNIX5JVA7jIf5PVEaWB3PGmkC7PzXiUasK0mbo88jhYgwCX1k5jbVbMqb
 sJ3IiMLRCt+4TpzmjqS9TqholOAk3g9plbBE2UYD+tiolZfJWQ8Tpv/UiU12e2qoNkKc
 ODqMMR230gAhWRVkS6W1VlA7aC/0QEKLOCbIpRFoA5Y/sHPFuo5qFoGPwmFbwk3Sb3qz
 8/5ZUZJrGisb4JDzOH3FxSWlIGyw2MCJJOMZVNMiLFQ1TAbmhgYe1jIk4F2YTgopqVaN
 sjaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w4LPuie2gZC/4gV/HI33snifTw+KkH8sPMZQ+z2ss9g=;
 b=WwCMJ726FUxLingjAf9AXUl/fJ8nB74T+ztJ95tYSBS8zUfPS1Qeoa8pdcfuvii6qF
 RuljDpNAlDYVlhmV8i6g6vn2C1KeDKJbnLPSxdq3MzqOw0eerous8GxLwyd60vDNrhe3
 y/f1MRkM0I+DWSXDdwloWIJLQp7JieIehdK2Yy5r2xd9lnh4lt9OIqLN9qLLHumgKGGm
 nScSNo3U8JC4cgW/im3eSe3IzO5WprqqPlhGJoH1PUW1F16y61miWzWYDNv2tvowTrY1
 7Sh2OAPXx9n0dAf0uoZfnPR9vnKv4ZsWcFGfzUBZk8mmtayt7x+TFByAhU6cCnP+zLZA
 vR/Q==
X-Gm-Message-State: AOAM532tPi94JFBXDcglIUdO2PXSs6Hyc2D3OZB/6lK7I/1dhb+80fH/
 slEjCVzUpFZ4DcAAQUCiLpHmkxIpnjsdITuPhVzyhQ==
X-Google-Smtp-Source: ABdhPJwIH+cyPsq9bO3FdraGj6OvSy6jgmkNSoCj6ohDecG2rjLAnn9SJiY8LIXwnWs9epmvSWObibUgPiIYbVjqz4c=
X-Received: by 2002:a2e:b8d3:: with SMTP id s19mr12244345ljp.401.1643043798747; 
 Mon, 24 Jan 2022 09:03:18 -0800 (PST)
MIME-Version: 1.0
References: <20211118192130.48b8f04c@xhacker> <20211118192651.605d0c80@xhacker>
 <CAN37VV6vfee+T18UkbDLe1ts87+Zvg25oQR1+VJD3e6SJFPPiA@mail.gmail.com>
 <YeqkIKUsdHH0ORxf@xhacker> <Ye0cCI8aAC8rL1IE@xhacker>
In-Reply-To: <Ye0cCI8aAC8rL1IE@xhacker>
From: Mayuresh Chitale <mchitale@ventanamicro.com>
Date: Mon, 24 Jan 2022 22:32:43 +0530
Message-ID: <CAN37VV4H=ts6GU1aV6M1mZk+SRb-3n3R_nz9Ao3_W1zcEKW4-A@mail.gmail.com>
Subject: Re: [PATCH 11/12] riscv: extable: add a dedicated uaccess handler
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <kafai@fb.com>,
 Song Liu <songliubraving@fb.com>, 
 Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>,
 KP Singh <kpsingh@kernel.org>, 
 Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, 
 Tong Tiangen <tongtiangen@huawei.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org, 
 linux-kbuild@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220124_090321_812852_B811488A 
X-CRM114-Status: GOOD (  16.67  )
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

Hi Jisheng,

On Sun, Jan 23, 2022 at 2:50 PM Jisheng Zhang <jszhang@kernel.org> wrote:
>
> On Fri, Jan 21, 2022 at 08:16:51PM +0800, Jisheng Zhang wrote:
> > On Thu, Jan 20, 2022 at 11:45:34PM +0530, Mayuresh Chitale wrote:
> > > Hello Jisheng,
> >
> > Hi,
> >
> > >
> > > Just wanted to inform you that this patch breaks the writev02 test
> > > case in LTP and if it is reverted then the test passes. If we run the
> > > test through strace then we see that the test hangs and following is
> > > the last line printed by strace:
> > >
> > > "writev(3, [{iov_base=0x7fff848a6000, iov_len=8192}, {iov_base=NULL,
> > > iov_len=0}]"
> > >
> >
> > Thanks for the bug report. I will try to fix it.
>
> Hi Mayuresh,
>
> I just sent out a fix for this bug. Per my test, the issue is fixed.
> Could you please try?
>
> Thanks

Your fix works as expected.

Thanks,
Mayuresh.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
