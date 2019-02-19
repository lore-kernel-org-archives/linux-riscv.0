Return-Path: <SRS0=ksV6=Q2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64061C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 19 Feb 2019 21:19:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 329832147A
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 19 Feb 2019 21:19:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qdIPMYYu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="OXAp+2Um"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 329832147A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oMb7ui9cuEn97rurg1R3ZlL5TiMFIdUbguxkYZBF0WI=; b=qdIPMYYu8SbMer
	6/vzkZ/NSuLMiA4N914X4bvQkQfAVCIa/fB4fInaMK++o7QhITLKtRHI6yow4yOaMfJNBKxSmWK6j
	WGATEUyb/qr2HdmGzC5ITfApArTHF5rJu/EnLfn7irotvNWDVEPjMKdVW6b2R9iQOOhhh1v1mpv4k
	N+YwxUgTX7HnQvDGNFQlILIBRUjfE4NJCwtz5k3cV3kcn92G23V4+20rRHIrRY0SDSZclqPE0Iff3
	Us856lCwe4XuhzXBZTb05UgeB6n7H0oJJ0042yhuUznWK+pk9A++avv1EMU0lQ4lxBECq/lL+l/No
	M4F6SH/PQchAb5ew+sfg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gwCnn-0005Gw-8U; Tue, 19 Feb 2019 21:19:43 +0000
Received: from mail-it1-x141.google.com ([2607:f8b0:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwCnj-0005G5-RX
 for linux-riscv@lists.infradead.org; Tue, 19 Feb 2019 21:19:41 +0000
Received: by mail-it1-x141.google.com with SMTP id l15so9925061iti.4
 for <linux-riscv@lists.infradead.org>; Tue, 19 Feb 2019 13:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=Jptp2DMnM9R9mZf8xSzHhprhLDojJ3jWWa553UuANw4=;
 b=OXAp+2UmKNqR97vYIWT1aCEPHKti+fcrOUK00Ui6v8+eFSX1s1qzPDxnAFHI1lrnMj
 Sx1g2bvnTySRGMBuK2PooXNboRg871Yp4vQS8W0N02PhQjRGyepYM3/gJxQLwPpvvVfE
 H+A0GWzgLUOhoW0224vV4++MP3af2Bwq4MFkwlXw5+Hcy1lG+z5o2nlEQKEgeKPN4Tr7
 DY93Rm13zAxoEBUFoV6LoSq3pC1ouQwLTHutW3Xo8/nxrDqjGUULOu4+6BB8Cm435WGc
 vKfvV2CIapnYQ1TyX9szOt29WAYsrIbF9O+SmgIc72ZFe0CV0gplKfaESlHTxaq3Y0Lq
 7H4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=Jptp2DMnM9R9mZf8xSzHhprhLDojJ3jWWa553UuANw4=;
 b=lw5AropN+PpcxwTtZiAR67/enDi1OZHqpATg+Mx7VTVoY/0SlRPYLqP52+dEsMPEOf
 PuJOfR+yTfpfhte38nt1eibyIjfvSXv+xMcpPkGF9h7ADB6uFR/7BgxEH5iG9rkd1nsk
 322HVW2yA3G0qW0unbWkIkYcOEzJJ/JktHIdrpQIUbJ7kXgbLS+jF9JwQd4jHnDupaTh
 ubq/zcYgg4H2yd0bV7TWd5fJ4qHm4qZQ+AnriKWpoTf2am2mWyfGEpjrtqMP3+yytqZt
 qInyxmiQMTOHgdQGeYV6zCpQLUAGvwC8gvk/ho4ldtq72KKokuosGGblvBXaXUxRr1e4
 pxwg==
X-Gm-Message-State: AHQUAubP6/owNWo8bjcQZSFU1YiIp764ado3brrZbHXlpIpVGqDgp9v7
 psuCr8evJWMJmZACMjFGrRvMUw==
X-Google-Smtp-Source: AHgI3IbmtWLZjNTFVPeCzO56nRRg5oFfHnpAhvmJizcNQaYsFsiajy2Y9cyDbyxXpD0JjFEZQvJWWg==
X-Received: by 2002:a24:118e:: with SMTP id 136mr3158334itf.175.1550611173937; 
 Tue, 19 Feb 2019 13:19:33 -0800 (PST)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 x23sm7664181ion.38.2019.02.19.13.19.33
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 19 Feb 2019 13:19:33 -0800 (PST)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-Google-Original-From: Paul Walmsley <paulw@sifive.com>
Date: Tue, 19 Feb 2019 13:19:32 -0800 (PST)
To: Andreas Schwab <schwab@suse.de>
Subject: Re: [PATCH] arch: riscv: support kernel command line forcing when
 no DTB passed
In-Reply-To: <mvm36p22ksx.fsf@suse.de>
Message-ID: <alpine.DEB.2.21.9999.1902191318520.6518@viisi.sifive.com>
References: <alpine.DEB.2.21.9999.1812171913510.29609@viisi.sifive.com>
 <mvm36p22ksx.fsf@suse.de>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190219_131939_901961_27ED54EB 
X-CRM114-Status: GOOD (  11.76  )
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
Cc: paul@pwsan.com, aou@eecs.berkeley.edu, palmer@sifive.com,
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org



On Tue, 5 Feb 2019, Andreas Schwab wrote:

> On Dez 17 2018, Paul Walmsley <paul.walmsley@sifive.com> wrote:
> 
> > diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> > index 2c290e6aaa6e..e6b962ff39b1 100644
> > --- a/arch/riscv/kernel/setup.c
> > +++ b/arch/riscv/kernel/setup.c
> > @@ -171,7 +171,14 @@ asmlinkage void __init setup_vm(void)
> >  
> >  void __init parse_dtb(unsigned int hartid, void *dtb)
> >  {
> > -	early_init_dt_scan(__va(dtb));
> > +	if (!early_init_dt_scan(__va(dtb)))
> > +		return;
> > +
> > +	pr_err("No DTB passed to the kernel\n");
> 
> Isn't that backwards?  early_init_dt_scan returns true if it found a
> DTB.

Yes, it's backwards.  Thanks for the catch.  Looks like I sent an older 
version of the patch. 

- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
