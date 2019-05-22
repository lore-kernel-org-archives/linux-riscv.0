Return-Path: <SRS0=gYOx=TW=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D17F7C282CE
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 22 May 2019 19:18:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A10020879
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 22 May 2019 19:18:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NNlcNd1H";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="IiHh0Okj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A10020879
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DBkRBPpV27EFU0GXZUgKxK3Vt8ynO8HlBuuzKBkkONY=; b=NNlcNd1HL/NRSt
	iLCyTRAjKZY8QxjRbG6eFmhwCzuiORgkb5H/WvqtrG/jZfVSyHbcNpY3C9bCl0Saj9Kgu1+CO3IIu
	qK/UfBZbAdM1AMsk/bP2GmRU6aRxh186pt5mAsNUJrgm06HUQms1VpyXypOfcFgwrgYTleAh3SaLz
	pFFsXPYoTg1BUPK+bvELP5QSOGY0PEsIJW+VFSyWlE9FpCpEYFGukJ2n/0M41NOUsbX4r+U4m5Hwg
	F11awuA2iBHN1NDggI1+Q7ytf/n3+6IbOELOWOBHYEuXgZPGYTjPjV4dVOwz93lxnq0GTgiqP1+VK
	IQH4y/NRna/hBrUDOpNw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hTWl9-0008JJ-DS; Wed, 22 May 2019 19:18:43 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTWl5-0008IJ-Ex
 for linux-riscv@lists.infradead.org; Wed, 22 May 2019 19:18:41 +0000
Received: by mail-wm1-x341.google.com with SMTP id q15so3364539wmj.0
 for <linux-riscv@lists.infradead.org>; Wed, 22 May 2019 12:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:user-agent:date
 :message-id:mime-version;
 bh=oMdcno1bN7UGFXmlvdsH86j5M8DSKBM+CBX05MLBto4=;
 b=IiHh0OkjSBhfeEaplOxktSUxiYE6QnxnBWhAnRpE+MfxpLOpFOmxtbpEOeQC7+Gn3d
 StdAwsHQOC5dtEQofdiP+h3EiWwWNjcVtQoOOGu6woXz5s7vKdugOPyxHdDXSHySSOqB
 nP8Xwa1vEktW6I1veR341reZCVR3xswoiN16Chzh5tLTx0sTXlMbdG4intN0XDRaXMNy
 xxSWtkhkj4h7m4hE25rTekhhjjIwDmJXS9uImPQI83vibg7paTg7QUoI8iltmNQXeE1M
 SO+hxzfHVw41Ybgq0SzLg/23yF3FWgALlMQMfDxujKMxxQ5BoIdCDbA7Cb/4AAaUF2wP
 bKuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:date:message-id:mime-version;
 bh=oMdcno1bN7UGFXmlvdsH86j5M8DSKBM+CBX05MLBto4=;
 b=hhvun//fiQizBCifyajbCzswOV4FaqHRagqJgOmgW3YS+Ek2jfSVwpMxNCi0G8CimV
 pDcFiqgQ1VthPRMTcpABsPZQr0HCboIOejf2MLRmDQ7WuV33HHGKXOwac661N75ORYxO
 mUtX6471rnd8aHdpAWJd4JGaIqRzEmwdXu4ueZReE6Ob44uI3vyW6Ds+FxObuzvUSK9Y
 4PXy0lfpPd7WSHwzF7hpEPGO25nvdJY7k0JO+jd04xtggwHLTPaaXjYWzv+f+V+qfvf6
 cw6oDfk5P6V8rXfFa0zbrHCI4mblizCY+FKrbmxprueCpxkFYt+tPIamv47kkqs0Akm4
 XaIA==
X-Gm-Message-State: APjAAAX8GAI0edZPABv/YQpX9CJlMTtpdFIsrWiWpHGODyL8O2OCGQJ3
 jpkmKUc/6SUekJDG29e5+Tciyw==
X-Google-Smtp-Source: APXvYqwJkoMFDjSKM1Xceo+2NVH2eEaNn1h+0mvTxstEwWDLuXSNqLr+xgh+7QN1+3tmDHssAXHjNg==
X-Received: by 2002:a1c:40c6:: with SMTP id n189mr8955328wma.65.1558552716735; 
 Wed, 22 May 2019 12:18:36 -0700 (PDT)
Received: from localhost ([2a01:cb1d:12c:8800:1e45:34e8:9e5f:f03])
 by smtp.gmail.com with ESMTPSA id y40sm47697179wrd.96.2019.05.22.12.18.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 May 2019 12:18:35 -0700 (PDT)
From: Loys Ollivier <lollivier@baylibre.com>
To: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH 1/6] arch: riscv: add support for building DTB files from
 DT source data
In-Reply-To: <20190411084304.5072-2-paul.walmsley@sifive.com> (Paul Walmsley's
 message of "Thu, 11 Apr 2019 01:42:59 -0700")
References: <20190411084304.5072-2-paul.walmsley@sifive.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
Date: Wed, 22 May 2019 21:18:33 +0200
Message-ID: <868suyb8mu.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190522_121839_551354_FF0160F3 
X-CRM114-Status: UNSURE (   9.29  )
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
Cc: devicetree@vger.kernel.org, Paul Walmsley <paul@pwsan.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>,
 linux-kernel@vger.kernel.org, Atish Patra <atish.patra@wdc.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu 11 Apr 2019 at 01:42, Paul Walmsley <paul.walmsley@sifive.com> wrote:

> Similar to ARM64, add support for building DTB files from DT source
> data for RISC-V boards.
>
> This patch starts with the infrastructure needed for SiFive boards.
> Boards from other vendors would add support here in a similar form.
>
> Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> Signed-off-by: Paul Walmsley <paul@pwsan.com>
> Cc: Palmer Dabbelt <palmer@sifive.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>

Tested-by: Loys Ollivier <lollivier@baylibre.com>

Tested the whole patch series using FSBL+BBL.
Did basic boot testing and uart validation.

The actual testing process is quite cumbersome.
One needs to rebuild the BBL to update the dtb loaded.

Would you have an idea of the delta between bbl and u-boot ?
I tried booting the same kernel + dtb with U-Boot but ran into
errors related to plic.

Loys

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
