Return-Path: <SRS0=4kCy=UQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64038C31E50
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 17 Jun 2019 13:41:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 329BF20657
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 17 Jun 2019 13:41:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J+o2IRTj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Kn+lGOZ7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 329BF20657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:References:Message-ID:In-Reply-To:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5y6T7f808zuDlNVWRj0Kn1aHa5wHej8x/LBKkTxAfGo=; b=J+o2IRTjR5/3xfRRzn3LxU7AD
	PRUyW964Z4fMsYbtbqTunTdLj34TsL5JqXr+bbH5wDyuJESzaWiJUtxviW0ZVDQz7AwO5uqoykEiM
	BMxIg7R/YwJXAGOpGsDvA93kwhESUK3qwbYS5VpI6/1z1SbqEIsbSnvGBI5hYWx+ZLbn8Sl4AHlOz
	Z/EJtF4+11TdZUAq8xaHHyS4eLox8pC21FlQRNPH+Dh5Msg1FoMUtUCF34LpNhA4r6oEK0xM6wyN1
	ERojF1efyiX5j/OJZ2um1uyU1vFC9Me2dH5YPTYOgoJ16hva+dZuTesHTsJ/eRdf9mNzfIZ6EtFZN
	NO7WQDZ7w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hcrtF-0006D6-0y; Mon, 17 Jun 2019 13:41:41 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hcrt7-0006Bw-89
 for linux-riscv@lists.infradead.org; Mon, 17 Jun 2019 13:41:40 +0000
Received: by mail-ed1-x543.google.com with SMTP id z25so16218485edq.9
 for <linux-riscv@lists.infradead.org>; Mon, 17 Jun 2019 06:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=vGlWeDJVgt/HCDa4p9LgQEfZx6Suzg06DNIbXbvJS7A=;
 b=Kn+lGOZ7vVvCpgfOCO2EiJE2KHdTOfeCLZ1IhXbQcVa9hje8MSU/3+IqBzNLziuVf0
 ARvQxEK3XlxJy6AKjkWUQviMDbyYODE9+IwlTcKvE5kpZDjGZWnrmjupD1HpRytp97da
 x40Ea6MNkt8AzGALkxK3FG1QrT3wfoQF4vptv7Vqwj6TkuMe2cwQ1uxoRxkrwl9evZDv
 ZR0yx0xYk1cTNEN7vMXMipi6+VYl+ZNj+vde7GRPSpjkZT0LuX1+axsakXNvob75Im/x
 4lNEeeAkf9Iyi4WHGonzKaTJWQsxpoJmbkuiIozH3SYqS/nuvYUr/T9L91ABtiFNe017
 +Bhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=vGlWeDJVgt/HCDa4p9LgQEfZx6Suzg06DNIbXbvJS7A=;
 b=aMAyUCoUeF4yeeSDPzyrAdDZUaZD11ZAMK9Txg2appWUwaowJHeS5IrTDCX0reCn+g
 4ytBupcoH8aSdj+O6rvYEbrCi7vtSKw1qiAVRvK8BHvURtGa7/1C9vJTm75YRCgk7+dk
 zUjGmeWa/Vh4C78GeNtkuPZXL2r4tcbweddYPNHpMOCNhEgYV58HB2BN7G1YMdMebeIh
 PRzQcL+KPSbDyDPUY4ydiJ9is5AWYGUcJDtu95r5zNBJi4buMoQgHu2cgfcL/symC6qw
 cZMO95cD5pjUldOYcRHtCD3vu1BdeHcR8G9sjRwMN/Ge44Zb0n7dUhr7hP+3ij+PdXsI
 liVQ==
X-Gm-Message-State: APjAAAXV0m3fsn+cSCGMs3VtfQxHbHpmqDAHgk3ltRd95WrqGPtQuVME
 D1eHEGDuTNRgqXYUkPnhWPUFlg==
X-Google-Smtp-Source: APXvYqz4tW3YaIhJ89c0OKbSz4UhyuCzCYHr7U1kiT3CLBdJKatEEzr3c0wJJ1QqogJsHB/sw6ShdA==
X-Received: by 2002:a50:bd83:: with SMTP id y3mr102693531edh.120.1560778891444; 
 Mon, 17 Jun 2019 06:41:31 -0700 (PDT)
Received: from localhost ([81.92.102.43])
 by smtp.gmail.com with ESMTPSA id n15sm3712925edd.49.2019.06.17.06.41.30
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 06:41:30 -0700 (PDT)
Date: Mon, 17 Jun 2019 06:41:30 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Troy Benjegerdes <troy.benjegerdes@sifive.com>
Subject: Re: Working device tree for the HifiveU
In-Reply-To: <5D137BB6-2955-4D48-A18F-F06562AE502C@sifive.com>
Message-ID: <alpine.DEB.2.21.9999.1906170638480.32654@viisi.sifive.com>
References: <mvmlfy05xjm.fsf@suse.de>
 <alpine.DEB.2.21.9999.1906170347460.19994@viisi.sifive.com>
 <mvm8su05rqc.fsf@suse.de>
 <alpine.DEB.2.21.9999.1906170546100.4549@viisi.sifive.com>
 <mvm4l4o5qdd.fsf@suse.de> <62E04A53-803C-44AD-AAFC-EAD7D6BFE289@sifive.com>
 <alpine.DEB.2.21.9999.1906170626460.32654@viisi.sifive.com>
 <5D137BB6-2955-4D48-A18F-F06562AE502C@sifive.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-904878897-1560778890=:32654"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190617_064133_300641_702668B4 
X-CRM114-Status: UNSURE (   6.71  )
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
Cc: Andreas Schwab <schwab@suse.de>, Yash Shah <yash.shah@sifive.com>,
 linux-riscv@lists.infradead.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-904878897-1560778890=:32654
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 17 Jun 2019, Troy Benjegerdes wrote:

> Can we at least put it in some kind of =E2=80=98under review=E2=80=99 bra=
nch on the shared git
> tree so everything we need (including other stuff like GPIO drivers) is a=
ll in one
> place?
>=20
> We used to do this with some of the github riscv-linux trees.

Yash has already been kind enough to post his own test branch for these=20
patches, along with dependencies:

https://github.com/yashshah7/riscv-linux/commits/dev/yashs/ethernet_v2

If you want something more, you're of course welcome to maintain such an=20
unofficial branch on one of your personal git trees, or in a personal=20
branch of one of SiFive's git trees, if you wish.


- Paul
--8323329-904878897-1560778890=:32654
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-904878897-1560778890=:32654--

