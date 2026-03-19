Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 562561090257
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Mar 2026 17:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lm0a6fno75KTSYjM1yrgp27BQ2DAU57Ri+mGy65v6KU=; b=Zqhq0Za3BE2z3a
	h2Vkzaz2aZ9Q5kUFkRN1/1gw4sGFBPocsKbTGAdycz2JBqhEk3jDgI/Qy2VTVrAdY5nzzjLYbGWQF
	6abe5ob4tg5HZaPvhNDuwTD4DMenIurZPWiE/thPM/BAVTao6h2g+Fd0Fc76yXpw0acsKv/wJdQ5c
	hTfNtYkxPYHV/D3h2tBSU9Mk+CnWDmMgzmx1LjyykAPGxCNFq9/nBlER13XE0EqC79eRpKnLZ/FcK
	s4xadSoOMr44djAgBncr/OnN1//m6SlV7xdeIpyJMfY5pAAyeY0JXU+ogKc9iJggEL7qJju/7sna3
	d2/+jX93zKL4RfTp+y/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Go2-0000000B9Eq-1Ncw;
	Thu, 19 Mar 2026 17:05:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Gnz-0000000B9Dc-1SU4
	for linux-riscv@lists.infradead.org;
	Thu, 19 Mar 2026 17:05:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 723BD43EB2;
	Thu, 19 Mar 2026 17:05:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18BAAC19424;
	Thu, 19 Mar 2026 17:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773939905;
	bh=dp5TXBiDu+vK4NhHATnAX3a+wpecLWfNEQc3Apzs7i8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Iv6+cWyOCRLbOqlRnp3hXQJEjDZGLaAjmgz/CeEaHpG1cEfd8eYys8Wblh3Wr11+A
	 k03QXjcb20gVQGEBAiVAsIwL5Xr/137DDU9GABRiuwFbEEbtFH//BjlL/GpmH3HTfz
	 xg6y/PdZBVGRNXkYuhgSUt86vhChxbrk6Cha0G/j0I7GC+ILLAWsqB//7XrgIBWR3b
	 UK2QN+QfPV7Ig22C+rE2q3OkeY/9GwDYjMKKAdhWltSBcWhW/JB+xeznWkbzGYX1kN
	 NX/HKKCJkJBwOiw+no8ULxPUt7m4MPLg9s8QIclN8evMHfzI/z5B/Nc1c9tnt6mFWd
	 XLyLp1FSeXo6A==
Date: Thu, 19 Mar 2026 10:05:03 -0700
From: Drew Fustini <fustini@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: moortec,mr75203: adapt
 multipleOf for T-Head TH1520
Message-ID: <abwsv3t1jdWJ7sZf@x1>
References: <20260309162457.4128205-1-zhengxingda@iscas.ac.cn>
 <20260309162457.4128205-2-zhengxingda@iscas.ac.cn>
 <7f043ae1-c863-4884-a2c7-710a8d9d8771@roeck-us.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7f043ae1-c863-4884-a2c7-710a8d9d8771@roeck-us.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_100507_441448_2C224238 
X-CRM114-Status: GOOD (  12.01  )
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
Cc: linux-hwmon@vger.kernel.org, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rahul Tanwar <rtanwar@maxlinear.com>, Icenowy Zheng <zhengxingda@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>, Guo Ren <guoren@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Mar 17, 2026 at 08:55:05AM -0700, Guenter Roeck wrote:
> On Tue, Mar 10, 2026 at 12:24:56AM +0800, Icenowy Zheng wrote:
> > The G and J coefficients provided by T-Head TH1520 manual (which calls
> > them A and C coefficients and calls H coefficient in the binding as B)
> > have 1/100 degree Celsius precision (the values are 42.74 and -0.16
> > respectively), however the binding currently only allows coefficients as
> > precise as 100 milli-Celsius (1/10 degree Celsius).
> > 
> > Change the multipleOf value of these two coefficients to 10 (in the unit
> > of milli-Celsius) to satisfy the need of TH1520.
> > 
> > Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> > Reviewed-by: Drew Fustini <fustini@kernel.org>
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> 
> Applied.
> 
> Thanks,
> Guenter

Hi, what branch is it applied to? I don't see it in next-20260319, so
I'm thinking I should wait on the dts patch.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
