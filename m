Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A768F3D300
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Mar 2026 15:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NFff5b46Gtx0mRwoPMB2dyNATFiLfDz91luaZsAZdVA=; b=NeqY870Q+r7t3L
	F2wbSS0J8+PqcWdr1RfZSAwRKFqiXUQF3wVATME7M7pQZVX/6YPy6VU4dGShmPqqKMQogL7445eUs
	eOlJwnytgFjunMjV8cbSygR21j+sDkNZz0RMJgnZlKUnDT1EXJ/xa82DxppTPaT+q5yb+8ngBv1Hi
	+FWu2g4caRQ8po3USQSZzSAaZiUoYZVeuK6blHILdEer5m5Yy8LUQiqG823T1UN0WYd1P0plOPrew
	c5JETM/AuQi3D4ZTCkOkvWjzE0RMzMNn9iyfmT6cfz62KFk4QHfviftkMH+EhvIrOwbcdwc+XQmml
	Dr0QmIqm++RapBW/0cOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyAkS-000000027y8-0b1R;
	Thu, 05 Mar 2026 15:36:24 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyAkP-000000027wu-3ymn
	for linux-riscv@lists.infradead.org;
	Thu, 05 Mar 2026 15:36:23 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1772724952; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=AUBV+8s6Fr6W2Qv8QMVoNGT2ebVnAQO7jNW0DVQI0T2a/VxA0BAt/OfsL9fu5oahN8anQHCL67IhWH7+d/V0JSb+UmYsxUTD7KrEPUsdcXiX47bHDrIO5P6HQRZ336C7DldHPPMOyhZdn3akF4kzGSZsENorEDpJWLfqx/CuBSM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772724952; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=QetOvITxHtYsRZdgk4oF96+qwijXoc1Q8T2XTInT1bU=; 
	b=JRI+jqMJPI3KNTamlXKKMWt3vmxRLnPH3tAVBH+oRkCkNfoCZRz8gQMXMloPJ1KXSq+HwNJDtm+KPE0KehCEuOaEQQRPFhapx+YuaGuHCWAy9udNk0VVjCSWID27C0UWWPRKNX5858583XdbgdAVlnC5XDFBlLsswDNX3tRPslU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772724952;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=QetOvITxHtYsRZdgk4oF96+qwijXoc1Q8T2XTInT1bU=;
	b=JqG9rNmvuoHb1bv0RbxH79bpE2Si3hAPPbHP//SqKU4QMqkLc14oHuHEKfF3usha
	BPYfhbWCtPjrAtw7X/czJFdaemmoqoLrFg3CE1Mxq35dSniV2xqmf4xR5WFJf79MzVa
	a9f+LwpHEjG/nv5mhTF3uOZhkAQH1mAH4/7Nc5m4=
Received: by mx.zohomail.com with SMTPS id 1772724948845222.5524650203689;
	Thu, 5 Mar 2026 07:35:48 -0800 (PST)
Date: Thu, 5 Mar 2026 15:35:39 +0000
From: Yao Zi <me@ziyao.cc>
To: Shuwei Wu <shuweiwoo@163.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] thermal: spacemit: k1: Add thermal sensor support
Message-ID: <aamiy3IEqjTZQz2R@pie>
References: <20260119-patchv2-k1-thermal-v3-0-3d82c9ebe8a4@163.com>
 <20260119-patchv2-k1-thermal-v3-2-3d82c9ebe8a4@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260119-patchv2-k1-thermal-v3-2-3d82c9ebe8a4@163.com>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_073622_071953_9C3C9E84 
X-CRM114-Status: GOOD (  13.87  )
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

On Mon, Jan 19, 2026 at 10:41:22AM +0800, Shuwei Wu wrote:
> The thermal sensor on K1 supports monitoring five temperature zones.
> The driver registers these sensors with the thermal framework
> and supports standard operations:
> - Reading temperature (millidegree Celsius)
> - Setting high/low thresholds for interrupts
> 
> Signed-off-by: Shuwei Wu <shuweiwoo@163.com>
> ---
> Changes in v3:
> - Align multi-line assignments as suggested by reviewer
> - Remove unnecessary variable definitions
> 
> Changes in v2:
> - Rename k1_thermal.c to k1_tsensor.c for better hardware alignment
> - Move driver to drivers/thermal/spacemit/
> - Add Kconfig/Makefile for spacemit and update top-level build files
> - Refactor names, style, code alignment, and comments
> - Simplify probe and error handling
> ---
>  drivers/thermal/Kconfig               |   2 +
>  drivers/thermal/Makefile              |   1 +
>  drivers/thermal/spacemit/Kconfig      |  19 +++
>  drivers/thermal/spacemit/Makefile     |   3 +
>  drivers/thermal/spacemit/k1_tsensor.c | 281 ++++++++++++++++++++++++++++++++++
>  5 files changed, 306 insertions(+)

Though I don't have the time to test it on my K1 board, the driver looks
good.

Reviewed-by: Yao Zi <me@ziyao.cc>

Thanks,
Yao Zi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
