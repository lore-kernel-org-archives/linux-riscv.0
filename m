Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B3EE784BE
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Dec 2025 02:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dP4kSEp2Rhjj00dh58gizPnHKRk4quQdIFC/9XUu0VA=; b=kyEOChBVL0Hj4C
	DIv3d/vfG/eZc98bhz6u7yB8pfjrZdqDQU+FFslzfixrF4oOBX+GE2ltedmcOWWzEWi8xJ0cJHFlk
	w4kSzt7n6/rQgv2R/seJa1wqX9cNZy1YZlnUIbusODpG+p1jPXHQSey8UqLf/muT7dA/I0GwJ4Cso
	Htl9Ga7ESb3I+GG35rgnJojTo4udipLdU07Llwbz6LkJlwqDGdR4usaKE6Sk5rKyYwlg8tyebrzzA
	bHQnf8xbzy0qRP+onQarrSZdu6+DepP5LE5HuPdZTPcwuR2BRXI4iQ1o1zgLtOpjFLvIaxP36Rc2a
	Ku6hWRzX7dRHLKlPb3Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va2gp-00000003Dhd-1476;
	Mon, 29 Dec 2025 02:08:55 +0000
Received: from smtpbgbr2.qq.com ([54.207.22.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va2gm-00000003Dgr-3Eob
	for linux-riscv@lists.infradead.org;
	Mon, 29 Dec 2025 02:08:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1766974065;
	bh=PQImGFjWOUyAK1IDHTVdJv3c+SXK+cKNa1d2Bg+qzF0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=CTVgvUJyYaZeGjZC/u4hjDTwwV2zC7HCIHFsxhEe/UoIH7/rKKcTegrTSWdQ00r2f
	 6Q5JZmLdHIVLW5rYWaEwc4pj42rO3ChoL/AEExiQGAwUuIPZZnvRbwh2wwABX6/4Fi
	 54lkRtye26qaWwj5Ym10cDC6Yz6WdKTLNrdEK1+0=
X-QQ-mid: zesmtpsz2t1766974056tbc048f24
X-QQ-Originating-IP: 4ECW4Bo3pMvb33vEOeyUaEHe2Q3GyIVA8m5u3tnBJRs=
Received: from = ( [120.239.196.19])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 29 Dec 2025 10:07:35 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16099099167800225801
EX-QQ-RecipientCnt: 11
Date: Mon, 29 Dec 2025 10:07:35 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v5 2/2] i2c: spacemit: introduce pio for k1
Message-ID: <6D29D0765AB5632A+aVHiZ9Wph0hNzqDY@kernel.org>
References: <20251226-k1-i2c-atomic-v5-0-023c798c5523@linux.spacemit.com>
 <20251226-k1-i2c-atomic-v5-2-023c798c5523@linux.spacemit.com>
 <86c5e338-e630-4933-a123-cfa1201495ed@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <86c5e338-e630-4933-a123-cfa1201495ed@riscstar.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MtJoEQFRGvIzjRIpniR076rR5J1pEXAcgJ2vLhffiUUfkbJ14q8rJ6+x
	FutnnVzxbI8qxvGlMFgCobaEGw0Pqqaemdb5E52XstXPGrN321lQxV/C3pHskddpev6m6iu
	OiaVYLonevwiaudytfv6cwNQsc9hGqa0LizAgPhiNisM6s0biIurXr0xCOySZHdLd2BGLyP
	YPMyCafe+hZKaf8hctd03VbZgm/v5Hl+znhKLv0CKY/Hp4gUm8t+4FjhLT8VmWQ9L5HY1Xo
	YJphrGl1BNhgfvG5fJovAsGq3VNypF5hIwcA8eg6CllVvwHzTwxw4DFYv2UFBiTNNFrrR3z
	PkGd6gzwOV/3xn2CUaUqt9+apGn9k29lq1Iy3jZpfb1oFRAjEdkN386WRiO3r1+gtpS30ex
	wptS26mMi7J+mIVLDDpNFUjhr+rpIGWm9QVnuCiRfyx1+6Y3uINAc51i/uRarPGXVQ8NMyK
	h1M6Uzl1/9UiG/OfnCWO96txuN8ZnVtk3wjir486V2zusG9N2WZ7tx4ynNvae69y1bB6OrH
	8ir3TkZYYt4cFYekwcl9vw19cwhI9kW7esKduKG1+odz2FZbqG9eYcx2R2zDQUqUQDU5Lco
	AtuluTMUsYG2jNxR52pZNHvG58W39sf0OQ5QSVyOTLTNjRDLCPr9SV0j5+m3g2wICCY5ITB
	JM2jAcgF6mEkjoFRHifmZy79LjwJNzLyjo9VobvEdep+fbrfwfVB0xUybUY9dUt/9rp/o86
	2TYCI7D8xgmoSvM37pDxXTf+YNkJCef4b+uRM+z9cQ8iD6Z/bRyU9EIZ6AR7NDfHt+HTTCd
	fj5vptzmHPnXxopoS+qO/1vP78Jsw361oOUnUiv281Yzni2Rukh66rE05lW4pisWIoXvCPv
	KSc8SIXDEEWwwJK5/Wd2r1rNvycmy7khyeYK1LI1p4aqouqup3GbTM5JP0BMC2Lhnu43dF7
	ABkaeHd9/c8h5wywjF0ZvuNxcca7FZtH1LRP1h//9QOjo3Uh5GLuL3jH+K8EsoUCz+bDqD5
	7TvLr9xiW1zdwdhHqis4u0ed+wmRn2gPMk4Ezcg6Xke1oL/AVVKUs2xep+HmY=
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_180853_665106_16B09101 
X-CRM114-Status: GOOD (  11.06  )
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

> > @@ -474,6 +608,11 @@ static void spacemit_i2c_calc_timeout(struct spacemit_i2c_dev *i2c)
> >   	unsigned long timeout;
> >   	int idx = 0, cnt = 0;
> > +	if (i2c->use_pio) {
> > +		i2c->adapt.timeout = msecs_to_jiffies(SPACEMIT_WAIT_TIMEOUT);
> 
> Again, why is a rough 1000 millisecond timeout OK for PIO, while a
> fairly precise timeout value based on the number of bytes to be
> transferred and the transfer bit rate computed for interrupt mode?
Sorry I didn't see this.

In interrupt-driven mode we wait for a single completion event, so the
timeout needs to reflect the worst-case transfer duration to avoid
spurious timeouts.
In PIO mode the loop is driven by FIFO/status progress, and the timeout
is only a safeguard against a stalled bus rather than an exact transfer
time.
Therefore a simple conservative value is sufficient there.

                                  - Troy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
