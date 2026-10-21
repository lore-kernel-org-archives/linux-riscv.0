Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6C0606A319
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 11:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vALnznPf;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HCYqR9Fc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=50vxAyAjvXs9uPSImvSe63viRylV6r8YyU+rSSD9nnw=; b=vALnznPfkHmVpF
	cpBtWsV7Vw39KTy5NmPq/ha5JW7r5OBC9K0gRz9YbVVTCVL0j8RvxHxlq2QLMsCCpE5/cCAh0gctI
	R+Nn7zttMooLzD/l1myXcN6JaXbw+d2RoEZkNvjzdUROQas4Vh7rAuJFOKAD7XF1xvsAfTOyHKWHo
	8ZEqc644xdfUb0fQNMGz6CYK32NkomS0UidnouuWIY+JXgEIgbAmbstaPsBtLRB7kWE4qh7HbUBgw
	FRTYq5yRa9hof6rsWj6AdcdxxbzL3zvyQjDrY68sBnvPhPFSlzkSNzCWatrFbwHMiSjR3tURoLK0H
	2s6qslprHWqqXwx3ueVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJU3H-0000000Bgeb-0uIK;
	Wed, 21 Oct 2026 11:00:11 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJU3F-0000000Bge1-0EY8
	for linux-riscv@lists.infradead.org;
	Wed, 21 Oct 2026 11:00:10 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-cc4dbcf2b85so209006a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 21 Oct 2026 04:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792580408; x=1793185208; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=An+ETgbADntwtFKiPu43Mts6liLduZLS5iQIAQ+a5W8=;
        b=HCYqR9FcZ5dWUhhz7eVYZ0XVI9Z4RP6Y1cB9wf9GrCVodoMsdkOHwTQiQXlbPcn/oy
         MucqsGMIkOjPftFyYIuHabEdiAkQv1pCj3301Xn3f67rJDjqD2/OKoqu+SrT/+5nsx/a
         pG2NpUW5Ee0YWz+lTAGmgdkQlQWMkO9ZST2ygrbaNI92OyY3aREs0W99wZk2/FhqzD8z
         /NPTklWMlpcc7kiCuwk6Wk0NFE8v7v17DillWDWc40vlQ0i+Sxk0rt2RC5UmnX/QH77p
         skuWIQc8vpHWlFTZtL0W1EZ5VBPIWPe2HLdO+V/Ooke2r7VYmGZYs+5okPdcMDMRJav3
         S0IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792580408; x=1793185208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=An+ETgbADntwtFKiPu43Mts6liLduZLS5iQIAQ+a5W8=;
        b=kaIZ+RzsS/33W1OPKlu9R1p3I2cl3ZJXQWMov+KjSfo8Qsfb0iHH2+wTXB6Ku6lkLW
         A89if38jyg6fPAb6oUdUF43Yl+Qb8BemjtZpjZXS0z/BWmdtrBIdt2V4EGlm/oCcU4Hp
         rda69anT1IbCldmGBWGq5PTR5WgcFe5TPHNIE5tFDfm42KHI7Za3gRBzEEfau3KkSpS1
         sTlQok7q1vlBS+AKCNu4sH4FnRuypWHyA/5biDLUVAbw20uhXFbGWeN78p0z/ldx7k9s
         UeNCAGuFDWi9OR0Ev797P+A5RPgt5jkibsVAaGdkeeOL4raRtI42b9NvlkSAOoZSV9i0
         fZBw==
X-Forwarded-Encrypted: i=1; AKwUvByQFUG76hrds1Sbs4gz7y4htLuIwLP0yk3xFt3rNBqoF9cdsDV7nXDSdUz8hQY279YVFAaI9X3wWRR5dQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYJSKnqwF/dhY2xy3he293VqxL+uhulS+O5cqYR8WZNl9BBtcBPJ
	X29FkmZzK5YpU0k0SNRc7EEOB3aRrF0+2oI7JyKPWdXb9wrBYm6VlWNA
X-Gm-Gg: AYBFou1KRIi3yJbBbALnaYtySakyOx2UxuD15bBoFXi5tqzC8Xso2iu/AERU9eZc5qC
	GsPDZKxzOHRQ0JOQNoToYfatCHshUX3ULFiZK0to2dJ5xLF7BFeTc/E83qjVHldCTPvyMz6EJ2v
	e+cODspBLgyMFjJoUQRskNARgaULZK5WWm3Or0+kx5FS4P3Hdgn2JW9XdRim1OQMkAOpZsHEVEJ
	GSqfRtuMLQ0DWOExtHlTkdKrfV3DRJPnMgjxvKc3NUcByy/eZ/Cz+1qHfeg+l+y+5Oo+NprchG2
	+2QHmThLUS2X80idrDv47+M65JbaBKEp+bXxZ/RnDHNsp5/u6QJua+PbsxuiJdu7SlKFDk7Ywe1
	zYTFTSQbw/izgAAMOj9fWnN033wTmwmOiJi+6wRyrE6JRvghtJBWku5DFg3pe3mN53vEaNp1xY9
	sz/WsBIpbAC0Xo4WzPT4YjM/lpU5ILWIzS90J5hWb4yVh5qS7xewteXK/T7Q0Ja1iohSYisKGu5
	DzuV0/CtqbMXNEq6mcow3wF6vAGoP5jzQzmCWdPnFcZwiwWXSvbplt0+GOX/RU9Z6m2jVzeKo2B
	obIsJW7K903FVqvzlOe0snG8+1qtJqX+94DB91TsHJxbmANRVUE8gIN6SKCHqEoyjfngdMlek/g
	kPBApSwBQcWkcPpJfueSzGjGzWrngfLUFDic=
X-Received: by 2002:a05:6300:210e:b0:3d3:ae1f:d7f8 with SMTP id adf61e73a8af0-3e287df515emr1543449637.24.1792580407543;
        Wed, 21 Oct 2026 04:00:07 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6a85c6fbesm656992a12.11.2026.10.21.04.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:00:06 -0700 (PDT)
From: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
To: Yixun Lan <dlan@kernel.org>
Cc: E Shattow <e@freeshell.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] riscv: dts: spacemit: mark K1 board boot devices bootph-pre-ram
Date: Wed, 21 Oct 2026 18:59:59 +0800
Message-ID: <20261021110001.2905669-1-alan.tseng.cs@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021083425-GKA125937@kernel.org>
References: <20261017180141.3477743-3-alan.tseng.cs@gmail.com> <13d6926f-f085-4214-8051-7bf7b5d92b67@freeshell.de> <20261019141752.2077207-1-alan.tseng.cs@gmail.com> <20261021083425-GKA125937@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_040009_099860_723C9208 
X-CRM114-Status: UNSURE (   9.18  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Yixun,

Yixun Lan wrote:
> but for bootph-pre-ram, isn't it about the DT nodes which needed before DDR
> initialization in SPL stage, and should have nothing to do with BootROM?

Thanks for checking with the vendor. I agree, the schema defines it as
"the phase that sets up SDRAM".

I also need to correct what I said earlier: the EEPROM is not only
used to tell the boards apart. It also holds the board's DRAM
configuration (number of chip selects, data rate and DDR type), which
has to be read before DRAM can be trained [1].

So in v3 I'd like to keep the i2c2 and EEPROM tags, and also tag the
EEPROM on the OrangePi RV2 and R2S, which I missed in v2.

E, does that address your concern?

[1] board/spacemit/k1/spl.c in U-Boot, ddr_early_init() -> read_ddr_info()

Thanks,
Hung-Chun

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
