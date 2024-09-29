Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EBD5CF6498
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Sep 2024 03:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=quewybQEmXKRdd30kOaHkKhGv3g5LdQ9Pff/kRi/10w=; b=2juoAt6rtrfkfF
	5FXP6wJoIVJRA1PeauahJYSinFGphdDGq+HrEzQyLuWIwaESFyvYReXNMM7gm5eoKthnplUlYHTra
	coJVPb6GG7c0eRBr1WYnKVwKgpF9mD4/6m83o1ZCBJYgUhJBt7UF0kk25qZ5cTPsL6bV/Vm+ooOaN
	5MlMrFLklK3NkXAN7smWfJVE6iS4CON7SuZig7/7nqMhoe+VfuEYFy+jyokB3wyQeAjsOwSqMB5YP
	nJN03wS0n+9tlypx/IEUZ0UQJgT6eZw0L8DmVKh9SiyRAOLX1gfpT7JgQoOGnhFdYY/YOUFcWyerF
	vCQ0jJOMlMIo46HFwDRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sul4U-0000000E4rf-2HcU;
	Sun, 29 Sep 2024 03:58:10 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sul4R-0000000E4qu-3PQ1
	for linux-riscv@lists.infradead.org;
	Sun, 29 Sep 2024 03:58:09 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-207115e3056so28612475ad.2
        for <linux-riscv@lists.infradead.org>; Sat, 28 Sep 2024 20:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1727582287; x=1728187087; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1YkWfPvtAH4vWwmKQhiADe/rYImGBQg3vsS8ImzGFis=;
        b=Q2AegHRZOa+ld2yRvjit6/dwvdQZlQgUOrmIgOm7+GPXFl22N382/kXUGuOHR1yzw6
         gDs7H5pg1OFi6EeCBRlNEZZcnWJ4OG8Z+WhBWhIgNALqvefODhMk/62q+qQonT8F7m4m
         2zILNmE9F3DMXr2BvYTQ9q5JxxrYN6+COQLkoWJIcUvNaTWM+FGwfQXWuWjJRDAzhSlx
         JV6UbBh9TLzJ1CMi3AsbNz9CgIqOj0fDHRQiKNd4XmbhkT/woB6/7bbyVIB9j1i0OdcV
         zYtBPvUtw7iAnkvvCsWY011mfN5DNCKThgl21wkLDSHa4rMQz27Sh0o0msrwA9Dc0dhN
         OrjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727582287; x=1728187087;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1YkWfPvtAH4vWwmKQhiADe/rYImGBQg3vsS8ImzGFis=;
        b=n2IoAznd5depqxZ0fn2bAIZXNzRbF1Lwc7WXSBO9vgceYFXlyU48DPz7Udz4+5D+i/
         LhXxKdfntdyaAx47T9iKDpZIO7Y3h9d8hui55nSkMRVtPahF6iF+UxJ0gB2GObdTClhM
         N3Q+dPcumL5yC77roW9Nd+7Rz2WVh0J7M75Wb52l1yLkbw/cNlauoJ8iQ5IHAJ8VeXIm
         iMQZmRt9DcMPMhH3yo/MxW6uGOWAE0pPa+9KQ3+NwgfOAO4vEU7kC+xAhy+5Oy5XKLO1
         lJRuOrLHs0mTNW8/xx3rHp+4kVFiYmeO2BF34W1xfG6PDmL4EUB6DyJVgvzHH8vU701u
         DsFw==
X-Forwarded-Encrypted: i=1; AJvYcCV52F3JJMIjEOha8NmfseyJXwcwh9jRhzmJvlzIj3SQvRQE7qHFkGeATAFzQE1MTZyOtPjI+Ft6saKGxA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwF+LMf6OgYaPqFUnu9KZSjcSzE2a3y+pwIVn2nt4FJWDGyB/Vj
	zOHTFQerATO9s5OVhm5kyknKB7f8NfL+DGAggeAvG5N59p88A6TOlqrE7ZWKU1o=
X-Google-Smtp-Source: AGHT+IGV/f9jzts7RDAjmlHZvifv1MNEX/u7uVlkFGTpdrqBwMyA+z/HUMV+o4vjzAPi2t1Jy3PuxA==
X-Received: by 2002:a17:903:8cc:b0:20b:5b16:b16b with SMTP id d9443c01a7336-20b5b16b29dmr54329085ad.36.1727582286974;
        Sat, 28 Sep 2024 20:58:06 -0700 (PDT)
Received: from x1 (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37e36fe7sm33519615ad.211.2024.09.28.20.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Sep 2024 20:58:06 -0700 (PDT)
Date: Sat, 28 Sep 2024 20:58:04 -0700
From: Drew Fustini <dfustini@tenstorrent.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 3/3] riscv: dts: thead: Add TH1520 ethernet nodes
Message-ID: <ZvjQTD9jG12rX8Gx@x1>
References: <20240926-th1520-dwmac-v2-0-f34f28ad1dc9@tenstorrent.com>
 <20240926-th1520-dwmac-v2-3-f34f28ad1dc9@tenstorrent.com>
 <3e26f580-bc5d-448e-b5bd-9b607c33702b@lunn.ch>
 <ZvWyQo+2mwsC1HS6@x1>
 <0b49b681-2289-412a-8969-d134ffcfb7fc@lunn.ch>
 <ZvYJfrPx75FA1IFC@x1>
 <5076789c-3a35-4349-9733-f5d47528c184@lunn.ch>
 <ZvhviRUb/CitmhgQ@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZvhviRUb/CitmhgQ@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240928_205807_883959_AC1288BA 
X-CRM114-Status: GOOD (  34.89  )
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

On Sat, Sep 28, 2024 at 02:05:13PM -0700, Drew Fustini wrote:
> On Fri, Sep 27, 2024 at 01:58:40PM +0200, Andrew Lunn wrote:
> > > I tried to setup an nfs server with a rootfs on my local network. I can
> > > mount it okay from my laptop so I think it is working okay. However, it
> > > does not seem to work on the lpi4a [3]. It appears the rgmii-id
> > > validation fails and the dwmac driver can not open the phy:
> > > 
> > >  thead-dwmac ffe7060000.ethernet eth0: Register MEM_TYPE_PAGE_POOL RxQ-0
> > >  thead-dwmac ffe7060000.ethernet eth0: validation of rgmii-id with support \
> > >              00,00000000,00000000,00006280 and advertisementa \
> > > 	     00,00000000,00000000,00006280 failed: -EINVAL
> > >  thead-dwmac ffe7060000.ethernet eth0: __stmmac_open: Cannot attach to PHY (error: -22)
> > 
> > Given what Emil said, i would suggest flipping the MDIO busses
> > around. Put the PHYs on gmac1's MDIO bus, and set the pinmux so that
> > its MDIO bus controller is connected to the outside world. Then, when
> > gmac1 probes first, its MDIO bus will be probed at the same time, and
> > its PHY found.
> > 
> > 	Andrew
> 
> I'm trying to configure the pinmux to have gmac1 control the mdio bus
> but it seems I've not done so correctly. I changed pins "GMAC0_MDC" and
> "GMAC0_MDIO" to function "gmac1" (see the patch below).
> 
> I don't see any errors about the dwmac or phy in the boot log [1] but
> ultimately there is no carrier detected and the ethernet interface does
> not come up.
> 
> Section "3.3.4.103 G3_MUXCFG_007" in the TH1520 System User Manual shows
> that bits [19:16] control GMAC0_MDIO_MUX_CFG where value of 2 selects
> GMAC1_MDIO. Similarly, bits [15:12] control GMAC0_MDC_MUX_CFG where a
> value of 2 also selects GMAC1_MDC.
> 
> Emil - do you have any suggestion as to what I might be doing wrong with
> the pinmux?

I've been thinking about this and I don't think there is any problem on
the LPi4a. Both Ethernet jacks work when I have the mdio bus muxed for
gmac0 to control it. It seems to control both phy's okay.

Earlier, I tried to setup nfs root but it didn't work. I believe this is
just due to my ignorance of how to configure it correctly. I've instead
switched to just adding 'ip=dhcp' to the kernel command. This causes
stmmac_open() to happen shortly after the thead-dwmac is probed for both
gmac0 and gmac1. The phy is found for both and there are no errors.

Without 'ip=dhcp', stmmac_open() is not called until around 40 seconds
into boot when NetworkManager tries to open it. Everything works
correctly but the delay of over 30 seconds from thead-dwmac probe to
interface up looks odd in the logs, but I am pretty sure this is just
due the point in time at which NetworkManager decides to bring up
the network interfaces.

Booting with gmac0 connected to Ethernet cable:
https://gist.github.com/pdp7/e1a8e7666706c7d3c99b6b7a3b43f070

Booting with gmac1 connected to Ethernet cable:
https://gist.github.com/pdp7/8a9c2066a2c20377ec3b479213b9be4c

thead-dwmac probe for gmac happens around 6 seconds. stmmac_open()
occurs shortly after that. The interface is up by around 10 seconds
into boot. DHCP request works okay and the interface is up and working
once the shell is ready.

In short, I believe the dts configuration in patch 3/3 of this series
works okay for both Ethernet ports on the LPi4a.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
