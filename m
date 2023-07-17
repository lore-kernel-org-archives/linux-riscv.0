Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32A56EB64DC
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jul 2023 07:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hxCEtNTyf/szC75HNEI9UgwGz5Sudmxvx51LqjlUadw=; b=2HrzQMcS9mpP+f
	essLfjeigzd5TxOb1AMQZqTRwS5mTMHju7VvvbbwJvogLDdBoW1EE9irzx9XfAOiyLzldi2Hd7tZb
	pZjKyjJyuHeBTuEhuVTMdBwWpHzl1tUFlT6VsAsPEOKhU+QYdYaPM/t+zeqsaICGmNGUHTpfjHXdN
	dHOaLmIJu6TgFrZruPJEBqJCakHjUmSfyV6yHmE9/JTq1fVNg0a+97THrJvLUecL5to7AXheEV2Wm
	KdGBKVLmJU2r0ziHiDvxW1frcPQvhdloYFl1Pd4Qos0R9ZRws+7A8k11TwEubjf8C5YDlX6q43kl/
	WjNVdWCceRkv9WayNReg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLJ1C-003Mfn-06;
	Mon, 17 Jul 2023 07:51:42 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLJ17-003Mcz-21
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jul 2023 07:51:39 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-9922d6f003cso595127366b.0
        for <linux-riscv@lists.infradead.org>; Mon, 17 Jul 2023 00:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689580294; x=1692172294;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uvg71QsN0uCFu9CbEe1Sgbll38wTsgcP92il4EjQ13Q=;
        b=afUDFnWslzRUMlvGsAyM5A/z8Bgtlq808C4XiCAFTBhDVGlcc1DArSGKnmTN18sx3r
         VdlQb7AHdvUMrbi/Uwwk0d1yLXJRa6NbD4LK0CW/kuR64GlgSMBp635g69iIEFyAza8r
         5TihJlZ37HbgiCIToe5/KsXb8leVQ5cvE1LPhPLYVSmL6aHHykf2G5sMW/hhyBf369d6
         gZzA4Q3O8kl3EWM7Shkp+smySIQDaWIdP6qWFbjMvOEiAblXtD0MTc++C7Cl7xs2EMsn
         2fUIRUfXW7fWLePSK3kWZ+8NTVP3nh+epbxz8zqqRV21SdlZfgKNF9mU0gFU6ahbmcAH
         4P8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689580294; x=1692172294;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uvg71QsN0uCFu9CbEe1Sgbll38wTsgcP92il4EjQ13Q=;
        b=Vebx5y+PxEiGaqOB4Ebot591pS95mS1lXQK54cKT707j/suLN6KBeDZKSO/PnWenGe
         L81rC19k5Dz84AgIBhlvjvZRfvTGCkQ1vrTkMjVI+QxbPUcgDNFk6S4Pj07mdA3qAPVd
         jbESYZEoGXY5NHIlpFIdBtkzywf6cWWavipZlMuTdWa/0k5G3BWsUvFprX9OKbi5Hqx9
         TksxFt3R5Y95P4cJlfZL5Jx7kEP6hc4mQnp0+QXzGf4yUxoMrGodG6T+A48yEyMKpa/j
         qba59Rd4q7mK+bx0Uy5fSJzMoCpfkcycvhF8GKUdLpQZltUop8ymIOk0nXfrzdZTvD5T
         N0Sw==
X-Gm-Message-State: ABy/qLb6WrZNQ+o9rBRCAZVYFIBk1hS8VfSAFB5WuYjPbaUoNvzSdMB/
	6sQxwbD12M2cVf6W8+71cvtejw==
X-Google-Smtp-Source: APBJJlHmmTlSB2Ghvbk6jeJZtE3VwyqV0OVfQcEjYy7JfCuFCYa6mTUTHJIFKKAjd+BkT2SKHTXiaQ==
X-Received: by 2002:a17:906:2096:b0:992:630f:98b6 with SMTP id 22-20020a170906209600b00992630f98b6mr10600981ejq.37.1689580294094;
        Mon, 17 Jul 2023 00:51:34 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id u11-20020a1709063b8b00b0098e4aef0791sm8863674ejf.66.2023.07.17.00.51.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jul 2023 00:51:33 -0700 (PDT)
Message-ID: <4963b85c-c0ff-92a1-e5d6-ca76f1882f93@linaro.org>
Date: Mon, 17 Jul 2023 09:51:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/3] Documentation/process: maintainer-soc: add clean
 platforms profile
Content-Language: en-US
To: dsterba@suse.cz
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alim Akhtar <alim.akhtar@samsung.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Nishanth Menon <nm@ti.com>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20230714084725.27847-1-krzysztof.kozlowski@linaro.org>
 <20230714084725.27847-2-krzysztof.kozlowski@linaro.org>
 <20230714135914.GI20457@twin.jikos.cz>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230714135914.GI20457@twin.jikos.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_005137_729335_D25A95A0 
X-CRM114-Status: GOOD (  11.01  )
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

On 14/07/2023 15:59, David Sterba wrote:
> On Fri, Jul 14, 2023 at 10:47:24AM +0200, Krzysztof Kozlowski wrote:
>> +Overview
>> +--------
>> +
>> +SoC platforms or subarchitectures follow all the rules from
>> +Documentation/process/maintainer-soc.rst.  However platforms referencing this
> 
> Just a drive by comment, references to highly relevant documents should
> be clickable, so :doc:`Documentation/process/maintainer-soc` , with
> exceptions like if the document has been referenced already.

Is it needed though? The link is anyway detected by sphinx.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
