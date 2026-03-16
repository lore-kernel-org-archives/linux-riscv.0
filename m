Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D982EFCBD4
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 08:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jn/HL3w2FpnKGyZn1RsLcuN+8CQXEf47JKB/La1YmUA=; b=eM0F/0ODgcQRQM
	B8GYIXHrY1CXB1wCDKSBdUQ1qsS0bCYdAltMdOhyIFd81yXGEvKh6w4mkmM2E4gQpyDUdiV4XqEk7
	yglQTXxlqSAHvHXrMXhShqKq6FEc0oQO5VPVFVqDjxiA2G6HL4YpcCznLqns3vktxiesepIFozHov
	Rn2pwDAu3Q66vMbi06ccb68vQXIRPamgpcMvto/lgMdtrMJStnzLXeT42NQ3Ic4Pj4EVma2x+3gVn
	gFLTYyNbEPG62Bv+OxqIY7Z/j7mSCneK9c/osl/UUfddh67u0Te4siEtZHI33gjaUXmO1+J1wxp65
	C7xy17wwg4S3jc0RKnGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w233e-00000003WRm-1KxD;
	Mon, 16 Mar 2026 08:12:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w233d-00000003WRS-0AxI
	for linux-riscv@lists.infradead.org;
	Mon, 16 Mar 2026 08:12:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 018AF600AE;
	Mon, 16 Mar 2026 08:12:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C2C8C19421;
	Mon, 16 Mar 2026 08:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773648731;
	bh=Li6cPmP3RADkGfu5yAIhyF88ZWDgiUQMDxPls8Kxlv8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CxseuR7pdRwz12lNYmtyJiKwmH4akmAh3zXHQmGTonNPNEC4rbaN+QdpukkpEdrko
	 e1HqCv0B2lVGscz3lc+lyp0fJ49EdurstIHEhMsPDfqB3mhnKC6H3HMOvCfOEp5U9F
	 AHf1iwiZqooSuG4yJ/ShCs4e5RVtQoD9TeyhqkN8Qne7HWtfvCY5WEQGpZBOoe5v7x
	 a18vfaESXgxgQAFMWLxEcXfa91zw8nIjY6DaP2AVIWj4uJT9/6ACI/oH+VH81B0+f2
	 yqKmzFXttfau3EU6pba2sSX13yZXrT5ya0TYRgktv7s8QA2mrdRMkQsN2UPptg2/l3
	 Phc54JoGaLuaQ==
Date: Mon, 16 Mar 2026 09:12:09 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jia Wang <wangjia@ultrarisc.com>
Cc: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	Yao Zi <me@ziyao.cc>
Subject: Re: [PATCH v2 1/2] dt-bindings: serial: update bindings of ultrarisc
 dp1000 uart
Message-ID: <20260316-upbeat-aardwark-of-snow-30dded@quoll>
References: <20260316-ultrarisc-serial-v2-0-6ab3e7fa891c@ultrarisc.com>
 <20260316-ultrarisc-serial-v2-1-6ab3e7fa891c@ultrarisc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260316-ultrarisc-serial-v2-1-6ab3e7fa891c@ultrarisc.com>
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

On Mon, Mar 16, 2026 at 02:33:22PM +0800, Jia Wang wrote:
> Add DP1000 UART compatible information
> 

A nit, subject: drop second/last, redundant "bindings". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

And anything can be "update". Be specific. Look at other commits how
commits and their subjects are written.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
