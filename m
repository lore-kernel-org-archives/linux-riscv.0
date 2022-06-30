Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0088C43334
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jun 2022 15:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N3a4M0dRhOklRpBhoQwl1kmfbYKK/xDihN9/9RmyqPY=; b=e4eH3pjaXA495z
	md8dtmslW2AM7GEQVx4Q9EN5IprO8DcabvcfJIUgAt57LQzUdixo9l3xhtEbE0XHQkLfs7/VEO/Oa
	4nTR0/1EHtcXs+jTLaFlo9klpER63V8L6fmDsJy+rmzruEm49cDNX6YouIzAIRT5Wfs7n90J99cj8
	9UT+sel54Aicgkn9mfO49Xm0PyzWxO+RhT+qCwhdInmGkUge8U1AB9kCRPE3JNYTmCymqaw483A4x
	9dzuAW8wiaeWmK0o6c9epwl2GsKitrvWAIPdTleX79NTLmkrlttOFHSEIUJMwyRaBII6XvWk7fP+c
	odrTH6w2ZV7S8juTt7yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6wJk-000NN3-AA; Thu, 30 Jun 2022 15:42:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6wJb-000NKN-TA
	for linux-riscv@lists.infradead.org; Thu, 30 Jun 2022 15:42:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B5781063;
	Thu, 30 Jun 2022 08:42:46 -0700 (PDT)
Received: from bogus (unknown [10.57.39.193])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A2683F66F;
	Thu, 30 Jun 2022 08:42:43 -0700 (PDT)
Date: Thu, 30 Jun 2022 16:41:32 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Conor Dooley <conor@kernel.org>
Cc: Daire McNamara <daire.mcnamara@microchip.com>,
	Ivan Griffin <ivan.griffin@microchip.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: microchip: hook up the mpfs' l2cache
Message-ID: <20220630154132.i54to4l4divkbr2d@bogus>
References: <20220629200732.4039258-1-conor@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220629200732.4039258-1-conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_084248_079568_C0D481F8 
X-CRM114-Status: UNSURE (   8.62  )
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

On Wed, Jun 29, 2022 at 09:07:33PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The initial PolarFire SoC devicetree must have been forked off from
> the fu540 one prior to the addition of l2cache controller support being
> added there. When the controller node was added to mpfs.dtsi, it was
> not hooked up to the CPUs & thus sysfs reports an incorrect cache
> configuration. Hook it up.
>

Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>

-- 
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
