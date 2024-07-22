Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7F2EC3DA59
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jul 2024 20:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=phy20ufArGWlmZwyki8yVcwkfBmm3HuSI/pgnuPrTy8=; b=YOyCTS65e+9szM
	3dmeR9TVjmIgPvNjjy4zEivaPUJ8QB8ymSR4wrnKUi1YBNBuljeNY8zuVDhtiVMNCQ3qmswB2ybCA
	pR7Dr/X+/M8E8HOMjNRDkheYFKuoKwAsVBsH/WKWTFc6euTIOM6yc66G2Mts4+18W4NMeqcFQlTb5
	Lg563V4P3COwuminIoxq4HtdBJ9OjquzL5g/sk4n/Ys7YHZJ2aG9yGpEKrukiOvduV+AiMFj0biB9
	lk4600DdFLSB4h00BFVEHVmbRGvsGUFw3G5Z4Y1HSj+lJdBcDJbA1fr1gTdjhnErY1O5nvlMU4Rqb
	uM2KpLrOo6TgQTfiCgdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVzZb-0000000ATqu-1cRC;
	Mon, 22 Jul 2024 20:23:55 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVzZZ-0000000ATqH-0np4
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jul 2024 20:23:54 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1fc6ee64512so24503895ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 22 Jul 2024 13:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721679831; x=1722284631; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vscSuJli/qMDZQkgqyASUQ/eXIf5VrS/DxNRtVVokMQ=;
        b=dXvUvWCYjp5kvpOpmQFurqlmiyXjOxFtGDuciyCX9tYJjCm3tz0aDpowQdWngXjl9s
         emsUNIgRbNpp09R7ql52JKkex7V+7UstDpIOVkmzGi/xtlOBOqxQbJbYBky0LM2EcCJT
         fqLfd2+ibqLpn6JWczXbmrdUy84JObrHNvFDE5HcPdAmbWshaN5f7lxwvwwP1V+vIdDW
         b5y74MwO1zN3BIPi9vnPxPSuNhVSKpmDt/QD1na4LQlGJ0hLaHDpfczmszTd9k/jX8R8
         ZGINwgzUEvgFc9uZid3Zq3/oZxHC6PLWDaUU80visct5VGVP/5+GrSGkepMtbg6eIZOd
         fqWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721679831; x=1722284631;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vscSuJli/qMDZQkgqyASUQ/eXIf5VrS/DxNRtVVokMQ=;
        b=jv5baz1KtYiwTsxI+7ETwN4sjYyI9FRAcmWx3aV6lB+srYove1j9jc37v3wJCjYEdw
         cRWicS6D3No7Ab11PEc1DnC/2xd1d+zMk9R3g+llGnGiM/VDvetJbh0gQG24HDbTDQmZ
         GkZj4CaJWOcMs5Q+oHbCB42XXwHVI7hjZ4iMob/OXd0yH4c73WRd5Chhs4IMlOmwanKo
         ntOciH6lME9cam7tcEOTKZClzuOPxFYi8HiZB3DYF3HZfUGAeW13N5UY7JkUfPHq+2vK
         3GmBIxajw/L+1BMaLEEkv7vFFqIUWwGaLV70DSDCDuDH8J/PAQyJ50Y+yCTXJODdRqnL
         uphA==
X-Forwarded-Encrypted: i=1; AJvYcCWkkBYl6hPVJ5vW+NAliYdfFtm1QlDas62RWw4of2/mcT3XlYYZ3v1BAYJnJ3LV3KdzxzN1rP9MaC78WqHLPclkKv+EpnxuSOzvePUsg8/X
X-Gm-Message-State: AOJu0YyIGVndQ1bWK/XIc58+an6jWAIb5S3CGpNY1uNPXfJ0chfyFTZV
	yGykMWT7jHKhD6iqDJKTD0AY+pGCeGn6qG97yBmOL0/VzQjveHI7RNBlte9dpSc=
X-Google-Smtp-Source: AGHT+IFu4KWg20WGwAtWgw+9RqpxdpwxYEZkFpTn/48CXCAEpuRBJHwGOerPWAQCjhEprtXFyI0Q9A==
X-Received: by 2002:a17:903:22c9:b0:1fd:6f24:efb2 with SMTP id d9443c01a7336-1fd7459a2b6mr52786735ad.19.1721679831554;
        Mon, 22 Jul 2024 13:23:51 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f2ab34dsm59204435ad.110.2024.07.22.13.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 13:23:50 -0700 (PDT)
Date: Mon, 22 Jul 2024 13:23:48 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Evan Green <evan@rivosinc.com>, Andy Chiu <andy.chiu@sifive.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Yu Chien Peter Lin <peterlin@andestech.com>
Subject: Re: [PATCH v3 0/4] riscv: Separate vendor extensions from standard
 extensions
Message-ID: <Zp6/1CzztAOT51yU@ghost>
References: <20240719-support_vendor_extensions-v3-0-0af7587bbec0@rivosinc.com>
 <20240722-0c2488245ce33131693c6d34@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240722-0c2488245ce33131693c6d34@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_132353_438787_1243EA74 
X-CRM114-Status: GOOD (  21.34  )
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

On Mon, Jul 22, 2024 at 02:32:49PM -0500, Andrew Jones wrote:
> On Fri, Jul 19, 2024 at 09:15:17AM GMT, Charlie Jenkins wrote:
> > All extensions, both standard and vendor, live in one struct
> > "riscv_isa_ext". There is currently one vendor extension, xandespmu, but
> > it is likely that more vendor extensions will be added to the kernel in
> > the future. As more vendor extensions (and standard extensions) are
> > added, riscv_isa_ext will become more bloated with a mix of vendor and
> > standard extensions.
> 
> But the mix doesn't hurt and with everything in one place it makes it easy
> to know where to look.
> 
> > 
> > This also allows each vendor to be conditionally enabled through
> > Kconfig.
> 
> We can do that anyway by adding an extension menu for each vendor. If we
> don't want a vendor's extensions bloating the array then we just need
> some #ifdefs, e.g.
> 
> @@ -405,7 +405,9 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
>         __RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
>         __RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
>         __RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
> +#ifdef RISCV_ISA_VENDOR_EXT_ANDES
>         __RISCV_ISA_EXT_DATA(xandespmu, RISCV_ISA_EXT_XANDESPMU),
> +#endif
>  };
> 
> 
> So, I'm not convinced we want the additional complexity of vendor
> extension arrays, but maybe I'm missing something.
> 
> Thanks,
> drew

Vendor extensions are non-standard behavior, so this is largely an
organizational effort. A benefit this provides is to delegate
maintainership of vendor extensions to the vendor. Additionally, this
separation of vendor extensions prevents changes to vendor extensions
from affecting standard extensions and vice versa. 

Another motivation for this is that I expect vendor extensions to be
temporary fixes in a lot of cases. A good example is xtheadvector where
a previous version of the ratified vector spec was implemented. Another
case is vendors creating vendor extensions while waiting for RVI
ratification. This will cause these eventually-to-be-deprecated
extensions to pollute the namespace and require shuffling around of the
standard isa lists. When it's an internal structure it is less relevant,
but it is a bigger risk when it comes to hwprobe. Allowing these kinds
of vendor extensions into hwprobe runs the risk of causing a sparse key
space. We may end up with many dead bits for deprecated vendor
extensions that will never be able to be removed to maintain backward
compatibility. Having the vendor extensions split across vendors
streamlines the hwprobe implementation.

- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
