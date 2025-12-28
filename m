Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3989AE784BE
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Dec 2025 10:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=505RFJyLGtG2qFu6cT3W1hJ42TjOuDOh/jltXuNcXGs=; b=1iSDUZM8Minr+b
	WZhuBmRujBt2CE36h8TexEoc21V47ce+Y9gZGDKrG9LBaPiy5i2pTs+GJi+KwI647FpxYKmjdiIwS
	pSEBdZERTLigg/kiZ/2W12/cEV8O0YrsAFuzUP18LROmiku89UcLCXBVkyZpRi3MHtpC9OJo6LOyr
	apEAofCtioq4KxcLNXDCDQRm7+/l/S8FIuiikZX6r6Je7OTF0kbynoXMQaTrJbf0ssijJn+cNUnR4
	12B4PjSkibOoI4mkWAFTQnbWv1wLWtjJmuQ/N/pCZcZMPVJcCl2GxaZ+OHzRKoiTwJt4YKmBneuYh
	XBfHOoCU9VOmmGhUkLRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZo5I-00000002dYo-3Zl4;
	Sun, 28 Dec 2025 10:33:12 +0000
Received: from smtpbg150.qq.com ([18.132.163.193])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZo5F-00000002dYG-2TtL
	for linux-riscv@lists.infradead.org;
	Sun, 28 Dec 2025 10:33:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1766917884;
	bh=4juI8+CNL0err5MO2vqKaa/2yYGzmUY2NVZNg7kqT8w=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=jeryTxn7GKY2364jezJiIaz+IHhY3xIq1JfXd/wSWEvqqVOAnS7+aijnxnepE40se
	 SmroOwsvLRvEhTUBUaqsOGow0oGj3DCHiIsOpYbQyZ2aPrUkxsjh5GVyfL2BYap5kh
	 oczxKjIVVTm45MivtcXgTGr50iTcCcCRX2dBdkRc=
X-QQ-mid: zesmtpip3t1766917875t195b4575
X-QQ-Originating-IP: COBzNePZhwIpXoBfs/bCvY7aRKmMMGtpLegvX3mcOlI=
Received: from = ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 28 Dec 2025 18:31:14 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5684403937810610960
EX-QQ-RecipientCnt: 11
Date: Sun, 28 Dec 2025 18:31:14 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@gentoo.org>, Alex Elder <elder@riscstar.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v5 1/2] i2c: spacemit: replace i2c_xfer_msg()
Message-ID: <86E3DC2399D2C68D+aVEG8iEgR4iSn5Vw@troy-wujie14pro-arch>
References: <20251226-k1-i2c-atomic-v5-0-023c798c5523@linux.spacemit.com>
 <20251226-k1-i2c-atomic-v5-1-023c798c5523@linux.spacemit.com>
 <fnyar6fvzqr3dw33wv6abg3plmj5p2tr75a45zmyrb765fmrm2@gkw7mupx4wdw>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fnyar6fvzqr3dw33wv6abg3plmj5p2tr75a45zmyrb765fmrm2@gkw7mupx4wdw>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: M0/UNHhZ6hMGkPFKdgToen6Vp6uEWmWe7Yh5Q0GxBZbIqdgtL8bTjmI3
	ALEflv97CWuNb3vLuaxhCQADM7biZX/QZGQ7I57u5s9ITXRrcd8nno8onIYVhrfeMhFIjeB
	1PpREx3oL3PJ5mXtknlI9Vutt79oCorVpjdIkPsD1Bu4KNmPYOesHRb0Mo8sj4lcgh0I2CA
	GzCwae1HIBa6qWq28fkwkt9IN1T1EUkEUaUADBli+wNnpjdvTFrzE7sf7ZiS8Va2cG8C9Sd
	LMvHPQDAA8WKfNQq+tzMlxATzYDrKn/Ryf/LcdH54sU+gQvngeEXgHGg7ZH4qJmTpJWn5J/
	SYWvtiBcl6D2LEz07wFUiQ6VU5LBs8qtFEuOQJOBhVtPGmDaLi5CQ/1gxPxELtPDcRDVR7x
	FFhy5dLGZAIiTfOMFSI/nc/nNj44SO9e/U3TnxoyloC0+wO4aFKtlJzYK3CQe+B8V4zW3Ts
	NMNYkvXWKTSkPwdP4FBQfm+nRGuNC7Rb51pWSEmrF7JvkaJW8y9Xu0FwnPjfqCJK631CJqI
	BKQ5A71KYWG8H//tDwY8IaVrS+ed/1pqha9SXbqiN+sVF/K1ExWHZwvWOX/v7LQnmFMR1Y3
	4EYD2N0EzPE26cee27WllYfAWAFHNnxe72I/zyBQM/TMa1+PxJTpmR9PT1A0d+ySDgnAFNk
	DqcsC46YN1aMugwMIziL1atSXQMYxvqBzIdryDM+C+RphInC0PNwryrs6djNu+kLM45/YvX
	bSvW1sxYafmeip1EjshhJVxZhGxizabCK9xD/4D8AFLSP9/P2aER1jBVg6PmDX748Ba5yEs
	soRHnuXATCgoIpCLdVBpbMg7Ly6pOTN5RrG+W7qy3Ss1VRGrLdvN2l2gizcMixFpOyYgpK5
	Ud4HiCVDp+c6mNGB5qtn9h1GYZYDXaw+L3B6FmZn/GbFcMFd4J5CBWGBCVnBNPHHD9H97ve
	NotasFXtcd7uXscpRqhlejOmPBTzcoO5cdtIGmbVspz6WznE4zldfeaTns8yHmjjV8ohyKP
	vJBYBCvoK6Ay32cidlnyixh5f6NDFHzN+5RdgHS26WNVW2XyCt
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_023310_645914_18CAE4A8 
X-CRM114-Status: GOOD (  10.09  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Dec 27, 2025 at 08:45:31PM +0100, Andi Shyti wrote:
> Hi Troy,
> 
> On Fri, Dec 26, 2025 at 11:31:10AM +0800, Troy Mitchell wrote:
> > The upcoming PIO support requires a wait_pio_xfer() helper, which is
> > invoked from xfer_msg().
> > 
> > Since wait_pio_xfer() depends on err_check(), move the definition of
> > xfer_msg() after err_check() to avoid a forward declaration of
> > err_check().
> 
> on the subject, this is clearly an i2c_xfer_msg move, not a
> replace, right?
Yes.
> 
> (if no v6 is coming, there is no need to resend for this, it can
> be fixed before merging).
Thanks! 

                                  - Troy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
