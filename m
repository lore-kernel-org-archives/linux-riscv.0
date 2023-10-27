Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33743C27C46
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Oct 2023 18:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w/lZNu5DMYyfelZGhIOtyHez7MhVPhTOR7xjsiENPPQ=; b=HAlVXp5LUcpzWh
	OT7VS2TjoV0VK+xhrNtheV1NzugRwQPqVuGW1Nwm9Ca62AXOoB7rXn/eJEQsogUD/wKWczuZ4nq5c
	5+rKBlhWUOE65eIRrAVIzMunO2O4r01gPE9OVKVL+kFncYmHdvJ7Go9UxA+qFx2KaUFgYtZ/osvbq
	U5RMeqtrXBIjZ3n2cd54sDrrB/5YPdXUlyNblkFIYiuvHFSqmo+LxQ62lstaQ8+ckDV4qXhiMMJN7
	+RxFnw7+JbzsWEOihxHnYbBXWGI8vQuM/fU+Mray2aW8w/dY7/SX/nxDWNv8+0kpZ1ENv893m3MiQ
	4HkQO8qCWa7ddAOzdwPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwRVH-00GyQL-21;
	Fri, 27 Oct 2023 18:24:15 +0000
Received: from mail-oa1-f42.google.com ([209.85.160.42])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwRU5-00Gws3-1I
	for linux-riscv@lists.infradead.org;
	Fri, 27 Oct 2023 18:23:03 +0000
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-1ef36a04931so1402887fac.2
        for <linux-riscv@lists.infradead.org>; Fri, 27 Oct 2023 11:22:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698430958; x=1699035758;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ypKQm2bhVvSr+7NfKx/QUexVGXQg+6IAYmLj2B0aXXI=;
        b=uYP2BY5jkgzVfZv4QlUR7Zaa7oI/KMjUOHtrR67DDqeoYjOENOLBLfu4jFGQB5Ozkc
         J2mXYptaUSJNxnY/OUox9AJny3gDOLpynLqMx/Sbg4VuMEKNEVVk+T34BT6Yw0R6RBbl
         C+oPqxM60cj/VsSAnSETBuBBaYgKn1/ZWDTgHAZlNgkntETLgl7QbbcAa7z0P02UMFMo
         6adTNgd7kBpKDttjDSWymOgkGFmMtfQDyv5cGQlLkOq5oYBHHWXjtwrslrHY+Zm8uAYF
         AzyRqt9NmeUzQWlhfFG3reSpM5Cwl/JTyEmNtCY4zDdcyXHJYw2pzUkn/j3vig9tNuCY
         bCnQ==
X-Gm-Message-State: AOJu0YznKJBg8FBsCMpuP63qk8Oz1vmf9G5dU/rLQNcSPwwo81aTi+ur
	vch4IyLtjXKdmj34F5RUag==
X-Google-Smtp-Source: AGHT+IHM79c2WAenWp7g5t5ecG/cJMTCO8zV05gtINDCRsMtJcZoq+Tghoupfg9/MI/thEcepTEyKQ==
X-Received: by 2002:a05:6870:2116:b0:1e9:a917:cf46 with SMTP id f22-20020a056870211600b001e9a917cf46mr4206650oae.19.1698430958268;
        Fri, 27 Oct 2023 11:22:38 -0700 (PDT)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id g21-20020a056870a71500b001e5c7cc54d3sm400406oam.55.2023.10.27.11.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 11:22:37 -0700 (PDT)
Received: (nullmailer pid 2922326 invoked by uid 1000);
	Fri, 27 Oct 2023 18:22:36 -0000
Date: Fri, 27 Oct 2023 13:22:36 -0500
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Emil Renner Berthing <emil.renner.berthing@canonical.com>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH 1/4] dt-bindings: cache: sifive,ccache0: Add StarFive
 JH7100 compatible
Message-ID: <20231027182236.GA2853373-robh@kernel.org>
References: <CAJM55Z-vw1sbks0KcHOXMzP-6c9NMg+GOndi2pQ7iyWh0=oQiQ@mail.gmail.com>
 <20231026-paycheck-equation-b0f1a1191bf2@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231026-paycheck-equation-b0f1a1191bf2@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_112301_454207_04EFCA65 
X-CRM114-Status: GOOD (  11.69  )
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

On Thu, Oct 26, 2023 at 02:10:37PM +0100, Conor Dooley wrote:
> On Wed, Oct 25, 2023 at 11:56:37AM -0700, Emil Renner Berthing wrote:
> > This cache controller is also used on the StarFive JH7100 SoC.
> > Unfortunately it needs a quirk to work properly, so add dedicated
> > compatible string to be able to match it.
> > 
> > Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> 
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Did you want me to pick this up? Or you or Palmer will?

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
