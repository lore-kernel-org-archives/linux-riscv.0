Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9661FCF8573
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Oct 2024 09:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oWv1XbsL0sMBCvA/Qcw4KXWXkFAkZcHcpee6i9stvqM=; b=NTihaRd8igHyS/
	6C7L417VriwMHbN4kFWTrHLvpMIsw5yOZEL/PZTxAOlyElHoph0JVWpiEjd2bnczRVSmo4iqXmL59
	j4FVYu6WlekvNcvlH9YMIHb2tXpHR+XuD87bLKfQuv+WN+iNuZiYrRdChWo7yEqnRBDQq/kwrH8Ce
	h9OXajGrtdHpBM4fwLJ2wktsoVRHTcaC8zu0juxqU5ka/rxM2cimMWf3byElKcXeh0RJ3s4/1fl1A
	BCdcQToJdAk6YST5c9u4s7FYvOJuuGbXMplCTxsrx1KnwBm8SvKUrE96EoVmb5vpiFt1I6eqAGyrp
	8RLE8QIyg1pgrV+l6fQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swIai-00000008jOV-1ZzL;
	Thu, 03 Oct 2024 09:57:48 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swITw-00000008iB4-1Phr
	for linux-riscv@lists.infradead.org;
	Thu, 03 Oct 2024 09:50:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1C9CBA436C9;
	Thu,  3 Oct 2024 09:50:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C6BCC4CEC5;
	Thu,  3 Oct 2024 09:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727949047;
	bh=zSVrEao+mC/gMTpIMXMitTzd4vFPiF4/j+ASsIq3kwQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qlm3Hz35qVqYuWhtznYirYWTQysbWrWNoa6N4jj+CV7pDm2powcbeQ56s2k5vyUes
	 lGqtCX45x7Ll7zPVhIUfZqyx6O0Mtt8GAkwDOUcC99uhq+ARG7RmVam71KpM6ROO36
	 3HoRlWWoIOycbgO+hUAttPjeC0Vwp0Q+J4WerhAChAvqDJwpIf0imCJSRsJnla02Hg
	 Zu/nROaDuTalBFPtzu0+HDdCTka+dr61NtGaF2ZiOy4gQ4mXuJmJWiy72Oa/qCjuCs
	 DVKtYqD7u046bN7pVwvFqoGlYt88UOhZDFCiOY2YtOtHktQNXUcjOZWapqUTDbebpY
	 poRbMyGjy+l9g==
Date: Thu, 3 Oct 2024 11:50:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, 
	Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Andy Chiu <andybnac@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC v1 3/5] dt-bindings: riscv: d requires f
Message-ID: <s5dqss4gom4ii7bprqwnh34lxrs5uksjuvi5kzumecocl7ct57@4jc2pxbndlfx>
References: <20241002-defeat-pavestone-73d712895f0b@spud>
 <20241002-deliverer-recite-2c5a05f50721@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241002-deliverer-recite-2c5a05f50721@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_025048_479368_B77B9334 
X-CRM114-Status: UNSURE (   9.63  )
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

On Wed, Oct 02, 2024 at 05:10:56PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Per the specifications, the d extension for double-precision floating
> point operations depends on the f extension for single-precious floating
> point. Add that requirement to the bindings. This differs from the
> Linux implementation, where single-precious only is not supported.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)

FWIW

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
