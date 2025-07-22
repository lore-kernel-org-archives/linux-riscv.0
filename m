Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB33C83F25
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jul 2025 07:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VxmVPqvouKH5bvJySqhC3GYCt3nfagloCH0oLIKFkrI=; b=1FBZRdgmvFB0LD
	eoNmr05gwkwOcDfh+8b2aocbZyF7JajiFfsTA3Z05pIlxRImCMYHdpKx0mqVX7JEwk1R5HLg06YS5
	Mm7HbCJ2EBRgleEZAQQdWiQa1Pqo4VSJe+2Tpn9kZMTep+BtCq8f0gnsXXvS7dKV2SW2m3tCf3dCa
	wB0viobJn8xCKn4sSttdnSTzg2fcoOR5k2lP/ioMVzPxkecNFwFsyOJdApaxbYz2Og6f00DbeBL+U
	iNf86/ODv5vaanYAh6C73FtZKjXep/0XsKG6u7UvKL0ctAo+A/8H6PDtcy1OGApW+FzPbk09lRBhw
	57gs7vxxe/yYIZY2vNRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue7TK-00000001f3B-2CzM;
	Tue, 22 Jul 2025 07:31:34 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue7Pv-00000001e5j-1r1d
	for linux-riscv@lists.infradead.org;
	Tue, 22 Jul 2025 07:28:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C6353A55C50;
	Tue, 22 Jul 2025 07:28:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB287C4CEEB;
	Tue, 22 Jul 2025 07:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753169282;
	bh=OS1W1F3+uicr+BJ96OdK0Fwq1c/V2PKY69jVU9c7b1E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Anb5ftzHQ/yX14xJp8PsiMzrMY9MEeKaMm0E7CtepaK9fz3qD32p+mSm+VxnacIaq
	 uTed1zP9zxx+3p1YJEHuNUe2M+2hkS5okxg3hAdudS6oaDy8ZDDDvFaJqZ3dBVMJk9
	 6AVXN5T+UUdkKagrek0uBrKfyB3iEawqBiTFUT6IWFpOKD916pivrYdbwtixibiCqb
	 5Q/bQZL9I3lESdWUJVbnqQ5R6jm7y7j5ccdH9EcFfWYZ94Zy/WSHnHlMA92qH5cegE
	 lAjV1zRlqTZ6vnrkcZwbimKHVPc5F0077eA69+0EbWwRC5ikbLCrOqoO12IiyyuPuS
	 SfB1yGOVJPJyQ==
Date: Tue, 22 Jul 2025 09:27:59 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Samuel Holland <samuel.holland@sifive.com>, Anup Patel <anup@brainfault.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>, 
	Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH RFC 01/10] dt-bindings: vendor-prefixes: Add Anlogic,
 Milianke and Nuclei
Message-ID: <20250722-elite-topaz-parrot-9c5a5e@kuoka>
References: <20250721-dr1v90-basic-dt-v1-0-5740c5199c47@pigmoral.tech>
 <20250721-dr1v90-basic-dt-v1-1-5740c5199c47@pigmoral.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250721-dr1v90-basic-dt-v1-1-5740c5199c47@pigmoral.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_002803_543049_0BE1DEAF 
X-CRM114-Status: GOOD (  13.96  )
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

On Mon, Jul 21, 2025 at 11:46:07PM +0800, Junhui Liu wrote:
> Add vendor prefixes for "anlogic", "milianke" and "nuclei". These are
> required for describing the Milianke MLKPAI-FS01 board with DR1V90 SoC
> from Anlogic, which uses a processor core designed by Nuclei.
> 
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

<form letter>
This is an automated instruction, just in case, because many review
tags are being ignored. If you know the process, just skip it entirely
(please do not feel offended by me posting it here - no bad intentions
intended, no patronizing, I just want to avoid wasted efforts). If you
do not know the process, here is a short explanation:

Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here ('b4 trailers -u ...').
However, there's no need to repost patches *only* to add the tags. The
upstream maintainer will do that for tags received on the version they
apply.

https://elixir.bootlin.com/linux/v6.15/source/Documentation/process/submitting-patches.rst#L591
</form letter>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
