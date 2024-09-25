Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B832BCCF9E7
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Sep 2024 18:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j3ijeEO5kUPux9inONlUJ8oiZfZMXHwNKT9a52VKnhY=; b=WqlUZhpkIdc37E
	tA12uvp2GHsCy41EK40QCrumoiVybXna5Qt/EksgHXkOiVGmstURGX608FGeYsPA9jSPD7xgi4+W4
	rqC23cC3xngdIX15HII7wDtrcVy7bKcRS1OgPTAVu872+ZzVp2gpRJApF9tEucBDKwj7Nrp9U46iZ
	c2Frd2lxatVfpIYX89HJD78izxqRt92dgvKL6H0pJGuPsdpAz8/DZpZXRiR9+YiLj0eIrLUAczyhk
	RkfwqX1jtgX9Js3TG6Kh/xrERW5Pycp0dHZF01DNPGhyCNDIp1Pd00u9KKyyd0KWByE7v9/Hl6gg5
	fRUU26dlKlHav5Sj84oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stWLl-00000006GcE-1w9n;
	Wed, 25 Sep 2024 18:02:53 +0000
Received: from ms.lwn.net ([2600:3c01:e000:3a1::42])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stWLi-00000006Gbm-2kCH
	for linux-riscv@lists.infradead.org;
	Wed, 25 Sep 2024 18:02:51 +0000
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7B12242B30
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1727287363; bh=KhWuW/hYDA06KYXwRlFbqTyp8jMGMd12FTTtzzUby4U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=RyC5TMn7I/DipJ8q07f3+pbjTqMT5u8yWGSBxpiUQddzY+OFcYk7iAvPnRBm0Sm+P
	 M4F3IqGx3osI60chgcozOAZChMVSNAOE6ka1Dcr8QhSPWZoeZJeiAvUAkUtslDiINf
	 QevD3Ivw9WalwF/zfi8hlziaIHPtRcJHpNFBtjkdo//QV9TTzabLiz5dLqvfjtrgZ6
	 fFvAoiSWDsYqTgZeG6dTV1mTufwn0o5zaXDeF90X2TccQAHLIVSatI/X8cpb75zDhZ
	 ZCJWOznTgLP0C4/P+Z2UPGFCaZfznWiaByjMp2YKksDeFqlYvp2o68KijWns2aba7E
	 /jr+2VxofeNFw==
Received: from localhost (bo-18-143-171.service.infuturo.it [151.18.143.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 7B12242B30;
	Wed, 25 Sep 2024 18:02:42 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Nam Cao <namcao@linutronix.de>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, =?utf-8?Q?Cl=C3=A9ment_L=C3=A9ger?=
 <cleger@rivosinc.com>, Evan Green
 <evan@rivosinc.com>, Charlie Jenkins <charlie@rivosinc.com>, Andrew Jones
 <ajones@ventanamicro.com>, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: Re: [PATCH] Documentation: riscv: Fix typo MIMPLID -> MIMPID
In-Reply-To: <20240925142532.31808-1-namcao@linutronix.de>
References: <20240925142532.31808-1-namcao@linutronix.de>
Date: Wed, 25 Sep 2024 12:02:39 -0600
Message-ID: <87h6a3fw74.fsf@trenco.lwn.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_110250_720304_01FD3853 
X-CRM114-Status: GOOD (  13.90  )
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

Nam Cao <namcao@linutronix.de> writes:

> The macro that is really defined is RISCV_HWPROBE_KEY_MIMPID, not
> RISCV_HWPROBE_KEY_MIMPLID (difference is the 'L').
>
> Also, the riscv privileged specification names the register "mimpid", not
> "mimplid".
>
> Correct these typos.
>
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> ---
> ask me how I found out..
>
>  Documentation/arch/riscv/hwprobe.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
> index 85b709257918..fb0affa61eb9 100644
> --- a/Documentation/arch/riscv/hwprobe.rst
> +++ b/Documentation/arch/riscv/hwprobe.rst
> @@ -51,7 +51,7 @@ The following keys are defined:
>  * :c:macro:`RISCV_HWPROBE_KEY_MARCHID`: Contains the value of ``marchid``, as
>    defined by the RISC-V privileged architecture specification.
>  
> -* :c:macro:`RISCV_HWPROBE_KEY_MIMPLID`: Contains the value of ``mimplid``, as
> +* :c:macro:`RISCV_HWPROBE_KEY_MIMPID`: Contains the value of ``mimpid``, as
>    defined by the RISC-V privileged architecture specification.

You should be able to just say RISCV_HWPROBE_KEY_MIMPID() without the
:c:macro: markup and have the right thing happen.

Thanks,

jon

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
