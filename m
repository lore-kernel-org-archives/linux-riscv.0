Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15985C0219B
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Feb 2025 10:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0xXJtovgt7qIdvC+N3d4ROEMCU6yW3gNtXQp2obYAG0=; b=YJDJ7XcElfSWWC
	dPW/zX3EhyULJA14Hpj0i/uCpliI4bwm+cYY6plq6NyMC3yBjILqWloqYiKv77JSdU3dgbiIelZBc
	nCMUUOc76MO2GCpCWXlTPCPO3UXiXz6fNh/hhHrZlVktzWs2eqnWT0isw9OJNZaHXgBz3+b5/hIIM
	12QOV7VeR2HXWoTSaAHhR1DC8doC83zmPNW3ROiFhfhoNgOYVLeUIue1ZIHQDBSmvGZulYJgsCo3X
	Mq9E/SgSSEbkhx9DXkT30IQzpevXuTFqo8rAyR+lGkYREkkSxYS6XZUMSmpCdImXo8k1t1nYI7/Oh
	zYWesSUaJKOxDFV1IqhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thn3o-00000003Gwz-2G4m;
	Tue, 11 Feb 2025 10:00:08 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thn3m-00000003GwI-0AAS
	for linux-riscv@lists.infradead.org;
	Tue, 11 Feb 2025 10:00:07 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-2a8690dcb35so1625126fac.3
        for <linux-riscv@lists.infradead.org>; Tue, 11 Feb 2025 02:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739268005; x=1739872805; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kMjcIGjdI0ffRg0rAm5FAcc+FuG3Hvf62mMCY1pQncg=;
        b=mQQZ5RR96eMNPgmtey79o9AeRt8RF9hUKE8owRn3/kAkWQy0wQjNOeLuht6W6tpujW
         9bGo5J2RjFQ2K2DsZvgw6rhOU4LiTTar8kzqTWgyZyUo7PS/OGL4Yc1CmWeg3PHgujny
         0PA44V7ru8B1/DhTWyQw5oyMY/yCp8VnYsP00xz91P4SyuPTiodJbFRl8Q80DvFL6sP0
         TJZpb/ViArvGtArgR9gISa8yZJ1o2yAGwqvvTGIUff0vNrETmLujNIaJVr+Zl4XQ0Xap
         1Cxn+A7Z6ZZ66yPHs8yxHpiOY6tqFxjHrMvD9FFHK5beu5LvcbM1LqHEYiAkQcVE06vg
         VP6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739268005; x=1739872805;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kMjcIGjdI0ffRg0rAm5FAcc+FuG3Hvf62mMCY1pQncg=;
        b=ZIdD+RcYYlD0C7TQb+GEmLyE3l8ngpoLdM4JM8+Tl2GhSmOJfOuSmbgMpP/IHRtDkf
         mgUCG0TgJs7KfOq31laTUJph18UcbtBBiBTtxtD8yrg7VnQDrsvN2SWnzVGbM8hcGlvK
         at0g487OG4dfovMrmkucJxWGgx5XxTQmO4am7nBXLTMd6O3qIMMsp40Wkmk/P5n1TDtB
         G98eAUclJ/LqCDOx1xqK19HHjt7GTe8PujThZL9Bc9TQ32TN6PgV3c9HGEJiW4LMP+wv
         Ju3MqrfpxaUuh/UtoApEzK82hw3r4h9TFP0Tu49V4z0+56cwW0vdpKm5mgc5CQD3LOOy
         z4HA==
X-Forwarded-Encrypted: i=1; AJvYcCXi+4FDM30oygsvrfXr8vBRcyMkZkg41zTRa7aTyywteqn5BSeuJSgLDQ8n5tkvC+n+3Jn2x0hwy/IU1w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxr8pRwwKGvhYhLXABZeAJWFtE2ubMxnFFzCpheKwSgfoLGYAuU
	aX50dhESnGl0h2S7nC9hBCzrl65SNOEl8JZ7AEqcj1LhDzQGC07EG1u9RSDMpqNowX7AyYLO6LP
	dY+tgl6CuetlCcsVZGG+g7pW+8Po=
X-Gm-Gg: ASbGnctp+tWmPlZ4zqq5UlM+TOafIqG7n1vLo02ZwYHaeSDPtKwIXIgAvplkJI3kJU5
	p/fnuw8xnztVQf5GsJlBNfcoJ+78KUtctYdoVLm+S4KRiOR+Gs3YLsOfphWeCfBzgTDQjcGbP2t
	xn7nIqSHEmhZZB/MLE7OxpG6vTw1WS
X-Google-Smtp-Source: AGHT+IGKksbEJ3etHXNKjondEMVicvSi7j8TGiJnnmy64FsLmXK2Iy60qC1Tibj+mbuOXvUSqichua+e9GwzGGxuQRA=
X-Received: by 2002:a05:687c:2187:b0:29e:75ff:4d0c with SMTP id
 586e51a60fabf-2b83eb5153amr11531322fac.4.1739268004642; Tue, 11 Feb 2025
 02:00:04 -0800 (PST)
MIME-Version: 1.0
References: <20250127061529.2437012-1-zhangchunyan@iscas.ac.cn>
 <c0a2fbeb-9a0d-4b69-bc6b-e1652e13debf@molgen.mpg.de> <Z5gJ35pXI2W41QDk@ghost>
In-Reply-To: <Z5gJ35pXI2W41QDk@ghost>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Tue, 11 Feb 2025 17:59:26 +0800
X-Gm-Features: AWEUYZkt8OdocdXVb0pQ5ZqBPoTuLbqJn64H0myEHoRqE0UKOX8xoM8V-7Mr18s
Message-ID: <CAAfSe-utAb53278x9X4tKn6jWzdehsPKDRa_CoQy61ND=cXbxQ@mail.gmail.com>
Subject: Re: [PATCH V2] raid6: Add RISC-V SIMD syndrome and recovery calculations
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, Chunyan Zhang <zhangchunyan@iscas.ac.cn>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Song Liu <song@kernel.org>, Yu Kuai <yukuai3@huawei.com>, 
	linux-riscv@lists.infradead.org, linux-raid@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_020006_076960_26240B4B 
X-CRM114-Status: GOOD (  22.73  )
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

On Tue, 28 Jan 2025 at 06:34, Charlie Jenkins <charlie@rivosinc.com> wrote:
>
> On Mon, Jan 27, 2025 at 09:39:11AM +0100, Paul Menzel wrote:
> > Dear Chunyan,
> >
> >
> > Thank you for the patch.
> >
> >
> > Am 27.01.25 um 07:15 schrieb Chunyan Zhang:
> > > The assembly is originally based on the ARM NEON and int.uc, but uses
> > > RISC-V vector instructions to implement the RAID6 syndrome and
> > > recovery calculations.
> > >
> > > Results on QEMU running with the option "-icount shift=0":
> > >
> > >    raid6: rvvx1    gen()  1008 MB/s
> > >    raid6: rvvx2    gen()  1395 MB/s
> > >    raid6: rvvx4    gen()  1584 MB/s
> > >    raid6: rvvx8    gen()  1694 MB/s
> > >    raid6: int64x8  gen()   113 MB/s
> > >    raid6: int64x4  gen()   116 MB/s
> > >    raid6: int64x2  gen()   272 MB/s
> > >    raid6: int64x1  gen()   229 MB/s
> > >    raid6: using algorithm rvvx8 gen() 1694 MB/s
> > >    raid6: .... xor() 1000 MB/s, rmw enabled
> > >    raid6: using rvv recovery algorithm
> >
> > How did you start QEMU and on what host did you run it? Does it change
> > between runs? (For me these benchmark values were very unreliable in the
> > past on x86 hardware.)
>
> I reported dramatic gains on vector as well in this response [1]. Note
> that these gains are only present when using the QEMU option "-icount
> shift=0" vector becomes dramatically more performant. Without this
> option we do not see a performance gain on QEMU. However riscv vector is
> known to not be less optimized on QEMU so having vector be less
> performant on some QEMU configurations is not necessarily representative
> of hardware implementations.
>
>
> My full qemu command is (running on x86 host):
>
> qemu-system-riscv64 -nographic -m 1G -machine virt -smp 1\
>     -kernel arch/riscv/boot/Image \
>     -append "root=/dev/vda rw earlycon console=ttyS0" \
>     -drive file=rootfs.ext2,format=raw,id=hd0,if=none \
>     -bios default -cpu rv64,v=true,vlen=256,vext_spec=v1.0 \
>     -device virtio-blk-device,drive=hd0
>
> This is with version 9.2.0.
>
>
> I am also facing this issue when executing this:
>
> raid6: rvvx1    gen()   717 MB/s
> raid6: rvvx2    gen()   734 MB/s
> Unable to handle kernel NULL pointer dereference at virtual address 0000000000000020
>
> Only rvvx4 is failing. I applied this patch to 6.13.

I used your command to run but no issue on my side (x86 host, qemu
version is 9.2.0, kernel 6.13 too):

qemu-system-riscv64 -nographic -m 1G -machine virt -smp 1 -icount shift=0 \
        -kernel arch/riscv/boot/Image   \
        -append "rootwait root=/dev/vda ro"     \
        -drive file=rootfs.ext4,format=raw,id=hd0 \
        -bios default -cpu rv64,v=true,vlen=256,vext_spec=v1.0 \
        -device virtio-blk-device,drive=hd0

Thanks,
Chunyan

>
> - Charlie
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
