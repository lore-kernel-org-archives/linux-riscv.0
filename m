Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD3CCCF9F8
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Nov 2025 16:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IvjXGHQvbJx5IZOWMEnGlsopTveGYycOW9dFf838hbY=; b=YZFlQnUIFT7nlC
	Z6UYQ7FJ6b4k+0LE16o226ZFrP4vBbRL0KDRAGASZd2p0KXhnJnGQJVUXwrIPWMqB3d6OqX1/Nn/J
	OoDTmV5G3Q2qU8bMV/bLKJ7gLORzXaIrYTfhd7FAvWOE44oJUdLaj+4U+npzOT/+AVOcJHHpgIzgZ
	mKodCq5FgvxYV3OIO7qV7mdTc8tLkpM7tdeXcBELFFr216R69AhYMGsl2cuLkbooVHAjAtuTz/RQt
	JvUPuLwoZ1V4egasEeU+9OCak824D5MQVGntgGH/jvb8kmdqCX+n1hly9EJ3BybxIblP1WWugKzCH
	NgvCUvCovMPUF0FpNg0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGgIk-0000000E3nt-09Nx;
	Wed, 05 Nov 2025 16:24:02 +0000
Received: from smtpbgbr2.qq.com ([54.207.22.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGgIg-0000000E3mT-1ddy
	for linux-riscv@lists.infradead.org;
	Wed, 05 Nov 2025 16:24:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1762359777;
	bh=CrqcVvAlxdTVvK0bOKoV9e/MfkwpqFERHSk564OJ9+E=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=lN9PEceTPUezqu0bHYKwrhbeMqu7L/jphAatx/BcPSTiSDfqR+zv2Sq4xSd56liaT
	 FnKQekae7JfH8OyKD7u7xmBiN0XiUzydE7s0GeVQgqpMqDonVtRThHHvPZFm0o9hkJ
	 Tg9cuFD2LO2633lKmz59VSlcb1lNyUGtjEVDl9Y4=
X-QQ-mid: zesmtpip2t1762359774t5a699fa5
X-QQ-Originating-IP: T0kQ8LzCYEveQBPnZ+ZSWwym2FwrqldE+02gmCjFqUA=
Received: from = ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 06 Nov 2025 00:22:53 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14411868300707364731
EX-QQ-RecipientCnt: 11
Date: Thu, 6 Nov 2025 00:22:53 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Goko Mell <goku.sonxin626@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Yixun Lan <dlan@gentoo.org>
Cc: linux-sound@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH] ASoC: spacemit: fix incorrect error check for sspa clock
Message-ID: <83447AACDE00EAFC+aQt53fZVf6vMGsKY@troy-wujie14pro-arch>
References: <20251106-spacemit-i2s-fix-v1-1-ee2cedcdda23@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251106-spacemit-i2s-fix-v1-1-ee2cedcdda23@gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NhdiEwnVOUqEJmDCCN1QjuRE56jEleok/TDTIWYYNwFgYH6Y2w0cIvCx
	Kr6ga0sKamklztWryTB5WjSNiNi9ZLjS2ERAXSAfCNtQXDmxxA4A1wcX0J1ZCRmUy+uNQap
	vY7UnBbGjh+cP69aWOGX7wsr3424TlCBRis6g7e+lS4PTP83yk1NTDnokDCwAu1wXIlwroI
	PyYliWzDncF9Wa0Kmlm+d1ce7Ek2EhtO9M9TRqxus2v8mILdNEaZgLeKnUJm3r/HxekZURc
	Gc/er11/xlQtDvqJNBmmYr/G3uhRlnbrMNqGdGbpHXgHT3BmsYIE43Cwos7bWkIqBg45pCQ
	/A18QuQBffMXn2C5uVyBxB6ghdnpcxoM4T71rFxFUbPqaOCzxBdqLCW3EEc6fhThDpa45au
	v51+m9L7ugeebThjmH4LeVACX8hBMHjdzv4PjunBVogzYfdSWqcdfNbVSmOEmE/NrP4CT5V
	9tHkN22d8l6tHXhhJonPFBl8OeJGpNf9XT1sR4AqZ6wwVOhQtbx5mNpjpkeNmcrjQw84nlH
	lAwXw3AjXlGyAHJrfWZ+d/IVMUbP+AbTugtxVmc86iXoC62uyn1OrLdktlvqKqUn+Ol5H57
	EAdJuqZLL5NKKDwJs6aG+c/c5RG6AZWsoi3spP7OMcv/wBhmc6+WPs1h8tHlkgkW10NcJEF
	L7Vwn1y0Ka376OjINgWLlcKRQdojcqyBoRgntdz5kVn0HUZBI4Ycfc31ZKK5m9c95M8gekW
	6S9ppJRIc7/5H/dPyhwvVC19yShbi86/Yx/BYfvfMSddxkvA12PKzvzmWUr+DtzzRAtrh4T
	EOXpTy4chob2N5Jj1D+54zoAFwVFyt/WBsI7xylLqlWCTGUfj5P9YmQ40Lsy2+nFE/VNqct
	qKCZ5glRF0gcEx91kXHypeyaa4aUJ/Ruivw5QA54R0xazBxEUDlEB3cX9sH70g+NUxH9Jup
	vCzNCoC11srcQgtyYLcevHCebNHBtlNgL5Oi4vepDpN8pzPehzlXIxm76WubD7JNrSalH0h
	wDtssZS2TLVxQzPhe0O1WCg+FKQoA=
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_082359_730026_B3727202 
X-CRM114-Status: UNSURE (   7.00  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Nov 06, 2025 at 12:03:16AM +0800, Goko Mell wrote:
> Fix a wrong IS_ERR() check in spacemit_i2s_probe() where `clk` was used
> instead of `i2s->sspa_clk`.
> 
> Signed-off-by: Goko Mell <goku.sonxin626@gmail.com>
You lost Fix tag here.

           - Troy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
