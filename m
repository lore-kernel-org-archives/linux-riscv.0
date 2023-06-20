Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FAB9EB64D8
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 17:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=tOd8GeOo5ztwqIz5GJjpcTkw2aLgx0uBiovBPGP/jfM=; b=4+YwnneYs96d9Maq9bxBynmcp5
	5rl0RzP55MEh0WLibuZupEQLhoyO7muCVu+U4AyBj4R/+5uHlOTzcvQY8B4n9tHI9gYgPPRc6AtQA
	k6cayxJlxcmCd3vJIyVvvXpwxiOhH7tIu8kfEBBkuKlCBAbo6Kyl5oMFiWLbvpjiMDPBvXVn1G5cF
	aghHiEd2r5r4PygvKxGq22uWGglVQZmInT9H3b3Dc4wp7+2xse8IWFpYHr57OzjDPGdG0O39BaCxF
	27UvC2tpXBHstBv4ejnp++kK79WEai/7msZVhxbm9OdH6zfrpAO3SEa/ijYGxAGJbuhgPFw9EzAIK
	oA7jO08g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBeiK-00Bsby-1O;
	Tue, 20 Jun 2023 17:00:20 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBeiG-00BsbT-1f
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jun 2023 17:00:18 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-66872d4a141so1509641b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 20 Jun 2023 10:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1687280415; x=1689872415;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QK+YTzQYirL13Os91ZaovYkQTYBm+sE9lgoxCY58ads=;
        b=jlbqn+apNr6F9PTo3mvJqssWrFtPJbIQl9jmkvBjaCv9yVtDiI0KAvHeyRetatf6vV
         F+khgMF6VN4e7go0v9Rtx9aDZ8O6DceoA5SrZdgOyto5gru93jWY/9dzVKCuGy6EFGz6
         Hgnv4uOAd4a8Ze8Wq4NUEUp1XC4b2bjpYvw1WkCx2rFASy/Y5Q6oj/DSOT8gCjpatXs6
         epH1VMaY+wyzrhZGJCjre15E2JhTddDERTAT0clo9GOJDKG8x4S7JQ18KXtn/UTupic/
         C/2ele7/LGT+iv/Kv3dEo3GOVGkU7mD7q4ICs5fYO/zNkTQOdHNZBCNIDbM5R9XXIHKD
         L93w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687280415; x=1689872415;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QK+YTzQYirL13Os91ZaovYkQTYBm+sE9lgoxCY58ads=;
        b=HonTYZI7IZ3NP0Kd4ctt61yEhIgzuiRJR1/sYx8Jdzll5euCyxjwtsZG6et3saKeuK
         gG6vkITchW2bTRgKa2317cVZLiVd1nMqDUf0B0UJ2jMk8tJGhdphxUjItl9eN/+p5xf3
         omM9O8PhaROS3SHouMaGFheFZhehG4mr8iDEQJXo39r0OSbPMNc2taf4ZPd2/T7MvcIM
         Ns/rtawPWvaQmBFc1As/s39NFJO8vr2WLnncjz/rZx5J0btF2z5QrzIww/hLhS1CYH8x
         iAJtMOGeRAaTDSTWQIzQZP8cHrboArEUUa1Y5WB2wTf0mAxggee9RR1T86V9ewDmp4gG
         v9pA==
X-Gm-Message-State: AC+VfDyWg5a2yPr5G0lF18uOMgq/Ctsi252bzs+pGvJ/2qigikx7kqG/
	q0n26q9jkRGYLXXFWr0F05kBWg==
X-Google-Smtp-Source: ACHHUZ5YTS2ZtJb6TMHkwov/SWafsEKbx/kSL9Eef8V1L8C+MUfF8AMHNWCY+1vck4/7YVBsS7pDWw==
X-Received: by 2002:a05:6a21:9983:b0:121:bf66:a715 with SMTP id ve3-20020a056a21998300b00121bf66a715mr4753743pzb.45.1687280415224;
        Tue, 20 Jun 2023 10:00:15 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id q25-20020a62ae19000000b00666e17004a4sm557666pff.58.2023.06.20.10.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 10:00:14 -0700 (PDT)
Date: Tue, 20 Jun 2023 10:00:14 -0700 (PDT)
X-Google-Original-Date: Tue, 20 Jun 2023 09:59:33 PDT (-0700)
Subject: Re: [PATCH v2 0/2] dt-bindings: riscv: cpus: switch to unevaluatedProperties: false
In-Reply-To: <20230615-creamer-emu-ade0fa0bdb68@spud>
CC: Conor Dooley <conor@kernel.org>, Conor Dooley <conor.dooley@microchip.com>,
  robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, Paul Walmsley <paul.walmsley@sifive.com>,
  linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-9b234a44-e770-48a9-8a7b-d71a9ed671e7@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_100017_302505_0312C744 
X-CRM114-Status: GOOD (  12.97  )
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

On Thu, 15 Jun 2023 15:50:13 PDT (-0700), Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> Do the various bits needed to drop the additionalProperties: true that
> we currently have in riscv/cpu.yaml, to permit actually enforcing what
> people put in cpus nodes.
>
> Changes in v2:
> - drop patches 2 -> 5, they're now standard in dt-schema
>
> CC: Rob Herring <robh+dt@kernel.org>
> CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> CC: Paul Walmsley <paul.walmsley@sifive.com>
> CC: Palmer Dabbelt <palmer@dabbelt.com>
> CC: linux-riscv@lists.infradead.org
> CC: devicetree@vger.kernel.org
> CC: linux-kernel@vger.kernel.org
>
> Conor Dooley (2):
>   dt-bindings: riscv: cpus: add a ref the common cpu schema
>   dt-bindings: riscv: cpus: switch to unevaluatedProperties: false
>
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

LMK if you wanted me to pick these up?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
