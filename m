Return-Path: <SRS0=oB3y=I4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1686C433C1
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 00:45:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9829761996
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 00:45:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9829761996
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=v9VHIsCEGrZpWiJLFUeHf+hFd4kH1dLGLaUdme8XInI=; b=bdC8/EOmD+irVA9LGjv+6ZWJ3
	FRmkW6HTrnqvI3YF156Twv0a/oCTMXwqPMIh473jA2dxPbamelK8Owwcj6xa6UPQhJJil3P6Zsp9M
	3SGn51DFYDO5VmxdPV1logygcPTvnSA2KuOHak3HTIg+nBVQnLqbSA4Yx/Y1Bnz0WDxGX04+FTZAF
	mphuRhJWfm0fBAvY11RvJx4ObM8rqqfHkqBqvigJk6EfjIPPN9/+5OYH5JyX8Y2ZcE9fHsIu6hmXU
	qfJBfNS0xlkmz0g/Yeg2SFh0CJYya2cwhM2W8ThGU0U/D1my+qy4dc7h8/NRwHGj6HHumq6YOszsn
	lzKb7UUdA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR2Vk-002FGE-Gn; Tue, 30 Mar 2021 00:45:37 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQyhx-001Pde-1x
 for linux-riscv@desiato.infradead.org; Mon, 29 Mar 2021 20:42:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:Subject:Message-ID:
 Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=IOY00wZMw7iQ/C8A6RUq3HCwcrBzQhlsaRdSeoRLwXs=; b=i10nAkFfUPvG94ppFMu5wjVgl7
 o8xxfMxUJBLMhD8ArNgJ5A+XOBRWMX/+b4qWykbfQEX3Ed4S8l+Nb++7OJyMTRvObtpuVRNaZ/DrL
 n9faIXK+Bo+7DlEth7+rDc2BV2Fwvc7YXvrwfxm6yL3j8Z/e68DB6qWmUYIA9kMyRX63K+DWr4MUQ
 UiaaxQzjjXkibmRICrdBAC+IZGARAiFwxVRnmwI1nwwtMGfGWVQPiLapv9QzgrDRezJNcFtPtuMVY
 mwJ+/B7sAEVprEpNlcVGNt/J23CzAORpzr318uEt0uv5Xhty9mbK4L8pNUF9bK5Dac2iM/tChUjTM
 xaRL1V5w==;
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQyhe-0024nI-Ox
 for linux-riscv@lists.infradead.org; Mon, 29 Mar 2021 20:41:55 +0000
Received: by mail-ej1-x632.google.com with SMTP id jy13so21521491ejc.2
 for <linux-riscv@lists.infradead.org>; Mon, 29 Mar 2021 13:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IOY00wZMw7iQ/C8A6RUq3HCwcrBzQhlsaRdSeoRLwXs=;
 b=oWb6o1aHOSF0DXx/yX1KkO7igNt5jO2+W5TfD710HCbj6l6risPCncqXOwLHFW7VO8
 n2WqBzfjhpbiAq9xr5ewQLs6CPp7Q8JD5j46qyEd0ryBtEmnUxAZ4pz+1sCID0ewC8ux
 c+kDA6hixWaNdB3u91M8vSO/Rm6ab7D5cg6vvwEqrFt6JQRCTqRZ9lKp+iyrXKg1lOzD
 EUimB0/jrdsRXR3RobVvOwNQtAEB3wOBlRKbEWGe1h4MUnTVdVYcpmrl64UXSU/F4xU7
 2UQ47VDwAE3NgXqOvtbgiNZ6wJdOIC5qg0CPJ/OAWvtEQ51hikQWiK0OlgG0pn+IzHNH
 OpbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IOY00wZMw7iQ/C8A6RUq3HCwcrBzQhlsaRdSeoRLwXs=;
 b=loPH26n9OZEJZkuiKY1HjOWlox1rHUqfVgEZ5dnChdGeYxRoRmrpEA+EnDC4a02dni
 SOcitB2vSg8BoZL3FB+SPU9Xl64t1y56KQe1ke1Hq0Z2k7h79EdAZeNTrtQfoNOuFfq/
 nDkQvDrj9gS4LmnIAA7ay/6kGgaFIzUoSdgtq2KYnA9y0MGz2SRxAgIivbvTv/KClLZi
 rfbz7CucQRru+DuI66qbuSeVH0KjPks8lUOrseM+B6FdI4lzSdjM3GDx3MCha6T0A19Y
 TuUgjieu9h/sIfVhSuP2CY9QJt2yhvKu7bekFP10UljyVXOn1p8C5OhdJDNX/hR56hwf
 HHGw==
X-Gm-Message-State: AOAM533pu60hxB6C4hPxBGJbFPk1NDe+qd4fXwyCauekXOVYjlhrAPoO
 ki6pjpqcJsdS94jkHy/4D3NgXDYtHd85NBxFD60=
X-Google-Smtp-Source: ABdhPJxcjn88m4H97qxfK72HhcS5ov53I7up+0loT8VWTFlglQcHijm0szjlpAvoCk9P+6FVl226+HzoXj3NFKnjmh8=
X-Received: by 2002:a17:906:73cd:: with SMTP id
 n13mr29275638ejl.535.1617050484980; 
 Mon, 29 Mar 2021 13:41:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210330022144.150edc6e@xhacker> <20210330022454.3d0feda2@xhacker>
In-Reply-To: <20210330022454.3d0feda2@xhacker>
From: Luke Nelson <luke.r.nels@gmail.com>
Date: Mon, 29 Mar 2021 13:41:13 -0700
Message-ID: <CAB-e3NQ11Gnoa716nnZ2tTgjb02_eZOf1gWn3YMmueEAp92c1g@mail.gmail.com>
Subject: Re: [PATCH 6/9] riscv: bpf: Move bpf_jit_alloc_exec() and
 bpf_jit_free_exec() to core
To: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, 
 Dmitry Vyukov <dvyukov@google.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <kafai@fb.com>,
 Song Liu <songliubraving@fb.com>, 
 Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>,
 KP Singh <kpsingh@kernel.org>, 
 Xi Wang <xi.wang@gmail.com>, linux-riscv <linux-riscv@lists.infradead.org>, 
 open list <linux-kernel@vger.kernel.org>, kasan-dev@googlegroups.com, 
 Networking <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_214142_699739_671BCE57 
X-CRM114-Status: UNSURE (   5.01  )
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

> We will drop the executable permissions of the code pages from the
> mapping at allocation time soon. Move bpf_jit_alloc_exec() and
> bpf_jit_free_exec() to bpf_jit_core.c so that they can be shared by
> both RV64I and RV32I.

Looks good to me.

Acked-by: Luke Nelson <luke.r.nels@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
