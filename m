Return-Path: <SRS0=WcIC=S3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B760C10F03
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2019 05:04:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE3C4217FA
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2019 05:04:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QhLHeVNK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="eKhdo0U7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE3C4217FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GcKbhjL3UtTrBfGuLiewF0R/8wlVfhqpH6/Hx8O0T8o=; b=QhLHeVNK6SzUwh
	x/436ZOwxoBXL8HN3pQwFE6K47A2xkWJVluH966vJKhdO6NOu3D0M95ue9qGTNsiuDFicE175IyND
	6lxTCyr5fy15afAD1ROPtVlYmkQyV3YnO7tlItCJIL/XQAOAd4yCkG+1hJT4LEEcPXGQmO1LiWxuW
	LGKI6f6RpJwqcXzQZixUixr6jYTmC1jo5XjLdDTCa4yjE99dOVSHQUFcNl1k9bu9G0VryTdKyTIVn
	qn+b9aKDndsBHvu3Pbiu17qtro8ocuL3UvAW/njejulYnO7ZDtWGK7gLX/uTP7/RCYhkaSpTG1AxO
	UF/cXYBGcFIAs333BK5g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJWYi-00067s-0W; Thu, 25 Apr 2019 05:04:32 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJWYf-00067D-NV
 for linux-riscv@lists.infradead.org; Thu, 25 Apr 2019 05:04:31 +0000
Received: by mail-wr1-x441.google.com with SMTP id c12so22132752wrt.8
 for <linux-riscv@lists.infradead.org>; Wed, 24 Apr 2019 22:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b5ZliQNL3dHlGlonyzY7/r/CLr+V6C8KSnOz63CTxII=;
 b=eKhdo0U7s5plIJ+LRJ1d9Lll7ykJncW5GJs5IJWk7tTVQ+OWSKARiKQ8fyi5Hfx+8Q
 BkaKhcBBYU27CcHHoVQADYBovQByoA9mFs9LiJYGjK2Y+avu8mCsXa3FRp4q4E7ZG8r8
 wfcr/ZE7ACuH3eGXkfjjCs2twKKHRiqfD12AGBBwFseMO5wkr07H0k9ZDXA/63yOsC43
 tn8PeR8XmKkCCT/FiF3OAP82qkmI/Pmvll8k4AETGJhiXaPS47cZeZV8XXGuqEGHWiBz
 ZruDcGsRam5K2eUG73F+wSKxxDduqMQD0B5fUEh238PdTnNqwdDMCzVrNB1JNM9BFwC0
 Y/xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b5ZliQNL3dHlGlonyzY7/r/CLr+V6C8KSnOz63CTxII=;
 b=Y+U1twdZmSEVC41+rx3h6h683TWSeUlHyNukyXIKMzZQemulAOdzR1T2mSx9Ou/+1u
 5ZPo8UmbkdO5P3K+aNYCj+pce1hAsUCvvju2vuSGwauNTRDPRHZC4dz8Jte/OmD8xPKg
 lpvz4hA/y5tOplAglFmy8LFzMyzRNRaKxdGfVlCRDzc2G+sHtM45PBeTDPVb1HdeN58Z
 rvwExYxB2qAZCo2V2T00E47WuehbjMxN3zxYqEz6Xoj77a4rgjIuXUKGEKkh7WMZ8Kau
 DOBuUqsbTICXR0nOMBUFfxxz5D58nG9CqIMFK0Vtp/YIhmpme45j3apwlYySb42zik3h
 yikA==
X-Gm-Message-State: APjAAAUuyYRYdVMEEtwzrKcPPjlfwY2tIb+La9qC6t8pFB8cuiC7noBx
 ogRHu6P0OppNwCjOiWR/W2LWUsfQb2bBkO7EzNpMLw==
X-Google-Smtp-Source: APXvYqwZHNErCTPnMk7vC6/kS4w/2oRBGMRTilcbpa0G0qAxiWNgZrd1jRBW6f7Vf107yki0xgMwvT1YXtuLZKfJfgw=
X-Received: by 2002:a5d:5108:: with SMTP id s8mr21951551wrt.99.1556168667185; 
 Wed, 24 Apr 2019 22:04:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190415093648.7525-1-anup.patel@wdc.com>
 <20190415093648.7525-3-anup.patel@wdc.com>
 <20190424062947.GB10400@infradead.org>
 <CAAhSdy1Xc9AjPKY0RzLL_qsBs6wax23fi2BTVtMhuS0mAoKZmQ@mail.gmail.com>
 <20190424150135.GA19543@infradead.org>
In-Reply-To: <20190424150135.GA19543@infradead.org>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 25 Apr 2019 10:34:16 +0530
Message-ID: <CAAhSdy0xydwViJW8yCPTLrgkNGjwd4J8P-=4b2P4AfGemmyKyw@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] RISC-V: Add interrupt related SCAUSE defines in
 asm/csr.h
To: Christoph Hellwig <hch@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190424_220429_772503_CC82280B 
X-CRM114-Status: GOOD (  11.04  )
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

On Wed, Apr 24, 2019 at 8:31 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Wed, Apr 24, 2019 at 12:15:45PM +0530, Anup Patel wrote:
> > We need these defines for programming HIDELEG CSR in KVM kernel module
> > so it will be used at multiple places.
> >
> > >
> > > http://git.infradead.org/users/hch/misc.git/commitdiff/1221f5c32345ebe7ea2c1cd6e8a01ad4b422aaba
> >
> > You can certainly use these defines in your nommu commit by using
> > "#ifdef CONFIG_M_MODE" in switch case of do_IRQ().
>
> Or just keep them in the current format even when you move them, as
> that allows everything to work with a single ifdef at their point
> of declaration..

Sure, will do. I will send v4 soon.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
