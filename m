Return-Path: <SRS0=nroh=PD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E9D8C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Oct 2021 08:10:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC48861027
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Oct 2021 08:10:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EC48861027
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gE7zrHEUfwW9UCuOgzxbMo55qyOUvzC7M5+MZjvbt3c=; b=ZSfyn3VyK0fzhZ
	RGYQvGBHX8/8v0KkIzGZVw532XdXfVtkGGZCkpr0JUrh/4g9wbPNOI7KIidUFo3EKTnWMkPvrkGwe
	Yw8jyKpr5YK2KTID2jMQNnVaze3xcaxd1KTmQOm54IoYPNwV5pCKcLFhzj8hWqmEgJ2CK+IVQYbfV
	3Cy2kgc+oONLqN3s9hA5ccoqeEz4ghWSHrrC37wtcFtBig9uidUoOjxmEYuD/0GTwXVksY4SpoDZC
	IzjdSSky0zsMBnvqAoZVQiHgskz8xQpV6Apzr56I9U95rSVG+DfyCOQSEaZ6vtAkFz5jV5z/qLq7g
	NPHWkEPrp1eynxGTs9ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbIIB-005se6-1H; Fri, 15 Oct 2021 08:10:15 +0000
Received: from mout.kundenserver.de ([212.227.17.10])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbIDC-005qvf-Gv
 for linux-riscv@lists.infradead.org; Fri, 15 Oct 2021 08:05:08 +0000
Received: from mail-wr1-f44.google.com ([209.85.221.44]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MSckp-1m8SoN1PT7-00SyWd for <linux-riscv@lists.infradead.org>; Fri, 15
 Oct 2021 10:04:58 +0200
Received: by mail-wr1-f44.google.com with SMTP id v17so24926091wrv.9
 for <linux-riscv@lists.infradead.org>; Fri, 15 Oct 2021 01:04:57 -0700 (PDT)
X-Gm-Message-State: AOAM5328LOKZP23s8zCCZPVfeC4+/IdFbP8ADhpGblBjMqrLCI4Fb1vC
 PeZNnESeXDHMqEKdAnASGpu15K96HsV8SaXftN0=
X-Google-Smtp-Source: ABdhPJyMHuHnDGl2si8ITF+4TGXXgV0nuTwHzfeF7WqCGbb9eY4i99zzKLMdO9DWc/nq3na7Ws9y9ewKPsg0Jk/Kqqs=
X-Received: by 2002:adf:f481:: with SMTP id l1mr12016275wro.411.1634285097750; 
 Fri, 15 Oct 2021 01:04:57 -0700 (PDT)
MIME-Version: 1.0
References: <20211015005634.2658470-1-alistair.francis@opensource.wdc.com>
In-Reply-To: <20211015005634.2658470-1-alistair.francis@opensource.wdc.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 15 Oct 2021 10:04:41 +0200
X-Gmail-Original-Message-ID: <CAK8P3a28zpO5Sy78CHts=p4G5v0bhxeCJhUK41bMQ8nqYV8z_A@mail.gmail.com>
Message-ID: <CAK8P3a28zpO5Sy78CHts=p4G5v0bhxeCJhUK41bMQ8nqYV8z_A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] perf bench futex: Use a 64-bit time_t
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 linux-perf-users@vger.kernel.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Alistair Francis <alistair23@gmail.com>, 
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@redhat.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Mark Rutland <mark.rutland@arm.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>,
 Darren Hart <dvhart@infradead.org>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Atish Patra <atish.patra@wdc.com>,
 Arnd Bergmann <arnd@arndb.de>, Alistair Francis <alistair.francis@wdc.com>
X-Provags-ID: V03:K1:kRr1kg6nVk3cJ8a4tRi4L+CsS5j0P5saducmLoFMDrvRUrGhYJ2
 NeBd03yj+uONRq6QQkixFnrLdVW2E918KdILUkb5QNhgSmrW8lZWVq/TEl9aFOMUO9vUn53
 YipU907VxNDzDfdxGK/YCEW7zfNV7cM7eAP7Fu/wKs4zm/+coCJKxj563NJcPqYrnZmZcAK
 cx/v1w7dwZ2rpeXXO0PVg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:bitLanFvvZ8=:VurQPOiot4A1uhGugC8EKc
 6Yhccj4PGyt/ilI6N9QZt6NphMLfL2Ei7tQJeDx6flX+f6wHewakyTkUWKba8vlD6kQP2Z8ho
 vMUWv5mZ4aqGaniCtcIYV9qXpof52I0HmnQI7qUU1ColPU+5Euy1e9deJxzB1YpZDGFSqDP5w
 Wk45x2GOQMHtuizT/QxinxKVSTu4SJijmHkXGUTFOIpN0xb/ZBmbqrRwnIBVi68lCTESioCaH
 99twCjDSb6wOt+YjiW5ArumtfS+ggWvdVsgb0n8Jflg4W+R0RGPM0fr7Oz1kyUzyhQ133/v4m
 TEqAvcu25GrUYitSikwKj4ccNZQa9BwM+iGAK7FE0QtyfNPMNSos3uSiveifPJJEDoU+slq8M
 E+ourYVUe4D2LgPInMm+wKHUrG/loBe53z3+Cnd54+R0mFfE0rCoXCRhwG3VQf8uujV2D1UpM
 5vRZzezprsjhNrA+RpbgXPCrIMV9IZH0E6wJTEg1w+XjhO9AvTlVv5P8fqCfAwsJ38YZ2dtpP
 nsxN14VRuYBN2vP6KF87YCE+hVjJgnMNcWgWrQTT7av33dv+ZVsi9OIpCWEsTAldGuJDASGyE
 d/od6Vxlxf4fFfojVLy7F6fT78MqXh3fkE9GBDDpAV3mJO0DwpQiXyTYKOnDGcCF6DOvBEso1
 4ktPohfaECw1XaHou+iOcHcobR+heGeGBbRoYrBZpk55QdVzdoth8YBKON4oU2mfRHaoTscYD
 /CsflTAFq/jzxKLFDenvDm3XHTsfB6s1/uo9yA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_010506_901083_6B27D969 
X-CRM114-Status: GOOD (  13.98  )
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

On Fri, Oct 15, 2021 at 2:56 AM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> Convert tools/perf to only use a 64-bit time_t. On 64-bit architectures
> this isn't a functional change. On 32-bit architectures we now only
> perform 64-bit time_t syscalls (__NR_futex_time64) and use a struct
> timespec64.
>
> This won't work on kernels before 5.1, but as perf is tied to the kernel
> that's ok.
>
> This allows us to build perf for 32-bit architectures with 64-bit time_t
> like RISC-V 32-bit.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
