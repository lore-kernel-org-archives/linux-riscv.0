Return-Path: <SRS0=cI7w=RZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73EA9C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 Mar 2019 06:16:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BCCC218E2
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 Mar 2019 06:16:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UjERgbn7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="rBVvzFvk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3BCCC218E2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4vSVqSLccw/u3bhP6uj67ITx/giqBdP+/XRA0BBPcAw=; b=UjERgbn7mjr4YS
	poSHAdrKS9YKr1hS3jRJPy5f/aqb6byf50HG+AIQ8sven1thbn6pU7Io3VKB7sFZJNNzFFfqW3TEF
	XQJW75f3p5taRRoZ3CGMJFfl4LshAE55RZH+tZ2M1SJEcFixWLAyLMzNhMtr5T7GuZjFY1r2nWyGu
	mzw8fwSmq05Czl8KNcCXEmtfbkPh+Zjgym1rQ2ZW4zF/Xt9GkdUvP9/VKkZgrxqbIEXGcdHw8inzp
	oLy7nc01iMuC9ul0Xjb1efsgOoKtIcUplZO9x7mQZTSAECw0rELaXNf2EzTWXjhNRe1fjTpAVDXYO
	hpQSE6M94vVC2XubahDQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h7DTt-0000ga-AP; Fri, 22 Mar 2019 06:16:41 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h7DTq-0000g8-Pl
 for linux-riscv@lists.infradead.org; Fri, 22 Mar 2019 06:16:40 +0000
Received: by mail-wm1-x332.google.com with SMTP id v14so941751wmf.2
 for <linux-riscv@lists.infradead.org>; Thu, 21 Mar 2019 23:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=w/ak6DZsn9K/hfk8o8uWUGk5jkP5ay1BGmEEE3QNKiQ=;
 b=rBVvzFvk91FAwoZLtEBk5VqDLHLUO0BVTBQda5RDXhtXbwlutxBwqsObOpQ1BMXN7h
 DBuxJ/Bi7xhbf4/BDcpo3V/ledX8zhgR2qmDxdIPnCYYtU14Qs0kk/i2aW+KOwIi0mYs
 VzH5Cp9O1xEuu/4VIKMHapndkYvqaMQQeNA9vbDag5bydw0ZOm4Ea0O4X8HeczmS8MRV
 OOhpD38KP8E4+6VLSQvgG/4/waLLCpaumi1+WxYJqBIIRHMwIgPzdRWCNM1coM3bcg4a
 V/zsNH0E4xmyLB5JmG9h9p0SK4Oa3G5si9tJcCVaRfJAulfD6gdliauBnSL0kuDJvwsM
 PPFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=w/ak6DZsn9K/hfk8o8uWUGk5jkP5ay1BGmEEE3QNKiQ=;
 b=plMz6p337Uy5UO+iNXubVTUJjiLsPuTIxrUwgkV9ekl4CN6Vtehk7qsZHF+9GNprKi
 olqza9SP8JnM/C/SunFOfjEVk5XJfnTIqqOzzwHQCU81q4Z4Jb3mb03hKjekkD91OMDn
 iPbWLu/ZR/g+qJ03XsDlxe5Xr6rII7aEN2iJTws8WpqmHyTbui1ar4onTEd0le3TyHjC
 NzLHpsojmWZ06QuLQpRn1HSqY/2vY6cUxHO0QJ+uiPqZ6S0KvVd7tFJB83hCKJq2xNDU
 YkJ3dBqxHj/u/OO/jzuLld904oTDDSOhBylISnXIGe1kwDyw2MhjIgiQ9Yz37Wg4+okT
 Bx7A==
X-Gm-Message-State: APjAAAUEG6XflDy8KTE04vgFCSXW3P9k2cqLA3j50LrfqMSLycWFIr8B
 eQ3zCSd7aOYpRFzPP89ugaWMm71mJUh2TvHorF15nA==
X-Google-Smtp-Source: APXvYqzEd1/2shGn7m9yTpQO1j7+14Z43CgWZdd7d4cs8qZl/0t6Y1p+ynvJatsFgm+lGmCGRSMtoJaOSmz9vhcwRDY=
X-Received: by 2002:a1c:1a46:: with SMTP id a67mr1632094wma.21.1553235396257; 
 Thu, 21 Mar 2019 23:16:36 -0700 (PDT)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Fri, 22 Mar 2019 11:46:24 +0530
Message-ID: <CAAhSdy0mUboGJH_GJbsGFBwcukjttVQcTGfzwkaMFQb9ZVY4Mg@mail.gmail.com>
Subject: 32bit kernel is broken for Linux-5.1-rc1 due to GCC cmodel=medlow
To: Palmer Dabbelt <palmer@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190321_231638_887319_7F9A6E2B 
X-CRM114-Status: UNSURE (   3.18  )
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>, Anup Patel <anup.patel@wdc.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Christoph Hellwig <hch@infradead.org>,
 Atish Patra <atish.patra@wdc.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Palmer,

The 32bit kernel booting is broken for Linux-5.1-rc1 due to GCC cmodel=medlow
affecting setup_vm() movement from kernel/setup.c to mm/init.c.

There is no issue with 64bit kernel booting.

The "[PATCH v2 2/5] RISC-V: Make setup_vm() independent of GCC code model"
fixes this issue.

https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1959102.html

If possible please include above patch as Linux-5.1-rc1 fix.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
