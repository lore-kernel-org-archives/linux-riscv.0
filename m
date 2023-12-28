Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7A53C3DA6E
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Dec 2023 13:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Th+1lsNXCrKYagskqAystoCXwWPeWz6Mv1U50VH6qk=; b=01mq63QPJ43TpN
	gFA2Ri8ms+7JwNFxm++qeAblLPhhQ+OJoEbl1QtvPl6fzv2E+PnW5tFlg0Se0Xf4bul2bgOfS+GM0
	jh4U7qRKP7LagBqoR1avdQgKUfFC4L9JFPCvGsewq6ivHBU27zQJCZPqVs9hhKGS7VZ5PNHMumKA/
	hrKVhcfffYQsn2Vw9bbM+g+Ab9OTvH8E0HwrDgfSsgIgwTfbyzN1DDBgkCVzchB6tsa5G9ma0U16H
	07quIuHgoA35q5PX8uKjFLOll7+15uU0xjtH4MXvS0t9kUrHbm7b7lFHcrAGjh9dscoVXArIKse8S
	9W+lwkfu+vtltFE4JNNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIq80-00Gswr-30;
	Thu, 28 Dec 2023 13:08:48 +0000
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIq7x-00Gsvq-0E
	for linux-riscv@lists.infradead.org;
	Thu, 28 Dec 2023 13:08:46 +0000
Received: by mail-io1-xd2b.google.com with SMTP id ca18e2360f4ac-7ba903342c2so414928239f.3
        for <linux-riscv@lists.infradead.org>; Thu, 28 Dec 2023 05:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1703768922; x=1704373722; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2sTRWP1BfjExUpMIHeRBHU/LlMOrJyrRhsp9tBe90/E=;
        b=e/unpt3H2Dsey+Y/OpTsRGIOpCoVCr6LgbkYUTw4DzRw/O9+QPUifpowyos01olRqU
         Uhk2O6Mw0US82K0jWGCBKI/t8O4ywOjiVXw7zbKvpXJvXP7RNCMm8OfjcucCHKX+9Zc7
         0YQlpz7nlDtJ4lLJ7Deo9ji1TEeFSpUgtu0q7KfhfmJ7lz8nXq5/c1r0/3is0MqiKlBb
         3DX/WJP8XhGDOVxPX/7MmKxaMHKcQnoKyBKJ+DW4nlgmisCzGfIAUJlDJzPFPiXpFua1
         ksl95AFxwrhW3VANaMypjSkXurSe14ZqjY6zRnuYTZlWZwUhwcjpjsW0H1IgTQOqyCY+
         /1ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703768922; x=1704373722;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2sTRWP1BfjExUpMIHeRBHU/LlMOrJyrRhsp9tBe90/E=;
        b=mU0V9rktXQnLTuJUGdol0yCAPDIax1QF6rfoVBB7kt0CIIcde9qp2sYWXd1cJQRfdV
         Ltprgu4DThDuacBC1hDtCFZ0oDnEwdgFCMJhFJvmyNKxxIlsSJgpvTv6Ptr7yt+gAd9Y
         xEedbItReM1PhLBIn3RFOauNNN91TprnFh1RnQlPPiQpBgzgEnIGW+lHcPBtRTT8SDaA
         OAMeDenx/2qtn8skL0jes6bJUXDMJarso52axQZqbC0ggyu8O/f3CORoUdGfUjRW1Ag1
         o/qa5zi7V8ehIigq6B0ViXp/xDhPUnC8Rb3dhP4yWWWz2KPE/uIqhDoY0V3C2mARKI0w
         T0Dw==
X-Gm-Message-State: AOJu0YyvEObr/g5odUcsrSGknSUZX98XpDAEOg+d4UZvfqi/awUZNFy6
	rJ8VQPfLBocD5sXTusWxvee0T98j1tbsjA==
X-Google-Smtp-Source: AGHT+IE3SK3cpPclMD7nMM9tzXVA5ulc46KRGcSGLUzMVQbJhiwmZQrdF/fDTxX9t0ugT/7ZCuqrPQ==
X-Received: by 2002:a6b:4e07:0:b0:7ba:9355:921e with SMTP id c7-20020a6b4e07000000b007ba9355921emr14536420iob.37.1703768922600;
        Thu, 28 Dec 2023 05:08:42 -0800 (PST)
Received: from sunil-laptop ([2409:4071:d8c:48a3:7c9f:2b6f:993e:1716])
        by smtp.gmail.com with ESMTPSA id ca5-20020a0566381c0500b0046d79f147bdsm907069jab.179.2023.12.28.05.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Dec 2023 05:08:42 -0800 (PST)
Date: Thu, 28 Dec 2023 18:38:28 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>, Haibo Xu <haibo1.xu@intel.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Anup Patel <anup@brainfault.org>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Jones <ajones@ventanamicro.com>,
	Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
Subject: Re: [RFC PATCH v3 03/17] PCI: Make pci_create_root_bus() declare its
 reliance on MSI domains
Message-ID: <ZY1zTMnYnjy7bn4A@sunil-laptop>
References: <20231219174526.2235150-4-sunilvl@ventanamicro.com>
 <20231226235602.GA1483795@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231226235602.GA1483795@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231228_050845_114009_5B625001 
X-CRM114-Status: GOOD (  13.37  )
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

On Tue, Dec 26, 2023 at 05:56:02PM -0600, Bjorn Helgaas wrote:
> On Tue, Dec 19, 2023 at 11:15:12PM +0530, Sunil V L wrote:
> > Similar to [1], declare this dependency for PCI probe in ACPI based
> > flow.
> 
> It would be better to refer to this as 9ec37efb8783 ("PCI/MSI: Make
> pci_host_common_probe() declare its reliance on MSI domains") instead
> of a link to the mailing list archives.
> 
> The git SHA1 is part of the git repo, and git can tell us where that
> SHA1 is included.  The lore URL is external and doesn't say anything
> about what happened to the patch.
> 
Yes!. Let me update in next version. Thanks!

> > This is required especially for RISC-V platforms where MSI controller
> > can be absent.
> > 
> > [1] - https://lore.kernel.org/all/20210330151145.997953-12-maz@kernel.org/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
