Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5432C3DA7A
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jan 2023 01:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+q2hEnyFGgP1MfZ0lETbAiiKpeRb0VtrqXKXbgtcW5Y=; b=Ij0+elXzKpD4h0
	bqqVmyp6NolqfvIU4/3PcAm1k8TMZGnGv3B9DY2RbKPaSAIqz7WcU5eBQjD5qMMxtuTHm+RmGPbVf
	qAfZCZnieo05YuriZQ5VqHH3JkZ7buMhXpt3bCJFscQT8fGv7ceaJJ23akL+ylBu7H5ec+AudlEW/
	ZOUCkEwGeRzyHMjIiZXQ6Wx11Td6PCMufDTHcVCLf1/6k9dM96ioPUMJQzdRE/d3KPO71oIiYJFoB
	ERUQKk7MqRNAAUQOX5NHxcZw2OVFsNVJoR5kYEydnQu1eDElijItJ2i5u5dWHRkuXyjlKUeTfIo2N
	i0gZBWCW0jfRA5neGOLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCWXQ-00Fimn-5w; Tue, 03 Jan 2023 01:56:24 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCWX6-00FicD-Lu
	for linux-riscv@lists.infradead.org; Tue, 03 Jan 2023 01:56:10 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-1441d7d40c6so35350031fac.8
        for <linux-riscv@lists.infradead.org>; Mon, 02 Jan 2023 17:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=96ZA3U+4lODUN3hIoOOVli3grSMHv8whVkE4ZtfzuJM=;
        b=KvXgqBoo9WmoGuCe5vzbMWxElgDcbFiloThShHoBMxljzX+4aV4siZiqAROHBM4128
         2DHl0I4Fz/mmYz49C47k8fQJN3TgddLm5A83pEAOElNOxm72x4v7Ag7vZruc8/h7ODLl
         +gAhtSug9qHjhpoRju+X/hrAAK88RT95HwR3rk97Ut92tAJff9VUb1iQ6Lkz/3RsHX99
         Ri0t1eb/0d6/RV1UnBZqTrfZaglg9kHfOqOAM1of7MO4Ght4sRqKfOJwH6Y5I/MgBczG
         Is1ggOpBcSHlFkKudF5qHDf6ap86WuZOe5JIAVe7f9iMrgmz0WKu8lsU5f5e32NkH/cw
         SF3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=96ZA3U+4lODUN3hIoOOVli3grSMHv8whVkE4ZtfzuJM=;
        b=km1JwnMXDSbsQ3rAvZJX+2mnxW+q/YEIvaaXkEsbbxLK7QI/zxAfSWV9v13vshDaxp
         pAoWXFZqdRMZYEAIsOER4gv5XltdZ7NYHyf4UWdKrMPz7o9WU8/nacz4cVSFTk+lvSbf
         BhqfB/VfsbR5TyCp5Z6iw7TGaaqS86dkE+goDMgtGasF229cdt+zQTZLXycU7aay6RNK
         FFlV2JpSthJBpWIYz9RZYLlIYD85ekF4jzBFMMOOi8DgoqYLChj2MWDAL9mptIwATG7j
         X/LE6L04kvQQiDmXfQASQbYqerIFYU42VfSY28Wk4ngZ/gHsqhQblNML0VZmDgPe/PJK
         4UJQ==
X-Gm-Message-State: AFqh2ko57PLf3+gZypR1lqfIvpX84qNF4s22GwQtLpSHuY/pSlNCwbMX
	HaWpMFA5wk4AXsy23u8QNYg=
X-Google-Smtp-Source: AMrXdXtb4bHZ9umAo6HHJUafiGC78lfkM4bBWYxkhrmL8rbnxkgsx2BdYpvMkIIJoXpc34YlsCkINA==
X-Received: by 2002:a05:6870:d8aa:b0:144:7eb3:c9b0 with SMTP id dv42-20020a056870d8aa00b001447eb3c9b0mr20918406oab.42.1672710962830;
        Mon, 02 Jan 2023 17:56:02 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c9-20020a056870b28900b0014474019e50sm13663486oao.24.2023.01.02.17.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jan 2023 17:56:02 -0800 (PST)
Date: Mon, 2 Jan 2023 17:56:01 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/4] Temperature sensor support for StarFive JH7110
 RISC-V SoC
Message-ID: <20230103015601.GB313835@roeck-us.net>
References: <20230103013145.9570-1-hal.feng@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230103013145.9570-1-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_175604_778708_49DFFF24 
X-CRM114-Status: GOOD (  14.54  )
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

On Tue, Jan 03, 2023 at 09:31:41AM +0800, Hal Feng wrote:
> This patch series adds temperature sensor support for StarFive JH7110 SoC.
> The last two patches depend on series [1].
> 
> [1]: https://lore.kernel.org/all/20221220011247.35560-1-hal.feng@starfivetech.com/
> 
> Emil Renner Berthing (4):
>   dt-bindings: hwmon: Add starfive,jh71x0-temp
>   hwmon: (sfctemp) Add StarFive JH71x0 temperature sensor
>   riscv: dts: starfive: jh7110: Add temperature sensor node
>   riscv: dts: starfive: visionfive-2: Add thermal-zones
> 

The hardware monitoring driver is obviously either the same
or derived from the previous series at
https://patchwork.kernel.org/project/linux-hwmon/list/?series=&submitter=&state=*&q=starfive

Why is this not submitted as v4 of the original series ?
What has changed, and what is the rationale for (re-)submitting
it as v1 ?

Guenter

>  .../bindings/hwmon/starfive,jh71x0-temp.yaml  |  75 ++++
>  Documentation/hwmon/index.rst                 |   1 +
>  Documentation/hwmon/sfctemp.rst               |  33 ++
>  MAINTAINERS                                   |   8 +
>  .../jh7110-starfive-visionfive-2.dtsi         |  28 ++
>  arch/riscv/boot/dts/starfive/jh7110.dtsi      |  13 +
>  drivers/hwmon/Kconfig                         |  10 +
>  drivers/hwmon/Makefile                        |   1 +
>  drivers/hwmon/sfctemp.c                       | 350 ++++++++++++++++++
>  9 files changed, 519 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/starfive,jh71x0-temp.yaml
>  create mode 100644 Documentation/hwmon/sfctemp.rst
>  create mode 100644 drivers/hwmon/sfctemp.c
> 
> 
> base-commit: 830b3c68c1fb1e9176028d02ef86f3cf76aa2476
> prerequisite-patch-id: 4dc515731ce237184553c1606ffb3afaeb51c3d8
> prerequisite-patch-id: 09c98554df52d17ba5fd604125f8cdd62cbe80d1
> prerequisite-patch-id: a798370d170dc2bcc79ed86f741c21c1e6d87c78
> prerequisite-patch-id: bd9fd8b5cb2376dc7a5e08e1a1fbb969cf475926
> prerequisite-patch-id: c57ebb83bc43ccd2a8366ff166eb499da1e1d2cf
> prerequisite-patch-id: a1673a9e9f19d6fab5a51abb721e54e36636f067
> prerequisite-patch-id: 94860423c7acc9025249d4bb36652a585bd0a797
> prerequisite-patch-id: b5084253283929d9a6d0e66c350400c7c85d034d
> prerequisite-patch-id: 6e369dbe9dca2785e4ea7d0b80e525e227a90a6e
> prerequisite-patch-id: e08806183c152714c563f3a21c6d7b2f539c4d6e
> prerequisite-patch-id: 79db8036abdc48fd36da227652ec62627a6b548b
> prerequisite-patch-id: 06971b8e6bddc0e87e63bfdb0ce8bfb653bd73aa
> prerequisite-patch-id: 16309a0e23811a2c55d2e56886de3e8eccc51554
> prerequisite-patch-id: bf4f7ab0b6cfa90b6e49e66c7d75ed2eaaebbe78
> prerequisite-patch-id: 38468d532e87867990055d3320679f18c5f52278
> prerequisite-patch-id: 4710f2ac22dca0bdd9ff5d744d2c37cab3c74515
> prerequisite-patch-id: 6bb9a780c62af3bcc2368dfd20303c7b1bc91e23
> prerequisite-patch-id: 258ea5f9b8bf41b6981345dcc81795f25865d38f
> prerequisite-patch-id: 8b6f2c9660c0ac0ee4e73e4c21aca8e6b75e81b9
> prerequisite-patch-id: e3b986b9c60b2b93b7812ec174c9e1b4cfb14c97
> prerequisite-patch-id: a2b3a9cff8a683422eb0ccf3a0850091401812d4
> prerequisite-patch-id: e0ba7af0f8d3d41844da9fbcba14b548cbc18f55
> prerequisite-patch-id: bc0176325c11a632c6abaa83e54e891cc92d1c74
> -- 
> 2.38.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
