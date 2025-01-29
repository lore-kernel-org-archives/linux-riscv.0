Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A5C5C0218D
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jan 2025 07:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bm6gaDHzvPgbdeJMzF7V4p0L948K1hmKFqCOoApPGaU=; b=Vd8i1IZk17D5yb
	fUg55W2DmvWjrLT7QNVAi7siUAUIGPj2sGkKfpd7VCnU/tDetFeE3407lgMIxcY2zWmwRLhvAJZmB
	xs2xXXIDkXd7ysZiB6bBbzXq68s5VSzYSc8lWorDo8qFN7O+Wpbjn5sFrRUVVEyh91tVHLFa/Tv+N
	AXBfrsIk9OP5pPMx6CHauGk6rk9O53fTc94mXMps0H5VvAI4pH9NlHAuebPiuKUw18megUPMhjmPj
	83tTgb7dzLSwhdjXha7OPNODrpPF4/Hy6xN16BMWbH3Q3xjZ88rmh6crrZdrpQk0oTIJR/YrLO7iw
	fIbWoCtm2HK+6DzkBU/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td2WW-00000006TdO-1k9Q;
	Wed, 29 Jan 2025 07:30:08 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1td2WU-00000006Tco-2Adp
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jan 2025 07:30:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EFE8DA402AE;
	Wed, 29 Jan 2025 07:28:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B43FC4CED3;
	Wed, 29 Jan 2025 07:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738135805;
	bh=YP70k3CuKOov2UxqgnQYgL5HUHj0EryZS8nauAe2jjI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E4EfT3UbNbTuywP7/eWQWkq9G1EmPjDzLGf+l/fPzYmwz7ipoY3s25dKEfMgMYoiU
	 iPxUqFxFMhxzmN+hmKnGnRRNXQB1J5TkayoVCdixsAGt/3/B8mqzGIDQTer/Kp6qnb
	 Hi+f/CEIIDhACy/LfW/w7IwYpsV/Bd+2PhHVS6bWg0aLyG0OnZwDrafhQ9svsiu8hQ
	 nfvt0HmzBZH97DHv3hqCodcMO/qzfPbudlzAPuG8DQydryTz/Mg7Y6YhLpZs+KkUKs
	 shUny9WTbVOLVJ9ZOeMUUhBlviZFLVqorJNsG4gf9kgGBjg3TBKpJOvkSFe90Lv7Kr
	 /H04vnOdkwVkg==
Date: Wed, 29 Jan 2025 08:30:01 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, drew@pdp7.com, guoren@kernel.org, 
	wefu@redhat.com, jassisinghbrar@gmail.com, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, frank.binns@imgtec.com, 
	matt.coster@imgtec.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, ulf.hansson@linaro.org, 
	jszhang@kernel.org, p.zabel@pengutronix.de, m.szyprowski@samsung.com, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v4 03/18] dt-bindings: firmware: thead,th1520: Add
 support for firmware node
Message-ID: <20250129-marten-of-incredible-gallantry-604baa@krzk-bin>
References: <20250128194816.2185326-1-m.wilczynski@samsung.com>
 <CGME20250128194829eucas1p279fb146417854b28366378793087694a@eucas1p2.samsung.com>
 <20250128194816.2185326-4-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250128194816.2185326-4-m.wilczynski@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_233006_617195_0675B302 
X-CRM114-Status: UNSURE (   9.84  )
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

On Tue, Jan 28, 2025 at 08:48:01PM +0100, Michal Wilczynski wrote:
> The kernel communicates with the E902 core through the mailbox
> transport using AON firmware protocol. Add dt-bindings to document it
> the dt node.
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  .../bindings/firmware/thead,th1520-aon.yaml   | 53 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
