Return-Path: <SRS0=QIML=M4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B223C04EBD
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 16 Oct 2018 13:12:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E91420866
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 16 Oct 2018 13:12:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n78pK7z1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C1QA2hRz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E91420866
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E/v6SCL9stZ9EjjrVS8fDgx98DT5K7ulVvOdbfWO1vQ=; b=n78pK7z13zPhyk
	EuebRfzQ0UOk0PE4/JwaHPOkNwozP7tf04lnS2qcchTTkk6bhJDrSEEIYJewWOKSB/HAVnH40Kb7N
	NtMgwN2K69t/7PY0h+wbHjSJF2WPB6I308R2q6QLoZg6ROHYH4N1sQAvaL0tYGq8Vi57UKGLrNVHl
	E3IYgseTJSCGOAZDrGrIcR7ZyMNhoMVQQRpyqSIuDGbK+yUwqjXsFDVtYX2kc0SYEGk6u4m3Sl846
	DxMWYg+A16RaM1HXXsM9nZlml6tQoapWbC4sgkSdx7VU5s7qHJJr/b+Lka/WPSw6WPQgYa1hevOG9
	aZtel/q2OjUb7uEGU9Mg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gCP9b-0001XU-Ko; Tue, 16 Oct 2018 13:12:55 +0000
Received: from mail-vs1-xe43.google.com ([2607:f8b0:4864:20::e43])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gCP9G-0001Iy-Ow
 for linux-riscv@lists.infradead.org; Tue, 16 Oct 2018 13:12:47 +0000
Received: by mail-vs1-xe43.google.com with SMTP id i10so18356610vsm.13
 for <linux-riscv@lists.infradead.org>; Tue, 16 Oct 2018 06:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AVB7HvxbMJdCtZORWsAJt55jP3s3mh/sghTsC99Hk6o=;
 b=C1QA2hRzUvvG2+z0/Sr0Ow9kuKS/GhRiaSPA4rPH5FkKucAeEpwXLt57X4wNC9DjLr
 jyzfRrem8X//9AcSdlrEKSHERk5hXSNkBGUMUEDqoZWNy3ezEXaXiHUUAcXL70rr9+/t
 UntQHf4sfdmka4E7eWQn/IEypGEyws21dRVycq2ZkB18EBu9uwQIXU/ZjAPvDa8gyLoN
 +TTREKfAKQ6XQPyWz726vgSGwO0kEvvOJYaaBzqLI+L3Mz2w2KcCe8eZslsxCz58M0FM
 BiwOdBzJDTmkTuJ0q0YuOWuEaDu/xppn5fvTieLFfge6lSD1RYCCCs3XZTLyraqWmYAY
 K9uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AVB7HvxbMJdCtZORWsAJt55jP3s3mh/sghTsC99Hk6o=;
 b=ma5wX60W91Wu0wXRXngXuqXuN+wWN68865hC5t77NSOS5BKKlVyDsq7gx+3xUqC0Ix
 n2MHx+wGFOZTR7YDs3Pl8svLYf6/YqkZTDyh45wU0q4+COsIr6k1A9Yzg8GdMTsggPBU
 YN9Gf4ZEFs411q7NwGBnU9cuQMsbgxdcINUJu4riyqD5ZRS6YX50ndXwiIK0XsjO6Nf1
 ylwJYVZHJQFXW/fdDb6uI0lrm1Th0Y/2fopotC6lHcYgujVrtRQodulCgR31D4uEOdv+
 eO5vdisHGgPoSRJ8l15zNO+EV7SKPWiLsmcGhte+zuKFJEkC7ja2FFtvvKL8ELiqMRwb
 kwOg==
X-Gm-Message-State: ABuFfoj2KKc7hnPp5Ki+e7mIKXT1eu6K5S/gnCgRlu/z21jtnV4ycoAS
 iHj6lSJQU2UOFmN3n5ep0m8nxV+nTT1l5SrK/44=
X-Google-Smtp-Source: ACcGV62dUazcusGGoTfEcc3JccboEgPqqM4nuyXZsGPsEpQXb6WA8hH4mCDkM+0bdIU9+E8bZDURkXor5D3Ycrful8Y=
X-Received: by 2002:a67:38d8:: with SMTP id n85mr8592457vsi.30.1539695542748; 
 Tue, 16 Oct 2018 06:12:22 -0700 (PDT)
MIME-Version: 1.0
References: <20181015211451.GC31130@redhat.com>
 <mhng-2be13863-3f80-432c-9945-2770e7e7e4b4@palmer-si-x1c4>
In-Reply-To: <mhng-2be13863-3f80-432c-9945-2770e7e7e4b4@palmer-si-x1c4>
From: Pintu Kumar <pintu.ping@gmail.com>
Date: Tue, 16 Oct 2018 18:42:11 +0530
Message-ID:
 <CAOuPNLiR+BLUno8sYjwLwW1BqJbBrH-suBiHEx1-dtMO906Ung@mail.gmail.com>
Subject: Re: [sw-dev] Re: [isa-dev] riscv-qemu - linux boot is failing for vda
 device
To: palmer@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181016_061234_878888_3560828D 
X-CRM114-Status: GOOD (  12.47  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, sw-dev@groups.riscv.org, rjones@redhat.com,
 Michael Clark <michaeljclark@mac.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181016131211.4hFRnSUN-OFriclcJkql8Qj3udaGRLS6xUN0zIKsknY@z>

On Tue, Oct 16, 2018 at 6:10 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Mon, 15 Oct 2018 14:14:51 PDT (-0700), rjones@redhat.com wrote:

> >
> >> > virtio_blk: probe of virtio0 failed with error -22
> >
> > ... I saw this exact error when I was using the upstream kernel
> > instead of the one which supported interrupt handling.  Interrupt
> > handling for RISC-V was added upstream after 4.18 so wouldn't be
> > included in upstream 4.18.0-rc6.
>
> Your best bet today is to run 4.19-rc8, which should be pretty stable.

Yes, I checked with mainline linux-kernel 4.19.
Now I am able to boot successfully and login into qemu-riscv shell.
Thank you so much :)

But I am curious to know what changes resulted into this fix, in 4.19 kernel ?
Which is the exact patch in mainline, that fixes this issue?
Because at times during the development, it will be difficult to
simply upgrade the kernel version.
So, I wanted to stick to 4.18 itself, however I can back port the
patches from 4.19 to fix the issue.
So, if you can point me to the exact patch, it will be of great help.

Thanks,
Pintu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
