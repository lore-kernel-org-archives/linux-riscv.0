Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E239FC77B7F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 May 2023 21:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Fn+yiXEwzAdBgtrI6BkDjU1qr7X7L5+yZ6xR48fgs2w=; b=vHgSxspzvclzmKTfN+nPzb30Y7
	3wOGgJiU22qRaf/OiipBx21PtagEvC2WR2KnXnegaHNJxZqh7CoAJ8B+oLt8g9pIyB3bK9mAcpONb
	wPDXOosnvL/Qs8+r5etPFT6LpQyFnsCB3XkGcpUrOBQGAIlaJ9ij7PskYusLQqGps/9QuWMBiGxx2
	w6JpRwjJeb8IfPiKO0L1zEWpetoBG/wcDy632/DZzKxclzaEmJlXg7dvN2+5mpOl74f0XAFPhTY7a
	eTkgjxbt6ZZLNSzXFEBkZLI1amEJU7vXX3AxqBlt4jNlyS5FtfYU5AVv2DbJsftxHt2o0OGtpdSOi
	3FXM+hZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxaed-00D7vH-14;
	Fri, 12 May 2023 21:50:23 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxaea-00D7ug-07
	for linux-riscv@lists.infradead.org;
	Fri, 12 May 2023 21:50:22 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-643a1fed360so6251498b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 12 May 2023 14:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1683928218; x=1686520218;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HXshd51fH2+G3epdXCEAiwTlwyZiu61NCKXGF8cY8aI=;
        b=hijUWW7YGEiY7G1Qeg4PABKlij9oIFKh1iXUlbGTJjd4I+SL5j3NCzvgEQ8zoZT4aT
         wy192rGcvymwNscv/Tr+wKES91UJhfykzelovxv/OzgMvslZurtTmUk98kmx9aEDqPQ6
         jVublaFURukhXJqmbDLw4rC5OpSRojatblM3MW3l71zW9MQbcNeimQNcLs81fBxSj5nx
         26wlq4DQjCF38eIM11yBQYPYvPf0u+stV5IxKTsaR3e1OmkK/I2MZnCJcxrJNpocMEoy
         +8lVR/tWKaoFKAjL1FumNIGrc4eA22kUifLMAg+Vu0MDmCU0PgvX8UucR2n2o0bnTOFX
         BciA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683928218; x=1686520218;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HXshd51fH2+G3epdXCEAiwTlwyZiu61NCKXGF8cY8aI=;
        b=E2O/jwKBIAKR4siMRTaydy8ovPkZf9qjAPp2YuO8rdGZPiOt4ySmh/y8Vxya5Bwxa3
         Ru4MKZEbd1QXMONrE5a2bnRSqnkcQGTxz7HO24Z9OVo4N5ZvktJpQ45pgZp+CBdrq2/m
         u5S2gX3INvEMfV2ExlCBo/u5hNNNfzaYAv1tdclGZJotV/SLUFfvgI5NRD2AUo5AG3mP
         j93rk4tqhFYQaugg1+gePIheM49By8Fa3EBU4cJOPsujsHcmjTi+pKLScm8e6Jjr+zTs
         7EVxhEXiKqGnOUIUuXQnFgYbG7ps2fSjP8FMK4BhOob7+/El0qrzXgV7e4c35O0re+Gx
         pA2A==
X-Gm-Message-State: AC+VfDxGkNWKGGmtippHJef9erPgxE2Ud/tiFCtv8HjbUAJQ9Ov2OSvn
	N2cdbprHt493Ims2HPR4djofVw==
X-Google-Smtp-Source: ACHHUZ6QnDiLUa2/w2yCFZmwe7mkNFnoMETOFiVkUsq9LBgtSgJJRl8p+zso0mUoALLTMQiq9XEUWA==
X-Received: by 2002:a05:6a20:3d95:b0:101:36b8:f077 with SMTP id s21-20020a056a203d9500b0010136b8f077mr18764616pzi.28.1683928218180;
        Fri, 12 May 2023 14:50:18 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id 21-20020aa79115000000b006348cb791f4sm7503301pfh.192.2023.05.12.14.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 May 2023 14:50:17 -0700 (PDT)
Date: Fri, 12 May 2023 14:50:17 -0700 (PDT)
X-Google-Original-Date: Fri, 12 May 2023 14:50:14 PDT (-0700)
Subject: Re: [PATCH 0/3] riscv: sbi: Switch to the sys-off handler API
In-Reply-To: <Y6yLMwhSypqp5+Ir@spud>
CC: samuel@sholland.org, dmitry.osipenko@collabora.com, rafael.j.wysocki@intel.com,
  aou@eecs.berkeley.edu, apatel@ventanamicro.com, Atish Patra <atishp@rivosinc.com>,
  geert@linux-m68k.org, heiko@sntech.de, kai.heng.feng@canonical.com, mcgrof@kernel.org,
  paulmck@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, pmladek@suse.com,
  yuehaibing@huawei.com, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
  tangmeng@uniontech.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-1895c1c0-4bc8-4156-909e-c20fa66e82fd@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_145020_333185_E1BB81C9 
X-CRM114-Status: GOOD (  20.25  )
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

On Wed, 28 Dec 2022 10:30:11 PST (-0800), Conor Dooley wrote:
> Hey Samuel,
>
> On Wed, Dec 28, 2022 at 10:19:12AM -0600, Samuel Holland wrote:
>> I want to convert the axp20x PMIC poweroff handler to use the sys-off
>> API, so it can be used as a fallback for if the SBI poweroff handler
>> is unavailable. But the SBI poweroff handler still uses pm_power_off, so
>> done alone, this would cause the axp20x callback to be called first,
>> before the SBI poweroff handler has a chance to run.
>> 
>> In order to prevent this change in behavior, the SBI poweroff handler
>> needs to be converted to the sys-off API first, at a higher priority.
>> 
>> This series performs the conversion, after accounting for the fact that
>> the SBI poweroff handler is registered quite early during boot.
>> 
>> The first patch is a dependency for both this series and the PSCI
>> series[1], so I would like to get at least patch 1 merged soon.
>> 
>> [1]: https://lore.kernel.org/lkml/20221105214841.7828-1-samuel@sholland.org/
>> 
>> 
>> Samuel Holland (3):
>>   kernel/reboot: Use the static sys-off handler for any priority
>>   riscv: sbi: Share the code for unsupported extension warnings
>>   riscv: sbi: Switch to the sys-off handler API
>
> Not what other stuff has reboot support, so I gave it a whirl on
> PolarFire SoC & it seemed to work as expected:
> Tested-by: Conor Dooley <conor.dooley@microchip.com>

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

in case the reboot folks want to take these.  I'm also happy to take the 
reboot change through the RISC-V tree with an Ack.  There's some 
discussion about this in the previous patches.

>
> Thanks,
> Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
