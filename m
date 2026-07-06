Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9AB7C44500
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 13:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MU+m/+R3a75meFJFyGn7FqE0adWRHaZgwAQ0e0PPvpg=; b=2yTFMvmQBP4dRt
	1MqgRDcaXqIbsuu4rg7+Zq2g05X6ZrlIfa9SaaCQ7XxCz+Avhbc7UZpZVk4VWV+xWgiIxCAB9TNlU
	AE/AA8EXPRRkQefSPG9jHoTdnqKMjOJyR8nt00vsllcb4L9tIpNv6yxJCTwxCxRMDPX0pA43GKFwL
	xOBbNcz9ky1w67y7YKxJTU8qHLt7MWyI+qHUqntjp6nF8wXHOFct2lFkXQfI/wPBYmXCDFJplrpx4
	TSy9sjZHrgOnvAA20NMWDFAedXIQkUnqIrCZbU5OvvSAUH8Ticc8K4OgbkzUbPgG1A8NiQ20Q28ca
	E4UuLcSFExpVguEZ2l0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgjSf-0000000CbyR-40VO;
	Mon, 06 Jul 2026 13:34:13 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgjSd-0000000Cbx3-3nwo
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jul 2026 13:34:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783344850;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3IUhPhmdKFY/hvP+RYH3Pc2WHx3JLJjsr6cul6j9Vdw=;
	b=YxSC6EbQRyassKLh4zE3VIKFri+ZHEXE43B1tHD4Gc0/FH14gZOsUmi42cSPBJtyk7z35l
	QXRFcto8ZzOVQ8kpJfUKkAe0m47ZkGIiKBZjxwy/cnkDymS0+sJhMQT4T9lyvFj83kmA9/
	zWBBX7CGhPVTsr9Weo9651PcGP8efeY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-533-rYLIARHjMcGDO-ip1PSqVQ-1; Mon, 06 Jul 2026 09:34:09 -0400
X-MC-Unique: rYLIARHjMcGDO-ip1PSqVQ-1
X-Mimecast-MFC-AGG-ID: rYLIARHjMcGDO-ip1PSqVQ_1783344848
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-493bb6a4336so26862405e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 06 Jul 2026 06:34:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783344848; x=1783949648;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3IUhPhmdKFY/hvP+RYH3Pc2WHx3JLJjsr6cul6j9Vdw=;
        b=h3MA1PgCKW3KkJj6v+MBQFOzGP8ccdleF/Ul0/FrSOd059F823Ae2Ru2tv5m6dcgGB
         opr5Pe8ZPP9gpfRrjLQ1g37KpQJ5KtiHosTdqyeIJ6WZt5+fXELMbaL5LDA/FQeD5yuL
         Gpybp29EeecaMObzxDPANq905GHF/1PW0uTghThQpmeu0lPYtYDZFzAC37dhMbbWnWA9
         BXk33q1kudNvS0dRYic1TtIsV1swqyiEPZIgk/IB3TTWMb5MHtP4uNVDTd8iRXwyRHPy
         iFR/0IHyvrPWBgzDgFTmlU7OQgBRYL89iEJTBkWayWM8qrprwd7sM6ZvhHdlJoMcw5aw
         FAbQ==
X-Forwarded-Encrypted: i=1; AHgh+Rro0qtfSPrBmsY7B1wybXjGx0jSDMeR8HKAHKQ+o+pIfYtVcS0Uql7yMntJxLOgxt5n/H4tu8kh/UvlUw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyqWjl/Ec0Bhdtp8yWv06ZTEd3jQ8N32f+dLLcv26Gzi05K57qI
	msi1MHbLC49tNSEQm3xKwdETYAFYgnkUHdQp5z53rI3yQki+GxgCSwZINlRSBqFhAMJD4mvF+AM
	a5tZyp0bmAExE2koROZqk30I3lwkxLhtGHXPt61XguIKbreoUllvYc6eZfgfef3TLMwcNHQ==
X-Gm-Gg: AfdE7cl7UJ5UIM9vPzWdwUcCKO4pYsw0hW59XnU/IPfBgembjLQ33RT+qynHpvxUAeq
	uLhqg1WR50anQKtJhLBdfebwxwn28rTfWeHexMgo/y93/fvZVcok2zWCLDM6grOOmypa2al1glf
	2ODtuQ0VLHKhfCJoc/pDMD3aqrGV+WQYDT/V381wt5v35IxJ2X5yYWO1LOCAaDZkRQrFwwIKC4g
	acpqS78ot+wi0t6hE99GF7tjJk017WaL7MGqRUCaeikdvj7ydO7McYZ6y3cqRExgaFX6P1Na8js
	CbcOfGiZow7Eny9aLOBVQ6VdPyvP34MuW5evhh8ivgnH1c+kSBZJRM6djpZ9ESuQv8+sMifUPK+
	HCTt6Tp2l9tfGCY1vduuy8eRRK/7S1lI29XKNLnICKO4j0kgYQZWgWBnNDHaHrcrv+fnLJqqHHo
	bh7BDulyKKHHI5
X-Received: by 2002:a05:600c:6085:b0:493:bc97:916b with SMTP id 5b1f17b1804b1-493df0929f2mr5699425e9.26.1783344847658;
        Mon, 06 Jul 2026 06:34:07 -0700 (PDT)
X-Received: by 2002:a05:600c:6085:b0:493:bc97:916b with SMTP id 5b1f17b1804b1-493df0929f2mr5698905e9.26.1783344847212;
        Mon, 06 Jul 2026 06:34:07 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:5521:6b10:58fd:68f:7756:389d? ([2a0d:3344:5521:6b10:58fd:68f:7756:389d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ccd9d607sm357583515e9.2.2026.07.06.06.34.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 06:34:06 -0700 (PDT)
Message-ID: <b95dda96-ee50-449c-9d23-3de490d3ab1f@redhat.com>
Date: Mon, 6 Jul 2026 15:34:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v9 6/6] riscv: dts: eswin:
 eic7700-hifive-premier-p550: enable Ethernet controller
To: Conor Dooley <conor@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 ningyu@eswincomputing.com, linmin@eswincomputing.com,
 alexandre.torgue@foss.st.com, mcoquelin.stm32@gmail.com,
 pinkesh.vaghela@einfochips.com, pritesh.patel@einfochips.com,
 maxime.chevallier@bootlin.com, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, pjw@kernel.org, weishangjuan@eswincomputing.com,
 horms@kernel.org, alex@ghiti.fr, lee@kernel.org, wens@kernel.org,
 lizhi2@eswincomputing.com, devicetree@vger.kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, netdev@vger.kernel.org, rmk+kernel@armlinux.org.uk,
 aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org
References: <20260630063123.1118-1-lizhi2@eswincomputing.com>
 <20260630063445.1226-1-lizhi2@eswincomputing.com>
 <8e5eb97d-dfaf-47a1-8572-b3252a2c7ed3@redhat.com>
 <20260706-confess-dagger-e60b5fad57e8@spud>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260706-confess-dagger-e60b5fad57e8@spud>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kxltZ8s7wJiklFWvzsAc7H7x62fOa1N34ok8Kf1TGuw_1783344848
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_063412_028149_D3D2BF41 
X-CRM114-Status: GOOD (  14.11  )
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

On 7/6/26 3:21 PM, Conor Dooley wrote:
> On Mon, Jul 06, 2026 at 03:09:37PM +0200, Paolo Abeni wrote:
>> On 6/30/26 8:34 AM, lizhi2@eswincomputing.com wrote:
>>> From: Zhi Li <lizhi2@eswincomputing.com>
>>>
>>> Enable the on-board Gigabit Ethernet controller on the
>>> HiFive Premier P550 development board.
>>>
>>> This patch is included only to provide the DTS context for reviewing the
>>> binding and driver changes in this series.
>>>
>>> The upstream DTS series will be submitted separately after the binding
>>> and driver changes are finalized.
>>>
>>> Signed-off-by: Zhi Li <lizhi2@eswincomputing.com>
>>
>> @Rob, Krzysztof, Conor: I see this patch is not listed in the devicetree
>> PW, but I think it needs explicit acks from relevant SMEs. Could you
>> please have a look?
> 
> We do not typical provide tags from dts patches, but that's irrelevant
> for you, because this (and effectively all other dts) patch(es) should
> not go through the net tree to begin with.
> Instead, the platform maintainers should review and/or apply it.
> 
> Additionally, it seems the contributor's commit message suggests
> that they didn't intend this patch to be applied at all?

Thanks for the head-up.

I noticed a bit too late that part of the discussion about this patch
did not land on the netdev ML; a new revision is expected.

/P


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
