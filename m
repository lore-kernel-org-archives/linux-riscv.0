Return-Path: <SRS0=WnC5=F2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68DD3C433DB
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Dec 2020 09:34:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A087F23103
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Dec 2020 09:34:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A087F23103
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dfqd2NiyK+D7jyZVan8/+wOopERFfYQzK7WOnRGfA6k=; b=zFgIiwh1MSjSmm7Qj3jP58riF
	LfGD1jF/6ngeW1mIKRm+6to9EyeWYRaimGQe+vgcygOhkCKCGlF4XY7VICuqp9EAdG/VQ5ohzUCPk
	AtWYa5hwlz604zu5JS6ktGAIJXrTQW3KtKMKtYFNZiWnY9V7MOoPTRgPGjdl/Jb7EKV3ObRxfZzQ4
	TZfkKVRy8vy73d0fTaxKby1i0POZdtRtnXTqIFHv/uf+WVQS0o4yweJM3FTkTiJIk3zSeY5LysHQM
	VTHibsg1OuEiz/VJUaFSA+Tp5PUb8CVzCW+pCBjGwfktFvSF1B2Ivb67sJVaY+d3Bei7/TCexVT+l
	lvn4qZdmQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kre43-0000xm-NH; Tue, 22 Dec 2020 09:34:43 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([207.82.80.151])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kre41-0000xC-A4
 for linux-riscv@lists.infradead.org; Tue, 22 Dec 2020 09:34:42 +0000
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-196-qd9Zl8UVMnGI_v8OB6DO1A-1; Tue, 22 Dec 2020 09:34:36 +0000
X-MC-Unique: qd9Zl8UVMnGI_v8OB6DO1A-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Tue, 22 Dec 2020 09:34:35 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Tue, 22 Dec 2020 09:34:35 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Palmer Dabbelt' <palmer@dabbelt.com>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>
Subject: RE: [PATCH] clocksource: clint: Avoid remove __iomem in
 get_cycles_hi()
Thread-Topic: [PATCH] clocksource: clint: Avoid remove __iomem in
 get_cycles_hi()
Thread-Index: AQHW2CRMsP4vu/w5w0ydjz0Xpj6lf6oC2pkg
Date: Tue, 22 Dec 2020 09:34:35 +0000
Message-ID: <ccc783075aac4ee2b0b43c4644cc992f@AcuMS.aculab.com>
References: <20201222053230.3229427-1-palmer@dabbelt.com>
In-Reply-To: <20201222053230.3229427-1-palmer@dabbelt.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201222_043441_519046_6C363A0E 
X-CRM114-Status: GOOD (  13.34  )
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
Cc: "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, kernel
 test robot <lkp@intel.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "kernel-team@android.com" <kernel-team@android.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Palmer Dabbelt
> Sent: 22 December 2020 05:33
> 
> From: Palmer Dabbelt <palmerdabbelt@google.com>
> 
> This cast loses the __iomem qualifier from clint_timer_val, which
> triggers an sparse warning.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
> ---
>  drivers/clocksource/timer-clint.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clocksource/timer-clint.c b/drivers/clocksource/timer-clint.c
> index 6cfe2ab73eb0..83a8b38d46f6 100644
> --- a/drivers/clocksource/timer-clint.c
> +++ b/drivers/clocksource/timer-clint.c
> @@ -63,7 +63,7 @@ static struct riscv_ipi_ops clint_ipi_ops = {
>  #define clint_get_cycles()	readq_relaxed(clint_timer_val)
>  #else
>  #define clint_get_cycles()	readl_relaxed(clint_timer_val)
> -#define clint_get_cycles_hi()	readl_relaxed(((u32 *)clint_timer_val) + 1)
> +#define clint_get_cycles_hi()	readl_relaxed(((u32 __iomem *)clint_timer_val) + 1)
>  #endif

The correct fix is (probably) to define clint_timer_val as u32 on 32bit systems.

Oh - and get rid of those #defines, they are only used in the
functions just below them.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
