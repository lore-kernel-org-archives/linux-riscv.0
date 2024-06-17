Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 456ABC27C77
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jun 2024 08:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HoVu+q6eoArbhMF2qvGc8uwQVC0ozYGvClGbM2D2/vg=; b=SXqYExFbANtAup
	2hMDYbza1o52ekhka3fdvN7/9DdqStF1OJH3oyX1dZr9/b7Y2zMfBq+Efw0QOeCanYINPcMJujvC6
	7fMforcRJ5L3SEDH/qZCfMWPmg7ragqp/aJr32L07jTKQ6Mi6bBxBcVOxptXKBqG1yHQ4L1SHfj0j
	VHCLtawicqVeFCF1cIU/b4ZuIymTU+Zgw73dR/hwLQ7FR8cUj4wyyK+DTQ5Xd/j/4IxA6hDVa816p
	hCUp19URnsKvm3PFlH/v+beUo/nmzxaOAg9Oy2yJXHKJ/ftQQehoP0TGzIo848jSv4u5XO9wO/pjH
	dPCxGVVE9SPE0cX3+iIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ7ND-00000009n0j-2yJX;
	Mon, 17 Jun 2024 08:05:55 +0000
Received: from mail.salesoptimize.pl ([162.19.245.89])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ7N9-00000009muF-3GTp
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jun 2024 08:05:54 +0000
Received: by mail.salesoptimize.pl (Postfix, from userid 1002)
	id E127B4614E; Mon, 17 Jun 2024 10:05:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=salesoptimize.pl;
	s=mail; t=1718611545;
	bh=u+y/L6S5UL+8vZAxwL74vV1B6m8M84m9zI1fQPT/Bfs=;
	h=Date:From:To:Subject:From;
	b=DCjNE3g5XWc5ONB2hvOgDQbQyuPQ2BxqOblcmLnnKUXYnkJDTKXw48IjMTvnWmn0o
	 QuWzJVpRYFY819b9KHfVbZRZdg7BFuL4/NWA5ITH+PdjY8lBMfB40FbPhCQkZAFnDO
	 Be+4k2ISWb+s5cWIBQWl3dGvI2ls2GjS2ucixhPp7ynx/5X+eIEkROXwFIamGBlzqw
	 2rK1uwU+pDynx0rUChWjeiYPZ4lYDmc+boOF+X+UxlpeYZDvFpgpalEKiRoIlP5ayD
	 00tKwpXLMN5++6CivBPM6wusviFoY3NyZ25WoZyYqccseebQmubEXxh3OB3dUBBACO
	 IGKistJpXYoqA==
Received: by mail.salesoptimize.pl for <linux-riscv@lists.infradead.org>; Mon, 17 Jun 2024 08:05:18 GMT
Message-ID: <20240617084500-0.1.31.oei8.0.h3smb28lra@salesoptimize.pl>
Date: Mon, 17 Jun 2024 08:05:18 GMT
From: "Tomasz Wawrzyniak" <tomasz.wawrzyniak@salesoptimize.pl>
To: <linux-riscv@lists.infradead.org>
Subject: =?UTF-8?Q?Odroczenie_zap=C5=82aty?=
X-Mailer: mail.salesoptimize.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_010552_901929_17A38AAE 
X-CRM114-Status: UNSURE (  -0.03  )
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

U3phbm93bmkgUGHFhHN0d28sCgpjaGNpYcWCYnltIHphcHJvcG9ub3dhxIcgbW/FvGxpd2/Fm8SH
IHd5ZMWCdcW8ZW5pYSBva3Jlc3Ugc3DFgmF0eSB6YSB6YWt1cGlvbmUgcHJvZHVrdHkuCgpNb2ds
aWJ5xZtjaWUgesWCb8W8ecSHIHphbcOzd2llbmllIHUgc3dvamVnbyBkb3N0YXdjeSwgYSBteSBk
b2tvbmFteSBwxYJhdG5vxZtjaSB3IHd5em5hY3pvbnltIHByemV6IG5pZWdvIHRlcm1pbmllLiBQ
byBvdHJ6eW1hbml1IHDFgmF0bm/Fm2NpIHd5c3Rhd2lteSBQYcWEc3R3dSBmYWt0dXLEmSBzcHJ6
ZWRhxbx5IHogb2Ryb2N6b255bSB0ZXJtaW5lbSBwxYJhdG5vxZtjaSAoMzAtOTAgZG5pKS4KClPE
hSBQYcWEc3R3byB6YWludGVyZXNvd2FuaSB0YWtpbSByb3p3acSFemFuaWVtPwoKClBvemRyYXdp
YW0KVG9tYXN6IFdhd3J6eW5pYWsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
