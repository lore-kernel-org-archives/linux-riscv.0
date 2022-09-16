Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEFE1C54EE9
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Sep 2022 14:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=YwmQFuc3CgUk1nMTXWKW4i/t0UmLsQHAycPs/YO/zfs=; b=bCEyHeKWJdyldPiSTlsnY0arEA
	+sSHCNAuEZ4TZ/aZ27DmYqZCEUiBrqLhcWfYY/O7BYTG8s2DXh22HGu0Zoepdu5D8039HArEZ3as7
	pI8izCZsawyccq2VFy11d62N8qESl3lYzqDIRuB9Av6LUFbo8REY3SkkGegbKQxmPy5BCCXEWKPiX
	0LE03cdMStjWQ5InShZcFTLYExJkTjVPPDnV5p2hvLUKTc1ktDgGvvbqDUZQBKCsgFMSM2Wtu2+Jo
	+p49qchwl4hMt93yxyPe5U4YKAHAY2+/GrjjRY+8hFR29k+/SLk5g26SP3UeRx+C+x6n53NkFd85V
	1lMjH8Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZC2U-00DzXB-Ij; Fri, 16 Sep 2022 14:09:54 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZC2R-00DzRT-9b
	for linux-riscv@lists.infradead.org; Fri, 16 Sep 2022 14:09:53 +0000
Received: by mail-ej1-x62e.google.com with SMTP id dv25so49640251ejb.12
        for <linux-riscv@lists.infradead.org>; Fri, 16 Sep 2022 07:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date;
        bh=mWuOEb39dsrifbXR5pI+6YOaYogeAHZY8tuH0kRdIyo=;
        b=T84bpsh+ew5HakL1aCzNIjOBAe9cqHvCCuWPPY37eky7gKn86AHHbjomV+ZHe0Ce2q
         xEAjwYZ64rv7bAtwDx3NWNbZP6MYI110ZwKbZIXTN3Bz902vmtZKlsMJ2koZN+i8riaJ
         pILdaWrq25NXiLuFw9bp5n9FKT1qjDdBbdhdLdkoge0IAa3PZX9RANUbpYtRH3fj+VIF
         o9agexMYFUPurF7uZFXtimX6eHaNJNSSY3wJbjwqBsiBOtRMy6BoaRq3Go/Eyfe09ku+
         2BS1be41z+ttA4ZE6mVpNUWJqlm/1y1qttpOXjaKUfA4QD8PSa5EESAXNtzoZqQVkpg2
         P7ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date;
        bh=mWuOEb39dsrifbXR5pI+6YOaYogeAHZY8tuH0kRdIyo=;
        b=VIIXHGsoKpoAGF/yyYB6Zo5C5AZaseF52YD3YKLkXAr9hlLbLwU1BgDtneTJPzbPEu
         aJg2CUtcZ7M03uVoVEeGkSUbgQI9S5ESRjqSEA9UkjCYVo6rpnM/i16fN+57Moj9W+Jh
         1r6l7CdzyEJ+VdiIznh29L0Q5ukbU6svHSfI+3vNsrAYwyPkcLW/+M9FQhZbYTOrKnN9
         RvhpnqY8NmAChq2k9rokjus7WoDexiQI1sCxZ/+WdOlzz+fEdMheKmnOu4jVMvlo7w96
         Uv+ii/cHj8so6iR+UEnucWzbSih1JZ2FbHwJI6/5BZAtUy6VO66n79+3HMz4D4rD9UJ1
         vupQ==
X-Gm-Message-State: ACrzQf3659fNXhqp7/+mqTxsykmoJ4wXql6+APgSvk1JfPU+A+aVBWrj
	X42KlUCBss0ADGO/8cSe8yvrnIPVjIzGoWD+7+Q=
X-Google-Smtp-Source: AMsMyM7bYQxVSNBFmEk0qjaFwUXtddEICwBNpO1xWfqInXyk5N4QjD+BMrrwjG+Uhw6cRJTLmLd+0A==
X-Received: by 2002:a17:906:7621:b0:750:c4a3:8fcd with SMTP id c1-20020a170906762100b00750c4a38fcdmr3928686ejn.180.1663337387335;
        Fri, 16 Sep 2022 07:09:47 -0700 (PDT)
Received: from localhost (vpn-konference.ms.mff.cuni.cz. [195.113.20.101])
        by smtp.gmail.com with ESMTPSA id ju19-20020a17090798b300b00741a251d9e8sm10703614ejc.171.2022.09.16.07.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 07:09:46 -0700 (PDT)
Date: Fri, 16 Sep 2022 07:09:46 -0700 (PDT)
X-Google-Original-Date: Fri, 16 Sep 2022 07:08:33 PDT (-0700)
Subject: Re: [PATCH] RISC-V: Add support for Ztso
In-Reply-To: <c8004a8f-235e-083c-2dcb-7fa746bad421@microchip.com>
CC: linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Conor.Dooley@microchip.com
Message-ID: <mhng-b0281abb-e0db-4cbc-a38e-e87aa26a26de@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220916_070951_550995_EA57D9FE 
X-CRM114-Status: GOOD (  14.37  )
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

On Fri, 16 Sep 2022 03:00:35 PDT (-0700), Conor.Dooley@microchip.com wrote:
> On 02/09/2022 04:43, Palmer Dabbelt wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>> 
>> The Ztso extension was recently frozen, this adds support for running
>> binaries that depend on TSO on systems that support Ztso.
>> 
>> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> 
>>   /*
>> - * This is used to ensure we don't load something for the wrong architecture.
>> + * Binaries that assume TSO cannot be correctly run on non-TSO systems, so
>> + * prevent them from even being loaded.
>> + */
>> +#define EF_RISCV_TSO   0x0010
> 
> My only comment, and I asked this on the other patch too, is why is this
> not s/EF/ELF like the other defines in the file?

It's EF_RISCV_TSO in the ELF spec, and that's what other ports do (see 
EF_ARM, for example).

> 
> Thanks,
> Conor.
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
