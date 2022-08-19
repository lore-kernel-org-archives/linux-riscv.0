Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86244C32772
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Aug 2022 12:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=41iqjiVxN7P87AA24zxHlNv3PR1NP6AIZc4KFIOyyXo=; b=2TvkkgtWqBPMgb
	4q6Hqfp9alu5rCYeyyd3A1avg3tI1aRlMg3qnLSejx3z+Xl+w6VRVOgl7ifyPm/7oFJhXRGrIohjJ
	DWRSMclVhnbNChK5meHkvTYxZzp/4zJQRLCDeaHg7rSp0f/e1M72g+n6yJAtx3Jy2rUIPlRtJ4Ci1
	Caj/jUtiCax5foFQFUdvAKo0CuVURG3pM6ldyXdgdDkrxLJld5T81cDK4SJKNZ+50DqctXscfafLE
	hOve102LiW0D6Hxh3pEMg7bGUIp89YsJ0BnPOLXK5G2NVHdmVx/rRjCJC5xvrhhakKmP03wYNMKwn
	RkMzvb6iB7giya+XrHfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP1MB-008Aia-RB; Fri, 19 Aug 2022 12:44:11 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP1M8-008AcG-SC
	for linux-riscv@lists.infradead.org; Fri, 19 Aug 2022 12:44:10 +0000
Received: by mail-lf1-x134.google.com with SMTP id b38so3361508lfv.4
        for <linux-riscv@lists.infradead.org>; Fri, 19 Aug 2022 05:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=g02EyWp//JevB4+ewRf2FLk7rDtVnLg9C24+9DDwDsk=;
        b=rIo+YCssu+kNCpWs8BCPAd1oGVY4ELsQzrJaEyhbySFiXqmkf8DDlBOuDQtqeQqS7k
         Ic8ZNFpfe4Hh1JXjQVStebzjSHmfDDMQQvdmHx9FNi8QthT9FrT86G5FSPuwphtC/Ahf
         QppHUEN88mhRiplbmBROTdwmJ0WCO+uPFw0ip7X9t/5FXYwF7pUitk8gwAl347vP2CUV
         tlFmIMfxjdG7AfPcSh6sXNG3n0XpauP/cH0wOj62WCheu81YIqzg3lKW7YQhW8kKNcdB
         iVrBvrIRzXMGH39fgkEm6Uw73n+z3PxZkNfjcdObiMRL05wjwiZNixHuOlC9VYxxut6b
         L5JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=g02EyWp//JevB4+ewRf2FLk7rDtVnLg9C24+9DDwDsk=;
        b=2sNqkx93b+iBQCsdbkZeFzTg/bJFOQ/Lih2CuDSNT/qJKsV9djhp9bZio5NA8oZKBu
         y7cuAIcv1g2ZKZgDn/WTWbwS0zs/g+fvyT8bwWG5ySOdWYiN81MAEkZptPQpcj40Wmx4
         NSJQtw3LfQXJRaGq+gvt4AUZ6za+KCQieLz1cOO2xPcwWMCPMvjV3AozdHJW0ea+Juzg
         xlvm9P/M+JoGCPy3qAcbXiapJj/R0TUJOBiE/NLSC7Rw+LrLTboFTu3J3JN6qcsvcJwl
         25rwdiE2lzE/gVS210NxBRK+SvDo/1qPt+H41pEvEQt1bO1Cn7xcvio6PbLnu97tTLF7
         jRwQ==
X-Gm-Message-State: ACgBeo2mYIthtHJZPLDLuIq1x7PJ9xTIYshBEOsMUm86ojkHMfsYT5tD
	ruSa0W8nzxq5E0fmpWZqYr53+g==
X-Google-Smtp-Source: AA6agR6/aN0g7sO+3gapHkOZtIhZD+1HpWLEQsCU8k7RAZm5tla+hTcZT/sDeja2yTy5Alm/c0EiEg==
X-Received: by 2002:ac2:5f77:0:b0:48b:3886:5d55 with SMTP id c23-20020ac25f77000000b0048b38865d55mr2255774lfc.668.1660913047156;
        Fri, 19 Aug 2022 05:44:07 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ac:e5a8:ef73:73ed:75b3:8ed5? (d1xw6v77xrs23np8r6z-4.rev.dnainternet.fi. [2001:14bb:ac:e5a8:ef73:73ed:75b3:8ed5])
        by smtp.gmail.com with ESMTPSA id e30-20020a05651c039e00b0025e42b981f9sm594463ljp.44.2022.08.19.05.44.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Aug 2022 05:44:06 -0700 (PDT)
Message-ID: <9b377685-0471-9ca2-c6a6-1b7f1ce9ec86@linaro.org>
Date: Fri, 19 Aug 2022 15:44:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/6] dt-bindings: clk: rename mpfs-clkcfg binding
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Daire McNamara <daire.mcnamara@microchip.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20220819122259.183600-1-conor.dooley@microchip.com>
 <20220819122259.183600-2-conor.dooley@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220819122259.183600-2-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_054408_973603_A94E4133 
X-CRM114-Status: UNSURE (   8.42  )
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

On 19/08/2022 15:22, Conor Dooley wrote:
> The filename for a binding is supposed to match the first compatible,
> but the mpfs-clkcfg file did not follow this policy. Rename it to match
> so that when other mpfs clock bindings are added things make more sense.
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
