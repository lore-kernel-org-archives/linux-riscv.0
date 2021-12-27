Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD560C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Dec 2021 17:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:Cc:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f+9WF7JZsX5EkySSYY+uU+/esriDItqOCh0YfX/V390=; b=KWBp+lS9MyU85yPxsfyjMfl3yZ
	vMmTl874tc8EmJgke2Zqfo8VWR+DP9X+0zNfPn5oimAvGqBIpoSMap9bAqvf7a0Ruwo+sovCUpXZ+
	JfVJ64XSXicP5L0B/UBKwznpQ4KS4OqFzpLTH3NwXs8P1rvd3AAhGjIdf1lOwsvFLG1KsiQN+o+D8
	Jf8x+ze50dRLSkZ0fTwUHCwiMPVkdtZSlsRRE3ashDWJAb7NUrFj1YA+1V+o+OJRUm6T2FFJxd4mu
	Vc/4wAH/2fN6tH6KTLa5PxY6gBfih+cFyi8qHU6R0DIkxGTA4aawSrxcf5upoIVcMdyf8SU6jZmGu
	cNoD9TXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1u7K-00HAOq-2m; Mon, 27 Dec 2021 17:49:02 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1u7H-00HANi-Al
 for linux-riscv@lists.infradead.org; Mon, 27 Dec 2021 17:49:00 +0000
Received: by mail-oi1-x232.google.com with SMTP id i9so18144914oih.4
 for <linux-riscv@lists.infradead.org>; Mon, 27 Dec 2021 09:48:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pEDTSevr8Wui7/9Ib0ms0N7Elw3SuXo4ylecnWyhlSo=;
 b=ehv/beOOjVHY0/sgKdcpY8YzavbZDivcQVdBoIeoRKI4qC8EayE8VBARAwiSsJBeMg
 Zz3lXu+y9k2nNSuIlCNv/KXJeQUZt+jBe9GlImPC6RkELaI4OwGtotJ8lJT4/RYUvXeg
 5Yx++5EIDR1wB7QuoetS4tNem0svdSDSCecLUq4Nl5eBOUOKs2Gs+UisJK8zu7iYw2pq
 PcDsXaJJl8yT+sBrdf2ZMSprNPKxdo/1kTE/fvwlcME88l50Ds0vKqwzoH4bPkfvnAPw
 BW+JRWfrn/ItjQte78Dwgt8Dko2eYYW3nLA+EyqURprwTeFBH4+RkctBrk7LJGBiMFCC
 vwig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pEDTSevr8Wui7/9Ib0ms0N7Elw3SuXo4ylecnWyhlSo=;
 b=y7Mfn8YF56ksoLxRioEydFhG+IpJewaIrCiC86GNKJkcLOCEYOFwFMOcuSyKO8NvyJ
 qtMRh0jneVH5PMpAvByZqQ+JWrNYCensvbZbh/aQvFwqlAw8/ptL4ZHlGVlBb+Iyb0rC
 QCVNZ19aSsRYLsKNSGCyM4exIvvBfTwdzo91eM/U4bEiWTXmPoOvhWtVS/uK/j7ee9jr
 DnQ0djdtFUXjPJziqSVx/NkD7heH0fbsgdxaWChFHcQ83MCcg4TruvHzzh1NS9lSwano
 V7V6i+UGJATJT+ggHdrkaqvWI36BNjZKKJi6zKeCQpw3Vde77j9wHv3mQ+dNc+8lzEM4
 pPxw==
X-Gm-Message-State: AOAM532mjN1Ufg8QJ71pzWKD4/qpmazxAe8eQ4jfKIzb+prQDSsOl7Cy
 brFMq5S55Yhrlyori672TWA=
X-Google-Smtp-Source: ABdhPJxb6+7biAtxOQefdtgXxvyx2b2YNDyhmSemqV7yYJxoDKcbxu7R4xufBgYDTWnPfrrEWMwb0g==
X-Received: by 2002:a05:6808:20a6:: with SMTP id
 s38mr14781112oiw.152.1640627337723; 
 Mon, 27 Dec 2021 09:48:57 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 23sm2931424oty.6.2021.12.27.09.48.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Dec 2021 09:48:57 -0800 (PST)
To: Niklas Schnelle <schnelle@linux.ibm.com>, Arnd Bergmann
 <arnd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 John Garry <john.garry@huawei.com>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Ian Abbott <abbotti@mev.co.uk>,
 H Hartley Sweeten <hsweeten@visionengravers.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Jean Delvare <jdelvare@suse.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Karsten Keil <isdn@linux-pingi.de>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sathya Prakash <sathya.prakash@broadcom.com>,
 Sreekanth Reddy <sreekanth.reddy@broadcom.com>,
 Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>,
 Michael Grzeschik <m.grzeschik@pengutronix.de>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>, Kalle Valo <kvalo@kernel.org>,
 Jouni Malinen <j@w1.fi>, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Hannes Reinecke <hare@suse.com>, Kashyap Desai <kashyap.desai@broadcom.com>,
 Sumit Saxena <sumit.saxena@broadcom.com>,
 Shivasharan S <shivasharan.srikanteshwara@broadcom.com>,
 Nilesh Javali <njavali@marvell.com>, GR-QLogic-Storage-Upstream@marvell.com,
 Mark Brown <broonie@kernel.org>, Sudip Mukherjee
 <sudipm.mukherjee@gmail.com>, Teddy Wang <teddy.wang@siliconmotion.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Forest Bond <forest@alittletooquiet.net>, Jiri Slaby <jirislaby@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-input@vger.kernel.org,
 netdev@vger.kernel.org, linux-media@vger.kernel.org,
 MPT-FusionLinux.pdl@broadcom.com, linux-scsi@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-wireless@vger.kernel.org,
 megaraidlinux.pdl@broadcom.com, linux-spi@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-serial@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-watchdog@vger.kernel.org, alsa-devel@alsa-project.org
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
 <20211227164317.4146918-2-schnelle@linux.ibm.com>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [RFC 01/32] Kconfig: introduce and depend on LEGACY_PCI
Message-ID: <281298ec-3898-9b02-1d92-66bf6df41170@roeck-us.net>
Date: Mon, 27 Dec 2021 09:48:50 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211227164317.4146918-2-schnelle@linux.ibm.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211227_094859_421035_25F474D3 
X-CRM114-Status: GOOD (  17.54  )
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

On 12/27/21 8:42 AM, Niklas Schnelle wrote:
> Introduce a new LEGACY_PCI Kconfig option which gates support for legacy
> PCI devices including those attached to a PCI-to-PCI Express bridge and
> PCI Express devices using legacy I/O spaces. Note that this is different
> from non PCI uses of I/O ports such as by ACPI.
> 
> Add dependencies on LEGACY_PCI for all PCI drivers which only target
> legacy PCI devices and ifdef legacy PCI specific functions in ata
> handling.
> 

This effectively disables all default configurations which now depend
on CONFIG_LEGACY_PCI. Yet, I don't see CONFIG_LEGACY_PCI added to
configuration files which explicitly enable any of the affected
configurations. Is that on purpose ? If so, I think it should at least
be mentioned in the commit description. However, I think it would be
more appropriate to either delete all affected configuration flags from
the affected configuration files, or to add CONFIG_LEGACY_PCI=y to those
files.

Guenter

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
