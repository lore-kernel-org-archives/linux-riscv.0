Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE9C3CCD19F
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 16:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3c/ZmAzH5jqJYiwrWfZLihnSNxbHsc0vBcv5sqBwLiA=; b=bHrLLu3IJTg3D+
	ANR2WGsAIlavhC3vEINjV5aEtcjKmOlH8zrgeGAOjzOdP+YqIbspObAMg49ZCG47wgOm4f/r5HS1q
	Fw6uzpHMHD02W8+BNfcKXmu/90S8DdTVHG5NMIJFsJ+xxnzsMVuILaxMJD7hxixpcVRWRqZKMmu+v
	dKpM60FTMdbxkFBLXRJ0yI40TSVFwDrN7geeg71HfE672XPwaaf5FkVILqUiuMRldbm8dstPJtT8d
	dQCP+cUfwg9Ehuxm1j9kIlUFbQwUlzl/rm0+0jFYHq4C3owsxZVKE2MsX/8T/mGhjNc8GjhDkI6Qu
	udtU8Tjo3nPPVJbd0h5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9nCN-00000008Q5h-3cfC;
	Fri, 17 Oct 2025 16:20:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9nCL-00000008Q3c-3VW9
	for linux-riscv@bombadil.infradead.org;
	Fri, 17 Oct 2025 16:20:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=lrl9ZQZl0dfsXGeKo4b0s0yUNEi86+tLTNDIOrpaa44=; b=V7lYXAx/TJxh4HRl+noNNxM+Rg
	evNoHhUOZuMgDvBV9mVv1Qb/j0OWVRTO3IrWK9IZC7rYcvboiLpVzaEmnLveg8lp16uRV1ynqSvXy
	DPxziqwD5o0ieda3UTarQ6cMlojzvkFAEwbTfwK7Qymh49SSSJ0crlzOoIIgLYUqBqvbisKBB7slH
	Q7u2rkAFkpG99o2kKCNQDVhz7qYMoGMd3nYe7a2f1wHvYPg9HL+wILFnapfGHHC9utm3m14NMFjIQ
	IcCOmOT/EMAGiO4olNT4dQp/caYl1yKBWJbxOioT+IU/Sn4/xtdx9/abJim6bBBs5MASj5xpzSkMT
	8eLSJo4Q==;
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9nCE-00000007kAs-0U5a
	for linux-riscv@lists.infradead.org;
	Fri, 17 Oct 2025 16:20:53 +0000
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-430c180d829so7646595ab.3
        for <linux-riscv@lists.infradead.org>; Fri, 17 Oct 2025 09:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1760718045; x=1761322845; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lrl9ZQZl0dfsXGeKo4b0s0yUNEi86+tLTNDIOrpaa44=;
        b=QLABskNxpvz8opdxiCkgV+6C2KnWk10ssR0rRcuG6tFajbpFJFQG2cwzjIRcHVcgc5
         z1ysNhyKwLflmfxcJwHA8h7codgMRuI6XTEa0itGuB1EzU+ryx8sRcZvSR2MKvyWQ6S+
         gN+U6OHn8PWDh+gWnwpEEQGvZ1ASpiTXpvruahyz24m7itdqkvKbeztb7qr/IfCwuTWk
         Rf5rZ2tXK06hU8gwhjBOrr22OnW2SbLWzyMQ1C7AF7vpcpidmB3iZbGbEgufiimmZ1Vh
         L0v6RzJ71tNA9GS/jlG8XQbS7Ynxj0+KTJhk61ZU10PqY7ODOJyrex5/UCZeF4co6X6m
         k3nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760718045; x=1761322845;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lrl9ZQZl0dfsXGeKo4b0s0yUNEi86+tLTNDIOrpaa44=;
        b=dZXpxReUU2/IjO6yEWNSEGKX0esTFjirV14xIeahJ37j/MhkkMHmVbHuZW0ocaxbfD
         LxkmhoX61loX6C9yzZOw6FKK5F3x0Oh1GTKuT6GRPXNRYBtk9rVwPrBQt/3fnA5tOqJE
         W3J/lfkNydLkB8poQ1GtJxVF8OYZNVTCFqKRVVV3kWOIAdRH2IX9nHoWH3Pd7B1eaC5f
         KJj63VfCHicpHZwaDlkVhxAXsnXEJJCqSz7D/YrLlgpL3kBP3UlMWpP+JmetC9Kq8frM
         DOtVS6+BOqMi8ibWOUV+1iAWVf1+ZyRkBjG1bpmaFt5v/TxIgDiLk+o7l4WisFGi9B5i
         ax6w==
X-Forwarded-Encrypted: i=1; AJvYcCVTPNzggXS2vdc+350JeaFny7g23UffeiHQm8NKH7YmBWmtUTUXRcZELHVT6vHTCBUL3gM6RTyvzFKkBw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+aYl9Ec50c+Pqg3pXUQpDJEQtWawu8UNLNAzCDzYhlm3in0aE
	KQ9+zX3rIRU3BdnblGFQKQMsv+o+iTh/OPky3TiSjfDZrrLs7PM0z/YVmfcVBnSVQJ4=
X-Gm-Gg: ASbGncvO0fkvBoTnvrhfgXuv14aevy3KmUZHz/UjWIiTVCf6pZJNWhVf5CDBjIMQIq8
	NDPlfs8QkctQpoF/3encX2xNwpJR72albREazlSezpErR9lRdFT8c088w4FkWYmBGvgF9Wr7uOj
	zhY2/cAH7KqP1CBhBBR/V5dBjTO1d1JyyQWIcAfPUZYbYPsya5W8dd/cDzn1loLkizoy1FZZ4xQ
	1+jM5OrvP3EAoOnM4AGuJQ92tsept2/tLnd7u2lK5eCKermyNWOVrzeAi0fc4LuBZBkWVZ38Zat
	h/ebYqL/1wX4USqmbOOTKWpqqlu2u6rlVB/YVtxJ1pdJ6QvoHsMojWK3a3B2nBp5iPcGfjSvyha
	0ksPEhRh98Xqom9jOIA+PSKrSqwsAfeJqzvUc8drDj7ubIGc4nJ6aUf5zbmXu2ippIW7pH7uHv7
	lk32ZI+UrmF2Noefwn+zYIlGpXFoA3DsZq3ZfcJX4=
X-Google-Smtp-Source: AGHT+IF6pUvJ0SrEEfDoT+rWcs5Ssj/49Pi6P7PUBjepw0T+yRtjC6wHKw2821+rzZKRbVJoL68B5Q==
X-Received: by 2002:a05:6e02:19ce:b0:430:bee3:34a with SMTP id e9e14a558f8ab-430c52b5b09mr52484505ab.20.1760718045271;
        Fri, 17 Oct 2025 09:20:45 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5a8a97689basm12877173.49.2025.10.17.09.20.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 09:20:44 -0700 (PDT)
Message-ID: <e7bbbc92-871e-4155-a1b4-96929199a1dd@riscstar.com>
Date: Fri, 17 Oct 2025 11:20:43 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] dt-bindings: phy: spacemit: introduce PCIe PHY
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: guodong@riscstar.com, bhelgaas@google.com, christian.bruel@foss.st.com,
 krzk+dt@kernel.org, namcao@linutronix.de, aou@eecs.berkeley.edu,
 shradha.t@samsung.com, vkoul@kernel.org, linux-pci@vger.kernel.org,
 dlan@gentoo.org, pjw@kernel.org, linux-phy@lists.infradead.org,
 qiang.yu@oss.qualcomm.com, p.zabel@pengutronix.de,
 linux-riscv@lists.infradead.org, mani@kernel.org, palmer@dabbelt.com,
 kishon@kernel.org, kwilczynski@kernel.org, linux-kernel@vger.kernel.org,
 inochiama@gmail.com, devicetree@vger.kernel.org, spacemit@lists.linux.dev,
 alex@ghiti.fr, krishna.chundru@oss.qualcomm.com, lpieralisi@kernel.org,
 conor+dt@kernel.org, thippeswamy.havalige@amd.com
References: <20251013153526.2276556-1-elder@riscstar.com>
 <20251013153526.2276556-3-elder@riscstar.com>
 <176054651498.4032617.11231316454316691309.robh@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <176054651498.4032617.11231316454316691309.robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_172051_903029_AF42AB60 
X-CRM114-Status: UNSURE (   9.60  )
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

On 10/15/25 11:41 AM, Rob Herring (Arm) wrote:
> 
> On Mon, 13 Oct 2025 10:35:19 -0500, Alex Elder wrote:
>> Add the Device Tree binding for two PCIe PHYs present on the SpacemiT
>> K1 SoC.  These PHYs are dependent on a separate combo PHY, which
>> determines at probe time the calibration values used by the PCIe-only
>> PHYs.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>> v2: - Added '>' to the description, and reworded it a bit
>>      - Added clocks and clock-names properties
>>      - Dropped the label and status property from the example
>>
>>   .../bindings/phy/spacemit,k1-pcie-phy.yaml    | 59 +++++++++++++++++++
>>   1 file changed, 59 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/phy/spacemit,k1-pcie-phy.yaml
>>
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Thanks.	-Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
