Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BACF4C77B7A
	for <linux-riscv@archiver.kernel.org>; Wed, 31 May 2023 12:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yXlHe5KzsKPnPd3ok+QJHxuXFpiDV+xq6ZbmFl4t+fA=; b=GKU3pt99kwxtCC
	Wyr/hgMJeMHWo5CpC2NuRp3Pnib5gkBFCN6X805gSunjARQNhRuG4QxU9bOH0U0potOhOS6+hoIsw
	7eTVSqHO2BKCviRbZ70z6WKTviOA9FMDyxHVeI4cMuuqpvS2/1OSZ+DvRVew6PLz6W2IZdDGYJBhc
	XHzAxAp0fEmRepao+NGZVwWT0sZERCUIKc4FRldt2WMgh9x26doEtU8Hq/9vyrylUqOzYepWF7qlY
	wtwhqFtus5hKUoPMSlmVL9aTqsMWtfJMQtvK9iEZJmiHPSWuoVCG/1CVT1pFtm/gp+jI/MKSSL5gG
	ofKNvBMmK46ip2H6jawg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4Kqh-00HLkB-1e;
	Wed, 31 May 2023 12:22:43 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4Kqe-00HLig-1o;
	Wed, 31 May 2023 12:22:41 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-64d1e96c082so3879738b3a.1;
        Wed, 31 May 2023 05:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685535758; x=1688127758;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rN0bnH3gWYzBfmgMkHbIKEWC6DN7mRYY+LRbQfT+m8w=;
        b=HTmJDBodHXoupmovdSQqrWH23609whCbniyvjQt/8cgNZWj+AlndJgjNV6pZBTyCxS
         2HyCOEDkKDu5nXHoCF4XjKHHmk/JHP7mF2z/A3rJEHiAPchIBimoWPiGVb1yopKhJmsS
         GZV1NI8i317BxhnBWxKbjAJAHhRT0KseBRpMqDmQPfd4dKFWUqt8HCRI26SK8+KqvF/D
         sSExthJZjnn28lF73gjBhLDoV/FFpZy3dl8RJpP9l9PvqRqNGZ73lrGg1q5GO5+FOVNf
         sw0Pe5GEmU04pYQkSlG1h1L1euolw/rJV9oY842wSYllKxfZm1c/K2BXV1nKjEa/uGzj
         UHfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685535758; x=1688127758;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rN0bnH3gWYzBfmgMkHbIKEWC6DN7mRYY+LRbQfT+m8w=;
        b=V70xGWJVrMVloaj+z7WVgAEEBRaeJBAdW7qfKzKFFO9ZYHuLtiXFCjLOOuoXUzh/ss
         Lv2oDp4Sr4u/dK4uwP/pgHFVtVGaogSPXet6Gu+FqQmUvGshYnUcLWzpzZoRXoY9jLPg
         dFc/6G2/kOdiTrUy92CYH7YFaMGodfGw7Xk6kTX6VOwcoLGH0Np75DkQWimYnN8vhQQm
         Rl2vQ+s5dU0qSZkaW9IxngKS8QE4xAJYB5Oe9Ev0Gr2YjAHvNgmAUjNR0qgGmOeJglzX
         S0gM4JgiMXbXTttHFuS/2+OD7kV30M5CaU7dN8hHBSMCzlxip8veOd3KyP3Ae72PSxun
         DNXg==
X-Gm-Message-State: AC+VfDyMl+hMGvkbvyQR58jPfQ9QwPaGUN34PVaKeUTntE6XFU+2mj0t
	aNKQ6dNmm63o4JBHtKgbd/k=
X-Google-Smtp-Source: ACHHUZ7DfzLyM4oLMoKb5ptpGN1Rb4GOgWflTWWpLh7DmpnJMvRse3nfgP4G+6QmIdG3Jfb/v9UIAA==
X-Received: by 2002:a05:6a20:144d:b0:111:2f20:d48f with SMTP id a13-20020a056a20144d00b001112f20d48fmr5327442pzi.53.1685535758400;
        Wed, 31 May 2023 05:22:38 -0700 (PDT)
Received: from [192.168.43.80] (subs03-180-214-233-69.three.co.id. [180.214.233.69])
        by smtp.gmail.com with ESMTPSA id g2-20020a62e302000000b0064f39c6474fsm3261813pfh.56.2023.05.31.05.22.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 05:22:37 -0700 (PDT)
Message-ID: <d07c5c29-e5ff-9469-80c7-c6ad54734e6c@gmail.com>
Date: Wed, 31 May 2023 19:22:30 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] Documentation/process: add soc maintainer handbook
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Conor Dooley <conor.dooley@microchip.com>, soc@kernel.org
Cc: conor@kernel.org, corbet@lwn.net, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, olof@lixom.net, palmer@dabbelt.com,
 robh+dt@kernel.org, arnd@arndb.de
References: <20230530-multiple-whooping-ee5706fceb67@wendy>
 <ZHbpb98Yn7SDZ4XZ@debian.me>
 <ed4c3564-4083-5568-f999-cfd7f02544a7@linaro.org>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <ed4c3564-4083-5568-f999-cfd7f02544a7@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_052240_605881_0536A53B 
X-CRM114-Status: UNSURE (   7.45  )
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

On 5/31/23 13:51, Krzysztof Kozlowski wrote:
>> Sounds like passing `make dtbs` is a merging requirement.
> 
> And why shouldn't be?
> 

I don't have anything more to say here...

-- 
An old man doll... just what I always wanted! - Clara


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
