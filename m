Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E0BAD132D0
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Nov 2024 14:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	Cc:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TFZGUu2M2cOhLk9CIeKWUW3COzEChdpqq5XA2vKdGfc=; b=oWZtaVQvDzG5nt
	w3jpQAh44sE5PTQz7FsvKJCD2qPjpw4Mh9cwXYDUhtrXurx7J3Sdayvm4vKoHAlbv6klHqP5wjx1F
	LMxeJyK9j0mSp5ScG+pWt8idvkSGOthISY9HQwyeELllv+VxzLCdFhm0WxrIVl6t1PgbEG8+Vkpwr
	Boqb3iOY2KhZULBc83/LLNweprVqu/IK/YfTd6cxI95YY2hFu5Rn5Ou9J5KG1/0uxtevHehKInySw
	d9ihRW9LpIgPG5IxK5U/GeUKLw9HlxvSd/TVpJyELV88lpYB6aCxX9CZ9it+TLMbm+Bxfwz2HT6Ng
	CgtiW0a1dEbg7Yb7K/bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7xsI-0000000E0rH-2WaK;
	Mon, 04 Nov 2024 14:16:10 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7wiR-0000000Dm4e-1Mde
	for linux-riscv@lists.infradead.org;
	Mon, 04 Nov 2024 13:01:56 +0000
Received: by mail-pl1-x644.google.com with SMTP id d9443c01a7336-2114214c63eso9458925ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 04 Nov 2024 05:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730725314; x=1731330114; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y5vDGuAIRKGG7+0YjIAG/Iu7B9p1N90ZoOHqeFvhx2k=;
        b=MbgAOaJJNJqEPkp/TseIrFxRi0Otujs26ECtxXJylnLLl6ecyO/892ckYeXJXDXY3X
         qg8Pr+fXJxmBNqkoumhIfu3vjZSa7FG2XdWCY7t5zyiHNzwVFGJ2LsTy50dOq6RcCMqH
         z+Yilg31ebpKiusiUM8BbDThhITnkK9rmYcR1S0dCkUU7MeP77AVgUw149QEcs8o9yNE
         7kgRPLwv850159rG/LgpvUjrs2ODmFoHtlsa858jugCBJiR/QT1ws/lAaZMfbuxI7I3s
         mwEKzX0ZcixOpKCj98AVdXI7fypFJ3PQeDDEUdgP0okWGXItjz9cNCWvikOf+06xAPqT
         p3ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730725314; x=1731330114;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y5vDGuAIRKGG7+0YjIAG/Iu7B9p1N90ZoOHqeFvhx2k=;
        b=RO2GhG83pyPjnfExt3Uj7v9TfYl7KqyPMo60f5JPEAUhTeuA56qfznDDg05FykQGKz
         Jcm1Vy9G5EwYnZfP5UCHfbxu043rgHP8GJLsIbeKrXsWQNUDBHuAxH9pSkJvu52XbYUg
         pL4MJI23pT3LAkqvTfGTuscZtkATMOnCOfk3W73tShPjYA+rKcyGrYv+SX8X1+K6Y/D8
         HQ/F3pA3PnCoYhB/8QEUx0Gm3ndm3j6YBO8mhu/FHBZXUD02Wc7jI348rDK+vXB0CnVm
         GcK1I0cuFE376CvcMR82leYoSN7loWN4fygKpyJCvAYgu6MNrjAifziPHOdmCjGyxHXE
         7Eng==
X-Forwarded-Encrypted: i=1; AJvYcCUiISmBXdr7xLVXWQl1mLL9jwyekWBB8+zu/fZtIqf5LPU7ObjSV2QqZCq0WrDa8MdaAQLuP3fd5auc7g==@lists.infradead.org
X-Gm-Message-State: AOJu0YztSIn94v+WFUzPjLk7dEuf6tf9Q+uq/WxFBdKRP4EmOvqrrr33
	nrVDE389SKLvxplkKN63Ia6PZINOmhVHE2Hz2Fof10+Vfe1v7/0sFxDE6qzyYxO0V29Nqh0=
X-Google-Smtp-Source: AGHT+IEM0Q3G/62bhXUw0h9w4pdtwquLGh3tZcGwf11n11w13Li3mRc8Taxp/JLIt3CimlmCP4HY8Q==
X-Received: by 2002:a17:903:41d2:b0:20b:7d21:fb8a with SMTP id d9443c01a7336-210c6ce60a9mr370052365ad.61.1730725314268;
        Mon, 04 Nov 2024 05:01:54 -0800 (PST)
Received: from [127.0.0.1] ([2602:f919:106::1b8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057a2bf7sm60238765ad.173.2024.11.04.05.01.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 05:01:53 -0800 (PST)
Message-ID: <ff300296-daea-4113-8597-62f7a5f61d9c@gmail.com>
Date: Mon, 4 Nov 2024 21:01:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: troymitchell988@gmail.com, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/2] i2c: spacemit: add support for SpacemiT K1 SoC
To: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
References: <20241028053220.346283-1-TroyMitchell988@gmail.com>
 <20241028053220.346283-3-TroyMitchell988@gmail.com>
Content-Language: en-US
From: Troy Mitchell <troymitchell988@gmail.com>
In-Reply-To: <20241028053220.346283-3-TroyMitchell988@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_050155_410041_B86B1F21 
X-CRM114-Status: UNSURE (   9.93  )
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


On 2024/10/28 13:32, Troy Mitchell wrote:
> This patch introduces basic I2C support for the SpacemiT K1 SoC,
> utilizing interrupts for transfers.
> 
> The driver has been tested using i2c-tools on a Bananapi-F3 board,
> and basic I2C read/write operations have been confirmed to work.
> 
> Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
> --
Change in V2:
 - Alphabetize Makefile and Kconfig
 - Change `.remove_new` to `.remove` in `struct platform_driver`
 - Change `dev_alert` to `dev_warn_ratelimited` in `spacemit_i2c_bus_reset`
 - Change `spacemit_i2c_read/write_reg` to `read/writel`
 - Change `spacemit_i2c_dt_match` to `spacemit_i2c_of_match`
 - Clean up code flow
 - Fix unnecessary line wraps
 - Move `spacemit_i2c_handle_err` to a suitable location
 - Use `PTR_ERR(i2c->base)` directly as the `dev_err_probe` parameter instead of
   the intermediate variable
-- 
Troy Mitchell

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
