Return-Path: <SRS0=s16l=43=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9D1BC10F27
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 10 Mar 2020 12:02:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A2C72464B
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 10 Mar 2020 12:02:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C3bHSg6R";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="ci5wG0y+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A2C72464B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=555c87GbFFs7Gl2Fto1Hhng076kIPZ49lUxFSE0iXmM=; b=C3bHSg6RoZ5bQ12UoBDF1R8RT
	11zslvD53UXZL+Zedxoavi9Eza4oAKnsrd8ehCKy1dmelaUv5WLF7xjSUokzUIPCrJVQB70fgRPZr
	l1Ph8Wo8H7UmirwiG+uCCkxIefvMWr1AWYGjwJektfeaxEOATp2M15jb7lefBNy10OzERwsfi+T0O
	JWaVTQ2vxi7urKdZJfOjwy6P1BMqDm3zOcQo2DRadBAeP8SBLSvXt/oJPiD5NQEtnDUJqvygo4waW
	Qcz0W6yNBvN2nbJLaoOJ5WmcThONbTlS5jPzcbr5Gg9n9F7/IjEhxmXadr9x7tH484oKbCzGfkzYn
	0QFyqP9sQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBdb5-0008Hd-Vc; Tue, 10 Mar 2020 12:02:55 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBdai-0007uX-DH
 for linux-riscv@lists.infradead.org; Tue, 10 Mar 2020 12:02:34 +0000
Received: by mail-wm1-x341.google.com with SMTP id x3so612071wmj.1
 for <linux-riscv@lists.infradead.org>; Tue, 10 Mar 2020 05:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=555c87GbFFs7Gl2Fto1Hhng076kIPZ49lUxFSE0iXmM=;
 b=ci5wG0y+4oqXRODzPPpGIFH2pT+6MWN0PHLmCiFnCSW9G3JU1/qLV25yOCSU3k/k1u
 WHU8xoVTdZiuDk5Tvwtl26no3yQUMgO++mHX5Nbie8l7Qp60FFqGOGaSt6DQk8Nieb31
 Amx9l1NTcb+JjpgBmLqitmQ2wJeXtig6dMcPmQeBbvQbv+KXsbGl6r8ijYF98Xoz0DGQ
 brph+I7TOwAeA1awklCaWyM3q6A7dAq7N/Mo7EpuqhiEA/qRYqathKprBDOyjdw+h7Um
 kRv4ftFDSU22qNbPLZAwvYb9DQIQZUMknnu5GH9fMFAjdwE5n6OZUAKwdde6wKN1D9dG
 R3SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=555c87GbFFs7Gl2Fto1Hhng076kIPZ49lUxFSE0iXmM=;
 b=t7VtMLxtONYXZ1YossQOM9/aZIA/zyeVNSRQA7rs0CXo77hPBAGtFm9iTxWQUU9vEb
 4ATSvxk2hV12dUCEee6FzdM4oFiXsdsIMQsc2Pl0CTd3j02h0R4R9q9zfsxNPCbL1g2L
 PmD8I0/dgbAqieERm72iE6j+zL/czuUWSGnG90GF9Gog4hx+8SViRN2EXQ/WuDpOTVX/
 rwabpTCjZKonXKEqO822a6jLFc7WWNBqwB0dW5oLmnwgcOK36KeyOZ4CzHg0mhsTPb26
 vXT9gd4ayfmzShz65Aje23GfaU/u92tTwgQcbeb3/eDPz/WJ5stzw9zj2d2iyoShkwBZ
 5r6g==
X-Gm-Message-State: ANhLgQ3spllnRfvSzP6vhjxqn6uNg8NIlCZ/aq1KsUKvjwU3Pnq6bY71
 RfvWCAqF+hB4k/INQLQIPt+G5TymDEtF2z45a5Uvdw==
X-Google-Smtp-Source: ADFU+vt5U5LtaY11bQMRekHPPWA1Q6hNAvxUP0NCWiWz/zBO4YoLvoS1nbkQQdo2K9xqg+MY5cvff2TX4lPoagDnx60=
X-Received: by 2002:a1c:5452:: with SMTP id p18mr1939389wmi.102.1583841750852; 
 Tue, 10 Mar 2020 05:02:30 -0700 (PDT)
MIME-Version: 1.0
References: <202003091047.yO0wlUGy%lkp@intel.com>
 <CAKgT0UcHjPqF-djZWYXBg=vqkBfp295QihvPrWn6xq_jY4NNYg@mail.gmail.com>
 <293bcd25-934f-dd57-3314-bbcf00833e51@redhat.com>
 <4932d976-1fff-db01-7e79-bd79ad18d96e@redhat.com>
In-Reply-To: <4932d976-1fff-db01-7e79-bd79ad18d96e@redhat.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 10 Mar 2020 17:32:18 +0530
Message-ID: <CAAhSdy3EztLWJz8rt1K9xTnfUagn9kHGzD6qB8kneZ4UNQfZ_Q@mail.gmail.com>
Subject: Re: [linux-next:master 7003/7050] include/linux/virtio_config.h:113:
 undefined reference to `page_reporting_unregister'
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200310_050232_502275_3B4BA254 
X-CRM114-Status: GOOD (  16.42  )
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
 "Michael S. Tsirkin" <mst@redhat.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Alexander Duyck <alexander.duyck@gmail.com>, Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Mar 10, 2020 at 3:56 PM David Hildenbrand <david@redhat.com> wrote:
>
> On 10.03.20 11:22, David Hildenbrand wrote:
> > On 10.03.20 03:19, Alexander Duyck wrote:
> >> On Sun, Mar 8, 2020 at 7:54 PM kbuild test robot <lkp@intel.com> wrote:
> >>>
> >>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> >>> head:   b86a6a241b7c60ca7a6ca4fb3c0d2aedbbf2c1b6
> >>> commit: 120359931943d2b801ce51a1a045dcc0a5d1a55b [7003/7050] Merge branch 'akpm-current/current'
> >>> config: riscv-randconfig-a001-20200308 (attached as .config)
> >>> compiler: riscv64-linux-gcc (GCC) 7.5.0
> >>> reproduce:
> >>>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >>>         chmod +x ~/bin/make.cross
> >>>         git checkout 120359931943d2b801ce51a1a045dcc0a5d1a55b
> >>>         # save the attached .config to linux build tree
> >>>         GCC_VERSION=7.5.0 make.cross ARCH=riscv
> >>>
> >>> If you fix the issue, kindly add following tag
> >>> Reported-by: kbuild test robot <lkp@intel.com>
> >>>
> >>> All errors (new ones prefixed by >>):
> >>>
> >>>    drivers/virtio/virtio_balloon.o: In function `leak_balloon':
> >>>    drivers/virtio/virtio_balloon.c:281: undefined reference to `balloon_page_dequeue'
> >>>    drivers/virtio/virtio_balloon.o: In function `__virtio_test_bit':
> >>>>> include/linux/virtio_config.h:113: undefined reference to `page_reporting_unregister'
> >>>    drivers/virtio/virtio_balloon.o: In function `virtio_cread32':
> >>>    include/linux/virtio_config.h:423: undefined reference to `balloon_page_alloc'
> >>>    drivers/virtio/virtio_balloon.o: In function `fill_balloon':
> >>>>> drivers/virtio/virtio_balloon.c:233: undefined reference to `balloon_page_enqueue'
> >>>    drivers/virtio/virtio_balloon.o: In function `__virtio_test_bit':
> >>>>> include/linux/virtio_config.h:113: undefined reference to `page_reporting_register'
> >>>    drivers/gpu/drm/virtio/virtgpu_drv.o: In function `virtio_gpu_remove':
> >>>    drivers/gpu/drm/virtio/virtgpu_drv.c:139: undefined reference to `drm_dev_unplug'
> >>>    drivers/gpu/drm/virtio/virtgpu_drv.c:140: undefined reference to `drm_atomic_helper_shutdown'
> >>>    drivers/gpu/drm/virtio/virtgpu_drv.c:141: undefined reference to `drm_dev_put'
> >>>    drivers/gpu/drm/virtio/virtgpu_drv.o: In function `virtio_gpu_probe':
> >>
> >> It looks like somehow the config has CONFIG_VIRTIO_BALLOON enabled,
> >> but didn't select CONFIG_MEMORY_BALLOON nor CONFIG_PAGE_REPORTING That
> >> shouldn't be possible since in drivers/virtio/Kconfig we have the
> >> following:
> >> config VIRTIO_BALLOON
> >>         tristate "Virtio balloon driver"
> >>         depends on VIRTIO
> >>         select MEMORY_BALLOON
> >>         select PAGE_REPORTING
> >
> > IMHO that's perfectly valid. You might want to have ballooning without
> > page compaction (MEMORY_BALLOON). Same with PAGE_REPORTING.
> >
> > AFAIK, "select" will still allow you to disable these things - which
> > used to work fine with MEMORY_BALLOON (did that myself when debugging a
> > compaction issue).
> >
>
> Correction: I disabled BALLOON_COMPACTION back then ... so ignore my
> comment regarding that :)
>
> But we should be able to build VIRTIO_BALLOON without PAGE_REPORTING
> somehow IMHO.

I have moved all VIRTIO driver selection to defconfigs for RISC-V which was
the case before.

Here's the patch:
https://patchwork.kernel.org/patch/11429217/

Thanks,
Anup

