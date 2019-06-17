Return-Path: <SRS0=4kCy=UQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 678EEC31E57
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 17 Jun 2019 10:34:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F8E220863
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 17 Jun 2019 10:34:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="izeMjhmD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="LAo19ge0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F8E220863
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4LSPmv9pdM11Bl8XYAdcg3F2VC/SGzivICeWVlUg9pI=; b=izeMjhmDL85hE+
	pHljMxMvAAaObcCFOSAgoGgdKHuKnCEqXQDfMsHWTmAkAEup14JAqANgvxkpvpg2zZzKCmNcYfvYO
	7uKb7SCQWMoGy8CxvunvBSaNTMmD9smXlEZyc6sJ6kXUI+gIPVksGC+BW/MMdcded7+1SGPum6htx
	Tpkw0rnSAjOBEVa26h+e7ft5gkZGqEhniI/yIT9JAQ6ydzFMLPcvcmB2sN4Kj1osmPk2LUFTK1WGw
	EKwMNLlsqkBDxa9OInBVeYGn1t3kefgCLoHSTO8IpkbwPAXhjD5K5CVE2XlwLjQt6UtoVJM1j0uVG
	6CgGnJjouZDbWgvNl7fA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hcoyC-0003sr-BM; Mon, 17 Jun 2019 10:34:36 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hcoy9-0003sM-6l
 for linux-riscv@lists.infradead.org; Mon, 17 Jun 2019 10:34:34 +0000
Received: by mail-ed1-x533.google.com with SMTP id e3so15387010edr.10
 for <linux-riscv@lists.infradead.org>; Mon, 17 Jun 2019 03:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:message-id:user-agent:mime-version;
 bh=IQHiXQJSyaAV5xE4fH6nTw8aRdfXeN7Ir4DZSrsaBRs=;
 b=LAo19ge0oueK7Pb9Mh6fY6g9xhXPlzhpzg00PvvOQNEOJlKM5dmIGkp5dKoHJFzPhY
 pkEg+I3vfPjhenjxfJE8Zv7ReGrAO+aX0Zm7O5opNWIMsvzLCyeX+0U3q9xlGhc6Bqgh
 6AeVHADWajHUXo7Eylkx8Jpk8RSifjvomQmYiWuS1rY7HZudFs5G76U3hB/nynncyhZ4
 gO57tqu3rM/qam5Qva9y5VXwZ7YmWaMTgxMtWJG9+GTgwR1c20z9sQf6Q2nX0hJOuorU
 ekklCgeIzBkLJ+/c88SPXiUN79UsgVWde3MF2fUhMILmCBXSRuKgDdo3vWtkejG+fUl6
 odyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:user-agent
 :mime-version;
 bh=IQHiXQJSyaAV5xE4fH6nTw8aRdfXeN7Ir4DZSrsaBRs=;
 b=Pfe/xqrIq/EQPRg3agPYRtpsBNZK40hli5iqEQC6+0u+sS6kZKf7MmYK10lL9zVNiK
 MDgHX5C8A1hgRAZ2lywIYPozeh0HaY6zJ07rI7LcX0uompMUMpDdYnc4s4wgHcJisWZ+
 Cz2nCBSobrudLzGIAAXl6psbyrWeBAv9FbAv7KbsslGHF+7fLMi20/nZx+vIru9MfqBY
 rHDXkZBvFNsRTH95jJ3yQ1c/dKtWFmEYI9Isg2GP6XL3zDy7gCx4oCtdNNDOvcFCX6qh
 9KDtvpq0ENgPUutCXlloV5hY1Ya2WkMyRTEKeJTK9HDuy25c8UmhSRMKHtvqASKHcUDE
 UAfg==
X-Gm-Message-State: APjAAAXRx4DWb/fJYQ0xBpG7k2n86h5yfSMk2e6sHcjE/H5e+iIbZtSq
 XLIqRM3IE+EfHQFBQ0o3gYYcPQOmIr0=
X-Google-Smtp-Source: APXvYqy3d1iaa6HtQHTLE3Kz4tHzeC9MSqQO02NQlJ09h02lhoTJpjm8sgugnb/hG2KbYLb5z1o4SQ==
X-Received: by 2002:aa7:c486:: with SMTP id m6mr53013807edq.298.1560767671139; 
 Mon, 17 Jun 2019 03:34:31 -0700 (PDT)
Received: from localhost ([81.92.102.43])
 by smtp.gmail.com with ESMTPSA id x30sm3581943edc.53.2019.06.17.03.34.30
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 03:34:30 -0700 (PDT)
Date: Mon, 17 Jun 2019 03:34:30 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: linux-riscv@lists.infradead.org
Subject: New shared upstream Linux tree for arch/riscv
Message-ID: <alpine.DEB.2.21.9999.1906170320300.19994@viisi.sifive.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190617_033433_250384_33BB5AFD 
X-CRM114-Status: UNSURE (   4.25  )
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
Cc: palmer@sifive.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org


Palmer, with Konstantin's help, recently set up a shared tree for 
arch/riscv patches at:

git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git

As with other kernel.org git trees, it can be browsed via HTTPS at:

https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git/


This tree is what we'll use for upstream-bound patches going forward.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
