Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4364C43334
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jun 2022 15:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FHdTLOWFZ2o3js0LsCq6noAUhTAwPu07zWxvsa2XtNo=; b=RwmVU5r5sfJWt6
	J2zc9hdKIQAVlIM7c/vSOy8m5zMy52c5V4yuFz/TKvGIQROOnRMlvNOwDHPblXwyPMr9aC+gKzeyA
	U1+tV/9GrsdiRCxaunhd10f3eaWyIQsMl+7xGqs7+c6ePEtP+RGESAWgD11E+FC+7TLx4Ta8Hd/lg
	Hd+EUHEx3Gw2rwZ4SrSP+3kp+cimgJF3qtB9gYdXC22wQuXY/VLG1jc1/ubV3YkTuoUKusArSarMi
	ibjVYkHDpSftkACtLuJC87o7tXe8YIh88IdqSNUv041sBXpwOTCzz3+wpCBJmx6bd6V5z9IGhHg5I
	SAfC7HySxmNBJU+7hbsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzJrH-002g7M-Ic; Thu, 09 Jun 2022 15:14:03 +0000
Received: from mail-il1-f173.google.com ([209.85.166.173])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzJrE-002g5f-J9
	for linux-riscv@lists.infradead.org; Thu, 09 Jun 2022 15:14:01 +0000
Received: by mail-il1-f173.google.com with SMTP id d6so8157956ilm.4
        for <linux-riscv@lists.infradead.org>; Thu, 09 Jun 2022 08:13:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MdnhP1B6dGe9n1h4hktJclfvkqEAaRhx1l6n/vgyXH4=;
        b=B1Xz9nAlEIBjuKX95N4JBwyYRlF07SFC1eslV+tEDojXjDm7cP8OGYQxvoTEabB7QD
         9XFO/5xBpmMQ/DgOrkqGb5JAcAEZhQx2H4QdmobzPQjTS0rxvtc67+XKFx23ZlTNRdzG
         as+7tKZCCsgTEllaYyXNvGbplNKNRy0dyCMEUZ1U2fCun6D2wOh4mcm5+1bQNDg6MIjR
         sDMbpXV+RfeTfELYf5udyl9rgbqP2+d/OYzzLIlDpWfKf2+cVeDgCmvN6e6T7aTyPPMu
         /ruOrjdSgzl+lufAZfXplBPD0KEKU3Yg2AFKk5qLyP1Za6hDqkQoyDQTIN8SpH9w44rs
         6Qmw==
X-Gm-Message-State: AOAM530byNknskgfOqvhCq38o0dm5/AP9Q40tIxolywbuhzHhvqWr1w+
	T9fa6+LTsrJfVOOyY/cnoQ==
X-Google-Smtp-Source: ABdhPJxctqvAdV7wfx539ewBQpXQWBku3TcCJ0hHKApqfvhQCoOWdBrv7T4tvRUdM6b2f3Ul4BaiJw==
X-Received: by 2002:a05:6e02:1788:b0:2d1:aafa:9f13 with SMTP id y8-20020a056e02178800b002d1aafa9f13mr22412428ilu.69.1654787635365;
        Thu, 09 Jun 2022 08:13:55 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id c3-20020a056e020bc300b002d3a8969dd4sm10432576ilu.28.2022.06.09.08.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 08:13:55 -0700 (PDT)
Received: (nullmailer pid 3807446 invoked by uid 1000);
	Thu, 09 Jun 2022 15:13:53 -0000
Date: Thu, 9 Jun 2022 09:13:53 -0600
From: Rob Herring <robh@kernel.org>
To: Atul Khare <atulkhare@rivosinc.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 0/2] dt-bindings: sifive: fix dt-schema errors
Message-ID: <20220609151353.GA3805719-robh@kernel.org>
References: <CABMhjYp3xUyQ9q6nXHvEA2zuzhYi0ETn6UETeH1apWf2n2eP7A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABMhjYp3xUyQ9q6nXHvEA2zuzhYi0ETn6UETeH1apWf2n2eP7A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_081400_670604_F08B2592 
X-CRM114-Status: GOOD (  13.86  )
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

On Wed, Jun 08, 2022 at 04:39:23PM -0700, Atul Khare wrote:
> The patch series fixes dt-schema validation errors that can be reproduced
> using the following: make ARCH=riscv defconfig; make ARCH=riscv
> dt_binding_check dtbs_check
> 
> This is a rebased version of https://tinyurl.com/yvdvmsjd, and excludes
> two patches that are now redundant.
> 
> Atul Khare (2):
>   dt-bindings: sifive: add cache-set value of 2048
>   dt-bindings: sifive: add gpio-line-names

Your series is not properly threaded. git-send-email does this for you 
by default unless you tell it not to.

> 
>  Documentation/devicetree/bindings/gpio/sifive,gpio.yaml      | 3 +++
>  Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml | 4 +++-
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> --
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
