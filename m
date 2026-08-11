Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C98C5CFC1
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Aug 2026 08:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FCyWE+yP/RiRAjdkrAEm/p4kOF8fFwfZk10A5a9hCLE=; b=tWB69OfLJUQlwC
	EJLExFw6tvsNPg4qeuewKfDLWWhy2Rycs4z5ShQSh+nrXZBmj3m0yj88BdRrQ3M+FEBjfuxO/Yi3/
	QVvlT1qVRhdS+AjyCzggPVVr+pxDK4JUhB51JJ3sEF9FPPE6AnH/cIwmOHdCJ+z0H+nKY4rn6Cuvu
	0WmIMEI9JJr0x0uMMPfJqAu5bU6dfa4YqCWaGuxQDftbvUUPdflARumtcsLBM1nq4tISq0UU2u+2R
	zHTxAIkOOJI8lwQl6MZ2A6CapmCFO0aTFhkSBmPJPci5kovijGMEQR+xs9Sl8IXNZBaDbp86ASROS
	gJ0LAP5BPH22U9OaRcbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wthy0-0000000DcgI-1apV;
	Tue, 11 Aug 2026 08:36:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wthxy-0000000Dcfr-2Spv
	for linux-riscv@lists.infradead.org;
	Tue, 11 Aug 2026 08:36:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1509042B14;
	Tue, 11 Aug 2026 08:36:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC05F1F000E9;
	Tue, 11 Aug 2026 08:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786437370;
	bh=dYjArlVEBDJPkhUvOeEdMdDh+UIps4e0rRoiI59xdRM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SZ4QaSPp7e+Uz8lEZSw4orSlh79ceSljDTSwMoehCbbcLqbIKT0Z0DhDq9qJ1Xb91
	 w4bGl8ep9/8x9Z0AnQUOIL2pZ7sGg7sPKgzcRqgEygfLugkBdD6EWMPa7g1qqMuHyE
	 GM81HkC8hGMKxCBQfpCWv8cupHtUkU/3fYQ9rqZ4ZMaGidmIDwgdIQ6eHrjY+ihqwL
	 npXaJtf8UzBUi4I1EPc5Nfg1Db0uLaCjXgaxJsXsqCu8ng5Lxv30R729tmNd5taUpo
	 7IwcTaXwRZ0zT66ifXL9d+krNdhvoIBLx5w0lSXWOjW5Vq6zE0hU/n5Sw8d/3j2iLb
	 NH/VU27KESRfQ==
Date: Tue, 11 Aug 2026 10:36:06 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Saravanakrishnan Krishnamoorthy <skrishnamoorthy@rambus.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>, 
	Alex Ousherovitch <aousherovitch@rambus.com>, Conor Dooley <conor+dt@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Jonathan Corbet <corbet@lwn.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, 
	Joel Wittenauer <Joel.Wittenauer@cryptography.com>, linux-api@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Shuah Khan <skhan@linuxfoundation.org>, 
	Thi Nguyen <thin@rambus.com>
Subject: Re: [PATCH v3 02/19] crypto: cmh - add core platform driver
Message-ID: <20260811-notorious-humorous-frigatebird-ed4637@quoll>
References: <20260806195519.2703224-1-skrishnamoorthy@rambus.com>
 <20260806195519.2703224-3-skrishnamoorthy@rambus.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260806195519.2703224-3-skrishnamoorthy@rambus.com>
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

On Thu, Aug 06, 2026 at 12:55:01PM -0700, Saravanakrishnan Krishnamoorthy wrote:
> From: Alex Ousherovitch <aousherovitch@rambus.com>
> 
> Add the Rambus CryptoManager Hub (CMH) hardware crypto accelerator
> core platform driver.  This patch provides:
> 
> - Platform driver registration and probe/remove lifecycle
> - Hardware configuration and core discovery
> - Mailbox Queue Interface (MQI) for VCQ command submission
> - Transaction manager with async completion and backlog support
> - Result handler with threaded-IRQ completion
> - DMA buffer management
> - Debugfs instrumentation (when CONFIG_CRYPTO_DEV_CMH_DEBUG=y)
> - Sysfs attributes (fw_version, hw_version, boot_status,
>   mbx_available, mbx_count)
> - Kconfig and Makefile integration
>

Entire posting has multiple high and critical reports from Sashiko.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
