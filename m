Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8391DECAAD5
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Aug 2022 18:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ollYic3kFxuhrO1HzvpjgrpYMdrMD1xxNtV8FLgzy8s=; b=fdHzXecu+fFDFG
	AMZN1Gq6KAV43FqTzMkTHHhykZqWQ8l4oeoZA7w7zhYOodntWGZPgXNI/3K/MVYa0eYvhoKXU/KkQ
	6zKms5CL1uOsK3USV+iY/UDlrFp3VnpMN08CCUW5sweFJ/Qo5UQKnAdeONKQBfYXrD3u3IlKykcJL
	4+mUGr9OLhhEPFm9BolxVFg9A3MUAamx7bYzhh2Pt81ILiYUnMd7GS8nrML24H/Jot4+oY6lpT2/7
	Oi4GeMSYLLeeyhccFcbSdPeu6+MyMgpOoez6TsVD0mELCixmlTqF/2gzc9b7DMy7kIzm9eoycAEO3
	B3yE4Hk6Au9zxps52vEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSjkN-00CHwd-JM; Mon, 29 Aug 2022 18:44:31 +0000
Received: from mail-oi1-f171.google.com ([209.85.167.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSji1-00CGmg-RH
	for linux-riscv@lists.infradead.org; Mon, 29 Aug 2022 18:42:07 +0000
Received: by mail-oi1-f171.google.com with SMTP id o204so11387209oia.12
        for <linux-riscv@lists.infradead.org>; Mon, 29 Aug 2022 11:42:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:references:in-reply-to:cc:to:from
         :x-gm-message-state:from:to:cc;
        bh=LXkEPrKAVM00r7oWbx73qYiaSM+RhvXxRLquIsmnm1w=;
        b=xeLpV91+egHtg7S8d+EuS1eX4gz10WkKw6TQ8b+pKj1MZuNDwRmtyVml1xy4Vg6XEP
         tUd+LsHB0VZuwQj6QOKTZJ8HewlVclcgxlaBzf9M4DHa0ja+fYxiMSuHKzwBFmLfHYhX
         X/fWuze4oGHdRxzc3mI2IFSxKacVgqCKn3Gg6+G5aZ5gnnMWGG85Oi1X3OL84uKdrTLp
         74iEjAjM4t7jAp0GSUBRRY/akET9Ieb7yXfQ69GQN7c8fAq7lnfplFsxGENsF+wGnpR8
         lmUmgee0nTyqdeGzK0IuFrWD2a937scGzwjiK/v3R8fwu5B+CYScggFbK13h4X/Gb2r/
         Uixg==
X-Gm-Message-State: ACgBeo1z0ErIbyNgsrDgzKzmGWZXwYPb3YDTyhRR0zrwVoHtW6ciULgZ
	xCrWYGN0HJNajmvpdXKdBQ==
X-Google-Smtp-Source: AA6agR42ZU6Hvi/yKVQOmrNtnY8Z/N6ngoK1AmvM742vrzGwV1LSvyBk0CuqpQSMIwTLFyQapO6Rqg==
X-Received: by 2002:a05:6808:21a2:b0:345:d23e:d2e2 with SMTP id be34-20020a05680821a200b00345d23ed2e2mr4725175oib.273.1661798522665;
        Mon, 29 Aug 2022 11:42:02 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id n29-20020a056870241d00b0011c8332922fsm691084oap.29.2022.08.29.11.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 11:42:02 -0700 (PDT)
Received: (nullmailer pid 2118960 invoked by uid 1000);
	Mon, 29 Aug 2022 18:42:01 -0000
From: Rob Herring <robh@kernel.org>
To: Zong Li <zong.li@sifive.com>
Cc: robh+dt@kernel.org, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com, conor.dooley@microchip.com, paul.walmsley@sifive.com, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, greentime.hu@sifive.com
In-Reply-To: <20220829062202.3287-2-zong.li@sifive.com>
References: <20220829062202.3287-1-zong.li@sifive.com> <20220829062202.3287-2-zong.li@sifive.com>
Subject: Re: [PATCH 1/3] dt-bindings: sifive-ccache: rename SiFive L2 cache to composible cache
Date: Mon, 29 Aug 2022 13:42:01 -0500
Message-Id: <1661798521.316365.2118959.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_114205_935605_AAC1D75D 
X-CRM114-Status: GOOD (  11.35  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 29 Aug 2022 06:22:00 +0000, Zong Li wrote:
> Since composible cache may be L3 cache if private L2 cache exists, it
> should use its original name composible cache to prevent confusion.
> 
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Zong Li <zong.li@sifive.com>
> ---
>  .../riscv/{sifive-l2-cache.yaml => sifive-ccache.yaml}      | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>  rename Documentation/devicetree/bindings/riscv/{sifive-l2-cache.yaml => sifive-ccache.yaml} (92%)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/riscv/sifive-ccache.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/riscv/sifive-ccache.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
