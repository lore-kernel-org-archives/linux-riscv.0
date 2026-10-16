Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5CE0CCF2C6
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Oct 2026 21:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kRWXBPPK9JotqtQt2afpZiVY7smOplrhLDeeXGbjMOw=; b=FzlaFldJtsd1I8
	zS5vao1XgdN9A2WmqgWdwKWzTs2IuLn2CsZFEhZGjvfgU/His+m90hH8VXYN2l+eVA9gByIDHSQVv
	9vQgWN/+SmSYiy6sGpOTPQy3XDf9m2aAToOu4iLpcNeL5xoIWyQVix7EoqDmHIDBgOCBhrTNr+qn7
	JavU0Ki8ejv/IoGXanl9SryBVOlDYKuhm1pleDktGLA5NFP/wRdY2XJp+0obTeioPslwlUlUXx1sE
	q5jo8jpM6VIwi3W0M58WuE6+eaH1h1t6biWF3l5Xn9dzb93c7SO+mmAElIDT0MTj4gz/Fhgy8Tv4/
	CWlDYart1ACM6p9M34Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHpRK-000000046Ad-48zU;
	Fri, 16 Oct 2026 21:26:12 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHpRG-0000000469t-0jTJ
	for linux-riscv@lists.infradead.org;
	Fri, 16 Oct 2026 21:26:09 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-8b06c0794cfso3959617b3.0
        for <linux-riscv@lists.infradead.org>; Fri, 16 Oct 2026 14:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1792185965; x=1792790765; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C/9EvAh0DiBmuccCLogZQl2FRIGsKEe6kxcC5UHFlPI=;
        b=LvsoSM7nkwrOjPCgbO2ggk6myw6FEM+A67+poH6lrahbPC/H5ltzWFu9m5TsEalfvq
         i2RUkrhbGoDsT8GXYKzkMfIql+DX9VjuXmrWKPaCWEcynukW6Wm+y1mKEdf+PxhaCszv
         0a0QwN2f2Z6bDGMOxzCixY4CZYq5UTdTLrxDpqGHxiSSTOnwesiyrkS5vAoWKEtxXgCn
         OJCCTGNXVB61vk2AqHa+RhhpgbQLIFzq3MuUgAtGQg1nDbvYP9k6kwJYu7vFDUvK0/2Y
         3FlNsEbccWCvnI2O2osFiAKSj7K3MMkJtJXh4MOoEtgswRgjFtnbjZ7NRYyDsncAsYiG
         JMZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792185965; x=1792790765;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=C/9EvAh0DiBmuccCLogZQl2FRIGsKEe6kxcC5UHFlPI=;
        b=SZSnpr7Dfmn86ngNuTh5AJ0akT3+6PyZvXUIHoifLQ1bsUhiwOJGT7l9vyjMHvBaCN
         9CcC0N22lmXPHwnrKHM1+tfErbLPZncq+STbOe2dad7QpCWdtNA1FG0kr8h7FQ3R0f4L
         X1R0mgu+M2LDCVXo47xL4sBNyCF2IzZ3xohSNQ3Htge4Cz8pwEHcepxEAafR0FTm9Q1Z
         tPd02ruGBnz+t4dKYnvmbMnMNJbWrmiaiIdB1wk2Z/2Gkj43jpkJ+Oo5bWenJEfSksjM
         88P3gD0ek51esHVsLeCb4YdASbmyeZJpLOHR1Nql8samm6PzkYFbTPFv51dWAJPDwsle
         e/1w==
X-Gm-Message-State: AFq9FYIBmqpkZsHM501fFsCebETayqSHl8s6uRmq3oN1QDY61TfRNQqq
	Q2vy7b9kzw8ne5yyU8fhvt6jl/xp8eWNDk7376cK7QIndhGqVaXuacP3XBWS41lOBSk=
X-Gm-Gg: AYBFou140GuFO6kJeStg0I7sZxC7bD2CAUfyE9CEJtXBefKHjyopDxo28mWWc+VVK52
	mp+PAydBbMZaMVHkRRL+ckma3TOLyU46vm1W0sfIZZJuQx6sfOz4MiLkpWrhIYGsZreb8c0gAHb
	/b6alDhz+vhtO7f5ErQ0VyROaRR/xSvC0hhOEOFy1ch8n/RkibQ07qEBGHyhH1eH1CTub2anvMa
	CtIeoLzWsOsz1Hu9mnCvaz7+8g9+HLbnJD+2+pUujvJfaPlG8D3zGpH1ybB1AuU9cgmzEqC8or9
	oDSZsXQZNA7yWlhEE4nPP0dlfg9Gu0VixwLgFjmV8rPcnCBzVwCJv2HOe7ABuNwOnDKhR+3ZwOF
	Umf1cYv2wOy4GY7UId6GAAm7h1r8+qwr5+ibJv6v7dEg/LBk3b4Ik0Fn384HGjvMgfQACYZU/xY
	26eb5H1ilaGOmeCEZhANEQ3cPNZOPmx5ABGsWpDIZ1+5HkN33VWkMZ7FUybWnUwVTcsF3zUUQ9c
	rR8AX7Dpi419N20EpdE
X-Received: by 2002:a05:690c:5:b0:8ab:6374:5637 with SMTP id 00721157ae682-8b0f216acadmr6613397b3.28.1792185964930;
        Fri, 16 Oct 2026 14:26:04 -0700 (PDT)
Received: from localhost ([2600:1700:220:5c80:6dfb:85d9:d6b:fdcb])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b0e5728d72sm13958567b3.5.2026.10.16.14.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 14:26:04 -0700 (PDT)
Date: Fri, 16 Oct 2026 16:26:03 -0500
From: Andy Chiu <tchiu@tenstorrent.com>
To: Radim =?iso-8859-1?Q?Krcm=E1r?= <radim.krcmar@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andy Chiu <andybnac@gmail.com>, Guodong Xu <guodong@riscstar.com>,
	Zong Li <zong.li@sifive.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>
Subject: Re: [PATCH 4/6] riscv: hwprobe: Report Supm only when available
Message-ID: <atKWa5PU2ECSgocI@Tao-Chiu's-Mac>
References: <20261006075303.205216-1-radim.krcmar@oss.qualcomm.com>
 <20261006075303.205216-5-radim.krcmar@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261006075303.205216-5-radim.krcmar@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_142606_943882_504BDF1E 
X-CRM114-Status: GOOD (  16.08  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Oct 06, 2026 at 09:53:01AM +0200, Radim Krcm=E1r wrote:
> The RISC-V ISA defines Supm as
> =

>   "An extension that indicates that there is pointer-masking support
>   available in user mode, with some facility provided in the application
>   execution environment to control pointer masking."
> =

> Our facility always returns -EINVAL unless Supm support is configured,
> the pointer masking ISA extension is globally present, and the user-mode
> is running in 64-bit mode.
> =

> Hiding Supm in compat tasks would add complexity that doesn't seem
> justified as 32-bit code has no reason to look at Supm anyway.
> Reporting based on the a global sysctl toggle isn't done.
> =

> Do not report Supm when some harts lack the extension, because it's not
> available on any hart in that case.
> =

> (Reporting Supm when only PMLEN=3D0 is supported isn't great, but doesn't
>  violate the text of the extension and we ought to have Supm7 and Supm16
>  extensions if we care about precision.)
> =

> Fixes: 3c2e0aff7b4f ("riscv: hwprobe: Export the Supm ISA extension")
> Signed-off-by: Radim Krcm=E1r <radim.krcmar@oss.qualcomm.com>

Reviewed-by: Andy Chiu <tchiu@tenstorrent.com>

> ---
>  The compat hiding and global sysctl toggle better fit in Andy's series.
> =


Sorry, I am not aware of any ongoing series that does the compat hiding,
but I will keep an eye on it.

Thanks,
Andy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
