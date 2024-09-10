Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D64F3ECE582
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Sep 2024 07:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1tSb6Nm5srWwdwjeMNZzC8ow8pHbzZN9yt4934VGF1E=; b=m9Xsngym4cyFSO
	WPQd0NKrNPlobP+RAa+FIDMG/v5HZy41mIfoQvx/1zaZEqZpm2JKw0dTIId8w35taHwGxTkDFyI4c
	vX+RKBh1kxglIcySKEMwBTVvyjRjLLZKglLbb/Tm/8cWlU11tBlRtVZWnaAKTZLwmMsecIHhZpv6E
	SbIWjI+cH43FW213kd2XbOrijxQOTVdCWVjnXIeh6dTMLJUpObyRiJBW/UVT5Zp24q8hx7egJwP0Z
	YRmYe77vj7M9nkX0vIAfqssDoGI5wYx/pdXm3U+jQYwnTER1PnUO7l+m99E/s3+ZK9HcUHkMUVYui
	8HZTaly4ws97hhjV/Ecg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snvZ1-00000004f0P-40rr;
	Tue, 10 Sep 2024 07:45:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snvUv-00000004e5o-4214
	for linux-riscv@lists.infradead.org;
	Tue, 10 Sep 2024 07:41:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8BF725C0581;
	Tue, 10 Sep 2024 07:41:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D690C4CEC3;
	Tue, 10 Sep 2024 07:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725954072;
	bh=snAB2tdXCnqKC6Qfh4W9stiXFqOoO8KWhEKAuOrN4UM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H5VqmMrWsbd6uECOztim29wGz414g5qg2DEABQl1yTEwZXgSGWOnM8CSQ+yWR1Xfg
	 T3IZGyR/ySFDS5s8RS25TBTlAP1znCAaCW14XrPIgYIIrCoBtMJmlCvjdOhhY8ZgAU
	 qAlblk7drRkqScptp5TnwwTChdtfPbar4JvV/iE/pKLb4IMuV86798cIDdN9PRYpiG
	 H5b+mBmhxWo69OzcnCgDVB0VVN16R05g8oF2Soev2MohY64RLvVHRZLCZtWg0L43Cx
	 WrTpWvjpHJHEAs95EnfBt8sHBNLHU6znbQy2kPRHTlrW5JnJEt2zWe34LFtP1O6YgX
	 /O6OE44c2ao7g==
Date: Tue, 10 Sep 2024 09:41:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chen Wang <unicornxw@gmail.com>
Cc: ukleinek@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, unicorn_wang@outlook.com, inochiama@outlook.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, chao.wei@sophgo.com, haijiao.liu@sophgo.com, 
	xiaoguang.xing@sophgo.com, chunzhi.lin@sophgo.com
Subject: Re: [PATCH v2 1/2] dt-bindings: pwm: sophgo: add PWM controller for
 SG2042
Message-ID: <33wi6plp5ebovfzl64cndw532ob75bwlpn74ldnqd2ggktrp6z@tooe3usdh3cl>
References: <cover.1725931796.git.unicorn_wang@outlook.com>
 <c2b237b5b2430b0715c9c3dee043d30fe5216e2e.1725931796.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c2b237b5b2430b0715c9c3dee043d30fe5216e2e.1725931796.git.unicorn_wang@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_004114_062144_E3E1B79C 
X-CRM114-Status: UNSURE (   8.63  )
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

On Tue, Sep 10, 2024 at 10:08:10AM +0800, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> Sophgo SG2042 contains a PWM controller, which has 4 channels and
> can generate PWM waveforms output.
> 
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> ---
>  .../bindings/pwm/sophgo,sg2042-pwm.yaml       | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
