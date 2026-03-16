Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC4AED58B22
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 04:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1HhMM3C8Et8FHQXz/DFwLe8FKeq+F9kCSO83CJNBMwc=; b=vcWZcP7g3Trc/u
	H3hYg/3huoaOgT6iLe1ks59s1a4MpRFx0yKBBHd2SnLvQJ1Tl4RFP32vv34soPf76rofoCpjyW7vj
	HttI3b3dS+ghvMAyLfOIBbr0O5jljs622/b/vVaw6QjEucQDcJjD37MTF1+DZBHSpXIm6CbxjdLxP
	3tk5Ykcb3P6xqWdZ1wWvBPvvQ58BDFVb2OxaISSHaMcsfTHcRs6xxfo4JQhAwt14M3ZuVaWIBIQwo
	+OVwbyqO2viLIrMmqhLZwAKTeNPjI5Flr9zDo3SiqB/MNTd0nd1AMvm6Azi0/vtctHU9+gDdNdvOP
	koP6XvArKTYWOLZsTOLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1zk2-00000003Itz-19na;
	Mon, 16 Mar 2026 04:39:46 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1zjy-00000003ItH-3MeV
	for linux-riscv@lists.infradead.org;
	Mon, 16 Mar 2026 04:39:44 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1773635972; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Y0YonvlMH6Gy+1iJMq8amZVq5POOik94Pe42QsYGPqTIzzr3d2dyu4YfIpm88Zdpb1Gzh/9HAdJv+6MPRrkMi14QCWJnwesAbWbSx7+iOK9CbRo2XiAt5KlmwghrHYZSKWKsv1Lw8roJPga+QNq2UoeULamUC8PDkICP0u3ZPS0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1773635972; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=kewINodiHkLlpvPQfzNJPAoWR16xstqEHHybSvNdxOw=; 
	b=jW1aIvlEMfrfm4xgADMiI5b7oeGQT+JLYyGhtcTLS6oJCFlneUoPNtUtmoLhEreywvGtJV1ZPUH+EO4YoB3/Qdx1nTodfiqyivBFcjIgGh8x8uCKXod4w35s7m4sogvXNlnc6UK0kWVFEOFI2HADJ6A1bYGFS+g36c6BZqtoLtA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773635972;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=kewINodiHkLlpvPQfzNJPAoWR16xstqEHHybSvNdxOw=;
	b=Sp864g1TA5So9qkbPIPIbwb8wYbNKBiNBBkZYm1kexV3oT3UyrTTu+tD0SC1DIQQ
	18QBv6jrwO2gU1cf9ps724wcImO1gOuhDV8piYyUQ9RUOdDgph7VAHH2PErpApVd+1F
	L3OVi3eUYZpJpXKoGtykhDR4IOe70r4ODtOcHU6I=
Received: by mx.zohomail.com with SMTPS id 1773635968727532.6997193656666;
	Sun, 15 Mar 2026 21:39:28 -0700 (PDT)
Date: Mon, 16 Mar 2026 04:39:05 +0000
From: Yao Zi <me@ziyao.cc>
To: Jia Wang <wangjia@ultrarisc.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: serial: update bindings of ultrarisc
 dp1000 uart
Message-ID: <abeJHQPJpXIANdzR@pie>
References: <20260316-ultrarisc-serial-v1-0-c464f3e933a5@ultrarisc.com>
 <20260316-ultrarisc-serial-v1-2-c464f3e933a5@ultrarisc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260316-ultrarisc-serial-v1-2-c464f3e933a5@ultrarisc.com>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_213943_003610_8778246C 
X-CRM114-Status: UNSURE (   9.17  )
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

On Mon, Mar 16, 2026 at 09:36:19AM +0800, Jia Wang wrote:
> Add UltraRISC vendor-prefix information

You don't add any new vendor prefixes in this patch. This commit message
should probably be updated.

> Add DP1000 UART compatible information
> 
> Signed-off-by: Jia Wang <wangjia@ultrarisc.com>

And the dt-bindings patch should go before the driver changes.

> ---
>  Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Best regards,
Yao Zi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
