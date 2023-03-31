Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18FFCC7619A
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Mar 2023 00:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1MN4VUuzCmIRUAl5uc7f9BXFAcbQsUzUGAH3rTfAdNE=; b=GhJHSknPKjLUWt
	dx9bO91eMtR8F0N30aL7come7fDBIn4OG3qiHUH0PC5kRufa3nKsfHCVdZ61iv+uiCNGjvcDZO+qX
	NDyTfAtPQPDb8XRjLxyb8kCiu3AkvSS/8jhxAbZb1tWPUVD1xKCkEdOZ54Kc60+e1VRWn9k2ga0rE
	JjcjO595TkSlq2Bd9DlLZSeNxY4oYQwgppSWpl9rsDxgPe4ZLz0v1Hw6txpN5mFOT912umTP1oNTs
	COTMiYXZhXHeDerp5mCYEd1eNAuAY3BO7kvaf00RLelXNx82dCyDeBeNwO3Mra47907U8G7/3cXuJ
	Gvg/MN1k9xiwjNY0YBIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pi2rz-005SrL-2O;
	Fri, 31 Mar 2023 00:43:55 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pi2rw-005Sqw-0Y
	for linux-riscv@lists.infradead.org;
	Fri, 31 Mar 2023 00:43:54 +0000
Received: by mail-pl1-x632.google.com with SMTP id f22so15646399plr.0
        for <linux-riscv@lists.infradead.org>; Thu, 30 Mar 2023 17:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1680223430;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Nh6wghJCLi6iSQ6tglI4Yg3G0qoglbH/jnqGu6JlHc=;
        b=snNtgbMxeWRQo9Fxv680K34bFazQibQcKc6zD+jN6Su4WV8xg80W/1CT/fsZV1xnPu
         kBKLJI5u3Rjdp4+lUZEazvuVJsAOz4zQb9QF8XsDtTLY9qfGIxrEvdEs0kHwLKl/9IVj
         jOT0g9y75Msc5pqyOhVIX4PeCuYE7hiGWj68dL++WEWmTVS3BPCOvyG7JRSl8iJySI10
         oPxyHDv0m02A4Zm9FXl1AEmJFmA2KLYbgo4k5u+79OS8mwWm2NVUuz1TWy1D3tkZJZhp
         bVwVaDm/hVsRhaoJRwWhFwPescSU5YAQkNMs0g2vDRfPJ+hjEmaF/pSS0HOjXQTNLIr3
         9iCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680223430;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Nh6wghJCLi6iSQ6tglI4Yg3G0qoglbH/jnqGu6JlHc=;
        b=PLiKp6G4mWqUa9RXZcSv+P1TYu6DWIJuiuYH4bvQWdZz+qdohL8swsYx0yShip1EtC
         vmUFsnKoDW42RT7kIljlP4w4iWt/f7gxnjimR61DXJD10dzizlIcdtDm5UU3O1FnImDF
         QL0oyN+/Ibqc5LLEQp8cz1d7xPkeVa9anCRGH5P22l5z+660s9Yo5ZXmtt1sutz/jtC3
         rz0y9y2vi2L59rArVJDMWuAhG03vRz/iUxMU+r6DCEDT3Eoqay7evKTy1qrb4ztuDcz+
         LKRBzmraC9geJvarwTrtj752DL4AKqp1pXkuHVuLklMkTNIE/haPh0bpPGbUMz+0tPV3
         mmhQ==
X-Gm-Message-State: AAQBX9cRqhY0Ad1czEFvEybe0n60AGtPoJcuoNifXcX871+G7AXP3VNi
	f22W/A3PgFuTzTxEkowO7mPxWQ==
X-Google-Smtp-Source: AKy350ZpyU/dWJs87ZyCBxyHo1HqiAqZRtM7Q5eHJAFeRkSFooc0RQeeZi6psfEZf3OOkH+IY+dYJg==
X-Received: by 2002:a17:90b:38c5:b0:23d:3f32:1cd5 with SMTP id nn5-20020a17090b38c500b0023d3f321cd5mr26786258pjb.26.1680223430326;
        Thu, 30 Mar 2023 17:43:50 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id jj22-20020a170903049600b00192fe452e17sm299404plb.162.2023.03.30.17.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 17:43:49 -0700 (PDT)
In-Reply-To: <20230324121240.3594777-1-conor.dooley@microchip.com>
References: <20230324121240.3594777-1-conor.dooley@microchip.com>
Subject: Re: [PATCH v1] RISC-V: convert new selectors of RISCV_ALTERNATIVE
 to dependencies
Message-Id: <168022341598.16896.1867829754046036531.b4-ty@rivosinc.com>
Date: Thu, 30 Mar 2023 17:43:35 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
Cc: Conor Dooley <conor@kernel.org>, ajones@ventanamicro.com, Jason@zx2c4.com,
  apatel@ventanamicro.com, heiko.stuebner@vrull.eu, jszhang@kernel.org, linux-kernel@vger.kernel.org,
  linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_174352_451231_96BE0B17 
X-CRM114-Status: UNSURE (   7.17  )
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


On Fri, 24 Mar 2023 12:12:41 +0000, Conor Dooley wrote:
> for-next contains two additional extensions that select
> RISCV_ALTERNATIVE. RISCV_ALTERNATIVE no longer needs to be selected by
> individual config options as it is now selected for !XIP_KERNEL builds
> by the top level RISCV option.
> These extensions rely on the alternative framework, so convert the
> "select"s to "depends on"s instead.
> 
> [...]

Applied, thanks!

[1/1] RISC-V: convert new selectors of RISCV_ALTERNATIVE to dependencies
      https://git.kernel.org/palmer/c/d34a6b715a23

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
