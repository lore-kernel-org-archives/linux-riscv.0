Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DAD4C27C4F
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jun 2024 15:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T3Vmp8iyDJp+bKA4eBEklAZSOGsjaaiEKYTRHV98Cdg=; b=AkN3JyWSzb+eOG
	Yypeb3IdqWNPY18LJN+jMyiVT3iSZpM76Ha+DSTHr/A+bKbOKoP+EhN8QLw412IM8+Iy5oYPhMJre
	PtBQWFNRpXfE3ifD58bf1hmVbbxiHav2I6xUwdM3uby5mnHKnyeZ80Uwr7PzN7UtKmggq+cSDGXcW
	sih2EZp6nmyiMfU+eYJeIgmQmEH5VnUKWmJEsRsWU64EfgiDl1J9f1Wvk4/k6RcNSpM9sVSzwJFGP
	mfgQMgoqNAO9J96BUjDxUoXkdhsk8fDs0L0HeMpycOZAdYr64/PkeiMbOhDq/mNZXGCJCXPwv/BMc
	gfCKyW0ZigtkKD9LCgiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKfs1-00000009fU9-1aJk;
	Fri, 21 Jun 2024 15:08:09 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKfrx-00000009fSz-21Fd
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jun 2024 15:08:07 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4217990f8baso20033155e9.2
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jun 2024 08:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1718982483; x=1719587283; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UTWHPV88FmCEJH+LG722CyH2FEJ+u15rMxRs38TdpJE=;
        b=V3X8EkPzavPkkmLc1a1W19GO0/pl8ndsK4az0nj3wnGEfgRAd/LnvQLrewb2tFd8E5
         x/5G594FFIej0wLrD4AIvtgY/SpjQuP/+vsz0ZmZ1A9QSHUsuiNn4pqhlCOxODAGeevh
         NcGChHKZOFNR6jSu7+qLknh85MvrpG6YHTX1silVRWNteVuXxrmLou2hlXIfWPHX0cCl
         WeSA0N92MvfsGhlVZdqTtiqO12ImMoVaaM8OT1bN1vEYsV8mFehAIfQ3W1czk1BZsWU+
         j8K0gB5W9xzHPMh6Kh13jIPlsUMeEehovLIcRbDJOi83MQWEu5OUQo2QgrThEMZ5TMjE
         bUGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718982483; x=1719587283;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UTWHPV88FmCEJH+LG722CyH2FEJ+u15rMxRs38TdpJE=;
        b=RV3fh+IfaiLRExoOdHnXcqAXmb0MqRvh4Mi/s3Z1OYc1LGd4TAyOY3bYrYZBXHNVY/
         jmghBzdLpC3Z6yh6uQpsxsmG9iVVahy+Ec1LIB5U55YY/UZ5swWOOngXsSBWcbSd3OaI
         M5y3Z2kn7IL9GTz7HXF+inj+MnuVWf/k1Q1/wCsWdC/7MVR+dGc9TBYjpF9bU98TRaDf
         6vNMfYJL0mL0H/7GQnyQvLya080GcctaTmoGzOM1z1d2ikrJyfxc/k2M+hveZtYhJ3iV
         ixSLTuau0CCPSLf+Jg3cdUszC52ovF5exhvX7/ApdvVmugzFeAA1jfbIEXgSuqIlHFO5
         noUw==
X-Forwarded-Encrypted: i=1; AJvYcCXsTeI3ob1M1XyiOsNoAJD5A2bFXlgPL1he0mcf3Do1ao3bIXYFakdxptOA5Vcc7DkwugnsS8+tq7f0W70JrNqNSv6bjoWebU1wqI3Yr9lb
X-Gm-Message-State: AOJu0YzhSI09urRIYjx7qUF5ZF9X4V06gKI6iAWlN7Bzje2DJxKBJjvg
	NjgtOgJTNwKS6mD/rAXJ9PWFIETaZx3fE7wKEy/P3mUPK+2F8Rqf3rYHjcpT244=
X-Google-Smtp-Source: AGHT+IEIRpUWHcw8XTIcAv4v8Oe5k9VV3v98Ohw140EkoEs6DEAbUs8kPNn5uZbUGX5eMmzZdCfjhg==
X-Received: by 2002:a05:600c:4f45:b0:424:777d:dcc with SMTP id 5b1f17b1804b1-424777d1648mr63667245e9.0.1718982483038;
        Fri, 21 Jun 2024 08:08:03 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3664178f5f7sm1935800f8f.19.2024.06.21.08.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 08:08:02 -0700 (PDT)
Date: Fri, 21 Jun 2024 17:08:01 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>, 
	Conor Dooley <conor.dooley@microchip.com>, Anup Patel <apatel@ventanamicro.com>, 
	Yong-Xuan Wang <yongxuan.wang@sifive.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, greentime.hu@sifive.com, 
	vincent.chen@sifive.com, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 2/4] dt-bindings: riscv: Add Svade and Svadu Entries
Message-ID: <20240621-8422c24612ae40600f349f7c@orel>
References: <20240605121512.32083-3-yongxuan.wang@sifive.com>
 <20240605-atrium-neuron-c2512b34d3da@spud>
 <CAK9=C2XH7-RdVpojX8GNW-WFTyChW=sTOWs8_kHgsjiFYwzg+g@mail.gmail.com>
 <40a7d568-3855-48fb-a73c-339e1790f12f@ghiti.fr>
 <20240621-viewless-mural-f5992a247992@wendy>
 <edcd3957-0720-4ab4-bdda-58752304a53a@ghiti.fr>
 <20240621-9bf9365533a2f8f97cbf1f5e@orel>
 <20240621-glutton-platonic-2ec41021b81b@spud>
 <20240621-a56e848050ebbf1f7394e51f@orel>
 <20240621-surging-flounder-58a653747e1d@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240621-surging-flounder-58a653747e1d@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_080805_559544_58B1058E 
X-CRM114-Status: GOOD (  32.77  )
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

On Fri, Jun 21, 2024 at 03:58:18PM GMT, Conor Dooley wrote:
> On Fri, Jun 21, 2024 at 04:52:09PM +0200, Andrew Jones wrote:
> > On Fri, Jun 21, 2024 at 03:04:47PM GMT, Conor Dooley wrote:
> > > On Fri, Jun 21, 2024 at 03:15:10PM +0200, Andrew Jones wrote:
> > > > On Fri, Jun 21, 2024 at 02:42:15PM GMT, Alexandre Ghiti wrote:
> 
> > > > I understand the concern; old SBI implementations will leave svadu in the
> > > > DT but not actually enable it. Then, since svade may not be in the DT if
> > > > the platform doesn't support it or it was left out on purpose, Linux will
> > > > only see svadu and get unexpected exceptions. This is something we could
> > > > force easily with QEMU and an SBI implementation which doesn't do anything
> > > > for svadu. I hope vendors of real platforms, which typically provide their
> > > > own firmware and DTs, would get this right, though, especially since Linux
> > > > should fail fast in their testing when they get it wrong.
> > > 
> > > I'll admit, I wasn't really thinking here about something like QEMU that
> > > puts extensions into the dtb before their exact meanings are decided
> > > upon. I almost only ever think about "real" systems, and in those cases
> > > I would expect that if you can update the representation of the hardware
> > > provided to (or by the firmware to Linux) with new properties, then updating
> > > the firmware itself should be possible.
> > > 
> > > Does QEMU have the this exact problem at the moment? I know it puts
> > > Svadu in the max cpu, but does it enable the behaviour by default, even
> > > without the SBI implementation asking for it?
> > 
> > Yes, because QEMU has done hardware A/D updating since it first started
> > supporting riscv, which means it did svadu when neither svadu nor svade
> > were in the DT. The "fix" for that was to ensure we have svadu and !svade
> > by default, which means we've perfectly realized Alexandre's concern...
> > We should be able to change the named cpu types that don't support svadu
> > to only have svade in their DTs, since that would actually be fixing those
> > cpu types, but we'll need to discuss how to proceed with the generic cpu
> > types like 'max'.
> 
> Correct me please, since I think I am misunderstanding: At the moment
> QEMU does A/D updating whether or not the SBI implantation asks for it,
> with the max CPU. The SBI implementation doesn't understand Svadu and
> won't strip it. The kernel will get a DT with Svadu in it, but Svadu will
> be enabled, so it is not a problem.

Oh, of course you're right! I managed to reverse things some odd number of
times (more than once!) in my head and ended up backwards...

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
