Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D80FCCCD193
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 02:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JEUND81qiPm9g//Obcs+gb7IAJ7ScfBFimMY0kso5zQ=; b=Kzt5vXWtWkWhf6
	CFWTKHBnP0+uIyBOC7pElhXoCxj8GWYi4h38nqphHFu2s7q9FVM9z2Bydv4I30WTTjFCLeTIhxN7d
	4SPv8xGAPiLm1+bw0mDeSGMSQDb8RRSL47NCvPb5uhSu4onngSJ/rjfgx9tSaBpVYIxpZ3KCF+tFu
	kcGWTNjw0kxi5BH3KTUkLvHRVNMIioiFwUIdxj0QTO/LXQdfWIXsQuv57MFrDLwZHK2xuu8f/wNgR
	2Pk1wxEbvYYjSxCdF2HfriiWl90173Hl81FS7d8ayBsPj5P+JylGRFJ91ofiOVBzb2L4XCgxT6Gc3
	nF3lgh7gDlwlarvXl+VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC7b3-000000082Zg-25kE;
	Fri, 24 Oct 2025 02:32:05 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC7b0-000000082Yw-1gXl
	for linux-riscv@lists.infradead.org;
	Fri, 24 Oct 2025 02:32:04 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-28e7cd6dbc0so19896575ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 23 Oct 2025 19:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761273121; x=1761877921; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kzKUpWrMzxlp8IP1Hn+gGsM8P9oC4CEs0ABcpzIqxFU=;
        b=MLQr+iuAzkL6lt4pxMeK+6J+LYvM8F+wXpc13fnNE0auX7kQ68ni+b6SrUAmA6TQCR
         1Rhm6z3dfm1Ii5iO+k4Gy/rZ1HgoEit+VWLN+9WLyOxiTYvdzEn+zeAo+NOfQUaymXv5
         kS1aZj9HoktY1c0J+0W7L6mROrxrR+JbvQ7vdC0T3kcWuNSuwAfDSOQhjsjnaBIJO3ag
         4tpbfDAeJdDcff/7vlyMxYrwgJ1xkuMN8KUGdoT3L0Pk46zvrEgLxmtXOR0gvVDIOPn4
         HDBuOD7v/IYyn9DOiIQX3jQLusRv9zdAIfRxU1N0+tnmBVYqBOjpV6rCQGCFo1WsQpuM
         PBBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761273121; x=1761877921;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kzKUpWrMzxlp8IP1Hn+gGsM8P9oC4CEs0ABcpzIqxFU=;
        b=qAMqZXJiafiQBQKW370xd/q92kB4lH8nQalUC3Yuwjn2ww7AbkNufY0KSM/bBFDgLX
         uZj5pchvPIP1xKYgFwVzukitBpn9N6nO3YVu9j9DSiAcYMeLcDo1CcEWIYlheFuxmBLL
         wcx4OaCQbhlY+T3ZhoDt3JhOBzu7MspgUTJ8jK+P9hlKCM9CchLI1zszCxBpLcdx+Z+Q
         tNvkTBHDQeC1sl/opia043YbvFe0s7g3KJAGBJwsbdavf7M6dvUH48A2WWlG7LmAP4wN
         lNVcV4c87uyIW6TMbRt7vXJoxtki0sZrqgFa8VXfeL9w3wYS+Sa+vjVE1FeXaY8Cy1qe
         jRqg==
X-Forwarded-Encrypted: i=1; AJvYcCVGrtjRtrBMRN3dz6o2nk7eek/23v4wHifyvLqS/e1+S1AERXrfbMY20jBZRgGkLQ/qR5jRwHQrCrru5Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5feM4JbZJpdcPDdCETFWj0k7KOWYeeG2XWnaVglGKMdKeHcAv
	AYNPxXcQuyyCohwmroaszEBxRU+PKSKhX7uvW7YgLj4s5mP5kG9AEjjqBqErAzVXACA=
X-Gm-Gg: ASbGncvOxE4sUt7rBlBzMdCGQSUEFKp8DlDtF31DNP+3r6ncHyPOhiEF5goA9x7emSX
	LnTTMCwDVlsPcXlHa21ZBU83NqeeoU8zcl/TQStT/xopik2WAAN+jFmskyFeTQYyCx2f20CI0v9
	Z8qBqGpNPSV5+n22h69Ngof7Z2EBAIH5KIgNHlKqoUONsY4ykm4aX7VQTU40+Rh/A00kFfs8cbk
	ZxktiUJta/QX7FzQPBB8iCduiEjOOMQwHAM4viiy4H80w0eXpO+w02mqr8VH3uqqvAzeocE+mX6
	ngCqYhDUuHeUsUtYCyjg4pFswIFPJ0nxq5VOnffseLdlLbV4AGhbYyEWQe8iU9dBYfGxCOyYxDP
	40qGM9lYbBeuYLMeQohwiFXHCr0V3FFoiijAdBO3pYgOoTyr0sj8y7f2TjOB5/aJUtzlaEzqidr
	u1xJ6vRHmRx4S16vI=
X-Google-Smtp-Source: AGHT+IHA/K4QUyGTpQDn9ihnxw3kPWzudC8RYPggiHagQ4ZXS400Tm4j9rYxGD5oYzwHu+DSEJUE6A==
X-Received: by 2002:a17:902:cec6:b0:290:ad27:c1fc with SMTP id d9443c01a7336-2948ba7ccdfmr7272505ad.55.1761273121331;
        Thu, 23 Oct 2025 19:32:01 -0700 (PDT)
Received: from [10.211.55.5] ([156.39.10.100])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946e0ef2fbsm39193715ad.79.2025.10.23.19.32.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 19:32:01 -0700 (PDT)
Message-ID: <ab1fae69-cf2f-4417-9f19-6383c648e4d7@riscstar.com>
Date: Thu, 23 Oct 2025 21:31:59 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/9] spi: fsl-qspi: add a clock disable quirk
To: Frank Li <Frank.li@nxp.com>
Cc: han.xu@nxp.com, broonie@kernel.org, dlan@gentoo.org,
 guodong@riscstar.com, linux-spi@vger.kernel.org, imx@lists.linux.dev,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251023175922.528868-1-elder@riscstar.com>
 <20251023175922.528868-6-elder@riscstar.com>
 <aPq75FBuYvFQrbQE@lizhi-Precision-Tower-5810>
 <a43b6ddf-c552-4db8-89cc-49951015161d@riscstar.com>
 <aPrfSVEP5xasMEBr@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <aPrfSVEP5xasMEBr@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_193202_782004_0D262AAB 
X-CRM114-Status: UNSURE (   6.68  )
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

On 10/23/25 9:07 PM, Frank Li wrote:
>>>> +static inline bool needs_clk_disable(struct fsl_qspi *q)
>>> needs_skip_clk_disable()
>> OK.  I was trying to avoid the double-negative:
>>
>>      if (!needs_skip_clk_disasble())
>> 	clk_disable...()
> Oh, Make senso, needs_clk_disable() is fine

I will leave it as it was:  needs_clk_disable().  Thanks.	-Alex

> Frank
> 
>> But I'll do as you suggest.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
