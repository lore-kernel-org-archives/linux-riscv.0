Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F55C83F1A
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Jul 2025 14:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dDDSSpNThbD7BHVVvU1YMpYt08k6f2ygzALwSbWIH8s=; b=rX97N3WxR+4h26
	kL7KdWo/bvO7vkL8WTL6ZStYpFPU+fumV+LEA1ztib2LrYsisVOVrPFQkHK8vnaCRQvDBFI4IRz2t
	dKDhKkJJv9MlpPXoGPQLMGOChMithe97QV4z4iOr0KMY30q0XxndW2b+vaUy3uT3yFlTziz6ApZqd
	kRH/Eon9zrTcdS+6q+6R4sx5qEBpw/Kdnl8dvo4+TrrKaIZXb7lO9qYVFBaw2PyVfvuPQrmtsesFf
	h/7g+I5YS/jXbT3MNiIyI592+q3FWayZENq5TD1ZAvvJ+obcDl6iqB4VmzIR2Sn7NfhPy/Z0Q65l4
	SzAdoAhND593SsNDAquQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueaCv-000000059fT-3CAr;
	Wed, 23 Jul 2025 14:12:33 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueZEn-0000000506Z-3i3j
	for linux-riscv@lists.infradead.org;
	Wed, 23 Jul 2025 13:10:27 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3a51481a598so3561092f8f.3
        for <linux-riscv@lists.infradead.org>; Wed, 23 Jul 2025 06:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1753276224; x=1753881024; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vhBAalWa5gqDwmnSu/rBsFgFjTeJbqxDSovXVqBa20A=;
        b=L5BL9D1ZyuM24o7zfl37zBs6WS797HH5o7PI6HOP2c0oSjxsPk+yzpnnBzb/qZe3ch
         jl3ljKrJ+Sk53ynEmBfCZbWGMNmSajqQdJlNZ2JVsNSZSpWvL+d2R+mbrcqo6uKqpenM
         BnKrpSChbJIWjW4Aay2ubEac63/EZ3U5xlTu6AtIqQe1dmTpRGbLjxY4uM06hxJjYrYP
         igCkmPv0zPZiHFa7ZItFEZ/E2hzvQg0HSod5PopNx0wGhN267Up64/400mlCV+r+omos
         vZtZYnrVJsS2HnaQlDHD0pk+TccPcgxJokYOU2iwjtArbX4aTasiMyrRAlIj7KETzilz
         Z2Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753276224; x=1753881024;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vhBAalWa5gqDwmnSu/rBsFgFjTeJbqxDSovXVqBa20A=;
        b=A/5bzmG8Nqr2TOMizzVsvyDGmm46fbu6wmqsa0ezE2alMl6lBOLD3611745am0J3zY
         Dw2XWZ5iWrJr+M8uHlIVkOS7ENC61oTNjbcHqlr6fYV7s9h+dRwt1ub82fsCjsulPoOf
         RMnMbzgdSppCzyu+X4JNrfEEY4kwZRNKFWckmGWtVTmRXPLH16Hd+6vBc7eBSPBTogpN
         upTsjmeQTWf/gmVutE1oqeye4W3YpqUznF0dH/SHeWRxgJbjV4cAC32/dJ4NfNnW7dOM
         qrc6bm5+aK5C5SiZt1Da+CQXto3hlePvneJZ4ldP3UprjOzqvSarwve/tctH2pu/i02g
         2AEA==
X-Forwarded-Encrypted: i=1; AJvYcCWhwo68lOX76IJx7YHbnjGZ1pxVOoPKHOPShGkqY7dbN8IaDvS7SpCywttV1JwMVEdFctdbHTejquDxlA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxzT+Mx+cNl62dJKw94SZsIaiOvgozX2cPTgTykF5WvYdrGdetF
	4nADc21sTGeLZNWCGFOXsdfdNowgpyW+OoXH+NbXr6Oi82+C0XY7O1RImjPJN3X/V/U=
X-Gm-Gg: ASbGnctqhiScYKVtf+Utwpi3A3cpD3efnQIArs973tbHwknymick7yeGtFquIn1Pouu
	B4NzYh80Jr5r9R5USkxMOZxQH3bBskZnN9KxfrU7IN3v7ZHiT+2CR5rHiudZy5RB81zmLlUXysF
	XE27jcli4aveWm0Aco7BTV3FyK42LBp+riU3BKHtzcnzK9bl1PSqGf6F0Z76BA30KO78TdcxPRu
	FWwiVEWYvnQlyjA9W7hdR9sbS8pekHJZMC3nZP3xptthaeMVg/U7N9N8sbq87Vzsi9pIE7CEEgP
	JgJ0FbC0/EjMrnx22/rO1CuHDyZa/2lYK5b5jtKJifUAWsujGtjQQ5QSYcO0iyqJP4yIvt7GbiH
	wmRejv+Jggwb6XFU0m7QtKth21qiqRq+mqVhwv3b6DYq5PZxkRSphdpB5JpRq2ZXumBL8NPvTYn
	Cqd4C8lFr/91Z4
X-Google-Smtp-Source: AGHT+IHaikAjtXSOK7TzkgieFuqf48w0q0zzAkHwiGU+rMcHAorrKzxT8fl3tGpNBEzEAzrmfTi+OA==
X-Received: by 2002:a05:6000:40da:b0:3a4:eae1:a79f with SMTP id ffacd0b85a97d-3b768ef3c90mr2447676f8f.33.1753276224129;
        Wed, 23 Jul 2025 06:10:24 -0700 (PDT)
Received: from ?IPV6:2a02:1807:2a00:3400:7fcb:5e01:8f11:1009? ([2a02:1807:2a00:3400:7fcb:5e01:8f11:1009])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca5c813sm16511400f8f.84.2025.07.23.06.10.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 06:10:23 -0700 (PDT)
Message-ID: <fd4eba94-50f5-46c9-8675-cc0aaa4601c6@hammernet.be>
Date: Wed, 23 Jul 2025 15:10:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: spacemit: fix resource leak in
 spacemit_ccu_reset_register
To: Yixun Lan <dlan@gentoo.org>
Cc: sboyd@kernel.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250723124020.60897-1-hendrik.hamerlinck@hammernet.be>
 <20250723125416-GYA738759@gentoo>
Content-Language: en-US
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
In-Reply-To: <20250723125416-GYA738759@gentoo>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_061025_926103_A392EDF9 
X-CRM114-Status: UNSURE (   7.39  )
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

Hello Yixun,

Thank you for the review.

On 7/23/25 14:54, Yixun Lan wrote:
>> Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
>> Fixes: 988543522ebd ("clk: spacemit: set up reset auxiliary devices")
> Can you put Fixes tag before SoB? I'd suggest to follow tip tree's docs
>
> https://docs.kernel.org/process/maintainer-tip.html
> 4.2.6. Ordering of commit tags
>
> otherwise, looks good
Thanks for pointing that out. I'll send the corrected version in the v2
and make sure to follow the guidelines in the future.
>
> Reviewed-by: Yixun Lan <dlan@gentoo.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
