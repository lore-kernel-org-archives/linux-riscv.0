Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C3ED3B7D3
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Dec 2025 11:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/gwxdoN23isnY3LxcHrWQhTzmGzV+oQxR1INndb396E=; b=PmjFf9ZdrKrfJ5
	3SPNHEAKoo1f2wD5WXVaHPHgUzekUmBftptcNdWjRnnI4T7olbjeXeMtcvQNsCgdCUfBJYHTwpcdB
	6JbGVXne0ht+yxzx3iOsXBn39nVM5Pxg44sG1cryoWS5ZezZg5YmOBpcxUtfkcT8r2kjAaJ+8ChnS
	EdzsUKGqJtE81P49yyBbJoyZKo2aFxCQC3Jo7GpAMUJgZ65GKbwHwU8Qu91+vv3qnAowgBg9G/ZBk
	lXSAq78XQvCzDqhjvqNNW4tKAU0mJCob/QLl3WEhXJIzbqzbARXHsBz7t7eUB50HJS/OmDOyyVA/m
	jCrGVGU0W4c6s31cQOrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRqJx-0000000ArRh-2BCL;
	Sat, 06 Dec 2025 11:19:25 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRqJv-0000000ArR4-0m7a
	for linux-riscv@lists.infradead.org;
	Sat, 06 Dec 2025 11:19:24 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-477b5e0323bso22253675e9.0
        for <linux-riscv@lists.infradead.org>; Sat, 06 Dec 2025 03:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1765019961; x=1765624761; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y+tHfftO48W6nfjgJOb4B4hvebCxVDzsjtXa/TDx3TU=;
        b=Z6pdzQVe2+wJtT03YpMYjx4PqxWTkih6fQUwgzA6PPYHq1r8XLjbYqE/1MggLMlCWg
         FXS3K0QLB6c1X/Gb0hSSNQs207oyMhqP1sjwRdJeqgEngiHbQssyOYDlKS+WLbryPPe0
         Vhx4YcuLfosgS7Hl22OSuK8qgAPAF85JL7KRdeAEsM62Gu3sEqxZXkL4pRHGuElzdOej
         tK+piBmVmwKTcjAuFU5V/kkwDOkMAetiAsZaEG7iRZqkZR7k8eHu86gjPgWtWYl0IpuW
         ZpEE76LwKG8h9QWoY4GU0Iu6ZRlEm3zv8IF6Y4fXzMgeCUJ8T2PKvXTaH354jQZ/VEP+
         Zcdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765019961; x=1765624761;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y+tHfftO48W6nfjgJOb4B4hvebCxVDzsjtXa/TDx3TU=;
        b=t4s98aazCFei69ptSfsBfLtSVFyz5RIg31QhEtmkrh/h2sAGJlM94wWWAQqrfTHzk3
         +AKMkHfePI1VXsxhatnBjkRajPTL7rOaWuN42GVCo2tF3DavDfKpW/TRMCbwjdGmfept
         DfeEqS5i8AWoX20/n5f5vxlPJYz2ur3jDKANrWqAKXaAgLud65hEatJwaAOo4xKhtolT
         lcC0+UXN0yGzfaftcD8G2DlTiVMqwJjWnaLHid3zjKp2DXp1/w00grjFe43PapttQZ7h
         oY+LzXaNx307IMmsUi5V1IaL1ltbF/VfAu9NVtIbipgAhPyn1jYuR/JFyQ1ZTwNsQ2up
         qWZA==
X-Forwarded-Encrypted: i=1; AJvYcCWBhMXfE8ODFhZhY6hPc9WbKZtjUb9kOCcxecS2UtuhR9KCNVg8qYBkHifU8PB+yK8XM2BhdDECJM1BSg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzZE1r1R9mBK1v9OgUB7eKFGAxzsk0tAmn5p7zUPQrWxHLhM/AH
	ifG4qLXTDU39MUKo79EWt0iSJKKLqsQXhuJjQSCr82PFFgPfc/67Gemb+MQbIcChMSU=
X-Gm-Gg: ASbGnct8miCOA4XQmzcLyFUtM/PtDnTbtrKnZPym8u6n7Fqb5xLGPMCv7EVjBoxsyW3
	C6ZmPfrehEXdDejpejY34IQG40MFKgEMhpjqxHzGgcG3+BXbd0TGAUS3T0HegqP/WDrQisjrc8S
	+ByND9YUxvZcoyJQHhhP4yYu5SHO7T2UkdIpCSD7MtkKLRKFGJ2CvPBKf+rPaz2EJ2dfwDcUMgX
	Z4Min00djnywcR7K8Dixg1Dsvo9MIeQvz1ndQDuY0AirHVm1A0bGJu3l4/1nlCdSdU3AD3yvyH8
	VeJtZcCN1MPVtC/1iPT+Sm9wHMx4Sz6ZcOoLyfrsqKBO4ktVjd1L88zthI6o/WcNWwfjEmHTojB
	KtO2+j6gIjn1FYBZ+9GJewuerhpggFM/eluwFuoZcrWlmH6/J/brvE+To98/cZPy3mtAluyJlw6
	IClXxEdO6xJafXjnSUHR4=
X-Google-Smtp-Source: AGHT+IFQhZEwtnesdZtzEMw60QGuto1Jk8aN5Q0uD1nL300gD8ap+hhiRTO0P76q1MY51cduyxt10w==
X-Received: by 2002:a05:600c:a11b:b0:477:a71c:d200 with SMTP id 5b1f17b1804b1-4792eb5e5b9mr87841915e9.11.1765019961379;
        Sat, 06 Dec 2025 03:19:21 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47930c747b8sm133725725e9.9.2025.12.06.03.19.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Dec 2025 03:19:20 -0800 (PST)
Message-ID: <5afbf96a-c87f-43cb-8cd1-d7c9970bfd07@tuxon.dev>
Date: Sat, 6 Dec 2025 13:19:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: clock: mpfs-ccc: Add pic64gx
 compatibility
To: Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
References: <20251121-tartar-drew-ba31c5ec9192@spud>
 <20251121-trade-slacked-5fc7c1139cb2@spud>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20251121-trade-slacked-5fc7c1139cb2@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251206_031923_243651_36AE057F 
X-CRM114-Status: GOOD (  10.41  )
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



On 11/21/25 15:44, Conor Dooley wrote:
> From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
> 
> pic64gx SoC Clock Conditioning Circuitry is compatibles
> with the Polarfire SoC
> 
> Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

> ---
>  .../devicetree/bindings/clock/microchip,mpfs-ccc.yaml       | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/microchip,mpfs-ccc.yaml b/Documentation/devicetree/bindings/clock/microchip,mpfs-ccc.yaml
> index f1770360798f..9a6b50527c42 100644
> --- a/Documentation/devicetree/bindings/clock/microchip,mpfs-ccc.yaml
> +++ b/Documentation/devicetree/bindings/clock/microchip,mpfs-ccc.yaml
> @@ -17,7 +17,11 @@ description: |
>  
>  properties:
>    compatible:
> -    const: microchip,mpfs-ccc
> +    oneOf:
> +      - items:
> +          - const: microchip,pic64gx-ccc
> +          - const: microchip,mpfs-ccc
> +      - const: microchip,mpfs-ccc
>  
>    reg:
>      items:


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
