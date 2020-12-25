Return-Path: <SRS0=TATJ=F5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF12AC433DB
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Dec 2020 16:59:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DA6D22285
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Dec 2020 16:59:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1DA6D22285
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+sENqc0JmBd3ZUUJV6zme3ECO2/1TPIEwyPlz4hSNCQ=; b=qW//4kN3AzSYos/c6CbPAWnEx
	tR7h2iumd9+p7a4v5ZSkPiBbJtrSciXT+Fzy+pRErM39Qz7BbRkP3F8JSjVYO2F2DvRndzmR2JHjy
	nvFkmlOLMI9YwJh16nr+054nOXtRIazslMLNfKwvh3I7G1QYHUo72D+V8VCRDQ51z2e/kVWBe5a+F
	/LcyKYyynnnkbsTkVNUxuWMYhH+GZA8o1Z0f3CCHG/EkHKlYKAHmt89uvLlJi7WYeHOi5YnEnO9T9
	t2+qYQFdkZnAcRvPze7U2oVHNRQp7/zYn9hLMgoxZm6uQPAL+xaKeRNocXJlVUI5MVmOc8akiWH/1
	4CyjvminA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ksqQM-0003R6-QH; Fri, 25 Dec 2020 16:58:42 +0000
Received: from mail-out.m-online.net ([212.18.0.10])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ksqQJ-0003Qo-CA
 for linux-riscv@lists.infradead.org; Fri, 25 Dec 2020 16:58:41 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4D2Y6s5NZdz1rtMh;
 Fri, 25 Dec 2020 17:58:29 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4D2Y6r6lB6z1qr3y;
 Fri, 25 Dec 2020 17:58:28 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id tmq1xZlJy0Sy; Fri, 25 Dec 2020 17:58:27 +0100 (CET)
X-Auth-Info: +mM6lJfV9Zm65W4CzQ9iQdJ3u18++WndNbaqbvDXm5JhNdQgE7AiMtr1JiOt+AHe
Received: from igel.home (ppp-46-244-182-139.dynamic.mnet-online.de
 [46.244.182.139])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Fri, 25 Dec 2020 17:58:27 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
 id 2BBAB2C3600; Fri, 25 Dec 2020 17:58:27 +0100 (CET)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Dmitry Vyukov <dvyukov@google.com>
Subject: Re: riscv+KASAN does not boot
References: <CACT4Y+bpkSYTL_UwNoKVd0PDFF_xrNN6=y_S_v8W3YRaAcMm2g@mail.gmail.com>
X-Yow: I have no actual hairline...
Date: Fri, 25 Dec 2020 17:58:27 +0100
In-Reply-To: <CACT4Y+bpkSYTL_UwNoKVd0PDFF_xrNN6=y_S_v8W3YRaAcMm2g@mail.gmail.com>
 (Dmitry Vyukov's message of "Fri, 25 Dec 2020 15:55:48 +0100")
Message-ID: <878s9lbz64.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1.90 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201225_115839_536506_677F1322 
X-CRM114-Status: UNSURE (   8.19  )
X-CRM114-Notice: Please train this message.
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
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, LKML <linux-kernel@vger.kernel.org>,
 nylon7@andestech.com, syzkaller <syzkaller@googlegroups.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Tobias Klauser <tklauser@distanz.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Dez 25 2020, Dmitry Vyukov wrote:

> qemu-system-riscv64 \
> -machine virt -bios default -smp 1 -m 2G \
> -device virtio-blk-device,drive=hd0 \
> -drive file=buildroot-riscv64.ext4,if=none,format=raw,id=hd0 \
> -kernel arch/riscv/boot/Image \
> -nographic \
> -device virtio-rng-device,rng=rng0 -object
> rng-random,filename=/dev/urandom,id=rng0 \
> -netdev user,id=net0,host=10.0.2.10,hostfwd=tcp::10022-:22 -device
> virtio-net-device,netdev=net0 \
> -append "root=/dev/vda earlyprintk=serial console=ttyS0 oops=panic
> panic_on_warn=1 panic=86400"

Do you get more output with earlycon=sbi?

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
