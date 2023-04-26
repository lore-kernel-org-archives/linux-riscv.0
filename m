Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98517C77B78
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Apr 2023 16:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iOcwIZ9/LS6JIkaG+at7ABXupfoX2A03IuuKieGqrDs=; b=c+1ITLwLoWsuqL
	7PyEwN5n4HWITQNeeaKYScZ1k2jO0nwtLDEYyCXJu20obsEgPiaJ4p4T0HRyddHkTnLQch5xvGyI/
	2hLxeG10/XfVnBrzfFS3Ckm4dXbR7Qw4R9NptOV5aMb8o5cArhg9csNy9C4zzSOWP/BcdsjBmSQjK
	ycBd7HJhHHC1DzQjl7PqNKtZMOr9d8ZhtPfdGaK8wG8CNRvuYThAb9wlOLM5lTOUWXhf8ZTdLFvuq
	E/npDZ+g0kiqZ198wFB9Zcas/vtaZemhSgqrseWyfG29N46ubL9bGt4VLX5z2UcnXQ8f9pdIi+61p
	XnDKSzkC76wPRQlgQvMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1priHN-004R0p-0t;
	Wed, 26 Apr 2023 16:46:05 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1priHK-004Qz4-0C
	for linux-riscv@lists.infradead.org;
	Wed, 26 Apr 2023 16:46:03 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1a67bcde3a7so77315135ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 26 Apr 2023 09:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1682527559; x=1685119559;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s7Bv+O5tO0UWADIncf6jC+cttFrlLtbnEM+WpKykvX8=;
        b=2a5id7S4hDjmTM6Zx4x8GRueDdjVqm8XA/Vd5oPkwoK9q0TO/BbzaDoWRIPOL+V2Wu
         em57wxPz68pl+oaByR8GTbfmbQC8xx+sDDQ4uR9REfWo5HA2TIoof7Ebk0/TEMUQ7CfN
         /CznOxyIO545Xrz9KkCPtwH2KGxkiZoTRCSfzJYCn9cZnIcFK36jmogj4y7h/4wK9qun
         3QBb7ik8lJDwkb3NOI5beYWhm6cgy8YcUwmDPbtNM1BB3/UUcT44Vqc3VMv7aTAldun9
         mH17eoWiD9h9Qj0uoqQcBbPnTFdSTUeudiqMMfeoPzf4h+LRpM0FfGg0FiaEstK7HI28
         6bPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682527559; x=1685119559;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s7Bv+O5tO0UWADIncf6jC+cttFrlLtbnEM+WpKykvX8=;
        b=ftCjFKGNl7sKK+8F6Awwj+iItvGEX7DgLKl6bZVW1Bx6Gv/LJfR6oa9b8N7E1QEIE0
         YiQo3gZXtsDjTzEttEjPpphE7Iyumxaz+OVX8niGjL9kVkSOOVK3bCyHqpJhVWqnyrGe
         TIyJ1jobJO/8AnfuSi18+dAgUWsSy89ZzPX3nhSo+sXKHlKUSkd+tuMGAQz2GC3rOeeT
         wAWEz5yE+MRtgmeBiTKvebgteP8mYO3mSBEHLJrkjcEowaa1Bpjal1esOlqs4jYYm3UB
         w7htx37SRJq8t86H+ATX965pJRLuA73k6XR2BVyXD8M5SaMdzkT6PledxuocFWLaQAio
         h5AA==
X-Gm-Message-State: AC+VfDzOeUiT0T6JpAnL0c+f+cQpuZsvGBx1pSxcQN25KfErMsJ6JraI
	bWsLYYGDh/Sz+lrfhEoDZYgXuA==
X-Google-Smtp-Source: ACHHUZ6rQnRxu7u+xAxKAqHxxZZToYD7j7FpYzF8Y1dsgvXLjIexspJZwkaG8a4LvjlEJQmVxXK9Dg==
X-Received: by 2002:a17:902:d2c2:b0:1a9:a408:a502 with SMTP id n2-20020a170902d2c200b001a9a408a502mr2677382plc.1.1682527559127;
        Wed, 26 Apr 2023 09:45:59 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id w8-20020a1709027b8800b001a661000398sm10111610pll.103.2023.04.26.09.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 09:45:58 -0700 (PDT)
In-Reply-To: <20230426141333.10063-1-ajones@ventanamicro.com>
References: <20230426141333.10063-1-ajones@ventanamicro.com>
Subject: Re: [PATCH 0/2] RISC-V: hwprobe: Couple fixes found on late review
Message-Id: <168252754320.30456.6252130224199912856.b4-ty@rivosinc.com>
Date: Wed, 26 Apr 2023 09:45:43 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
  Albert Ou <aou@eecs.berkeley.edu>, Evan Green <evan@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_094602_100338_F2CE1DBE 
X-CRM114-Status: UNSURE (   8.45  )
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


On Wed, 26 Apr 2023 16:13:31 +0200, Andrew Jones wrote:
> I didn't get a chance to take a close look at "[PATCH v6 0/6] RISC-V
> Hardware Probing User Interface" until now. I spotted a couple issues
> while looking and this series collects the fixes.
> 
> Andrew Jones (2):
>   RISC-V: hwprobe: There can only be one first
>   RISC-V: hwprobe: Explicity check for -1 in vdso init
> 
> [...]

Applied, thanks!

[1/2] RISC-V: hwprobe: There can only be one first
      https://git.kernel.org/palmer/c/08dc10759468
[2/2] RISC-V: hwprobe: Explicity check for -1 in vdso init
      https://git.kernel.org/palmer/c/b09313dd2e72

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
