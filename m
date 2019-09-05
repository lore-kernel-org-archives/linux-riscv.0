Return-Path: <SRS0=cAep=XA=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A58FC3A5A5
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  5 Sep 2019 12:01:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F138822CF5
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  5 Sep 2019 12:01:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sW7zQMsf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kM+jXFXj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F138822CF5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=02tmoaGyxq7bIdQ8pMr0hU7cpclz7K6RBoS8KvzRIrk=; b=sW7zQMsfJekVIZ
	K3OJINJIzFc4R2dX6pf0zqGi9eCuCQPfUwfFE018ddDURWrhD9LZCTU7bbl495LpHmxsNyaVtNQXy
	cFYLs56z4S01aK9ciPDWvMbtpeXI4gGwnm6LAnkPMT1tmVCeIycYUo7bLiMQMgJYVSVzUsGr4ob7s
	5O7zlVmIBVaw3UeYEOdAhPq5RVgWrN++Vs5PjTXz+w/YnDYVCpe/O7KPHtreRwQvbgqLb1luM0OQM
	vEH8jPgiRZjZbiJNOrjF7gDAzlnXWPdFXi/6Q67+aVNzKyb2v1GOtOXt8A8zSvO0V7Cgs0SDWjX0U
	AlVAFy9e0CUY4fRM1I4g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i5qSa-0008R6-Al; Thu, 05 Sep 2019 12:01:56 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5qSX-0008MP-Kr
 for linux-riscv@lists.infradead.org; Thu, 05 Sep 2019 12:01:54 +0000
Received: by mail-ed1-x541.google.com with SMTP id g24so2440643edu.3
 for <linux-riscv@lists.infradead.org>; Thu, 05 Sep 2019 05:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G+ahss9R0/cW0DeOcwapy1IK/U2OHcaNx/JZYNK4ddU=;
 b=kM+jXFXj6ryQBoFGB9uVMpD5N01LdySrsqKY7SCEXwho8V/Xq9LeBCbfdV9TxRvtCU
 c2GiT2vCFKL5re78cdhlwCOWLaFSHAkOiK7zSk0nB2OLrjjxFhYZl+YFf4o62EN/wavF
 ZwNw7kmVnNcocDME5w5k9IcAPI3QRm9WuXcI3PXZc8jg+dx8gKVCXrZpMM04xxhT/bjd
 60G35GNVdQMm6idbnyVWrbNRvkNZQUJLHRTlHdDGKwLJsdZSQ0iKl9oc6cyLzffU8y04
 RPQ/WRXzqgJw/nQmey7H0IJGOk+oRjXBm56HuVmU2UE/Fw0JiWtUwD+kFPvQ73M4a6sX
 dHdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G+ahss9R0/cW0DeOcwapy1IK/U2OHcaNx/JZYNK4ddU=;
 b=C/+//LdW/MVj5cKLOKGlxaeH0w544dz5y74UiHd5lk2A0C7clbcfs0N0tQAqZq7I77
 847gbWZDmOluILdjNEKUKl1d6tbgBH6eTlPQklv7uhWtfv1Gbw7jaM1aIlQ/7tc1TT9I
 WsDXa5AqLPvMfeDW3DAzL50Rs1GxWBd5yuVmKVMHVpYfCXkWs7ajbAjKfmAfjnjwV7Sh
 9Aw/6fYpHdtmDNO6QSj84WLDcoHRUNHWQXwMgqXJVzu8DyP49PQoa3laLRZ9HUY9TnUa
 TVHQAZpFd6+qD3CB6Uct97JJqN/9LRNaX/udvR/8urRmVOY68mFEEGpDIhABJDjC00sf
 gsWA==
X-Gm-Message-State: APjAAAXBdasHMxywnsWhLfhQjPNPmKp9AymvsL8fHUuTNkfgY2jujucK
 x9/KwPobhDDVBQUSvat8pzXdmr9UfJ1AWcFKw60=
X-Google-Smtp-Source: APXvYqzs87vMu6hxGQg8ipzGgvddanc1Tbgk+uTCjFPT15fz9a4XMXJqpRaXlXqPeQJoHQbhz2qbq5T9mUeY/Q0ur8s=
X-Received: by 2002:a17:906:81d9:: with SMTP id
 e25mr2422583ejx.37.1567684911805; 
 Thu, 05 Sep 2019 05:01:51 -0700 (PDT)
MIME-Version: 1.0
References: <1565158960-12240-1-git-send-email-bmeng.cn@gmail.com>
 <alpine.DEB.2.21.9999.1908130758550.27195@viisi.sifive.com>
In-Reply-To: <alpine.DEB.2.21.9999.1908130758550.27195@viisi.sifive.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 5 Sep 2019 20:01:41 +0800
Message-ID: <CAEUhbmV8v2rjhAZfOMauJC15eZpxYUZ=9YS-YN2dhNRv4H8bEg@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: sifive: Add missing "clock-frequency" to
 cpu0/cpu1 nodes
To: Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190905_050153_753854_B2E4FAC9 
X-CRM114-Status: UNSURE (   9.41  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>,
 linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Aug 13, 2019 at 11:00 PM Paul Walmsley <paul.walmsley@sifive.com> wrote:
>
> On Tue, 6 Aug 2019, Bin Meng wrote:
>
> > Add the missing "clock-frequency" property to the cpu0/cpu1 nodes
> > for consistency with other cpu nodes.
> >
> > Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
>
> Is this being driven by a schema validator warning?  If not, and this
> property isn't required, it seems better just to drop it.  It seems
> useless?
>

Yes, I think we can drop it. I will send v2.

Regards,
Bin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
