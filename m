Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7DEDCA0EDC
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Aug 2025 08:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qi5p9syoP/nJSKMSdoTExmYUBSU65YC0ls7vHFsBphI=; b=Tqdlz10TDZxRzy
	rE3cPLvpfXuBqXmmwvg/AzIywidl2aWFBd618gpGYr2Igx02ZwdcSU04LJP2neigREQu6MAnDkBFs
	gBwZEZiSvD0AITdFWp7Z5YciDiCg9IdFBg7c+3qimn6AqThIiwhI7gVBh+rTqRvVT2mBOV3K2aicd
	86DB8PTRaFZHg3JbqG82IIQ6+FC+rzvV3NMhhsGgnu/UcId1HV8XEm3AyQRplrl0ZvfWY/q86HhYQ
	QTD7b7XPXqLQXqWc5SlVU8JNnzUcIv3HXT4DpQvF93x6Y0MTIEt+qhW55qt9LBP+qUOsPegwmfuYA
	4189mkWnypsMsLG+3NLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoeDA-0000000CkCn-2pyx;
	Wed, 20 Aug 2025 08:30:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uodnN-0000000Cfft-0QnI
	for linux-riscv@lists.infradead.org;
	Wed, 20 Aug 2025 08:03:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 586D860204;
	Wed, 20 Aug 2025 08:03:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E997C4CEEB;
	Wed, 20 Aug 2025 08:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755677024;
	bh=BISR+gtNp9+FdWJxwDQ/PC3a0OAeumHoulzrrl8qHsU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fxaVP6CXICRipgpUoN8KbSwb0dfHkpQ8cbufSh7204gD4i3ENOWJXQcaTmScUS7RY
	 SpxxhJvgttV3xsT+BB2/x9hFgk4nUOzZL59k4Uias7uxMRKARhEoXebyzKz3xfa4e5
	 ockFdmutkcecsT52edwqViL7/Ax7X74GbKsvbxHxoHXxHVvlbsu3mGfmbRhV9VlzoL
	 qn3/LCz3E4Izs1s0hhhbvpuxf4BF/CVMSOV0jlYiNYCD9wDV/D5Lx3kkYbCyUU6PRg
	 kNWYsFeZdiLSKeT0tcoJah5uhxuJxrAWIxj/oYAbBkFGv5A2ZjRhc5bDfglXJwf8n8
	 hSxDTqOXFeFuw==
Date: Wed, 20 Aug 2025 10:03:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: i2s: spacemit: add support for K1 SoC
Message-ID: <20250820-gecko-of-absolute-will-b06337@kuoka>
References: <20250814-k1-i2s-v1-0-c31149b29041@linux.spacemit.com>
 <20250814-k1-i2s-v1-1-c31149b29041@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250814-k1-i2s-v1-1-c31149b29041@linux.spacemit.com>
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

On Thu, Aug 14, 2025 at 04:54:19PM +0800, Troy Mitchell wrote:
> Add dt-binding for the i2s driver of SpacemiT's K1 SoC.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  .../devicetree/bindings/sound/spacemit,k1-i2s.yaml | 88 ++++++++++++++++++++++
>  1 file changed, 88 insertions(+)

Please run scripts/checkpatch.pl on the patches and fix reported
warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
patches and (probably) fix more warnings. Some warnings can be ignored,
especially from --strict run, but the code here looks like it needs a
fix. Feel free to get in touch if the warning is not clear.

Please use subject prefixes matching the subsystem. You can get them for
example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters


Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
