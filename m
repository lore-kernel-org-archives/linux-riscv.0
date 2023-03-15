Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D197C61DA4
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Mar 2023 08:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V3QvCeJLgf5eyNWTIwrP68nmfiXuql159Ypd5A5ibLk=; b=yA6s227/MRpeha
	cLrsNhYXjYCFaB9lVxce03bLpjZ3JxdmxKgfYNBOUYtE0Mb6j4c66bw8HdGc+0Pg48s4NmlIR023p
	nnUaAsoeu8iuAhkyO+qKLssn3rCoLRwEeyZ2N2HVTTUpemXLX/J2UU7uRFaRUE2g8UUmdSKPLo9gk
	yF1n/8u3D8G8qeU9JOHf4R+hHVvscJhVFM5CmBbVboyxEoDX/UTZ43DmEE+VlEMXh/2iwWkGVNbq8
	jAowgOMwwX8shQu7P98mbwI804ymbBPVhh7ZGXxkTSGboEqdW3xom+n156yGqXdjY0XB8bKDeXlZc
	5f0ho+cVtZUCARyQmH5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcMtZ-00Cphe-1j;
	Wed, 15 Mar 2023 08:54:05 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcMtW-00Cpgb-1H
	for linux-riscv@lists.infradead.org;
	Wed, 15 Mar 2023 08:54:03 +0000
Received: by mail-ed1-x52f.google.com with SMTP id w9so1704449edc.3
        for <linux-riscv@lists.infradead.org>; Wed, 15 Mar 2023 01:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1678870438;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dolOVvlYZWJ9nCYk9trJ6kMCdZW/oXPHELzwkmem5Uk=;
        b=MFbGxr4qvdjII5+dP1fGSBYixXjYcuZKIHk2d+ShrWlGblspW3sZJrwNZ77vZ2V+eK
         fgjmeAR71wlzoh04kgfZyy/wKlgmFHqWkQcTiHUIu6/qDb0h9WxiNYOdgj2uFKleJ5j5
         YCuu9Z/XL1VPPaKS92QHrBKFYKUTTNgL7WdfFo9gXAUbxC6uVtEN8dOC6rwN2wbyBRcK
         XvfX7uANctyKHvt1OSlJUt4CH3bBksiUtpNFSpVXUqZHh8P4kcPIHoHEPYLJboALHC41
         0ASsFEw18ovuOQD6hBQIifRRcXo2+f38PYlF76J4KxBjajuq7a/RRgwCdfFPzY0OIVTH
         fn5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678870438;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dolOVvlYZWJ9nCYk9trJ6kMCdZW/oXPHELzwkmem5Uk=;
        b=JAMX+v+HrWxfERAb6HRdWLgXLVcKwkH3FsaV4/k4BoHUAxD0xqw8ZtHp44oeKwCh6/
         N+LEPuAfuOYzq9R9zFMwfK0QzPiVFI6k100x0eiFiUjtBE7od2Pz4CcVMNLJZPi4fE65
         9tFY7XEPOLRLZEAwFQBNAt7Ysuh2EgnCLH2fMj8s7IV81MjULrvk737S18y0Lmqmid9R
         8jELWLvo2gV0PbHsDohJO7T3wKnDs54fGRdUcUXqev6Y58kb4aCI8BJBOLvYf27691VU
         pZ3bYOYHO7oDBSBHXU0s2obEfFKIrDC9/G6FKO5r5u/IPaCXC5S6AWYaSuem6g0Vgnos
         mryw==
X-Gm-Message-State: AO0yUKW8Q/AHTQbH7WtlrRkZrPXpG0dZc2U3JplAnC6tVXZqbbyTasWy
	JuusvI+LT4kfbMKY1dye1yfaCA==
X-Google-Smtp-Source: AK7set/VungzdGD3dRLBeKZZ7z4IK2H1QDutRY3N3WNFbdIsaJWOnMSmwzQBDqASChuqOZoNS4OOzA==
X-Received: by 2002:a17:906:6cf:b0:8aa:875d:9d9a with SMTP id v15-20020a17090606cf00b008aa875d9d9amr5855591ejb.50.1678870438268;
        Wed, 15 Mar 2023 01:53:58 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id rp15-20020a170906d96f00b00929fc8d264dsm2252847ejb.17.2023.03.15.01.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 01:53:57 -0700 (PDT)
Date: Wed, 15 Mar 2023 09:53:56 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	sudip.mukherjee@codethink.co.uk, ben.dooks@codethink.co.uk,
	Atish Patra <atishp@rivosinc.com>, aou@eecs.berkeley.edu,
	apatel@ventanamicro.com, krzysztof.kozlowski+dt@linaro.org,
	robh@kernel.org, jszhang@kernel.org, heiko@sntech.de
Subject: Re: [PATCH v6 0/8] RISC-V: Apply Zicboz to clear_page
Message-ID: <20230315085356.zlmiz5qkz44d5ndf@orel>
References: <20230224162631.405473-1-ajones@ventanamicro.com>
 <mhng-72607fed-a923-4921-896f-7f703434083a@palmer-ri-x1c9a>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-72607fed-a923-4921-896f-7f703434083a@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_015402_454414_7253F5C0 
X-CRM114-Status: GOOD (  14.64  )
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

On Tue, Mar 14, 2023 at 09:35:09PM -0700, Palmer Dabbelt wrote:
> On Fri, 24 Feb 2023 08:26:23 PST (-0800), ajones@ventanamicro.com wrote:
> > When the Zicboz extension is available we can more rapidly zero naturally
> > aligned Zicboz block sized chunks of memory. As pages are always page
> 
> I guess we're sort of in a grey area here: this is just a performance thing
> so in theory some sort of benchmark should be required, but IMO it's OK to
> just hand wave this one away -- if the "zero a cache block" instruction
> doesn't make "zero a page" go faster then something has gone so far off the
> rails it's probably better to just pretend the machine doesn't implement
> Zicboz.
> 
> This all LGTM, so unless anyone's opposed or it blows up on testing
> overnight then it'll be on for-next.

Thanks, Palmer!

drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
