Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA31606A32F
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 20:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hL5aMMdv;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fzLwMqQE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Subject:Cc:To:From:Message-ID:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ds6tXrSizpJqYSsud809LQ3mw95BxnD4WRm3Fhks+94=; b=hL5aMMdvMq+1+rGk2ER17NYK57
	DtIjoc7NmSs7ngfrQhT0VUn8keAt6RxQxM77b7Xpp5Acs6TLV68PecPtKQst3OjSbNb9awBIEGQ2T
	t5JL2ywt7PpcWxrqAHsc0tZdBFgz+0QfU3xILcIJ0eeq8fG6wlfK+1xkY4H/Lmt56vSSxT5yZbG+t
	DZKHv6VJzF/3/BUTslEZrMTG3LiGKdZhOORF8a/dmFR3F0cp0xf20xFn5ziPbXrsz44hfQYG44H8m
	9XE+7SPSKE/ZoGZ3C0MXaBDWdHB9UZ3F/W8EcJYzrpj1HiqkQnyOThIKPHACfGi4FOTj/HCkm8bW3
	H6ZIAvBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTQ9g-000000073Ka-1CBI;
	Tue, 17 Nov 2026 20:51:52 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTQ9d-000000073Jn-1Vj2
	for linux-riscv@lists.infradead.org;
	Tue, 17 Nov 2026 20:51:50 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-8b4e04eda5aso1792207b3.1
        for <linux-riscv@lists.infradead.org>; Tue, 17 Nov 2026 12:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794948708; x=1795553508; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H3h9IxdpOr+oov0x9AuL8BUQNJ9C7SGtsH7YFmYPEqA=;
        b=fzLwMqQEj3NBS1s++d0C3HzDyjZgVvr+xSNapFFFZBa+Ybd5kfCX27A/SDbgzf3uPO
         OB/FnQWjM4I84ptFDzVvsY5r7rKjYnv5Y5TGT7LhnRYtVkWFyOmIsI86Pt+CU+lMOqu+
         P0Ekm5BRqdQ8uNizIdgw0BtK7lWOLJQmb6O8rjKCzgaGPs2XMe68TGQw5R0UwnFHXduP
         HMiPURUs7PINPPWufSLGgRNo/u9J/UUx4jbSdisqzH8tHvL+hqHy92K25jG7A8bX50f3
         +SjEVOFx/4p1BLZOpyYctW+DUGsPMFU5cTmNxZBiU0IqDVtEcGdtYeIhvRp+Ll/ea2LA
         hflQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794948708; x=1795553508;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H3h9IxdpOr+oov0x9AuL8BUQNJ9C7SGtsH7YFmYPEqA=;
        b=N6ZrT1NtgsC+/jc1aTBswD3p6myCftOQ4Q9E+UfD+nke3vMgASOxcjP7mOr+TUzsqI
         R2GFWWvcju8FEEy9a8uR4ze64i/oKGFV5seTEti4mXa6c8Vyty61WT+eEGv5w45/Cr8u
         cxmgedCLOwKqMusYRQl7knoDLazOGMeMbMVjCP4HY8lhS6hIt57VFnK72kHV+uIEQUxV
         t2Gb+BlqSSoLlayaXkzYoRfs7sqJxvt+ovA5SDbgu3BV6PU8+rzzqarXTpWVcYxOwqwm
         eFkrguF+Bi1EL0GLdpyv/w0gQNtGcbLMOHpY1guyMMj/0pK9022LB0VldAPfFZObP0EM
         BnGQ==
X-Forwarded-Encrypted: i=1; AL+hErEJwplInhV4aF1VMEmc/VjTS5DBbBMVek/NC8i8QuKv6qCJafrDkE8PiEo0Tf8dyq09WHfIu2sOUw43ug==@lists.infradead.org
X-Gm-Message-State: APuU4Z9OMRVnitrgO4d40iVmeMkK6nwcw5NjJ0mh3aM24CzXD+HbVP8b
	px0Aw4ET89yXHrm2pM8PuU0Hybb2tpBOwyfp4VLtfZiZSrMvwVQHvSc4
X-Gm-Gg: AZFdTZebEXMXBfZnA4zdiDCQ4PCWCdDmM1r56HZ01BsOH2qDuIVNCBv8kE8QsrVwmQ9
	jzHqJWCku9DPHNcWE5xZsOqrRb6sMBcAWVHq6qmSTMmSfdy08x4JxWMRhr5QhuWp6DqlbE2ep/F
	rMEzszf8bcK0d8TM7AQ4B7ORbvASEHXuexrLgfbebDfMW9LEiXzvqT8PtFFuFQdClKcJVf/PKE9
	aZn3vOf+zSsEKj7Hk23uLt9Jg0vvBXzUhXT+wcRoxdBr/OJcZn4yMBbZJo1DOG1+7HYD5ehqj0i
	S0ODGvl551NzBS1pFD7xR6ycx+WGpQxNuCRykUZEhEQWW46k5VP9g+i92xyp72vnwkILwa0NizD
	TB9NdvOd6KVXe/JDsbRWiKqsaLTpu1RGSCXzddg1BtXFmuV4lcf4aqdwor8O51+M7vY4zVSIfqC
	wYj0r3Z17mQAxHhYhFeaBd1HNfMDr71kiv1rS2EeH4u6rj4lvWuatdES62xfnBf+7nuvEMFQyhF
	vm177BLp6+IdQXiH2+n0DESNVJxeqppNBAPtm/g6bfjU83c7Q0Z6g/UtD1MGsWt73FQZUaDCbSZ
	KKdzerUhymZaeNo7qleJIlMF
X-Received: by 2002:a05:690c:306:b0:8b0:e479:6872 with SMTP id 00721157ae682-8b4fed09583mr3173897b3.17.1794948707375;
        Tue, 17 Nov 2026 12:51:47 -0800 (PST)
Received: from localhost ([120.244.9.31])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4fe057c1esm6086647b3.20.2026.11.17.12.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 12:51:46 -0800 (PST)
Date: Tue, 17 Nov 2026 15:51:42 -0500
Message-ID: <f4b8c87eb0676500661ebea67363ac27.docular.xu@gmail.com>
From: Guodong Xu <docular.xu@gmail.com>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Cody Kang <codykang.hk@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yao Zi <me@ziyao.cc>,
 Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 dri-devel@lists.freedesktop.org,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 15/17] riscv: dts: spacemit: k3-pico-itx: enable the
 DisplayPort output
In-Reply-To: <576146d4f2752c3c3f6ec6c42812cb9956406383.camel@icenowy.me>
References: <20260809-k3-display-v2-0-327d7910bf71@gmail.com>
 <20260809-k3-display-v2-15-327d7910bf71@gmail.com>
 <576146d4f2752c3c3f6ec6c42812cb9956406383.camel@icenowy.me>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_125149_408252_68C01321 
X-CRM114-Status: GOOD (  11.91  )
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
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Icenowy,

On Thu, 03 Sep 2026 20:09:42 +0800, Icenowy Zheng wrote:
> The connector available on the Pico-ITX mainboard isn't a DisplayPort
> port -- it's a USB Type-C port instead.

Right, it is a Type-C receptacle, and the commit message should say
so.

> I think you need to model the Type-C port and alt functions of it.

I am not sure that can be done on this board. The redriver/mux in
front of the receptacle and the PD controller that steers it both
sit on the EC's own I2C bus, and their interrupt goes to the EC too.
The SoC has no bus to either chip; all it gets from that side is the
DP1 HPD line.

So a usb-c-connector node would have nothing to link to here.

Guodong

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
