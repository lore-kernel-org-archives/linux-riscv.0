Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C07FCDB46E
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 16:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6aADplXY5zdDRUJrfYJATVJcPw0VwahJOprqMes4g0I=; b=CGtI4hkkStjHMb
	+2rChEboin9mVpf+colwg0mDQbJW42n9atJxkis2+uAWZKak4j8Tbg8LRS6qCsCyJR4etyUQh/3aK
	n8xmk7ym8SmF67WTJEm2jvdhwWbh/VExCWb/kE56qzZXlzZ7CJm/wXRV8aadz5HMqcV5HwopxMdI6
	HRDiDpZDjQmX1J2phSbYkYZf93riv+4vf/Z+vubAEbEFNZdgFe2HGL7Tzmoim8JymAtKNiKAJNRAv
	6MZ6q2y0XbbgNV8NRSbEbGek2gGVRRYQwCz9fQA+XhsQ6hUI9xD+AfU49e2LI1PJaaSZjDCYWDxFZ
	gcw0uJ2DFUuG/iVWR2hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqy88-001LjQ-2T;
	Thu, 12 Oct 2023 16:01:44 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqy86-001Lj6-1m
	for linux-riscv@lists.infradead.org;
	Thu, 12 Oct 2023 16:01:43 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-323168869daso1112181f8f.2
        for <linux-riscv@lists.infradead.org>; Thu, 12 Oct 2023 09:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697126500; x=1697731300; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VTbhzvErmpStLZfUh//JwFlSOdOLSJssVupnR6zsOoM=;
        b=mqPDe8wqM23IT8yWf7XRHYprW/o1vlZXeSjpWY/08JojambRNsk4qYhtWvBKY90JHs
         WlpwkIkrWJV7OcMy7blK1p9dzqUEhSXXJPsf+cuxF7q+MtyLwhp5SZ1ozuPxJPuHXS25
         4YRxrwhqhZVViLdMXoM5H+bwXY1oiQ29/GeCCCt3FgVDd9h7kVy738xXGaTotzeRnsCq
         xR4Hov66UHtcOq6Bn5H8M83wURH7eetWUvHLANLQHU8D1csPrsG3EfsX8y8MZ/TJaPp/
         yNDX8sqg7HO9Wwu1evA1WrrlPbxcfOjxPJc7Avv6lTHwnkvZcBErYD5KEdWnGkcm+AFv
         Jtvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697126500; x=1697731300;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VTbhzvErmpStLZfUh//JwFlSOdOLSJssVupnR6zsOoM=;
        b=RYVU55yzWUTiQWHmweFxIKGrR5nCxPQ8wXqiytYaamxQkUsaxHPl8dbP6l82Zp1X4U
         lbTny+yXgmwi66BE40O5UBHz5lv4FJImLdoc5QrRfh7ulWy089DXABDthEaBrICrV7Hh
         ky+0ENbaL05l4Bo9O2Uq9WVEPN7BzekHnqxINL9BIc2JJm1ySh4zju8Eu8PlqxBW1d7D
         pJLs7uOGUxo1WoVoLUcgEi5cHCu+mp1BXPUwWZa3hx8d9v4u3TehE0hoBVhMt9jUI0cd
         WlzmR/CyaZKBKOerWCIgvS/q1rsi5BKpk8DX9i3eIovD/hUpSUZXZoR8z5G35zF5ouTS
         8Lng==
X-Gm-Message-State: AOJu0Yz95+KUD0Xmk4s2sfhdkaai5q13E+mbxoQam2f9wvLos8q95ydv
	bGxnnc1teb/D2ODkDIzqKAfR5Q==
X-Google-Smtp-Source: AGHT+IEtbdiG57xXVKdbxEJNFdaaO7LLDt8OVBOTABrUrWOVXcXZAQ0o1IgPg5u8rAbZrVTcKuRtNw==
X-Received: by 2002:a05:6000:60a:b0:32d:59d3:2b4f with SMTP id bn10-20020a056000060a00b0032d59d32b4fmr6925334wrb.0.1697126499962;
        Thu, 12 Oct 2023 09:01:39 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id f16-20020adfdb50000000b0031ff89af0e4sm18697707wrj.99.2023.10.12.09.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 09:01:39 -0700 (PDT)
Date: Thu, 12 Oct 2023 18:01:38 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, leyfoon.tan@starfivetech.com, 
	jeeheng.sia@starfivetech.com, conor.dooley@microchip.com, apatel@ventanamicro.com
Subject: Re: [PATCH v1 1/1] riscv: sbi: Introduce system suspend support
Message-ID: <20231012-0cb15beef3128da9f3bd3299@orel>
References: <20231012072148.7010-3-ajones@ventanamicro.com>
 <20231012072148.7010-4-ajones@ventanamicro.com>
 <20231012-powdery-demeanor-4d8dde576f24@spud>
 <20231012-pulverize-founding-f459336028a2@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231012-pulverize-founding-f459336028a2@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_090142_629987_01C53EE8 
X-CRM114-Status: GOOD (  25.65  )
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

On Thu, Oct 12, 2023 at 02:32:46PM +0100, Conor Dooley wrote:
> On Thu, Oct 12, 2023 at 02:30:02PM +0100, Conor Dooley wrote:
> > Yo,
> > 
> > On Thu, Oct 12, 2023 at 09:21:50AM +0200, Andrew Jones wrote:
> > > When the SUSP SBI extension is present it implies that the standard
> > > "suspend to RAM" type is available. Wire it up to the generic
> > > platform suspend support, also applying the already present support
> > > for non-retentive CPU suspend. When the kernel is built with
> > > CONFIG_SUSPEND, one can do 'echo mem > /sys/power/state' to suspend.
> > > Resumption will occur when a platform-specific wake-up event arrives.
> > > 
> > > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > 
> > > +static int __init sbi_system_suspend_init(void)
> > > +{
> > > +	if (!sbi_spec_is_0_1() && sbi_probe_extension(SBI_EXT_SUSP) > 0) {
> > 
> > Random thought I had reading this, was that it'll be possible to have a
> > firmware that implements SBI < 2.0 that provides the SUSP extension.
> > FWIW, I don't think that that is problematic, but maybe I am missing
> > something that would make it so.
> 
> Hmm, next patch I look at is from Anup's debug console series, and he
> does check that the SBI implementation is at least version 2.0 before
> probing for the extension. We should probably have the same policy
> everywhere.

Yeah, the main reason I wrote in the other response that I'd prefer not
to always check version when probing is because in most (I think all
except PMU) cases it would only reduce the platforms where the extension
can be used, but without any reason to do so. For example, right now QEMU
bundles an OpenSBI v1.3.1 binary and that version supports both SUSP and
DBCN, but, if we were to add SBI 2.0 checks in Linux for those extensions,
then users will need to update their SBI implementations in order to use
them. While requiring users to update their SBI implementations makes
sense for new functionality or fixes, it seems like a lot to ask for them
to just get a bigger number in their version check.

(And then there's downstream SBI implementations which may end up cherry
picking extensions, so their version numbers would be hard to define.)

So my vote for Linux policy would be to only do version checks when
necessary. And my preference for SBI would be to try and avoid specifying
extensions which require clients to check versions.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
