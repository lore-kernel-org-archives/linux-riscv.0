Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF1DBCCD199
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 16:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TlJFJhjsEK/67XYOht7lU3Y7K9/UiMSzzXQvVnMr+oc=; b=Z+Ps/BTq9WcG+E
	vlzobvOPiyqF6aJ3XJId7KafN+B2qz0OwsrSyD39+lPnDOI/+PnNUWKTj1Hg06xkhR9CbcSO0CWBt
	uaU9aGI07x9j9qy4ojmCzk7v6hD8RXSNFJ5te+ycg6qF7ZgfyxmkFG25mEwrVE2QAU/oaaTx/mMM3
	Wcfs6+4RYa5aaeoZmM2EA+Y/kqg8zgIXIXu6gq881HvySnlBh/SAWKVRV2MFD9/ZCmHUetcXHlEYQ
	OZ6uRQddsAxKsuZpEq93cgRzZDLd1qJnrlptwX7RUiVOgLJft1+UhBdNG1lqwwDvHo5OBqCwjvVZW
	UqAEK0czpGXs70U+Pjbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9nCA-00000008Pyv-07k9;
	Fri, 17 Oct 2025 16:20:46 +0000
Received: from mail-il1-f182.google.com ([209.85.166.182])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9nC5-00000008Pwi-1gHg
	for linux-riscv@lists.infradead.org;
	Fri, 17 Oct 2025 16:20:43 +0000
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-430a5fe0c5cso16537495ab.0
        for <linux-riscv@lists.infradead.org>; Fri, 17 Oct 2025 09:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1760718040; x=1761322840; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CVQ6phuTO84kFBkRt8EnO28DbxtrTEoiT+THIp/h4p4=;
        b=1mofhyBSw0B53AMbfVgl9AeyMAQ+QfYSL/+W8ndG9WQfJeE3pzKAzYHwXSXxwwiTv5
         Z//V8KLzfUl3SMAtw/5t1EE2mTfPpkGtO9uBs6odGqXNBAnaarb5bfN7SuUQHn+GhP6I
         NNVh+DXCAbKpaFcGnFqs2RjAYlp7zjkCKfRv1XkVTkOZr4WXLkJeQlWlTEKK5vpmveMz
         v5orCZ/NR+vIdG5qx+IwKOGOuYKL+bc20whmrEwd//8nJBNuXdmyxLBkhzYpAjOazQl1
         v5NnfztCJAs+pUoGsPbvKq/PACxS3qLESHYQXFhAd2qz06o5o2Ok25HZ0Yr8j11Tu7e9
         nsUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760718040; x=1761322840;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CVQ6phuTO84kFBkRt8EnO28DbxtrTEoiT+THIp/h4p4=;
        b=fQS1QI+KZdU7IrohBZvtGVI676MflQkf8cyxJeJNdysBpagbVggEbQoBWtCrXz9RAG
         cu/z7w8zpPq+Q19b/d9eKOR5zaNksB4MT6xl2fQZIfVlxz3XaQLdEFYA/pfakMxwoWYt
         6/2ryZBAT2s378cCPdzqPx1iW/f3+ea/Q4K4b71Rxw/7zFM5KYkVZ4rhl33p08OyRNY0
         94a2Rf/TP1q6KSs7I1xsgtYzf28HgEiYq0ZnRjH9IQ4lK9mJlmrpkiVeBowf+k+HsrOQ
         yGfwBb6OAUDX3Pt5Ktesd6Ynr29kT5dmijPZ+Qt7gz4+GmBz5bAr4eJ8JdS3NQoZK+y7
         uRMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQe/sakNBRmp+VkzdlOwS/5nPX+Jh6jvWk+ggmlapIqnafnA3TdvZX/pg5tUzwxn4DAU2Q+CN8UAyjcQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyn+Hcq5gmt8iYmjGYY9c1QAFQwKAU5A6LM91jgzfsjW9akOSrG
	A4XC+K7jshCoXhYNd2qRX9JB5UpSzMqwIK1ZBEUApATn2/rNQtMeTivN+yoqTrdv5gQ=
X-Gm-Gg: ASbGncsrN+iwcM0VSJrLiHh61nmbWy4FXLfb/szFSu5kUKQ4nvj6CEYkJX7GXubZ76m
	mrXvsIox4lQxXYwqdwrMGBnFoDqmshLXlH+9Al9HwXKfIH7Od+KkLfGWCLkFv4RxvK4iw3lPFeH
	PB3r7FvxOdFn/Zm+naEpSGiY8zE44hyBxy9XBggIkrW3CyLoXys+U5j8UEbMCAlXnpj26w2fMUD
	0L6bO0boBhc7g4QVRba/Egc8yJeCszkp5SPE9uVkYA23GzkkYN2wrZVtNR25BscV4w07gMwDicL
	BZ4Rfetw6FlMEh1KGY/mUif8BDeNIoEC/WKpHGRn5Pp32a9R01URzp/382u9bFB0+EYRT0skTHH
	kITGDMvqTOpsDbD+shrkmTWTUjf8AzyS8CnUQq1atZzIv8rtK8R9pDTFFZj0xVXe6wqqNpCaIZ3
	u5QI/zdQleedTG4oC2YSUiusVutIORGakor5nQzYw=
X-Google-Smtp-Source: AGHT+IHkLguz0srIwb9Y0kZ8Jj/SerEa4TnF03jUDSOPF34f5dBqn26UDMGx8TBiPYMDv2ZC0jD7cw==
X-Received: by 2002:a05:6e02:1d9d:b0:430:a65c:a833 with SMTP id e9e14a558f8ab-430c52ccf5fmr57021215ab.31.1760718039725;
        Fri, 17 Oct 2025 09:20:39 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5a8a97689basm12877173.49.2025.10.17.09.20.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 09:20:39 -0700 (PDT)
Message-ID: <3ccf196c-aa57-4977-9dea-a54172e427fa@riscstar.com>
Date: Fri, 17 Oct 2025 11:20:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] dt-bindings: phy: spacemit: add SpacemiT
 PCIe/combo PHY
To: Rob Herring <robh@kernel.org>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, bhelgaas@google.com,
 lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
 vkoul@kernel.org, kishon@kernel.org, dlan@gentoo.org, guodong@riscstar.com,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 p.zabel@pengutronix.de, christian.bruel@foss.st.com, shradha.t@samsung.com,
 krishna.chundru@oss.qualcomm.com, qiang.yu@oss.qualcomm.com,
 namcao@linutronix.de, thippeswamy.havalige@amd.com, inochiama@gmail.com,
 devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-phy@lists.infradead.org, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251013153526.2276556-1-elder@riscstar.com>
 <20251013153526.2276556-2-elder@riscstar.com>
 <20251015145217.GA3554740-robh@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20251015145217.GA3554740-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_092041_679293_DB7B9566 
X-CRM114-Status: UNSURE (   6.52  )
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

On 10/15/25 9:52 AM, Rob Herring wrote:
>> +  resets:
>> +    items:
>> +      - description: DWC PCIe Data Bus Interface (DBI) reset
>> +      - description: DWC PCIe application AXI-bus Master interface reset
>> +      - description: DWC PCIe application AXI-bus slave interface reset
>> +      - description: PHY reset; must be deasserted for PHY to function
>> +
>> +  reset-names:
>> +    items:
>> +      - const: dbi
>> +      - const: mstr
>> +      - const: slv
>> +      - const: phy
> I think phy should be first as that's the main one to the phy and the
> others are somewhat questionable. Otherwise,
> 
> Reviewed-by: Rob Herring (Arm)<robh@kernel.org>

OK I'll arrange them that way in v3.  Thank you.	-Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
