Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 314FEC8302D
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jun 2025 10:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DzK6IgGOBfXyLucW1Eg8pTkA59wNMeErPMSwcBGjk28=; b=zcw32XpLHmvVUv
	14giLOthJyFHJwJFF8+prPEQD0Hn/eP+ldsl9yhwVzJpX5MHvo9ndSZVRA+TmNN1otdjQNQ2W9DvA
	QWkMde75iPCN0Rfvq1D7Y7mpDcFS6O7FFD0CYKMBnXtoF2CMCPxrdb4n+wdz3eQk5iDpxg/ZkRSko
	LHlmO6dAqV+dgXo37DAxVAaj1/dQS2FZxuUo30TZ0lTLP/jDRciM/E9yGm1gsM8eDitJ5ASGhyXeq
	P7+0RZszJE2p3jQ4MfM344Zq5tSfVNb1d64zT1DwL5AJFl/wY0hvvYqeHysvB/HAEbDGM5DEp95go
	WkUWe0c/VhvT0gXUigPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWBO8-00000001pVP-34xt;
	Mon, 30 Jun 2025 10:05:24 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWBE9-00000001o71-1Ann
	for linux-riscv@lists.infradead.org;
	Mon, 30 Jun 2025 09:55:06 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5561c20e2d5so215053e87.0
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jun 2025 02:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cryptogams.org; s=gmail; t=1751277303; x=1751882103; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LfQy8ADCiBLlHkAJSuBLrY0Q7GgPSdM7/euzAA8eQg8=;
        b=PIhlCtCQ+7HttrajritgW4oPQqFwQJYykJbRA/mjryOiTUhz+QqpglChxIZHnGicMG
         WC7jhTaIWgqchOaIU2eyEyAVQPEsV+EQHMKDJTB8Q8NS9CDZHFZ1dZfEsqDEqGdcqERL
         AS4bpGvdyUFn5HiQPBQ+cSy3myCFqADRoLbqpV+oLNWMneUvLtVBWgWDIBb1onvbex3v
         3+LBmZHj5J3oHq0Y06mc9OxbOTlB42v61PWPOYZth262xXZTfZ9VVFrViIKYD13V3WWh
         m730wc5P514JcxC8ikKIN9usAtPIeRFsUfMr7AUdzZ3Ya0XXy3ZkLIXX0eg+YfTD6gWV
         /eVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751277303; x=1751882103;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LfQy8ADCiBLlHkAJSuBLrY0Q7GgPSdM7/euzAA8eQg8=;
        b=MDCVX/XUgN5l9e6yd09KnS9posdkBkcvsjYq1yM4jbyyAaO2wEpz4CYFwc2Zc/BqKM
         4k1GN5Pz9VQqOwIZhJqMxqFc2VsJg7OWzANZva4AiADEPn5eLHqhEb7B3bSkFyAbzQ73
         iQyy6vAO84+V5YFotXLSzRI8vzLMa/0JAX/dkjTNRIKUG0ajAE0u0L/iOpJQYg4vx5pP
         pxFzeC4xwfq+ThTjsnLu2u/nkDhVg359tBpKZp7ZxsFLBxcfRVvhxShNN43EvGAzNCTS
         PwzU+KOC/jFS7DSPxb8SYp2l5LR/Lh7EPSpW47ImrD+/9+5rgAA9oC9ngOrDuVI4eGav
         QsyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUah/YLGk/n3bL25uGZ54Tuq6UA1Ow9kpX3vbWfICaSnL9RhcoY2Nw6v4JrFTOhsnrQowPSNWGUKdYtYw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1ja/IBvXO65SujW1ERqySNcoRqKBpCTgDXlOYHEEuFR8L9fsd
	ESAy/wrNDfTp/ClgtVlYu1tgijOZLOY8Eip5z/Me6GfWgGrBLStkdyTb5owpHZI2bH4=
X-Gm-Gg: ASbGnct/YoHMtUL27xOa8SbhtJLewmRiHrZouU6QpmShcjQeoOJINFJ21b1EFkC9QDL
	JgvRfZd8XDyQWyue9uaKf+0EjJOuOCcJhc51W87Dxaf0khbaeYNkfJ+PqJyXw2Ce9jwDMhMIXZI
	b18R7swjclXWHOpYjtG+aQxawUsGWngy6RlsTxgvLJu1emVi11Mub1TfswBE5x49lEcl4BgThcu
	uBI+JGRZUQsU+cLFrivzWv0NcWBjx4FS/93KO7NG03gQffmd6kmsRypwmLr4n1Tk0qqOG77zJX0
	RjFeBtcM8up1NSZwTKclakmsGl5fQ/NTgubdayZa4ucz+yHclqCicP57M6uZbGK6tR3hLaA/lou
	GBzwkzaq6lOA/s4iOY5HQnN3BnXwS+A==
X-Google-Smtp-Source: AGHT+IGPZA425rUTyu65BDLRuYis8nH5rdwyfHes60yjnoP9ss0FZbb0z/p5yM8y5tYGOxjb92a6GQ==
X-Received: by 2002:a05:6512:3503:b0:553:241a:b93a with SMTP id 2adb3069b0e04-5550b89f457mr4656463e87.31.1751277303047;
        Mon, 30 Jun 2025 02:55:03 -0700 (PDT)
Received: from [10.0.1.129] (c-92-32-242-43.bbcust.telenor.se. [92.32.242.43])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32cd2deacd9sm12834901fa.11.2025.06.30.02.55.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 02:55:02 -0700 (PDT)
Message-ID: <f4fc05a3-e6b3-4951-bbb6-370d3e2e68d0@cryptogams.org>
Date: Mon, 30 Jun 2025 11:55:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] crypto: riscv/poly1305 - import OpenSSL/CRYPTOGAMS
 implementation
To: Eric Biggers <ebiggers@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>
Cc: Zhihang Shao <zhihang.shao.iscas@gmail.com>,
 linux-crypto@vger.kernel.org, linux-riscv@lists.infradead.org,
 herbert@gondor.apana.org.au, paul.walmsley@sifive.com, alex@ghiti.fr,
 zhang.lyra@gmail.com
References: <20250611033150.396172-2-zhihang.shao.iscas@gmail.com>
 <20250624035057.GD7127@sol>
 <48de9a74-58e8-49c2-8d8a-fa9c71bf0092@cryptogams.org>
 <20250625035446.GC8962@sol>
 <CABCJKudbdWThfL71L-ccCpCeVZBW7Yhf3JXo9FvaPboRVaXOyg@mail.gmail.com>
 <fa13aa9c-fd72-4aa3-98bc-becaf68a5469@cryptogams.org>
 <CABCJKucHNWz6J9vvDvKh_Je8eQTJO_1r0f6jsDTsDmfaxdBygg@mail.gmail.com>
 <20250627215151.GA1194754@google.com>
Content-Language: en-US
From: Andy Polyakov <appro@cryptogams.org>
In-Reply-To: <20250627215151.GA1194754@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_025505_332442_0049E2E1 
X-CRM114-Status: UNSURE (   7.19  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

>>> Would it be sufficient to #include <linux/cfi_types.h>?
>>
>> Yes, but this requires the function to be indirectly called, because
>> with CFI_CLANG the compiler only emits CFI type information for
>> functions that are address-taken in C. If, like Eric suggested, these
>> functions are not currently indirectly called, I would simply leave
>> out the lpad instructions for kernel builds and worry about
>> kernel-mode CFI annotations when they're actually needed:
>>
>> # if defined(__riscv_zicfilp) && !defined(__KERNEL__)
>>          lpad    0
>> # endif
> 
> These functions aren't indirectly called, and I'm intending to keep it that way.

In which case lpad will be executed as nops. Anyway, does 
https://github.com/dot-asm/cryptogams/commit/e6ae2202268d995e78fa5d137dde992bdff1b8e8 
look all right?

Cheers.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
