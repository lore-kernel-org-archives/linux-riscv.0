Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B24C4ECAAD3
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Sep 2022 10:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wGxeE/oV4iulftUjudYMKrGbCIHIr4owqIYOZIjVpz0=; b=fg4HO9IqZq9hyA
	YYD/3ySk4Rm/VVI68lYe0iU70Vy6pZcE6hebwsbKYHm/ySsisYJlKgsnJEaSTps9Y9Eq7/fQc3k3q
	lGC+AzN0nEryoRZutF6Yg1T41jF+0QVDlt9fKn4UzfM0JiA/Mo8LsJPdE5NZmmBgUu4Pg+JXGMuyT
	POCtVVb63AXSbmvi4Uw2Rda9Uh5FM/vHN8aR5v66RcRoVAvoAortA5vQ8hqaGhP2ifSBQS29urmw7
	h66wsDDC0Q2FvH/cmXZxNtMPbkmCNgVXn5BPpSid895NQgpntQWRozAd8EGHquIlvJ1IJuZMI439b
	YhbN90deSNcgB85iKtjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWbdH-00FUxy-Qu; Fri, 09 Sep 2022 10:53:11 +0000
Received: from mail-ej1-f50.google.com ([209.85.218.50])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWbdF-00FUvt-CY
	for linux-riscv@lists.infradead.org; Fri, 09 Sep 2022 10:53:10 +0000
Received: by mail-ej1-f50.google.com with SMTP id r17so3043499ejy.9
        for <linux-riscv@lists.infradead.org>; Fri, 09 Sep 2022 03:53:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=GagilPxqP4vgEIRQpipTIIkrScgT2/c3h/h3daNSK+w=;
        b=m8c6Hf9SPZZcTIkhsn0thN/Var999DF7A/JoqEANMPEFPT72C46Y57JrCMVzDLV4MO
         hauVbP3xI2Mm9A7LT4RIRGXZ+js+9yvNv8++Fo8cEurobyK09EUm5X+SjR2Pq7paRsWp
         pkYxynHoHcm1XtwbGFT6LNVOqpg35l829Coadbngw74S7QGKVf0JKOEUHxt3nBpfuoci
         2C/yf/GOBpzp7ztzRq6jNrRhv92gvm787EihaKxGTN3fO8kl8lnW1mXyPHPrJ6dlHKcH
         PP4sUhgJm/bAqPgz4rUL6k2dg/vmhG27Skv2twkzx7Zho8vGU/aZbr9MriWQgoRkhBy/
         bVQw==
X-Gm-Message-State: ACgBeo31OoA+7a4ptClL056ZUhTBw4FX3YAfKAuZdnLC1jKiSlvw4fKR
	VrHuzNdHH8QSgqMAaQqmDxY=
X-Google-Smtp-Source: AA6agR4fWzrV6e43ghxyalL9bTe1slmh2rP02W0tqiS9UAizobs3euQ103aK9hHmJBRyrcdcbEb0kQ==
X-Received: by 2002:a17:907:75f5:b0:77a:7a93:feb4 with SMTP id jz21-20020a17090775f500b0077a7a93feb4mr103503ejc.582.1662720787030;
        Fri, 09 Sep 2022 03:53:07 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
        by smtp.gmail.com with ESMTPSA id ky21-20020a170907779500b007707e4d1835sm138549ejc.10.2022.09.09.03.53.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 03:53:06 -0700 (PDT)
Message-ID: <5feff23c-9458-616c-66ce-13cca5829162@kernel.org>
Date: Fri, 9 Sep 2022 12:53:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v3 0/4] tty: TX helpers
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Johan Hovold <johan@kernel.org>, linux-serial
 <linux-serial@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Tobias Klauser <tklauser@distanz.ch>,
 Richard Genoud <richard.genoud@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com, =?UTF-8?Q?Pali_Roh=c3=a1r?=
 <pali@kernel.org>, Kevin Cernekee <cernekee@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang7@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 linux-riscv@lists.infradead.org
References: <20220906104805.23211-1-jslaby@suse.cz>
 <Yxcvbk281f/vy4vb@hovoldconsulting.com>
 <dec6d5c4-45b7-f087-95f4-bf1dae9e9d27@kernel.org>
 <4e9b4471-a6f2-4b16-d830-67d253ae4e6a@linux.intel.com>
 <715b40ba-1bcc-4582-bed1-ef41126c7b94@www.fastmail.com>
 <cfd16d53-6aa0-e848-91d0-dce8ff72bb4d@linux.intel.com>
 <YxiONiDgGYp8MGQA@kroah.com>
 <c66f9c98-dcef-27c-d74a-ea826f6a799@linux.intel.com>
 <YxiQVTN/jX8AfO4L@kroah.com> <YxiiOWQxGCUz9ktF@shell.armlinux.org.uk>
 <2197faa3-0217-41e0-8ff0-b5396561c623@www.fastmail.com>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <2197faa3-0217-41e0-8ff0-b5396561c623@www.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220909_035309_462404_53ACB742 
X-CRM114-Status: GOOD (  22.79  )
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

On 07. 09. 22, 16:56, Arnd Bergmann wrote:
> On Wed, Sep 7, 2022, at 3:52 PM, Russell King (Oracle) wrote:
>> On Wed, Sep 07, 2022 at 02:36:37PM +0200, Greg Kroah-Hartman wrote:
>>
>> Of course, it would have been nicer to see the definition of this
>> macro, because then we can understand what the "ch" argument is to
>> this macro, and how that relates to the macro argument that is
>> shown in the example as a writel().
> 
> I pulled out the 'ch' variable from the macro to avoid having
> the macro define local variables that are then passed to the
> inner expressions.

Note that I had "port" and "ch" as a part of the macro parameters in 
[v2], but it didn't help the situation much.
>> Maybe a more complete example would help clear up the confusion?
>> Arnd?
> 
> Here is a patch on top of the series that would implement the
> uart_port_tx_helper_limited() and uart_port_tx_helper()
> macros that can be used directly from drivers in place of defining
> local functions, with the (alphabetically) first two drivers
> converted to that.

If there are no objections, I will push the patches this directorin. I 
like this more than [v2] or [v3] (the helper macros). Actually, I 
mentioned this wait_event() style in [v1], but I perhaps simplified the 
concept too much to completely eliminate the need of a wrapper function. 
And that made it too complicated/too hard to understand.

Except I'd drop the "_helper" part from the name. Originally (in [v1]), 
I had uart_port_tx() and uart_port_tx_limited() functions. In [v2+v3], I 
added _helper to avoid confusion as we were generating a helpers using 
the macros. Yes, technically, uart_port_tx() is still a helper, but I 
think it's superfluous to have it in the name now.

thanks,
-- 
js
suse labs


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
