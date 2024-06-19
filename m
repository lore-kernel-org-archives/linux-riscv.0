Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 118BFC27C53
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jun 2024 11:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oD7HbwVivAaCtHkS+kffRycdGwrQ1opmNN2Fhzf1kbo=; b=nqaIlNqHuyWHmi
	rLZLWEGeyEph+WdtqHL0e0/Hcl5IEtMGuhIAzE/HiceXh8XP54qSRAoi7tHOmU2PdPLLz5SGM4pO3
	4oxq1YZhT0bgMjvnvlh5mJqvf/z0Xfu5/d9Hj229Q3IGUyEVnqh07HnbGKtOhYjNktuXm0p+Yf1IX
	UOt3to81I7GwSryCkyIpHIB0hVCi0xqnuLXQyBkSiRuW8dWAVUJxxw+4ZxcRwudW9lPyfM+UntSDW
	qnP8THO3siIHgETXGXyklKfL3m6Mb2FPkIHc6yTXHZEFUV7ycthMYgIhyy0Lj1rHd2WdhPqugIWew
	8szu11MEs9yCEkpTGQGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJtMu-00000000wCl-1Kas;
	Wed, 19 Jun 2024 11:20:48 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJtMr-00000000wCJ-27K6
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jun 2024 11:20:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 652C6CE1C3F;
	Wed, 19 Jun 2024 11:20:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2BB0C2BBFC;
	Wed, 19 Jun 2024 11:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718796042;
	bh=XScUQ9xKv3viE4nGItvwHd/wPr1+lIosTNq6JX2Fov4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Xuu3dwIU1BinnJ0NQFA2MRNMzhgQeHidolw/WeXaf55AsYFKLjzAIBZoBzXKfVpnc
	 ytL6xowDO6phB2Dqjvv2M4zyp2a7FDq4M9/nVIgI4p8h8a9w0P9ouAtYJhi3OWOch5
	 6jvwKZwLQZ8dLyEY8yW5P6MCZeUUiagXUuCKOsf6kbKRhu1cES0vTbr/HJ9GmYPBKa
	 v5cG1Jl6R5j60PYFV4MQM0r3sDsCZHVTMqceJyuPynHLMsnHzDdqjYT77Fq6/7zzmO
	 c9cWxVEqKGz47edpxEpTIsOd7+C+9u9ikCuP+Aj7B9RUZ1+6m2crg2js2EzTNrqZ+c
	 knPVb6CpS49Yw==
From: Conor Dooley <conor@kernel.org>
To: kernel@esmil.dk,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	william.qiu@starfivetech.com,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Shengyu Qu <wiagn233@outlook.com>
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] riscv: dts: starfive: Set EMMC vqmmc maximum voltage to 3.3V on JH7110 boards
Date: Wed, 19 Jun 2024 12:20:00 +0100
Message-ID: <20240619-slicer-embolism-1d74656749ab@spud>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <TY3P286MB261189B5D946BDE69398EE3A98C02@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
References: <TY3P286MB261189B5D946BDE69398EE3A98C02@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=688; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=hyxqrF+zdFDORBV9MQKebE44wmRMdbJxx9CDCqJHNeA=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGlF+x4Ybd5Uqy4eu9LcKC/4zYp3bdlNki9sdDXO/N5Z3 bDk+iTRjlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAExkyn6G/5l6YcZ5l16rds5t +S08Y+eN9RHidrNmn47ddUz1zVWZN/sZGbZ71ASfu/rC19dpBfP1w2L/nm0JujH7fXD7kg/lKU8 /OXICAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_042045_780742_55C83847 
X-CRM114-Status: UNSURE (   9.76  )
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

From: Conor Dooley <conor.dooley@microchip.com>

On Wed, 12 Jun 2024 18:33:31 +0800, Shengyu Qu wrote:
> Currently, for JH7110 boards with EMMC slot, vqmmc voltage for EMMC is
> fixed to 1.8V, while the spec needs it to be 3.3V on low speed mode and
> should support switching to 1.8V when using higher speed mode. Since
> there are no other peripherals using the same voltage source of EMMC's
> vqmmc(ALDO4) on every board currently supported by mainline kernel,
> regulator-max-microvolt of ALDO4 should be set to 3.3V.
> 
> [...]

Applied to riscv-dt-fixes, thanks!

[1/1] riscv: dts: starfive: Set EMMC vqmmc maximum voltage to 3.3V on JH7110 boards
      https://git.kernel.org/conor/c/3c1f81a1b554

I was kinda holding out for a response for Emil, but I've applied this cos
I'd like to get a fixes PR sent out later this week.

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
