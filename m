Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8726ECDB482
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Oct 2023 17:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jT3oyejQC+/qtMwtw16Ng2VBk+yYEo/CQOat++Fi8E8=; b=edeswhokNONgtc
	+hBqtqrc4GgRRITg3d8rHJv1gtj8vscdWQDHMlpcTTPgdH4CnmTaQWxqX3nS2mbnM4A3AsMyp5xyj
	4bORDSjXlNmBwWZte5dQBKfNSQXHWyhu3u9/1LCljHmVK2xoEQWbOiJbc0bJMVOUhduWBNfel29Es
	enroW56GbolN7tnYmNY81Q4hYFKQfQttLUg4fnGDfyCQoZTNC4bkH0D21Mc59i//H15O2AG5iqQFq
	QuxLvHw+QWCKHkTyQtqVE8OGotD8O7RghpCHV4TWwV8Vs4kJ68rBuIH/nW8CBkiSVNlVgnovKUVQG
	2M+iNPnpXymHRQMgQDbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qso5f-00CvOn-2m;
	Tue, 17 Oct 2023 17:42:47 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qso5a-00CvNY-2E
	for linux-riscv@lists.infradead.org;
	Tue, 17 Oct 2023 17:42:46 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-3af65455e7fso4340843b6e.3
        for <linux-riscv@lists.infradead.org>; Tue, 17 Oct 2023 10:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1697564559; x=1698169359; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rPz/XE7kyZI3rqX/gW9OA3u4MOOTZR6TB5rRl4itwhs=;
        b=Ckh+qNKXBP0vpA3GGMF6DUdjoT5AzcrMIkw4kDuT2bGH4hOYUzAy6JCFICnIJ66NQM
         ggjKn4lUhaOAhnKJ+yR0dJAUGLhc94HbnGHncWrmqqN6FyIAm/XHoHM+MP3QiqArmen3
         6ozfHRMZvLVLO0vPNKyZRm9Adda6zKkykkRWWTE6eYt89eUlPNlBe3pOS94qx9FwjmED
         PjDN9/OJmtmKIbRew5XIKf4TO2IyVnL1cmN6be5QtbCX0kvYmU9gbaknGCmWQ+3waKLj
         Pe04bmoXQeR6LkxMyLoJdTUSSC6DOYsONkmaMeTf3K5sM9K4ZSjwdPgn8hAUZtyB6W9F
         u7eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697564559; x=1698169359;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rPz/XE7kyZI3rqX/gW9OA3u4MOOTZR6TB5rRl4itwhs=;
        b=HXjBl/l1zPm77LPfhtQZrZMmo5yDt9qxu1iDi33P7NX96jgkFDHARYupKtBU1YPwU7
         9ur0rDw8UjXtjzd3TE65T6Hgbh1fOTuH4+b+vLXPlJsr+XdG/WUZ2nQp0qA1I0Jj1ju6
         uS9U/PdL0hrSq9l4tbfkSNQ0OA+wqpumrRnC3OkBj6B07og3GVOK5ccGQ8OgorhDAQk3
         yFuv12kO1AmfOOuj9y96n5q8DMdR25uoBFIw1G+cbj4jxuS0EM7yNHiBxV8xJSPSyr1k
         ftg1S5A6uRx9j7rqySSmFBra+swGrIQM2do1sRWw2rYcQS0j0BhE7bDCJWtC7elxNO14
         FhAQ==
X-Gm-Message-State: AOJu0YwBFlyjzWdYBOlB2WCYAONZVHRsTl/4HHJv1KdrD1PnXjUw8C9j
	e1LTF+H7eKruBcnHJ+gSTDG3YA==
X-Google-Smtp-Source: AGHT+IFEfoBhjOQCm3H2dwONN2OZeU0Zpiqlzxa0ALnC7U/VrgPgviuWtLFU33wwArf5EqgRuHAO2w==
X-Received: by 2002:a05:6808:170b:b0:3a7:37ae:4a47 with SMTP id bc11-20020a056808170b00b003a737ae4a47mr3577036oib.12.1697564558899;
        Tue, 17 Oct 2023 10:42:38 -0700 (PDT)
Received: from ?IPV6:2600:1700:2000:b002:95cc:ccc5:95bc:7d2c? ([2600:1700:2000:b002:95cc:ccc5:95bc:7d2c])
        by smtp.gmail.com with ESMTPSA id g5-20020ac85805000000b00419cb97418bsm785313qtg.15.2023.10.17.10.42.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Oct 2023 10:42:38 -0700 (PDT)
Message-ID: <8905630a-30dc-4b22-9d6c-fd4af97728bf@sifive.com>
Date: Tue, 17 Oct 2023 12:42:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] dt-bindings: dma: sf-pdma: add new compatible name
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>
Cc: shravan chippa <shravan.chippa@microchip.com>, green.wan@sifive.com,
 vkoul@kernel.org, krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, conor+dt@kernel.org, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, nagasuresh.relli@microchip.com,
 praveen.kumar@microchip.com, Conor Dooley <conor.dooley@microchip.com>
References: <20231003042215.142678-1-shravan.chippa@microchip.com>
 <20231003042215.142678-3-shravan.chippa@microchip.com>
 <20231004133021.GB2743005-robh@kernel.org>
 <20231005-wanted-plausible-71dae05ccc7b@spud>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20231005-wanted-plausible-71dae05ccc7b@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_104242_785601_2AB6FEA7 
X-CRM114-Status: UNSURE (   9.57  )
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

Hi Conor,

On 2023-10-05 5:54 AM, Conor Dooley wrote:
> On Wed, Oct 04, 2023 at 08:30:21AM -0500, Rob Herring wrote:
>> Any fallback is only useful if an OS only understanding the fallback 
>> will work with the h/w. Does this h/w work without the driver changes?
> 
> Yes. 
> I've been hoping that someone from SiFive would come along, and in
> response to this patchset, tell us _why_ the driver does not make use of
> out-of-order transfers to begin with.

I have raised this question internally. So far I have not seen anything to
suggest we need strictly-ordered transfers either, but I still need to confirm this.

Regards,
Samuel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
