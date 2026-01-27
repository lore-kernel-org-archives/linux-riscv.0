Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7943D2FEF5
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jan 2026 22:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZX5QjiPSuCp3THtLoumyXhwAi49vUsTiFEJETFMf56U=; b=aLbpXwGx9eBygr
	KeXRFwQDYHP2OUjKaR5gdWbzpAPw4/1/eBCNKOsBBkyuMV/PIgwZ4Q3mNSCo3ba1nCcWnyOf7PQLG
	njpTEyjbL2z1bcYwam8BmBknCaAKUJz0zsXaSJJnjVAcQMezWPX2WBpcexYjaDkty9tA2cWhns1pt
	iOagzuKdMXojwuQm6+8rkJ2YFownN8FsbcsYTXUOvMWEuhwbrrizCZFy1f3fR5hMxj+tKvUpvIss4
	1ix0DjIQFNiG3sOk7QhierQhcZPqiCHeQaq3hikpnl5mICCHVWRerCkMQC1HKh6M6wzKNPkWrNF1s
	wvo4jPYh5eANcX38CckA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkrul-0000000F8Xf-1BC9;
	Tue, 27 Jan 2026 22:52:03 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkrug-0000000F8Wv-1trj
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jan 2026 22:51:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=XoNz+bFESqiIGSGAFsK2z8pn76uXh1Dd/smWOqdRSI0=; b=MyelrmZNPP+LD/KVFoFjD5qoxK
	AO3plmelrpHz1/VyoszrfNftC+XWnYj5wNJxWp3OPjESIEFayi7M0PYJSmf2R9LshW2qIDGQbEpd1
	kJWNzE0D0dk+PU7x5OaV0KhDqUrw/muicVeHlGShOJOAf/JkgiPOXj4OiFhHuqQv2O8roITFutrRR
	ZDLGsFBhrVKBcZae+j2cLAeBZxPBpG8JWgn1HGlsp9T+0Br86AJ9n6BcMjsFlNsPI3kSM/1OWeKQO
	6EdbqDfBIzC1s9MiG5T4CvROj26xi5KOooUAVJpNRwGTe2URat8P9HgPedYN7UGFHjMUC012it/Ql
	Y0uLXUPw==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1vkruN-000000045up-2NS5;
	Tue, 27 Jan 2026 23:51:39 +0100
Date: Tue, 27 Jan 2026 23:51:39 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v6 0/2] i2c: spacemit: introduce pio for k1
Message-ID: <aXlBe1CHq_HbbpCR@aurel32.net>
Mail-Followup-To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20260108-k1-i2c-atomic-v6-0-41b132b70f68@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260108-k1-i2c-atomic-v6-0-41b132b70f68@linux.spacemit.com>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_145158_519140_3A65CF0F 
X-CRM114-Status: GOOD (  10.26  )
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

Hi Troy,

On 2026-01-08 15:52, Troy Mitchell wrote:
> This patch introduces I2C PIO functionality for the Spacemit K1 SoC,
> enabling the use of I2C in atomic context.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
> Troy Mitchell (2):
>       i2c: spacemit: move i2c_xfer_msg()
>       i2c: spacemit: introduce pio for k1
> 
>  drivers/i2c/busses/i2c-k1.c | 314 +++++++++++++++++++++++++++++++++-----------
>  1 file changed, 237 insertions(+), 77 deletions(-)
> ---
> base-commit: 003e84792ce811256114dee4f4ecc1cafdab2b0d
> change-id: 20250814-k1-i2c-atomic-f1a90cd34364

This patch series got a few comments. Do you need help to address them 
and send a new one?

Thanks
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
