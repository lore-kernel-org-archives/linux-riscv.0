Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12197C28B20
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Mar 2025 18:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=laUXb40UlGaJJlu7aWXH1EA4EEssKQuVW3T5nhKo7vg=; b=VEYs0K6ZJzFqJZ
	yceB5FTPih9YLvxeIjZS/PcPVUlutSCn+iig6tCr9jrd/N/FxfPsW5yGb3W2Oz1ZQV++RHq9CqSy3
	vaLYtv70exElEFQ8NTUY/y63193MlhIK6V6GgxRcp0Y8Vgw9q2u2GlNO3hwITgJoRnMUD7IaOxFzk
	QzBtpwF169SpwhjHWUM8GroEJIV/Yx82/hLUh8f2rBlibEA3AX1ro4MTP7XuRAZudqOyuthazWIQy
	IcglIt7XqUqDq45O4XIaOg9lfr/aDAWX/xWbLxFof/h/mdIu8obE0Ti4iV0WI4FJb5g9dQHfz4vMp
	PRG5J1FjWNjHIzliOGxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyxdL-0000000GVua-1Ljo;
	Sun, 30 Mar 2025 18:43:47 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyxdI-0000000GVu0-2qA4
	for linux-riscv@lists.infradead.org;
	Sun, 30 Mar 2025 18:43:45 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-30384072398so5017964a91.0
        for <linux-riscv@lists.infradead.org>; Sun, 30 Mar 2025 11:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743360224; x=1743965024; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yTHIj6pSnTi8mksj3ewma2KmkG/z7OTrATTw79miqqs=;
        b=JY6wq6huP25Nd18LZDh+ru/IldxwnteYgaiLC1hHguj7fL/R5Fc4uDY21F8t38eXHP
         LIjQpQ9oq1My9DQz4hrdNWCPbW3UdR31wyGV+LIPXSyRwIF6yxntaJN17dhTwrcXtmuw
         Wd10nsHE+eixPFSVMNNnyZup3HyCVWTk40o4svlcddZREjwhhsPPudi/1NHgZcXVA1Pz
         67NZRggAyzjddErvjHWeMqoEtmprKYBjke3Yg7CPL6z+Y9aOuo3qd12nGkUb5sUglN0m
         oi8WFspnP/Fw/9xbCN1f/FLMVLi9M0VnnKinceFJAhW2YaGC/GF9uR7t8kKQYpG6J3HY
         5Y6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743360224; x=1743965024;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yTHIj6pSnTi8mksj3ewma2KmkG/z7OTrATTw79miqqs=;
        b=Ixbf2hxjGRtVz9cpxsGt02pAipm0YSEFcncE5zJg/mo39jinkuvKfTnXrnBgT1ho9N
         vddfmxzwjOrWG05YdmCg7Ss6TlUfYfAGsJNa9oJcehysTHGfZ3s3FYVQmTag7NwANwGs
         fwzmkbcLsBrHqx5QuCavvQTWrZ64DjWEHFbBpA60lFgADtVs2hjJsp05sF8B3Hormbwh
         8aMol3EoPDoocS3wj7Nz2kcPfvTDcxtRjh8GwucFBhRluwO6UrEBKYutrJzj4CgEcSG5
         u3V9nZltHrRw3I+hv+KkV3BMFXE/fyc6iCxWeQuC/JxcaPrmlVM8cZ8I5BtShPa/1zZk
         5NOA==
X-Forwarded-Encrypted: i=1; AJvYcCX1Ljz8E65LDmE5Lca5j9mChUigcjuvWX6AVCkgjGEkTvZ6QYDnHwnN+AU6rPtHLPao9ctwhmUW6033xA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxxbU96niw/lIHOxbWEfEJl56IX4dwL3wq89wCwF0S2kzWCUsjo
	KrizEIyYxDbMgIxUiC31Ezysrh9GwzJzvCeZEhCHaO5MIMSlV3/i
X-Gm-Gg: ASbGncvGM344EuxEVcWlpDrQKF2jxktA37kB+8fxvHNNcvVJNA5xatSLjXifvu+oym7
	vK3m/LJmSKNJ/P/H6V9lyEq1lnVdX18R23GqnXqhlOITBRrtEO37Bn68i8skQgPya+667N3FNYL
	ROej9oW8Qc+GandeftKYcFl+G43pIEJ2EyIKG564ekkZZV61SE4ITb2JZZcCddzTtRlnkf2tNqf
	tX1ihtSSxSKFD+KRWnWGUXk7UvcufnSg5Fi52gCoiPzji8iaBKNriBhdPSrKhBrJj9QSz1/Dhjd
	PdSrVbkgUTqq8TzU07mN6HgZBbfBN8Xk6Mzy2Yca0ycifsFR
X-Google-Smtp-Source: AGHT+IGTwjdTgA3d53CBEcgC1UhzuLmFkhq0pi1HXLWlT03QRj78CDBkQP1NrMYsAj+uFneRKugQIA==
X-Received: by 2002:a17:90b:134d:b0:2fa:e9b:33b8 with SMTP id 98e67ed59e1d1-305320afaadmr10451666a91.18.1743360223746;
        Sun, 30 Mar 2025 11:43:43 -0700 (PDT)
Received: from localhost ([181.91.133.137])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30516fed5fbsm5734308a91.37.2025.03.30.11.43.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Mar 2025 11:43:43 -0700 (PDT)
Mime-Version: 1.0
Date: Sun, 30 Mar 2025 15:43:40 -0300
Message-Id: <D8TTMCQBDYX3.H8ACLTS7KL19@gmail.com>
Cc: <ibm-acpi-devel@lists.sourceforge.net>,
 <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, "Damian Tometzki"
 <damian@riscv-rocks.de>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Fix NULL pointer
 dereferences while probing
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Kurt Borja" <kuurtb@gmail.com>, "Henrique de Moraes Holschuh"
 <hmh@hmh.eng.br>, "Hans de Goede" <hdegoede@redhat.com>,
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, "Mark
 Pearson" <mpearson-lenovo@squebb.ca>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250330-thinkpad-fix-v1-1-4906b3fe6b74@gmail.com>
In-Reply-To: <20250330-thinkpad-fix-v1-1-4906b3fe6b74@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250330_114344_715973_67D98B47 
X-CRM114-Status: GOOD (  10.93  )
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

On Sun Mar 30, 2025 at 12:39 PM -03, Kurt Borja wrote:
> Some subdrivers make use of the global reference tpacpi_pdev during
> initialization, which is called from the platform driver's probe.
> However, after
>
> commit 38b9ab80db31 ("platform/x86: thinkpad_acpi: Move subdriver initialization to tpacpi_pdriver's probe.")
>
> this variable is only properly initialized *after* probing and this can
> result in a NULL pointer dereference.
>
> In order to fix this without reverting the commit, register the platform
> bundle in two steps, first create and initialize tpacpi_pdev, then
> register the driver synchronously with platform_driver_probe(). This way
> the benefits of commit 38b9ab80db31 are preserved.
>
> Additionally,
>
> commit 43fc63a1e8f6 ("platform/x86: thinkpad_acpi: Move HWMON initialization to tpacpi_hwmon_pdriver's probe")
>
> introduced a similar problem, however tpacpi_sensors_pdev is only used
> once inside the probe, so replace the global reference with the one
> given by the probe.

I don't understand why b4 added the linux-riscv list to the recipients,
but it was definitely not inteded.

Sorry for the noise.

-- 
 ~ Kurt

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
