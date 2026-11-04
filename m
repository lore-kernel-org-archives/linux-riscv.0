Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26D06083612
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 15:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MTurMZUf;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=icsSyFZO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=R9hYvN9wYN2UgEbg3MR8FjAx/2tmnbzHqQJhhmkIoYc=; b=MTurMZUfB63t2DZJfPonyP3hrq
	dlUcygH6osA4tLaHjJQH137UVgF81YgRnMceT6kEE6f4Nzl6D3b+LkMND4OeQSC0Ic8XJWAkCYTnC
	jRK9pC7c8cMSeR20rPw5/+d7QPRzrLAeYprV4rtvH17FXwpN6dtbsdKB2OOmDAhw5sqauhUEq/jYU
	UbMX6q34WMhhpcCc/ZSEMveQw19dGKrq5TAfXZJrYzpwdlLpozmY6ZVyJ8tC+TZ9DeREqXdjWCPi8
	IFXT1nuGkY/MGz3V1cyhjHagnD6cVdAMtm3Qru46gFWeOz+s3FqLi1S45Yz2dHKKT9Em5CZhBTZC9
	FIc6JPfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOd4L-00000005ofY-1IrX;
	Wed, 04 Nov 2026 15:38:33 +0000
Received: from mail-wm2-x06.google.com ([2a00:1450:4864:31::6])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOd4I-00000005ofB-3QW2
	for linux-riscv@lists.infradead.org;
	Wed, 04 Nov 2026 15:38:32 +0000
Received: by mail-wm2-x06.google.com with SMTP id 5b1f17b1804b1-4a77811be24so3795895e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 04 Nov 2026 07:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793806709; x=1794411509; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N69nyzayYSxR+NwYu0yvIulH3s3QqZkTbmCgK6AZMFs=;
        b=icsSyFZOCXJznjm2GgFyXF5Zhstp6ezn4pNz5gkMtlJih6oUEhXdpzwA9cGU22eTX6
         D7JPgviGbMd55jR3i3lX3JAZKTAr/DNImcSn4M/I+PUvWT2WFy9osR/oWbLQ/pfxMx8v
         PROELgaB8ryntASa/gtwhD5LV/R5AUT6KDl1yq4gO2RPcTzltOqHIPOfesv+Gf688tmJ
         pNSu5bt3ynEeXs/AVj9vkgpFc3TeeGcEJsCBJKZ09Oj18kXSe9FHsXVAqVbkWzPMB+zM
         HRMc3rTgruo/wvfRBJysX1ivto0ndlD/VSXDpa5EFpRqMAdpY16Uc+kREy9TIzE/7p+W
         4Ypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793806709; x=1794411509;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N69nyzayYSxR+NwYu0yvIulH3s3QqZkTbmCgK6AZMFs=;
        b=apNDqVV8N91xh+qef3j7RInuaxEeWJfTUaWL0xsOzFiz1H/h9MtkfwCoKEGNtwyKDc
         yK9bPPr0YLC8XO04TUhP3HEe7b09bk7+e46EmQXYyZOk0Fj6rLm5ApoOTBNGVNa3ABYh
         F2gdZgoTByNJtPSf49S0r9LSxLsoZYMMJMftph+hg8A2/ZmfyLDp1VaYQd3aSgOTbNWL
         HkNEMnxaPtwlwjd63toaaUEpbE+URxUMuWRJ8TYOOPI3G7KlSzwdxfUkcEi3FsTxHZHh
         O8AEiFL6khHhF5X4h8S7obGOrUZE51nDaw/U7ilsM5/TL4zBhsU3PZkVt1trAiW+6xQQ
         XE+Q==
X-Forwarded-Encrypted: i=1; AKwUvBy2o9HdBCCzAkjZtwqdAJ2y7JvOa9mF3nLZl4+v8FkdZPXJgnRpX0TrRHZ30YvUGnM7VKTKIu4VlL/TNw==@lists.infradead.org
X-Gm-Message-State: APuU4Z/MnMEjuVAM4AWJr655DzbtdrkNzeSpK2tqS0eNF7eO+I8TfmWZ
	nmt0o/IzCSVyO45yg0x443A+KvGpbfGIlPEKS69vmQPzQTpfm10MH0hp
X-Gm-Gg: AYBFou2rrNTz85JYmCIemPRNnWsoQgl559IfRKkfCIjZYL9NwKcIoGHiQVgXPMfPaN5
	MiP9n26O0KD4IpC7qVPNCb24WYpwP5MicARoZCtywp2GCAT51ynV9/6YMWpoJxa9/TXelhQUNEI
	Ruj+rOvEhy6GW78hJ9LnPPlrwOEdtg9IGuM0ScSmSCHUJb74NDamA7YakIsITEDuO0r2HPcjlqE
	bWb84si2TxI67Lt8VjLQ9C6EUVNS9EQuiBi7/yTmbEFOAzth/xSSaBt4KE7onRLvSSP4O+I9KVY
	zX7SMhYMbSJga3Zi2kMoSs8QwukVZnN4VrA2VkRhQWZfxdvWunnxRFhHQdUctfAii0I9Z0x/OmX
	2vaFQGwbNmg18uUk+mUuRs7jglUWiPiOHYrs49yqo6d+Rda/1vGZiBFg+Z5U/Xcc5byibCVGKXv
	Sat8Qce5hKHrULD4L0nl5TgWhSB+BbUxVL7PfKLaBPqN9Moh8vUqYbWiqaokyqc9Kw7bI5NWAK1
	t3FnKZ2VaHiwuq3NDtDJIAsaTcmcXrMQnJA9vPK23nwhQ3f9C47KdkyRoylJlCfLCl5WW5Dd8EI
	gm0tk39LcUCA8OOajgkz3+5OZmUdDg95IWDX4OY7
X-Received: by 2002:a05:600c:8706:b0:4a1:e0d5:293e with SMTP id 5b1f17b1804b1-4ac1765d3ddmr394129375e9.21.1793806708283;
        Wed, 04 Nov 2026 07:38:28 -0800 (PST)
Received: from [192.168.100.182] ([182.180.105.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43c17ecdasm89849875e9.5.2026.11.04.07.38.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 07:38:27 -0800 (PST)
Message-ID: <496706c6-e15c-43ab-ae0f-6230e098dfb2@gmail.com>
Date: Wed, 4 Nov 2026 20:38:23 +0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: spacemit: Ignore PERST# bit for controllers
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-pci@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Ping-Ke Shih <pkshih@realtek.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Alex Elder <elder@riscstar.com>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>, Pengpeng Hou <pengpeng@iscas.ac.cn>,
 "open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>,
 "open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>,
 open list <linux-kernel@vger.kernel.org>
References: <20261104140750.761330-1-alitariq45892@gmail.com>
 <DMMHM7OIO97H.2SHNC575QC4PY@linux.spacemit.com>
Content-Language: en-US
From: Ali Tariq <alitariq45892@gmail.com>
In-Reply-To: <DMMHM7OIO97H.2SHNC575QC4PY@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_073830_897731_E15C86F7 
X-CRM114-Status: GOOD (  12.16  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/4/26 7:14 PM, Troy Mitchell wrote:
> On Wed Nov 4, 2026 at 2:07 PM GMT, Ali Tariq wrote:
>> The k1_pcie_init() does not set PCIE_IGNORE_PERSTN bit of the
>> control logic register, which causes controller to reset itself once
>> PERST# signal is asserted even when acting as host.
>> On Orange Pi RV2 (SpacemiT K1), this resets the controller and wipes
>> the IDs. k1_pcie_deinit() leaves PERST# asserted, so when k1_pcie_init()
>> runs again, its first DBI access hangs the CPU.
>>
>> Set PCIE_IGNORE_PERSTN bit of the control logic register of APMU
>> in k1_pcie_init() before enabling resources so controllers
>> dont end up resetting themselves when PERST# signal is asserted.
>>
>> Fixes: ff64e078e45f ("PCI: spacemit: Add SpacemiT PCIe host driver")
>> Signed-off-by: Ali Tariq <alitariq45892@gmail.com>
>> ---
>> Hang log: https://kernelci.cloud-v.co/scheduler/job/420
>> Fixed Log: https://kernelci.cloud-v.co/scheduler/job/430
>> ---
>>   drivers/pci/controller/dwc/pcie-spacemit-k1.c | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
>> index 92a71ea90ac3..af6028e8825a 100644
>> --- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
>> +++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
>> @@ -47,6 +47,7 @@
>>   
>>   #define PCIE_CONTROL_LOGIC			0x0004
>>   #define PCIE_SOFT_RESET			BIT(0)
>> +#define PCIE_IGNORE_PERSTN		BIT(2)	/* 1: ignore PERST# */
> A similar but earlier patch can be found here [1]
> 
> Link: https://lore.kernel.org/all/20260924-spacemit-k1-pcie-fix-v1-1-002b5c1ba9fc@linux.spacemit.com/ [1]
> 

Thank you for pointing.

I missed that. I will check that patch.

You can drop my patch.

Regards,
Ali


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
