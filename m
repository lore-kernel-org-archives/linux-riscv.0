Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23AAB606A331
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Nov 2026 01:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ODLqzXIE;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=eswincomputing.com header.i=@eswincomputing.com header.a=rsa-sha256 header.s=dkim header.b=uEPtt3dr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:References:
	In-Reply-To:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iREu7oyTjXe+pTxU8i52zqkHXgSe6+EDFGUWdgpW9gY=; b=ODLqzXIEouyY/6M5SV++3dXzuY
	TXDbnFsE5eeA3A5ziU/Rdc0uPMLXa1jOUMT4bLtYJcO1dBS2GBMhsa5btvhsnu/YUqknajlDAFPsF
	HxcAVI+5wHnh46pn4XYcNK8irKE54llbPeHgXYQaoLcZHNLzKWLg+lUc+XqXAgU8F1WSoio6wI2zt
	0aN3LXDMSR8Z0xY4n8mDFxB3XTdTYAnKWclymEU9T06MOYlAf2BUKT4SEavduvbba92upF5W6iKC+
	aRFR99TLWt1nYcEkp1krAFZgNS2q6PQ6OX3SLV+w4uQnVEWma6auDXSbW4teu4WsWhwpBbtk8ym7L
	gGZH9RBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTrJV-0000000Aedz-1uGO;
	Thu, 19 Nov 2026 01:51:49 +0000
Received: from zg8tndyumtaxlji0oc4xnzya.icoremail.net ([46.101.248.176])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTrJQ-0000000AedZ-48nw
	for linux-riscv@lists.infradead.org;
	Thu, 19 Nov 2026 01:51:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=eswincomputing.com; s=dkim; h=Received:Date:From:To:Cc:Subject:
	In-Reply-To:References:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID; bh=9AtsLTpnTqLali66WvwfiLZu7NzUAAV3xsbx
	/gFUz88=; b=uEPtt3drfRYDCQzIG05FoTnV6ooLDrkZfRVEgpm3nO8W0Hmc+03j
	ynXgzVllxG+puW1BtVBY9a1NS4r3EGsBWBTuvphB1K/id5AQrBelSdhcHS6+uIwW
	ZrTlZ4w/jMjtPnQoXgM4Rz2+0XJO4baFEcqZotwFbcp9gEVyRb42kCA=
Received: from linmin$eswincomputing.com ( [10.10.96.205] ) by
 ajax-webmail-app2 (Coremail) ; Thu, 19 Nov 2026 09:51:32 +0800 (GMT+08:00)
Date: Thu, 19 Nov 2026 09:51:32 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: "Min Lin" <linmin@eswincomputing.com>
To: gaohan@iscas.ac.cn
Cc: "Pinkesh Vaghela" <pinkesh.vaghela@einfochips.com>,
	"Pritesh Patel" <pritesh.patel@einfochips.com>,
	"Rob Herring" <robh@kernel.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>,
	"Conor Dooley" <conor+dt@kernel.org>,
	"Paul Walmsley" <pjw@kernel.org>,
	"Palmer Dabbelt" <palmer@dabbelt.com>,
	"Albert Ou" <aou@eecs.berkeley.edu>,
	"Alexandre Ghiti" <alex@ghiti.fr>, "Han Gao" <rabenda.cn@gmail.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: riscv: eswin: Add Milk-V Megrez
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <20261118-eic7700-megrez-v2-1-0113ebc5b670@iscas.ac.cn>
References: <20261118-eic7700-megrez-v2-0-0113ebc5b670@iscas.ac.cn>
 <20261118-eic7700-megrez-v2-1-0113ebc5b670@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-ID: <9caa3e8.a5c.1a1f1807f9c.Coremail.linmin@eswincomputing.com>
X-Coremail-Locale: en_US
X-CM-TRANSID: TQJkCgCXUhwlVv5q_SsAAA--.145W
X-CM-SenderInfo: 5olqzx3q6h245lqf0zpsxwx03jof0z/1tbiAgEQCWr9068EKQACse
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_175145_351830_97D7B25B 
X-CRM114-Status: UNSURE (   8.67  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.4 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> -----Original Messages-----
> From: "Han Gao via B4 Relay" <devnull+gaohan.iscas.ac.cn@kernel.org>
> Send time:Wednesday, 18/11/2026 04:00:05
> To: "Min Lin" <linmin@eswincomputing.com>, "Pinkesh Vaghela" <pinkesh.vaghela@einfochips.com>, "Pritesh Patel" <pritesh.patel@einfochips.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>
> Cc: "Han Gao" <rabenda.cn@gmail.com>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, "Han Gao" <gaohan@iscas.ac.cn>
> Subject: [PATCH v2 1/2] dt-bindings: riscv: eswin: Add Milk-V Megrez
> 
> From: Han Gao <gaohan@iscas.ac.cn>
> 
> Add the compatible for the Milk-V Megrez, a Mini-ITX board based on the
> ESWIN EIC7700X SoC.
> 
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
>  Documentation/devicetree/bindings/riscv/eswin.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/eswin.yaml b/Documentation/devicetree/bindings/riscv/eswin.yaml
> index c603c45eef2252e760818e830e9dccdf0fdae6cf..f730f5ff91797d4c2f0610f9024a74611ffeae63 100644
> --- a/Documentation/devicetree/bindings/riscv/eswin.yaml
> +++ b/Documentation/devicetree/bindings/riscv/eswin.yaml
> @@ -21,6 +21,7 @@ properties:
>      oneOf:
>        - items:
>            - enum:
> +              - milkv,megrez
>                - sifive,hifive-premier-p550
>            - const: eswin,eic7700
>  
> 
> -- 
> 2.47.3
> 

Acked-by: Min Lin <linmin@eswincomputing.com>

Best regards,
Min Lin
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
