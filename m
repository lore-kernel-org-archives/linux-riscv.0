Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25236C36010
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Mar 2025 16:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=s+a7sznD2iRDqkdgyKBri7jkX0tgeEFtUj1YUzpg+UU=; b=nxwO1/AYEp8kUY5+Vhh1rvzbv2
	EUbRX6TZIODA5C8/UfGd3SqI+FWbxvvIe+xOHM0qHBdrfnn96LQPjRojacW8tuRCtnzFnhUo2Bx0e
	pePDDz+OapMWOFQE8yMSK+7A74Hj7zL8JON3d7E/bnrK865MmajKLvHvPSFfz8neNqSB836/FDYJw
	/IwRwRH/zkf4gOWwKwIRLNkvyUgW4JrXx+ZPLCGVX5nK/ZEJpuYQS2owTYndzJDftDwbh5BS/LtBK
	XDsh0hcdrtQ/QTCsdzFT/2+TqamYgoqHofaFIbp3gFU3ssUVD8GTtT4m3V2k8yjpmC9RCfXqi2xYw
	qVJFFlnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txpyO-0000000BUwp-2Itm;
	Thu, 27 Mar 2025 16:20:52 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txpxk-0000000BUnf-2qDh
	for linux-riscv@lists.infradead.org;
	Thu, 27 Mar 2025 16:20:15 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-224341bbc1dso25552265ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 27 Mar 2025 09:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1743092412; x=1743697212; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kX05jx75Xb8+ENPYRjK+Gc3Ht1e9kjVMOGIod7/HdTg=;
        b=I3OOx2LDFaiXhxdYk2FfPSYtRt0Z20HXUaxE7dXZHIfHj6Iqmuzv1NoN6LBc0Uk8Ra
         7+f8SGUpdGc+/1OV//xZmWaklMa5vRGTGKaDiyekTnxWXspTRmlqxs0I3+CZuti+oWIx
         MUAla7AtO5TcwcDYS8hneaq83RpXdhN+m6FZ5cVDKeKHuBkbOYYmSzVlMo+KRDCQ1PST
         rnwqun/iip7LUJF8QdunbKv819sT1EzPgJDr+RUqL311As18H3yMc3bTqVMQKnb4pmfy
         CnbkF+DTU8ps2ctxbei+y1NIglGR53JRIdpWYA/6LlWPG7L1DS9DwCAdFouEgOgwYN5Z
         6D+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743092412; x=1743697212;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kX05jx75Xb8+ENPYRjK+Gc3Ht1e9kjVMOGIod7/HdTg=;
        b=Nk+ylfUSudcbg9I1tVbY6rcR71DOXmYnFotjWkr309PemsqUS+EfjkN39z51opmfBJ
         YAXyY9OY3Ndw4ogtAStzgTSe6/7lhATvYfbwWN54PTVbgiQ6Ktm7jrOKYRjc0Pqf9FWH
         J9SkKmu60TXku43Qz5UGRfMUQtY2yPlVzjUBfRiazbIxz4hPgpx2HeyOeXpfv+WRFits
         HV8rTT7X8ppm4uaSQAn07JgTYrwqf5Pdq0YqwliJ1aCZBvygkdKapeVuIMIWM4OHBa6z
         NWN9aiB3OfyZEBeeNqmAvFDl5uYfEMY+ZZ4hIvJ18Hr8fOpUgamttoOt6fi2cGRgEEEk
         T9XA==
X-Forwarded-Encrypted: i=1; AJvYcCVrJzVguvxFR59Xxza+ntDNU1Ecg6eEorTqFNeUUGqyBfgXS1kRzPT8Wo4HBWF7mGNAUwbOOtD/H3saag==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz10JpV6MKc3cJSQ7ugc4wSb6/9V18HEOazg8KugjiE0x7g9UnZ
	YcEskTGvBdpluGI8CP3WRq6RV3xqIMu9/QfM7H8y20uInBjqw6TUgIm+VfkPbCQ=
X-Gm-Gg: ASbGncsaeLIMzAOdAWC/h8+vRzUKlLFMQ8zgUfE6V55SA1xp3y5zk80z5OEvhZr/tlW
	rLRvnFyJhD+LgW8gGxVmqga/Vir0uofpdWlAjirHbHn+9b4aa7mUfBsXm0FHkyLPrHJephiwPpi
	Tab4m/daruuyACFj0tFxS65WP8gE4U77VH9Xumbt6z2ofxjZh/C6pLR3VxPNIHycGw6TpoNyBnP
	oJ26SveRWsevqyCJxmk5m+rMeGGY21wvtokYDECGGNpMH8msUIpqp7gP8qHY10qaGt7yXlhYX3D
	We+seiaVraC6+HnVhUIAgEzAFLaZ5HBg5xeGZg==
X-Google-Smtp-Source: AGHT+IGClNJzmnXOK1L/PFNFl5ogZb2gMU/Eqg4X3l9WVxApkZth9g72YE2t9vJ4dK3KZhjxhfYK+Q==
X-Received: by 2002:a17:903:228c:b0:224:216e:332f with SMTP id d9443c01a7336-22804968a3cmr61064755ad.48.1743092411962;
        Thu, 27 Mar 2025 09:20:11 -0700 (PDT)
Received: from localhost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eec780bsm1682245ad.19.2025.03.27.09.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 09:20:11 -0700 (PDT)
Date: Thu, 27 Mar 2025 09:20:11 -0700 (PDT)
X-Google-Original-Date: Thu, 27 Mar 2025 09:20:02 PDT (-0700)
Subject: Re: [RFC PATCH V3 01/43] rv64ilp32_abi: uapi: Reuse lp64 ABI interface
In-Reply-To: <CAHk-=wiVgTJpSxrQbEi28pUOmuWXrox45vV9kPhe9q5CcRxEbw@mail.gmail.com>
CC: guoren@kernel.org, Arnd Bergmann <arnd@arndb.de>,
  Greg KH <gregkh@linuxfoundation.org>, Paul Walmsley <paul.walmsley@sifive.com>, anup@brainfault.org,
  atishp@atishpatra.org, oleg@redhat.com, kees@kernel.org, tglx@linutronix.de,
  Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, brauner@kernel.org,
  akpm@linux-foundation.org, rostedt@goodmis.org, edumazet@google.com, unicorn_wang@outlook.com,
  inochiama@outlook.com, gaohan@iscas.ac.cn, shihua@iscas.ac.cn, jiawei@iscas.ac.cn,
  wuwei2016@iscas.ac.cn, drew@pdp7.com, prabhakar.mahadev-lad.rj@bp.renesas.com, ctsai390@andestech.com,
  wefu@redhat.com, kuba@kernel.org, pabeni@redhat.com, josef@toxicpanda.com, dsterba@suse.com,
  mingo@redhat.com, peterz@infradead.org, boqun.feng@gmail.com, xiao.w.wang@intel.com,
  qingfang.deng@siflower.com.cn, leobras@redhat.com, jszhang@kernel.org,
  Conor Dooley <conor.dooley@microchip.com>, samuel.holland@sifive.com, yongxuan.wang@sifive.com, luxu.kernel@bytedance.com,
  david@redhat.com, ruanjinjie@huawei.com, cuiyunhui@bytedance.com, wangkefeng.wang@huawei.com,
  qiaozhe@iscas.ac.cn, Ard Biesheuvel <ardb@kernel.org>, ast@kernel.org, linux-kernel@vger.kernel.org,
  linux-riscv@lists.infradead.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-mm@kvack.org,
  linux-crypto@vger.kernel.org, bpf@vger.kernel.org, linux-input@vger.kernel.org,
  linux-perf-users@vger.kernel.org, linux-serial@vger.kernel.org, linux-fsdevel@vger.kernel.org,
  linux-arch@vger.kernel.org, maple-tree@lists.infradead.org, linux-trace-kernel@vger.kernel.org,
  netdev@vger.kernel.org, linux-atm-general@lists.sourceforge.net, linux-btrfs@vger.kernel.org,
  netfilter-devel@vger.kernel.org, coreteam@netfilter.org, linux-nfs@vger.kernel.org, linux-sctp@vger.kernel.org,
  linux-usb@vger.kernel.org, linux-media@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-16d3c75b-cf60-499e-98b0-098d630874b4@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_092012_738582_CD73FAC9 
X-CRM114-Status: GOOD (  25.30  )
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

On Tue, 25 Mar 2025 13:41:30 PDT (-0700), Linus Torvalds wrote:
> On Tue, 25 Mar 2025 at 05:17, <guoren@kernel.org> wrote:
>>
>> The rv64ilp32 abi kernel accommodates the lp64 abi userspace and
>> leverages the lp64 abi Linux interface. Hence, unify the
>> BITS_PER_LONG = 32 memory layout to match BITS_PER_LONG = 64.
>
> No.
>
> This isn't happening.
>
> You can't do crazy things in the RISC-V code and then expect the rest
> of the kernel to just go "ok, we'll do crazy things".
>
> We're not doing crazy __riscv_xlen hackery with random structures
> containing 64-bit values that the kernel then only looks at the low 32
> bits. That's wrong on *so* many levels.

FWIW: this has come up a few times and we've generally said "nobody 
wants this", but that doesn't seem to stick...

> I'm willing to say "big-endian is dead", but I'm not willing to accept
> this kind of crazy hackery.
>
> Not today, not ever.

OK, maybe that will stick ;)

> If you want to run a ilp32 kernel on 64-bit hardware (and support
> 64-bit ABI just in a 32-bit virtual memory size), I would suggest you
>
>  (a) treat the kernel as natively 32-bit (obviously you can then tell
> the compiler to use the rv64 instructions, which I presume you're
> already doing - I didn't look)
>
>  (b) look at making the compat stuff do the conversion the "wrong way".
>
> And btw, that (b) implies *not* just ignoring the high bits. If
> user-space gives 64-bit pointer, you don't just treat it as a 32-bit
> one by dropping the high bits. You add some logic to convert it to an
> invalid pointer so that user space gets -EFAULT.
>
>             Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
