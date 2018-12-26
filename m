Return-Path: <SRS0=5aT3=PD=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30913C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 26 Dec 2018 03:24:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C477421720
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 26 Dec 2018 03:24:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GsfW64tU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ml/4/wkm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C477421720
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hmKN28+qy936WdrkO5HiaZmz6/rw+Qm0FgIM1glrGJ8=; b=GsfW64tUo5o83i
	MlfEP48AekRRbxJmJFHc4NFd0DyT1vxnf7o9P5lQgPmXgGJIbuuwrxqJIKZvDlf6mucujy1xg1Jwr
	xc93gi7Ym61F18ka7Q0zA+eW7FuCvjheXVdQ512YGdD0E+MoHoi+XJrLfWwpapFRL3r+7q7GguIRG
	b4uVMJYEpO0sSNw4GDsncWObKAhW+tR8CqtemY3z6JlZm+rCB7QRwEV7X/dhTzH5q2ubPRk5ffMTi
	TiJZ1Dj7ml/Ch+2cTJIifAo+HcM8qCoZNuOI2Fj4focW6f1JTRb5UUn0IEwLMs/Tnp2sq3pZ8kxL3
	4kbiLmhft3QeZeHyCfog==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gbznm-0005E5-7O; Wed, 26 Dec 2018 03:24:10 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gbzng-0005DC-Py
 for linux-riscv@lists.infradead.org; Wed, 26 Dec 2018 03:24:09 +0000
Received: by mail-pf1-x441.google.com with SMTP id g62so7316472pfd.12
 for <linux-riscv@lists.infradead.org>; Tue, 25 Dec 2018 19:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=CzEIipjQK5CCC1RGPMLJ827FOpjnAxL8iCnBk/F1Qa4=;
 b=ml/4/wkmFpWaiHGOb/luForv0NkPnxd1On7ocHD0/gB5X+PPAHTZy3V3eV69Yy3N6V
 cB3DLPASlye6VNF/lVwUwTiGgoQwhAw7dOPDUaZJ4jT7nCoVF8zkLt/StSbegvrn5yB8
 voz8m3196XzeCOzU6rgUWIUkGt+qrUmDUKWb7PyIrb0AnERQm3+jsz7jfOTkhN7jLo6/
 Nc8ao47uMcnwAckO5LlNHtG24SSIOAe+FxYBcMSlBlGPa2uxt2axOnzKYN/fRDaakNHv
 vPf2MzRsJZR68AdvHDziBipVOsKYN63cyMwZc/1KG7eMkPC8rY4qPPTxo4f2G3quPHYZ
 lXzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=CzEIipjQK5CCC1RGPMLJ827FOpjnAxL8iCnBk/F1Qa4=;
 b=jQAYZJ0jRhNCvrfxmPZ3odIHPrdbMIBgG7P+L2CVoXiLi3wg3QPhhl2VgEkDGyqLQa
 ntIVpJ/w/kdUXJYC2t3Mnh0n/tPVGaJm1M822jCvRACiKUpFt923jT/eY4cZG6cHiuQZ
 QoPMDU7PmMSzDdiMqVVKpyVX9bRjG5gZOSK2YaJM0AcEd4Kh7Bmm4nLity+FPEfbyLDp
 oEbvFzu5cWz05vaBwRvfbSNH+5osUWux85w/PGJq0vhY5IOxLAo9guYSrnmzumGVmb7k
 4/gQ3B5TtMORRQXtDRaWa6WgJZfkC0gbKMXpq8zZya56QCxZuqZxxtdmDAF76mH+V5eb
 NyyQ==
X-Gm-Message-State: AJcUukeJmTr6HGMib9x/FHEjjwEc1KY7pbiCexatgBd2tD1xrNlE83s/
 Kh4eF2NDbLBcBmCRv24ROLk=
X-Google-Smtp-Source: ALg8bN6HaraiLZ2DwMnqL4UHxHHlOgnUQ9nlVy6bwTGvAfcvLXHK9l5Bi4I7Wu0F6pzVvuEVzazW4A==
X-Received: by 2002:a63:9501:: with SMTP id p1mr17571453pgd.149.1545794633341; 
 Tue, 25 Dec 2018 19:23:53 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id d69sm45648285pfg.168.2018.12.25.19.23.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Dec 2018 19:23:51 -0800 (PST)
Date: Tue, 25 Dec 2018 19:23:50 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [PATCH] RISC-V: Add CONFIG_PREEMPT=y to defconfig
Message-ID: <20181226032350.GA27044@roeck-us.net>
References: <20181220014511.GA24845@roeck-us.net>
 <20181220052521.GA21363@roeck-us.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181220052521.GA21363@roeck-us.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181225_192404_869485_B636B2E2 
X-CRM114-Status: GOOD (  19.40  )
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

On Wed, Dec 19, 2018 at 09:25:21PM -0800, Guenter Roeck wrote:
> On Wed, Dec 19, 2018 at 05:45:11PM -0800, Guenter Roeck wrote:
> > On Wed, Nov 21, 2018 at 10:58:05AM -0800, Palmer Dabbelt wrote:
> > > I don't remember who suggested this, but I was talking to someone at
> > > Plumbers about all the horrible bugs we've had lurking around in our
> > > port despite it still getting to userspace and they suggested that I
> > > enable CONFIG_PREEMPT in our defconfig as it'll help shake out more
> > > issues.
> > > 
> > > This patch enables CONFIG_PREEMPT in the single RISC-V defconfig.  It
> > > still passes my tests (ie, booting Fedora on QEMU).  Maybe I'm too
> > > paranoid, but I still don't trust our port enough to just pull the
> > > trigger on this without at least accumulating some "Tested-by"s on it.
> > > 
> > > Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> > 
> > I can only give you a
> > 
> > Fails-miserably-for: Guenter Roeck <linux@roeck-us.net>
> > 
> > Not the new defconfig itself, but the new defconfig plus a variety of
> > selftest options. I don't know what exactly is failing, but here is
> > my list of enabled selftests on top of defconfig:
> > 
> > CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
> > CONFIG_CRC32_SELFTEST=y
> > CONFIG_DEBUG_LOCKING_API_SELFTESTS=y
> > CONFIG_DEBUG_NMI_SELFTEST=y
> > CONFIG_DEBUG_RODATA_TEST=y
> > CONFIG_DEBUG_TLBFLUSH=y
> > CONFIG_DMATEST=y
> > CONFIG_GLOB_SELFTEST=y
> > CONFIG_OF_UNITTEST=y
> > CONFIG_PCI_EPF_TEST=y
> > CONFIG_PCI_ENDPOINT_TEST=y
> > CONFIG_PROVE_LOCKING=y
> > CONFIG_PROVE_RCU=y
> > CONFIG_RCU_EQS_DEBUG=y
> > CONFIG_STATIC_KEYS_SELFTEST=y
> > CONFIG_STRING_SELFTEST=y
> > CONFIG_TEST_BITMAP=y
> > CONFIG_TEST_FIRMWARE=y
> > CONFIG_TEST_SORT=y
> > CONFIG_TEST_SYSCTL=y
> > CONFIG_TEST_UUID=y
> > CONFIG_USB_TEST=y
> > CONFIG_USB_EHSET_TEST_FIXTURE=y
> > CONFIG_USB_LINK_LAYER_TEST=y
> > CONFIG_WW_MUTEX_SELFTEST=y
> > CONFIG_TORTURE_TEST=y
> > CONFIG_LOCK_TORTURE_TEST=y
> > CONFIG_RCU_TORTURE_TEST=y
> > CONFIG_RBTREE_TEST=y
> > CONFIG_INTERVAL_TREE_TEST=y
> > 
> 
> Update: defconfig+CONFIG_LOCK_TORTURE_TEST=y causes the hang
> if CONFIG_PREEMPT=y.
> 

Another update. CONFIG_RCU_TORTURE_TEST=y or CONFIG_WW_MUTEX_SELFTEST=y
also result in hangs, only a bit later. I have now disabled all three test
options in my riscv boot tests if CONFIG_PREEMPT=y. The lack of error
reports in the future does _not_ mean that the problem has magically
disappeared. I just find it pointless to keep testing a known broken
configuration, even more so since doing so would hide other potential
problems.

Guenter

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
