Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A8A5C27C75
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jun 2024 17:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TY5LlrCbW4PdvCNoVLdMhW/buESNWhPSg0r6LPg71zc=; b=B93sGj0xP1G8SY
	ZR6D7DoqdGtdHLaAL+Prxk/2PKni//or77Jifeq/Pk0uNeth2EmEbnA69/8aexNV08qJdAauIywcL
	226hzByTSypNixkmeQ+iXyrP3O3zEQjfrdf5u5CDfAWZVnlB8R741aK8cyX8pPMR4sR3PeF3ejoiX
	b//KVeiJ5CwSg0TgvW2apKDLqZ+2f+bUyeTFT6QTUb2qsrrUnNwKhmrvZ5Xac8LM00Ndwji5KX/Ya
	1N/0+7l6utFYitq2ZafguV3RxDe6mrkWLjBm2sniSS9IqDL8rDQJSXyAg6AkPe5V+OjM8AYrpdbcf
	FHaxrcg1MK6xmKl3yHdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHoO9-0000000HYJX-3GHK;
	Thu, 13 Jun 2024 17:37:29 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHoO6-0000000HYIS-09Uj
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jun 2024 17:37:27 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1f6e183f084so10275355ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 13 Jun 2024 10:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718300243; x=1718905043; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HeXCvOjfZUoc8Yy0DfPd4nvN0/4du747GE3bH4Ko4l8=;
        b=EjakkwWAWupP9n3pwGvTg9Bqfa2itvJU01+y6IFBKFxdMcIsW2faTTsgW91Lfvk0VT
         GqsqguybVWq/94sIhK7YmugsusSPtaaVQj77v7HgX0sJO+c8bgzdaiAVK7TbB/W9cEWy
         warIclKec33xmkQmI1M/grt+zrG7NrDyjkSF62xRaRf/jDaUYtkn8nAS+Sl5wa0LdaGW
         9GgK1+eqxkhQrmW8fhzbK1DEu+kvnFkSSCmTixd/oDj876B5R+bekwIfuZyAUSGJVKxn
         0O5VKq/7ZwMeggaJnSNEWDUN+C3bkR12OvESSfj7m+W7GO6d8t8IlUgbLP2hbzw3Al01
         lylQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718300243; x=1718905043;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HeXCvOjfZUoc8Yy0DfPd4nvN0/4du747GE3bH4Ko4l8=;
        b=kbgtFLk9gtVkKRTTMP8L/6xoBXxaNW2o0mkcC5NS7IOofdHKet4M8cgIOj/JyrdW3q
         EEMaGRfIBRpsKAgxI0GeJO3nVOOxiKMWZgimgN9DOL/9++h5dFrN9dTkCDJ7qJxqjj61
         SiUXK1SYziwiR6uuj4Ck3wjXcOBlCWutz1FHfVjwACvfi+rD+afu3o201g4ONU5z2oI5
         +4Ax22PaSGrxWox2LJnwGNWEWDrkLia7C2HVW3AIeD8rfeWl/ef/SU3Jjz1VAhMiCuOu
         kxusEDhrpi4q0u9J2w3bvz+uCrhPAFk8tnohvRNVG28JFs4vH72A9VS7GrJCU46Oo+2c
         6xbw==
X-Forwarded-Encrypted: i=1; AJvYcCXTqRsslGDEnWtutTT0to5WaX06ZQKhngN1cwS1+aDvG5EajUK+TBL5mpzLzmSX2nMAV/1F/I0MpyCfoGeR5MjDxlHVAlCmYxFlsmiRuwQR
X-Gm-Message-State: AOJu0YxDSZ/R9wBoH7abIr9Ns9Q7hNflFKPWRBMUPQER+iQvCW0PDu7F
	8kevAlYbek56/OplxMmCU7UqtMVcbnDIrPsF8p0G5Ih/rDAsU/NJUfCpdXZdZzQ=
X-Google-Smtp-Source: AGHT+IHlqr2Gr/wVcfUHyYVtjtoS+IIJeHCrMCvXHq1erzaUkYT056DbAUb1350ehkSOSzCBD/aMgQ==
X-Received: by 2002:a17:90a:1150:b0:2c2:cefc:abea with SMTP id 98e67ed59e1d1-2c4dbb43d8fmr471729a91.32.1718300243218;
        Thu, 13 Jun 2024 10:37:23 -0700 (PDT)
Received: from ghost (c-67-164-127-253.hsd1.ca.comcast.net. [67.164.127.253])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c4a76a9f14sm4303029a91.48.2024.06.13.10.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 10:37:21 -0700 (PDT)
Date: Thu, 13 Jun 2024 10:37:19 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Evan Green <evan@rivosinc.com>, Andy Chiu <andy.chiu@sifive.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] riscv: Separate vendor extensions from standard
 extensions
Message-ID: <ZmsuTyVcxelGvGw+@ghost>
References: <20240609-support_vendor_extensions-v2-0-9a43f1fdcbb9@rivosinc.com>
 <20240613-deepness-refried-c6dea811f6f6@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240613-deepness-refried-c6dea811f6f6@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_103726_223122_9D20586F 
X-CRM114-Status: GOOD (  23.37  )
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

On Thu, Jun 13, 2024 at 03:45:33PM +0100, Conor Dooley wrote:
> On Sun, Jun 09, 2024 at 09:34:13PM -0700, Charlie Jenkins wrote:
> > All extensions, both standard and vendor, live in one struct
> > "riscv_isa_ext". There is currently one vendor extension, xandespmu, but
> > it is likely that more vendor extensions will be added to the kernel in
> > the future. As more vendor extensions (and standard extensions) are
> > added, riscv_isa_ext will become more bloated with a mix of vendor and
> > standard extensions.
> > 
> > This also allows each vendor to be conditionally enabled through
> > Kconfig.
> > 
> > ---
> > This has been split out from the previous series that contained the
> > addition of xtheadvector due to lack of reviews. The xtheadvector
> > support will be posted again separately from this.
> 
> I think that's a good call.
> 
> > The reviewed-bys on "riscv: Extend cpufeature.c to detect vendor extensions"
> > and "riscv: Introduce vendor variants of extension helpers" have been
> > dropped in this series. The majority of the code is the same in these
> > patches, but thead-specific code is swapped out with andes-specific
> > code. The changes are minimal, but I decided to drop the reviews in case
> > I inadvertently introduced issues.
> 
> Actually, you only completely did that on the first of the two patches
> you mention, but I don't mind.

You reviewed the third patch of this series in the first revision of
this series and I should have updated this comment.

- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
