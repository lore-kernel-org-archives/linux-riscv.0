Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1AE0C35274
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 22:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WBPEWQnfLy4imDyVqMLQPxzzT+HQAdMKnA+hh2lvI3w=; b=KivLnftII4sczE
	9IC9uMvtC9zrXg3OouH+ducquA6xTULob8mDu671iYnz5Ryx0Keu3+EuT1A0hsvrgGxCVYE06z+Ea
	TapV9FLbjEa3OsjJM/34S41sQvUloJFqZhgA8euuv8G1PhZdoVGW6UaDI+RfCtFlh9q0SiDu9M6yX
	EwmuL3aULjh4ZPHyECxs2p9i4KQqUwkXlxGrlaRWjdlulT0yzQNAotWXCwG/s99rItBOwP6iJRLAM
	XOU8KpzLB+btJcqjvgmSLyw8ELo7/jiKdLgMEMbOFNPGyAte/4XWAS4lBv1fh3uKsNQ/nxJ09On64
	Lbt//e8A/aWINc6LWgEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFMa4-00CHJ8-0B;
	Mon, 18 Dec 2023 22:59:24 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFMZz-00CHIf-2u;
	Mon, 18 Dec 2023 22:59:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702940355;
	bh=XxSneoKB0phG9Xq6G4JnE0CG/YoBow6E1NyN18LLUPQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gHETnA5p/lEpjV9CbNjCMYnR6kNnu4AhRFm+FRwHlwQJUiOVe9xWbRVbwXW01J2pl
	 rMEGm2Z/GC9xFC86vAB5MTbZdhgLkxTFfVB/O2IUILJSAPQP6sGKKl7lL88B0U7UBX
	 l47X7qcjTFIB314tc8qdAPvwZ58EIPp4pklot+331Ffks575JS7Tqffs4obDe6ODrf
	 oQxDUj11pP/nJnRD+XCFU5gs+SsPJMoe+HMSXCpmaSVYEL8ZxaVQeS2G6JRg7tNHC8
	 eJ4ymoeS1+9gludH6j87/vXb4AczG5rpiHVHw9xqreYgslJvTvJvY8FY55NhnM6XNp
	 tUfM53gKU7clA==
Received: from [100.115.223.179] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4C1FB3781453;
	Mon, 18 Dec 2023 22:59:14 +0000 (UTC)
Message-ID: <426f4baf-4aa2-48a5-a4e3-2fa361c0bc4a@collabora.com>
Date: Tue, 19 Dec 2023 00:59:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/9] Enable networking support for StarFive JH7100 SoC
Content-Language: en-US
To: Jacob Keller <jacob.e.keller@intel.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Samin Guo <samin.guo@starfivetech.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Hal Feng <hal.feng@starfivetech.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
References: <20231218214451.2345691-1-cristian.ciocaltea@collabora.com>
 <453e0abd-30a4-4abd-b5ae-63d9982ec1b8@intel.com>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <453e0abd-30a4-4abd-b5ae-63d9982ec1b8@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_145920_184243_8E621A8F 
X-CRM114-Status: GOOD (  11.73  )
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

On 12/19/23 00:53, Jacob Keller wrote:
> 
> 
> On 12/18/2023 1:44 PM, Cristian Ciocaltea wrote:
>> This patch series adds ethernet support for the StarFive JH7100 SoC and makes it
>> available for the StarFive VisionFive V1 and BeagleV Starlight boards, although
>> I could only validate on the former SBC.  Thank you Emil and Geert for helping
>> with tests on BeagleV!

[...]

> I'm not super familiar with how the various pieces fit together, so I'm
> not sure how valuable my read through is.. but I didn't see anything
> obviously wrong.
> 
> For the series:
> 
> Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>

Thanks for the review,
Cristian

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
