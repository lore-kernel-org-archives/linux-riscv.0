Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 275D5CCD184
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 03:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y4XqPZ02oNWqL6mpyFlR73yCy8K/8jQRHV3511UFhYU=; b=WSj1Y0KTCTXSgD
	l016GwhV4uFIS910rVfsG3xSAq8G1MlPksGShTeYBzu97fQRJo2u6/CJNSK9VLvfjVsT8ScDBBd+e
	YSqwiSGSDT1Q5ya6XFI+pXK6q2nDfFuI5BjRoki8zI9VYNX6SgN0Q4xayrC4T/6dtBrZmi50/mEqX
	O8YwczVji8yR6HE8HgTFUk1nGLqpA33Ls70VsdbDsYIQOgKh+yVviErOHWk2OXMPg2kmoFw1xoKxC
	mu8FBhLBlveQcr6ij5WQxnrXKFXRIrua3y6kU3Uda/vtmvG8fUuRoQd9Bki3oRRtddpgZ7nWSu/gs
	fQ3p+1yzDY0YajnFlCdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9bI4-00000006T9D-2sgP;
	Fri, 17 Oct 2025 03:38:04 +0000
Received: from smtpbgau2.qq.com ([54.206.34.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9bI1-00000006T6Z-1V0e
	for linux-riscv@lists.infradead.org;
	Fri, 17 Oct 2025 03:38:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1760672216;
	bh=oBjWx1I4AnKMBoTG5upDqtcSRJpj6kwgVgcH9gHhiWk=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=NrA2hetMPmqFFX5VpPiNznP6QG+gEN5FQ0Npwqqr/HbKLiz6wkybhayL4h1d/eiR5
	 m8O8yCQN9xVCfoKwSSZrfsf5fQpCXpKqC94gyHeplIGhf3QqXXfvcS5hRkhfolud+U
	 KVqnqKGvtPqwKVUzAt3UMoz4JDzcPUQZEOTsLuR0=
X-QQ-mid: esmtpgz14t1760672214t0abf1794
X-QQ-Originating-IP: TlDX3I/w/Ks7UHXpGBXnho4hAw+exomsa25mQwPtHzQ=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 17 Oct 2025 11:36:52 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14831178928690405288
EX-QQ-RecipientCnt: 17
Date: Fri, 17 Oct 2025 11:36:51 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Jinmei Wei <weijinmei@linux.spacemit.com>
Subject: Re: [PATCH v5 0/2] ASoC: spacemit: add i2s support to K1 SoC
Message-ID: <A22605E3906E8F62+aPG50wdFlFzSMORA@kernel.org>
References: <20251017-k1-i2s-v5-0-401ae3775fcd@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251017-k1-i2s-v5-0-401ae3775fcd@linux.spacemit.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MWLCkAjnYYm52MwQO1Mzuin8y7IH2RZBNw5spbGSdMGtEzS0Cd1600uo
	8QcEuNobWxqstEWcSZbQRZXRtNL/CTd3QVormvDi5lVb1uZ7tT8jqGwbGMxtzYseXNz9kjS
	7nej1vnLa06nhAjIsFo/5QUGZJJFscnfRRvdZ7qMOx/VCU/xj9j7fxuQzKjzPaVAgJNolm8
	3y0GIqePyAaLVmeXmrb/3jCSgH1xkQ+yXoNjT1VvI1ZWjDX6VEGe5tvDo9tjuvGVUq46o2p
	Gsc8DTcd8P8wl4j86lD92zye3lUXTARibnfmKb6gtElr0uBfISLiXJi6/XnZRsLVjXXkypC
	fUN1WqvYF+O9w3bOp+mXHrEGp45jOxKqCVU0VIndKboqG3Q8tHZE4yfJOvZECbBEXi1Ds9L
	LoxEo1BNKRf506fWqFwwmm0zFx9iG/HePZrfUnJvD3d8xZcepHE37V/P9sFjVevcFQliQH9
	zTy7rCIMY3A0zAU4K/a2gnCeFSrO+JsG+k8h4e2tB9X26xV0YRtRQhO0W5KyPC5Z7cXMGSt
	vJu2hUiY9XwXS7cX9umuELLzw+OESvcYA8Kq6kb2lYzqOtjxkm95MaZJcYB9GA9z3bnQgHu
	dK5OJxs1AJlUebFcq8+u7id7GShtnnp249KWuTtb/2MSIhtRjtfQ1vC3igGtn69KnL2axNl
	dAYVxTvpR65+JkOrFKXmDX3TQSq+2JgQ89ImGLdXRCS0JCaNiIuTtthyaln042fcw6UjH1J
	ZjVvbzvagGiZt3STeSjQUu299wr0BihyDQAra4yCMDAtcZXLai7b7lP039gItWCZz/ZEVZb
	w2drd2EFg9qd4ScO9qEidkATlbeus9NAQvS9e/98rDMkhDODxC9jZWqGxHtPbsaX1z25BDl
	SbJP9a7KrbZWAlfzzO16D/mihPfr3go6fqbAcDtmoJ0I4UqizHwi7wOcMLrC+PAalQssbVl
	qQbRn77y7a6CbYk9uu+IQHz+WjY9y78kMWfV+sTdjNrxxe/xwjehF+pTrKs2yKe2WCvP8U4
	vg8E1C3cRV/woQH7QT3BEG687zh3DbDEFUrrx1eFwv27iDrSbAIRJUAmNT1NdJxjZrZIsRL
	jXh6VukxN+sUTMNWMpg394=
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_203801_814610_02F92800 
X-CRM114-Status: GOOD (  10.43  )
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

On Fri, Oct 17, 2025 at 11:16:16AM +0800, Troy Mitchell wrote:
> On the K1 SoC, there is a full-duplex I2S controller.
> 
> The I2S is programmable, with the sample width configurable
> to 8, 16, 18, or 32 bits.
> 
> A dedicated FIFO is provided for transmit (TXFIFO) and another
> for receive (RXFIFO). In non-packed mode, both FIFOs are 32
> entries deep and 32 bits wide, giving a total of 32 samples each.
> 
> The register definitions can be found here[1]
> 
> Link:
> https://developer.spacemit.com/documentation?token=Rn9Kw3iFHirAMgkIpTAcV2Arnkf#18.2-spi%2Fi2s [1]
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
> Changes in v5:
> - Patch 1/2:
>   - nothing
> - Patch 2/2:
>   - dont't read sspsp value in spacemit_i2s_init()
>   - set SSPSP_FSRT bit for DSP_A mode (was missing in previous version)
The changelog here is wrong..
Correct version:
    - do not set SSPSP_FSRT for DSP_B

Best regards,
Troy
> - Link to v4: https://lore.kernel.org/all/20250921-k1-i2s-v4-0-4f819f50e468@linux.spacemit.com/
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
