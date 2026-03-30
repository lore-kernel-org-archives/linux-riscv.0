Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F6A910D14AD
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 12:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=n6Vsx7cQD/2nKD4TcOB/IIletNFMehMO7meUaXRSZtw=; b=JYIWpyTaQs+hgOVxP0rpk5Ob36
	KyjW9uVfLHg3ccQb0AcQ8cGm0l2/lEaLLqOeB/CNyLQWNHzBhAdaxcgGCc9TVmpJ8Co1UTVTX6r/A
	aqnhGZRkMFS6sqRpSlxQ26sTeV8Yh216M6xW2Yb+UB/8n/R6gaNXsiFr8N6oxWa52WvWs7FV+Gx/Z
	hH7hEplTCNJanVfjKXot/LEUU99Ld25XaxXOw899tinUYWDatLRzRWudM2F1fDlfF2z1xIdPzcDCN
	yfEgAUnXNxjBjEOmTiRMk3YNLndCW6vyvulHgrY4JUsrmZaEr/tX+Rw9KetGl2VxvGO2c9kP7Hlj9
	ol2HD/rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7C5W-0000000BHva-3xZV;
	Mon, 30 Mar 2026 12:51:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7C5V-0000000BHvR-2lrs
	for linux-riscv@lists.infradead.org;
	Mon, 30 Mar 2026 12:51:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 52786600CB;
	Mon, 30 Mar 2026 12:51:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D16C0C4CEF7;
	Mon, 30 Mar 2026 12:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774875084;
	bh=8bWW/KZZTr5eXqMQBWSZEIrv8SgQAoeahWQfpUbb+0Y=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=D1VfICwbx71VBAanzB9+6jaBrn1/zKNp3ISCWtfo44Bdt8SkYHLru+9cC6qJheObn
	 nsWMH46l9jtGytZ1drwIMmMy/ZuPy50N+bi2DvcJSW887kf3Jgm9KfB2zCVGyAGcDl
	 EK4sCx+wUVFfSVM8GcjvNs6qfWCpA9KfgQLQQt2vPSIGzA0w2b/7ouoZ5PIrXP4oM4
	 U1yzF28+dB72BClYlaAL+fMxO3/EJXmQn6fRchgkXRTAGNsI/T+ZhLDdQzJhElNJml
	 3Fh+U4z0uU1ZmjQMkS4wGfZJL8+wXC/vsq9XeFLmSo/YP5BYj08s+q62xtvlom4fvF
	 uUxgSA7cKNDtw==
Date: Mon, 30 Mar 2026 07:51:20 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: krzk+dt@kernel.org, jonathan.cameron@huawei.com, pjw@kernel.org, 
 palmer@dabbelt.com, conor+dt@kernel.org, aou@eecs.berkeley.edu, 
 alex749@andestech.com, az70021@gmail.com, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 geert+renesas@glider.be, alex@ghiti.fr, magnus.damm@gmail.com, 
 ben717@andestech.com, tim609@andestech.com
To: Hui Min Mina Chou <minachou@andestech.com>
In-Reply-To: <20260330102724.1012470-6-minachou@andestech.com>
References: <20260330102724.1012470-1-minachou@andestech.com>
 <20260330102724.1012470-6-minachou@andestech.com>
Message-Id: <177487508031.2247754.831796651181832880.robh@kernel.org>
Subject: Re: [PATCH 5/7] dt-bindings: cache: ax45mp-cache: rename
 ax45mp-cache to llcache
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


On Mon, 30 Mar 2026 18:27:22 +0800, Hui Min Mina Chou wrote:
> The AX45MP-specific cache binding is renamed to a generic Last Level
> Cache (LLC) schema, as the driver now supports more Andes CPU cores
> beyond just AX45MP.
> 
> Updated compatible strings:
>   andestech,qilai-ax45mp-cache    -> andestech,qilai-llcache
>   renesas,r9a07g043f-ax45mp-cache -> renesas,r9a07g043f-llcache
>   andestech,ax45mp-cache          -> andestech,llcache
> 
> Signed-off-by: Hui Min Mina Chou <minachou@andestech.com>
> ---
>  ...ache.yaml => andestech,andes-llcache.yaml} | 20 +++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>  rename Documentation/devicetree/bindings/cache/{andestech,ax45mp-cache.yaml => andestech,andes-llcache.yaml} (76%)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cache/andestech,andes-llcache.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
 	 $id: http://devicetree.org/schemas/cache/andestech,llcache.yaml
 	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cache/andestech,andes-llcache.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260330102724.1012470-6-minachou@andestech.com

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
