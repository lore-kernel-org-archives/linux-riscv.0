Return-Path: <SRS0=q1JI=AW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62F0AC433E5
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Jul 2020 03:59:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31EF82078B
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Jul 2020 03:59:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l+EmtC9S";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="OrluohHP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31EF82078B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=JQx+6B2TaT+WxPUQyhBA7ScIis3bin0aQuI2NsbynlA=; b=l+EmtC9SWe/E1U7r6QN0jWH5e
	s9+xA1LbQ7m3Cv0fQdhxVLUaoxMM/ZFHllnXX1rORo1qS86E6WjlB9aOO76bwGQSA6iFnhOZ3o4nH
	jSV9y2qsv+KK3rhrb3lYLorIf8LXUzwmkzauCswnUjGpTAiTeXmlJA621IpSKngM3O6UDmRvLQc6H
	Ir/rvy4JYPWUKufNwDFgxzm1odxXjwfCx149Sllecn/M8RspK5OTyrnECr+m1HRGep8Th2mdD5wEP
	4TeI6Px2n9lGtf1v3kZMthWMxeD2Kk5nNzlEylZeMoPkDTReYc0fy4w3DS8hbpQXIIGp8WVo39Rvx
	1eNgXYA+g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ju6fr-0001bm-ID; Sat, 11 Jul 2020 03:59:39 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ju6ff-0001Yn-NC
 for linux-riscv@lists.infradead.org; Sat, 11 Jul 2020 03:59:34 +0000
Received: by mail-pj1-x1042.google.com with SMTP id b92so3432679pjc.4
 for <linux-riscv@lists.infradead.org>; Fri, 10 Jul 2020 20:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=rdT4vXSTQfzWHOiEPdVAu5WvfY6lvuvY4RWTa8cElIQ=;
 b=OrluohHP6TXTUELl9MAzHignFMB7ZEZZSEy9B8+v3eLkczj61fDlD831AwR3RqR2pk
 W7sgDv7hVCx1t9IpQy+BlFmQzF7P8seUrbyz+73B8K0t0UAkjhmK59pbPHn8Cc61XDNo
 toRqwAROs2Zg2WO4dhVtowU+K3Zji0bpLVXSdpPKM7lDIZemFU2annqS+udUZfdq0WAD
 70/IfUvjiGYoEkF14Qp4cbL3vvv+YJkNsvipd7EpKEcyx7ShlVR4mMRBmo01qOOwT9YP
 mH9Sf64AVAyGyXULaUX+wtzivADkDI2G1e8ezB/dCmgp8/fqZWV1O5+13auYyDXAIaF4
 3DPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=rdT4vXSTQfzWHOiEPdVAu5WvfY6lvuvY4RWTa8cElIQ=;
 b=SdPmeWblXJ0l9mJV1BT7/Hm18al7ZX3URRcNbgfHAHXQSGDHOobTqWVcaXk1S1wZ3Y
 O6UQjtuy2MgeSO56H9oX/uszIL1TduuRWMgBDkJlDJz3aNMkDiLQQh/Ndu9FpUh/CnYo
 NxlhNTnMhy4c2nWDc63HDAb6BWIeiCbWONHmx+395ZwIK59uz0rpmVdOyf6p4L1PCvAj
 jJj5xRrTluqO9FwEQ3GRjKDndJ8AMy9ew6iiKFvTkPslZupM0KC3OBxmte5rqYNAI37u
 dMPIgSTpoCMye17luJhf+T3NXu0dG1WQI1WzXiRs5OaL5GQs6ArMAfnzVuTS8aEOG6IH
 rS0g==
X-Gm-Message-State: AOAM530jwJajAymqjU2VXd9hq3wuTWbA7QhKI0jh9IlGWV3D2oepT+Bj
 WB9UQDA7bSrQY5YzGlK3IfdOIvQ1h9Y=
X-Google-Smtp-Source: ABdhPJxbomUXGRx/cgtmkdpo6CZZ2zrU1N/v+dckow89Rpjab4brkvOaCUgVsTR8+9G3Fnm+rQLLXw==
X-Received: by 2002:a17:90b:1292:: with SMTP id
 fw18mr8851296pjb.3.1594439965640; 
 Fri, 10 Jul 2020 20:59:25 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id p19sm7082246pgj.74.2020.07.10.20.59.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 20:59:25 -0700 (PDT)
Date: Fri, 10 Jul 2020 20:59:25 -0700 (PDT)
X-Google-Original-Date: Fri, 10 Jul 2020 20:58:55 PDT (-0700)
Subject: Re: BPATCH=20v2=200/3=5D=20RISC-V=3A=20Add=20kexec/kdump=20support=E2=80=8B?=
In-Reply-To: <20200623150512.896499-1-mick@ics.forth.gr>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: mick@ics.forth.gr
Message-ID: <mhng-fc462e0b-31c6-4588-8801-41458430fffa@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200710_235927_856921_9A1B9FD6 
X-CRM114-Status: GOOD (  17.06  )
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
Cc: david.abdurachmanov@sifive.com, anup@brainfault.org,
 Atish Patra <Atish.Patra@wdc.com>, yibin_liu@c-sky.com, zong.li@sifive.com,
 Paul Walmsley <paul.walmsley@sifive.com>, mick@ics.forth.gr,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 23 Jun 2020 08:05:09 PDT (-0700), mick@ics.forth.gr wrote:
> This patch series adds kexec/kdump and crash kernel
> support on RISC-V. For testing the patches a patched
> version of kexec-tools is needed. The patch is still
> a work in progress but a draft version can be found at:
>
> http://riscv.ics.forth.gr/kexec-tools.patch
>
> v2:
>  * Re-base on newer kernel tree and minor cleanups
>  * Properly populate the ioresources tree, so that it can be
>    used later on for implementing strict /dev/mem.
>  * Use linux,usable-memory on /memory instead of a new binding
>  * Use a reserved-memory node for ELF core header
>
> Nick Kossifidis (3):
>   RISC-V: Add kexec support
>   RISC-V: Add kdump support
>   RISC-V: Add crash kernel support
>
>  arch/riscv/Kconfig                  |  24 +++
>  arch/riscv/include/asm/kexec.h      |  54 +++++++
>  arch/riscv/include/uapi/asm/elf.h   |   6 +
>  arch/riscv/kernel/Makefile          |   2 +
>  arch/riscv/kernel/crash_dump.c      |  46 ++++++
>  arch/riscv/kernel/crash_save_regs.S |  56 +++++++
>  arch/riscv/kernel/kexec_relocate.S  | 217 ++++++++++++++++++++++++++++
>  arch/riscv/kernel/machine_kexec.c   | 193 +++++++++++++++++++++++++
>  arch/riscv/kernel/setup.c           | 209 +++++++++++++++++++++++++++
>  arch/riscv/mm/init.c                | 110 ++++++++++++++
>  include/uapi/linux/kexec.h          |   1 +
>  11 files changed, 918 insertions(+)
>  create mode 100644 arch/riscv/include/asm/kexec.h
>  create mode 100644 arch/riscv/kernel/crash_dump.c
>  create mode 100644 arch/riscv/kernel/crash_save_regs.S
>  create mode 100644 arch/riscv/kernel/kexec_relocate.S
>  create mode 100644 arch/riscv/kernel/machine_kexec.c

There's some fairly straight-forward to fix issues here, LMK if you want to fix
them or if you want me to take it over.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
