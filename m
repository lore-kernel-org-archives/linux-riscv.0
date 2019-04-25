Return-Path: <SRS0=WcIC=S3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2880BC43219
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2019 20:05:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D4CE206C0
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2019 20:05:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PWW+vkaY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="kVSg2qPM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D4CE206C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=etxOqhvLAWY4ZkbXwX+2X6seNCJoTqe0p6TQQacAWCw=; b=PWW+vkaYwwK/eT
	HeYFb0jtoUo1Y41pebOHEvIDE0bmenDEt5p1XHAlXRaZDoxqgJ9aUpWG5Q3a0wpvFZD/MVtXYB9Ae
	QR2Wiab17DuSbvVK8qWGZnpnfq1k2O83p835jNYLDlNx5ipvOsZqpQUVIHMlFT/P1V2VT5/KT/+L6
	LxqWdNUIdGVRR2mCbM//QkVrBYNFkOjnE9NXWbTpGNihueKkNpX0KETy9eTqXTDzOJhPgt79itZ6e
	la5osRA8MJoPnfJ6O2TKvJxBBWEnBh9P6JJN6Km2VUiq7PUy8Vy3MktwrnmMIobBPrDOe5fNuyXb/
	GOTpdBq5J+QdDsMUvonQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJkcf-0003Dd-G0; Thu, 25 Apr 2019 20:05:33 +0000
Received: from mail-it1-x142.google.com ([2607:f8b0:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJkcc-0003D9-LK
 for linux-riscv@lists.infradead.org; Thu, 25 Apr 2019 20:05:32 +0000
Received: by mail-it1-x142.google.com with SMTP id a190so2168955ite.4
 for <linux-riscv@lists.infradead.org>; Thu, 25 Apr 2019 13:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=8L0f48fUS21JxG0GfcGCO3YzTk7ZYhjXtaqnFDvT3PQ=;
 b=kVSg2qPMzGqrTzxq5OWY0i/vaKNpNdf1ZYi7DFYMiXkus8wt91uNv5KgAh4TmUS/eW
 P06+1qqe8YxdITKnn9aEJaMLwjpfnwvd+mGi8moAz9TlisVbIrecAfLScTfiUDiqhH0f
 By2GMD/aayDidwK1mjPjELgxLl3giY/gs8Xepa15Ipyu/SoVuyOYLVSjm8rTPPA5IP74
 ckVX9KBysbfkMVMnFSuXQeNPyK9EXYWNxcQJYB031M2yLBOu3dDd6d4SyuEKgu0i0Oi7
 JOUlkiurMPRhgXe3kIbmM4qsyfxpiXmo4170hvA5Qlh9M2rfN0ywdCKtAus2GakbRxCs
 /G7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=8L0f48fUS21JxG0GfcGCO3YzTk7ZYhjXtaqnFDvT3PQ=;
 b=mV4iCwh+VYvqua6F0ZpEubjP3HHu6//64wk2n+WXPIRHWFEcvzBl0FtuW2OLjPmKci
 FSVlOOOEeedoHJvNpsRGDT9RA9XQWoHQGZeeCPGdiM4MWnDfVjMnJ2IhPVYvd2xq0XOH
 PpH4gAuyLDGzN/QAsuGQQrtsqp9O2RlYu1AXfgGmR0OkZV+64FdKBhi5a6He1EtLJKkZ
 Mmvy6VP6G2J1OooTZVhe6HeHoAzCqPz4Ah3TjNRm6VTegrtylBloevsLwGZ7UlS4t8b/
 vGttHJ9Zc+Fs8YEwf2217VECblYErkqjJyiUg67u2E8R5rvIcJwrCQszwxnWx1S3TZK8
 /SJw==
X-Gm-Message-State: APjAAAWHPGWlhVHf4iUOcEYy23oKNjyWiX3eGJj4WiruL9gM56otq55s
 c4Rg6YxSyUsGro7s9TUfk2UNVQ==
X-Google-Smtp-Source: APXvYqzQbh+4Lv/3KkBwcb/rXsLgSl03p0iFu83tcoKpIOFf466TG5F4vtxoQEV5qQZw7+SC4ljxSA==
X-Received: by 2002:a24:6b4e:: with SMTP id v75mr5257630itc.74.1556222729564; 
 Thu, 25 Apr 2019 13:05:29 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 b1sm10573522itd.12.2019.04.25.13.05.28
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 25 Apr 2019 13:05:28 -0700 (PDT)
Date: Thu, 25 Apr 2019 13:05:28 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 7/9] riscv: remove duplicate macros from ptrace.h
In-Reply-To: <20190425195447.GA22587@lst.de>
Message-ID: <alpine.DEB.2.21.9999.1904251304330.17442@viisi.sifive.com>
References: <20190411115623.5749-1-hch@lst.de>
 <20190411115623.5749-8-hch@lst.de>
 <alpine.DEB.2.21.9999.1904251208140.17442@viisi.sifive.com>
 <20190425195447.GA22587@lst.de>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190425_130530_981313_41EA58E5 
X-CRM114-Status: GOOD (  11.11  )
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
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@sifive.com>,
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org



On Thu, 25 Apr 2019, Christoph Hellwig wrote:

> On Thu, Apr 25, 2019 at 12:13:18PM -0700, Paul Walmsley wrote:
> > 
> > 
> > On Thu, 11 Apr 2019, Christoph Hellwig wrote:
> > 
> > > No need to have two names for the same thing.
> > > 
> > > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > 
> > This is probably worth cleaning up across the entire tree.  
> > 
> > asm-{generic,x86,arm64,powerpc}/ptrace.h all define similar GET_IP/SET_IP
> > macros - although it seems that arch/riscv is the only architecture that 
> > uses them.
> 
> Yes, we had that discussion before.  I've started on a series for that,
> but it is unlikely to touch riscv.

OK, if you're planning to post a separate series for that across the tree, 
then:

Reviewed-by: Paul Walmsley <paul.walmsley@sifive.com>

for this RISC-V patch.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
