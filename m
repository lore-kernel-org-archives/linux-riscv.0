Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41534E7735F
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Sep 2023 09:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KAXlmf7XRNKqTFbftT5QMty4mrzdpbER8yXZoYUe4DI=; b=g7NK+COoXk+TQu
	5r2AgX5pPI3Yzaw0f9L2+JGkB2H1z1XNsjQmMAuiFqRvdrec+j+fIq5B4gA8C/MqRcE2Z13gQCbLZ
	PPb5c1eOTmaEshVWu4eNZxqQkC7yLBKXBe2H5PZeh263eUf6C4+IsMRNyXoKIH0KideJHbQaNx79z
	1XHrtLsarbE0m5Ho+2RTKW6/k3epS9sIcUzcXQwtvEU29GyQQpmCNjwJc2QnlRfvdYNmJPfbvEL7w
	UwOKWZtGYnyIzCvITDQ5GlpU4JItAzgM29fKRgw3EqHkHC6EBnwuyU9R7rL4nH/4+oAEKI4tIN/fW
	SDszkrxx2w29ve0mI42A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qmVpQ-009Cjm-05;
	Sat, 30 Sep 2023 09:00:00 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qmVpM-009CjH-3C
	for linux-riscv@lists.infradead.org;
	Sat, 30 Sep 2023 08:59:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 391DBB807ED;
	Sat, 30 Sep 2023 08:59:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CE8BC433C8;
	Sat, 30 Sep 2023 08:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696064394;
	bh=1NZBpNaePwgZyqTYVZzHQMy6LAwMcDHJLc2HBjoXiRE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aYJJKganbX3CrwsaFP6Ya8fNmRlm6VYhCesgYNknoAOLq8CD4oGZUiwDQ6ZjAwIN6
	 hvdS6pG4aY0zkjIvgcHpAbH/sQ+HGzTatB8CWL7TyJpQOj05lqp5ZJsAA99t9njbed
	 WLwdRMkHIanVfLmwzkGpWvoM6wZqeMY+vBmrNSe2JhD1Prcwsc5VHC0U/8O7yJ3JHU
	 +HSqmMJXWATQdAguQ/8pl9BQuTUsy6+1EbowQYbsr0AFjl3ZgnBuQ+CJDd+79mGRgw
	 rDxrTbnMqQMx2FHPrapN7Euy0nHFRHRxj3sVVcJ6IMgSWuu0jmK+bD7KGPXxxI1FEu
	 BplZmUREXbPag==
From: Conor Dooley <conor@kernel.org>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	William Qiu <william.qiu@starfivetech.com>
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Jaehoon Chung <jh80.chung@samsung.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: (subset) [PATCH v3 0/3] Change tuning implementation
Date: Sat, 30 Sep 2023 09:59:36 +0100
Message-Id: <20230930-unmoral-mutiny-e3f91c0dfee9@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230922062834.39212-1-william.qiu@starfivetech.com>
References: <20230922062834.39212-1-william.qiu@starfivetech.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=614; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=oc9r++Iw46ON8c3zQoZkFVZiJ95/zJVfIOBlU0YyBzE=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKnij8s6zJ/s40s25vz64se9FoHD5w+FbtqR3RRnwFZmU Rplp8/UUcrCIMbBICumyJJ4u69Fav0flx3OPW9h5rAygQxh4OIUgIlcfMnwzzp9Qkx6jBCfwY71 YdME/p75tHjKXvv0H88OhCrP0GIWPcjwV5Tb9V6c3p77qyteaCa0qE+7HtmbanpwB1+q2Ot/0o8 aWQA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230930_015957_202104_CC97B2F3 
X-CRM114-Status: UNSURE (   8.43  )
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

On Fri, 22 Sep 2023 14:28:31 +0800, William Qiu wrote:
> This series of patches changes the tuning implementation, from the
> previous way of reading and writing system controller registers to
> reading and writing UHS_REG_EXT register, thus optimizing the tuning
> of obtaining delay-chain.
> 
> Changes v2->v3:
> - Rebased to v6.6rc2.
> - Dropped redundant criteria.
> - Keeped "starfive,sysreg" in dts file.
> 
> [...]

Applied to riscv-dt-for-next, thanks!

[3/3] riscv: dts: starfive: add assigned-clock* to limit frquency
      https://git.kernel.org/conor/c/af571133f7ae

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
