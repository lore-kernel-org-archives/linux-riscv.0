Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E93C531C9
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jul 2026 20:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YyQ9/W8aZVrUg+ugDBUSFTthVgxlWoO46CQcx+Hl0Aw=; b=vub7vMeb+oEts8
	T3o8dzlUJvFAgG8eP91TBmwS66N2KYVrpxxER4+xDOOZ/lylnARUFnL5U4S8kLSKhJIRfA0jDXKj6
	Afwq/9GSd6hSKD92gKIGCJfn/Wscrb6ULDDxWIB6nzkB3qYTPXq0vZNrYnLzcy41+MAXAmXVk9sVM
	aGqFuX7k7uWIbo74RTyJVyBCRnsQopxleqPW4WGNSUmhkvA4/GSDM41NKQPqgIbElS3zYfVjAA+af
	Xgb49/CgPJgx0wizrkfwY5fOiYAC8FXwE3L9jDcTS4jLhICGiE0EN+gZWGSCiEpZKGtu0Xixz4YoT
	G3nBY8z6d+DwAiSyIt2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnjIV-00000000htW-0nH0;
	Sat, 25 Jul 2026 20:48:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnjIT-00000000htQ-37wF
	for linux-riscv@lists.infradead.org;
	Sat, 25 Jul 2026 20:48:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D98D860A91;
	Sat, 25 Jul 2026 20:48:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 184461F000E9;
	Sat, 25 Jul 2026 20:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785012516;
	bh=KOmL0CnJCd+9BgF1lWQ87vbI2jwqTrH0CBCL3BgOgnQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mdxongxrGDOmaWvmpqv6awjE+xsf1uuypD+R6mW5bkMRUe3s2DDoelCWTrs6ODPJp
	 8uLoXU6reu41chqvJdBvsbGyZh3lJQmISmkFLUVB4E8d0WOiG5zVvAac1qpe9mXYxZ
	 ebJOsXvTZutFzZE7gb25HyKMM4gp3LQzDL+G/xRQkupyeoYL5n7f3I3eiZT5e2uwHf
	 WE4VjLLDL5O465oi6ZlqC7K0C8FoklfehWS1Gg937pnO2Dq91ciEmg+rptvpKgbKaQ
	 VEB7zkvr3u0aa1/9Cf8VU+/8l2EYRutphLukHBwxvv9uKBc9tgoUey7QomGdHsjND2
	 uE26XfRS0u9Uw==
Date: Sat, 25 Jul 2026 20:48:34 +0000
From: Yixun Lan <dlan@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Rob Herring <robh@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 1/1] riscv: dts: spacemit: enable PCIe on OrangePi R2S
Message-ID: <20260725204834-GKC77474@kernel.org>
References: <20260602100000.2402784-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260602100000.2402784-1-amadeus@jmu.edu.cn>
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

Hi Chukun,

On 18:00 Tue 02 Jun     , Chukun Pan wrote:
> Enable the two RTL8125 network controllers and corresponding
> PHYs connected via the PCIe controllers on the OrangePi R2S.
> 
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
Sorry for missing this one, and thanks

Reviewed-by: Yixun Lan <dlan@kernel.org>

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
