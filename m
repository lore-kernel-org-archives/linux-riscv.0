Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B966CAC5B8
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Oct 2025 14:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=crSkEQanTM9q2SyBSZXpMOTmM/Qj4OzHD6fKEgxZyGg=; b=n/KCUt09N6dP4o
	nbmaVr2JeRknqBmmehnOBaQdlybKx2aKfd93liQn5YiJcwx7GyT2qhGEvWvg6oSBZd0WlYZe8PVaa
	AvCUPbK9tZdWqKd6BLhamQ64Mv23u2kJkGdRLoW9afRhvXFVwajYiAqYccvsqU1YJcG/UJs7vveLY
	Jfq6P0H77Z0B1i5gsYemSw+nV/dgPz2Uy6XW8g35tQE2veSMfYL5wwqv/3dEggjvqcRa5ARTdz1ij
	bhFfkmqiv4JzQ/EDPKRNoIDPrvwLgu7unnfNxl3FS01R6rF4uYyFCvQt4kVZVVxe1p91zdt3TngTE
	uVth2o09qZgEWEmMs4BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4KYQ-0000000AegB-2FtS;
	Thu, 02 Oct 2025 14:45:10 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4KYO-0000000Aefl-1VN6
	for linux-riscv@lists.infradead.org;
	Thu, 02 Oct 2025 14:45:09 +0000
Received: by mail-io1-xd2a.google.com with SMTP id ca18e2360f4ac-8cf4f90b6f0so89692139f.0
        for <linux-riscv@lists.infradead.org>; Thu, 02 Oct 2025 07:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1759416307; x=1760021107; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/osgsBz2PvCgrcNrLbPETQ4uqTQhR5IWi3ar2VBiTxg=;
        b=eRF5Pcs4l/gbhw2tjAe6/XR78nGwMXcEI3WUg4SWAe56fZRPPvwwc/WOtWu2/MIeSq
         ar3cgowOwyS3XL7nTRBHgaiAqL8VHyyYOTj+If2FAAacY3426HkN2+mM3R8sB87XvdU+
         VxUXBJ2F6zlbBpP/c+etJyBzg0frk6V3hvfdxLk7C2pd1B0Qclrrrpmw2W2JGzKZf77f
         GDpUmVViaCFHVUYl0ZLBodAIEXVs2DxHELJBpX/Lf3qQBgBOCE2GcPX3SHKfJ4vgPfUv
         vRXYiyS1IE+Ln1zfDU+zmqewtRRKJ/VIAzMf1xAuvmzTskQmpZtfz9EzWwnkjo9uOAXx
         vRtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759416307; x=1760021107;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/osgsBz2PvCgrcNrLbPETQ4uqTQhR5IWi3ar2VBiTxg=;
        b=PkqFw6EoJJp2ybAKJEJsvH6t1gKaGLmmI8R0nXpKOLGDOmWoqVnbDxFK55PkLdNz5b
         XzKRwBSkuekdJ8ES16AerOpjgzKE55iMSDcC7vaCMd5YM6ndVaNFKm15oQ8NhmdmHcXG
         kb+qcjS8JoVOkxQZ/9g6moR6iU6fr7HvAVh4VaP3fW9X87wT5uTTjl1AbDFS5Kh05TSc
         jIf8YdMqnim2h6G3ruiTjOgSRfR+LDlYvN3tE5b5SnTXglGt1/Mt5JNZjN6MXnHBbM++
         8co1qTUYOHHLH8G+O0CUmnUrxImit0Nx0HX52zEhZlnIDeqsnddPGnb5BVHoVelt3uyA
         f+Ug==
X-Gm-Message-State: AOJu0YxNnFL/ENmBwOEFX3VD9fqH8DhaDaNkvbHipphVfEq8kNJDQRlS
	agyfZErccocz9GotuNSitE5btLqnePWz1OZdOgakm2OBMtn+SnN9r/N9z0HEnELVebs=
X-Gm-Gg: ASbGncubRpZsmdtUog1oYURiAT9wQ4LwB3EK/pP11ch4WVAo6QgrSkK47ZMIR7+iPqB
	tBPDeVWAyRGW9oCCax6SQaYA9sTc1C6BohpK3yqrIVi90B3H5hIZ9ZGFjmXMp4WJs8lsem8R9ld
	B1DIKwu2FaayaUiW4SKsh0o14Ym3trZPv/FIijwlSWTq97w2MeogkMSLsYMlPJzlcyCbkmPIHlG
	/qBVSYQ7nxzQjcHyY0W/YIHlCwiCq/PITwTuOIBsu1gafZ58toZbQxME2cLn4lo5CT4x5aYCFnB
	JfLfFTX/AS0xKmeUrPUvcg0a40IRl3lDidPeFswr0M5PtUHq8iDYPSB6WliIO17TaGxXiqcVrL0
	2NEdabQuI3SqM7rynHBu+b9Bbz9bhW6WQlNELY0eDyzRdwhgH
X-Google-Smtp-Source: AGHT+IHNDhHU6uSlFUqYG/KW1xxVWUf3Kv2t0KN0xY5vVTO0yE4sLXG5+d9P5URQQwnwcHQmp79Kvg==
X-Received: by 2002:a05:6e02:3c8a:b0:42d:8b1c:570f with SMTP id e9e14a558f8ab-42d8b1c5d58mr35953225ab.4.1759416306893;
        Thu, 02 Oct 2025 07:45:06 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-57b5e7504aesm929216173.0.2025.10.02.07.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 07:45:06 -0700 (PDT)
Date: Thu, 2 Oct 2025 09:45:05 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-riscv@lists.infradead.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, -linux-kernel@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>, 
	Javier Jardon <javier.jardon@codethink.co.uk>, Ben Dooks <bjdooks@gmail.com>, 
	Lawrence Hunter <lawrence.hunter@codethink.co.uk>, Roan Richmod <roan.richmond@codethink.co.uk>, 
	Sam Grove <sgrove@mips.com>, Chao-ying Fu <cfu@mips.com>, 
	Mukunda Aprameya <maprameya@mips.com>, Umesh Kalappa <ukalappa@mips.com>, 
	Djordje Todorovic <djordje.todorovic@htecgroup.com>, Kurt Martin <kmartin@mips.com>, 
	allikarjuna Gouda <mgouda@mips.com>, Vaibhav Chauthmal <vchauthmal@mips.com>, 
	wapnil Agrawal <sagrawal@mips.com>
Subject: Re: [PATCH 05/18] riscv: asm: use .insn for making custom
 instructioons
Message-ID: <20251002-8cb00cce2a2bc7274b3ad503@orel>
References: <20250822165248.289802-1-ben.dooks@codethink.co.uk>
 <20250822165248.289802-6-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250822165248.289802-6-ben.dooks@codethink.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_074508_404869_0EBD85EF 
X-CRM114-Status: GOOD (  15.67  )
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

On Fri, Aug 22, 2025 at 05:52:35PM +0100, Ben Dooks wrote:
> Using .word breaks with big endian builds, making something which
> is not a valid or worse an instruction or pair that does something
> which is not intended.
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
>  arch/riscv/include/asm/insn-def.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/insn-def.h b/arch/riscv/include/asm/insn-def.h
> index d5adbaec1d01..2a3019bc1a3b 100644
> --- a/arch/riscv/include/asm/insn-def.h
> +++ b/arch/riscv/include/asm/insn-def.h
> @@ -256,10 +256,17 @@
>  	INSN_S(OPCODE_OP_IMM, FUNC3(6), __RS2(3),		\
>  	       SIMM12((offset) & 0xfe0), RS1(base))
>  
> +#ifndef CONFIG_AS_HAS_INSN
>  #define RISCV_PAUSE	".4byte 0x100000f"
>  #define ZAWRS_WRS_NTO	".4byte 0x00d00073"
>  #define ZAWRS_WRS_STO	".4byte 0x01d00073"
>  #define RISCV_NOP4	".4byte 0x00000013"
> +#else
> +#define RISCV_PAUSE	".insn 0x100000f"
> +#define ZAWRS_WRS_NTO	".insn 0x00d00073"
> +#define ZAWRS_WRS_STO	".insn 0x01d00073"
> +#define RISCV_NOP4	".insn 0x00000013"
> +#endif

I agree we should use .insn when possible because it provides validation
and allows mapping symbols to identify the words as instructions. So ack
to the change, but without adding a depends on AS_HAS_INSN to the riscv
CPU_BIG_ENDIAN config, then the commit message should drop the reference
to big endian for its motivation.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
