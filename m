Return-Path: <SRS0=gWek=OQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F263CC64EB1
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  7 Dec 2018 18:45:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF2D820659
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  7 Dec 2018 18:45:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nw/gxWcM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="mxXiZnLi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF2D820659
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=6J3/EIjPIAdFlAt4F3tGnj340TvOcJyWCqXwZSQjO44=; b=nw/gxWcMtM9vwrFAa7q3VmDx3
	1dPitp5lhZ2j/UNC+l0HCdURc1yElkt3geeKUZ0syhJh2SscQyHfIWwog4KKEJXMxKQb9eYwp/pM4
	aoloWLww1DdcCsqotXsbtiCwkK7BYFAj2yx6hEZueCVxgZ7qreBCGgN31pEGCZW1QRe7E6CLg0+ee
	kCQ0e1rA3IZdYlCJFCsxrv+YP95x+AjoNEB/WVeYYJz2x0PEh2Y+U+xUmBCwBPaxlXpfV79GeY/ax
	EBFFlH7J43m0YMBT28BGmvUROqUM3ZotT1dfmIP6x9KVvCowl9izbMl3Tib/nNzniMcgw15tirLId
	mW0I2E+5A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gVL7t-0002JF-BM; Fri, 07 Dec 2018 18:45:25 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVL7q-0002G0-LS
 for linux-riscv@lists.infradead.org; Fri, 07 Dec 2018 18:45:24 +0000
Received: by mail-pl1-x644.google.com with SMTP id y1so2201382plp.9
 for <linux-riscv@lists.infradead.org>; Fri, 07 Dec 2018 10:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=NNDKygG0WX9igZsqFZ4iPyF5LpJxmo5sA54/xkrjpjI=;
 b=mxXiZnLitdrHnq22Nq8YRSCL++2I+yp2I1Wp+rhZAC2Ll/kMbtW3xGbqrbwv3rmxRx
 bp8qlisSxMY0S+lMrHpl2XZ7eCj+vUXoABRIcvVbFULRxPUX5m3sV8hTfeGE/JhYJozc
 /yV2VXYQT4kO/lTvWz5eYyzx2boKoO9jo4KKoUukpTzcbNng1cD5qPMd0MnM+LTJD7kL
 dmumrdrYTOEf/KHoCXuRvqIkURR/1xxZ0kqUKSd3jQorfVB+0kiCAfcEZXBDXtZv0s2m
 0Gr3CRmQ1azvjYXTninXQTbih0ghtLT4w3VvE3sGvaidFNLYEdCuiDbFfJfHGPoSM1cX
 Xz6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=NNDKygG0WX9igZsqFZ4iPyF5LpJxmo5sA54/xkrjpjI=;
 b=ZgtoJx7kQgsUB+5FQPe0HVuF+TSfCP1Gt589c/oOMRLAp/itukIhKV7SS8gDCiCDkM
 rxG4D7NCvT1K+8gaAIril5Q/Kp4XQjhv1wTrsEAWUiO1AIOzIP2PsBylgcHpEsTPBcCS
 FI2Xc4SIqjBOTj9/3D33nLPkWC1zZbzCdYJuvxqW0Hql+OAnUH90RqKYp46oR+2tWwG9
 MYJbcUUQ0PGttS79+avsjeQBboNXdPo3MP8H4nP4yR7HMZ0eXZvAXYInKupy9xHlTSOp
 XTH7OQzBN8u2bo1AG1jwL498YN+R7bIHW+bAlkiCxkiIYs+nqpRWGKPCPu/4SVwm8Agh
 EjBg==
X-Gm-Message-State: AA+aEWaRsTYrXKi9y/hA+7FHTW/VcIEvXpIQ15+syBtTsXtGbIVBkM2n
 504rvGbm5xDlszvTX3Ekw/DTtg==
X-Google-Smtp-Source: AFSGD/WCcCsZa5P1415ERxz/08fdE7JNfiI8/LYm5k/Mg2iZ/ywuZ2XvHuADtSp9XAy7PaCZ2is06Q==
X-Received: by 2002:a17:902:720c:: with SMTP id
 ba12mr3193243plb.79.1544208311926; 
 Fri, 07 Dec 2018 10:45:11 -0800 (PST)
Received: from localhost ([216.3.10.7])
 by smtp.gmail.com with ESMTPSA id 125sm8970983pfd.124.2018.12.07.10.45.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 07 Dec 2018 10:45:11 -0800 (PST)
Date: Fri, 07 Dec 2018 10:45:11 -0800 (PST)
X-Google-Original-Date: Fri, 07 Dec 2018 10:42:13 PST (-0800)
Subject: Re: [PATCH 1/3] tty/serial: Add RISC-V SBI earlycon support
In-Reply-To: <20181205095846.GA9847@kroah.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Greg KH <gregkh@linuxfoundation.org>
Message-ID: <mhng-114b47e6-1722-4cae-9132-5998c74eef66@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181207_104522_733577_DA827F87 
X-CRM114-Status: GOOD (  11.84  )
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
Cc: robh@kernel.org, aou@eecs.berkeley.edu, anup@brainfault.org,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 atish.patra@wdc.com, linux-serial@vger.kernel.org, jslaby@suse.com,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 05 Dec 2018 01:58:46 PST (-0800), Greg KH wrote:
> On Tue, Dec 04, 2018 at 07:25:05PM +0530, Anup Patel wrote:
>> In RISC-V, the M-mode runtime firmware provide SBI calls for
>> debug prints. This patch adds earlycon support using RISC-V
>> SBI console calls. To enable it, just pass "earlycon=sbi" in
>> kernel parameters.
>>
>> Signed-off-by: Anup Patel <anup@brainfault.org>
>
> This makes more sense to take through the riscv tree, so feel free to
> add:
>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>
> to it and take it that way.

It should be in my for-next now.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
