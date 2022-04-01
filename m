Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88BD1C433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Apr 2022 22:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=1v/2PAghJGGtFfcZ7PJr1iRYKexj1gVUlgpp53st2D8=; b=xnQBsb3IwQ0zzQG0slhdI+aXZF
	3f+u+L5LR5ZYc4LjDKKyPe5fgnMasND3FzOmsSp95JaRRONYXDLXYwldSFKERFUPi7yF4ROf6UXeG
	5ZWgqg8rzGegep4CWR+Dvi0/MXqiUlU9Sv5aGGLoJXgJ792PTQFVCypcC79Tvgc7ZeFEYSQJPIz9c
	4OpzUcyh/lHUIAgv9fuMDffWt7bmb6VA+uGF8kjliFwkml7tm9xAcRFW/SsaGWp7T5YO1BdWh54ia
	6ilIGk5RaRVImZaeymBOq7uLvW/IF9ttF0ToEr6BqCwTpKilsxCrh7DNMwydxx1e4OTeN/AuYm5/l
	ibLNGBFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naPj5-007U3s-VG; Fri, 01 Apr 2022 22:26:39 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naPj2-007U3A-L7
 for linux-riscv@lists.infradead.org; Fri, 01 Apr 2022 22:26:38 +0000
Received: by mail-pl1-x633.google.com with SMTP id y6so3617290plg.2
 for <linux-riscv@lists.infradead.org>; Fri, 01 Apr 2022 15:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=hL8EOWPJGWOqw+OHvmJ0rPyDC9uu4lp7w06UAGgNiYQ=;
 b=OkaLEE9Ea//1wCZe8xLT6rX0RxVQuguU88/Yg5GMBlQYc3WWhpRhzHBBvs5pHf74bW
 ttLfcpl2y9uTuycVMewYQfXsF/m+nBt67aatHkJF6avXRL3HVENqJAD/GuJcjCmnttoJ
 zsMQ62F9aqSz8SuuWnUNiPHG2jnSBtaJZBYH7Y/xI0iQs38MWjHp7jNvCBY6dJQfO3ez
 05OkUZ3mjypCpq5yi/bU4eCX0CnShL0m1CylQfJxbTa/pteU+eg+DOh8lc6Zs/bRgcbl
 6Tpm7y77yEawxzwEmB6d7GWXw1EWxb2P0ZtdGstQ4V8Xe0dPZVBqlBvzP6aIvVXYI89n
 8qzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=hL8EOWPJGWOqw+OHvmJ0rPyDC9uu4lp7w06UAGgNiYQ=;
 b=X0rbidcbUOBQvtt5lsYwp9ptrGJMdML3l+xjVIDgRXVimVPnq7JfS9Zwct+je/3bSv
 qZX5wKtWP3RII1EVGdCSHgeCQiedYbLbuUlrcQEHELHrT/vZVtfmsuUura8b1eKkEBaK
 fqhS3auf6+CXuXr0djDSvy3e83Te6o75SbK1Z8unc6yVyh45Z+RogOt9TI7DJFvdQGKJ
 safu7XEC6K6jUfhdan5fjB8oYZfvGjRTtLDSQPsii69BW2E3d0Js33RSHgEIgbdePXmi
 fCR2ATgMK0sZ0KZAnjfy4qPsdHH72shFZ+wCUaCWZ4gfwbddTWgX0tTP9wyTzuA4kJPa
 7t2g==
X-Gm-Message-State: AOAM532Ky1hlu5YjvskxlpPsx+fkF0Kzh/hGtTyyW2m0qhpOrK+9mA5d
 u33Mx34L5lhsiXp1XBj0cZkjsw==
X-Google-Smtp-Source: ABdhPJx2DXYwk/E1pfjC95cynZA4QLNpg8tA47jB2+kLAG2H20ot637Xai8u+Ufjg7FGFOlOwDzxoA==
X-Received: by 2002:a17:902:d4cc:b0:154:3a3b:4172 with SMTP id
 o12-20020a170902d4cc00b001543a3b4172mr47834031plg.165.1648851994639; 
 Fri, 01 Apr 2022 15:26:34 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 b17-20020a056a000a9100b004e1b7cdb8fdsm4446449pfl.70.2022.04.01.15.26.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 15:26:34 -0700 (PDT)
Date: Fri, 01 Apr 2022 15:26:34 -0700 (PDT)
X-Google-Original-Date: Fri, 01 Apr 2022 15:26:32 PDT (-0700)
Subject: Re: [PATCH v3] dt-bindings: Fix phandle-array issues in the
 idle-states bindings
In-Reply-To: <CAL_JsqL8swP_NuMUiBeRrYhQ2XQct4uPxinOaE4dnn0K8mB1Wg@mail.gmail.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 anup@brainfault.org, guoren@kernel.org, krzk@kernel.org,
 lorenzo.pieralisi@arm.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Rob Herring <robh@kernel.org>
Message-ID: <mhng-fa8b59bd-f4b0-46c4-90e6-4dd41151afc2@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_152636_726125_DE7B3449 
X-CRM114-Status: GOOD (  14.42  )
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

On Fri, 01 Apr 2022 14:39:24 PDT (-0700), Rob Herring wrote:
> On Fri, Apr 1, 2022 at 4:36 PM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>>
>> From: Palmer Dabbelt <palmer@rivosinc.com>
>>
>> As per 39bd2b6a3783 ("dt-bindings: Improve phandle-array schemas"), the
>> phandle-array bindings have been disambiguated.  This fixes the new
>> RISC-V idle-states bindings to comply with the schema.
>>
>> Fixes: 1bd524f7e8d8 ("dt-bindings: Add common bindings for ARM and RISC-V idle states")
>> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>> ---
>> Changes since v2:
>>
>> * Add the missing schema requirement to riscv/cpus.yaml
>>
>> Changes since v1:
>>
>> * Only fix the RISC-V bindings, to avoid a merge conflict.
>>
>> ---
>>  .../devicetree/bindings/cpu/idle-states.yaml     | 16 ++++++++--------
>>  .../devicetree/bindings/riscv/cpus.yaml          |  2 ++
>>  2 files changed, 10 insertions(+), 8 deletions(-)
>
> Reviewed-by: Rob Herring <robh@kernel.org>
>
> Thanks for fixing quickly.

Well, sorry for breaking it.  I've got the DT checks running locally 
now, we've got a handful of errors in RISC-V land.  I'll clean those up 
and then get something blocking my merges, so stuff like this is less 
likely to happen.

Looks like Linus just merged my Part 2, I'll send along the Part 3 just 
containing this as a fix.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
