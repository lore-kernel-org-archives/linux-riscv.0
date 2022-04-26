Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A50D2C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Apr 2022 07:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b0+tCVSDWppT8uEdH4VmsvbsyMXIPNZ/xf7KElqUu3Q=; b=JP3fNIfeF3rnAV
	USfrz76Ufd7BYoj0/Pwm/CrRRBIKx+jrUpg4qzhJJy5s1OSjMwGSlaBYytFnyufMXM216YAGIcg+0
	qOUktFXcrdZdQJGcmHn9EJ5yhfkHZfDEJ/1WyxlZfqf2ACC79u6SkjmAiA8ovKyxeDX3v6lcf+Bqi
	RbN5gp3dlKW+99NQxnVorMFr8t2tfPe+l9T4hpB9bLvsWPDM+WJfODiXQzOmhTpg85NnkcxqRDr64
	Havu6ghzDPUpIhb55MXC/qERDIaIZNv7VAdgSdmeaotIVhD3ugRXXfsugRlUpZ2FSyRmzrd5XYhSw
	EhYDanTJSmNKWpcVcifA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njG4K-00D8p1-Rn; Tue, 26 Apr 2022 07:57:09 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njG2s-00D7wk-LW
 for linux-riscv@lists.infradead.org; Tue, 26 Apr 2022 07:55:40 +0000
Received: by mail-ej1-x62c.google.com with SMTP id k23so34373514ejd.3
 for <linux-riscv@lists.infradead.org>; Tue, 26 Apr 2022 00:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:references:in-reply-to:content-transfer-encoding;
 bh=U1WIMsibwKAIR96y0nfN1dWqQ9y7DvH5uIdNqetGlS8=;
 b=FyZ/TA1R0QE9jseCnsTKYHivHbJbdV3nJ2NWiZVIhMzQOaldbwN8vuAtrdZD/wP6hA
 89cSdgErVumgQOt1bPWr1jgCFjfDYqE1mbAiDg6qb/D8DdimLrdY3TAGjiK+sqdO39Dx
 P1ZSzHXILr9emGF2u8Y2vYQPe2rCIgTHDlhzXsl1p4ZquHvKW9KTCFHeH1cZOqYkJhNQ
 TnfENNrCmpZu10KT0YcRGPaPzHg76g5U5T7tx7iYUfEnrgCBquNxNS+pahzCw9Jg2lgM
 ULXAjZ79f8mRQMFXU1DDuCcqcugSK+6CTQCEm+9BEMLHOCiJQQ/XzvbZH3eYZX3dsudZ
 M87g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:references:in-reply-to
 :content-transfer-encoding;
 bh=U1WIMsibwKAIR96y0nfN1dWqQ9y7DvH5uIdNqetGlS8=;
 b=JzbgAUvd/0amO6ugv9HbYlHXjSjJJ6MMlEhgtwXjLmG2ywusoWipyIoIDND8HOAlly
 gwO3YkHlWIndiuvplgZuMCRjN36vbaH2q8mrBQzl5grJaZX+zU8vkwf0EDhUWlyfHlfb
 Nd7o2PztuVQm8W6chpC49g7Q10hZpqFEjZUDq/iRCr4tc8Y8UBmXhhDar7jIaH8hCoOF
 N6uwROYYAdmX45aLBNEQr83ylb6V3MMQwJQhl5VTkKyEaAtsezPe08TgiXND2reBJEg7
 EF3zcWzqTp/jUybitcuKuB0M+WpAyE1xym9WA61cvI/CmtnUh1XIy48Yy1sTphEgPoOM
 dCUg==
X-Gm-Message-State: AOAM5327bh6ngNcLjpa5eBVvD1SRAnqiuvJsyRBSsfFD6ZH0kvTCqhvK
 xkUBQMhMgiQ2rok+3MOhMLhEaw==
X-Google-Smtp-Source: ABdhPJyl6PyJGE7Jjc6hic8TZ5AB9cjeYf4nSNHBpwP4vGGeYWVVrFn2tuH6oToWF4vr+xPevOz/qQ==
X-Received: by 2002:a17:906:7948:b0:6da:64ed:178e with SMTP id
 l8-20020a170906794800b006da64ed178emr20831011ejo.523.1650959737278; 
 Tue, 26 Apr 2022 00:55:37 -0700 (PDT)
Received: from [192.168.0.244] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 o18-20020a1709064f9200b006e7f229b332sm4428329eju.36.2022.04.26.00.55.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 00:55:36 -0700 (PDT)
Message-ID: <2ac59e59-2516-2bca-9db6-e2cfec671cef@linaro.org>
Date: Tue, 26 Apr 2022 09:55:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] riscv: dts: fu540-c000: fix duplicated dma compatible
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Zong Li <zong.li@sifive.com>, Conor Dooley <conor.dooley@microchip.com>,
 Bin Meng <bmeng.cn@gmail.com>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220421065401.9303-1-krzysztof.kozlowski@linaro.org>
 <f822fc7a-7c47-d8f9-8ef9-fda2c7832926@linaro.org>
In-Reply-To: <f822fc7a-7c47-d8f9-8ef9-fda2c7832926@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_005538_763598_7B029D5D 
X-CRM114-Status: GOOD (  11.55  )
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

On 26/04/2022 09:53, Krzysztof Kozlowski wrote:
> On 21/04/2022 08:54, Krzysztof Kozlowski wrote:
>> Remove duplicated compatible to fix error:
>>
>>   u540-c000.dtsi:171.4-42: ERROR (duplicate_property_names): /soc/dma@3000000:compatible: Duplicate property name
>>
>> Fixes: 7eba954a8de8 ("riscv: dts: Add dma-channels property and modify compatible")
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Hi everyone,
> 
> This is an error which causes compilation to fail. Such patches should
> be picked up faster than later, because it breaks various builds.
> 
> I'll take it via my tree.

Ah, it seems Palmer rebased his tree after it got accepted to next, so
patch can be dropped.


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
