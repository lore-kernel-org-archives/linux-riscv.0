Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0752FC25B75
	for <linux-riscv@archiver.kernel.org>; Wed, 29 May 2024 19:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cwMU3yBbBM8Pl8nzhFt1epg5lKJJW0nTW+vKLSmN0qE=; b=0s9pXR0cUz8A0i
	6e2LOPAwLOJuTv+ldTEl5Ka5n/GWuyRYVzi50ntItPEMw5GB8ZeSe7fyQbU9tJRrlEfVrQ7WzvBwB
	jmxsSbLts5kao6vz4LtmeZ7nCweD0npHqg8FJ6v5O/wDFuAi5xhDs6ojexn2KFT/uc2BF2KROKvOy
	/NXuafQGvmEKhI/T8ML99xHn+BgPg8Tc5rcFz20LXMRNjW62+IrtZXHTDsjVYH9a+oswBUJP4ECvw
	VMetR+lCoq2iQjSAUdKLHcS1ml9tF6GLjILAJa9Hg8f3tDXeIC9CdbNsE+UgdfdUfwzY5idO5Mdwj
	LyaA8YBtiHYVKFakgRcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCP0T-00000005LPf-2r4A;
	Wed, 29 May 2024 19:30:41 +0000
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCP0O-00000005LOp-2x5U
	for linux-riscv@lists.infradead.org;
	Wed, 29 May 2024 19:30:39 +0000
Received: by mail-io1-xd32.google.com with SMTP id ca18e2360f4ac-7e8e7b01257so1670839f.3
        for <linux-riscv@lists.infradead.org>; Wed, 29 May 2024 12:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1717011034; x=1717615834; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O/S0KVWXFmOHVQryZxavE2DQTw/tgGX43OLxqtR+UFI=;
        b=YPXNbG0ARHrgcpSqAO9YNNuDG07bPxTRoSNCI2v0CDRQEKNveQQb3KZjcA1VhSj9jg
         G20570y4dFoAiaPRg6hjYzvxuZ38ypXQMaWMR/yeOkCv6Eu3qYr96eCXhkq9VoY+JI17
         Lt140/wxS/LX45vjmHCmuBDy/xSfOGAYzIgvEgs8g73HZU/blEHgWzBrr9ikaOshWlDI
         Xfc4XsVJNnKequa7FZfEZqZubaAxPU+IKPRd9Q9XaCIgDEwxEnSepU5OxvkZaMP6HnI8
         Yn0HKcM016u8y1QCyJpE4bz9rZM5Puu+cZa5W6+cN5u7fDl8Bs4anOTIFbIh19qR9EPp
         HzCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717011034; x=1717615834;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O/S0KVWXFmOHVQryZxavE2DQTw/tgGX43OLxqtR+UFI=;
        b=rso7ebzSF0fe8xrhLLwRU3AsNhsr6uP93fD/CxcQBo3T53DkCCHrxg0Jt08/hAa6go
         h30DkTkk1oGFInKafOxxKf00vZr/46EWkoNhkx4gYELWh2RzdMht43G2cPJ/Jn5NEqoy
         PhMBTBnaaMoi1TSR0iMGKtc753KW92GO/vno4Bl84FzZafPJschhBR5WtE1jhBLHbCnX
         DNQvQ5nnmxZvl/fudwpRO4PQkmFKaH34O6nO8YjrLN3QWsWnTNh7oD6t24PoumBNMSS2
         iq/RC5v6WDgV5ybP+ryDk0SLLyB4sHyQi+9YwvIs1RQRjNpmd0OFmxw7MXrx/KxJoQkN
         jaNA==
X-Forwarded-Encrypted: i=1; AJvYcCVkb2pA6TMUFmli8TYz9XHrrH34GdGdFTGvRbBibdx3RkeGw8ZqmPCA8bfEcI+ZeAseJ52P2RkBG+pyyncWDm5WDsIqCqqmVY8D2aqHQwzs
X-Gm-Message-State: AOJu0YwEMPgy1DWHTlEHUTAeHxuKxk3eqQ6WpYYycCxb7y8wrjxwRD0a
	qAJnfGXhAL98TZpvj/y0ENH2npO2CO6f+e2Fm8rHSJL+6eNQvJp+gyxtHe8TpSU=
X-Google-Smtp-Source: AGHT+IGH/6KegzkUgys9rBPlGXzDuwuB6PvXzY3NlqpGylyoIeQBRNeVmq/3xNj56KnkqbTgj17LXA==
X-Received: by 2002:a5d:9304:0:b0:7de:cd12:ed2d with SMTP id ca18e2360f4ac-7e8c461533emr1764314239f.3.1717011034379;
        Wed, 29 May 2024 12:30:34 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.6.197])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-7e903e0b783sm263170539f.4.2024.05.29.12.30.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 May 2024 12:30:34 -0700 (PDT)
Message-ID: <f18a74a5-330e-402a-93ca-5552faf00e7e@sifive.com>
Date: Wed, 29 May 2024 14:30:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/2] riscv: dts: starfive: Enable Bluetooth on JH7100
 boards
To: Andreas Schwab <schwab@linux-m68k.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Emil Renner Berthing <kernel@esmil.dk>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>
References: <20240508111604.887466-1-emil.renner.berthing@canonical.com>
 <87wmo2nmee.fsf@linux-m68k.org>
 <CAJM55Z-F6N6ua5LoqyMFogDtLp=FaRPoDv4osXFDMjR1b8r9nw@mail.gmail.com>
 <87zfsy102h.fsf@igel.home>
 <CAJM55Z8Ce1i==pSUj0z4T2y71g713-675mAYQP5qSN5Euz=rLQ@mail.gmail.com>
 <878qzsbona.fsf@igel.home>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <878qzsbona.fsf@igel.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_123036_935870_3361A54F 
X-CRM114-Status: GOOD (  16.17  )
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

Hi Andreas,

On 2024-05-29 10:53 AM, Andreas Schwab wrote:
> On Mai 29 2024, Emil Renner Berthing wrote:
> 
>> Oddly it doesn't work on my Starlight board either. I was thinking the firmware
>> might set up pinconf differently, but comparing
>>
>>   /sys/kernel/debug/pinctrl/11910000.pinctrl-pinctrl-starfive/pinconf-pins
>>
>> on the two boards shows no differences. I've also not been able to spot any
>> differences in how the AP6236 module is connected in the schematics for the two
>> boards, so not really sure how to proceed.
> 
> I see no difference between Starlight and Visionfive boards, both fail
> the same way.
> 
> I also see that sometimes the firmware greeting from brcmfmac occurs
> _after_ the timeout error from hci0:
> 
> # journalctl -b -2 | grep -e brcmf_c_preinit_dcmds -e hci0:
> May 16 12:01:54 beaglev kernel: Bluetooth: hci0: command 0x1001 tx timeout
> May 16 12:01:54 beaglev kernel: Bluetooth: hci0: BCM: Reading local version info failed (-110)
> May 16 12:01:54 beaglev kernel: brcmfmac: brcmf_c_preinit_dcmds: Firmware: BCM43430/1 wl0: Mar 30 2021 01:12:21 version 7.45.98.118 (7d96287 CY) FWID 01-32059766
> 
> Is this perhaps a race with the firmware loading?

brcmfmac is the WiFi driver. The WiFi and Bluetooth parts of the module are
functionally independent -- different drivers, different firmware, different DT
nodes. So the brcmfmac line is not relevant to debugging Bluetooth issues.

If the Bluetooth part has some dependency (pinconf, reset pin, clock, regulator,
etc.), then such dependency must be declared specifically for the Bluetooth in
the DT. Those seem to be correct, so maybe the issue is the maximum UART
frequency, if the signal integrity is marginal. Have you tried reducing that?

Regards,
Samuel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
