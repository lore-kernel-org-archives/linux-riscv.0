Return-Path: <SRS0=OPVU=Y7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D7F4C5DF60
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  7 Nov 2019 22:32:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CCA0214D8
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  7 Nov 2019 22:32:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LuwVZwLH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="QtH1+NFX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CCA0214D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lkAGoKSeMSfGdrvMduHD8uljBTMfgVt3uNqXSAcQcmE=; b=LuwVZwLHO28Sej
	/8yFatkjVDP5Aqj4fe9h4AK7HevfPOdcjr2KWww+ly1WysDcJw+a49btiE2Ib2IaoOIZE4lnFJ2tB
	mYYnC0VrfT79Ak04jOamV4G22de8FVLaUCV0qwPuXASXzNat3ZFS5LrUD3Uzjvbu6SuJUWF1QAiC+
	Vs0v4UtayrDT/l0rD1Bpl8FpzIkT4dkeLuL6TTyDLBmmo2+4hWdt6O3xh0ena/HcwLLVl+pBhy3Cn
	6/beUxi/Hg2PYlYEOkeMVIWy7l+SKBnaZIbzzlzeHY5o4SD+PAEDDwHCrYytEvznh01nzBmzS3vy9
	zmcwes76u4TAaPPVNFfw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSqK1-00082z-3Y; Thu, 07 Nov 2019 22:32:09 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSqJy-00082D-77
 for linux-riscv@lists.infradead.org; Thu, 07 Nov 2019 22:32:08 +0000
Received: by mail-pf1-x444.google.com with SMTP id n13so3459483pff.1
 for <linux-riscv@lists.infradead.org>; Thu, 07 Nov 2019 14:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=ZDZxE3X2u0Q7iWpkFaFMXlQVwx+tT1FJavF2B89FPtQ=;
 b=QtH1+NFXJ0zzfuKxuEMoDpcPK9ve7QSvHogyfZ1LD7WbXf1vDvHk1gduDooLeS3gSa
 OQ3Iuy0iZC41baX078kKCIeaia9GMa3KjZi9B/3VjKahrxuaPICa6MWCXjekHjmiy0Y1
 SY2EiKmne3GXAJRmsBQsy2QSW4VDhhxYelSb5nKn8Oq0uZBjnmvBdve2KYmQ3tg6cpX9
 iDI5aqWNyVmHm4b5vPv1Fe+BH9/fNlR+2jpvh52/fjAPY4wfFFLhpwl5wwhwcMvyUiEg
 CT/ddVBror3UdtXZOJDJMDyl93GUbm3Cn/qDOnh6C7iuStCKkoIv03sv3cKV9P+MavEw
 Rc/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=ZDZxE3X2u0Q7iWpkFaFMXlQVwx+tT1FJavF2B89FPtQ=;
 b=A0sDr4firasiEZ8NUF/Z0NwUbq427cajh2mLCwzdIAYXF0QGj5nfMVkV7jDc/DOlkm
 XLt91pNjaWaXZzgX1//4COJ8i63isCw+dhTeOntxt+Jdo/f8ZWw7UHBpcnD99XjAabY4
 2NetUZZjcBwkeprZXCEL5unhHBSBwt5Pgufni4UV6Jz7TeGWDzH+8TMvjpApxmMPP4n3
 W2fSsPlluJUFsQQPxY0/SrPaO+ZoF9X2XTvwiEULpT+MgxIzimvOU6HU1NVR8K+3yGiQ
 fck7LiWzLXTrAWYkIFjyh+GnHSIF84qLgkxEoc0R23rhM5S+YcaVFf2JlSfW2EnqaSvs
 QuEg==
X-Gm-Message-State: APjAAAVD9Ytr49AcvDS4YIqhfwnSijCADQIeQlrW9+9np01HKK8JVDQY
 XcdvLyhChQdp7c2MbkHzEOPDlQ==
X-Google-Smtp-Source: APXvYqwls8ddOTQNH1en07qze09B+ck+PA1CQw6LiSffpWOEx3b9mIFdJ4cJ6t90/fOVdQWQ78m/kg==
X-Received: by 2002:a63:8f5e:: with SMTP id r30mr7741111pgn.146.1573165923226; 
 Thu, 07 Nov 2019 14:32:03 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id w15sm3662519pfn.13.2019.11.07.14.32.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2019 14:32:02 -0800 (PST)
Date: Thu, 7 Nov 2019 14:32:01 -0800 (PST)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 1/2] dt-bindings: power: reset: document the QEMU RISC-V
 virt machine poweroff device
In-Reply-To: <20191107212408.11857-2-hch@lst.de>
Message-ID: <alpine.DEB.2.21.9999.1911071431390.8918@viisi.sifive.com>
References: <20191107212408.11857-1-hch@lst.de>
 <20191107212408.11857-2-hch@lst.de>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191107_143206_394218_8A436D49 
X-CRM114-Status: GOOD (  17.46  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, peter.maydell@linaro.org,
 Sebastian Reichel <sre@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 7 Nov 2019, Christoph Hellwig wrote:

> Add the binding for the trivial Qemu RISC-V poweroff mechanism, which is

There's nothing RISC-V specific here.  This IP isn't defined in the RISC-V 
specifications, or anything like that.  

Apparently it's a SiFive IP block which now has a virtual IP 
implementation in QEMU in hw/riscv/sifive_test.c.  But since there's 
nothing RISC-V specific about this IP block, any QEMU system, with any CPU 
implementation, should be able to use this virtual IP, and this Linux 
driver.

For these reasons, it's better if "RISC-V" is just removed from everywhere 
in this driver.  If something needs to go in its place, "SiFive" may be 
better.


- Paul


> just a single MMIO register exposed through the DT.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  .../power/reset/qemu-riscv-virt-poweroff.txt     | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/reset/qemu-riscv-virt-poweroff.txt
> 
> diff --git a/Documentation/devicetree/bindings/power/reset/qemu-riscv-virt-poweroff.txt b/Documentation/devicetree/bindings/power/reset/qemu-riscv-virt-poweroff.txt
> new file mode 100644
> index 000000000000..80ff6fd4e3b7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/reset/qemu-riscv-virt-poweroff.txt
> @@ -0,0 +1,16 @@
> +QEMU RISC-V virt machine poweroff device
> +
> +This is a device in Qemu that can signal successful or error exit
> +by writing two magic numbers to a trivial mmio register.
> +A Linux poweroff is implemented as successful exit.
> +
> +Required Properties:
> +-compatible: "sifive,test0"
> +-reg: Specifies the physical address of the register
> +
> +Example:
> +
> +	test@100000 {
> +		compatible = "sifive,test0";
> +		reg = <0x100000 0x1000>;
> +	};
> -- 
> 2.20.1
> 
> 


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
