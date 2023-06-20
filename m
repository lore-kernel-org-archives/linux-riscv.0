Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C634EEB64DC
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 19:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QY5VtL3xv2AYBjmYWowWh41x0sTz8abO+dq0ezs0OpE=; b=Zb8HRG+Z2bC4vq
	fqAGAj+5qcngT9VnV62AFhMfklw9jf33QfPzr11SM+kuiVIUKSQaMhl2Ir8psYdMNvrisXAq7G71V
	xtNqUGWGQykX6sJ2PyMomueffdty1edMijCZHyNrxAClEsh7wh94NhAv3ba4nbB7zGmFWc3tA0aPM
	UmI/vZ/o6mXFUdtR2swmKtTF55dRyrHmCeYXSTkcGOt8qs5lEONI6+CLzKF5Sa+DjLmty/SHNXswM
	dwr/Pq3DVeCBKGB/vWiHe1YHXo5UQeOwYzaW0MA2+yyKafV9V2Qjx+2ysyfGsphuk6u+r7kEq0+Cu
	EvWGcGISUaW6Qk3Mu6Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBh44-00CBGS-2P;
	Tue, 20 Jun 2023 19:30:56 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBh41-00CBEh-2J
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jun 2023 19:30:55 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1b51414b080so29496095ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 20 Jun 2023 12:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687289451; x=1689881451;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Jak4VAiKyxNW2MF2c52goYxqj84zATitJ45PnIg+zA=;
        b=jj/nx4Q6wNcCgENH9upzbuBBoImgkFJF8LxIGxpgWSB9SKXU30q8kWo4GaX1UuvSB7
         cdjPBn1/jMj2LABx1PB07h45Myd+qD0uZNHctKmuR7hdIGlPAXaZf18758E9K8cweq0F
         /3uGiQhsp4cG7LQ3UQdWKcjMSHK/s3CFpJoltpwy2aIusr/E8xAKJ/MVI/OPvv1CcaAi
         DBPLtM1clszs6abhLfytm+rQXgx31+E/6QSuORzUZA+P9p+lUOEsEnjP23tZpBUzAhwb
         RXTlrEmySXpJagjNknKVF0WIz+sxt/WFkHeEWDzv68GAwO4obOG1SWoHpfEdEjT5roOr
         3MCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687289451; x=1689881451;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Jak4VAiKyxNW2MF2c52goYxqj84zATitJ45PnIg+zA=;
        b=DYvgRYzAab2F4lFevXUsGgPnUOCvXVltaaa58QcjnNcUeVjYeSJDNYsw9l23ntMUjW
         HAZay+bRaKCCcRIjTc8BH6qByAv49vgyAIm1BS6MQRJreTcdcuwhNgt5GXz1AOMQ8P7M
         wIAOkI0jf7vgXljOaF5/bbrX6kh4WRYyhTZ2vCw2eYctnUdLXq8P+yDG5YEaLTXA9p/o
         dsgT3Zm6Pa9lWFvxB8r5W9xLx7GJrOnqOGlmMXPcbQJO7ALGRZZLaxev2pfDst1U/j/e
         piJd/9uMjEjGaHKqW20pu7cBeBAMG3EwXWAGq4xg7P/cZEXnQsHVgl1+ESm0eDwW9bCy
         hw5A==
X-Gm-Message-State: AC+VfDyN9ARQ4dINlRPIQUB06zPIqD3SXTQI0i7496GMs9O3TidNCvmO
	V1ROqLGk0/e8yyqsDtMrbExiAhOpl0hnoK7CqO8=
X-Google-Smtp-Source: ACHHUZ5X8f2vx2Z0B3hkaw5OWyJtmMa5qKAxvgJNC9XDE9TuY7k834Xx2Ye3EvrakXc/fvbarw16zg==
X-Received: by 2002:a17:902:cec9:b0:1af:f751:1be4 with SMTP id d9-20020a170902cec900b001aff7511be4mr12796873plg.63.1687289451482;
        Tue, 20 Jun 2023 12:30:51 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id d14-20020a170902b70e00b001b0034557afsm2000604pls.15.2023.06.20.12.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 12:30:49 -0700 (PDT)
In-Reply-To: <20230523165942.2630-1-jszhang@kernel.org>
References: <20230523165942.2630-1-jszhang@kernel.org>
Subject: Re: [PATCH] riscv: mm: try VMA lock-based page fault handling
 first
Message-Id: <168728927543.19726.6287680101393948485.b4-ty@rivosinc.com>
Date: Tue, 20 Jun 2023 12:27:55 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  Suren Baghdasaryan <surenb@google.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
  Albert Ou <aou@eecs.berkeley.edu>, Jisheng Zhang <jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_123053_967714_D5858357 
X-CRM114-Status: UNSURE (   8.01  )
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


On Wed, 24 May 2023 00:59:42 +0800, Jisheng Zhang wrote:
> Attempt VMA lock-based page fault handling first, and fall back to the
> existing mmap_lock-based handling if that fails.
> 
> A simple running the ebizzy benchmark on Lichee Pi 4A shows that
> PER_VMA_LOCK can improve the ebizzy benchmark by about 32.68%. In
> theory, the more CPUs, the bigger improvement, but I don't have any
> HW platform which has more than 4 CPUs.
> 
> [...]

Applied, thanks!

[1/1] riscv: mm: try VMA lock-based page fault handling first
      https://git.kernel.org/palmer/c/648321fa0d97

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
