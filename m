Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9627DC54EE9
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 16:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9hDQz1fn5UGWmUd+HoTUln3kivgFvw6adsXYbZXlnqE=; b=xd/tgjSNd2YqLz
	c5v0Vwmzqsyz3sl4vaaxNYtEhuIHhun8ITrh9E9KXaU8Rap1gvOxmhBzE2N1kkLhyDRERcKRr8gLW
	t7Ehfs4PfJ6i21Srdy30GPobIt9zmmjT0h3ys6HbTHCUpdVo4wayzHonNivZziVriBdpRy9DezyZM
	epQKXlzrJLQBkLlEMUPlctKx0fSxMeerF+2XRKOrcPpkk4YS8ZKRpTBXs9EIrEDwEcL0vUm+8fGL3
	WJm+LCxFntpnBz0BXcOWoDwDS01KnKLdzOl7xSXrKtt5F/aLxqN74iu+9+LQIN8SxLxdnA2khJ5A+
	xvocRkhNcIausnhGuOdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWKnO-005zgG-Vj; Thu, 08 Sep 2022 16:54:31 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWKnM-005zcy-E0
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 16:54:30 +0000
Received: by mail-ed1-x52b.google.com with SMTP id z8so25323195edb.6
        for <linux-riscv@lists.infradead.org>; Thu, 08 Sep 2022 09:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date;
        bh=HYkXg+VQoVJj6IeGT/00BbjRESyJ1qTq+hPTwfNkG3M=;
        b=hVzEqYOplJiXNR0qXrqsMYGZoQbw587ASqutE/A55+sAOSlXgJ6GspWw2Ym+KjLXka
         fiaxTttTHvmbRlwxo1yprNkcGenIVm6v2Nx49Qv2Zm4QSy9S8vifjUDjmK3oX8Z98Yo8
         bXcHGCio0UTdcRTGn8wGqD+Uoj25XuP7XM2ccT4/Qbk5b3NKgr+0h4Wa+bgePeLKzxiL
         0STAI6oYqdIVxDXN6v5uRIXR/ozWRqSQ13UusKfeaHj4taFCEbCOxSPG21ZaNBMSR07O
         deGGGFuhD+92QUnaNMRrtxFDvv/JvmWyyGNsKNedGV5QaxIuI7Rzn4JNlNN+3SsVpdbb
         WvGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=HYkXg+VQoVJj6IeGT/00BbjRESyJ1qTq+hPTwfNkG3M=;
        b=yjspaB+v6cLikVTf8DLIY8pZsxUu6Up+z3fkRd2lHP8WpR0OcMqHZ1Q9f5fRQnWM1I
         OTBaH5wd7GzV3T9X2S3zGhT9LCHasIm1BKvgmCO0WLUeORSSmzWYPyDBMUp3CBLqIPkF
         El/979PpVFH/FP81NZMVfCDYwfvyWXEMnYCTLan8xJQvHvXo08N0AU4RgquCWR9lTpAc
         qkd9PJNi+0URsUSBywkbaky23LDn5o4RPq1QQmCeW3gOGxMdfYlh8s+L1TvJHZsc12iL
         TbyZ/1jgxwbsB1F+eWwG4m5NVQjySfweQfwoyt5TEZxHghFJevsv2YK3G5rnSQayjZPd
         Ck8g==
X-Gm-Message-State: ACgBeo3nlzI6vVQlMgIG+2vvDaY/VAjw/tHZiocJDiWqdB+iXIAMCADT
	LZZ+4UsPsPwZ0a31j098MZHkRQ==
X-Google-Smtp-Source: AA6agR4SmpRJpS84G3cq6HUzYMumaeFB7osxWETQkEUI/Bqq07vVb7t+xdKEmnn+1JHPpxc05yZ18A==
X-Received: by 2002:a05:6402:d05:b0:425:b5c8:faeb with SMTP id eb5-20020a0564020d0500b00425b5c8faebmr7831185edb.273.1662656066618;
        Thu, 08 Sep 2022 09:54:26 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id eh13-20020a0564020f8d00b0044f0c01196esm3628593edb.65.2022.09.08.09.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 09:54:26 -0700 (PDT)
Date: Thu, 8 Sep 2022 18:54:25 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, anup@brainfault.org,
	mchitale@ventanamicro.com
Subject: Re: [PATCH v2 2/4] riscv: Introduce support for defining instructions
Message-ID: <20220908165425.ikiyrmhtbwkmko23@kamzik>
References: <20220831172500.752195-1-ajones@ventanamicro.com>
 <20220831172500.752195-3-ajones@ventanamicro.com>
 <3006889.o7ts2hSHzF@diego>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3006889.o7ts2hSHzF@diego>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_095428_507246_2C8F9584 
X-CRM114-Status: GOOD (  13.82  )
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

On Thu, Sep 08, 2022 at 05:49:44PM +0200, Heiko St=FCbner wrote:
...
> > +#define OPCODE(v)	__ASM_STR(v)
> > +#define FUNC3(v)	__ASM_STR(v)
> > +#define FUNC7(v)	__ASM_STR(v)
> > +#define RD(v)		__ASM_STR(v)
> > +#define RS1(v)		__ASM_STR(v)
> > +#define RS2(v)		__ASM_STR(v)
> =

> you might want some sort of prefix here
> 	RISCV_RS1(v) ?
> =

> While trying to adapt this for the cmo stuff I ran into the issue
> of bpf complaining that "IMM" is already defined there.
> =

> And names above are generic enough that these also
> might conflict with other stuff.
> =


Ah, thanks for the heads up. Indeed, if this gets included in another
header, which gets widely included, then we have a good chance of
bumping into something. It's a pity, but, as you suggest, we probably
need prefixes and __ isn't likely enough alone. I also see __REG is
used elsewhere.

Thanks,
drew

> =

> =

> =

> > +#define __REG(v)	__ASM_STR(x ## v)
> > +#define __RD(v)		__REG(v)
> > +#define __RS1(v)	__REG(v)
> > +#define __RS2(v)	__REG(v)
> > +
> > +#endif /* __ASM_INSN_DEF_H */
> > =

> =

> =

> =

> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
