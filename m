Return-Path: <SRS0=aW5S=TO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02AC4C04AB4
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 14 May 2019 20:29:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C81BC20873
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 14 May 2019 20:29:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oOLto0j8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C81BC20873
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6kmgJSk3GqKC6Cz9nP9+GRuiBkpORF1tBf7s5Amq/RE=; b=oOLto0j81jiss2
	D+HtQ76XGeH0Wzcizy249VAXKuOiBuluijramXk7EnCr1GusdMQ45inMvC4AYnk4LuF8uwQU/9tka
	H7ooavLvTwgLJxVKB7BgjqzocaFgNonghgCFKzqoG0w863A0W+YEgQzV3CVNhC9kr5ZmYWJKmFixM
	+eg9sTzSQ+i16mBw2qzfetd5HFHitkdgRodB9eFep4Xl63i4iiVwfrYx5VU0QpSixNDgmKjYvRk8C
	FC6iuZXzVRBn4CTKUef46LByrxqNFX7vpaTqnkQU3TCWduFefGSuAUgkfGwmx3CeBEB3YOF8AkiLY
	olTm+TdGruxeuDNZHS7A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQe3J-0008DW-Sm; Tue, 14 May 2019 20:29:33 +0000
Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQe3G-0008D5-Rc
 for linux-riscv@lists.infradead.org; Tue, 14 May 2019 20:29:32 +0000
Received: by mail-ot1-f66.google.com with SMTP id f23so109709otl.9
 for <linux-riscv@lists.infradead.org>; Tue, 14 May 2019 13:29:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=oPaY+Ss9+ep2GCkhb8u3t1B3H/GvEu2ypW66c2/qd9s=;
 b=hlJcQBJTLgE6F2tsLEKk7YY06mleb0MrlhlJ0mzoXk7eQDhII72Nlg4ZaIMjSpOjRC
 NqtRakxXsM7TIa825m4f4Y7HC8pmA+EAYPn4Xq5TZ7ztN486+B6MG28djjE+8vieCo5p
 wIuLoRHVA+zDCqW24STnZGfgCjbRNwbahXARz+Qv6UMhungPf9/no+La0gfY22J9k5rZ
 v9AhI1AinP46vwQqofBsFC+TSjLBYG0w+AdQkwmZOB273qA4VQF/4uxOrHdwPUNjRGXK
 F8Sd8UMqUaoDCy/0/W9ge3zoVu17zgd+7QxyV6CK3dBc0lL+qHNYqd1hkEYBNQMI5KFh
 X5ew==
X-Gm-Message-State: APjAAAU1fjdkP75cJ3notSl0G5xTzJsmjVY/TO0BSr+FuoDavhRebJsz
 9e0bGg8TtOb0ZEbg1/4OnA==
X-Google-Smtp-Source: APXvYqzvuTeT7D9lZIqV3PwgDn5MJm1tKGPk0EO3gjy5o6D/bZ1ZmxMIWQbWUaiO3rbeleX4+VOgHQ==
X-Received: by 2002:a9d:7354:: with SMTP id l20mr23489464otk.115.1557865770039; 
 Tue, 14 May 2019 13:29:30 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id b25sm2460790otq.65.2019.05.14.13.29.29
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 14 May 2019 13:29:29 -0700 (PDT)
Date: Tue, 14 May 2019 15:29:28 -0500
From: Rob Herring <robh@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH v2] dt-bindings: sifive: describe sifive-blocks versioning
Message-ID: <20190514202928.GA23497@bogus>
References: <20190513215152.26578-1-paul.walmsley@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190513215152.26578-1-paul.walmsley@sifive.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190514_132930_887545_C31F155B 
X-CRM114-Status: GOOD (  10.95  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Paul Walmsley <paul@pwsan.com>, Wesley Terpstra <wesley@sifive.com>,
 Megan Wachs <megan@sifive.com>, Palmer Dabbelt <palmer@sifive.com>,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 13 May 2019 14:51:53 -0700, Paul Walmsley wrote:
> For IP blocks that are generated from the public, open-source
> sifive-blocks repository, describe the version numbering policy
> that its maintainers intend to use, upon request from Rob
> Herring <robh@kernel.org>.
> 
> Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> Signed-off-by: Paul Walmsley <paul@pwsan.com>
> Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Palmer Dabbelt <palmer@sifive.com>
> Cc: Megan Wachs <megan@sifive.com>
> Cc: Wesley Terpstra <wesley@sifive.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
> 
> This second version updates the example URL, requested by
> Rob Herring <robh+dt@kernel.org>.
> 
>  .../sifive/sifive-blocks-ip-versioning.txt    | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sifive/sifive-blocks-ip-versioning.txt
> 

Applied, thanks.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
