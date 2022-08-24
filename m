Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 000AEC00140
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Aug 2022 16:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i/Iqr7XIig8jgqRAMP0u5QhG4vBLUeiNjP1lXVglwHk=; b=eJ+JFcTExV4VBM
	Egtyj4PpGWejZYlEs5qgU8PhbHmzY8yH/xU/KUbaT67JuCB4Itau17mQZ7NYXMTF7yMzCS4/yvTl2
	xatEUXJkpS6x8RG87bo4HiVg3gOKW5BgseOeHULbBRBmI8dW3PdQMiGKZwy99UutvOAPFtxRq7RTm
	WP0qKov51A1RBpaIt0o0IlQoJtBGAQN59chRJpIW72JzPNws7fCRUxvS3ECk5SbV+HBpMwA07KiOd
	cHWw7VcfoF12xPSxMZNyd9tmlyU69Fy9fPORFb+qTRwXgpHcaS31eeBMIHyoXHXoK7CZcVUImhIuE
	lag0BFfBB4/YVYbPaOKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQt7n-00EMhg-J1; Wed, 24 Aug 2022 16:21:03 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQt7k-00EMfb-7X
	for linux-riscv@lists.infradead.org; Wed, 24 Aug 2022 16:21:01 +0000
Received: by mail-wr1-x42f.google.com with SMTP id u14so21382465wrq.9
        for <linux-riscv@lists.infradead.org>; Wed, 24 Aug 2022 09:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=S2tBbgrx+25RpWaqCl+haIdlbySiWC0Xb4SRnNTuZLo=;
        b=CaBBfJ6zzlzSH8t+T5KGfrvMzLAi5AI0eoDZAVk0yw3cSoKl5RoetN0lKoKeWRh6hP
         r5P8edcEbxW/Ad8FhnLpgrcKO9nzODroDxn0URodX5a9zfEmMBvyQNrmKmfKBYVQHrWN
         TOX3+urD81gS9Ih4cs9hl7+KIvMTFFBJQlmcNWfGci8wUyo2NUiyTmh4MCkSTbDEhalM
         ccAX+7RJgQlxRHJ90k2FI02f6/m0gmf3lK0EziSkKN8eoc85597K8AE4NAwEifpHvNgV
         APwCV35SmUdKYbIxqZ2tLbzCVxnjNZX4poPem4awdsY1nLjYErALPj0Bk98N1GnJdR3t
         cNdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=S2tBbgrx+25RpWaqCl+haIdlbySiWC0Xb4SRnNTuZLo=;
        b=naM0lWOLMkrKgVvVYvbeuL9QoeQ32LvSI9SRvFZ4b6dhSkYs2LnPt/9V9hQAtb5VHw
         +a8Z+3i1Fyv8nq+voUnsYe13FrLKzjPu51y5baymQ7EIJBjPKEjOxQmdrlBxd446vEmY
         TPqTpIhAVwfDTSKi2CbXzoD/0R7LYVYOG8FRtVzdllFi8XgbTfwWBrFTh1WDcBYC2vOt
         20qvIk5iy672QZNAMIF4xq0EhkFgwscfFCmzE3mxAz+JF3y7i+D/y/qTUU0dI1WcRgTH
         PMQCB7b3a2w8Akogo5/CdUlZDmZkiNY6syMfSsWdPNTd8t6VH8oMmf35vKKx11XP0xsk
         42YA==
X-Gm-Message-State: ACgBeo2v3SqewgJ4jdchS0neY7pLVk6IwdIHrKp17iXY5r1gLrSTcfG1
	cGEl4nW59bi7NlnS1eqTEm3sgQ==
X-Google-Smtp-Source: AA6agR4/6nKKtxFMnoCc84DqrjQsVm+cjtB+x8R9A0ftf1MIYOg7bI7gO59Np7Of33NfYpXfhEp05Q==
X-Received: by 2002:a05:6000:221:b0:225:464d:b096 with SMTP id l1-20020a056000022100b00225464db096mr24122wrz.32.1661358058303;
        Wed, 24 Aug 2022 09:20:58 -0700 (PDT)
Received: from henark71.. ([51.37.149.245])
        by smtp.gmail.com with ESMTPSA id l6-20020a05600c4f0600b003a690f704absm1903582wmq.4.2022.08.24.09.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Aug 2022 09:20:57 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Rob Herring <robh+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	Conor Dooley <mail@conchuod.ie>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: (subset) [PATCH v3 0/7] Fix RISC-V/PCI dt-schema issues with dt-schema v2022.08
Date: Wed, 24 Aug 2022 17:19:44 +0100
Message-Id: <166135795510.3741278.5608627370699269871.b4-ty@microchip.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220819231415.3860210-1-mail@conchuod.ie>
References: <20220819231415.3860210-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220824_092100_328339_C2CF5C07 
X-CRM114-Status: UNSURE (   7.60  )
X-CRM114-Notice: Please train this message.
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

From: Conor Dooley <conor.dooley@microchip.com>

On Sat, 20 Aug 2022 00:14:09 +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Hey all,
> 
> Got a few fixes for PCI dt-bindings that I noticed after upgrading my
> dt-schema to v2022.08.
> 
> [...]

Applied to dt-fixes, RISC-V should be back to 0 warnings in the next
linux-next. Thanks!

[4/7] riscv: dts: microchip: mpfs: fix incorrect pcie child node name
      https://git.kernel.org/conor/c/3f67e6997603
[5/7] riscv: dts: microchip: mpfs: remove ti,fifo-depth property
      https://git.kernel.org/conor/c/72a05748cbd2
[6/7] riscv: dts: microchip: mpfs: remove bogus card-detect-delay
      https://git.kernel.org/conor/c/2b55915d27dc
[7/7] riscv: dts: microchip: mpfs: remove pci axi address translation property
      https://git.kernel.org/conor/c/e4009c5fa77b

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
