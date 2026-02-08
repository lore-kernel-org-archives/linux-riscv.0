Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 602FCEF06E2
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Feb 2026 13:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KArkZjL/s6KCA1axtS6GaqjPvYze4+Vj7s6K3dcJ5Z8=; b=YODVS678bPCK9S
	WDZlFmtFg34hP3i/HrXZgwb4tKAFx4endJaE3XjsqnDg5kDRQMO1CQ5RImyJhXxq/IbSsBC4Jl9oL
	sz+sqvRllTqEslYyxX7YmhfESWr//Dxo7w9sg9RoA5ePdh46Thxb4lEQChfOO5rbTqbK8e8jnVPt3
	HqbZt5LUfsYdS2Oi3orX8dvlwTc5KYEBPqMIvymjQqqIbGsr04mjwUz8mmHB2sh7dAyTL9Et+gM22
	uQOvMVorhzLKJR+W8zzWL68y6qKEF2RNSdKYjQppqCfSKaDRy7c/O+FIB6LNmNbsXqR+232kkdZd2
	zgtl55n35mKI+H41wktw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vp4zt-0000000DM6E-0zLf;
	Sun, 08 Feb 2026 13:38:45 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vp4zq-0000000DM5t-16fQ
	for linux-riscv@lists.infradead.org;
	Sun, 08 Feb 2026 13:38:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=cvQzn3HpfaP9SKHFgaRPRh6odBgX24tfEJllJZ5Gf20=; b=dRyWc3+gR91ttHyBS322jAlurV
	y1lPF0fkz/4y8iTAWHo5qHC22mFNYAf3/gGnPkVUtxXsLSrw9R2NgPel8HYeUPUBHzbkU8QB7YWmq
	kLnOD7aQRgO810cv7WxnkCxIqL5ROb8fRI2nBxTnLjqkp+DUpXq2Wx2ztnc8mCMAKQll3Kh2Q2vGZ
	395B+/04v9QCjDDgxu0mERaZnw8O6LWjo6ohj/D3sCwOJLGYCKsTG1iFyV9YVtVcfp/h4dij/skTu
	w2xA4NTONF94hmvhfiKLXLSKsGd1T2hDlIhTwyrAP4UY2zrCU5oZkXOWbYHuwUhP0OhpQWCryR0Az
	qy1VH8gw==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1vp4zZ-00000001VPd-2nK5;
	Sun, 08 Feb 2026 14:38:25 +0100
Date: Sun, 8 Feb 2026 14:38:25 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	Alex Elder <elder@riscstar.com>
Subject: Re: [PATCH v7 0/2] i2c: spacemit: introduce pio for k1
Message-ID: <aYiR0VQXvBJDSQPh@aurel32.net>
Mail-Followup-To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	Alex Elder <elder@riscstar.com>
References: <20260207-b4-k3-i2c-pio-v7-0-626942d94d91@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260207-b4-k3-i2c-pio-v7-0-626942d94d91@linux.spacemit.com>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260208_053842_306435_D9832C5B 
X-CRM114-Status: UNSURE (   8.69  )
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

Hi Troy,

On 2026-02-07 23:08, Troy Mitchell wrote:
> This patch introduces I2C PIO functionality for the Spacemit K1 SoC,
> enabling the use of I2C in atomic context.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
> Troy Mitchell (2):
>       i2c: spacemit: move i2c_xfer_msg()
>       i2c: spacemit: introduce pio for k1
> 
>  drivers/i2c/busses/i2c-k1.c | 316 +++++++++++++++++++++++++++++++++-----------
>  1 file changed, 236 insertions(+), 80 deletions(-)
> ---
> base-commit: 2fe0719258a48c204270366ef574066122e81924
> change-id: 20260207-b4-k3-i2c-pio-318088c1b3b7
> 

Thanks for this new version. This is:

Tested-by: Aurelien Jarno <aurelien@aurel32.net>

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
