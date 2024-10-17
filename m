Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A42AD2F7FD
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Oct 2024 08:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=z/zPbP+ZN3r08t/h1RM6U3AZ1VUtr4BGofg2NS1Pxic=; b=3/ZOcyxfOz1+89
	Jc5UUTqiho2ChwfqI5DzAWySoHy4fjSoiZt68AGF6bDVRTxz+A1B9aTPkc2iEXVos36KgUrN4F70L
	PY2CMgzrdz4Fk6huTXL5ANkUsUJaQDMpYQV8ExacOTf1EGv3dOIuk8crccO4ITYX7ExopDzbSs8Qc
	itoSzn/cvm6qbwfYUEazhctcjJSXve4ODIC87uW887UdmcV81LBH4bg1mK35Fig5set4yU1YwpM9S
	cYXFXvUaQTBXKLRC+RTTpKHHEviMWaSLPgIhi6JMAcC4Z4O/CkEqZs7em5xWobTz3B8edgXeUnH6m
	9Q7tbLuKEPRmndZDs8pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Lho-0000000E9B6-3Fy2;
	Thu, 17 Oct 2024 08:18:00 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Lh6-0000000E8sH-2FeS
	for linux-riscv@bombadil.infradead.org;
	Thu, 17 Oct 2024 08:17:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:To:From:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=dqx6etWJTU7o7oR1uR2aRBCwaPXPl4dirwwzUCFBDcc=; b=hAGs9E74rGReBdDXvNpTiXjuFW
	hswFc9+U2erEsRccC0pvDq3GCtON3mpxPg9uue7MAo4wfPZKWieaIy0LhATMiSLMMLCHFTp1M4yHd
	jnmYSubcFDnkh8INq1+SAXc5cJjpf+dUw8v4oSmpeA1jDCSU/G355EmneZi2UupnKrXfWHnAjuRSd
	KNXVbRYGxh479L0p3Z02aENMJ7yWp0Ckx/LvYjM7BhJHpEjQRduaYikVFqL6PYKjaiw/JMorHhx8R
	EzEjv1G32R+0axjNjkz2SVH51rUxizgkZzfXyMht+JfLAfvCeywmkrcNNv4YRTA2i/nG+6P5OemjN
	YPqq6uNg==;
Received: from mail.completesolutions.pl ([51.91.254.67])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Lgz-0000000AVIl-3BUn
	for linux-riscv@lists.infradead.org;
	Thu, 17 Oct 2024 08:17:14 +0000
Received: by mail.completesolutions.pl (Postfix, from userid 1002)
	id 7DCFB2634F; Thu, 17 Oct 2024 10:16:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=completesolutions.pl;
	s=mail; t=1729153016;
	bh=dqx6etWJTU7o7oR1uR2aRBCwaPXPl4dirwwzUCFBDcc=;
	h=Date:From:To:Subject:From;
	b=qTXRyiGJV2E2YlDkQS8AWh8voYpA+EjhK6bTwquASlHbf2FQ4MS1p+v/qW13fafN/
	 WyqG8FKhN/laQRUB2x0u/Zxzei85pJ7f7eUFDPQcT25SmyH3P3JRM3nUkGklmPf9m8
	 9t8kfPRIYKaCnA1pVc/HXQj6LrVabu/yUdywGw3yF5f6vXoXOFeKy+1bC49l9LY6Nm
	 BFBRkFyT5lJ3N4DaWkgf+DC+XbThSvG+9IGPMp4OmHhjTduYCFPMakdU5Qma8+lTkQ
	 9K5F+rUUJAMV6+Fo2au6dzmOwt5GEbIR7BUDtZaaM0Mq1y1zELiLHSymtTK1X/H5n7
	 YoMCrPi7GX7LQ==
Received: by mail.completesolutions.pl for <linux-riscv@lists.infradead.org>; Thu, 17 Oct 2024 08:15:44 GMT
Message-ID: <20241017084500-0.1.e9.1imas.0.lm1dryiwen@completesolutions.pl>
Date: Thu, 17 Oct 2024 08:15:44 GMT
From: "Marcin Gard" <marcin.grad@completesolutions.pl>
To: <linux-riscv@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.completesolutions.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_091710_844180_FF4EC5F3 
X-CRM114-Status: UNSURE (   0.24  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RHppZcWEIGRvYnJ5LAoKQ3p5IGplc3QgbW/FvGxpd2/Fm8SHIG5hd2nEhXphbmlhIHdzcMOzxYJw
cmFjeSB6IFBhxYRzdHdlbT8KClogY2jEmWNpxIUgcG9yb3ptYXdpYW0geiBvc29ixIUgemFqbXVq
xIVjxIUgc2nEmSBkemlhxYJhbmlhbWkgendpxIV6YW55bWkgemUgc3ByemVkYcW8xIUuCgpQb21h
Z2FteSBza3V0ZWN6bmllIHBvenlza2l3YcSHIG5vd3ljaCBrbGllbnTDs3cuCgpaYXByYXN6YW0g
ZG8ga29udGFrdHUuCgoKUG96ZHJhd2lhbSBzZXJkZWN6bmllCk1hcmNpbiBHYXJkCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
