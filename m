Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9DBBC6FA82
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Sep 2022 10:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=eTnjTVaXQhAObFiVHObRqOhalC8lgpPqVl8mKch5SJ0=; b=Ur+CVb0Sf9QVQdQsdhfuN2MWof
	GpXrbB1TACPCcOoeQEUeiRhwQ33KEAkdmUKxzPb//+oxPQlJU3Edd9+wxyNmEQgvWFx+FfDMdDtXb
	t6ggxDFbeWdepTZqX8Q/bTv3szOs9F3XIZK8yw+BKDXE7NH+60hBJUGzMZ0PTDaAQLtD4CGuFqHux
	5iLd92LthZ+WorBIyZ2oLKHId1xq6n9q1FD/ydPkyMoB8KDYwV6ge/ACX8Z7W0JgaMaNEUCpySBD2
	hN/Wb49Rl8SimGkokBKyJdjQx1/M3qp1dyJigmo14MGDgeX/FDb0OHT3ACnfvxg0d2egNvAfBsus0
	4m13IEhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obgBy-003jvI-3J; Fri, 23 Sep 2022 10:45:58 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obgBu-003ju8-Tg
	for linux-riscv@lists.infradead.org; Fri, 23 Sep 2022 10:45:56 +0000
Received: by mail-pj1-x102f.google.com with SMTP id fv3so12614022pjb.0
        for <linux-riscv@lists.infradead.org>; Fri, 23 Sep 2022 03:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date;
        bh=A2UDlAx5+SKGAglBHShYwynk/jxqHNOBih9lYYBchl4=;
        b=nQPpeJSVcOIdmLUK3tm9KDhx6mx0LEQX4X1zJqBj3+2M8SFsElYosjzr5dx0z45W0y
         bTPsnwNRKJhuuadx/2+kDEvonHZIGkUknB5U4a/iSngWn+ST4BMMavw1gxvUL4z4vHhz
         N0GSEbSdHc6M5EPAfslm6xe4PaCmvaK3QAU637Wivs7AFZlsrUm3ie1KmP5dTa2Yihir
         8xU/tfd655he1Dtrn25IXbuYRpRZuRu+QUW/1p8oO2aHG+rw9Yi3PpEW0wAQ58qKazIQ
         yttMYEtIm+Kx3ndWaSFhoxneCIGsdibftItsfv7b810brH04kbt+A/AMK8NiVcAxAhRY
         aTlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date;
        bh=A2UDlAx5+SKGAglBHShYwynk/jxqHNOBih9lYYBchl4=;
        b=ySHTJMUAJCUH6gePKq31Z3AYYvj/27zVIwDQ/z9GWGb+KI67dx7Y843NLgyPE6gmB3
         dbnPPfhCH0Ds+iiRqBA47QcAjTksjLINg7FLbwiUpqtFUJ6OmT7UVGND/HfYCkrdck9l
         Pv0hEqcf5/Za9I4d+VFjJkMOjJwmXFR10y9Narare7zYth48l+XpzQ53lhx2wu8uptLW
         Fi38uxd9fUAPAVFgBXPeyV1vZAtT7oymaYFSoNed/ojbme53wZASucLOVW4wrgxdfa5H
         9d2UrQvK/MH/Tuyf8727cbJ3yEOnFrKVI+mtyAVMQifz3AT50MILT4et4FgAso/+04se
         UmaA==
X-Gm-Message-State: ACrzQf0oD2cJJGrHuYxTN2OwS7BVqfUPwl7W/RtInrA2gBYaYHIdTK32
	nvlMAwLKJFugFwN4JU0ERH1VOl+o/J1KkcCA3QSb8Q==
X-Google-Smtp-Source: AMsMyM4+uJ4wCipj1NfnnfwLCz8OqJgQ320hGpILdENSSZPqeEcBxZX5t5GeFvGQ4uy4YwzEKcN6Lw==
X-Received: by 2002:a17:902:bd02:b0:178:1a1c:889 with SMTP id p2-20020a170902bd0200b001781a1c0889mr7882012pls.107.1663929949846;
        Fri, 23 Sep 2022 03:45:49 -0700 (PDT)
Received: from localhost ([88.128.88.52])
        by smtp.gmail.com with ESMTPSA id e7-20020a17090a7c4700b00200a85fa777sm1353386pjl.1.2022.09.23.03.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Sep 2022 03:45:49 -0700 (PDT)
Date: Fri, 23 Sep 2022 03:45:49 -0700 (PDT)
X-Google-Original-Date: Fri, 23 Sep 2022 03:45:45 PDT (-0700)
Subject: Re: [PATCH v2 1/4] RISC-V: Fix ioremap_cache() and ioremap_wc() for systems with Svpbmt
In-Reply-To: <45de6e04-b19b-4ffe-878e-6ba8123f2aef@www.fastmail.com>
CC: apatel@ventanamicro.com, Paul Walmsley <paul.walmsley@sifive.com>,
  atishp@atishpatra.org, heiko@sntech.de, anup@brainfault.org, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, mchitale@ventanamicro.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <mhng-9fd8dd19-53a3-426d-9d1e-3093ea6034fe@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_034555_219222_2ED86B87 
X-CRM114-Status: GOOD (  20.53  )
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

On Fri, 23 Sep 2022 03:35:50 PDT (-0700), Arnd Bergmann wrote:
> On Thu, Sep 22, 2022, at 6:35 PM, Palmer Dabbelt wrote:
>> On Thu, 15 Sep 2022 19:24:55 PDT (-0700), apatel@ventanamicro.com wrote:
>>>
>>> On Tue, Aug 30, 2022 at 10:17 AM Anup Patel <apatel@ventanamicro.com> wrote:
>>>>
>>>> Currently, all flavors of ioremap_xyz() function maps to the generic
>>>> ioremap() which means any ioremap_xyz() call will always map the
>>>> target memory as IO using _PAGE_IOREMAP page attributes. This breaks
>>>> ioremap_cache() and ioremap_wc() on systems with Svpbmt because memory
>>>> remapped using ioremap_cache() and ioremap_wc() will use _PAGE_IOREMAP
>>>> page attributes.
>>>>
>>>> To address above (just like other architectures), we implement RISC-V
>>>> specific ioremap_cache() and ioremap_wc() which maps memory using page
>>>> attributes as defined by the Svpbmt specification.
>>>>
>>>> Fixes: ff689fd21cb1 ("riscv: add RISC-V Svpbmt extension support")
>>>> Co-developed-by: Mayuresh Chitale <mchitale@ventanamicro.com>
>>>> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
>>>> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
>>>
>>> This is a crucial RC fix. Can you please take this ?
>>
>> Sorry I missed this, I thought it was just part of the rest of this
>> patch set.  That said, I'm not actually sure this is a critical fix:
>> sure it's a performance problem, and if some driver is expecting
>> ioremap_cache() to go fast then possibly a pretty big one, but the only
>> Svpmbt hardware that exists is the D1 and that was just supported this
>> release so it's not a regression.  Maybe that's a bit pedantic, but all
>> this travel has kind of made things a mess and I'm trying to make sure
>> nothing goes off the rails.
>
> I think generally speaking any use of ioremap_cache() in a driver
> is a mistake. The few users that exist are usually from historic
> x86 specific code and are hard to kill off.

Should we just add some sort of CONFIG_ARCH_HAS_IOREMAP_CACHE and then 
ban those drivers from everywhere else?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
