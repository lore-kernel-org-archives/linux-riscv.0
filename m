Return-Path: <SRS0=Gszz=O4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAC9FC433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Oct 2021 01:29:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7077D61212
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Oct 2021 01:29:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7077D61212
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=i2/iK4wWy5suGfgOQVIpQ84596d2AQA0WkckmyNAoTU=; b=EOs9KCz+TmPf/Z08+ChJSqtqDX
	VWrNy3qubql5RJOmStqsfOZ6dQqwJsxM7fcv6h08kixXl43IdQN6CV52bF6Rh8Pt8+t6XPC6Qukru
	dgFUsEqMNm+G5alyGRVTSPbVL/CeRn69tFyQbBK22VYA24FeaxlODjaNkE0UA0ijkRWZNII/TGLYL
	SMHqY3gZy/aGCZ++pZYDynoeBg4aMfm1xvl5VhbZjVR2prwUrVqxcREnvC4xn7M7vZ1iluPVSYKmh
	3aVtj0zMlrRSuBYN0owGgicIjMjGvgDgo9q7TSgWVh9W2Dtksp0GoMg+47S4Nkwzmd0F9QThDc5pO
	AN4Qu5HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYehN-001CJQ-Gx; Fri, 08 Oct 2021 01:29:21 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYehK-001CIp-A2
 for linux-riscv@lists.infradead.org; Fri, 08 Oct 2021 01:29:19 +0000
Received: by mail-pg1-x533.google.com with SMTP id s75so1563523pgs.5
 for <linux-riscv@lists.infradead.org>; Thu, 07 Oct 2021 18:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=WtHRg9pE0seuBB0ZG+GOfqW0Lt5umZXuKqLtBMykH80=;
 b=Py38WVG6evZxTgbhtQhoj3yPWvrjQoA0BU1h9uNK/hr9cl8RFxQWrKLw34xpnThEG0
 klI6GH7xt/dyjOl6vKJ/+uqNoFRQR5VTBhfce7zL1CDLMYkkRxn7vKyJ5G2OarXIonGN
 SrMTwr87YxIkSK4U4VGIDb71ve5wWtv+axm0rWWkoKWR9BHWRH7s+t5TSM1igiXofeZf
 8ECbHfYgLFSW2Hfkj+oN3qycwBORzeS0lX1ZCp62xxNkBqA81K/nfF9c6WEdlRwp9iJh
 gsrCmt3+SVk4BlntQ1rjigO5ZiyDUCTj1MwehB5lPZvAzDzuWHJyTY3iuVQwmKVRpSff
 UGGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=WtHRg9pE0seuBB0ZG+GOfqW0Lt5umZXuKqLtBMykH80=;
 b=L0SKy6nEaJlSUO/6lafSKdnZ9pj/nHL+hUDCDIU0lq9BuGk2+Xc2J3AlPGGtIoUNms
 tIa8wkuhkQNgOsEHunga7pj2fnpq7WEFeI1F7WPiS6f9b7/PQtzfaNbmHf/B0AGruEMe
 +DnLQG3xfmBpUB7njxK48BPGmvGXeEAFBunV4mtzQHamY8ZqNHsNBtoodAS+Tn8eMxEz
 EQYdnAv8zinq0XRJswUTL2kw0eXw1T5uOHBcNjioSA0C5wibGaut7RF6+v195pEwAceO
 UzAJxkO87icHHHDUk/NveJrVZjRzhXIE434hghnJWKMT8hbuU8LlFJMTEUnlu/CzilCV
 6plw==
X-Gm-Message-State: AOAM531QIRxREu77EVTHLlp/nlz0j1or7bdmbFH7WibpwJV7mjlAwJLx
 sedOTs1SYC1Z5TPmCHrBqFPOiuNRKepQUQ==
X-Google-Smtp-Source: ABdhPJxKIyBEk/ExdyYLGRv9pO7zazoYAulMHHBsViB3AH1uRol820KvNN1onfoc9AFMNMN5/tyBjA==
X-Received: by 2002:a63:e64a:: with SMTP id p10mr2349033pgj.263.1633656557550; 
 Thu, 07 Oct 2021 18:29:17 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id g10sm582784pfv.109.2021.10.07.18.29.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 18:29:17 -0700 (PDT)
Date: Thu, 07 Oct 2021 18:29:17 -0700 (PDT)
X-Google-Original-Date: Thu, 07 Oct 2021 18:28:59 PDT (-0700)
Subject: Re: [PATCH] dt-bindings: clock: fu740-prci: add reset-cells
In-Reply-To: <YUyydGrDNzISu6JX@robh.at.kernel.org>
CC: krzysztof.kozlowski@canonical.com, zong.li@sifive.com,
 aou@eecs.berkeley.edu, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, robh+dt@kernel.org, 
 devicetree@vger.kernel.org, mturquette@baylibre.com,
 Paul Walmsley <paul.walmsley@sifive.com>, sboyd@kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: krzysztof.kozlowski@canonical.com, robh@kernel.org
Message-ID: <mhng-b9e6d8f9-b9be-4651-9649-3378d227eae1@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_182918_371474_E2784EC4 
X-CRM114-Status: GOOD (  12.60  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 23 Sep 2021 09:59:32 PDT (-0700), robh@kernel.org wrote:
> On Mon, 20 Sep 2021 16:49:44 +0200, Krzysztof Kozlowski wrote:
>> The SiFive FU740 Power Reset Clock Interrupt Controller is a reset line
>> provider so add respective reset-cells property to fix:
>>
>>   arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dt.yaml: clock-controller@10000000:
>>     '#reset-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>> ---
>>  .../devicetree/bindings/clock/sifive/fu740-prci.yaml          | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>
> Reviewed-by: Rob Herring <robh@kernel.org>

Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

For some reason I thought these went through your tree, LMK if you were 
planning on having me take it through mine.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
