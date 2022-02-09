Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F957C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Feb 2022 04:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NguZWrLmTRH1gSawD/RrwNaNYkmRDWiQhTiObjPhKQ0=; b=DOSKr/dTOgCujI
	vSB+naaxKCA3GYfZI/jFx9q1iyLnnd0kxFGZ9CMdbr3DRNaM9l9LqVDF6YjDTLdUiJM49NefEPjzt
	jNLHzup54fu+3q38wBkIg3/CR+Cb6iMavJ4nEROkG/heC3wbvorDr0TO/pInkrRnD+uixtmiDo6Sw
	h5G4DI2zYhKA2vQLFjzB3i6iknr37HBQl/hyYLkk194ALiUBQh5B6AFW6IagBYqlxJ/3Q7O576j8a
	bDEEuZu83GM1cZeT/kBh5zxQSgCr9Ll/hiPslj0OSouPtuml4TdVjjQqN0l1cm6zKSoWWVUUG1/mA
	rjrzO8roj+DXR1EYUHRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHeER-00GBLQ-E9; Wed, 09 Feb 2022 04:05:27 +0000
Received: from mail-ot1-f44.google.com ([209.85.210.44])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHeEO-00GBL9-RU
 for linux-riscv@lists.infradead.org; Wed, 09 Feb 2022 04:05:26 +0000
Received: by mail-ot1-f44.google.com with SMTP id
 g15-20020a9d6b0f000000b005a062b0dc12so715609otp.4
 for <linux-riscv@lists.infradead.org>; Tue, 08 Feb 2022 20:05:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2qiG7G2GNRQ6LqjEvueRABe8KlaGUPbqxlWckqcNpAQ=;
 b=1pBKqhqA1KsPa+JTsmclNQBxRxL4kWw5FZLTHOOWGB70C3Lx6KI5oTDcw+pRVn++ak
 ZN2aSpT7KA+DFd8xoO9Gs2nFO47tdHFkKffDhzrmHcqvnxNLFqJJFRgp5kCKjNLIePoK
 gDalM4grGnTc0ob2GDQjKa7zClVcPhvbacfMvMJVJoq9VvwCnNtRtZ5bzPXD0iSijLP7
 MNGqB+fiRQgUSLmT/9xpxDty8179nq9JjR8zoAwr+j9p+0bBhuN3CZpHQOQimGYep5+Q
 vFNo/dBy1Y5kmGUKm9HVnS5pLyhLC1jJOM9jZMizkPluxneBOFjMXwa4j44acS2KyZXt
 W5QQ==
X-Gm-Message-State: AOAM532hYABNkBS6xwCrrD0ybnnQ6e0iNAEWV2EgBLI1r+gnYmmA+/Vt
 x/syTkE8vHJSBmRBcKs2GA==
X-Google-Smtp-Source: ABdhPJynH5fEDWLtkyVZ8PCGjm16IhKQQhYktEgLlsd+uWoGQKCSWN+0Xt8uX2xw3Pvao+5XKQLBZg==
X-Received: by 2002:a9d:6041:: with SMTP id v1mr216308otj.35.1644379523866;
 Tue, 08 Feb 2022 20:05:23 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id 128sm5696608oor.15.2022.02.08.20.05.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 20:05:22 -0800 (PST)
Received: (nullmailer pid 3633432 invoked by uid 1000);
 Wed, 09 Feb 2022 04:05:21 -0000
Date: Tue, 8 Feb 2022 22:05:21 -0600
From: Rob Herring <robh@kernel.org>
To: Icenowy Zheng <icenowy@nucleisys.com>
Cc: linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-riscv@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>,
 Paul Walmsley <paul.walmsley@sifive.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 03/12] dt-bindings: riscv: add compatible strings for
 Nuclei UX600 series
Message-ID: <YgM9gZ0e/yoiHys9@robh.at.kernel.org>
References: <20220127151647.2375449-1-icenowy@nucleisys.com>
 <20220127151647.2375449-4-icenowy@nucleisys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220127151647.2375449-4-icenowy@nucleisys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_200524_933642_8E5D6EC5 
X-CRM114-Status: UNSURE (   9.48  )
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

On Thu, 27 Jan 2022 23:16:38 +0800, Icenowy Zheng wrote:
> Nuclei UX600 series are 64-bit, MMU-equipped CPUs, which can run Linux.
> 
> Add compatible strings for these CPU cores.
> 
> Signed-off-by: Icenowy Zheng <icenowy@nucleisys.com>
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
