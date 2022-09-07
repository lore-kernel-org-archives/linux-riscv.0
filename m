Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A0EBC38145
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Sep 2022 07:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4amK5Pw+lD/8SVj94xM9h/H0lTM+LsOfpVImM8Z/Xc4=; b=WwT0gzmPO5+MVc
	FmVu4dCO+iuWMrvVW7xvHLPi4iBdWGKEfibBqH+k7FYzSqbYUDH0ku5qkLjLz5QCuGAkKkk2NG4+a
	1b3BOPtzf3jojA7hZeZBku+8qhC+VSgh3NvS8QpIVuqX+mX5CTM6XKGLDTt0SmROyX0DEnjsRWO/x
	MtgHd8mzMDfSgV+M6JOsP5anzTvdplE70HxmAvqqcXSM/C7ES6xqwFJF6wul43xjtXYODscG9jr2b
	U9FtQ9fRsRuHuFoxDoTKkSEo4AM59cKr8OYmyHIJg1d5bbkOv0nSYbAKvdHa6/hBPrqRY5RvXW9zR
	JtHETlf+0A3kl9qdYofg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVpLT-003dOt-OH; Wed, 07 Sep 2022 07:19:35 +0000
Received: from mail-ed1-f52.google.com ([209.85.208.52])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVpLQ-003dLj-Sb
	for linux-riscv@lists.infradead.org; Wed, 07 Sep 2022 07:19:34 +0000
Received: by mail-ed1-f52.google.com with SMTP id u6so18272438eda.12
        for <linux-riscv@lists.infradead.org>; Wed, 07 Sep 2022 00:19:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=eDvuVooWlYd/7ooTWAPT8QHm6WSx0ZyUhFCklwIvD6g=;
        b=ttfvAWfaKnMr8vpeV+D35jTB1+4c+SMQq0JiH2Gtqavb0YjxmyGzCyfZA89q5bnLZF
         wdM7Hl//fKw6sXIt2rj4/vQ8B020mvePilFxSy1K7auYsrz4GyOGU3F7+jG7apuGLVIE
         K+WppW/AA4AY8MAS+L5aNWIou5hpPEnUpo9MQ2RVptgpC+hc3Ii0uznq2QhSWcEloPN0
         Lx41b2OjhoZDvUjlWAJaOqgsOpMLNifRDYcxII0cFzx6SaVC93KInGYG50bVtQj1TGOV
         jo1JlaqRObILoDf/kYZ5JtDpCEumxOZsN3opu+Bs6FQ+ELmu8LBkY05Dj5Mw8xN3WQH/
         X1ZQ==
X-Gm-Message-State: ACgBeo2j3p6E5dVJKgD7vNFQeQJoxelRpzIRxLy1LXL0kbO+rj27NPtc
	p1iCWfAwlcuXHfSMu9nFu47JM8VP3Yg=
X-Google-Smtp-Source: AA6agR4b6OMs7NVyOZD3BsZ4zUiY75eVpvTNS6XTGEyiiqFaTR2tpXrKInonOeWWvimI/BEGP2wN9g==
X-Received: by 2002:a05:6402:190d:b0:447:ed22:4d0d with SMTP id e13-20020a056402190d00b00447ed224d0dmr1966781edz.309.1662535169471;
        Wed, 07 Sep 2022 00:19:29 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
        by smtp.gmail.com with ESMTPSA id 12-20020a170906318c00b0073923a68974sm7643700ejy.206.2022.09.07.00.19.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Sep 2022 00:19:28 -0700 (PDT)
Message-ID: <dec6d5c4-45b7-f087-95f4-bf1dae9e9d27@kernel.org>
Date: Wed, 7 Sep 2022 09:19:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v3 0/4] tty: TX helpers
Content-Language: en-US
To: Johan Hovold <johan@kernel.org>
Cc: gregkh@linuxfoundation.org, =?UTF-8?Q?Ilpo_J=c3=a4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, linux-serial@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tobias Klauser <tklauser@distanz.ch>,
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
 Manivannan Sadhasivam <mani@kernel.org>, Russell King
 <linux@armlinux.org.uk>, Florian Fainelli <f.fainelli@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com, =?UTF-8?Q?Pali_Roh=c3=a1r?=
 <pali@kernel.org>, Kevin Cernekee <cernekee@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang7@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 linux-riscv@lists.infradead.org
References: <20220906104805.23211-1-jslaby@suse.cz>
 <Yxcvbk281f/vy4vb@hovoldconsulting.com>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <Yxcvbk281f/vy4vb@hovoldconsulting.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_001932_947609_79AA3303 
X-CRM114-Status: GOOD (  17.43  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMDYuIDA5LiAyMiwgMTM6MzAsIEpvaGFuIEhvdm9sZCB3cm90ZToKPiBPbiBUdWUsIFNlcCAw
NiwgMjAyMiBhdCAxMjo0ODowMVBNICswMjAwLCBKaXJpIFNsYWJ5IHdyb3RlOgo+PiBUaGlzIHNl
cmllcyBpbnRyb2R1Y2VzIERFRklORV9VQVJUX1BPUlRfVFhfSEVMUEVSICsKPj4gREVGSU5FX1VB
UlRfUE9SVF9UWF9IRUxQRVJfTElNSVRFRCBUWCBoZWxwZXJzLiBTZWUgUEFUQ0ggMi80IGZvciB0
aGUKPj4gZGV0YWlscy4gQ29tbWVudHMgd2VsY29tZS4KPj4KPj4gVGhlbiBpdCBzd2l0Y2hlcyBk
cml2ZXJzIHRvIHVzZSB0aGVtLiBGaXJzdCwgdG8KPj4gREVGSU5FX1VBUlRfUE9SVF9UWF9IRUxQ
RVIoKSBpbiAzLzQgYW5kIHRoZW4KPj4gREVGSU5FX1VBUlRfUE9SVF9UWF9IRUxQRVJfTElNSVRF
RCgpIGluIDQvNC4KPj4KPj4gVGhlIGRpZmZzdGF0IG9mIHBhdGNoZXMgMys0IGlzIGFzIGZvbGxv
d3M6Cj4+ICAgMjYgZmlsZXMgY2hhbmdlZCwgMTkxIGluc2VydGlvbnMoKyksIDgyMyBkZWxldGlv
bnMoLSkKPj4gd2hpY2ggYXBwZWFycyB0byBiZSBuaWNlLgo+IAo+IE5vdCByZWFsbHkuIFRoaXMg
aXMgaG9ycmlkLiBRdWFsaXR5IGNhbid0IGJlIG1lYXN1cmVkIGluIExvQyAob25seSkuCj4gCj4g
VGhlIHJlc3VsdGluZyBjb2RlIGlzIHVucmVhZGFibGUuIEFuZCBmb3Igbm8gZ29vZCByZWFzb24u
CgpJTU8sIGl0J3MgbXVjaCBtb3JlIHJlYWRhYmxlIHRoYW4gdGhlIG9yaWdpbmFsIH4gMzAgdmFy
aW91cyAoYW5kIGJ1Z2d5IAotLSBzZWUgSWxwbydzIGZpeGVzKSBjb3BpZXMgb2YgdGhpcyBjb2Rl
LiBBcGFydCBmcm9tIHRoYXQsIGl0IG1ha2VzIApmdXJ0aGVyIHJld29yayBtdWNoIGVhc2llciAo
SSBoYXZlIHN3aXRjaCB0byBrZmlmbyBpbiBteSBtaW5kIGZvciBleGFtcGxlKS4KCj4gWyBBbmQg
bm90ZSB0aGF0IHlvdSdyZSAic2F2aW5nIiBzb21ldGhpbmcgbGlrZSAyMCBsaW5lcyBwZXIgZHJp
dmVyOgoKSXQncyBub3QgYWJvdXQgc2F2aW5nLCBpdCdzIGFib3V0IGRlZHVwbGljYXRpbmcgYW5k
IHVuaWZ5aW5nLgoKPiAJIDEyIGZpbGVzIGNoYW5nZWQsIDg0IGluc2VydGlvbnMoKyksIDM0OSBk
ZWxldGlvbnMoLSkKPiBdCj4gCj4gTkFLCgpJJ2QgbG92ZSB0byBjb21lIHVwIHdpdGggc29tZXRo
aW5nIG5pY2VyLiBUaGF0IHdvdWxkIGJlIGEgZnVuY3Rpb24gaW4gCnNlcmlhbC1jb3JlIGNhbGxp
bmcgaG9va3MgbGlrZSBJIGhhZCBbMV0gZm9yIGV4YW1wbGUuIEJ1dCBwcm92aWRlZCBhbGwgCnRo
b3NlIENQVSB3b3JrYXJvdW5kcy90aHVua3MsIGl0J2QgYmUgcXVpdGUgZXhwZW5zaXZlIHRvIGNh
bGwgdHdvIApmdW5jdGlvbnMgcGVyIGNoYXJhY3Rlci4KCk9yIGNyZWF0aW5nIGEgc3RhdGljIGlu
bGluZSAoaGF2aW5nIMKxIHRoZSBtYWNybyBjb250ZW50KSBhbmQgdGhlIGhvb2tzIAphcyBwYXJh
bWV0ZXJzIGFuZCBob3BlIGZvciBvcHRpbWl6YXRpb25zIHRvIGVsaW1pbmF0ZSB0aHVua3MgKGFs
c28gCnN1Z2dlc3RlZCBpbiB0aGUgcGFzdCBbMV0pLgoKWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2FsbC8yMDIyMDQxMTEwNTQwNS45NTE5LTEtanNsYWJ5QHN1c2UuY3ovCgp0aGFua3MsCi0t
IApqcwpzdXNlIGxhYnMKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
