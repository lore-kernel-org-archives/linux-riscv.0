Return-Path: <SRS0=gFXo=QT=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 594E6C282C4
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Feb 2019 10:23:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27D6F21B18
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Feb 2019 10:23:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eSDZ9ekY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="WIfEsyfv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27D6F21B18
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QkCuipSdx5pZWZrrmNP83pLFAXCGiTlEx2XvmmBjhQk=; b=eSDZ9ekYg+2RRj
	z5q0QdI1yF1fp3u2Hvn/3YBRQXjSC2sW3ggWheSM5Jj5XZ8HKXdvZ3iPWhYvr3sxc+UAI+bczIHh7
	yRaqhZmd+Styry/co0C2ukR2C5sdH6tELe/h12IXX4xOi2NKtuxA7eLZ36DMvrjaNkj5oKyifa/8A
	A3+WITICnA5glMDWvIO+u69oqfuHqAB+DzZjBLUvJOfHOa/EKjUuNDBk8TqFzHC7muQtTKTDQgQs+
	Po6wTMCEohUGjcj+nHTuTOLd96pfCZwTa297lZUzdmGxKnvVR8mnbQNW330llw+QV3Bkr+yoSTCxQ
	KQI4l9oq0n6Bi4em/OQw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtVE5-0000rX-F3; Tue, 12 Feb 2019 10:23:41 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtVE1-0000q2-Uy
 for linux-riscv@lists.infradead.org; Tue, 12 Feb 2019 10:23:39 +0000
Received: by mail-wr1-x441.google.com with SMTP id w17so1994422wrn.12
 for <linux-riscv@lists.infradead.org>; Tue, 12 Feb 2019 02:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7W8G/8FaSOJk9M7YHMfYt+bUiItd3l+RK8BDFjOuhhM=;
 b=WIfEsyfvAQS08gsNmMtnHMcv70Li+F9ZXFAafM6QykN3Gdm2PFkAO6YR2wEFpGLXE6
 4Zno41jwiiocRF91A8WKY4PslqX3MyWFTdzUHGrddos/ekqQ14yMEAWXRV9lRyotx2Qo
 Y+aOop1/iC5p8pblhWMtr8zIWoxl1ACFyMELp/2Zy4mT35xuyqgYyPfsaDZSM5extvm/
 QwOExDWW2w2G9YPwy5/2s64+Ng7/ZEwYc6A/ZcYLdPG9qy/FEy18ZcUbvPdXkyqxaBQ3
 rHph/51Iy9aaGZm+PeO1Uans3WhW76dD8HTwe6HLWZ2x+EiHa6hZDviC4EPytVa39jvr
 eU3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7W8G/8FaSOJk9M7YHMfYt+bUiItd3l+RK8BDFjOuhhM=;
 b=pMDOtf90Lw3b91BM8zpj8bahQPhstQ4SA8iOpBIUi7GR9KYF96jyo3BARHg9nNy/d7
 wzj3B/yxBYFsQ5SEAeUo40SiDTykhBmP9h7vO9ENfBuTu5uRQgvVZiQcVPK8Neg6j3d1
 RiIQ2uqtxDy2ZIzrLw6LnmKxTMcfpKplvELVqvCKfzhaQCxN2gPazdY5dnrlUh3RPFnE
 3g7phOa8obN0tPOl+P4KhgeUQc7iP/GonDtN8/EjhUIrlNVcMfx3X5Ux+rhUX9dqaGXv
 8EiFfsQwJTps798sgRGBq3NZCcqzj/qe+YfBVOYpxBgE+2GUPvoHOK5WvKeTAYX/BF8w
 yjWQ==
X-Gm-Message-State: AHQUAubm+GMo8KM+5oWsoVt7Vk14oCMQS6AgIqb5Lo1Y9rQvi7LRtSqT
 VPicr1hLpQJ+36bik7gpzRpQl9zq5NhPJLHxq06hPA==
X-Google-Smtp-Source: AHgI3IY41xL2N5YF5uACORhGdY4bkLqRC823BuTXZ+5OcQgKQSlaaltMz8m1Kin3220iHkzvDN+NxZq889ztE4yDEH8=
X-Received: by 2002:adf:ee07:: with SMTP id y7mr2333442wrn.187.1549967012363; 
 Tue, 12 Feb 2019 02:23:32 -0800 (PST)
MIME-Version: 1.0
References: <20190119132650.9978-1-anup.patel@wdc.com>
 <20190119132650.9978-7-anup.patel@wdc.com>
 <20190212070807.GD26747@infradead.org>
In-Reply-To: <20190212070807.GD26747@infradead.org>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 12 Feb 2019 15:53:21 +0530
Message-ID: <CAAhSdy1NED22YyYrAJDqPkDqT1c2ms2QC9OjHP0qLwHT+o2zvg@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] RISC-V: Implement keepinitrd kernel parameter
To: Christoph Hellwig <hch@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190212_022338_052223_AD867E6E 
X-CRM114-Status: GOOD (  13.43  )
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
Cc: Palmer Dabbelt <palmer@sifive.com>, Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Atish Patra <Atish.Patra@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Feb 12, 2019 at 12:38 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Sat, Jan 19, 2019 at 01:28:59PM +0000, Anup Patel wrote:
> > This patch implements keepinitrd kernel parameter. By default,
> > keepinitrd=1 but users can pass "keepinitrd=0" to free-up
> > initrd memory at boot-time in free_initrd_mem() function.
> >
> > The keepinitrd kernel parameter is already implemented by
> > unicore32, arm, and arm64 architectures and it is documented
> > at: Documentation/admin-guide/kernel-parameters.txt
>
> But why do we need it?  Is there any good reason every not to free
> the initrd / initramfs memory when it is not used?

If it is initramfs (i.e. CPIO image) then contents of CPIO archive
are extracted to create a ramfs instance.

If it is initrd (i.e. some filesystem image) then RAM block device
is created in-place at initrd location. (Please correct me if I am
wrong about initrd here).

So in case of initrd we might not want to free-up the RAM but
we can certainly free-up in case of initramfs.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
