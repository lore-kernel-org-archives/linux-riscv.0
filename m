Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F4E7C48260
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Feb 2024 19:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=yMvLsgtRumGkIPa7XvYI2puRymswgjI+c5efem+iejI=; b=1/KaXpp/RaSSGCWf/4jsd6I7v7
	QyI7xsCvlvQAIOxyfBxz/mMS03A0eHzVPCNZED6VR4Fk5Wd+FQMP5WFmK5sTgV1QkuvC/05uPH1gX
	KMxExOCRAkbC2A/ADi3J+SWw+FgkGUjLLeqMniX2xc3WL6AkgzZBwEdWp6Bch7tm9dDYqBxq8rSKQ
	crV0H+qILGHYgDP/Yp3ihAFiZgpkG8cSEg9tInjQkGpC49JzsQcHxgrMFizbO5xD08LkitE/FO1Wg
	aVpmdKEqYNwY38T+3iTHARO75zX5TM0wamp4UkqpMYPeSLjKeGqwCCW79nV5hVtaVCOAwUoY371y+
	fTAN5W+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb3XS-00000003SJ2-1hZU;
	Fri, 16 Feb 2024 19:06:22 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb3XQ-00000003SId-1joy
	for linux-riscv@lists.infradead.org;
	Fri, 16 Feb 2024 19:06:21 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1d7431e702dso23933505ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 16 Feb 2024 11:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1708110379; x=1708715179; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G57ATopsWGdgfukCf+oinJCn957kvcdWv+8EF1OVrlg=;
        b=2Zt/bzoUJfLIoggeTNRNzoHyZ126TKkgdlHDnMCmJbr9WzobxuVPCO28tLQug3JSDO
         hpSdIpcrM60Rxe/nmRjyfkyHqqWt0jeRlPyUWhitunbzPLg84fOuPqHdI+UfDZi7wr1Q
         huE5iAVSzsKNYwU5S7aD3WCCzrQkHrMIa2tcXDZumlXCBpLK9OyVhmPZQo/man6oWJvX
         KmR4D6g+rEx5ScFvEbfYrresCIu6Jo2I0ZVUINroNS2cPTL3e7QBcH8ku+R+TNBc8ind
         68TlL5hIJGWTdLXPVdUFQQtEu6xBDlaqF75q3sSLel878ydX3/hEMcKOVepRFG22TxUf
         W39A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708110379; x=1708715179;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G57ATopsWGdgfukCf+oinJCn957kvcdWv+8EF1OVrlg=;
        b=CLngtn/a2f7pSRqGgFjkYWw+CcYFVL9nCSjzIMomGsAiRLId3vzdFrjCcBc1UDtrZO
         NhBDcIPx7CaJqpMRchV4nMrjAaA81gZPr8GddMbRi/c35u8aViQH2vH+AiASQgkkx6lP
         UJL8psHESvc5jHQi9gl7UZkVbMlz68N4ktPL4hXI7GYGNpho3pveSzHRH2Jyomtux15r
         wc5uXJ/2feGaX3SnrgsF+XnlCxcA6hFjRvf7fpA2pQBZ6o8RLdOPcehoAhVRhX/0mPwH
         AsTTify3wAyjTQ9iyxK9fs+COhBgqLAtMlHoug2Ity5JVTiKxLFj7PpaPmnl0K505Lvb
         duvw==
X-Forwarded-Encrypted: i=1; AJvYcCWC+hafiq6fs7Ja/FiusDxMRjeEDd+QZhxivMAUnNH8DPX+Uwi2PUwZtQSw2VIAfM2kKXsErRZAPrTbfmq8Xb7HksiSe4+j73skAdoiBuYh
X-Gm-Message-State: AOJu0YwzzaiNsZs2J4YhxoO8ExOMV3vn3YCadEApm3QXYOIQhgbRafxg
	fphCJD5RKYse5BfVsoNC+vt+mRfNf5FCoxUGRAuXB5VBA2V5fZTrjiVJRzBejQM=
X-Google-Smtp-Source: AGHT+IHYib0QY99Hae2xO/F1iLN49cqNkEPihSniQRy/XogBo6z3UOnPW2TTuRKdLELfbmQ5iRUjXQ==
X-Received: by 2002:a17:902:ec8b:b0:1db:b8da:ddfd with SMTP id x11-20020a170902ec8b00b001dbb8daddfdmr1220943plg.50.1708110379239;
        Fri, 16 Feb 2024 11:06:19 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id x12-20020a170902e04c00b001d958de13c7sm220415plx.0.2024.02.16.11.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 11:06:18 -0800 (PST)
Date: Fri, 16 Feb 2024 11:06:18 -0800 (PST)
X-Google-Original-Date: Fri, 16 Feb 2024 11:06:15 PST (-0800)
Subject: Re: (subset) [PATCH v8 0/4] RISC-V: Add MMC support for TH1520 boards
In-Reply-To: <20231212-flammable-idiom-660b1d85e20d@spud>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  jszhang@kernel.org, guoren@kernel.org, wefu@redhat.com, Conor Dooley <conor@kernel.org>,
  robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, dfustini@baylibre.com,
  Conor Dooley <conor.dooley@microchip.com>, jkridner@beagleboard.org, robertcnelson@beagleboard.org,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-a8843466-ecdf-4e7b-a866-c0cd2683774f@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_110620_475601_B0C87A47 
X-CRM114-Status: GOOD (  17.31  )
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

On Tue, 12 Dec 2023 11:13:25 PST (-0800), Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> On Wed, 06 Dec 2023 00:09:20 -0800, Drew Fustini wrote:
>> This series enables the MMC controller in the T-Head TH1520 SoC and
>> enables the eMMC and microSD on both the BeagleV Ahead and the Sipeed
>> LicheePi 4A.
>>
>> The drivers/mmc/host patches from v6 were applied by Ulf and are already
>> in the linux-next [1][2] as well as the bindings patch [3]. Thus v7 was
>> only a defconfig patch and three device tree patches. This v8 is a
>> followup to change the dwcmshc node names to match the documentation.
>>
>> [...]
>
> Applied to riscv-dt-for-next, thanks! The defconfig patch is Palmer's
> to take :)

Sorry I missed this.  It's on my staging branch, but I'm still debugging 
some boot hangs post-merge so it might take a bit to show up on 
linux-next...

>
> [2/4] riscv: dts: thead: Add TH1520 mmc controllers and sdhci clock
>       https://git.kernel.org/conor/c/a77f02e84896
> [3/4] riscv: dts: thead: Enable BeagleV Ahead eMMC and microSD
>       https://git.kernel.org/conor/c/18d92a03b319
> [4/4] riscv: dts: thead: Enable LicheePi 4A eMMC and microSD
>       https://git.kernel.org/conor/c/b6b5028473ce
>
> Thanks,
> Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
