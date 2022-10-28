Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 599A6C38A02
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Oct 2022 22:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=En1cLhkYaHetDpt47SJ8mN3b9WaYM8kftHrekgvRpqk=; b=30MDRP4P8Ke1r9
	KCBYH/fkVT3tVvrx3l88c/Q7qSw2fdwi2DSx1cprigp59FHdPRy68WNqow2kapNCq4JUkR5zDMAY0
	euEq5RWjIeQWIkmLPzJrqudkFvn9xaMb9OTIXhMDwmTMr7xLRFwGPGmYmFnaOtM7Se5fWAYpNXnfO
	u6KU9uNEVaulxULLdropy/c3AVYGL3SgjrC/xmiHGh88ySruY4pkB1Mz3R2q05Xy8HfLkR3OVXowO
	zApCScPaQp/IlRUNodBu01dwEeBwqx1gURmMy6gfEXa7CYdmzOYadHarWPOU4yfMLinyEM0h2xTh4
	wAxSbkvp7YZH8R0IH1Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooY8v-003ByI-8s; Fri, 28 Oct 2022 22:48:01 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooY8s-003BwR-Jw
	for linux-riscv@lists.infradead.org; Fri, 28 Oct 2022 22:48:00 +0000
Received: by mail-pg1-x529.google.com with SMTP id f193so6063866pgc.0
        for <linux-riscv@lists.infradead.org>; Fri, 28 Oct 2022 15:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XNWOunf0MeNELm/6hh2SrO7f/AQE69u+QfbjVdty5AM=;
        b=EEpGSKxK9lR6bSHQeO9mpjI5aJ0mo+Tq9xtR5dxdAmPO9pWDjVnq3MZGd3HBstWi89
         G81YmqMpQD6yQWv7F7ajDR4NDx7KA6Iel23+LU300QGRZLpkh8LHT1j31b1ctIB0AzXR
         W4ib7MLukIKMC+QZGnlSX+erxQKN1z0e9QTqXwH4kEz350BEMayq7PocPU1ejopjVjeG
         fqAqO0qM9sV+0Rnn7zy7g+DyMo1wxWqz+H2CDqLf7WZ1cBsSmVWB418/2iXO1nWpNhCm
         c9JOSvK/1J5o3pAH+/Ej2Jx0J13dmvi4CIYsCT8esTVuiZuJDdBhUWIz+EWJ1VwNhtmZ
         ZdDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XNWOunf0MeNELm/6hh2SrO7f/AQE69u+QfbjVdty5AM=;
        b=E3Ou7K7oRrxYEY6X9hVjQcrhas/ny8qM5OH9+KFFZFEwg0gQcEgX+47Z+iPpAE+UKk
         hneKZd9uh9FVhfRYIDy3INZarEyE0/aaO/7Cs2WY8WJCc/JcmSTvXeNau6ZDFE/iBQ17
         sSUpYHIjg6xtphsgow2+pNCUmIl08CqFfEPCCHQ8QA/frfcFVlSRDQd/usgDdKOt8euY
         F1xtkbBrbyeU3L4qOq1xjbwCTdWZ7eN4GxAPrR68IIwa5wnnQwvRQZFM/nF5WqLjXAps
         yLiVnPkhxJQz3SrLclTfw2bSukhUbico39II4JcaEI4TpUVylc9hd+/Lv/0ibipniaCi
         9AhQ==
X-Gm-Message-State: ACrzQf0HgubkoMAZI+smbny0lg6pnTWMlZnDRxWkKiedsdf+ScMumdHw
	VLTMpsFoWMe2lbIfwrqaDGwYMg==
X-Google-Smtp-Source: AMsMyM6QWOjW3DUtSzW+KukyxrKtOPnGEwYsIahI+/leRyvtuw78aUBGwwYao1GqCUc6at4+NEb0tQ==
X-Received: by 2002:a63:ea48:0:b0:43c:69c4:68d4 with SMTP id l8-20020a63ea48000000b0043c69c468d4mr1629243pgk.416.1666997277123;
        Fri, 28 Oct 2022 15:47:57 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id q22-20020a170902bd9600b00186b6bb2f48sm3523938pls.129.2022.10.28.15.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 15:47:56 -0700 (PDT)
In-Reply-To: <20221012110928.352910-1-emil.renner.berthing@canonical.com>
References: <20221012110928.352910-1-emil.renner.berthing@canonical.com>
Subject: Re: [PATCH v1] riscv: dts: sifive unleashed: Add PWM controlled LEDs
Message-Id: <166699694891.354.8818111630458399949.b4-ty@rivosinc.com>
Date: Fri, 28 Oct 2022 15:42:28 -0700
MIME-Version: 1.0
X-Mailer: b4 0.11.0-dev-36ce3
Cc: Alexandre Ghiti <alexandre.ghiti@canonical.com>,
  Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
  Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org,
  Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Bin Meng <bin.meng@windriver.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
  linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_154758_676285_539E6F34 
X-CRM114-Status: UNSURE (   7.99  )
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

On Wed, 12 Oct 2022 13:09:28 +0200, Emil Renner Berthing wrote:
> This adds the 4 PWM controlled green LEDs to the HiFive Unleashed device
> tree. The schematic doesn't specify any special function for the LEDs,
> so they're added here without any default triggers and named d1, d2, d3
> and d4 just like in the schematic.
> 
> 

Applied, thanks!

[1/1] riscv: dts: sifive unleashed: Add PWM controlled LEDs
      https://git.kernel.org/palmer/c/8bc8824d3019

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
