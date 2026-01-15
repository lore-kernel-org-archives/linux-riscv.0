Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C345D41169
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 10:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RYABkdVGtWCT78mnPCY7ApmcprtCRmmVt30vgVgySLk=; b=U3/GSfBVTTQTZR
	0ypp4mghDQ6amDhhJEdgJeVicIQSIJQO7k6riqMEgSlvYqztBOZumFtKYTgGkPo5IsMZeJU3CBcxk
	i67nC/8i//jzNK2TiZ9hs8hEZHBZ6nTGVkSJqJNvLQW6CrMj0j79706WCh3UBu0VKLY5Mfoii/Oiy
	8IffuEsgrro1k+e1STbBrcIuy1SYtQoMF8cd7n+F+wHLaMwit81/P8HiyhXjkZzKTfuGuuRFNvxgu
	xlQMBWAm5VxcEdwsZdHAuQhVZjGtTCDvWauti4nwv3BkvHmDTw/7WGDTgjAVU3TNn3En4Taw/Qalg
	H5ClBlgwv1lw1YYl9DEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgKmc-0000000CAVN-091P;
	Thu, 15 Jan 2026 10:40:56 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgKmZ-0000000CAUS-0Dcj
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 10:40:52 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-47d493a9b96so4617615e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 15 Jan 2026 02:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768473648; x=1769078448; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=syBTlDAByvMUAXYqpRa9En3uBDhRXXk2428oEoGHqyM=;
        b=CUENqrFpKjHIO6LUqQVxkKKVUmxsiS4ylURanO6dAEuu3ynyZpiYhMhLUiiaNT5lzO
         mzQehwjezpUV7TwNjxGaHfuPIkrNxTgwrNlh9iAVHY6ac908oayomN26U9PUZ/r7XuMY
         V/QMpJPKng45Gh9dcV1G583Q4SiADSMIRdQWV8ROvgUw+Lt1JCRNIhHokI5Pyhv+9Kix
         1AFe5QIFdDumlBesbDgldoud7IOhCjhwNj1nK+V9wmKFM9mXIKTLB3Bu1QC9sTrWiK+6
         OKx5M7VWsY5eNVdo/vfdhzUOUJizxhzZjYr0c6w/EfZGBtMUAbd+KxtAjN16r1dLYiDK
         GQfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768473648; x=1769078448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=syBTlDAByvMUAXYqpRa9En3uBDhRXXk2428oEoGHqyM=;
        b=N9dQTeyyarvVx+M3Kq68hQrul9sVzsVpfq+FBxUe7KTAFLSnIRgS0RsMB7vsPPEAVY
         vHVlglYRh6lBggJxfEYGxlbbTCitrrCnuEBzksIVcS35SN0FmWiqrOSpndrSXLJAecii
         uGHFkf6oZ/MHKBOIR+AA+a1RDj2P6Z5mI0/sqPi/8MzvPqRz8Gm2/ZyE+bWKAgxlMqal
         aDaTFY0NRx71JqJncGMTaUqCIeJZxInBM/g2e8fxlx0d22njg5l39Pljcv54VNq1T5lD
         9ECudOG4QfGwc2rfqtMODyM3Z4N7Gxhp0hJ2PW6LvKkM8BGfnuRR50IPmXdbCJPh5w3j
         XXBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuIJXGlRue0pyyDsMxCyABBMmt0jfYA/9drAk553j7e2sgtInzmoXPwP2GR3eiaRt9Br82/poduTM6AQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2FVL0EPSvJ13mHctXesHBIhI/Pgu0jtTeulyfImBudooBLk4O
	XqmY+mGy3fKXqRiMz3Cun/U1Lf7SRlMdB014FYvrBrEFPmtuorOpliOf
X-Gm-Gg: AY/fxX60ZMNDqpH7IFrDm7gZjtS7bT+x4ZZvbVnhR/Hn54Cienfgf38L5+1FhJ3q0xq
	YKfarTuPt7VZgFSZLh0NXNEHEjBAPhdP8o37i0tgi+o9zy3RESYR8V7EIY/vDExfF0IzD+zXCuC
	/yUHA6x3D+wuZw7HsfQ4SF1UpMuI22lpNBZ2ZKQB3tZzd9vv2vmFP6ibXwFiFmzlpcM7TEhVqLU
	HJvYzlsNLx/U5eL/CqqBjDaLfti26xcWArYPZPfcX2YLnEcQXGu3tM7WfIdLSpf4nJM3wYbWRme
	zRT7cA0pnNUy1Fwk2A/de26SWcuChOlgBJ02PhMjFuC/PJjFsWzcPkfJgmrmJ9MMClZRLR/Ix7Y
	50nlHhZTypNKF96FnkwQJVraQy1x696mdR2+HcrwVCIUY0FE8ZAZMnBld8h9DB/NMs/TN27R56D
	EP35nH5QmFgh8MtXJwLVDwjwMPYD7QXfojbNHdI0fon7rYrtXP9tXQRfRnYBGWG2s=
X-Received: by 2002:a05:600c:3555:b0:477:63b5:6f3a with SMTP id 5b1f17b1804b1-47ee33a1b80mr70553835e9.27.1768473648254;
        Thu, 15 Jan 2026 02:40:48 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee117e607sm44513985e9.3.2026.01.15.02.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 02:40:47 -0800 (PST)
Date: Thu, 15 Jan 2026 10:40:45 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Feng Jiang <jiangfeng@kylinos.cn>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, kees@kernel.org,
 andy@kernel.org, akpm@linux-foundation.org, ebiggers@kernel.org,
 martin.petersen@oracle.com, ardb@kernel.org, ajones@ventanamicro.com,
 conor.dooley@microchip.com, samuel.holland@sifive.com,
 linus.walleij@linaro.org, nathan@kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 08/14] lib/string_kunit: add performance benchmark
 for strlen()
Message-ID: <20260115104045.30d385b7@pumpkin>
In-Reply-To: <8bf4c689-fee5-4f6b-b79e-854249a897d0@kylinos.cn>
References: <20260113082748.250916-1-jiangfeng@kylinos.cn>
	<20260113082748.250916-9-jiangfeng@kylinos.cn>
	<aWYGWLEekWh3jJVf@smile.fi.intel.com>
	<b06e4a63-85c2-4420-8077-f4c059ef33fb@kylinos.cn>
	<a58e97ad-a69e-498d-9382-2be4914569b0@kylinos.cn>
	<20260114102154.251082c6@pumpkin>
	<8bf4c689-fee5-4f6b-b79e-854249a897d0@kylinos.cn>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_024051_126362_823452FC 
X-CRM114-Status: GOOD (  37.38  )
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

On Thu, 15 Jan 2026 14:24:16 +0800
Feng Jiang <jiangfeng@kylinos.cn> wrote:

> On 2026/1/14 18:21, David Laight wrote:
> > On Wed, 14 Jan 2026 15:04:58 +0800
> > Feng Jiang <jiangfeng@kylinos.cn> wrote:
> >   
> >> On 2026/1/14 14:14, Feng Jiang wrote:  
> >>> On 2026/1/13 16:46, Andy Shevchenko wrote:    
> >>>> On Tue, Jan 13, 2026 at 04:27:42PM +0800, Feng Jiang wrote:    
> >>>>> Introduce a benchmark to compare the architecture-optimized strlen()
> >>>>> implementation against the generic C version (__generic_strlen).
> >>>>>
> >>>>> The benchmark uses a table-driven approach to evaluate performance
> >>>>> across different string lengths (short, medium, and long). It employs
> >>>>> ktime_get() for timing and get_random_bytes() followed by null-byte
> >>>>> filtering to generate test data that prevents early termination.
> >>>>>
> >>>>> This helps in quantifying the performance gains of architecture-specific
> >>>>> optimizations on various platforms.    
> > ...  
> >> Preliminary results with this change look much more reasonable:
> >>
> >>     ok 4 string_test_strlen
> >>     # string_test_strlen_bench: strlen performance (short, len: 8, iters: 100000):
> >>     # string_test_strlen_bench:   arch-optimized: 4767500 ns
> >>     # string_test_strlen_bench:   generic C:      5815800 ns
> >>     # string_test_strlen_bench:   speedup:        1.21x
> >>     # string_test_strlen_bench: strlen performance (medium, len: 64, iters: 100000):
> >>     # string_test_strlen_bench:   arch-optimized: 6573600 ns
> >>     # string_test_strlen_bench:   generic C:      16342500 ns
> >>     # string_test_strlen_bench:   speedup:        2.48x
> >>     # string_test_strlen_bench: strlen performance (long, len: 2048, iters: 10000):
> >>     # string_test_strlen_bench:   arch-optimized: 7931000 ns
> >>     # string_test_strlen_bench:   generic C:      35347300 ns  
> >>     # string_test_strlen_bench:   speedup:        4.45x
> > 
> > That is far too long.
> > In 35ms you are including a lot of timer interrupts.
> > You are also just testing the 'hot cache' case.
> > The kernel runs 'cold cache' a lot of the time - especially for instructions.
> > 
> > To time short loops (or even single passes) you need a data dependency
> > between the 'start time' and the code being tested (easy enough, just add
> > (time & non_compile_time_zero) to a parameter), and between the result of
> > the code and the 'end time' - somewhat harder (doable in x86 if you use
> > the pmc cycle counter).  
> 
> Hi David,
> 
> I appreciate the feedback! You're absolutely right that 35ms is quite long; it
> was measured in a TCG environment, and on real hardware (ARM64 KVM), it's
> actually an order of magnitude faster. I'll definitely tighten the iterations
> in v3 to avoid potential noise.

Doing time-based measurements on anything but real hardware is pointless.
(It is even problematic on some real hardware because the cpu clock speed
changes dynamically - which is why I've started using the x86 pmc to count
actual clock cycles.)

You only really need enough iterations to get enough 'ticks' from the
timer for the answer to make sense.
Other effects mean you can't really quote values to even 1% - so 100 ticks
from the timer is more than enough.
I'm not sure what the resolution of ktime_get_ns() is (will be hardware
dependant) 
You are better off running the test a few times and using the best value.

Also you don't need to do a very long test to show a x4 improvement!

To see how good an algorithm really is you really need to work out the
'fixed cost' and 'cost per byte'  in 'clocks' and 'clocks per byte'
(or 'bytes per clock') although they can be 'noisy' for short lengths.
The latter tells you how near to 'optimal' the algorithm is and lets you
compare results between different cpus (eg Zen-5 v i7-12xxx).
For instance the x86-64 IP checksum code (nominally 16bit add with carry)
actually runs at more than 8 bytes/clock on most cpu (IIRC it manages 12
but not 16).

> 
> For the more advanced suggestions like cold cache and data dependency, I can
> see how they would make the benchmark much more rigorous. My plan is to follow
> the pattern in crc_benchmark() to refine the logic, as I feel this approach is
> simple, easy to maintain, and provides a good enough baseline for our needs.
> 
> While I understand that simulating a cold cache would be more precise, I'm
> concerned it might introduce significant complexity at this stage. I hope the
> current focus on hot-path throughput is a reasonable starting point for a
> general KUnit test.
> 

I've only done 'cold cache' testing in userspace - counting the actual
clocks for the each call (the first value is cold cache).

Gives a massive difference for large functions like blake2s where the
unrolled loop is somewhat faster, but for the cold-cache it is only
worth it for buffers over (about) 8k (and that might be worse if the
cpu is running at full speed which makes the memory effectively slower).

The other issue with running a test multiple times is that the branch
predictor will correctly predict all the branches.
So something like memcpy() which might have different code for different
lengths will always pick the correct one.
Branch mis-prediction seems to cost about 20 clocks on my zen-5.

Anyway, some measurements are better than none.

	David



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
