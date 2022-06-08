Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20569C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jun 2022 22:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A8uU1wSfNe7BCb1cir0AGhsvdIgS70DXKu4de8Sle8U=; b=m4/qyRCFzjSROr
	0pA1s+208K9ZoZJPCTy1wKInQYD/OEAzpXmszCVKeBuKvIbc54439sdPkaMJqehWFJMp0o0RaSv0a
	/Qq2PefiFvBQ4nXyNiUg6MQcPxlIsniDcewW7ae4yXceYrmaeaQKDEf6HYP1TXa08eFChSN8BoYFa
	NkbS1hMEyppWt0X0yowov3LxTvBnHz7xrujTirQ2H2vRHjCnqom1HBpxhMpSxe9wyK9Ne8srlpRyI
	v9jIijaSJZ/VCRjUoAffkmNh7mlPFuFbOxvwPvmRTKJ6BQlVGNMmVH5XqsVTrRNbdlGkDz3agv0TF
	QSZu89eCjPJIF8oChUfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nz4OD-00FB6F-Rk; Wed, 08 Jun 2022 22:43:01 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nz4OB-00FB5M-Ia
	for linux-riscv@lists.infradead.org; Wed, 08 Jun 2022 22:43:01 +0000
Received: by mail-wm1-x32a.google.com with SMTP id a10so9078854wmj.5
        for <linux-riscv@lists.infradead.org>; Wed, 08 Jun 2022 15:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=5uDM6tpuJABWxtiilCsqiowJeB7LSvJ3XOBsyRBng14=;
        b=ZpV0eJIiO9NjPQhX7Pl1+84j9heHppBnLerRQ0JTcVYGIcd+V4BCwS42iTP1N7oKQB
         W7tSUdxaNseKHAZj1LTZWO6VOczeDo5mScli8jffnF99cYBFJ4fPWPro4MpfoSmbnuYs
         UDWVcmRF4Tsk9qX82xDLerieJ65qvcB+MLtqEt1G5KVMWJYO54dLxcNQLRERpDDCZhqV
         fHb9aqAQ8v1ViIltT0HzpeVJIWFRxOizwUNd/R9t57RElo8irDHrFnLQPlLrJ7ZjqLfF
         Ou1lGanFu8k16V9tWGdRh7l6ra84kf8MzsiM9yjzzuP09JlkNuYa7lVXkpgwGYe+3ueo
         7zkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=5uDM6tpuJABWxtiilCsqiowJeB7LSvJ3XOBsyRBng14=;
        b=I9K4AHM0gtcfqjD0GJbFF+A/zcuyV/017d5+XDJ0Pk5WK7VF1jNmuiZ0awGlZus157
         onzgpK3WAdJAi+m0Z27+pEKfGgMLHQXZSQ5L5oTZw6m/dSDQ81FGt1PY51gGxpS+CLiw
         rzsZFlF1B8c0pcxedoSBHCSrs4+pRDemivJSOfuOzUtsNP/zocJBbz+zH/1Hc6/c494u
         cxsKFEv48GwESHyhtGGNtnvn8JB4XKIgZWYcrXUCcOKxW76sLyc1h1mjoJ/T+5CGpvta
         nRdYnmmfiK/r9XREDNCvJ+hvXDLutiIMb0ytsZjlpTEjgVs/2tE6cPUlhzxoAAK2IWov
         e4qg==
X-Gm-Message-State: AOAM5314c3LWagJq6J1caxu2RDsZvhe3jokZUn3lop51NHiSqoK3omcG
	yqfNv5T16SRRvWneRptNAmPHjg==
X-Google-Smtp-Source: ABdhPJwWjpgU/pQzp05ZueMBa5kILkWmN28ZkUdlRmQ9I4QeDy95gollDJq8USjph7VhhJ4Hd7rl2g==
X-Received: by 2002:a1c:f314:0:b0:397:10a5:a355 with SMTP id q20-20020a1cf314000000b0039710a5a355mr204713wmq.176.1654728175656;
        Wed, 08 Jun 2022 15:42:55 -0700 (PDT)
Received: from [192.168.2.222] ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id s1-20020adfea81000000b00210320d9fbfsm27203751wrm.18.2022.06.08.15.42.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jun 2022 15:42:55 -0700 (PDT)
Message-ID: <32299bd6-6038-4c4e-1d6f-979a438db8cc@conchuod.ie>
Date: Wed, 8 Jun 2022 23:42:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v1 0/6] clear riscv dtbs_check errors
Content-Language: en-US
To: Atul Khare <atulkhare@rivosinc.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andrew Lunn <andrew@lunn.ch>,
 Support Opensource <support.opensource@diasemi.com>,
 Lee Jones <lee.jones@linaro.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Steve Twiss <stwiss.opensource@diasemi.com>,
 Conor Dooley <conor.dooley@microchip.com>, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20220605133300.376161-1-mail@conchuod.ie>
 <CABMhjYq0GSEfg4T+cTqBwRdykC-rbQNEqnAZ1qM5fYbjUah5Mg@mail.gmail.com>
From: Conor Dooley <mail@conchuod.ie>
In-Reply-To: <CABMhjYq0GSEfg4T+cTqBwRdykC-rbQNEqnAZ1qM5fYbjUah5Mg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_154259_674241_24281462 
X-CRM114-Status: GOOD (  16.76  )
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

On 08/06/2022 23:27, Atul Khare wrote:
> Conor,
> 
> Thanks for the feedback. I will rebase and send out a v2 series
> shortly (it appears that the 1024 hart context patch is redundant as
> well).

Great, will be nice to get down to zero warnings :)

> 
> On Sun, Jun 5, 2022 at 6:33 AM <mail@conchuod.ie> wrote:
>>
>> From: Conor Dooley <conor.dooley@microchip.com>
>>
>> Hey,
>> Couple conversions from txt to yaml here with the intent of fixing the
>> the dtbs_check warnings for riscv. Atul Khare already sent patches for
>> the gpio-line-names & cache-sets (which went awol) and will clear the
>> remaining two errors.
>>
>> Rob/Krzysztof:
>> Have I correctly expressed the mutually exclusive properties?
>> I had a look around, but wasn't able to find an obvious binding to ape.
>>
>> Wasn't sure if a txt -> yaml conversion's MAINTAINERS update was meant
>> to be in the same patch or not, so feel free to squash.
>> Thanks,
>> Conor.
>>
>> Conor Dooley (6):
>>   dt-bindings: mmc: convert mmc-spi-slot to yaml
>>   dt-bindings: i2c: convert ocores binding to yaml
>>   MAINTAINERS: convert ocores i2c dt-binding to yaml
>>   dt-bindings: mfd: convert da9063 to yaml
>>   MAINTAINERS: convert da9063 to yaml
>>   riscv: dts: sifive: "fix" pmic watchdog node name
>>
>>  .../devicetree/bindings/i2c/i2c-ocores.txt    |  78 -----------
>>  .../devicetree/bindings/i2c/i2c-ocores.yaml   | 132 ++++++++++++++++++
>>  .../devicetree/bindings/mfd/da9063.txt        | 111 ---------------
>>  .../devicetree/bindings/mfd/da9063.yaml       | 123 ++++++++++++++++
>>  .../devicetree/bindings/mmc/mmc-spi-slot.txt  |  29 ----
>>  .../devicetree/bindings/mmc/mmc-spi-slot.yaml |  76 ++++++++++
>>  .../devicetree/bindings/trivial-devices.yaml  |   2 -
>>  MAINTAINERS                                   |   3 +-
>>  .../boot/dts/sifive/hifive-unmatched-a00.dts  |   2 +-
>>  9 files changed, 334 insertions(+), 222 deletions(-)
>>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-ocores.txt
>>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-ocores.yaml
>>  delete mode 100644 Documentation/devicetree/bindings/mfd/da9063.txt
>>  create mode 100644 Documentation/devicetree/bindings/mfd/da9063.yaml
>>  delete mode 100644 Documentation/devicetree/bindings/mmc/mmc-spi-slot.txt
>>  create mode 100644 Documentation/devicetree/bindings/mmc/mmc-spi-slot.yaml
>>
>> --
>> 2.36.1
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
