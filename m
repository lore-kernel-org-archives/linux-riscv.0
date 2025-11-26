Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6826D10390
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Nov 2025 09:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=juIe4m0twm/jn7QdjufFjVTjgupKPZ4u+pccXg1p8A4=; b=t6Ps516/1X294g
	o9Z4JGZMZHFoHw30CA95EZ51+VMo6oaKulZEj7mAE0jarndB5PTT+1xH3fuPK9zCJxYrOij7F07gU
	Kt1tFhnuPyUa3Br0Gdk5vqky+e+37Ytex8sYLMR4ISdJoLfDWnk6Uzk2mBXKRiYh+Q+/jTflrT49F
	mH+QsKCLKdL0+FQ46Ke8ZAfrv0Ok/MeCZjPCA6Rl//DZoWVyjABwg2EayTUM8jJ8eb2NrgBMy4PvS
	cbWv/wjxYb4R/rCJ3kYKch7QUJYRL8eMu2T0msJiuzX0JheYesOkL/eJk1u82n52W1L9MerJ++uHe
	QjVnOvana1I2EfVFvimg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOBOy-0000000EfNF-1cOK;
	Wed, 26 Nov 2025 09:01:28 +0000
Received: from mail.vexro.pl ([141.94.250.70])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOBOv-0000000EfMB-1tWc
	for linux-riscv@lists.infradead.org;
	Wed, 26 Nov 2025 09:01:26 +0000
Received: by mail.vexro.pl (Postfix, from userid 1002)
	id C8CEBA8822; Wed, 26 Nov 2025 10:01:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=vexro.pl; s=mail;
	t=1764147682; bh=Q6Mp/vCJCiZNgk6fb7utkqIErbcoVoR/CugPofoeCtU=;
	h=Date:From:To:Subject:From;
	b=nPZKHQ4D+3LU65QAd6lqpmzj7zvPnvwcQmB39rh2MU1CVUkYFvm+teR6Tcta8Jxvk
	 foNg+CyJFaNwEDhYozr/WsfPQq5hymJWACWAVmj77dk9S8LoaiElodsGBwGolJfitb
	 JCXJYlYnbgieVp6HoaW1u80mBKjE4nBJWuibYu2JGk9ySV7tiPOvLkkoC0gGuvNnS5
	 lkIF3XMyrOGWpqN/auMzNQc/9VNytpoLdA+iJD9veR61aeFYvYBkEONi92TExWYnSz
	 DgxlvFCxTVo0k1IGPiwUgQMC+YL1nUUkb2f3c2IPMh/hSDVC+VyeQs8jYWk4ECJi6u
	 +Sv2Yolq9gwpg==
Received: by mail.vexro.pl for <linux-riscv@lists.infradead.org>; Wed, 26 Nov 2025 09:00:51 GMT
Message-ID: <20251126084500-0.1.ot.4m8hl.0.9bonk5mvo2@vexro.pl>
Date: Wed, 26 Nov 2025 09:00:51 GMT
From: "Adam Drzewiecki" <adam.drzewiecki@vexro.pl>
To: <linux-riscv@lists.infradead.org>
Subject: =?UTF-8?Q?Pytanie_o_samoch=C3=B3d_?=
X-Mailer: mail.vexro.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_010125_628228_936F6D21 
X-CRM114-Status: UNSURE (   1.70  )
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

RHppZcWEIGRvYnJ5LAoKQ3p5IGludGVyZXN1amUgUGHFhHN0d2Egcm96d2nEhXphbmllIHVtb8W8
bGl3aWFqxIVjZSBtb25pdG9yb3dhbmllIHNhbW9jaG9kw7N3IGZpcm1vd3ljaCBvcmF6IG9wdHlt
YWxpemFjasSZIGtvc3p0w7N3IGljaCB1dHJ6eW1hbmlhPyAKCgpQb3pkcmF3aWFtCkFkYW0gRHJ6
ZXdpZWNraQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
