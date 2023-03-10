Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A20C6FA99
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Mar 2023 07:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+fS3F2VoGhozoOzus/KAGhCQqhHtHZSDPJbXKBUT2LU=; b=LjyKE/Aa8qCqmH
	/jGF8gL/Jg7MafY6lNgmNNAOlAMBqU9xWd4U9W1GRDjNBoC/KUgFYvl6iD/Q7GgrIpE9at/w5NW7s
	LWyw4wF7kh2PX+kNBqjXi5ddTtkttyTfqwn9/hAbJ5dUBvBQrwwzbKQ6NLuFPZbDIDamZR7b0YyUG
	WJj3z+sqgDplvTcZ6bdnEDr8HxE85jSqTS2Unr0H1JwbK5GlsYW7n1cg6IhqoF983TdIRMw88v+g/
	59ttSrmA8PsQSXCGoCA0LN7YTZ6iuGcePuQR4VcAtcGF3uOS0NfDHx63xzx6jn9mLQQ1InirtRhhh
	LN8skH1qetEmr2jB/oVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paXUh-00DStr-KL; Fri, 10 Mar 2023 07:48:51 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paXUf-00DSsw-DT
	for linux-riscv@lists.infradead.org; Fri, 10 Mar 2023 07:48:50 +0000
Received: by mail-ed1-x531.google.com with SMTP id k10so16828201edk.13
        for <linux-riscv@lists.infradead.org>; Thu, 09 Mar 2023 23:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678434527;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ox2MQ8jOJOp1yMXou1ij0KPIBKyC6rqyU0zHXZznrTE=;
        b=QX+CwDqFVSS7XcQCrN3AHD+LJKuWxxbi5oBnHK04kQ7da5JkKEpStxVVsnDUMy1WRh
         vzysM2wk+rT31PsyRzu7eLCvsyoZwv/6mKu5b3Ghn3lxZ3b949ZRqoVpbWuUN+2sj6Ho
         aHu4zSkIpagwPkapUqK8Zk/yHMd7qsTkA1+GHQFrOnpUJhhXzTE6CXsAR4Un18yj0bvC
         HOpbwxjzYjEWGg4tAAJFTXN9BtOf2vtzy2kP18d9DlfftNEQEfd2GiX3Rnk7jxR/PbY9
         M6TKxONOo+Ah+wpo41iC3dni9Urah+PajVLRvqBI7RMMhnvvLdWFCpj8qkQ485OpdfqV
         m61Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678434527;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ox2MQ8jOJOp1yMXou1ij0KPIBKyC6rqyU0zHXZznrTE=;
        b=H8++Iok7vdQeTlK7pc0ylLY+w77G9YQ5Nz+oH4yoE9SdNNpPbKizfvewneJbmW1qK/
         9xKTrq715Nz+XFfeEiU9sMS7J0lhBv69lXtUSe1Ztcxz2s2m5mJgdWEPi8JMsp47jzrQ
         YaKZSTy1jsuy8YCfq9n4gLsSggMSRT+o+YmNxfGs7vPvT0iivjzbiDgTKLUzPDXigkmQ
         l2Aiu4hWvnAmV7htIYEtPPs0ldW0vaK8s9KBI8QzCtfsXrk9EDTd9AtmEWydX19Z0BSC
         l6z1cw6HaVya9H3xTo48DzNEXy0EzQlE//jyzT/c+oAOXtVgHffWRyfX4WRnb8Cm4cf2
         5bQA==
X-Gm-Message-State: AO0yUKUm/svsvz38eJoV52mHltcwTXC03+3Ll+VxhDL4QSPDgU2omU98
	Dz5dSkdBmB1ZeNrRDpGlodY=
X-Google-Smtp-Source: AK7set/jErczfvC9adZl0dXU0ALLlrBrgwnYx/lD/8jV5KJ2HnEXYd4CxAnKmoAsWivpJ5VFoWw0nA==
X-Received: by 2002:a05:6402:1291:b0:4ad:66b:84a5 with SMTP id w17-20020a056402129100b004ad066b84a5mr22553135edv.22.1678434526951;
        Thu, 09 Mar 2023 23:48:46 -0800 (PST)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation (net-188-217-49-172.cust.vodafonedsl.it. [188.217.49.172])
        by smtp.gmail.com with ESMTPSA id c12-20020a50f60c000000b004acbdf23cd2sm496139edn.29.2023.03.09.23.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 23:48:46 -0800 (PST)
Date: Fri, 10 Mar 2023 08:48:44 +0100
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Hal Feng <hal.feng@starfivetech.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks <ben.dooks@sifive.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 00/19] Basic clock, reset & device tree support for
 StarFive JH7110 RISC-V SoC
Message-ID: <ZArg3L/ZUCY79Pgb@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
References: <20230221024645.127922-1-hal.feng@starfivetech.com>
 <3a605bc8-104e-0935-4fd8-2da16ab9053b@starfivetech.com>
 <ZAb7JVghuiwZF1Q5@wendy>
 <2f03dfb2-5cf8-e954-913c-f0c27db6bcf5@starfivetech.com>
 <ZAh/UeSlUeGoKxki@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <4c071642-e3c8-4716-a580-5b42e25efb1c@spud>
 <ZAoOLIERMYI8UVlA@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <09630acb-f1ae-4dbd-9c9c-9adb1743bfe4@spud>
 <ZAosTc6VNco1okyR@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <23111c4b-2bee-4f04-b0e6-bddea553d260@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <23111c4b-2bee-4f04-b0e6-bddea553d260@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_234849_492185_532A1C20 
X-CRM114-Status: GOOD (  11.11  )
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

Hello Conor,

On Thu, Mar 09, 2023 at 07:03:47PM +0000, Conor Dooley wrote:
> On Thu, Mar 09, 2023 at 07:58:21PM +0100, Tommaso Merciai wrote:
> 
> > I'm able to boot the board using nfs ;)
> > (without issue)
> 
> Sweet, glad you got it working. If you'd like to provide a Tested-by:
> for the series that'd be wonderful too :) No pressure haha
> 

Yes ofc I provide my Tested-by ;)
I collect some other series like gmac integration.
I need to clarify.
btw below my tag on this series :)

Tested-by: Tommaso Merciai <tomm.merciai@gmail.com>

Thanks & Regards,
Tommaso

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
