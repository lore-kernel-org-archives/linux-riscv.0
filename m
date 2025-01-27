Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CDC2C02188
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jan 2025 22:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B8TgSncAhXp39RX50z7tDe6WAnps+azY5+t+sh8mtDo=; b=Xay+gY1mHrvavG
	l/DQUls+eMOke3N3+pbnbGsP65ZonZ3QvkTvH3IB/sD7fBtYWn8gCNl5apJSRLUxGTRMQyYodevOa
	ix+cLrFy13d+t/OD5aRxEMRoA9iWBYmhk5JLjZRcrfKcBJX0k8IY59RHt3RXQem0mmFxtNGBK6Poa
	JSygTM8lRp0AcGjja8VBYsG0ucNspEHCwMacZ0ea4MLnAgtFFL77Ls1HYUMO0rbga22Qom26/BnOT
	/29r7TLJmw6a4oLcZOlYuFLphP4sBadAfij4oE2c9BM1JSIatyUfakfwaWmGQZRortqe/UGewzQKL
	E52dEQ4itS0zzzyqJCQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcXgL-00000003Pxa-1Brn;
	Mon, 27 Jan 2025 22:34:13 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcXgJ-00000003Px4-0xHx
	for linux-riscv@lists.infradead.org;
	Mon, 27 Jan 2025 22:34:12 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2164b1f05caso85785935ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jan 2025 14:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738017250; x=1738622050; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hNUQf/BH62XVFiSZqVQheOvs7cvOxVQxNhdOPTli9YQ=;
        b=as/v3aspyI7hk+Mcc5mMU05XBVouP8gyhjT09kGbxSsQDGTNNuGgzMyKISdLWcOUhe
         Dgqz+pyA8zSgT+nsGmiAIf9NfP/MiqdZ75SJGoAOSQkjObhvhQWkDAPPkJmqEJ5QQCxr
         IuDLX1hGdPOOo54rpKbFpcW0LSULWSValGfElgLsobEjdA1/b8JL1v1C3NpWSddg4jxU
         HG6lbMNJbPQgLP6V8P5HVI1x3wdC5L5/zdx3qi/mEiKnAIIKwGlDZDUAcu5OqMxx/i2Q
         BkeSrFfMgxb9nBxNmYoLkf+dbFzjSqL1cwK0YA8bb5fxdKyn8HsD5/yY7ljGQ4hLSHuc
         VEIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738017250; x=1738622050;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hNUQf/BH62XVFiSZqVQheOvs7cvOxVQxNhdOPTli9YQ=;
        b=ALgVBFFD1xJ7SzJjQKmv04SL7IhuWG/MYDtBhtvLjsogmAnAkeBRq/mxb4GG0EOiA/
         xWHB0zKMDz41iPCf/NVRpOKb+vjicczWBVm3QYRTXylIj8mNx6LieftYKP8eYRQBTd31
         PS7tKKRIy1Ba1YHSNRQ3e3ktojrjXpB6rA/fP7EQaTvwjMCjw6QFWoPr0vk6I4fQDIsm
         +F7LCWrNGEUVutWnOaaRpi5e632gvA0/d83Ox4wgLZv4kbNqVWD9Zy53mePiTcr8Iu5T
         UizRDfGQlzAcPZYK3ozq879S9KP5fKZ7rGvPszOej1wNjwoybyKSqYjgycaoUT0chFL7
         nsZw==
X-Forwarded-Encrypted: i=1; AJvYcCVkpFRdaYlUqpRqtnM3mSLqVfnEzx96SPhuwVGZCAk1Hx/cCW2jXfilBk3VpNKyUnKkX0mScysNu9mYJQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxs42xYOOF9P3ZRdm7bLYptmQmsVXfoclSliQKjJ1NY28C6l3xh
	NIwyo/WJ6X2Brs3s9mQjBRoFZMxy13IO0L7HMQobCK2kLMiifBesJTc//y0d/cQ=
X-Gm-Gg: ASbGncvbKcxcTt0Xm+DvhPvlbusbO+E9Ts0AKZte270AFu2nBAcKKhOt3tBxJdUUOf+
	MlQDaUw2eHwWbhIaJeX88prdkCnxKeJbyXTZVw5ax4RU1yXGvBW/G/CFABKfvboUI4cUlWNSKfW
	AnMjQhDe02LkDTH4JZc2junKaGJtuELwdyAKYqzKUULIpBQFflRjlFqLp6L+T5VSoJSNueEUHud
	tRFTHuUl3yFlYJtQnSsCyr4+/b6iEkrrnAPnLUSX/5Zjcl0IV42Hp7Hhq+2gMNgq6A14jI=
X-Google-Smtp-Source: AGHT+IG1PsIZ6jEY35m/19n24um/49j+2QwIysUJvG8QmgPY/IM3AWJfA7DedGeF/WQstxSfxXf+TA==
X-Received: by 2002:a17:903:320e:b0:217:9172:2ce1 with SMTP id d9443c01a7336-21c35544407mr700049175ad.22.1738017250514;
        Mon, 27 Jan 2025 14:34:10 -0800 (PST)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da3ea3bb9sm69323645ad.92.2025.01.27.14.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 14:34:09 -0800 (PST)
Date: Mon, 27 Jan 2025 14:34:07 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Chunyan Zhang <zhangchunyan@iscas.ac.cn>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Song Liu <song@kernel.org>,
	Yu Kuai <yukuai3@huawei.com>, linux-riscv@lists.infradead.org,
	linux-raid@vger.kernel.org, linux-kernel@vger.kernel.org,
	Chunyan Zhang <zhang.lyra@gmail.com>
Subject: Re: [PATCH V2] raid6: Add RISC-V SIMD syndrome and recovery
 calculations
Message-ID: <Z5gJ35pXI2W41QDk@ghost>
References: <20250127061529.2437012-1-zhangchunyan@iscas.ac.cn>
 <c0a2fbeb-9a0d-4b69-bc6b-e1652e13debf@molgen.mpg.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c0a2fbeb-9a0d-4b69-bc6b-e1652e13debf@molgen.mpg.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_143411_266069_86AE9FEC 
X-CRM114-Status: GOOD (  16.93  )
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

On Mon, Jan 27, 2025 at 09:39:11AM +0100, Paul Menzel wrote:
> Dear Chunyan,
> 
> 
> Thank you for the patch.
> 
> 
> Am 27.01.25 um 07:15 schrieb Chunyan Zhang:
> > The assembly is originally based on the ARM NEON and int.uc, but uses
> > RISC-V vector instructions to implement the RAID6 syndrome and
> > recovery calculations.
> > 
> > Results on QEMU running with the option "-icount shift=0":
> > 
> >    raid6: rvvx1    gen()  1008 MB/s
> >    raid6: rvvx2    gen()  1395 MB/s
> >    raid6: rvvx4    gen()  1584 MB/s
> >    raid6: rvvx8    gen()  1694 MB/s
> >    raid6: int64x8  gen()   113 MB/s
> >    raid6: int64x4  gen()   116 MB/s
> >    raid6: int64x2  gen()   272 MB/s
> >    raid6: int64x1  gen()   229 MB/s
> >    raid6: using algorithm rvvx8 gen() 1694 MB/s
> >    raid6: .... xor() 1000 MB/s, rmw enabled
> >    raid6: using rvv recovery algorithm
> 
> How did you start QEMU and on what host did you run it? Does it change
> between runs? (For me these benchmark values were very unreliable in the
> past on x86 hardware.)

I reported dramatic gains on vector as well in this response [1]. Note
that these gains are only present when using the QEMU option "-icount
shift=0" vector becomes dramatically more performant. Without this
option we do not see a performance gain on QEMU. However riscv vector is
known to not be less optimized on QEMU so having vector be less
performant on some QEMU configurations is not necessarily representative
of hardware implementations.


My full qemu command is (running on x86 host):

qemu-system-riscv64 -nographic -m 1G -machine virt -smp 1\
    -kernel arch/riscv/boot/Image \
    -append "root=/dev/vda rw earlycon console=ttyS0" \
    -drive file=rootfs.ext2,format=raw,id=hd0,if=none \
    -bios default -cpu rv64,v=true,vlen=256,vext_spec=v1.0 \
    -device virtio-blk-device,drive=hd0

This is with version 9.2.0.


I am also facing this issue when executing this:

raid6: rvvx1    gen()   717 MB/s
raid6: rvvx2    gen()   734 MB/s
Unable to handle kernel NULL pointer dereference at virtual address 0000000000000020

Only rvvx4 is failing. I applied this patch to 6.13.

- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
