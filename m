Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5803EB64DD
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Jun 2023 23:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:MIME-Version:Date:Message-Id:
	Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aMm23TdrUCkM/3soRnrG98CWbQW8HrfDq87uhHoe3tw=; b=UuqdqzEfDdfame
	9h2bCFA7D+U9dWcFKNlcRjRA2p7Kfa+YsIZ3+kE1v5bHMhAqr5zA4fgZtFQOSCFXrHLLWTj0uRXN+
	j1qXg1ufBvYmohc/fDMPgs9dnTcn6/rYdeWnTQeW4C7HPslz9iIJ0735CRfkHIlz1akVIjg+6OMva
	qm6+6A3wF5VNF70dKYZ/jmzcMcy3VnCiAt6LnFWGYUqW8MB6zuXCevQUc4zWpGK/0MZlbkaIK/6kW
	2/jdRfPLLcUvJbCiX7Xnq9WeePvT2VQQ/f6vjU72nSoOfaTJEht45g02dsQD1NNYQN2KRyBpy6bGt
	ociWT0ib0lqXDc8YQ59g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDZ0P-008tuU-0e;
	Sun, 25 Jun 2023 23:18:53 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDZ0K-008trq-1x
	for linux-riscv@lists.infradead.org;
	Sun, 25 Jun 2023 23:18:51 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-5440e98616cso2433821a12.0
        for <linux-riscv@lists.infradead.org>; Sun, 25 Jun 2023 16:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687735127; x=1690327127;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UpIMN4XpQeJ4YS60z1+uA00mzggF5bwaAByLir7yAT8=;
        b=FCItIZREMzNmf0+O2gHgbjDSS/tvGoIqGJfdbKC5Jj7SJzvu3lioxezMtC1HDhl5So
         98XVfsCcuuHTo6GvyDFmxNiWrvGk9Uqxxs5PIaNPkb/uMUx97RpUv6jNjeY9iXLaaFmu
         GYvTRnzfdwo5C6WP/HCCboNbc2qshMW1zswM15zWqIvnTEsa28hJLEFEngHCqxlF3fVU
         Rs685KTXsXsBn2oorAGb+5xB9XBOwtNngb71o2I1c5sAxIVGeNfcpa1hAS7CRapAJvVV
         tGLfO4525A9ZllTrsJQt/ETb2wjz2EJ4rw+xpnNsxf2Sw9oz1+ktcM7xE1JIIb/1FlFY
         Z6Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687735127; x=1690327127;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UpIMN4XpQeJ4YS60z1+uA00mzggF5bwaAByLir7yAT8=;
        b=i7kxQ899pDTDqjHrqa0tI2PSSMQXkRB1WXf559HFK2+d9fb3W1MudfD5F4VNWcSfMu
         Whx16IC04bzl1wje+Ln/yjWptzw7S34aywJ1xGDsYZDatwUZv3oCxen/cI9jLCveCjpj
         LY+x9jBUTIVQuiuAx0+l0RF4ZwTaUNrrEJO0ZAaPXphFoSpmFzP+DuB5/7h6Oxn6r+/a
         iaFS98JAlSGyzJJRTHAy84OCcUEITuFdJ8Y5uZYs27t8K5C0xWBRn/Dxx0to5Da32MGY
         bnYKsUoaHSNCWRTzz8yfkU/goGdX6b15CQCcEOco53RCSXNVgNvgLHWIWa4RaW4nQvD3
         kv+A==
X-Gm-Message-State: AC+VfDx7L7PPy/+khv74tOtBe1yFhLUoO4OatmafQSiGFORNPbDeHRV1
	TUPBAYAG6Edmtl63HpacKnET9w==
X-Google-Smtp-Source: ACHHUZ7nbVKHfGLropxdF66iIyVMQTIOdVAZVedhoQaFHgz2eoQki5gZUqcULorkUCI0XuWh97Aq/w==
X-Received: by 2002:a17:90a:ac16:b0:262:e589:678f with SMTP id o22-20020a17090aac1600b00262e589678fmr3363933pjq.10.1687735127392;
        Sun, 25 Jun 2023 16:18:47 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id n19-20020a17090a929300b0023d386e4806sm3033535pjo.57.2023.06.25.16.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 16:18:47 -0700 (PDT)
In-Reply-To: <20230607-audacity-overhaul-82bb867a825f@spud>
References: <20230607-audacity-overhaul-82bb867a825f@spud>
Subject: Re: [PATCH v3 0/7] ISA string parser cleanups
Message-Id: <168773507356.1389.13419277183239266395.b4-ty@rivosinc.com>
Date: Sun, 25 Jun 2023 16:17:53 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230625_161848_644072_8C999CA2 
X-CRM114-Status: GOOD (  18.04  )
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Yangyu Chen <cyy@cyyself.name>, Conor Dooley <conor.dooley@microchip.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On Wed, 07 Jun 2023 21:28:24 +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> With that out of the way, here are some cleanups for our riscv,isa
> handling.
> 
> Here are some bits that were discussed with Drew on the "should we
> allow caps" threads that I have now created patches for:
> - splitting of riscv_of_processor_hartid() into two distinct functions,
>   one for use purely during early boot, prior to the establishment of
>   the possible-cpus mask & another to fit the other current use-cases
> - that then allows us to then completely skip some validation of the
>   hartid in the parser
> - the biggest diff in the series is a rework of the comments in the
>   parser, as I have mostly found the existing (sparse) ones to not be
>   all that helpful whenever I have to go back and look at it
> - from writing the comments, I found a conditional doing a bit of a
>   dance that I found counter-intuitive, so I've had a go at making that
>   match what I would expect a little better
> - `i` implies 4 other extensions, so add them as extensions and set
>   them for the craic. Sure why not like...
> 
> [...]

Applied, thanks!

[1/7] RISC-V: simplify register width check in ISA string parsing
      https://git.kernel.org/palmer/c/fed14be476f0
[2/7] RISC-V: split early & late of_node to hartid mapping
      https://git.kernel.org/palmer/c/2ac874343749
[3/7] RISC-V: validate riscv,isa at boot, not during ISA string parsing
      https://git.kernel.org/palmer/c/069b0d517077
[4/7] RISC-V: rework comments in ISA string parser
      https://git.kernel.org/palmer/c/6b913e3da87d
[5/7] RISC-V: remove decrement/increment dance in ISA string parser
      https://git.kernel.org/palmer/c/7816ebc1ddd1
[6/7] dt-bindings: riscv: explicitly mention assumption of Zicntr & Zihpm support
      https://git.kernel.org/palmer/c/1e5cae98e46d
[7/7] RISC-V: always report presence of extensions formerly part of the base ISA
      https://git.kernel.org/palmer/c/07edc32779e3

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
