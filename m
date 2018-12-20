Return-Path: <SRS0=M4pA=O5=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CE16C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 20 Dec 2018 05:25:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4658C21720
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 20 Dec 2018 05:25:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LvMqWouT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pTDyjEIb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4658C21720
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eRIjv0MQXMsSwPiKGbNp3/3+heNAaaDV0Dh3/oRnTr0=; b=LvMqWouTIx93vy
	3B8X3JK0rZoVbnbIrwldvfh8PoHAiIBLlAefWILX68OMMR5AiBYSPSK+emx7qSK1P9IVRD/3FzaY1
	aAodYfvCUyySqiR58gyU2ReLlP4iN1VARFMrSz917Fl8kG47mfpDQoKl9/oxulTDnzM/5G1dpWC2+
	XSS/FRx2EUD8/aVnEQHYc7qrSSs2bvZ0m25Tmv577xznGMw/t1K4CGg2d4Y3rthZ1XbonV3fmviBl
	j3YXmyu/BH5dwC/uea9a7bEVyOLCrpDHxl34yjuyPbdTLAPQcayCoWwTyAuV9qXcvacaVlvn7yymM
	gLlQuk9/YtgDgABwR8IA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gZqq1-0003Z5-B5; Thu, 20 Dec 2018 05:25:37 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZqpy-0003YZ-ET
 for linux-riscv@lists.infradead.org; Thu, 20 Dec 2018 05:25:36 +0000
Received: by mail-pf1-x442.google.com with SMTP id g62so324979pfd.12
 for <linux-riscv@lists.infradead.org>; Wed, 19 Dec 2018 21:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=JviFETX5OT2iTJZMeT/j9j5o8VXDu/ONGIUbF6RTOLY=;
 b=pTDyjEIbf9UCW1x0YlSeBj+s019xUQpm9kNZvKpygCwHZynr3r5ZeSpsRj0sPsuUfe
 JnN9tW05YWd9GWqr3fmZaAFhny0Atv/BtSk6+KtVNaIlBwJmF9Cha/4FXu3NWcuA3uXr
 hSCIkAegYMPzRSm75QhYRA6xHTgwsCnLkX6jLH1EWBAtN94VKQISPsYNrV7LNYLztrf1
 qwYaXbL9SmWykEQRfw5+vmCifspMGYxH/dr93p/EQ5hByPC4x8Gu/C/ZK77N4KKdarXJ
 tFqAe3q6y+0u2TLV3jEC4rZlSC/DMolIfEYV360BhocgOaBTTS2PGYzj4n2jLjYMbX60
 fa7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=JviFETX5OT2iTJZMeT/j9j5o8VXDu/ONGIUbF6RTOLY=;
 b=uHi5VNa35lrsV5YBKEPFmkRehE3NloenD4Fs+K+dMw3JX9nM1FmQh70NvuoVp220KA
 agekvtjoddAqtcus27Gvr54O3ncTunnaAopJB0ljjhouQEapht0sziHUu2nTC2XlsjqA
 S7aG5XylRYBpbqTkgSbbOr/cuFKj5PXxpnFfWiRJLAjrqRuD/1tNEiUO8ZXLZO8+TK8L
 JQtT5q4numtlgesp7lQidwdgafrSM7oJuN49MU7aZh1uKU0zWZCRzbXSELpISM/bPmaz
 N39GG51mf+LKn+EhGXlaYUBgV6oi0GlCXluX1eetb0rd34BTwYjTdA38YZM1eSLIjh/c
 OG4Q==
X-Gm-Message-State: AA+aEWZjEt5uQCJa1ELmyDUU38uEXOMS7hrvPB4Lhsb2jG7hBDl8WFzl
 1f5gJX3E8e//mZjwJpq9EvEEtM8V
X-Google-Smtp-Source: AFSGD/V1Khckik0k4GNz9eFmCvulf9oqlr+yohnylGpUiR8yQgZKuHqYFKeKr05kzIdDjJ0bwaTeSg==
X-Received: by 2002:a65:49cd:: with SMTP id t13mr5442181pgs.376.1545283523845; 
 Wed, 19 Dec 2018 21:25:23 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id 196sm73353748pfc.77.2018.12.19.21.25.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 19 Dec 2018 21:25:22 -0800 (PST)
Date: Wed, 19 Dec 2018 21:25:21 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [PATCH] RISC-V: Add CONFIG_PREEMPT=y to defconfig
Message-ID: <20181220052521.GA21363@roeck-us.net>
References: <20181220014511.GA24845@roeck-us.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181220014511.GA24845@roeck-us.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181219_212534_494215_3CEFB997 
X-CRM114-Status: GOOD (  17.37  )
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
Cc: linux-riscv@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Dec 19, 2018 at 05:45:11PM -0800, Guenter Roeck wrote:
> On Wed, Nov 21, 2018 at 10:58:05AM -0800, Palmer Dabbelt wrote:
> > I don't remember who suggested this, but I was talking to someone at
> > Plumbers about all the horrible bugs we've had lurking around in our
> > port despite it still getting to userspace and they suggested that I
> > enable CONFIG_PREEMPT in our defconfig as it'll help shake out more
> > issues.
> > 
> > This patch enables CONFIG_PREEMPT in the single RISC-V defconfig.  It
> > still passes my tests (ie, booting Fedora on QEMU).  Maybe I'm too
> > paranoid, but I still don't trust our port enough to just pull the
> > trigger on this without at least accumulating some "Tested-by"s on it.
> > 
> > Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> 
> I can only give you a
> 
> Fails-miserably-for: Guenter Roeck <linux@roeck-us.net>
> 
> Not the new defconfig itself, but the new defconfig plus a variety of
> selftest options. I don't know what exactly is failing, but here is
> my list of enabled selftests on top of defconfig:
> 
> CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
> CONFIG_CRC32_SELFTEST=y
> CONFIG_DEBUG_LOCKING_API_SELFTESTS=y
> CONFIG_DEBUG_NMI_SELFTEST=y
> CONFIG_DEBUG_RODATA_TEST=y
> CONFIG_DEBUG_TLBFLUSH=y
> CONFIG_DMATEST=y
> CONFIG_GLOB_SELFTEST=y
> CONFIG_OF_UNITTEST=y
> CONFIG_PCI_EPF_TEST=y
> CONFIG_PCI_ENDPOINT_TEST=y
> CONFIG_PROVE_LOCKING=y
> CONFIG_PROVE_RCU=y
> CONFIG_RCU_EQS_DEBUG=y
> CONFIG_STATIC_KEYS_SELFTEST=y
> CONFIG_STRING_SELFTEST=y
> CONFIG_TEST_BITMAP=y
> CONFIG_TEST_FIRMWARE=y
> CONFIG_TEST_SORT=y
> CONFIG_TEST_SYSCTL=y
> CONFIG_TEST_UUID=y
> CONFIG_USB_TEST=y
> CONFIG_USB_EHSET_TEST_FIXTURE=y
> CONFIG_USB_LINK_LAYER_TEST=y
> CONFIG_WW_MUTEX_SELFTEST=y
> CONFIG_TORTURE_TEST=y
> CONFIG_LOCK_TORTURE_TEST=y
> CONFIG_RCU_TORTURE_TEST=y
> CONFIG_RBTREE_TEST=y
> CONFIG_INTERVAL_TREE_TEST=y
> 

Update: defconfig+CONFIG_LOCK_TORTURE_TEST=y causes the hang
if CONFIG_PREEMPT=y.

Guenter

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
