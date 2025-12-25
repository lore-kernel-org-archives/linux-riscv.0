Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C983AE7AD6C
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Dec 2025 21:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IhpUn7iGlXeUce3wGr03V6gSBrZYSOk/Mmp4pgAnDiU=; b=vziHAZAZtcmfzm
	glVwGdfQnSatB2iU5uqm3CnRzFZ83A+QpxrPRJkugWeViDIgaW34EO8GANYG9OkaXnyHmfGREig4S
	c77DETExllXgkkq4pTAL/TY6rsq6jLZnSA1titPxgXp10U2BUax3WkSHsEdtfqtrov9/JDVLIt8b/
	VVlwceIJk61MSozh+Wr5+81PY/hPZgL9UuMgT29Q4jdTYgHFukdi5eCCH1OVUtWM868oJQPOT1gPC
	wi0DY2AE/YfUKQ60EOvFToerWTyzJeUTfxtfW9Go4bwS0pjk0YjpIlhXtbCc2Nm04rSD2y+9dNnjC
	MHsTWmlzXoeCM2MK7Y6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYsTA-00000000goq-2pmV;
	Thu, 25 Dec 2025 21:02:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYsT9-00000000goi-1pRX
	for linux-riscv@lists.infradead.org;
	Thu, 25 Dec 2025 21:01:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6AE1160008;
	Thu, 25 Dec 2025 21:01:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64D99C4CEF1;
	Thu, 25 Dec 2025 21:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766696517;
	bh=ftZicz13u88tWLL9LuwPfwC6FxR0P2PCchUxPZqxkqs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cXeH++OB+jScuTXBBpcC7BJAPf0uY6M/OqoroBQe3B+w5w/IbLmgClEjIDrZbtUzY
	 b3b3wWN5bLYcS6/bTixBNcBauY2MSidgHRICSMX+g4YSvxDCq6Ulc5D+yFpTKiFyiR
	 lJ+J3IDVN7IP7O0DJ/tH9eZzMi/uj1kLFRiJx1uZtfE8InV64zrBximRbumC6ixGs9
	 pnvVxJAz0wH14QrDK9yaXoPiKSpD6t1ysT6CP0OUjjxQ38OU3ahVnI7lr92YH6Zkjg
	 mhkLe89+l1hfnM5yB0ZCQqu8w6pKZhgsVCasFVCUuaUDKiv/w7QjEjyevkJNvSPWKe
	 if6KzI8mzTznA==
Date: Thu, 25 Dec 2025 22:01:36 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Encrow Thorne <jyc0019@gmail.com>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Troy Mitchell <troymitchell988@gmail.com>, 
	Guodong Xu <guodong@riscstar.com>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] i2c: k1: add reset support
Message-ID: <2dmrli7yzznpurg74wet4oidhljjf3csdjly2dwpyvyndhrec3@uc6ke7mep6fv>
References: <20251219-i2c-reset-v2-0-ad201a602e74@gmail.com>
 <20251219-i2c-reset-v2-2-ad201a602e74@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251219-i2c-reset-v2-2-ad201a602e74@gmail.com>
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

Hi Encrow,

...

> +	rst = devm_reset_control_get_optional_exclusive_deasserted(dev, NULL);
> +	if (IS_ERR(rst))
> +		return dev_err_probe(dev, PTR_ERR(rst),
> +				     "failed to acquire deasserted reset\n");

If this is optional, why are we returning with error?

Thanks,
Andi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
