Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 356D2C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Apr 2022 16:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h2aBinYej+Zs+JT9y1v6O/Qe48sH6yPrxPVaQYDG9u0=; b=IwOcEP3LkAQ68c
	zbY1rC+vJhhg+tbN0JCWJtuw5bQRkZOBuvnTQj6slda+0YumrJn7SeBj1Aztqk8PJYUFhKnKISGpt
	DJyd8YW0hEpkC5RzzTsMiHqWr+1UxBaECmLGJp2Orbn7D64S2RGNEhdN4HOcQlIzvvKj26wmI4oi0
	fSQu4XQnN/84BT4/p/eJ17ceUVWQ7chTTmY5zLDdwnR8ur2rkq0BzfLZib2X9+pbkSZrJhSQxWxx5
	d5R+5nonlXW0bqbZQgTlFKvzfXqNQwYrWPrYXbKgbCXBwyUunPvTQtMZzExVKIm8RXJ0idRcnk3pz
	XU4MXgoB8pyZ7ZiWG4pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbm02-001wQA-1d; Tue, 05 Apr 2022 16:25:46 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nblzM-001wAH-1b
 for linux-riscv@lists.infradead.org; Tue, 05 Apr 2022 16:25:05 +0000
Received: by mail-wm1-x335.google.com with SMTP id
 123-20020a1c1981000000b0038b3616a71aso2008585wmz.4
 for <linux-riscv@lists.infradead.org>; Tue, 05 Apr 2022 09:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=conchuod-ie.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ybM1oCgaQ6WD2vVarbV8uyDpv+y4wNMKY2GnbiDx1ys=;
 b=iUzJ18LSJr94o1SYCzAKEY/3mvZG9wDX3oYuKooiNWzh7cwaEYK5WhNkRy4JQmy+/j
 e5SmAe22772WpKlSJ4JGRexJgxyYmcoQr3YlJuZzHt197iE2fstRtltwN28TLuGNTCi0
 asSSxjT07yk1Lj9FKXCb9jAPZS5kd1nEYEz5IlegDMEU4W2JphwvHUGdvo0JLsWEHHMv
 s7GQwkpq74OmCLEHthsDyjUuvM0Zfd5VJa5lvLCOHuQ3d09DLHx1yLvYiFF9hEC5oTfr
 fFQ7lslM0DOse7WLRS4/PW3BpxEsBYEAcP2C1xXFz08b2m1fb7z6hA25qM3Xw3PQwpw5
 2nww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ybM1oCgaQ6WD2vVarbV8uyDpv+y4wNMKY2GnbiDx1ys=;
 b=tx5vwQcMmo8lKyfhuVItsmQsSaln3tHEWGuRx/IUQN+F45Ze8ywMi23lfX9hzzxe7B
 9tsihoTls2IS75hw9qzGWjR2K8JU9YPSliXA1jAo1mAkBfUX+8Qm11jJ9HZFYNT3H/Sr
 JPdWP9hMcQfsep3/dxpzRPo2fslVDwsktd96IK5D4rpAh0BWi8oxgH8EuFEi9ZuKRLC6
 TK9P8flSwEG6a34Y0I6UZugaLrOqYiJod66yuVsNtmgeob74mkZSIlcqT6O3DTdRQO2X
 /X1qKl4OBWWHDknZrNWdHNvixS+GcgNOrphJNAfBXPXUck8lRF6aWct9VzmyG6En0hVQ
 zSwA==
X-Gm-Message-State: AOAM531c8Gi82AKQpkFFa0uHETx8Z7wXaHdKfDpYKPC8musHutGIDUt2
 sgEq7+SvTTZaa6csvvs/KEwGaw==
X-Google-Smtp-Source: ABdhPJx2ILdCbJslprkvQZegnhsn312OtIarZbS5ZGmQlPb0fPsLfa0HO8G5JR0Jb61WhaLBmXPiog==
X-Received: by 2002:a05:600c:4611:b0:389:9f47:30cd with SMTP id
 m17-20020a05600c461100b003899f4730cdmr3606782wmo.185.1649175901021; 
 Tue, 05 Apr 2022 09:25:01 -0700 (PDT)
Received: from [192.168.2.116] ([51.37.209.28])
 by smtp.gmail.com with ESMTPSA id
 c7-20020a5d4f07000000b00203db8f13c6sm12672854wru.75.2022.04.05.09.24.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Apr 2022 09:25:00 -0700 (PDT)
Message-ID: <e445af29-4354-69c3-fa9a-c5b99d90a9a5@conchuod.ie>
Date: Tue, 5 Apr 2022 17:25:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: riscv defconfig CONFIG_PM/macb/generic PHY regression in v5.18-rc1
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>, Conor.Dooley@microchip.com
Cc: palmer@rivosinc.com, apatel@ventanamicro.com, netdev@vger.kernel.org,
 Nicolas.Ferre@microchip.com, Claudiu.Beznea@microchip.com,
 linux@armlinux.org.uk, hkallweit1@gmail.com, linux-riscv@lists.infradead.org
References: <9f4b057d-1985-5fd3-65c0-f944161c7792@microchip.com>
 <YkxaiEbHwduhS2+p@lunn.ch>
From: Conor Dooley <mail@conchuod.ie>
In-Reply-To: <YkxaiEbHwduhS2+p@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_092504_350075_6F3D2E1A 
X-CRM114-Status: UNSURE (   9.45  )
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

On 05/04/2022 16:04, Andrew Lunn wrote:
>> [ 2.818894] macb 20112000.ethernet eth0: PHY [20112000.ethernet-ffffffff:09] driver [Generic PHY] (irq=POLL)
>> [ 2.828915] macb 20112000.ethernet eth0: configuring for phy/sgmii link mode
>> [11.045411] macb 20112000.ethernet eth0: Link is Up - 1Gbps/Full - flow control off
>> [11.053247] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
> 
> You have a multi-part link. You need that the PHY reports the line
> side is up. Put some printk in genphy_update_link() and look at
> phydev->link. You also need that the SGMII link between the PHY and
> the SoC is up. That is a bit harder to see, but try adding #define
> DEBUG at the top of phylink.c and phy.c so you get additional debug
> prints for the state machines.

Sure, will give it a go tomorrow.

> 
>         Andrew
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
