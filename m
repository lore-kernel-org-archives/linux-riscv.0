Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E83FCD37B7
	for <linux-riscv@archiver.kernel.org>; Mon, 11 May 2026 04:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4j/HReEzEYh30NEQaozn7eo8zUGJz900am3S/34F890=; b=dLRRtQr2+j4FUJ
	n4f7FX49fwkVOOCmWgCdyHa+bHNaB2ipjRRRArfQwWO8Hj0LFF3nnUe/vhzrOLSY0f8gM7Fop0++X
	Yj801mywGej22szqSzNr3EqCD+bztuHXyDXYaS7UtVKiolrPmrEsqUu5eZqu2e8DKcZA0wXMrmPMH
	BhvgzEG2MMfy6JEMUg/a1fs3Q7YtFY4qzVZk8gAqopQiEMh+4AT5YoYtOp4vBDxT6QOZmp/ll6oEn
	KBLuRdl7FsPK0kera/G1vtqoS4T9RCP8AA9Hw/AMjjaIkepH3YvWytxsLqrkLVV8ljlvxp6YUlSS0
	pKNZLm5A46yyIQGcmCig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMIbI-0000000CIcq-2Ppc;
	Mon, 11 May 2026 04:50:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMIbG-0000000CIbn-34N1
	for linux-riscv@lists.infradead.org;
	Mon, 11 May 2026 04:50:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 08CF643759;
	Mon, 11 May 2026 04:50:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B63B8C2BCB0;
	Mon, 11 May 2026 04:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778475037;
	bh=iXnH4xL/sNUx84mYT62A403ppNgf+sxnvjWMK1wR7VI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L4Z6LaDlRw5xH+3w+HR5VRFc5AbhxsdAuBVB/n6zwvj96hIRrR37T3CkCzjqcTl96
	 s1/i0UK36KRKl+g0shnHIhANpLHdo+MjZ+C3tpY88ehhzj8YH4K3w1ggboINVQ5lLu
	 T4IYkmflVRUkhGX8NvhsiyHAlW/H/CY/akQSPj0e41O/IPIRxWXQrcY0u/wHFarV39
	 z536uO0bxtW7u59fgNkX93V3yW6YHZbIvfAl5rAYJvljJjWfm2AKU71/WSXth/aAa5
	 Kuz9MVifKUoF6MlH8Gse3I0QAqsn4evGIDJOcXuWi0MfcAvyRW4gK4VXipYUL918Kf
	 1ZbGkxs+gL+bg==
From: Yixun Lan <dlan@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Yixun Lan <dlan@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 1/1] riscv: dts: spacemit: enable eMMC for OrangePi RV2
Date: Mon, 11 May 2026 04:50:30 +0000
Message-ID: <177847502723.951835.14416544463790637222.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260509100000.3315109-1-amadeus@jmu.edu.cn>
References: <20260509100000.3315109-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_215038_791144_D5F5A7BE 
X-CRM114-Status: UNSURE (   5.13  )
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


On Sat, 09 May 2026 18:00:00 +0800, Chukun Pan wrote:
> The OrangePi RV2 board has one eMMC slot, so enable eMMC.
> Tested using a 16 GiB AJTD4R eMMC module.

Applied, thanks!

[1/1] riscv: dts: spacemit: enable eMMC for OrangePi RV2
      https://github.com/spacemit-com/linux/commit/f068b204555ad62d6a841a49feb4ea8c4f45b25c

Best regards,
-- 
Yixun Lan <dlan@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
