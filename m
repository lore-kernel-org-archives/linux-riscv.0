Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51831C77B61
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Apr 2023 16:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=290jwyCTp0y1gs06aa5Nu6Zd2OovpS70KIykjqUZoVw=; b=kkBUDJzhWaS1CJ
	oCYhVUEHPnryFf9WHVUmLHID6std/EiG891z0jbeiiMNm1apwsm9iTOyATi2YCkkSFN0kRCHEGNmq
	gHom3gt0z32SeX5KHKW1iQ7gQpaN79gyWGrF60Dcsl0lpp9HuEGsSa3E9bLBy5GVs8zYy4we34Edc
	+5yRSH+PYgQjzhzPRjjmQgbBcJRsE+FCykChCRrRoQE/eRGZQmmzkww+oqT8FbcW9B9FvtuGvuQ94
	V2lAyFbrAthphgxrTXFn3nMOW/EdNflz7F8zPNKSStUBB5nbLslG4bZZGZa4k75+aQpR9qVV+w9YE
	H9zjq5bcxh5lRyqEsY9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pptl1-00BP3E-2V;
	Fri, 21 Apr 2023 16:37:11 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pptkz-00BP27-1I
	for linux-riscv@lists.infradead.org;
	Fri, 21 Apr 2023 16:37:10 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-505035e3368so3174954a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 21 Apr 2023 09:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682095027; x=1684687027;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qwm7nC58x6Qg4M4BLeXeY+IRBzBS+KjdazE+g1goFZk=;
        b=cUGizRfjIXcfg5P+5cJVp+JcsumxnDw52sCla7aQOesNv3HWTeGTTUu+clkj3SO+Jt
         UkF8A4atIopljeZlvVBVZdeU5Ou0dmG8E6IPK+E1zwSjNSreqwOalmCVtFltT1SUawKF
         LIl0BKKYc9AE7QvABQHHlZVoXPPDBGb3cWkbSyQPWHZgatjXZVCjRQ9P1BrqGCVZGVyI
         uYQEdPxPBIBb4ja+UdS+qctfV2wGQPV4zOqpyCRmohvt5J+t0SU0R5z8z6o60umlZf9e
         S/hQSXUIqbelyvbSUwVkBtqqbqT5e7VHXu0owa5LQ1q9Z5vWa2OxOTekB/FwGHKcpEua
         GNhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682095027; x=1684687027;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qwm7nC58x6Qg4M4BLeXeY+IRBzBS+KjdazE+g1goFZk=;
        b=Q3cvLSUhlw2ZNpA0CZbiqIyxE9DF9nGB+MphL1yPQvHX8TljKEkgPq5ebTRoltwRYs
         gi8v9aBo4HIwhTLwABVzxlg+LVyYZwQta/bW6bbiMNmSCe1REDo1cSpa1dqf7z50QrFB
         qsQU6XE2avedbkhAigEmNqwuk++RaqqKRqOTFF7BB53Q8MSsT2LAgz3g8/HLyHDAPVR/
         LrTxE+yB6z1Ouxfdw8FeqjY0vP/e3BIzm5ICsS4A7+y1yDrKNRdElQP/bM7N/YNuWoUb
         F2vHnqZG5LJjh9naxxy5cXZyt424uHnO1N3jZSOJ3ZVJR/2q2uDKhwSqALx46y3wzhfT
         ebFg==
X-Gm-Message-State: AAQBX9eTl1jDIcyVQBSTE4AfZHJdE68s2Tqt3bI/WpAs9SMSLv8sVoog
	0UDdcsr3WE5ITLgQZuTbEnVTlg==
X-Google-Smtp-Source: AKy350atdmkxUyilew1Q6xsOtvyIiqhC+U/ckBLAq7AQ8Q8Vu+X6Eirq+VWhTiX9BrshfXr7DPPUEQ==
X-Received: by 2002:a17:906:fcd9:b0:94a:56ec:7f12 with SMTP id qx25-20020a170906fcd900b0094a56ec7f12mr2820823ejb.30.1682095027250;
        Fri, 21 Apr 2023 09:37:07 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:687d:8c5:41cb:9883? ([2a02:810d:15c0:828:687d:8c5:41cb:9883])
        by smtp.gmail.com with ESMTPSA id op4-20020a170906bce400b0094f39379230sm2254990ejb.163.2023.04.21.09.37.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Apr 2023 09:37:06 -0700 (PDT)
Message-ID: <6747425a-fff7-c873-bf7e-05786d67cc7e@linaro.org>
Date: Fri, 21 Apr 2023 18:37:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 1/4] dt-bindings: sound: Add TDM for StarFive JH7110
Content-Language: en-US
To: Walker Chen <walker.chen@starfivetech.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20230420024118.22677-1-walker.chen@starfivetech.com>
 <20230420024118.22677-2-walker.chen@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230420024118.22677-2-walker.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_093709_461695_BCAF576C 
X-CRM114-Status: UNSURE (   9.77  )
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

On 20/04/2023 04:41, Walker Chen wrote:
> Add bindings to describe the TDM driver for the StarFive JH7110 SoC.
> 
> Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
> ---
>  .../bindings/sound/starfive,jh7110-tdm.yaml   | 98 +++++++++++++++++++
>  1 file changed, 98 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/starfive,jh7110-tdm.yaml
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
