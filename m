Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 915CAC32771
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 10:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BGUFmcDiMnZG3jbyrjVjQEaxjRSfNkFsCvf4/mQ678Q=; b=sTh3ljxdr90Fih
	3GAQReb+p0DbVmDE9TdFGYaz7Y1ps7SD+s+tMtE1kjqI9+BFdKHYqzFDO89zBmBWcN4kvU1fg4t5s
	VXrYdFVKdGEL2bRPkMW/b3Df85RXGnAhDIPD1dnIxrGBsVa1a+ET0NTUDSag7F3HMbR0BfRJyGtTG
	xrV8Ls13gXtZ6q1a6S+SVpfn4ERZJqBK+9KZE5r6Rw71+54evoIf0SX1BF4MFXZE6CV/jC/Y5R0zW
	DSDOzoaUbUcUstL9gdk/iodYsU7KqEga9MakJVmD1Ju6mzR6vFnXpzlPFWyrEQClyYCtrjQzFZUmK
	CSLeybcAKOwtOjdcDWCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oawqL-00Anws-0M; Wed, 21 Sep 2022 10:20:37 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oawq5-00AnrO-RG
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 10:20:23 +0000
Received: by mail-lj1-x232.google.com with SMTP id z20so6418964ljq.3
        for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 03:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=wOAG2nHa6V+mQVTn24MXKEjrtz2FiEQdyWfc/VJPXp4=;
        b=e5OcUsAvRzypoYJDGBslX71DzA8KWabXMVX1vSTnJfgvbDoWQe9lySb5EMW+2q1x+m
         6/mV9CPyDldV0G1YA8abb9/kiNN60Tk+2Tn9jELj+DnAvO47JPVfmvwSaEYbp+8UiBP3
         AQ9VS3j9dnj/4elK6HU8XANNv3/351mR7HwvowWW5rSB1zXDhxugoBvRR+5skUpHr+E8
         wemp9ZgtZt4ETUEseOBpne0jQ4Qqod5ir/XyqhLyLzOpECZYKiUmKjNB44jGhvdikUbn
         Zc0Noc9sRKfRqZpm0bbsYOeCbrke0yhqnGqA0qnGh4gd7R7ZYUTgOI8WNIiWtlnTb+eN
         deMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=wOAG2nHa6V+mQVTn24MXKEjrtz2FiEQdyWfc/VJPXp4=;
        b=Zp5UhOfRIbEXZxwaNoEhAhe7K/RmVia68evrVYTGVeJnF6l3Du931h+ev2MkQTqlSc
         +JsoqfQ/jDmB6AeCFEDeMi3NGcF1dE3oUvji7EyOdluoZPIMITXp7CcpB5ImSQ47qAGx
         7DYodqRzdzZhpVHTv1XzIveF5ZXZVo0j+Ss5doRNABjW1BFYWEhSi19V9US7LoC08+VY
         4v4aygqZxTIbTsHAOwSCI2bXeHUimnj84Ypf3FCWA8Q3JAy4/4PkIpYf/JF5/ZP6NjOc
         YnN22rHUjFG8qO1LwsSMbxKfwHDhGnWUfW0fsijGYOOmin4nmOWFd85aE5e4tSNDHl83
         Ox+w==
X-Gm-Message-State: ACrzQf0OZMav0TQYO6s9+ZszSJNkcZJgm++H94lg7UMXHMT4Ti+sPAyj
	LJwCN6Js8e0mde2bIy+v/Z1+bg==
X-Google-Smtp-Source: AMsMyM6VoW+pUqPYp9TXSCxXkAE/UAviHWwr6fNmxVv0f9q7qRUpKdY3dFHo53fnRU7xaklCK87blg==
X-Received: by 2002:a2e:9dc6:0:b0:26c:5d06:e18 with SMTP id x6-20020a2e9dc6000000b0026c5d060e18mr2259266ljj.64.1663755617941;
        Wed, 21 Sep 2022 03:20:17 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id b3-20020ac25e83000000b0049a6a9bc0dcsm368555lfq.134.2022.09.21.03.20.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 03:20:17 -0700 (PDT)
Message-ID: <9f6c0330-b1e8-b71c-9883-95cbb6924b08@linaro.org>
Date: Wed, 21 Sep 2022 12:20:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: Similar SoCs with different CPUs and interrupt bindings
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Robin Murphy <robin.murphy@arm.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andre Przywara <andre.przywara@arm.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Samuel Holland <samuel@sholland.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Atish Patra <atishp@atishpatra.org>,
 "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
References: <CAMuHMdUPm36RsxHdVwspR3NCAR3C507AyB6R65W42N2gXWq0ag@mail.gmail.com>
 <45d2e6c2-3b4b-5720-0431-002c74b1f9cc@arm.com>
 <CAMuHMdWd5cmxgG8jdpDw3nrfrdSX6ecb+XwuJTLkkRgP5LbcHQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAMuHMdWd5cmxgG8jdpDw3nrfrdSX6ecb+XwuJTLkkRgP5LbcHQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_032021_923975_8AE9A170 
X-CRM114-Status: GOOD (  14.18  )
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

On 21/09/2022 12:13, Geert Uytterhoeven wrote:
>> 4. Put all the "interrupts" properties in the SoC-specific DTSI at the
>> same level as the interrupt controller to which they correspond. Works
>> out of the box with no horrible mystery macros, and is really no more or
>> less error-prone than any other approach. Yes, it means replicating a
>> bit of structure and/or having labels for everything (many of which may
>> be wanted anyway), but that's not necessarily a bad thing for
>> readability anyway. Hierarchical definitions are standard FDT practice
>> and should be well understood, so this is arguably the simplest and
>> least surprising approach :)
> 
> Thanks for the suggestion!
> 
> It does mean we have to update 3 .dtsi files when adding support
> for a new device. As long as all DT changes go through the same (soc)
> tree, we can easily manage the dependencies.

If the new nodes are disabled (in main shared DTSI), then it would not
need immediate update in other arch. However enabling it in other arch
would require cross-tree pull (AFAIR, RISC-V changes do not go to SoC tree).

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
