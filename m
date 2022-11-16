Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0412C433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Nov 2022 09:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rSAJmFWzl2RKQeJO/lQotXB4y4lC/xKeD0YRsys/b+M=; b=ZeCNA+A80FO07J
	Eh+y0H2qOVknaRA7Uwevdi6C+iP+Z37YCxjD/v0KDYtxdtxOjpmkHt/tM8X+Sq3ZchrKh4y2MAGMI
	5W1sIBYmZsrtya3nDb1NTfx2CIwk9A8tHUCJLIVoisl6MeuSroZN34EgQuhWpXwWHDvGjoDvhxAZM
	WmCa4/J8J0369QscZ/6ttvOc5EACIR29S9HvuMjJe4+GVpXXTq5rv9DCHRo8cR1W03Vkg67OykPXi
	wsM8iu5wm/CDHR5Ns7Ghxun9YR46JTdJUfWkEijCUYa1PDYRb3bA4gOeiKC01Aie8CSTWydLBS+he
	amDimV+Yu7xw2xF/1tmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovEM6-001TsR-Dx; Wed, 16 Nov 2022 09:05:14 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovEHY-001Qy3-Ki
	for linux-riscv@lists.infradead.org; Wed, 16 Nov 2022 09:00:34 +0000
Received: by mail-lf1-x135.google.com with SMTP id g12so28521719lfh.3
        for <linux-riscv@lists.infradead.org>; Wed, 16 Nov 2022 01:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FVdV6LebjwCpmwDk6trJqC8cySRjktuHUoTqdWNdcms=;
        b=khTlLRnGvCZXS8zSbmdGUxyvWawM2fSnfv8ljuguxkvPyAT5UUql0SYa5oohRXhQTd
         I88GbIyvvk7Q5jqHMKbJtEm/uFyFy0ZmiUAnPm0/uFL+innZxOko6G7JEv2kZT/9hERJ
         th/tEufxqaMEx421Dyo6sxDbbABvx6rLxB997bMfwk+g/1DjUf9UXDUNk3t8XsM2WT4j
         pgG/vIRMFhV+6XQSwNYnzaAenrqk7fU49GBqbb0pPU13Q/4+JDNkIL0Y9u6ZoZmE8dQc
         Lm2pM5RzmBs8uGXIir8fPW7SJvcdkVYnEwLBs0Ajo6yXndizM7u2F1/Xes/K5ILVZPOB
         9+4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FVdV6LebjwCpmwDk6trJqC8cySRjktuHUoTqdWNdcms=;
        b=7BkoGoVlyfXe3mJ6q9HLQcUbRbfXjDcU0OuefAUXnHN8M5+pNDZ+oBUOWiPJ3Yn0CU
         c8AJD9qOVVaQLQShjQyAmGFUyGmetsWAPTnWzrrtMjNnULOa9fJ5vDWiHZSjg+kzfYkP
         9a2jnchSAxkqdgeL6o0MVx/zBhrrSJ0JD9bpb5MuyMpTAMw2q26/ehUe6gDGyWltzL9F
         xi6nxb7n1ZnikxpnTsIYLLbtKOpC2SrVSy6rxcBQI7xvsbVxgPMOctH5SyQqQIvryCzF
         B41YrhyVIiQkZMR6qjBuKSk38uFNEHgb/ucZiCa/febSmYu/FUQpIzuNGyrYw7GUlVax
         aVYw==
X-Gm-Message-State: ANoB5pn1SosMPe3XDlVrkms6uEnJds/0odq+QfPv3nPxBezAKv4r/D0m
	sMJrlgvwvp7h05G6/gI435ltjw==
X-Google-Smtp-Source: AA0mqf4ACaYKe07LviNcmJVRzmLlpSA+Y194j1OxaF80zT6bNeKpJkTnKfKaXj01iJCNB7gYnIy8Pg==
X-Received: by 2002:a05:6512:239d:b0:4a2:7574:b64a with SMTP id c29-20020a056512239d00b004a27574b64amr6712826lfv.336.1668589229325;
        Wed, 16 Nov 2022 01:00:29 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id q21-20020a0565123a9500b0048afb8b8e53sm2510621lfu.80.2022.11.16.01.00.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 01:00:28 -0800 (PST)
Message-ID: <3037b4f9-268d-df03-380c-393a5d01f3ba@linaro.org>
Date: Wed, 16 Nov 2022 10:00:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 4/9] dt-bindings: Add RISC-V incoming MSI controller
 bindings
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Atish Patra <atishp@atishpatra.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, Anup Patel
 <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20221111044207.1478350-1-apatel@ventanamicro.com>
 <20221111044207.1478350-5-apatel@ventanamicro.com> <Y3EDuaW0zQSSfiQ/@spud>
 <CAK9=C2WDQCnVnxKR6SFspdwope2KffyASLJDF_Ygo_417ekJ5w@mail.gmail.com>
 <Y3QT5Vy3RnIXobHz@spud>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y3QT5Vy3RnIXobHz@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_010032_757187_A3FE7DB7 
X-CRM114-Status: GOOD (  13.92  )
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

On 15/11/2022 23:34, Conor Dooley wrote:
> On Mon, Nov 14, 2022 at 05:59:00PM +0530, Anup Patel wrote:
>> On Sun, Nov 13, 2022 at 8:18 PM Conor Dooley <conor@kernel.org> wrote:
> 
>>> Also, the file name says "riscv,imsic", the description says "IMSIC" but
>>> you've used "imsics" in the compatible. Is this a typo, or a plural?
>>
>> Yes, the file name should be consistent. I will update the file name.
> 
> Is there a reason why the compatible is plural when all of the other
> mentions etc do not have an "s"? It really did look like a typo to me.
> 
> It's the "incoming MSI controller", so I am unsure as to where the "s"
> actually even comes from. Why not just use "riscv,imsic"?

Yep, should be rather consistent with all others, and IMSIC stands for
Integrated Circuit?

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
