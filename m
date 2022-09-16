Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD5BECAAD8
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Sep 2022 16:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TvKOw7nIhyrV16ABTwBQEui/2n5KJKHyvnpU55FFAKk=; b=tfV3pEibBiLseU
	Ow3EQVUBAbjYFRR0g/aRZRHvPLZzUanVjAwiFChhr3WElEjvaqvIqJ0LgPypvfXR6+RhbCd8RN+Nn
	2eF6k4faMQxVMRyqzixo22Ojw1XY2Fi7QzpN2DjaF3UkqjafPxQ6b5iWdnWT7k/+IYXDPbWUqmlVz
	niumY6mBuVkwMuAjbrYoPHEbgdVwDcx7TNyAc8dWZ41hWf3nXdU1hfxROycb1aJ1r2zXL6MO+iY/Z
	K+SFwa2n20aA63iMSWC5yIzQ6uUxo261jpa7SfkMS7ngoaVBlr3mHtnmObIAzkY1yieQ06d8QAj61
	xbLTV0+hwlTOziDcAfZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZECu-00F19y-PU; Fri, 16 Sep 2022 16:28:48 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZECr-00F18M-7b
	for linux-riscv@lists.infradead.org; Fri, 16 Sep 2022 16:28:47 +0000
Received: by mail-pj1-x1032.google.com with SMTP id s14-20020a17090a6e4e00b0020057c70943so199125pjm.1
        for <linux-riscv@lists.infradead.org>; Fri, 16 Sep 2022 09:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=Yuo6+cdkzpbtvDqxmCi4dS+f4ldcDL0jhsTFqbGT6Zg=;
        b=AZnn0bm7v9VrAGIqi0cZog9gB1fZPBmiBz5bgTsc4qpivvqHwktAJJZLu8kunxu+Tt
         TtlXzw9bNgd92FQEoutvuMOqvC2fi84q5x0DmzM32sKMm/6Qb14t8z6gQ+071EyA6aBX
         p4eeYERfTUjhUJ/MIBSqwiQpCoUdHqYWMxzfNMtXW/k2rIxES+TtiFR2W5i2q4P9EM4h
         lmcP18faVMsoB8f3dTXfzd6+BlcvJrPikwz/3zo4VQsEq/9lsT9uUTtsqKUl0ZA++Hop
         ixrVwkJ3WBEvPyf4OARJS+7XxUXsl1nuD+M+LMRRkVeszrV4nQu2fRCjmzEN6L9AWKeb
         7PrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Yuo6+cdkzpbtvDqxmCi4dS+f4ldcDL0jhsTFqbGT6Zg=;
        b=R3Qar1OpslFrYDM8eM+KSxl9hH7gMvPaa0V+CB6tfim8F3YRIGeF7qxz1Y8P8AhBua
         Ncc2HODRAV/DdJwuZWYV6m5WSvx7gIks32P+mSh9Oof8vZW8m6mIOL5la5HzaLYa9hx4
         MNP+ptHRKLQFaga5ghkUmJmjutSLfxJ5JQu82aRJJvqgG3vop7qzLyR3DsBE5fhA2wUX
         MK2XZR6GrOKtEbeXQKlPk57VsICCXItbtupo5GAjCe+5FEgNfVKzO+A0lAtBtwviM8LI
         r88evKre8gR63NS68v0VVRJ3gUWXlNxoKp/dWifRdJybR0Tk9NgzaazPOY+6gaKiC4CK
         /unQ==
X-Gm-Message-State: ACrzQf0rCC4sPBs13+MtXSPsKBAwan5dA5qk9Iy3RlxljLnp5gT/F1df
	oFIAhOaG0nDrSnivhE9+2je0dL9/Y99Ml12F
X-Google-Smtp-Source: AMsMyM72ED8ZzC6JbgRFl+31ZVja5BhZrsH/70T4xMBkWdMiLzJ5TL9IGhGG5lH6skvbJG2SNM4Xhw==
X-Received: by 2002:a17:902:ea11:b0:176:b283:9596 with SMTP id s17-20020a170902ea1100b00176b2839596mr604676plg.69.1663345723538;
        Fri, 16 Sep 2022 09:28:43 -0700 (PDT)
Received: from [192.168.50.116] (c-24-4-73-83.hsd1.ca.comcast.net. [24.4.73.83])
        by smtp.gmail.com with ESMTPSA id h16-20020a17090adb9000b001f5513f6fb9sm1740742pjv.14.2022.09.16.09.28.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Sep 2022 09:28:43 -0700 (PDT)
Message-ID: <adf840d4-b5f1-4b1f-faac-d735465028e9@rivosinc.com>
Date: Fri, 16 Sep 2022 09:28:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] riscv: ztso: disallow elf binaries needing TSO
Content-Language: en-US
To: Conor.Dooley@microchip.com, linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, palmer@rivosinc.com,
 cmuellner@ventanamicro.com, linux@rivosinc.com
References: <20220916030552.1396820-1-vineetg@rivosinc.com>
 <20220916042331.1398823-1-vineetg@rivosinc.com>
 <67a3aba3-68bb-5e8b-4e4e-869c8e99e879@microchip.com>
 <9b9ff287-75e5-3ee5-e6c5-1daca6c562dc@microchip.com>
From: Vineet Gupta <vineetg@rivosinc.com>
In-Reply-To: <9b9ff287-75e5-3ee5-e6c5-1daca6c562dc@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220916_092845_316126_715A097D 
X-CRM114-Status: UNSURE (   9.99  )
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



On 9/15/22 23:58, Conor.Dooley@microchip.com wrote:
> Also, since this is not marked as a fix, why would we not just apply the
> patchset from Palmer that looks like a more complete version of this
> patch:
> https://lore.kernel.org/linux-riscv/20220902034352.8825-1-palmer@rivosinc.com/
>
> Maybe you could offer an R-b or some comments on that patch instead?

Sure I didn't know about that patch and my idea was just to get the ball 
rolling so tooling at least can start having tso bits as last time 
around that was the blocker to getting stuff in binutils and gcc etc.

-Vineet

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
