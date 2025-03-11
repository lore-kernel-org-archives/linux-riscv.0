Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA78C28B2E
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Mar 2025 09:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+l8slE+SI343KaLdmpnDkeT3i/savhnVPVQ1UGmBs+U=; b=Zr/hmFZ4NdtvlP
	qFCWHcCWHk1mu4E2YWnMq0U++28Mpn2QmRilPo9XDkO+y5icDYuBaeo6ROZcCaQ1RYn0o2kN7oXFQ
	6AXLxLv7KrfjLvUha6neriYQH1TtqNt4BBFD9NdITxQXgAelEciRgzltZJ322nR5JmqJe9zs0B7L7
	mFxuSfkPnlYikj/IgqbjC4RPbs0FEgda8/mFfrY7FDsYh3ZyWrR5yrQXRWUSGHnT9XM6xbyDhvY/u
	vBBJYXspcgFBxadfRok01vI1NCzTwUAhNXEzz0P70W4rMA8NigcwLx9r7lxnZkT/H+oNw8jr6oKIC
	baHFdIlp4yvQlLWENXGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trvhs-0000000572w-0Asi;
	Tue, 11 Mar 2025 09:15:24 +0000
Received: from mail.completesolutions.pl ([51.91.254.67])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trvRm-000000054DT-26J8
	for linux-riscv@lists.infradead.org;
	Tue, 11 Mar 2025 08:58:48 +0000
Received: by mail.completesolutions.pl (Postfix, from userid 1002)
	id D3BE8253D9; Tue, 11 Mar 2025 09:50:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=completesolutions.pl;
	s=mail; t=1741683077;
	bh=w4+HQbQP74/lcux9sCovXIK7fEvSRotrOw+Jrj90l5c=;
	h=Date:From:To:Subject:From;
	b=oj2xu2NctJ4BqmdfUEQaKlbfw8MsqAeYiRLQx46VENS9Oz/VThhRqomc+jLHYXxqS
	 /XwfC9YMeXT1k22IDYvxNg9pxxqm+FVtt0CmM7/hBtSJnEEOiE0LFXP/i1KWlsp/oG
	 H70VEQfyOV6bzE7JFBJAPS0wqWoYpcJThnw+o1jALKvYvFkOjyMKwhCCB4oCH4o2gI
	 hlzVz7QD8KCtmZaobwyrvB020dozwEDlzWshpCzF7DW1pHjmwibh6ctMgS9iECqi0M
	 HuR+caY4Bwkzon15/Px2cSDJBI7toYq7ykWTM1BZ6FAvFOQDswcpjxsr9/2JGYXt4p
	 8SARpbj62z3Qg==
Received: by mail.completesolutions.pl for <linux-riscv@lists.infradead.org>; Tue, 11 Mar 2025 08:50:37 GMT
Message-ID: <20250311084500-0.1.gy.2nh84.0.2cbywks4v2@completesolutions.pl>
Date: Tue, 11 Mar 2025 08:50:37 GMT
From: "Marcin Gard" <marcin.grad@completesolutions.pl>
To: <linux-riscv@lists.infradead.org>
Subject: =?UTF-8?Q?Wsp=C3=B3=C5=82praca?=
X-Mailer: mail.completesolutions.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_015847_229356_61BB1389 
X-CRM114-Status: UNSURE (   1.33  )
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

RHppZcWEIGRvYnJ5LCAKCkN6eSBpbnRlcmVzdWplIFBhxYRzdHdhIHBvenlza2FuaWUgbm93eWNo
IGtsaWVudMOzdz8KClpham11amVteSBzacSZIHByb2Zlc2pvbmFsbmllIHdzcGFyY2llbSBmaXJt
IHcgdHltIHpha3Jlc2llLiAKCk5hc2kgcGFydG5lcnp5IHp5c2t1asSFIHN0YcWCeSBuYXDFgnl3
IG5vd3ljaCB6bGVjZcWEIG9yYXogemFtw7N3aWXFhCwgYSB0eW0gc2FteW0gendpxJlrc3phasSF
IHN3b2plIHd5bmlraSBzcHJ6ZWRhxbx5LgoKQ3p5IG1vxbxlbXkgcHJ6ZWRzdGF3acSHIHN6Y3pl
Z8OzxYJ5IGRvdHljesSFY2UgemFzYWQgaSBtb8W8bGl3b8WbY2kgd3Nww7PFgnByYWN5PwoKClBv
emRyYXdpYW0KTWFyY2luIEdhcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
