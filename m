Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD8C2C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Feb 2022 00:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I6Vq3AgeKycmXZb4Lug8sUZnXocI0NfkJb2d9aqDMtg=; b=qXNyJMnHvmxoA/
	vslmc1r6Ikg0klBpFy7eKxpasrrhr5BAyoG9C/NuI2rBNHXk+IHBDzw3owzQjHWoYJ7z9Ve4vyS/3
	ZCUktwMmNWoOlb6i0TrV9Jw1PkGhUKBsOmYBTffZtuuRf6VMNAFozM15OVf+vSD5zBPiq7v1kVyZv
	qGa5thc0cfwCNpa8IrEWSG1nIHk3125o0MtMKPRJZrbhLlGKkwnREW4T6X37Wnt7K+rjswkzjug2l
	G34iCzKHMkYcHzJDdMK0Z4zFTouh+3M+xLQI90VdEyGV/ULTALiaLRnbsaNBwbUBnzyzEu2QjImQd
	Gwiz0DxUiwOBmWgTshfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHETS-00C3yd-DW; Tue, 08 Feb 2022 00:35:14 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHETQ-00C3yI-3O
 for linux-riscv@lists.infradead.org; Tue, 08 Feb 2022 00:35:13 +0000
Received: by mail-qk1-x734.google.com with SMTP id m25so12489367qka.9
 for <linux-riscv@lists.infradead.org>; Mon, 07 Feb 2022 16:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=L5Y6tZ7R3KyR03w5zcFELc4O16jaupwakXADGje8Tdc=;
 b=X2Yr6MGhvVb6PTuHIw5jF9tlHEgzZoalL5ybQEqPTb/qd7/U7yZhENC+0oxeSj8IRB
 SwlxlJ/mEMpqHyBbYePbI5X0/NH7W2rE4Yd7txmWMcs+UW8cqCkl4qO0YS46t+CuSi3B
 OsQ0d0lnsRoZ7lDicoRZMdYwG7Q0J1RJVzJdHbGJy8WXRSruie6FPM/aROTdlN0QjwHa
 hOLT5hWWMFzMBiSY9KHZUKMqhfcM5Z5pIMPg/S9yMZh1rSlJCGPsyK0RfnvKO3NdobrM
 LcN7iIDBK2ZVe6eGw3hYJgY7QVEt1kLc7Fc4roh3JVgTQHWOiO8+8Qv4iWE5Dz94L7YJ
 J4tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=L5Y6tZ7R3KyR03w5zcFELc4O16jaupwakXADGje8Tdc=;
 b=0mC8j3bu/79wKWdsh02bp7CdFVrecuo6BKcx+6hHeD82CUTuHgJsWMGWChr85PvMvv
 +BW63HtCpKz9etYkuj8CwbC6UAhw5mKD+eAKNWsBzXKQttntlWAQpPTbXVUWRvWW8enx
 xCItzb0BzzGP9eiKmJBzahYwrzVvEyPwXEV8/vLuD47tuAPKjqNMPIiebVilFL1ngAlj
 e5XbfIHBUOU9ykQLoqaX4nUo9Tw88TkTyg+vdNrJf/f3LygIy9p21mG/FEhq40lmvuL4
 8CHQ7qs+SvxfMQrzZ+roHcsRl3VgpLm8T9WhRud3szphaBCp7rWOHq9m5pIu0ygLWjLF
 k8Yw==
X-Gm-Message-State: AOAM533Y7nfY+oH7/uzLQFUV9m39oGKrlqIes263hQPjA5ErDWy7lFyX
 GIZUUKgJQ+i8DvHP2zMqbNG53AbqOA7nBC9y
X-Google-Smtp-Source: ABdhPJwZMRlToBG5m/cjFWjEY1VUrIRmNm8ofG/GqyL7YGNGCqOdI8Lu8XRi4Phm3gAFv2HLEONNdw==
X-Received: by 2002:a05:620a:170e:: with SMTP id
 az14mr1401831qkb.780.1644280510441; 
 Mon, 07 Feb 2022 16:35:10 -0800 (PST)
Received: from mail.google.com ([207.246.89.135])
 by smtp.gmail.com with ESMTPSA id b184sm6354942qkf.87.2022.02.07.16.35.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 16:35:09 -0800 (PST)
Date: Tue, 8 Feb 2022 08:35:02 +0800
From: Changbin Du <changbin.du@gmail.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: ChangbinCONFIG_IRQSOFF_TRACER Du <changbin.du@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: fix oops caused by irq on/off tracer
Message-ID: <20220208003502.62gi5xhyg6bk2t2h@mail.google.com>
References: <20220129004226.32868-1-changbin.du@gmail.com>
 <YgAEb425uqy5/dw1@xhacker>
 <20220207123850.l4r5qjswaegwisbx@mail.google.com>
 <YgE7XRE/Uc6gTCWd@xhacker>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YgE7XRE/Uc6gTCWd@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220207_163512_174195_A4DBACB0 
X-CRM114-Status: GOOD (  18.75  )
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

On Mon, Feb 07, 2022 at 11:31:41PM +0800, Jisheng Zhang wrote:
> On Mon, Feb 07, 2022 at 08:38:50PM +0800, ChangbinCONFIG_IRQSOFF_TRACER Du wrote:
> > On Mon, Feb 07, 2022 at 01:25:03AM +0800, Jisheng Zhang wrote:
> > > On Sat, Jan 29, 2022 at 08:42:26AM +0800, Changbin Du wrote:
> > > > The trace_hardirqs_on/off requires at least two parent call frames.
> > > > If not, the code generated by CALLER_ADDR1 (aka. ftrace_return_address(1))
> > > > could trigger memory access fault.
> > > > 
> > > > [    0.039615][    T0] Unable to handle kernel NULL pointer dereference at virtual address 00000000000000f8
> > > > [    0.041925][    T0] Oops [#1]
> > > > [    0.042063][    T0] Modules linked in:
> > > > [    0.042864][    T0] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.17.0-rc1-00233-g9a20c48d1ed2 #29
> > > > [    0.043568][    T0] Hardware name: riscv-virtio,qemu (DT)
> > > > [    0.044343][    T0] epc : trace_hardirqs_on+0x56/0xe2
> > > > [    0.044601][    T0]  ra : restore_all+0x12/0x6e
> > > > [    0.044721][    T0] epc : ffffffff80126a5c ra : ffffffff80003b94 sp : ffffffff81403db0
> > > > [    0.044801][    T0]  gp : ffffffff8163acd8 tp : ffffffff81414880 t0 : 0000000000000020
> > > > [    0.044882][    T0]  t1 : 0098968000000000 t2 : 0000000000000000 s0 : ffffffff81403de0
> > > > [    0.044967][    T0]  s1 : 0000000000000000 a0 : 0000000000000001 a1 : 0000000000000100
> > > > [    0.045046][    T0]  a2 : 0000000000000000 a3 : 0000000000000000 a4 : 0000000000000000
> > > > [    0.045124][    T0]  a5 : 0000000000000000 a6 : 0000000000000000 a7 : 0000000054494d45
> > > > [    0.045210][    T0]  s2 : ffffffff80003b94 s3 : ffffffff81a8f1b0 s4 : ffffffff80e27b50
> > > > [    0.045289][    T0]  s5 : ffffffff81414880 s6 : ffffffff8160fa00 s7 : 00000000800120e8
> > > > [    0.045389][    T0]  s8 : 0000000080013100 s9 : 000000000000007f s10: 0000000000000000
> > > > [    0.045474][    T0]  s11: 0000000000000000 t3 : 7fffffffffffffff t4 : 0000000000000000
> > > > [    0.045548][    T0]  t5 : 0000000000000000 t6 : ffffffff814aa368
> > > > [    0.045620][    T0] status: 0000000200000100 badaddr: 00000000000000f8 cause: 000000000000000d
> > > > [    0.046402][    T0] [<ffffffff80003b94>] restore_all+0x12/0x6e
> > > > 
> > > 
> > > Hi Changbin,
> > > 
> > > Could you please provide the reproduce steps? It looks a bit
> > > interesting.
> > >
> > Just enable CONFIG_IRQSOFF_TRACER and rebuild kernel with llvm. Then boot the
> > new kernel.
> 
> Thanks for the information. I tried IRQSOFF_TRACER with gcc+binutils,
> can't reproduce the issue. I forget to try clang+llvm. From another side
> The fact that gcc+bintuils can't reproduce it means this is a clang+llvm
> speicial case, no?
The behaviour of GCC is a bit different, please refer to another disccusion:
https://lore.kernel.org/lkml/C2470F2D-9E45-49D7-A03B-E6A7BB4B9738@jrtc27.com/T/

But I suppose it still has similar issue. Make sure FRAME_POINTER is enabled
also.

-- 
Cheers,
Changbin Du

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
