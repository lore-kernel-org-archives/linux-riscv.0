Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63708D0C61A
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Oct 2024 14:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sr8On4LekKenf2H+LnTQk8ZgPCDoJ3seK0JowNZMej0=; b=WAOgBW6V0ENB9/
	sP1vbIvpSQxwpsI39as0Xk4If5xtdhc9uroXkw9vhDkYiusu6Ruv0ewIXHLOLiLMspjby3WBlxsYU
	UsdfyW5V6oEnabwedDadkG2I0eOQ2iIDgmbFtIJ2TlHSBHmGiFkrf6GV1T2k95bs5x5exeFvnZ/l+
	Q+ddGBr5dFg+KkqoDqLRj8Y1kNxrZ4P0CAt0tDmb7SOKx6fy9iJhgCX9va8No5vFFeXzxNI7/g/Wl
	Q2FkZCB1X34kgqZJSvETCeoA/F0HyAJf35acpMF0+w5HeNuqZf6OJe2L1DMsmGaF3blI5SH+KITti
	22fExoRvRKp4SRvDS2mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4LLU-000000041VA-0xm9;
	Fri, 25 Oct 2024 14:31:20 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4K3F-00000003lRM-3yzC;
	Fri, 25 Oct 2024 13:08:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 27C0FA42EEA;
	Fri, 25 Oct 2024 13:06:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ABB4C4CEC3;
	Fri, 25 Oct 2024 13:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729861704;
	bh=MNxUl9WMfTQw3iIJsYXFRVHGk0K9abiM55dYNFiK5e0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PLuVuWRItR+u7EjCXA0r2R1yl+hrN7eOVg2JORS94Y04yKk+Ixm+Vqh096eL8VhvJ
	 fP81fSfZTeqaQKaJEqTCl/5xxvCTN1wGqura+LhwxR+o1TJMH9P2DO7iqEGgYwfWFD
	 kWvsXEHLQg9axqXHm9GLXlHi/1hwmAbte+wpH7UQNzxu6tkchcpWJPivy3PdyFoeda
	 k8NnKNuPvOclEXju8nDiTV2ZqpL/qRrvj/+pv3hWZy1jtziKnLgZwsMttvRy9rc/xO
	 3VujCfFxoOy+tC/rwSEjJw7sg52VASkFvNdGwGyMwQrq9aqRzR8HkXDTdfiTS9NWjQ
	 tF9ocPkWMKh/w==
Date: Fri, 25 Oct 2024 14:08:17 +0100
From: Simon Horman <horms@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Chen Wang <unicorn_wang@outlook.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 0/4] riscv: sophgo: Add ethernet support for SG2044
Message-ID: <20241025130817.GU1202098@kernel.org>
References: <20241025011000.244350-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241025011000.244350-1-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_060826_078743_9EDFA31F 
X-CRM114-Status: GOOD (  12.17  )
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

On Fri, Oct 25, 2024 at 09:09:56AM +0800, Inochi Amaoto wrote:
> The ethernet controller of SG2044 is Synopsys DesignWare IP with
> custom clock. Add glue layer for it.
> 
> Since v2, these patch depends on that following patch that provides
> helper function to compute rgmii clock:
> https://lore.kernel.org/netdev/20241013-upstream_s32cc_gmac-v3-4-d84b5a67b930@oss.nxp.com/

For future reference: patchsets for Networking, which have
not-yet-in-tree dependancies should be marked as an RFC.
Our CI doesn't know how to handle these and we don't have
a mechanism to re-run it once the dependencies are present:
the patchset needs to be sent again.

Also, I'm assuming this patch-set is targeted at net-next.
If so, that should be included in the subject like this:

  [PATCH net-next vX] ...

I would wait for review before posting any updated patchset.

Thanks!

...

-- 
pw-bot: changes-requested

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
