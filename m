Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12FA5C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Nov 2021 10:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8UHw11/SVyI5i/3M19lc/M9pPc5StfMcgUBR9mzuimU=; b=WlPTkyH12a76Vb
	BN1/W1HP/BbWXQ5NuNHuQ1XBDXdho6/RLcZ5pTL+4Q4tQ6GNf6waujjnJuhMbyOCkvmgeHtKeCcIA
	AEjSOMvdoYf9uxp7UeKwMKyHV48Dlc+DQGfUI70T9p4MyjAdDe2NCj2Z7AWmvrX/PYIdMw/cQhMNn
	oqYkdPNsuWIcqfTLukYUTtCOmD442pcHv2Wv+V7oJQdalY1QXj+hC2r5uDVHk0ck3l5iL7STtKLs9
	fqzDRO0KG4+CNucNGSgFU+9hq5uWacHpLV+WdEMe5Ll2znBLg9R2iqdCstjbPKnRVzdAs7ywHi5rM
	3emM9BWvrkLuykUO1QDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqYbh-00A31y-D2; Fri, 26 Nov 2021 10:37:29 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqYbd-00A302-KU; Fri, 26 Nov 2021 10:37:27 +0000
Received: by mail-ed1-x52c.google.com with SMTP id t5so37227998edd.0;
 Fri, 26 Nov 2021 02:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IDuj4Ybus9S1ZZvYWlz66pjIeLN9AKktO+rSjYLBt6c=;
 b=g9SLNuAZOKnmi8tC9+mx+w9DhF+UMgqe3ELBocN1zNAMHC0XypdxLQP9CADP0sGnkv
 QatU4zywHoaht5+mVhry3Zru3gRXROOjLi86agdwR+C/Bj7AylfBkdqjrCFh5THF/+eX
 2qIWFXyMGJy0IyKG9UCLWGVSdhFDaI18QfMvcSGr2yIupicxppPeyBGscYMJcMdUKCcO
 7c/VvCBc97f7YoLxmviUFJgD+OOgmAE8Qhukg2LyXk/tiYCsBujCXgp8lstTYlJ0aAv6
 BL2Alb3hcjNranAciG7kZnXtrgFNcUYYklwfpvaZZ1L9Vaknjpy7uuz4I2JsU0WojSBj
 mQzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IDuj4Ybus9S1ZZvYWlz66pjIeLN9AKktO+rSjYLBt6c=;
 b=QxPZcnLqbmJHJMQejiwc4mWor18+W9P22+8C4VS7gIbOr5/qTUZGeUHDG+yh26eEuG
 obtRGUjMLv45wz4rkBG+qftTZC6c2sp4pG0g3NhyMJS+BnhPrK7AWI54C2menmQWQ+Fo
 eFuCfCm9SV+nJkmCz1hf3VBwnJVLtSPKwxeITX6BVynGhPoxDtbojJTKR67pQe/NI2eg
 e3zE7EmxVJ/UPYBjZ5hYpM+7ReFJcmw5zEoG44DyXiUf2COpBX7tE6/lildKqOzw1n5z
 woImOH/6taZTwCBRogRm2wnrTob86jqpMIs1w0paAkvglA+6VocvYTpL3epU2n3wQPf7
 F5JA==
X-Gm-Message-State: AOAM533pf9nkjByaRA7dJrWNlF+8PoT5k5X4s2UMYzMA2zSkk2sw3wiH
 bThH+WuIg11q+loHGhuzdg2qjT6EB84=
X-Google-Smtp-Source: ABdhPJy5tV7RKW7vxWN3pEvLUsRy2FwyQFL1ogVlzEDy4xHOGn6mk/s+lTqkfLzwZ7CzgvR1mVi2Dg==
X-Received: by 2002:a17:907:8a1a:: with SMTP id
 sc26mr38013567ejc.402.1637923041627; 
 Fri, 26 Nov 2021 02:37:21 -0800 (PST)
Received: from ?IPV6:2001:b07:add:ec09:c399:bc87:7b6c:fb2a?
 ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.googlemail.com with ESMTPSA id z1sm3513696edq.54.2021.11.26.02.37.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Nov 2021 02:37:21 -0800 (PST)
Message-ID: <68b849b6-1e97-996d-785e-43ad86641a82@redhat.com>
Date: Fri, 26 Nov 2021 11:37:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [GIT PULL] KVM/riscv fixes for 5.16, take #1
Content-Language: en-US
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, 
 KVM General <kvm@vger.kernel.org>, kvm-riscv@lists.infradead.org,
 linux-riscv <linux-riscv@lists.infradead.org>
References: <CAAhSdy0CZiBSdGaVrDWEeWe7PUXKpE4RLiYeCaEO2QTN3mT83g@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAAhSdy0CZiBSdGaVrDWEeWe7PUXKpE4RLiYeCaEO2QTN3mT83g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_023725_705030_7928C4E8 
X-CRM114-Status: UNSURE (   5.09  )
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

On 11/22/21 06:29, Anup Patel wrote:
>    https://github.com/kvm-riscv/linux.git  tags/kvm-riscv-fixes-5.16-1

Pulled, thanks.

Paolo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
