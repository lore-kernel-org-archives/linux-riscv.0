Return-Path: <SRS0=m7Kf=UR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=3.0 tests=DATE_IN_PAST_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49BEFC31E5E
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 18 Jun 2019 20:28:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 216F42147A
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 18 Jun 2019 20:28:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VF7GQVwX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="aB7KTV5Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 216F42147A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+F2YVRKaO0vr9gu2piCw5iZCc4pKEmRBKPFzDL6eMJg=; b=VF7GQVwXv7MlTg
	leZRL6QsJXT8zhqou9KXo+XXsfrl+J4hEG33BkzCuPmcfuSL39YCOa71k5yhq5YPeSaWp1Qr8jGZL
	HUe/mZEh1ZF+rGJDgcaqPPoWC8/4E92l0LUtcoArnThbxLoaNtsYqQlR2bKDdFTZcLhu9tgS+04s/
	d0A84hgdT4QBGy1J+bogrLT6xffTzLssqD5l0izB35sV5/+kRR5Vnub07vKRFGpqrS4w9h8V3s2LH
	2xJGtXn+BVFlBbDO0D4YYlEVyjzvhqDzbqDaiHMeC8590QmOyOapjrYryjheRkMixrpAhtubSZmbW
	8fBlvwwhsNIkHZdjusxg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hdKi9-0007kT-1f; Tue, 18 Jun 2019 20:28:09 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hdKi7-0007kG-9i; Tue, 18 Jun 2019 20:28:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/yuq+528Ge2GyeWg6aQYCOiRFdbu/e3xfN3FdxpcEzY=; b=aB7KTV5ZzmCoj1Qxm3dVaqBytG
 6+FKmt7R881qAHMbcleBouaKC3kmFz2LA9Gvif95NyyHzZYpT55h4RDehfIKQQY69CVa8wVC9pTSV
 lM5saykAhFfav4/jsmfkmbjCMOcfAFWTC4XcOhZRfq2M8BexwvZFvq+n1RO+Q6bUZMKIXOAKqgS/z
 Z0xhg86h0mjM6gWv9dljQS4maac4BmrXdCgsk5P5Rrbmx/H/nT9JqF0GEKhiNMUUO+RcYwIj4hQKr
 S+oRAMGCViKI189iZwgPRWHso0mZugDsGCk+ehRnbRbif4s1O9+a3pZMmiNVfSY4BbgNtTHNIW9P3
 VhKuGzng==;
Received: from 177.133.86.196.dynamic.adsl.gvt.net.br ([177.133.86.196]
 helo=coco.lan)
 by casper.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hdKi3-0001wm-Jm; Tue, 18 Jun 2019 20:28:04 +0000
Date: Tue, 18 Jun 2019 11:14:47 -0300
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v4 00/28] Convert files to ReST - part 1
Message-ID: <20190618111122.64cdeb59@coco.lan>
In-Reply-To: <20190614143640.40ee353a@lwn.net>
References: <cover.1560361364.git.mchehab+samsung@kernel.org>
 <20190614143640.40ee353a@lwn.net>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: Song Liu <songliubraving@fb.com>, Albert Ou <aou@eecs.berkeley.edu>,
 bpf@vger.kernel.org, Daniel Borkmann <daniel@iogearbox.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>,
 Alexei Starovoitov <ast@kernel.org>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 Greentime Hu <green.hu@gmail.com>, netdev@vger.kernel.org,
 Yonghong Song <yhs@fb.com>, linux-riscv@lists.infradead.org,
 Vincent Chen <deanbo422@gmail.com>, Martin KaFai Lau <kafai@fb.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Em Fri, 14 Jun 2019 14:36:40 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> On Wed, 12 Jun 2019 14:52:36 -0300
> Mauro Carvalho Chehab <mchehab+samsung@kernel.org> wrote:
> 
> > This is mostly a rebase of the /33 series v3 I sent, on the top of the latest
> > linux-next  (next-20190612).
> > 
> > Changes from v3:
> > 
> > - dropped cpufreq conversion - documents are too outdated;
> > - infiniband patch is not here anymore - as it should be merged via RDMA;
> > - s390 patches were already merged;
> > - Dropped Geert as Maintainer from fb/framebuffer.rst, as per his request;
> > - Did a minor editorial change at popwerpc/cxl.rst per Andrew Donellan
> >   request;
> > - Added acks/reviews;
> > - trivial rebase fixups.  
> 
> So I had to pull docs-next forward to -rc4, but then I was able to apply
> this set except for parts 5, 6, 14, 18, and 19.  

Patch 5 went via Cgroups tree;
Patch 18 went via power tree;
Patch 6 is obsolete, as the cgroups-v1 CBQ chapter was removed;

So, what's left from this series are patches 14 and 19.

I have a rebased version of them on the top of linux-next
on my working tree. Perhaps we should try to push those two late
during the merge window.

> Some progress made, but
> this is somewhat painful work...

Yeah, a change like that is not easy.

Thanks,
Mauro

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
