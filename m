Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CDD0EDEBFD
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Mar 2026 01:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=19wky6pAbHEtbGp9JqfeHB1FYJ+Bqif36mtnz5+36Gw=; b=nxqSnBbRyPrAKm
	/pQpcla+ozxCfMHYHDRWu4TFaVszVGefqesldtvHde6ZibtG1pQoEQ7g44ZOZ+Y2ezU6AiO+KP/dF
	0PYd40sCbDLg7Gjxpz6N5ejv+qEI7xG1ADa0pQtJGjZEnh6/plErc/CihpHsRBd0b5PRedagDg3pB
	YiNko4PQ97LvBYKgXmiGM7ddGWrBwVdkD4eW/+CcxXhjQtlCrKf88dx5Sf94tDrfIw4/qMeYK4F9h
	FRl94UKRXSKN2njSW4wFJPP2Wq41is9BKHhzsvZcCS4sfZisHXNjt/5zU7CMmKvK6W/hplxLO2Uh/
	P7jPrGFu/cVO7aBZEUmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxatV-0000000GEBC-0JW7;
	Wed, 04 Mar 2026 01:19:21 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxatS-0000000GEAR-1xZy
	for linux-riscv@lists.infradead.org;
	Wed, 04 Mar 2026 01:19:20 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-2bdd80beee1so2020901eec.1
        for <linux-riscv@lists.infradead.org>; Tue, 03 Mar 2026 17:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772587157; x=1773191957; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gvvy8mrMhzjULjG/waJaGKSbWOymXRI0aiNwOWuVKAk=;
        b=dRY9IU2N6YPyA1q5Q2m7eDSFAdKKsczNoJ4/urOrzOO479JBlYinzQbqzI9R/TMCxA
         J5viv+NgJa8wix+IjqEixi1aLhymAbbKqYmpuOpzAGg5zZojWWxjMqZiecRHiibKDv+C
         m3oMv2OhFp7mxsJzBC5pigvMHkcHh+7P5Wd9W87cVQfzmguBk2+L3/MmN18wfZ2XXV/u
         7jDSfYv5YBkA1U6fh0BgNHb7Elip91d3dPkCoGWKzpyo/2UiDeoJ4QzGqkf63qwynauD
         sVIKAMSUgTFVqi5OiPchLy9QekrKOqP+RIqz7EveseY5pFPWooGOtxo1DZVXcotb1SqA
         4Vug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772587157; x=1773191957;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gvvy8mrMhzjULjG/waJaGKSbWOymXRI0aiNwOWuVKAk=;
        b=FAlHebx+ziFNgPgaihJZH1lDQu17kuoOZjS7NPkTXIhfd5sx4D4cB/CQW9wS6u/7G3
         WupvjI2mw4v24Xw03RpzOWYa0IGy9rZga6E08fuJivzwkBz1k1DMsB0Bh2q24Jhy/DQS
         1blxNlezEQoQxg8VpZgvsr2+TONlVlntV8NlC3b72cswYD96B7T7E6wJnWpMZo0MS2XE
         Tp6eog3xyT4r22k352Lac3wvxbHZMqJ4kTObS7Z5opGC9XTl1Qrv4T4aBhgfDgsZXVRA
         1nNbJMXJgSW02j8W1QsF+dmpEX5kg6NXphEaikUHSSsdvX3IC42hV1PPUpxzscIWQAFP
         J9Mw==
X-Forwarded-Encrypted: i=1; AJvYcCU48jndDf/kpOwGjb35red6nyVviAWTull0y9Fy9ONGj+77InkqHjxKkGCKeE5t4RBdTF/z2KKhprvmcw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyG9qe2zGy1uh1d6E70IqvGlRkoG6CYWlnYewJIK+P2jTidz7KY
	bgjlYeolrOyQIap67Je3Rxk3c6vFmAAvUoyZS50bclkVG6nFjOSPjKvy
X-Gm-Gg: ATEYQzwpU+1n1xbblKYjnY/eLI/QjtloYJsoLx2xGFfJNIyLhaVevhl4naQk1d605Be
	h0YL4jjslcX492hNNPasMb5FJ49BinOobxXSiG1g+tKzPgjR5RZogbRguCnZJrPf2XDdMoqE4ew
	wCWBA0+rDZDmOrercSI5Q6Vzwl3+Zl/ac6WgkgrVYthrk06+MzTCciYO7eRXJt+jw6lC70MyuKI
	SDyuMQAc4/d4jDz64MjmNEcajxfu+dDipuzUcdRvqH5YluHYMEgogZN9DAx1+MeFu7ha0KFAVnt
	urQLDxpNyDDNzu+xoa/OxgAbWQBF7qdsi6WUquC7UciC+/mYRn5gmJbhrEcSXgOaBLflTukY5jv
	xKCz0f7hRbA4oua4dOA5dvM+py6ZRPco7GhDXlYswEIscbkfHK35HUjxkPytSJ2yeRl+lLfkQka
	Z5HTsO5u2mcvSYaR3F92/RMdimHNwZ8vX4L8gz2CtNx2x9pBI=
X-Received: by 2002:a05:7300:ac81:b0:2be:969:75f6 with SMTP id 5a478bee46e88-2be2344da48mr1494176eec.9.1772587157326;
        Tue, 03 Mar 2026 17:19:17 -0800 (PST)
Received: from [172.16.0.242] ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be0d7e0d40sm6999679eec.12.2026.03.03.17.19.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 17:19:16 -0800 (PST)
Message-ID: <05a15890-392c-41c3-9566-8eb506ddfe5f@gmail.com>
Date: Tue, 3 Mar 2026 17:23:18 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 1/3] dt-bindings: ethernet: eswin: add clock
 sampling control
To: Conor Dooley <conor@kernel.org>, Jakub Kicinski <kuba@kernel.org>
Cc: lizhi2@eswincomputing.com, devicetree@vger.kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 netdev@vger.kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk, wens@kernel.org,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 ningyu@eswincomputing.com, linmin@eswincomputing.com,
 pinkesh.vaghela@einfochips.com, pritesh.patel@einfochips.com,
 weishangjuan@eswincomputing.com
References: <20260303061525.846-1-lizhi2@eswincomputing.com>
 <20260303061637.872-1-lizhi2@eswincomputing.com>
 <20260303163846.156d18f7@kernel.org>
 <20260304-regulate-verdict-c3a361d2dc83@spud>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <20260304-regulate-verdict-c3a361d2dc83@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_171918_514076_B1210257 
X-CRM114-Status: GOOD (  14.09  )
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

Hi All,

On 3/3/26 16:47, Conor Dooley wrote:
> On Tue, Mar 03, 2026 at 04:38:46PM -0800, Jakub Kicinski wrote:
>> On Tue,  3 Mar 2026 14:16:37 +0800 lizhi2@eswincomputing.com wrote:
>>> There are currently no in-tree users of the EIC7700 Ethernet driver, so
>>> these changes are safe.
>>
>> What do you mean by this sentence? The commit under Fixes was part of
>> Linux v6.19 already.
> 
> The "funny" thing is that caring about users doesn't even really matter
> on the devicetree patch, except for this hunk:
> |@@ -81,7 +99,9 @@ properties:
> |                          or external clock selection
> |           - description: Offset of AXI clock controller Low-Power request
> |                          register
> |+          - description: Offset of register controlling TXD delay
> |           - description: Offset of register controlling TX/RX clock delay
> |+          - description: Offset of register controlling RXD delay
> |
> | required:
> |   - compatible
> And it only matters here because an item is injected mid-list. If this
> was moved to the end with the RXD delay, the **dt-binding** changes
> don't have issues with safety. I've not looked at whether there are
> knock-on concerns about users in the driver or whatever yet, but from a
> binding POV only that hunk can break something that currently works.

This was already discussed here in v1:
https://lore.kernel.org/lkml/e7183ae1-8b8b-4e77-9f4e-3bc1b4b63556@lunn.ch/

The device-tree is not checked in yet by ESWIN folks, so there's currently
no user of the dt-binding. No need to worry about backward compat.

> 
>>> Fixes: 888bd0eca93c ("dt-bindings: ethernet: eswin: Document for EIC7700 SoC")

Bo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
