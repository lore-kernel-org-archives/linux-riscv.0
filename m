Return-Path: <SRS0=iP4V=U3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5990CC5B579
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 28 Jun 2019 18:53:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3641D205F4
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 28 Jun 2019 18:53:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GbmyX2zJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="T6kWLJqr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3641D205F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mnGgQ+nL4Epr3RBqtaxQFRKqHUDy+rzgYv4UvDtEb4k=; b=GbmyX2zJhf63o3
	Dv7mWn9mNLlt3i0c4D9fKuyI4qXTsYZPwzRlgM2KsmgMDqH5qliwcYdRfY+Zm6LK6oL/FTwznESqk
	YZ0GuvC/eMXBIFVRsxg655UryJcvO4EkZ4G6xxFA2rSbLkrcrS3uGnEjdA2ZfTiI0nQHN99nB85oV
	1z/u6KbRcsqDVXiAUTKdQtyWz7jjmbVjdNxzNJNDOqZbWNXW8s4JGx9a0iSFtwlehuVwFtpT6i4B2
	AR0rzRndUa45t78BuwH0+6roMdNDh/x4MU2J6QrB5+CYGGGBQoem8rS+NskV84EXKaUtiH3cyxzyq
	xYOrefpOldD7zV+AYIrA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hgvzc-0002ko-Lp; Fri, 28 Jun 2019 18:53:04 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgvzZ-0002jk-Gw
 for linux-riscv@lists.infradead.org; Fri, 28 Jun 2019 18:53:04 +0000
Received: by mail-io1-xd44.google.com with SMTP id e5so14674322iok.4
 for <linux-riscv@lists.infradead.org>; Fri, 28 Jun 2019 11:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=0vnkzi3BuJTyXx7KRAPPLKqoLRHPgMrkqNHgPj4DsWE=;
 b=T6kWLJqrYH5JG0ZpMsTWJYlyGp9L3SPHrYqLjVPcryv7lQnYlvRo3gyaCu9yw18RST
 Z87ehkfmmJPrNWqwbVGwO9zaTzKN6gap4ePTLSce7dgy/LWbvt+j+oH15CCz/kDxDRXT
 kU+5cB/xXZA8kY42vlqCnC82yo2PhgaWetCTG/BFjvvO3NEjkfHPPtVNtIdzkmKPSV9n
 sn1Tqp6C8V/RzMRtEteqgpcaDUHN/M557MGODv7f7gUChAz0zOz3c5iizFfLdZikIwK0
 pGDBZemdSCGyArGmU3wNXGeWyE+g30zZSvPbbAKcxM1YICX3RCRnUn/dMCGi84YW3huv
 IBLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=0vnkzi3BuJTyXx7KRAPPLKqoLRHPgMrkqNHgPj4DsWE=;
 b=KRc2bhlG3b/knTSPPMSLp9118FUgTC2UB3diZC0B7Q8ayzaS8g8rO25TCv0RZ5dGzJ
 zEv++dBrmjx32xCAjynBLYm/AldLzJtNdfH4pzrGqT+Zat2qKQzNQmCCxoQSz6fgZjiy
 SSP/aeZr6RXLnV9c7B0Vh4Iw/6cZBXqXV0+ZIuxG3ES3T8LrYa36IyGIj/5PrnSl6lqA
 Qq5d6iFfR4hMfRb6By03WkLS9eng3fhu4pF9D9k2CX29FhstAL3UgU9rWIaB4WW8zw0S
 xn6au/xf9Po5xwLHOC3SUpBvkrlYqjl/XH/0DzJPso64v5ePsRTbO+pBLkRRnf3mMQ1X
 VvVA==
X-Gm-Message-State: APjAAAV7qFrhnFZCewu4p3py39XiBjAFnmuoeVUoTYP4Rf1nN9iGdfNb
 2SByyRQIwkGBQ+NOJM1pHBpgqg==
X-Google-Smtp-Source: APXvYqxpEW1Y8xJHyOkBaajlUN4Y39E+v9ExrC3+JygOPXs47MYzUBN0cdnJSzJFUIgReI45GA6Nrg==
X-Received: by 2002:a02:bb08:: with SMTP id y8mr13143899jan.51.1561747980021; 
 Fri, 28 Jun 2019 11:53:00 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 w23sm2481400iod.12.2019.06.28.11.52.59
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 28 Jun 2019 11:52:59 -0700 (PDT)
Date: Fri, 28 Jun 2019 11:52:58 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: damon <liush.damon@gmail.com>
Subject: Re: [PATCH] RISC-V: redefine
 PTRS_PER_PGD/PTRS_PER_PMD/PTRS_PER_PTE
In-Reply-To: <1556093512-5006-1-git-send-email-liush.damon@gmail.com>
Message-ID: <alpine.DEB.2.21.9999.1906281147260.3867@viisi.sifive.com>
References: <1556093512-5006-1-git-send-email-liush.damon@gmail.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190628_115301_595768_40CB5F1B 
X-CRM114-Status: UNSURE (   6.86  )
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
Cc: sorear2@gmail.com, palmer@sifive.com, anup.patel@wdc.com,
 linux-kernel@vger.kernel.org, rppt@linux.ibm.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 24 Apr 2019, damon wrote:

> Use the number of addresses to define the relevant macros.
> 
> Signed-off-by: damon <liush.damon@gmail.com>

This patch looks reasonable to me.  But what's missing from the 
description is the motivation.  Is this a prerequisite for another patch 
that you're planning to post?  Or because you think this is clearer than 
the original?  Or something else?  etc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
