Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1619AEE6427
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 07:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bJ7T07cvA29NqMvJun/JHyn8zWKTiIrUmK+xLUePYzE=; b=VfsBSubrgd55QZ
	XKdnURUQUGwzlrNsWODgIaERLFR1Q+pqX6t6dLm7uIP3DXY+sayBMeG+8DmZExdap7ubCMo6fhP88
	VfPTyYROtZ06Ktw6V/Dlqaw9UueP0lTxUML9KUKtSqhV99LR2mjrzNotONaG76Mjqaqmh96FPSZD6
	AfdTNDMHM7dkltzo/lJIAZZ3eVEI4HK37u/VBYn/UAIDMI/TNiQxrh/35u+q1VPU0ssbdkAgOOc75
	ApMo+jzngFg8SbudEnItK6g7iswfcIJpFcTDnlNdfye1+XKIoOhyHgXSrUu7e0y5ythZaAW6fpZLv
	XSKLP/DRG+/6OD0W+Rpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh388-00A0hD-2x;
	Fri, 15 Sep 2023 07:20:44 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh385-00A0go-2j
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 07:20:43 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-31f8a05aa24so1693330f8f.1
        for <linux-riscv@lists.infradead.org>; Fri, 15 Sep 2023 00:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694762438; x=1695367238; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tJaQO2Osvw63vkpc+hRyCtg96PFW7ippMuIjtGVzXRg=;
        b=ZEG7MvsngRKioM50aRiSVcjlM5Fj2hLUtFQyhQuOli7bvWhHn+tRmqCMSCehR3QTdH
         8ueoftBXRRvb0Pa75pDTWLU1n3a4Be8qeEO3J8ZHwh5VlRrabY6aeeLOpQ0AUf0m379h
         Q7MKx4XXsWTB1+PAFppNvhz7kayMOCTdf2t0Rbjy8QvL/fECvoqYR4capR2eTaHXl96Z
         PYE4SwIBbiDyCN5jSD7wkv7eQnVwk/klRL8DsnyWojhLcRqLRMdxN/0YgY9XPgTiQPPZ
         LrWpEnSc3uvPyK/9opOU0hF+pIgy9k7XtNKpVEkqxSE9Og8gRM2wC3fPmkqo48hhG9L4
         /JkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694762438; x=1695367238;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tJaQO2Osvw63vkpc+hRyCtg96PFW7ippMuIjtGVzXRg=;
        b=C3emk5B7U1qCMYhPpJuOfAT9z99l4HwrpJ7lyLOoZOqFeZFDeHA2ZuFVdjjLwreCDY
         WXqqePHACUk2YTp0LM4tQks09t0VzqDRKPjHAtgFSeGYpwHN+Auw/6bmlIG8yFDk2P79
         A7PPWajDKhH+wF4rqotj3NMyIzxaoMTxSlytari8iyPw7TNcFk7roUBBM6F/+JRYaiml
         kHp5ZrxvVp5j/CgCOfGhcMwk87gGVTt17ytv0NGBAQDHR47utqzyJ9rgf6DihRXVBaB6
         d/JtFfiw2kC54GpHnKBqcIkjTM+mTMfFADJRZsgR614TnE9FuVDDOcBqpIQgPzuZ/smv
         Eytw==
X-Gm-Message-State: AOJu0Yxgn2xP5z2n6iOTXs8BPymqzZVfqP7Qm+luxSIINloiZNeAiOCl
	yZEZ1sNuB7p6uPmwttTJ3rb2wg==
X-Google-Smtp-Source: AGHT+IHn1pzRnqERbj4JktaivR/54B/ax+k9/9EVN0v/fkF7vEk1NBnAMBcbA4gBaXUMXzS102iogg==
X-Received: by 2002:adf:f5ce:0:b0:31d:c3d2:4300 with SMTP id k14-20020adff5ce000000b0031dc3d24300mr506300wrp.71.1694762438014;
        Fri, 15 Sep 2023 00:20:38 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id m6-20020adfe946000000b0031980783d78sm3666315wrn.54.2023.09.15.00.20.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Sep 2023 00:20:37 -0700 (PDT)
Message-ID: <85264977-69f1-3e14-03c6-bdadb4246c23@linaro.org>
Date: Fri, 15 Sep 2023 09:20:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 01/12] riscv: Add SOPHGO SOC family Kconfig support
Content-Language: en-US
To: Wang Chen <unicornxw@gmail.com>, linux-riscv@lists.infradead.org,
 conor@kernel.org, aou@eecs.berkeley.edu, krzysztof.kozlowski+dt@linaro.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 jszhang@kernel.org, guoren@kernel.org, chao.wei@sophgo.com,
 xiaoguang.xing@sophgo.com, Wang Chen <wangchen20@iscas.ac.cn>
References: <20230915071005.117575-1-wangchen20@iscas.ac.cn>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230915071005.117575-1-wangchen20@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_002041_883325_62167368 
X-CRM114-Status: UNSURE (   7.84  )
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

On 15/09/2023 09:10, Wang Chen wrote:
> From: "xiaoguang.xing" <xiaoguang.xing@sophgo.com>
> 
> The first SoC in the SOPHGO series is SG2042, which contains 64 RISC-V
> cores.
> 
> Signed-off-by: xiaoguang.xing <xiaoguang.xing@sophgo.com>
> Signed-off-by: Wang Chen <wangchen20@iscas.ac.cn>

Your patch threading is completely broken/missing, so this makes review
unnecessary difficult. Fix your process (e.g. use b4).

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
