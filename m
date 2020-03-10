Return-Path: <SRS0=s16l=43=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41CF9C10F27
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 10 Mar 2020 15:08:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A06D20727
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 10 Mar 2020 15:08:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VADz6Ccy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ojbxj8Lh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A06D20727
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=B2NvWyknmU7bJ18J7QQIrUNg+e9LtN7ECCCGMfh2zd8=; b=VADz6CcyrcinGqU/HUdsShFyz
	tgrIdIYLRFp8Xqsp/WH2BmiUd++1YXWOgffmFogLRyy9J0kt6fnu1CDbRWWYFbj4h9a2IDX+ubaP1
	rI0HOaOphT01QYvCCE/49Grwg+6G9Pi5I0yxd5JNZ5nwWV45dm3q6JqFkpY1KBTb/XIStTzpMmrqb
	jU3TBXNrJbiyhWLLJrHIslceN0hfGC1VhoxJLI4Lk4t1IoQ27EiU0wcjvvsBrED9U1GhQMC4g9rxD
	3KJ5GVvdHSrkduDZB/NweMakkO4mmUgxMDg7hvc4cJ7tCujqusFXpvLFc+jdAn4QCNqt47I5AMQT1
	0mhWsQiXg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBgUf-00048F-II; Tue, 10 Mar 2020 15:08:29 +0000
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBgUb-00047l-MS
 for linux-riscv@lists.infradead.org; Tue, 10 Mar 2020 15:08:28 +0000
Received: by mail-il1-x141.google.com with SMTP id a6so12308516ilc.4
 for <linux-riscv@lists.infradead.org>; Tue, 10 Mar 2020 08:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B2NvWyknmU7bJ18J7QQIrUNg+e9LtN7ECCCGMfh2zd8=;
 b=ojbxj8LhuV2xD99AMnXDjVWc3G/BRB+kxmhXpFOmKZ1DEHirweXCbVm81PI+1DK+dT
 UuABXalBCnjHLzODWyHIeBfselGI++fFm61uaT7yz4iLnz2Sv2fvq6kPKGVtfW0Jbkyc
 99bKZhrqbfN9G+RWpelkfpxbhMPq6hS8bwIeNKYlYqj05Cipp8K8rrWKMAr909j3NDxc
 MLZrHyfSV/mNY/bPUvFpLtDd3L3gSag0WLUaXYEXUF3jiyO+3lt2pWdz4cv2Z55SPe8w
 JaoQ4KcwY070ZOTpsHXv1B/TtFF2+0mReRG8EXyB+14YwzTMgcYRxTP6QsnIoh8ApvsG
 xk2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B2NvWyknmU7bJ18J7QQIrUNg+e9LtN7ECCCGMfh2zd8=;
 b=S/9bQbhZ3sK7Q9mJugWzN1IT2UXnHI0EcZZU/g9M+mNcR9+P+v2C/9wVr+bw5Ho4be
 eFMVMPf786hzmiNyn+ovGmnsHkp3jgPE8Yb8i5bP3TByMVDCc5YSUAq6qgyqKsa+RkZ1
 8swtgMhTIUGSGqpkLSql8rtuWVzOXrkH+y3HyMHXhDqIm0p2I5XgOocwZogGokIWOOhv
 oIT+Qi/wPbQpyo9qKDmGJj5Uj8zbpkw3kFBTbTNCAeVme03ccAjyiYGcmwsHyPxXutTP
 TuGegVm/pVMgZv/BTU8lfeJY+E5YaxVSJwFQxPldehwByuowavWgDzHZ6pXwwYxycXUS
 Npgg==
X-Gm-Message-State: ANhLgQ23fdTep0SbIm07LOK4t3hzvPt9Ymo3i6OKFn8DXsiulUQJmPRr
 nep6+NTjOawyoECH7brZcBLejaG9aE/tPjplc+8=
X-Google-Smtp-Source: ADFU+vsHCK0bP3gjTD0Qzz4Zo93QE9aluR1MjfQAw5XSvxXWYmopq79NduFkeB9scd65MzL052ISeScGLJ3OWn7mTnU=
X-Received: by 2002:a05:6e02:4cd:: with SMTP id
 f13mr21278517ils.237.1583852903818; 
 Tue, 10 Mar 2020 08:08:23 -0700 (PDT)
MIME-Version: 1.0
References: <202003091047.yO0wlUGy%lkp@intel.com>
 <CAKgT0UcHjPqF-djZWYXBg=vqkBfp295QihvPrWn6xq_jY4NNYg@mail.gmail.com>
 <293bcd25-934f-dd57-3314-bbcf00833e51@redhat.com>
 <4932d976-1fff-db01-7e79-bd79ad18d96e@redhat.com>
 <CAAhSdy3EztLWJz8rt1K9xTnfUagn9kHGzD6qB8kneZ4UNQfZ_Q@mail.gmail.com>
 <8373ea85-40d8-972c-fb45-dcfc9142f13b@redhat.com>
In-Reply-To: <8373ea85-40d8-972c-fb45-dcfc9142f13b@redhat.com>
From: Alexander Duyck <alexander.duyck@gmail.com>
Date: Tue, 10 Mar 2020 08:08:12 -0700
Message-ID: <CAKgT0Uco3j_KFKvPKt0GGtfjJQFozqDjnmMYH_9znfKPDoXGVA@mail.gmail.com>
Subject: Re: [linux-next:master 7003/7050] include/linux/virtio_config.h:113:
 undefined reference to `page_reporting_unregister'
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200310_080826_364832_89A452F5 
X-CRM114-Status: GOOD (  20.84  )
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
Cc: Anup Patel <anup.patel@wdc.com>, kbuild test robot <lkp@intel.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmerdabbelt@google.com>,
 Atish Patra <atish.patra@wdc.com>, Alistair Francis <alistair.francis@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Mar 10, 2020 at 5:13 AM David Hildenbrand <david@redhat.com> wrote:
>
> On 10.03.20 13:02, Anup Patel wrote:
> > On Tue, Mar 10, 2020 at 3:56 PM David Hildenbrand <david@redhat.com> wrote:
> >>
> >> On 10.03.20 11:22, David Hildenbrand wrote:
> >>> On 10.03.20 03:19, Alexander Duyck wrote:
> >>>> On Sun, Mar 8, 2020 at 7:54 PM kbuild test robot <lkp@intel.com> wrote:
> >>>>>
> >>>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> >>>>> head:   b86a6a241b7c60ca7a6ca4fb3c0d2aedbbf2c1b6
> >>>>> commit: 120359931943d2b801ce51a1a045dcc0a5d1a55b [7003/7050] Merge branch 'akpm-current/current'
> >>>>> config: riscv-randconfig-a001-20200308 (attached as .config)
> >>>>> compiler: riscv64-linux-gcc (GCC) 7.5.0
> >>>>> reproduce:
> >>>>>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >>>>>         chmod +x ~/bin/make.cross
> >>>>>         git checkout 120359931943d2b801ce51a1a045dcc0a5d1a55b
> >>>>>         # save the attached .config to linux build tree
> >>>>>         GCC_VERSION=7.5.0 make.cross ARCH=riscv
> >>>>>
> >>>>> If you fix the issue, kindly add following tag
> >>>>> Reported-by: kbuild test robot <lkp@intel.com>
> >>>>>
> >>>>> All errors (new ones prefixed by >>):
> >>>>>
> >>>>>    drivers/virtio/virtio_balloon.o: In function `leak_balloon':
> >>>>>    drivers/virtio/virtio_balloon.c:281: undefined reference to `balloon_page_dequeue'
> >>>>>    drivers/virtio/virtio_balloon.o: In function `__virtio_test_bit':
> >>>>>>> include/linux/virtio_config.h:113: undefined reference to `page_reporting_unregister'
> >>>>>    drivers/virtio/virtio_balloon.o: In function `virtio_cread32':
> >>>>>    include/linux/virtio_config.h:423: undefined reference to `balloon_page_alloc'
> >>>>>    drivers/virtio/virtio_balloon.o: In function `fill_balloon':
> >>>>>>> drivers/virtio/virtio_balloon.c:233: undefined reference to `balloon_page_enqueue'
> >>>>>    drivers/virtio/virtio_balloon.o: In function `__virtio_test_bit':
> >>>>>>> include/linux/virtio_config.h:113: undefined reference to `page_reporting_register'
> >>>>>    drivers/gpu/drm/virtio/virtgpu_drv.o: In function `virtio_gpu_remove':
> >>>>>    drivers/gpu/drm/virtio/virtgpu_drv.c:139: undefined reference to `drm_dev_unplug'
> >>>>>    drivers/gpu/drm/virtio/virtgpu_drv.c:140: undefined reference to `drm_atomic_helper_shutdown'
> >>>>>    drivers/gpu/drm/virtio/virtgpu_drv.c:141: undefined reference to `drm_dev_put'
> >>>>>    drivers/gpu/drm/virtio/virtgpu_drv.o: In function `virtio_gpu_probe':
> >>>>
> >>>> It looks like somehow the config has CONFIG_VIRTIO_BALLOON enabled,
> >>>> but didn't select CONFIG_MEMORY_BALLOON nor CONFIG_PAGE_REPORTING That
> >>>> shouldn't be possible since in drivers/virtio/Kconfig we have the
> >>>> following:
> >>>> config VIRTIO_BALLOON
> >>>>         tristate "Virtio balloon driver"
> >>>>         depends on VIRTIO
> >>>>         select MEMORY_BALLOON
> >>>>         select PAGE_REPORTING
> >>>
> >>> IMHO that's perfectly valid. You might want to have ballooning without
> >>> page compaction (MEMORY_BALLOON). Same with PAGE_REPORTING.
> >>>
> >>> AFAIK, "select" will still allow you to disable these things - which
> >>> used to work fine with MEMORY_BALLOON (did that myself when debugging a
> >>> compaction issue).
> >>>
> >>
> >> Correction: I disabled BALLOON_COMPACTION back then ... so ignore my
> >> comment regarding that :)
> >>
> >> But we should be able to build VIRTIO_BALLOON without PAGE_REPORTING
> >> somehow IMHO.
> >
> > I have moved all VIRTIO driver selection to defconfigs for RISC-V which was
> > the case before.
> >
> > Here's the patch:
> > https://patchwork.kernel.org/patch/11429217/
>
> Make perfect sense. Still I think we might want to have the option to
> build without page reporting in the future, similar to building without
> balloon compaction (which is another discussion).

As far as page reporting it would be pretty simple to make it so that
we can build without having it enabled. It would just depend on how we
want to go about it.

My past experience has been that you end up having to create a third
Kconfig option that depends on VIRTIO_BALLOON and selects the other
config item. Then it is just a matter of figuring out if we want to
use the new define as a wrapper in the virtio balloon driver, or if we
want to create stubbed-out versions of page reporting and balloon
compaction.

- Alex

