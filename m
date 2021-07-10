Return-Path: <SRS0=oGbN=MC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6B9AC07E99
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Jul 2021 01:50:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1359E61074
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Jul 2021 01:50:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1359E61074
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HOQy741p/m2xk+y6vcAzHLmjXnEz5KiZVeneFN4HbFc=; b=VyDIy/pSs4f/lK
	vx4mHp4ymIJ/MMSiJt9srhGLRCDCfKkHB2VcJ+yePrfddrnkRvWd38VWXvV+vO/PUR6w9FwPTHM5q
	iKFzle2w/CMUsVgPFLBhgY+RpesJPWA4+GTWLLVr08X4HY/2gEi2SntpWNtMDra/2oi9mnV5Tt/mz
	CDGaSGfsxIzAUJgae4dMWQ/9mt+gcAqj2TF0z1Dp3DlNIJXA3LzhE4RKxt/4vIH1w5+QgKJ6rLZAk
	P8bYRAfi4sVRnF/fDxc/Qst3fNymdLPRBt2AKkTFa8nywhO0uZteXmK0cJa9npU2871UKk+PUJb2k
	z3jxkDgr0QEAuQ9HvOew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m227W-002jLB-72; Sat, 10 Jul 2021 01:49:30 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m227S-002jKs-VM
 for linux-riscv@lists.infradead.org; Sat, 10 Jul 2021 01:49:28 +0000
Received: by mail-ot1-x32d.google.com with SMTP id
 f93-20020a9d03e60000b02904b1f1d7c5f4so10580204otf.9
 for <linux-riscv@lists.infradead.org>; Fri, 09 Jul 2021 18:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=MYPx4iX7p7e1oDK1yRwFgkNCDq15P6lcDOndgthyp9c=;
 b=APOWKMZEoxZteufD2Rt9mcmt2qAHD1eX8IUarLbLhoqsmbCyYO8UtuR1aLf0foRVwC
 Q9Rm26e4KCK8MoVmji+domatJU1OPWQ3Q894qRjls4c7lg/lTmpJ8bletb3dVGywUluG
 WQeoLbdy5WtdxH50fnSMqKx+AKJTVu8SRQAmlvYOUSv7pdBbLAfXlhByvZe3hQDlrAaP
 r539aWKkNBK6YIkV02AJhBi0m2wRs+qijmeSBsoKWJeMtm/bs8XA/DamytLAtmnxkjqf
 xHmsZIECiovV5lMKjolo52hhU2CtYFQJDGq4ejOWhFtnwO7WsoIpVVp3fl9uaNbm+Hlu
 zS9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=MYPx4iX7p7e1oDK1yRwFgkNCDq15P6lcDOndgthyp9c=;
 b=DdytpQ9fmD64kaPMBQpPzxR/A+tZfmyz0DkenUDRqaLGI0fj2t6thJ106ymqGdeMFq
 78U2YUJuhr4Hll9Lps6JDOyUu/hO4W7NSJRZ8qyt7GC7EJhp2XrEZYV7OhsWmdMig06A
 4bOliMqUvu4yQTMFaYavhRzOiAYNWlsl6oIMr704ueydsbZ2f7mR77a2608PV6Pel63u
 wZO+ctW7+C0UaQIGlYNGDwBLlj/xthjhkrTnrZA3pO5aA1gsH5ZJ+b2o5pizJFr4yOWx
 bbRG76OHWttL8B0KdYs6x4Zq1l0lWZR4VDnLJzfOnFAoQr2n08dsoklM1oIPJ5JzXomS
 kXNw==
X-Gm-Message-State: AOAM5325/jLtzog7nkLKWlKQXkd6uTmCm544IBBS62H+IuBR1BNiEFEB
 ChCg7mlxygc6Gx5GuqHsUu0=
X-Google-Smtp-Source: ABdhPJw2NRTJpwpa7pabrMNuPAwtc4fwQ0YncE3mWJdWcCAKkq8vDUCtINQG5rFPbE3tWfnlE8irMg==
X-Received: by 2002:a9d:77c6:: with SMTP id w6mr7904625otl.123.1625881765055; 
 Fri, 09 Jul 2021 18:49:25 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id 76sm1500733otj.28.2021.07.09.18.49.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 18:49:17 -0700 (PDT)
Date: Fri, 9 Jul 2021 18:49:15 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Akira Tsukamoto <akira.tsukamoto@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/1] riscv: __asm_copy_to-from_user: Optimize
 unaligned memory access and pipeline stall
Message-ID: <20210710014915.GA149706@roeck-us.net>
References: <3e1dbea4-3b0f-de32-5447-2e23c6d4652a@gmail.com>
 <60c1f087-1e8b-8f22-7d25-86f5f3dcee3f@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <60c1f087-1e8b-8f22-7d25-86f5f3dcee3f@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210709_184927_062131_BE340CB6 
X-CRM114-Status: GOOD (  20.93  )
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

Hi,

On Wed, Jun 23, 2021 at 09:40:39PM +0900, Akira Tsukamoto wrote:
> This patch will reduce cpu usage dramatically in kernel space especially
> for application which use sys-call with large buffer size, such as network
> applications. The main reason behind this is that every unaligned memory
> access will raise exceptions and switch between s-mode and m-mode causing
> large overhead.
> 
> First copy in bytes until reaches the first word aligned boundary in
> destination memory address. This is the preparation before the bulk
> aligned word copy.
> 
> The destination address is aligned now, but oftentimes the source address
> is not in an aligned boundary. To reduce the unaligned memory access, it
> reads the data from source in aligned boundaries, which will cause the
> data to have an offset, and then combines the data in the next iteration
> by fixing offset with shifting before writing to destination. The majority
> of the improving copy speed comes from this shift copy.
> 
> In the lucky situation that the both source and destination address are on
> the aligned boundary, perform load and store with register size to copy the
> data. Without the unrolling, it will reduce the speed since the next store
> instruction for the same register using from the load will stall the
> pipeline.
> 
> At last, copying the remainder in one byte at a time.
> 
> Signed-off-by: Akira Tsukamoto <akira.tsukamoto@gmail.com>

This patch causes all riscv32 qemu emulations to stall during boot.
The log suggests that something in kernel/user communication may be wrong.

Bad case:

Starting syslogd: OK
Starting klogd: OK
/etc/init.d/S02sysctl: line 68: syntax error: EOF in backquote substitution
/etc/init.d/S20urandom: line 1: syntax error: unterminated quoted string
Starting network: /bin/sh: syntax error: unterminated quoted string
sed: unmatched '/'
/bin/sh: syntax error: unterminated quoted string
FAIL
/etc/init.d/S55runtest: line 48: syntax error: EOF in backquote substitution

Good case (this patch reverted):

Starting syslogd: OK
Starting klogd: OK
Running sysctl: OK
Saving random seed: [   12.277714] random: dd: uninitialized urandom read (512 bytes read)
OK
Starting network: [   12.949529] e1000: eth0 NIC Link is Up 1000 Mbps Full Duplex, Flow Control: RX
[   12.951170] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
udhcpc: started, v1.33.0
udhcpc: sending discover
udhcpc: sending select for 10.0.2.15
udhcpc: lease of 10.0.2.15 obtained, lease time 86400
deleting routers
adding dns 10.0.2.3
OK
Found console ttyS0

Reverting this patch fixes the problem. Bisect log attached.

Guenter

---
# bad: [50be9417e23af5a8ac860d998e1e3f06b8fd79d7] Merge tag 'io_uring-5.14-2021-07-09' of git://git.kernel.dk/linux-block
# good: [f55966571d5eb2876a11e48e798b4592fa1ffbb7] Merge tag 'drm-next-2021-07-08-1' of git://anongit.freedesktop.org/drm/drm
git bisect start 'HEAD' 'f55966571d5e'
# good: [7a400bf28334fc7734639db3566394e1fc80670c] Merge tag 'for-linus-5.14-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs
git bisect good 7a400bf28334fc7734639db3566394e1fc80670c
# bad: [d8dc121eeab9abfbc510097f8db83e87560f753b] Merge branch 'linus' of git://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6
git bisect bad d8dc121eeab9abfbc510097f8db83e87560f753b
# bad: [7761e36bc7222d1221242c5f195ee0fd40caea40] riscv: Fix PTDUMP output now BPF region moved back to module region
git bisect bad 7761e36bc7222d1221242c5f195ee0fd40caea40
# good: [5def4429aefe65b494816d9ba8ae7f971d522251] riscv: mm: Use better bitmap_zalloc()
git bisect good 5def4429aefe65b494816d9ba8ae7f971d522251
# good: [47513f243b452a5e21180dcf3d6ac1c57e1781a6] riscv: Enable KFENCE for riscv64
git bisect good 47513f243b452a5e21180dcf3d6ac1c57e1781a6
# good: [01112e5e20f5298a81639806cd0a3c587aade467] Merge branch 'riscv-wx-mappings' into for-next
git bisect good 01112e5e20f5298a81639806cd0a3c587aade467
# good: [70eee556b678d1e4cd4ea6742a577b596963fa25] riscv: ptrace: add argn syntax
git bisect good 70eee556b678d1e4cd4ea6742a577b596963fa25
# bad: [ca6eaaa210deec0e41cbfc380bf89cf079203569] riscv: __asm_copy_to-from_user: Optimize unaligned memory access and pipeline stall
git bisect bad ca6eaaa210deec0e41cbfc380bf89cf079203569
# good: [31da94c25aea835ceac00575a9fd206c5a833fed] riscv: add VMAP_STACK overflow detection
git bisect good 31da94c25aea835ceac00575a9fd206c5a833fed
# first bad commit: [ca6eaaa210deec0e41cbfc380bf89cf079203569] riscv: __asm_copy_to-from_user: Optimize unaligned memory access and pipeline stall

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
