Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11482D3B7D3
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Dec 2025 12:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BgczbpO3ocMlH8UdwkZULcEUkfDDjcr1L0LUwv0/AuU=; b=OqL7iL8ARzsBNp
	sWh0TFk5K8xWKPF0k9mJ+jG3Xxngpd9+3L4JhimrmAWJUtNl7Um1Q9kj3VkifBhE/mjAARBLBGyL+
	IV7A9Y85G/pzIIhCxaBvEkS07Vpmittp+uo9mdN54wz1FLO7R8FX2lbC4RXRfne0O5x/rAGbZiGH5
	8Jm9egQBN9Nm4yk3bwEt3ketTeAx4EFkdTBHgk3nG0X0VbcPm/6bRU9KMF4+aXK6vX9EneNYdATu6
	W82rQL3UFbdFOmYgFY84qo5uanIteeM3cKTE0GMBvG95ypOOTvq/QvybxRwsnqS36ZgPE9+MaHTWd
	bQn4eKfe5hTpAg32SM5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRrY6-0000000AudQ-0U7X;
	Sat, 06 Dec 2025 12:38:06 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRrY3-0000000Aud0-11NI
	for linux-riscv@lists.infradead.org;
	Sat, 06 Dec 2025 12:38:04 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so33917425e9.3
        for <linux-riscv@lists.infradead.org>; Sat, 06 Dec 2025 04:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765024681; x=1765629481; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OIhBd1LCJj7xifV0MwkBjxJ1HTu8zyeSnrj0t6qAKpo=;
        b=W0t/aHbFYtaE+6Rqt3Ke99qbo5wPHx/Ds+h8FkpjM5tpXi+waLV23QJB4m8UbxG9Dd
         whUd4zQls8Kzhg2a0QUWLiYPDuyuUXw2vS7SqRWrNP2r0jvfa4JZU6OjNBxYYl/J4tWV
         2gGbXII7WMH7v6xNrSUyVpr3I0GOm9WduBMZN8kS8tFyrqRZD3GRkWDVFaO79k/OVOQR
         sa5g1XSXmIIYCVa4FISzN/gKUKThsdYZO9oidVxgDaaMq2VkTJdm0b9NdaHJ5cMBhKXP
         j+DYoDBj2YUhJ/Ae7Q57E0cAsZdX0iqMXG/w+xTLSGQvcXFqbW/oowed1bEIn260Cp9g
         WFWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765024681; x=1765629481;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OIhBd1LCJj7xifV0MwkBjxJ1HTu8zyeSnrj0t6qAKpo=;
        b=l7bZ+cegKDVYM/zY8D6+ov5Mz7Jp4q8jJQjR7ynsbkGjK9W+nfdbI/3dQWb1EaMTSC
         u6TIls9x04UZ8YEddpF8npNiwoEavIJm0WznNPD62PxWAc7390n5DVVnSSQSpODWHNL+
         MwiX4/XKmKA+1MMxa5TYQkKTzlMnTxTeiWREPy5lRk03tvbSPMKMrXZ6XeTNfT9Epo/3
         aKdip08YkS3YAyoFoe5TYKYTzP9LlF9ugIWKxkrO8OncsDeRA84RjAtXhejBn4XFsbJu
         PdXh72gH4yETyZPhLXf2OrWf0zljjQP7eMPdnW252XxnFdxeO1Meoj3fmpShMpZL3Nyr
         C+uw==
X-Forwarded-Encrypted: i=1; AJvYcCVbhDUcKmdBfzLfGyiMqHCqvtplddHerSoWbjpTZgZJlZ6ZbuK4rig9kQ0egdO+i5rZeCy7pOReX47hJQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0zA8TrMtN9XuCY0vYSv7TnqroIpmLz9e+26JKtXeYfJWPzQBv
	si2ffSpSgX1obCfzN7GPCXpfniJtLzxFMLnRMzjHv99a8hXP6J3w+GyTYztb1cjAGPw=
X-Gm-Gg: ASbGncuTU7I9tYXrYzteQC50+6HLw4QYz2PZUA4DVKlMD/cD4dce96VdtPUeBrVm/k9
	BoAnIFBTKUqNzUkfI9maHRzBb8Oq+iZqnIqn2DDd1D6DXKGSkpYPumdLoDof31MpfzTXMmPjxAM
	yC9OZ8f318C73KPlzirazfn+ul//ZOUJc7PeGIwdZcG6rBubLK31AIcpz8JWs41bcX0RSsHh6Q+
	kI+X6KAO9y5snU/FxrqgKTDyfW7mOVdRz3qqMwqfPkZMhZYx5MU6/LObdmTR7UJ20LfMP0Nvd0b
	3PU+jJu9O6laSm70u12ujpggq4g80Knoqt5fnsyDD9Zs6W/j6KOG3B7xrkkuhVWKkHvLc137gN4
	YHvbng6OtYaJe5ltcu2Oif+LI4Hea+/wTsBc2i20aIabSp3N+M9fQZ/xQZgSXmDIyQfY7vfEeon
	DWEWcmSfTlP4KX5v6D9oM5Ep4DYK42M25eVQqGwgt4ujJMAioUgqpOAskJJppNOZ2tMydSp9YB8
	1kT
X-Google-Smtp-Source: AGHT+IFV+g5YZB4l+nX4K2VIKP4qPmTDVcLGCOU1922bmbKhf91LhPwj9RJnC4HZ2/LZ3K6Js5WD8w==
X-Received: by 2002:a05:6000:2583:b0:42b:2fb5:73c9 with SMTP id ffacd0b85a97d-42f89f70894mr2310830f8f.58.1765024680716;
        Sat, 06 Dec 2025 04:38:00 -0800 (PST)
Received: from [192.168.1.138] (241.85-85-167.dynamic.clientes.euskaltel.es. [85.85.167.241])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7cbe90fdsm13756855f8f.3.2025.12.06.04.37.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Dec 2025 04:38:00 -0800 (PST)
Message-ID: <f9cc4a7e-c71a-439f-9e71-8cba4986ceb7@suse.com>
Date: Sat, 6 Dec 2025 13:37:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/6] PCI: starfive: Use regulator APIs instead of GPIO
 APIs to enable the 3V3 power supply of PCIe slots
Content-Language: en-GB
To: Conor Dooley <conor@kernel.org>, Hal Feng <hal.feng@starfivetech.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 E Shattow <e@freeshell.de>, devicetree@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251125075604.69370-1-hal.feng@starfivetech.com>
 <20251125075604.69370-2-hal.feng@starfivetech.com>
 <20251125-encourage-junkie-f80e6933b3af@spud>
From: Matthias Brugger <mbrugger@suse.com>
In-Reply-To: <20251125-encourage-junkie-f80e6933b3af@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251206_043803_313640_D17ECB9C 
X-CRM114-Status: GOOD (  10.32  )
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

On 25/11/25 21:00, Conor Dooley wrote:
> On Tue, Nov 25, 2025 at 03:55:59PM +0800, Hal Feng wrote:
>> The "enable-gpio" property is not documented in the dt-bindings and
>> using GPIO APIs is not a standard method to enable or disable PCIe
>> slot power, so use regulator APIs to replace them.
>>
>> Tested-by: Matthias Brugger <mbrugger@suse.com>
> 
> Is this actually a valid tag?
> He provided one for the series on v3, which didn't include this patch.
> 

No it is not. As I only tested v3. But I was able to test v4 as well, so 
for the whole series:

Tested-by: Matthias Brugger <mbrugger@suse.com>

Regards,
Matthias

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
