Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C6B2C0015E
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Jun 2023 23:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z0WGTgG1UUe8GcdDNMmyflCBCu7henvbwgZyP/m3q2A=; b=LBssMUtHd6MQ0f
	B6YgGrMCrOtiDKuDeJdB+bygRmvpVLyO4wfDHaU6SQA1C+Qzdfi/jINtuhhYM6QnM3q7MuQdk0/Bj
	LFGucIOFWcvKzvYaRoYn3o0LUGuAWsbKW6DOld/lCQQmO7HfXJi39I40MDAgVM/YJMLudW8lG0Dt4
	Tk0p2VW5DqEn4Rvm/GuhTDNC7wjtaKcVIxZChFfyTGH0Okr94q4CphdB4a2wnnQufpgmxLkgYPVHy
	zRn2SCeEKxyrPdv1b1f2/nX4M1gXCxfx+IdC/7v7sY2FxjDeylQDkw5/4qZbuoDfZ+rTfUe04+3vU
	BJHA5CiDux8MO5eT7upg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDZ0j-008u0t-1N;
	Sun, 25 Jun 2023 23:19:13 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDZ0O-008ttR-0C
	for linux-riscv@lists.infradead.org;
	Sun, 25 Jun 2023 23:18:53 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-544c0d768b9so2332973a12.0
        for <linux-riscv@lists.infradead.org>; Sun, 25 Jun 2023 16:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687735130; x=1690327130;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PMyidyx6c8j5MqA0hxypdhWidgaRdQYvwuhrsrEdDAU=;
        b=r1Kkob3K7eMRLpiJCBwt7BrIxDGHwLTSuYUVmbjdbsOi8X9tHT0HbkkGfxV3slmG8l
         EzwED/43arOsSoKB9nj4ESxua/Hbje/cjt5LMkLfWp46F53MUwdwbUJdyOWoDddl5478
         e727q3+cEBjKr0bUQ6/6hGDj4i9Prr3xElgEnq7TIGwWdwG6bQxv5uIecVqw9X9eBzzg
         7Zn56LTIEJ4brd+tSYnMn0r3au4gw+mPdgZVMN84x0b0bmmzd2MfN8sJNTn0SScdytLc
         LzfofWl5kLWv/pC18bq3c1nnfmK3aJp94VGDjlAYcKH8euJ6CAhdzjTICMV53FZ9OVfh
         KoLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687735130; x=1690327130;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PMyidyx6c8j5MqA0hxypdhWidgaRdQYvwuhrsrEdDAU=;
        b=DRO6p19NzTCtAC5147g1iZtQBXLI2v7c0LaJE0zmu5OSwcqKnon4byRd5KYTDfftad
         Sr16ifgnkjU4U7Lx6p8jfIbdP/Kb/t6PgQo/zw+yyLW8f6mP2L7X9FINJvgY9eiIZMTl
         oxz+RXQxJj+89sFsDbDf2vfjcQ4/k+LCil0GS9GbX3kvjbOS8EF6c7ENzcaaPgZCe8K3
         Bm1CZl0ttqVz8NbfG2JVyRx3alqW+lH9nvNkEdTyTx+Yqlypuk1LJQeO0t+igObpJ1Vd
         bZKIlMuRxRUyo0rgU8ZRfZbs+4OMa7WHFkvBTd0mq6FEXoRSknmJYovqqw4IkzxRIaqE
         kCrg==
X-Gm-Message-State: AC+VfDybueL3UV5MWJEFS/QgK2vrzU8ODlh8Ck+791p3O4lJsKtAXfj8
	kWVN8EgPheCjm7LVce5gQmKZ6Q==
X-Google-Smtp-Source: ACHHUZ7chlK+14uMjyxEuWPh5cyB+olLpZYJstcYOjERPpCE49wWN2rz8PEjV9wVJ6+bT43Q5ElOog==
X-Received: by 2002:a17:902:da8c:b0:1af:981b:eeff with SMTP id j12-20020a170902da8c00b001af981beeffmr6581208plx.64.1687735130591;
        Sun, 25 Jun 2023 16:18:50 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id y6-20020a1709029b8600b001b682336f66sm2873895plp.55.2023.06.25.16.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 16:18:50 -0700 (PDT)
In-Reply-To: <20230615-creamer-emu-ade0fa0bdb68@spud>
References: <20230615-creamer-emu-ade0fa0bdb68@spud>
Subject: Re: [PATCH v2 0/2] dt-bindings: riscv: cpus: switch to
 unevaluatedProperties: false
Message-Id: <168773507362.1389.2217273473354305328.b4-ty@rivosinc.com>
Date: Sun, 25 Jun 2023 16:17:53 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
Cc: Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh+dt@kernel.org>,
  Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
  devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230625_161852_099794_427DB030 
X-CRM114-Status: UNSURE (   8.79  )
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


On Thu, 15 Jun 2023 23:50:13 +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Do the various bits needed to drop the additionalProperties: true that
> we currently have in riscv/cpu.yaml, to permit actually enforcing what
> people put in cpus nodes.
> 
> Changes in v2:
> - drop patches 2 -> 5, they're now standard in dt-schema
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: riscv: cpus: add a ref the common cpu schema
      https://git.kernel.org/palmer/c/3c1b4758a954
[2/2] dt-bindings: riscv: cpus: switch to unevaluatedProperties: false
      https://git.kernel.org/palmer/c/1ffe6ddc5c64

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
