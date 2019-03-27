Return-Path: <SRS0=wRFB=R6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4F0AC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2019 14:12:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9604B2147C
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2019 14:12:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oFAD1Md5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="rrMjuW4y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9604B2147C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qbb9DKuFG1PCn4yaYS2ZVX4JHVnpqsvKMcp72/K0R8c=; b=oFAD1Md5d6e0ol
	g1pE9gEDwL4zXMR1dFQlEUwlOHYlWE4mzryDBdogShDD3fVlYHP6nQe7wIrVlhkdBQz4mzmhdoYYU
	1LM34bcoIxAbDWy2Nvigwxo0vfcK47PqAdVm9DVZANwWIgE6OyjYn0cYHaUwE4TXTYY/mkJnEfY3C
	kep6MW1YIZqylLZxRg4dZitOSbrU6+ho6kwO5zvTTPTkuUXzfz9M4cF2Q/xPg2RFh47LhUHcwGkru
	Wesj3IoF5RsEI4vqc/jVHGE6/YhVfiiy8YRL7fVh5o/b8FDc+IvlO5QjEu3DihT2zOYZpIHP5IaHZ
	ekqdWmKiuZ7a6lvCQjBw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h99Hx-0003Ji-Rm; Wed, 27 Mar 2019 14:12:21 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h99Hv-0003Iu-IV
 for linux-riscv@lists.infradead.org; Wed, 27 Mar 2019 14:12:20 +0000
Received: by mail-wm1-x341.google.com with SMTP id y197so248589wmd.0
 for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2019 07:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XBQBY1Ay37YlRdu285Es/X+k+RnwhHCN8rBYW4Km494=;
 b=rrMjuW4yUpbQAe+2nqc92ctxI3YKkQ0hN+1T6pLx1J01uLIlBuNnUGX+hA7Z7hoZxE
 na6ugH38vgXjkkitafON8TJ+tDpF8cm9rFCJpS4rW24cDx3Zndj+GBFeJsIxJLUuqC4L
 4WbpUbjdqfJfBKet06DvLBMaCiOK4PdGwJPH2En5ou4aM4RE4HgXhrWZunXW/QnOci/t
 M3M8eBwGbjgjsxCc1G1aVLWEjaIQDejC7ZiTQA2RBsPzOuvggYwy3veyrLJwljk3STX2
 3fKtS0yaMtSMHJLkoKvV8w0tQKThrHWmYrVGi4st5ISLPRBwRkG7IbxFN83GhWytYpha
 2+xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XBQBY1Ay37YlRdu285Es/X+k+RnwhHCN8rBYW4Km494=;
 b=WJm9BWZqSGYX78EmYN3K/JElWTNJMtqjs6gYcPSa3+TL2Ab0+y9BHdELOpQj+UCjxS
 /IXBdJhPkGE40oRKMCdh9BcsFQno3bdqDtk8J0v7ZW816zdV5EwY7Yu4zWoF0XvuVHhg
 84M4Lp59Hubl7IWTfQE2MiY3nB1AKdsU3CxS5xujK8nR41FKstPc5kAssXFuV6nuA6l5
 u0j9uNX0YKCg1NAsR68lRfO18Faxcgw7y0g7kWvLZ1qdH6Zy+IzMoeHMPHVsf7cL64Xc
 kooyo0yEsmUyEkJLUL6Tc2YKttAlWyibusRvBkQUu9KKzlsWF1i3Gh/nScqEQtu5wilq
 Lpog==
X-Gm-Message-State: APjAAAWbYqemw/JRC49X8fMQQmqjZCUvqusCHvBaYPkoGsq//rXGxjh0
 ZypMyyt8INnlno58V3XcSmum47DFcxVqRWis3Xqeng==
X-Google-Smtp-Source: APXvYqxKzbrQ4NWQhaz26mpDd5OTb42toUOt/RSqkQXctEL2UMMsvXlDW0NG7Mk4gOYxa+DK5WwU5BOUD2WSejIy0yw=
X-Received: by 2002:a1c:b455:: with SMTP id d82mr13703860wmf.153.1553695935460; 
 Wed, 27 Mar 2019 07:12:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190327100201.32220-1-anup.patel@wdc.com>
 <7edf91f1-1df5-5513-d372-d84edd12edf3@garyguo.net>
 <CAAhSdy1+rc9ge02uqNvse5Z6XmDxsRH0G=5GnMsh+6m1LMLFYg@mail.gmail.com>
 <74227a1d-3928-3e92-c7a9-5c3e093b29ab@garyguo.net>
 <CAAhSdy1K6OiZ2nDGcERi7J1z-i6hDC2eWubYDnSqPGCxQKkn5g@mail.gmail.com>
 <4dca2cfe-069f-f458-b1a7-f87aa6718ef7@garyguo.net>
In-Reply-To: <4dca2cfe-069f-f458-b1a7-f87aa6718ef7@garyguo.net>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 27 Mar 2019 19:42:04 +0530
Message-ID: <CAAhSdy220xHbLvGMBawNPETmuLCCXkN7d-73wKXe-0of39+wsw@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Implement ASID allocator
To: Gary Guo <gary@garyguo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190327_071219_615357_D75679DB 
X-CRM114-Status: UNSURE (   7.12  )
X-CRM114-Notice: Please train this message.
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
 Mike Rapoport <rppt@linux.ibm.com>, Christoph Hellwig <hch@infradead.org>,
 Atish Patra <Atish.Patra@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Mar 27, 2019 at 7:39 PM Gary Guo <gary@garyguo.net> wrote:
>
> I think my code already get all the caveats cases covered. The only
> thing my code is missing is handling the case when ASID is not
> supported. Maybe it is better to work based on that instead?

Well, I have also spend enough time hardening this patch so help
me make this patch better.

The hint about 32bit system is useful and I will send v2 soon.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
