Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0084C61CE8
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jun 2025 13:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zUGsQcIqgjTi4+biKeDwXLjKcmLpy8ZW6A3bKc9QW+4=; b=l/DUk6m6ZkhAhX
	ljjIFpiw2y91LPLTiXhmZr5/n/Hjg8Xnt7eTFxDWfBojb8GXvSkWZ+D4rzcBEa6aZlm24hEn8bBTX
	IK0Makug8V/d8sWQ1zYGZqHEAl/ZBtV+YXEwnlRomvPLJoMpUi3XsUNMn5Jc7DhuZFM0NpzFDkWkh
	qjuayrrYtphzcX9l816lFn11vd7npYetJuj4QHVVkPKleuoz+iZ5/9akjTViK+7hLbRukeewTgWt5
	AilkYmRUTB2t4vMb7yaKBjHXcqaDF0nAF8czOu2JjmGY93frdV8/byd8iWK9X2o8VgnYD3ki/AGZ4
	QQXshYYUfnCbcYMLnvEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhrw-0000000DQJk-3BJ5;
	Thu, 12 Jun 2025 13:21:24 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhOU-0000000DIxq-2Qnz
	for linux-riscv@lists.infradead.org;
	Thu, 12 Jun 2025 12:50:59 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749732652;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=w25nhMgVqdOfPC/cHt9LodtYaiDNkuaOb39/bucgAv4=;
	b=sMt2SYSHVg2g/iTY8jfJnT0nY2MKBqfXyJYeozgo134YmbiW+0PXzc8WShhyN7XT75MWhD
	uFUiP0m57NjwZ5oyDaPzWAHkzdl0pPi1Ddv1HekeJhmbkV+b18mS06MYtKF6PDJdVUxyN5
	TIrF+K22K50w6gNuCsq3tToBw1Cbc0HMorZIKbTMRpfIvFEf+fpUKndTG6q9V9ro77AGd8
	T+mVGE2k039VomkITimMF5DRitpb8fL7AMFPqk7i1l/yggQ3/nripCRbvDJPYGDDoRBbl2
	x5Ud+q6QJO7ppqVKlhtjba8cZNYmjtUl8P3kMFE3Fr5wn+NZtY6HLd2vM1LnAQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749732652;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=w25nhMgVqdOfPC/cHt9LodtYaiDNkuaOb39/bucgAv4=;
	b=OMVrBsowEer3f9arJs9mXBrwL3AVPO+UqHab5iE0xbYgvvUPPnKv/Elg+VeNwXlWFewJb8
	sel8OToCmpkvOxDQ==
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Chen Wang
 <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, Sunil V L
 <sunilvl@ventanamicro.com>, "Rafael J . Wysocki"
 <rafael.j.wysocki@intel.com>, Ryo Takakura <takakura@valinux.co.jp>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, sophgo@lists.linux.dev, Vladimir
 Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: Re: [PATCH v1 2/7] irqchip: riscv aplic: use riscv_get_hart_index()
In-Reply-To: <20250609134749.1453835-3-vladimir.kondratiev@mobileye.com>
References: <20250609134749.1453835-1-vladimir.kondratiev@mobileye.com>
 <20250609134749.1453835-3-vladimir.kondratiev@mobileye.com>
Date: Thu, 12 Jun 2025 14:50:52 +0200
Message-ID: <87h60lrumr.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_055058_788654_D427B130 
X-CRM114-Status: UNSURE (   3.89  )
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

On Mon, Jun 09 2025 at 16:47, Vladimir Kondratiev wrote:

Please use the documented subsytem prefix nomenclature:

https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#patch-subject

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
