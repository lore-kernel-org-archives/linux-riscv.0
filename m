Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1236C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Dec 2021 14:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QzrDSJB7Uco09dtwa/OciVGaZYSoiUS1ECg980UuYAI=; b=WmiNHsbbYe0zMp
	7vnMBimN4tlL1xs1T0wRa+JY+e9QdTFuIKuTqfv8qkThwy2gVmjrYTwr1nht8kCysw560VSn3GLOX
	Qq5I5KdwU7ee06Dohtvtw7GJQIw5RZ/jrtYiOSY8VwvCgh3NSooUmqBqUQ0hTthUt9WZqNfAZBr+b
	zwURVUT1qRFV/Af7qy3nSYMkQ8J25dLFj5H2JLr1+A1/MgtdjZ95sSN7tvPYUbACSl/p0T+Su646n
	s6HhKE9ztZBpVPxWLw83z3ToPTYKZ2BLDso5gIGeACriVBeDM0ToeZ3p4JP4ccPNrSCRzVQU4pOkm
	Edut0MW2NNa+FUhrvqFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvgog-002CGd-7V; Fri, 10 Dec 2021 14:24:06 +0000
Received: from mout.kundenserver.de ([212.227.17.24])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvgod-002CEh-B8
 for linux-riscv@lists.infradead.org; Fri, 10 Dec 2021 14:24:04 +0000
Received: from mail-wr1-f51.google.com ([209.85.221.51]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MEFCF-1mngaZ388j-00AEVU for <linux-riscv@lists.infradead.org>; Fri, 10
 Dec 2021 15:23:58 +0100
Received: by mail-wr1-f51.google.com with SMTP id j3so15258483wrp.1
 for <linux-riscv@lists.infradead.org>; Fri, 10 Dec 2021 06:23:58 -0800 (PST)
X-Gm-Message-State: AOAM531hZbHAd2Iq0J9qkM5/BfcIrKTuF03tuavN5Rur6v5yS5O0T+dw
 ZOuMVswEZd4I9/ijJPpbqiK+9yHCtilrDKFqTgM=
X-Google-Smtp-Source: ABdhPJwpNfkCK35q4J84bet4qsNK0G78Iv/Ey+WuTXxUs4+UKKI6lcSJU/n3x5OpVFEpmYRVEt/ijnGMwe5NdNQgfZA=
X-Received: by 2002:a5d:4107:: with SMTP id l7mr14337051wrp.209.1639146238200; 
 Fri, 10 Dec 2021 06:23:58 -0800 (PST)
MIME-Version: 1.0
References: <20211209235857.423773-1-alistair.francis@opensource.wdc.com>
 <YbNX3mRT0A9/N2il@kernel.org> <YbNZw1/cUXJ8up5b@kernel.org>
In-Reply-To: <YbNZw1/cUXJ8up5b@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 10 Dec 2021 15:23:42 +0100
X-Gmail-Original-Message-ID: <CAK8P3a05D=fb9stZEL6rUMs7c=S6gJxN5gR7HG_i8RiXAbaB5Q@mail.gmail.com>
Message-ID: <CAK8P3a05D=fb9stZEL6rUMs7c=S6gJxN5gR7HG_i8RiXAbaB5Q@mail.gmail.com>
Subject: Re: [PATCH v5 1/6] perf bench futex: Add support for 32-bit systems
 with 64-bit time_t
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Alistair Francis <alistair.francis@opensource.wdc.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Davidlohr Bueso <dave@stgolabs.net>, 
 Darren Hart <dvhart@infradead.org>, Arnd Bergmann <arnd@arndb.de>, 
 Alistair Francis <alistair23@gmail.com>, Namhyung Kim <namhyung@kernel.org>,
 Jiri Olsa <jolsa@redhat.com>, linux-perf-users@vger.kernel.org, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Mark Rutland <mark.rutland@arm.com>, 
 Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Thomas Gleixner <tglx@linutronix.de>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Atish Patra <atish.patra@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Arnaldo Carvalho de Melo <acme@redhat.com>
X-Provags-ID: V03:K1:755j5mpAom0XqO6NuZZZeuBd7IHZg8RVOVfGMVhRt9a06PHqtyR
 bHtyoGBinb2eCPsQiNsSqP6+z2ZtTG5O+S8i7MnMPFiiqkDPigGyyvazylWaqrbKU4ukc7H
 V1q9IiyI5SraCd4QXnZlpxEgkOEEQTi6xWXBkmh2EZaA8V92pDnLjzrKWXsckc2gDpgJxld
 fA0kER0woWPxvem/PfIuQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+G5okZqV2fc=:dMeOGZ0tQGhs9D0NdJWbjX
 A0J8xWp2IxnIVcps1144qukJxZyXqiIj0OUzeNSergyAK9+RDQJBf8e6P0Rz0X/WzZiZz7iiB
 8uRIgcZozphof+vnofzUzFWiV4qzdMIe9KPDWloksHh/haN74c2dOej1jvreaGehpuRpJvoYt
 /xjWUmHHFYLMEXWNdHtd+hsMQ2VzfK0PeKjp5MI1RF9wKlvoh5Fi7nSLb02Rbtxw0t+XXbOnF
 jwpn928CJuQvbv3oxgWK+rk63TJvDV4y5+BmzCDtFSldiceccyWiqK0sbQqkuxzWZQjhGrZnH
 ACZ8mc+rw/kmQCodFJ+43+heSeyqSNe0IvF4hhhfuqsq2KBo7wRStnQknJpvzCE8oK3DR4OuK
 gWTrbJdHYOrIwqQqeWPfDGhHiovrfVIw8j1YNExxyrr5+GHabOssu00G629yENBVd8ctVLjeA
 32qgMPKzlTUgBIleQqDKSqzwTQjuYmAle+k0fuOvpT2SZ46vP6ILopTuZDIOLPNdRxo0Ht2q0
 jzIoHMWdbVvKJ5S8mtzuHYPuSSvxcNFXpIJU/9CQ6sjZDNZxRCvMiZHaBR7Xg9uLzdKFBrer0
 gm37JIfM12pqlEO4NkQRqQn0XMx9/pV7IVL4B8fwoRtorthx5hMkrY8jgUOiDyHvCS6a9wmyV
 IxvlqawNcDE2ZU46yuA/WzhS6QudSUOviG/3c+0Dqfd1e553eg+pWfZOgu9r641A6XUGEN4CK
 lReFMdUPM+6fbNz+m5goj3TNj+olN/Tk+oT1uS495cwRzg9g8NhCQ/goYxU+dCWuP/+5j7pGz
 lV2W2bEnnz2oPyis6yqu+yp9C44yJoGenUjlqNBNxHewcTLaAg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_062403_736677_6D065A0F 
X-CRM114-Status: GOOD (  20.67  )
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

On Fri, Dec 10, 2021 at 2:44 PM Arnaldo Carvalho de Melo
<acme@kernel.org> wrote:
> Em Fri, Dec 10, 2021 at 10:36:30AM -0300, Arnaldo Carvalho de Melo escreveu:
> > Em Fri, Dec 10, 2021 at 09:58:52AM +1000, Alistair Francis escreveu:
> > > From: Alistair Francis <alistair.francis@wdc.com>
> > >
> > > Some 32-bit architectures (such are 32-bit RISC-V) only have a 64-bit
> > > time_t and as such don't have the SYS_futex syscall. This patch will
> > > allow us to use the SYS_futex_time64 syscall on those platforms.
> > >
> > > This also converts the futex calls to be y2038 safe (when built for a
> > > 5.1+ kernel).
> > >
> > > This is a revert of commit ba4026b09d83acf56c040b6933eac7916c27e728
> > > "Revert "perf bench futex: Add support for 32-bit systems with 64-bit time_t"".
> > >
> > > The original commit was reverted as including linux/time_types.h would
> > > fail to compile on older kernels. This commit doesn't include
> > > linux/time_types.h to avoid this issue.
> >
> >   10     9.99 alpine:3.12                   : FAIL gcc version 9.3.0 (Alpine 9.3.0)
> >     In file included from bench/futex-hash.c:29:
> >     bench/futex.h:37:2: error: unknown type name '__kernel_old_time_t'
> >        37 |  __kernel_old_time_t tv_sec;  /* seconds */
> >           |  ^~~~~~~~~~~~~~~~~~~
> >     In file included from bench/futex-wake.c:25:

It looks like we need to add include/uapi/linux/time_types.h to
tools/include/linux/ and update tools/include/linux/types.h
in order to address this.

         Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
