Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2B82E64AB1
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Dec 2024 14:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=B10BEVxlUEz6zo/vGx2OQmtmktUs06c2W8rp4x5o3D0=; b=vkZd03aESJ8iHSd8MSozOGje6R
	HP4W/UPc4FYoaDhTDakXRx0w/zwL9OtJBjod0xFk3Qk1uznvoKXy3oPIdxVkaowO0U3yymMNyGumI
	pN6qc0/P9tqW+iFEsr9vkoa2fRL+dNh5rbksSi1+rNGhOr3Jjowv9n7tBC6Fpm5VhQ0B9w+0BuV+H
	4sSH0zSS3l/Ajl2IXBWqvEU5g2L4roDLZi7936trsMcCXzDb1rVlWJPkVzgPP6Xz5V5XmlwVLBtaM
	kHmzgMqLGHVCsLT2w3XX9S1fHOitd/QrNg165cj5iKo/xrd8V/S+Ak7SeELYWgVLKVZZymmDbPCbd
	ZI0AFeKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tITpo-00000009lYE-3kw4;
	Tue, 03 Dec 2024 14:25:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tITpl-00000009lWZ-3vOT
	for linux-riscv@lists.infradead.org;
	Tue, 03 Dec 2024 14:25:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1B5995C61C2;
	Tue,  3 Dec 2024 14:24:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74ECAC4CECF;
	Tue,  3 Dec 2024 14:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733235900;
	bh=2YzBw+E/SaxJ/Xhevrp8m+nYUF9iMZkfbG7PMPw8nWI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=P1QUk00RJ2PQq+Qud5Wj6Mzq39OAz31Fl9JSjIedmjs2mJ5LYOEWDr9s8NMXluet/
	 SS/ffNdlXggtzaImkIfGRdUEWBUUpQDQZP/g/a37xT8spsdDDvWreHJHAdROhfznQM
	 nVCIfbP+cvg2lAud0q8TOme+5AzThCyB6tr3k1+0akaLGEPOdMr+FXUBc67yNp49+M
	 1MCOAP/YHePnW+FLTlivfy7VPudy/TpYmHlo0YbMwK6Q0NnwQu/auewyxZT0LWN3F/
	 Jm2Mc62VpmD/14mm30U5n0xjHkbldkxTaQgc3g9swouxv/61KjDqFLTsEVYEul4DFz
	 jJvsOi0VhCcYg==
Date: Tue, 03 Dec 2024 08:24:59 -0600
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: maarten.lankhorst@linux.intel.com, aou@eecs.berkeley.edu, 
 wefu@redhat.com, jassisinghbrar@gmail.com, jszhang@kernel.org, 
 mturquette@baylibre.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, ulf.hansson@linaro.org, mripard@kernel.org, 
 linux-kernel@vger.kernel.org, frank.binns@imgtec.com, 
 matt.coster@imgtec.com, linux-riscv@lists.infradead.org, 
 linux-pm@vger.kernel.org, guoren@kernel.org, sboyd@kernel.org, 
 linux-clk@vger.kernel.org, m.szyprowski@samsung.com, drew@pdp7.com, 
 krzk+dt@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
 airlied@gmail.com, simona@ffwll.ch, tzimmermann@suse.de, 
 conor+dt@kernel.org
To: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <20241203134137.2114847-6-m.wilczynski@samsung.com>
References: <20241203134137.2114847-1-m.wilczynski@samsung.com>
 <CGME20241203134155eucas1p1e90c71c4f8eb5da41d2cc8a500f54dc7@eucas1p1.samsung.com>
 <20241203134137.2114847-6-m.wilczynski@samsung.com>
Message-Id: <173323589655.1743530.2406812042403623910.robh@kernel.org>
Subject: Re: [RFC PATCH v1 05/14] dt-bindings: clock: thead,th1520: Add
 support for Video Output subsystem
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_062502_014207_3F385676 
X-CRM114-Status: GOOD (  11.60  )
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


On Tue, 03 Dec 2024 14:41:28 +0100, Michal Wilczynski wrote:
> The device tree bindings for the T-Head TH1520 SoC clocks currently
> support only the Application Processor (AP) subsystem. This commit
> extends the bindings to include the Video Output (VO) subsystem clocks.
> 
> Update the YAML schema to define the VO subsystem clocks, allowing the
> clock driver to configure and manage these clocks appropriately. This
> addition is necessary to enable the proper operation of the video output
> features on the TH1520 SoC.
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  .../bindings/clock/thead,th1520-clk-ap.yaml   | 31 +++++++++++++++----
>  1 file changed, 25 insertions(+), 6 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241203134137.2114847-6-m.wilczynski@samsung.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
