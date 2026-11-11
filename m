Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86DC606A321
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 12:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uWCYsrkO;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LgyggL3i
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=C+BXJMihWm8LTiqMu3sZU2HJPRvXTQNWj/sfPUrNdbQ=; b=uWCYsrkORHRfemSs9nDTrTotYO
	OlAPEEp6CS7QYAUR8V6kUKy13UtQGFDFwtKas9HZGe+/VC314HcU7LOIT5OLJktM7MrKCsXbm2I2j
	YTlQaokbp89lTsV1bqMvXFFeNIg5DO8zimdI4B5dKnHLYyJMbom+GMsqKr3eHoYwylP3DMe2sTlHq
	IWMMrGtVMjB5wfUig1NDGilhaZNDXh62bCRoPsuw+X7yMxB6i7iOengHBfbO/Co9LjGCqX2+IyaO/
	yvneqljErwUWWTmuRLheX9ffl6GE/yc9SXuSSDhbdNeb6YTZwri6VXkpJcMtUfOl4H+Tj3fvFH/KU
	tCdk3VLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR79I-00000006cqh-0rgY;
	Wed, 11 Nov 2026 12:09:56 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR79E-00000006cpJ-1U8F
	for linux-riscv@lists.infradead.org;
	Wed, 11 Nov 2026 12:09:54 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-4c5d8c7f326so1214461b6e.1
        for <linux-riscv@lists.infradead.org>; Wed, 11 Nov 2026 04:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794398991; x=1795003791; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8kDTQyiKQOfIkOGO/u8mg2T8m6Y6HEmmU0F0HKV40UE=;
        b=LgyggL3iAV5QU4hacrMdtwyM/HWno7rlJauMMEFqGHfruG8ljXreQHJjppMFIxIl/w
         Eff16/HHxzO+Qg8zpxT7GAOBYF30PBjrHlsP79AZZa9giScT+DnleGZE1u4QbSVXBBnV
         NbspJc4UIClBUMxw0R93zMqSotvlZrC7M2c0aXqLR3jsZo99i1pOBGZfSEn7DWy3eacq
         IW6DtPiToP5wjciPjCGoq6AQ0zAxoL6xpm2tKIMdbfR9dU2apDUonDjn6RvKnUI65Hac
         LTyUR2dQHC+Q5XXMh6hDRU8sKIvZwL/AxlqAKmRZoXKTJFzhAE+e6Lwbhi8Y6ZGl8fr3
         mtWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794398991; x=1795003791;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8kDTQyiKQOfIkOGO/u8mg2T8m6Y6HEmmU0F0HKV40UE=;
        b=k956POnFTOC9dI46vjYj1XY6rdZ1O/RSj2oDhh9JcStXjk26AxujLiB5Z44P9MF9zo
         srA8PvkWsdQ9h9nySvsRJG7nF05MHJbGukWlK265a4JEQZG4b4gGrt94zImNTeJl2FBh
         NamgwDXZJSGiURYg8wM3BjrbY6NVM7bk0kbBoqELda8J8kRd+m58a9XB1KAcbYpkTDiw
         pR4vYCb48KkklIqaqFVDAas/e2uyK+ICVqKHPaDLGUVnXCkQgFzGLF+2DkCQ499AOcJl
         JibBFZtpr/D/bkNYbQPYcam5+dCW4sYSqN61Rd4JoOFQYQpng14avm+qEzc33k0jJS69
         y3IA==
X-Forwarded-Encrypted: i=1; AL+hErEWrg9/7LmvblqJLx60lCwzFjTQ837pCHe46uJTYI5dGyIWuqEJOxtA1yls1zPWE/F5ONnsygqbaRMH0A==@lists.infradead.org
X-Gm-Message-State: APuU4Z8Jd2AacaccFnPIr19/+hJqosHhFwUkNcgFkwEl2jqvNhdmT+4R
	of+4duYaSzcbCq1Bu37mO4+T/jFKIupRkaTOsV0GWObAfsH0snjhJv4R
X-Gm-Gg: AYBFou2x1sYC17sRftN1QdVxMVZIcrOLfyQMWpjJyC6ZiTx4g/y+wTD3GDtDpZYqRpp
	r0H+Is4ODdP+40LaM+oHFvsrwswfkgaE+hEyglFKMzWuBYnhKhBs7Souo/Mdv7XgZ3iV9ZIiYCb
	LMtfAdwl59XPdiH9Xd+a+Z1gymEjRwWLfNulgbJanA44i5aLVWYGyhCtLQQs/nfC6tVqV0Muz6u
	JMMWBE1RHhVqP4FHwXxdu3QH8ToT0ba3OJGcFWAW8+vjYv2rJYA7HZYV9fUQlHfga28A1n5SFL0
	Yo36mL4V+WEebiYLsqvvr1Rn6GB5oPgPihzESJ927tOLLKqRsGXnnBCBUKJ/UeM67JnmRANi1eV
	cuTMtDq0ZujJmsYSla3b24F/kHjXY6ZqzKDB/FHTVOsIKQhVIig3V3vIZzuU6Id8sOzLlwCzo9U
	KA99WbIhbeNe7VL1girVCsCKjoK8jQaKEEd2ljAMwhK7GnX1lrFgfJbyPdWjTcFvH+e99GZFopb
	R9muJhoJhsaJMXJJ9BrF04ZARQZA4Ie1bIdxl1tQk/OX/ffHO7IXhskTfbQG4VkcSd2u6eM3vdA
	Be5o3Qf8NTItDlXtt7EVc0rQh+BZAvMwc0kBxWWQ/8p2vZ1lY2cMs1TYIVSSskgpmrlwTjerFL6
	PmqJD
X-Received: by 2002:a05:6808:244f:b0:53b:1d13:dffd with SMTP id 5614622812f47-56b92c464dcmr1457460b6e.7.1794398990670;
        Wed, 11 Nov 2026 04:09:50 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm4958534b6e.3.2026.11.11.04.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 04:09:50 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: junhui.liu@pigmoral.tech
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org,
	Jerome Brunet <jbrunet@baylibre.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Norman Herms <dockseed@proton.me>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Subject: Re: [PATCH v6 3/8] clk: sunxi-ng: a733: Add PRCM CCU
Date: Wed, 11 Nov 2026 07:09:48 -0500
Message-ID: <20261110-a733-fwclk-junhui-reply@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <DMQEUUHANG74.30N8VT6UGHO0M@pigmoral.tech>
References: <20261009-a733-clk-v6-0-ae8178fce7e8@pigmoral.tech> <20261009-a733-clk-v6-3-ae8178fce7e8@pigmoral.tech> <20261103-a733-ccu-v6-fw-clocks@gmail.com> <DMQEUUHANG74.30N8VT6UGHO0M@pigmoral.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_040952_424885_AE37E2B7 
X-CRM114-Status: GOOD (  10.46  )
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

Hi Junhui,

> I'd prefer not to mark these clocks as critical just for the vendor
> firmware. You can see my reply in v5:

I agree that native PSCI and a future OR100 Crust port are separate from
the vendor SCP on E902, and that future E902 remoteproc/mailbox drivers
should own these clocks. Vinicius's native-PSCI reboot report used locally
modified TF-A on A7Z [1]. Upstream TF-A still has no A733 target; its port
is under review [2]. The immediate problem is that the new CCU's
unused-clock cleanup breaks reboot with the firmware these boards ship.

On one Cubie A7S, RAM-booting v7.4-rc1 + CCU v6 + DT v3 and its dependencies
with vendor boot0/BL31/SCP/U-Boot and no clk_ignore_unused, the run without
critical flags stalled at reboot -f. With only bus-r-riscv and bus-r-msgbox
critical, two warm reboots returned to vendor Linux while r-timer0,
bus-r-timer and bus-msgbox0 were 0/0 (enable/prepare); five flags also passed
once.

> Since you've already submitted a separate patch adding these critical
> flags, I'll leave that to you.

I will narrow my separate patch [3] to bus-r-riscv and bus-r-msgbox.
Chen-Yu, Jernej, Samuel: would you take these two flags as a separate patch
until E902/mailbox drivers can own the clocks? There is precedent in A523
bus-r-cpucfg (1dba74abf3e2) and Meson AXG fclk_div3, kept critical for SCPI
firmware until the driver claims its clocks and a handoff exists
(drivers/clk/meson/axg.c).

I have not tested power-off, suspend, either flag alone on A7S, or other
boards or firmware; Vinicius found either flag alone insufficient on A7Z
with vendor BL31 [4].

[1] https://lore.kernel.org/r/20261011200153.575096-1-vinicius.eduardo.pedrosa@gmail.com
[2] https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/55200
[3] https://lore.kernel.org/r/20261031020640-263f7b05-a7s-clock@gmail.com
[4] https://lore.kernel.org/r/20261005183038.417798-1-vinicius.eduardo.pedrosa@gmail.com

Thanks,
Enzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
