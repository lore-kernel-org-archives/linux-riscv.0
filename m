Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C680C636CC
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Feb 2023 15:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=///rmsqoAYk8dyrvB0u/tSx5wn7clZ7msauOP+DmCoQ=; b=ts4/QQtb4yaICM
	cW2Db+dFXnIPoYqNw2e6OObu20R39k3jSUpR+u3errutRPfpLrl5OwwSsIW8n6kmo6HSuDA5w37SZ
	Ga6YT4oChJDTw2fAM2RaulC+K6mV179Xcx0dywUB+3lI8OWDAiWBRuzixsu8daVNk7UTgL9i/SN/f
	jBAN8l0r3hCN/dg9bTW2qV5R/4bRkD1gHfEKTVhJYk3fuJaa5lthfIVvAu+qpCKJXaJAvN88kFaTA
	BrbCUpIJVNB1FLuQUrqXgP0dnZNhNqEoC/6g9wR3BeYuP1pSN4NziDqIInAPeoqKdQkl3njIu+Tzu
	TMG7CZDtvOXGhNAjneRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSg0K-00ApdL-IQ; Thu, 16 Feb 2023 15:17:00 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSg0H-00Apbg-Ry
	for linux-riscv@lists.infradead.org; Thu, 16 Feb 2023 15:16:59 +0000
Received: by mail-ed1-x530.google.com with SMTP id w3so4106762edc.2
        for <linux-riscv@lists.infradead.org>; Thu, 16 Feb 2023 07:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zAnvsdOOqlO4PehLrC0Bi2Lmw9x5a+PMtUIW8SMSgyo=;
        b=Un0S3taOSYhvRftUZlssA+ysy6mZMaiar8Vcm0lkFFGQhLxLQcKlF2Eq27yHWhjpsJ
         V+xCgEMEKuTPcJv9u8HrmoWo7iRdMzywqIWxUm7rjbKGkkII55CCqiZQ3Y+MpCuiK+dV
         fpBR+JKLc9tbBWzvAGRnAMjFDrEp8lUyB06KS5zPiM7iakUVUW+ovn3TXVAT2jCpK6vF
         BAn5Df/qWIqWh5bceni8mEugOU3knmQn9A70ytivea8C5vAgAfHXbnesmFtH4g1JSOXH
         VCdaGR+zQ1B8lYXKG2goMeAZ1+YLp8rhg8Q30xXw84oyOZd3TfhU5rJF4xb57e2viELY
         drRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zAnvsdOOqlO4PehLrC0Bi2Lmw9x5a+PMtUIW8SMSgyo=;
        b=l4U+yhcXTwtsNBrfvKg6NTR1yMf2ABjRN8+bVzece8il2OUF8M1yQE5r1q7YB87FfL
         Wu2MaIn88Q5pmGINUqKEb7GAcKKIT0A7kPw4MVIr+j0QWnVX205mqE6bqt7gYTZgaN6g
         riMx3qhj1OjggPx9rCv7ylBFts9m8PkRxZ2sPLrdXrFnwSPEKfz9lt1SQqij/fztZSMZ
         xhMSVPcbDT2lUL1oCDw586wSH5iBeyZzD170dwvWVCtgsVOwuUReDgaqy+r0YzhcHEZs
         qCd6D5/LIilQLzBstz6jSNbVC9tIn0GAbguJ2iqHXfxGXD5JjRZAKrfACrqFQVIpHUVT
         XrfQ==
X-Gm-Message-State: AO0yUKX56GrZoJaiWqf/cd8uenDY6f+pr70PTYHh0l6kZK11XzJpjAFh
	+1rvGcjEIAmbfnSRc8w9fa+j+a8GiiEct1ms
X-Google-Smtp-Source: AK7set92AuI061QLSt4JKoRfrS6/8GjDBjBTZQnbkcOx5U3ET7Bcfdi+rSByGSW1jCkaeRm2SwlUOA==
X-Received: by 2002:a17:906:6d11:b0:8b1:d5c:986e with SMTP id m17-20020a1709066d1100b008b10d5c986emr5610131ejr.15.1676560616300;
        Thu, 16 Feb 2023 07:16:56 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id 10-20020a170906328a00b008b147e4204dsm926885ejw.32.2023.02.16.07.16.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 07:16:55 -0800 (PST)
Message-ID: <8322cfc3-fa23-521d-a5ba-a349bf29923e@linaro.org>
Date: Thu, 16 Feb 2023 16:16:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v1] dt-bindings: riscv: correct starfive visionfive 2
 compatibles
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>, Conor Dooley
 <conor@kernel.org>, soc@kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Hal Feng <hal.feng@starfivetech.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20230216131511.3327943-1-conor.dooley@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230216131511.3327943-1-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_071657_947065_67C3F306 
X-CRM114-Status: UNSURE (   9.38  )
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

On 16/02/2023 14:15, Conor Dooley wrote:
> Using "va" and "vb" doesn't match what's written on the board, or the
> communications from StarFive.
> Switching to using the silkscreened version number will ease confusion &
> the risk of another spin of the board containing a "conflicting" version
> identifier.
> As the binding has not made it into mainline yet, take the opportunity
> to "correct" things.
> 
> Suggested-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> Link: https://lore.kernel.org/linux-riscv/Y+4AxDSDLyL1WAqh@wendy/
> Fixes: 97b7ed072784 ("dt-bindings: riscv: Add StarFive JH7110 SoC and VisionFive 2 board")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
