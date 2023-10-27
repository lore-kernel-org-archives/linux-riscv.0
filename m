Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A709C25B67
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Oct 2023 07:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bTjBnRzZr1TfSE16DOW6DVafHlX+2084BqlxNLOanSc=; b=P0bd3arSzjdUo6
	B3QzjgrFh7KAn8HUORs8JzF3NvHp/w/XVayDCbrC1AvpLOtIROi10jOhFsissC+IZq6Iuq/827/Aa
	kHcy75Mt2Nos7HDDLoEzfMNPt2VeZbt7fl4RsJGzC7nTS0eEVHP89WkpW0qvjERQCeOZS1MmSTPs1
	VK7Z5+NXjyS76gb493rq+jtgVRQ4SV0uQSgXr7AYJOnEyD8MYusnCQU1IyOTNURrVwXJeHVGkSgCR
	2G5Quck1Hm/5uHNy/4msc65bSoFx2jgwEJyzZPSnFEADBGDym+HlcaHHBCcYMi4kXH3KWkhZDUf0q
	2wm0dGWj74FbqLWXmiBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwHj8-00FrCy-0a;
	Fri, 27 Oct 2023 07:57:54 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwHj4-00FrCD-38
	for linux-riscv@lists.infradead.org;
	Fri, 27 Oct 2023 07:57:52 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1698393469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UKtr3c2y4bwdF/vP9HE6zYBjusukdEz9+E2VJT4SVls=;
	b=Kz4Oggw8+grS0WSKVO+9MyGnS273ejuWYfJtGOvjd+CrftpUcSKRYKB25UcvePrTyRUlSs
	2P0RuymBweHmZZl5FsV8xqWoBqmdRn0zbK7N8WWtILTzveoXeY2XO84P9T0p5TfUVhx3ay
	wibhPTvzyaD7ZzC3uJcb8H8Mi02++PkV8/EuKoCf/eu6/52Opr2i6yIRSQefcftlng5mRR
	VL4S1IE4ek7Hnn6UnLxbtKlgGQl2cs/U9TrZ8fjUu39NJxOp0Ivjzx9moEIPNNvVd7nWYn
	GAUKA1xDr3RyizeolP4Ma2oL4Wwbahd0nrZt1iWfAFE13FmnUArSmfTp4/51YQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1698393469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UKtr3c2y4bwdF/vP9HE6zYBjusukdEz9+E2VJT4SVls=;
	b=64RmxwlmEIlKoZMqNa2m2RVJYbjNA5l71PuX77/hdLLuwKlQzC6xWex5nFyGrKhx8nwNfY
	DzKX9jc4LGiriABg==
To: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH 2/3] of: property: Add fw_devlink support for msi-parent
In-Reply-To: <20231025142820.390238-3-apatel@ventanamicro.com>
References: <20231025142820.390238-1-apatel@ventanamicro.com>
 <20231025142820.390238-3-apatel@ventanamicro.com>
Date: Fri, 27 Oct 2023 09:57:49 +0200
Message-ID: <871qdg4hvm.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_005751_151872_4A989EE9 
X-CRM114-Status: UNSURE (   6.30  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, Rob Herring <robh@kernel.org>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Oct 25 2023 at 19:58, Anup Patel wrote:
> This allows fw_devlink to create device links between consumers of
> a MSI and the supplier of the MSI.

How is this related to the two fixes in this series?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
