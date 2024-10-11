Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 155D7D24470
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Oct 2024 17:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qvJPUyBNmfEY+Z0CK1MA27bDQaQ+GRv5yEFFr2/Z7tU=; b=FDbYMs8Uypl72j
	AX9qYjX9PX26AsHclKJGpGnGFqwghS+LQEbtWMIVruRpDGM1JTBtIRxFy8htJz1pMcz3P2/ojfYdm
	805TsAnk8TV+qtQcMWCyTZf8pBrfSOZ52L7bXcoQLebNErWGT7EIZZ5sOCZQhwYsx3d0m31tTIojv
	areTIGcmTAMYWOJ5necv/MsZJlBpOkmsv3her5W4T3KZkh8cvhMeUdKN3waSYHgwCYUwvB/dwKOKF
	4NG8NxcLO5lNmHSY8wuZWqMem4UPNMd6n4pxjmLGzoiEVqAN1t25WC6KPqQ33WdcMjnuxhOuLLUq6
	j3jZemWEA23ekQi4ZV3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szJLS-0000000H67L-1oLK;
	Fri, 11 Oct 2024 17:22:30 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szJLP-0000000H66k-00wY
	for linux-riscv@lists.infradead.org;
	Fri, 11 Oct 2024 17:22:28 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-20c803787abso15889655ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 11 Oct 2024 10:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1728667345; x=1729272145; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5aZ52jmXTRU0WDuKnL6qTle0VwGKZCWaBSs2okeMFkY=;
        b=kzSWfpvdVPq8Cmda46mPW+FPegBGXAvEqFnYdi6JC3AN8YakbwafpSnbPHBt72nPXy
         xzceRXEpnwak92s5TS22MOyc78CMuIEHkBe6sfn7J+1e8xtLJk09V+IJ69z9XaoJV6mL
         eYHDUIBwTPMTSB95W4WHoKTyE/KJKlD16TONNBTOKux0nXFy2w6ILnQEBMacXvIVXY0H
         WZTSewKvn5bM5EJ5Gq3LgBC6ISE3ldvVDDtgnNb12go7gwMxllQ6iPmScjXLK2qXIOhR
         xmyGvrslGdAOvbi89tBvD8Yf4leujraK5DG0rd1vhopkiI0Eedo9tlbTDiKaGQ7SBdbT
         zdhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728667345; x=1729272145;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5aZ52jmXTRU0WDuKnL6qTle0VwGKZCWaBSs2okeMFkY=;
        b=FZkf4amF0tyO+RVwLS2O7cauwHVWHwau6f/ele6acfukR/ukzYpHjiFg/be7cyfSnH
         rjuzy2AHJwi3TFjhcrhEfFJI+VGttYXw3/Aox+MdCtzbLVDgzHtVf3LjcsHnHZXabB5/
         ykHdLDH9dLB8cjYwJk6r5TC2q1ggz7wCzFdvxWu53IR88A2gI4+dCOY28ZB6oOjP/nr2
         yQgoh+JGsbo0gydg1YjnU6hJR3PGi4wui7+MMeFHczd55B0/M15qKh5Bg+/KIKG+wWyn
         V1nroYmt+2g4g0UtBfaKQES689mjHJx4PchegB7ELlAkPzFeZGDNcbOj4xLQTO95UrP5
         RN8w==
X-Forwarded-Encrypted: i=1; AJvYcCVYi3k9g3suta4meVAmYkylb9OXwLND0bZHzDjr4skNdFdZWDLvUDaU/2YUjhOUdm15TXWTSYhR8lAYiQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxCcNuED4l6bkWN/TLMqR8oLU9HqSHSSsXPzn8DL7J3NWPjSos9
	E5I83lkbd3uKwB6p/U+OASudC6sRygLouDQq48u1XvYPUo3vfbPPs0w8GIK5g8M=
X-Google-Smtp-Source: AGHT+IGMU8kfRZQZdp7FUTBbkcU5ohX16bkO/daQ28hOFX/Z7i9mjCLTsIvmEcg9GdJ8EEGI7Ao9Tw==
X-Received: by 2002:a17:902:da89:b0:20c:ad30:c891 with SMTP id d9443c01a7336-20cad30cbe2mr31776005ad.10.1728667345287;
        Fri, 11 Oct 2024 10:22:25 -0700 (PDT)
Received: from x1 (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c8c0e751fsm25622875ad.139.2024.10.11.10.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 10:22:24 -0700 (PDT)
Date: Fri, 11 Oct 2024 10:22:22 -0700
From: Drew Fustini <drew@pdp7.com>
To: Drew Fustini <dfustini@tenstorrent.com>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/8] pinctrl: Add T-Head TH1520 SoC pin controllers
Message-ID: <Zwlezn9V75hiLtPw@x1>
References: <20240930-th1520-pinctrl-v3-0-32cea2bdbecb@tenstorrent.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240930-th1520-pinctrl-v3-0-32cea2bdbecb@tenstorrent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_102227_264355_24D1AA30 
X-CRM114-Status: GOOD (  13.64  )
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

On Mon, Sep 30, 2024 at 12:50:50PM -0700, Drew Fustini wrote:
> This adds a pin control driver created by Emil for the T-Head TH1520
> RISC-V SoC used on the Lichee Pi 4A and BeagleV Ahead boards and updates
> the device trees to make use of it.
> 
> Changes in v3:
>  - Add Rb from Rob for the binding
>  - Rebase on 6.12-rc1 which enables AP_SUBSYS clock controller in dts
>  - Update dts to use AP_SUBSYS clock controller instead of fixed clocks
>  - Remove unneeded defines from the driver for dt unit addresses
>  - Link to v2: https://lore.kernel.org/linux-riscv/20240914-th1520-pinctrl-v2-0-3ba67dde882c@tenstorrent.com/
>
> [...]

I've applied the dts patches to my thead-dt-for-next [1]

[3/8] riscv: dts: thead: Add TH1520 pin control nodes
      commit: ad36d24e4fac83a6cf916fbf7eb458ed5179758b
[4/8] riscv: dts: thead: Add TH1520 GPIO ranges
      commit: 5c0a6b845d1670c7a10d8016cb352c21b0133935
[5/8] riscv: dts: thead: Adjust TH1520 GPIO labels
      commit: 2a3aaf5fd062e9a820c420b02795acf6e031c855
[6/8] riscv: dts: thead: Add Lichee Pi 4M GPIO line names
      commit: 753c9640121235b3ea26137f3a2dcbb301fa8556
[7/8] riscv: dts: thead: Add TH1520 pinctrl settings for UART0
      commit: 5aa0a71414f1e4fcacd64146d40e78ecdfc26374
[8/8] riscv: dtb: thead: Add BeagleV Ahead LEDs
      commit: ddc5ab7259a525670fbea6e9bda5334022aae050

Thanks,
Drew

[1] https://github.com/pdp7/linux/commits/thead-dt-for-next/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
