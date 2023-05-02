Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E1A3C77B73
	for <linux-riscv@archiver.kernel.org>; Tue,  2 May 2023 05:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=+6uT16bv8yn848JJUKYN45EpdnpPHUbWgRJDjrFXokk=; b=vYTEvgAo8hJuLi+kyQLqejegf0
	pTt1svsHsVl/w0d0IV8mteZxbC5L93ObuTqHUYA/1HKfPQyPe9w6X0sw1EIdAv09zN8kkZ3rCKoVQ
	bbI75KaNqlam8HCv7FWbDh3kj+rQzHpDIh/aMrpcOOIvYtT6T4SMk7UD4YnfYXzsUQpQhUxAlJ8kI
	U5MHVl8mUnXgPNH0SK2fgvnqF7plklZg9+HrxrvO3iNCdTmOCiuBEHYkdv+FyNbXXGiT+rLpo0YRz
	Dl2b44kBtk5LEL1PCKA2kZRWhlufRbMRMomPpj5t4qkfJdJymOt0bLHTuV9RJxCRcCUN3kob84BTX
	9zpTASzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptikr-000Dnw-2f;
	Tue, 02 May 2023 05:40:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptikq-000Dnj-0J
	for linux-riscv@bombadil.infradead.org;
	Tue, 02 May 2023 05:40:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:Sender:Reply-To:
	Content-ID:Content-Description:References;
	bh=hVPD7LCIYEjnGcS4W60wPpbqQrrQeR8iu5kz2d7F+Uk=; b=CcBRSjLOCBsiDF8Ln+EJhU60e9
	IAn1c2XlUDJF59E/kZwON3bpDIqB9WV54k1T2TXMAiV5DiZSLymHdtEWHtNYDe5n71vX5mY5N0S99
	J2NLQZC5QaAl9+2EI+OZiAnHI8CYdk6gSHttaKPsB1j1DmtP7vVkJ7yNIlOSPGYTfDY6fCGSImEOs
	AWDXPjtfxVOnS3n4SrIuuwm1UVx7CCgsvtlbgX4f7qtIKGVkvy9YP8uSeTY42Nf1Sj6R8HgsPCRB6
	RLApLsGZtPXPRSTctx7/IhweQB7tb/ChmhuDoDxAv7RrX3Yu07D/RB/omeizNFUAE62MSvs9m8cC/
	zFE60KsQ==;
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptdRK-00F3Ys-31
	for linux-riscv@lists.infradead.org;
	Tue, 02 May 2023 00:00:22 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-63f273b219eso2263252b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 01 May 2023 17:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1682985616; x=1685577616;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hVPD7LCIYEjnGcS4W60wPpbqQrrQeR8iu5kz2d7F+Uk=;
        b=USsZG1TBQuABriuIzboKRMi4j9Qabdy7EQK9cWxLH+f2LtYZitY5S8oGQQmcGAq91i
         XEBdwCjnNVAgAEyNblON5OK2s0h3os8Ph18kGzoiMW7o+Dhm226fDs74UHKPY1+Xti0r
         DpYHPyWWI55Xn7kfOvH/E1u04CwGffBgXdbbrnwIm6o5aXxN8NJSmy0NVOLcEW68nwb9
         9mrK+BXDTF7H+d7Yu1JN+OKPvBGPeGyEkEGXMGAxpEkDv3rvPrYul84INOtt6cWZX00e
         pxJHBEyfXb34Z4YpB2p0+OWN8yV4DVz/idzFaFv5/I+MkscMfJmGNjY+ypB5PqGMcyK6
         aVaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682985616; x=1685577616;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hVPD7LCIYEjnGcS4W60wPpbqQrrQeR8iu5kz2d7F+Uk=;
        b=D8PCs/etBLVQqoTU4DZ6n17rvGwW5vIOzGYPSuspwKK2CYN8F6phZHaVVA7KzDsP0P
         CP7Xi7XCZfEHdE6Cve40TKAB9xrs65cVbkY8BH+X+JikVx+W2b8J2jO54qRBDxeFJfnG
         PM8nRIpaE6fZUW7S3p+L5EJWwN5mbJ+1QUAhs0B3L9xfFp6tTq9sugaJWKvvu0e0ZZ8Q
         NesWs9KjRD6DDVywp9s74Qlqr+pZ0UZXr8feI5vUKypHfAERUWaHmxccYMuoNDeM5dTX
         fE2x24xwdgBSViMDJFm3jx8HhG2k+Iwi9YpKd7P3ua+x8eCLURJvzMg06m8wz9lmctW0
         ZCuw==
X-Gm-Message-State: AC+VfDwDcJ2PA5FiDO6rJawQhSQ7PgQ4TPvRxM/RptPmM+i9w6VUtYLn
	v3gVoCga2y5CQuU5lQh4Oi3qcQ==
X-Google-Smtp-Source: ACHHUZ4WXfPj9SWiDxU7NAUDEKWrYfXvWG9K+1cbxVQF6JOx6c+tN0HQ7ovKzZhJFq3mr4oKwAGNTQ==
X-Received: by 2002:a05:6a00:181e:b0:624:7c9a:c832 with SMTP id y30-20020a056a00181e00b006247c9ac832mr22721656pfa.8.1682985615800;
        Mon, 01 May 2023 17:00:15 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id f14-20020a056a00238e00b00640f51801e6sm11176010pfc.159.2023.05.01.17.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 17:00:15 -0700 (PDT)
Date: Mon, 01 May 2023 17:00:15 -0700 (PDT)
X-Google-Original-Date: Mon, 01 May 2023 16:59:12 PDT (-0700)
Subject: Re: [PATCH v1] dt-bindings: riscv: explicitly mention assumption of Zicsr & Zifencei support
In-Reply-To: <20230427-fence-blurred-c92fb69d4137@wendy>
CC: Conor Dooley <conor@kernel.org>, Conor Dooley <conor.dooley@microchip.com>,
  robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, Paul Walmsley <paul.walmsley@sifive.com>,
  linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor.dooley@microchip.com>
Message-ID: <mhng-7defe716-2138-496e-908b-41e7c553da74@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230502_010019_484175_63E901B0 
X-CRM114-Status: GOOD (  19.20  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 27 Apr 2023 03:43:42 PDT (-0700), Conor Dooley wrote:
> The dt-binding was defined before the extraction of csr access and
> fence.i into their own extensions, and thus the presence of the I
> base extension implies Zicsr and Zifencei.
> There's no harm in adding them obviously, but for backwards
> compatibility with DTs that existed prior to that extraction, software
> is unable to differentiate between "i" and "i_zicsr_zifencei" without
> any further information.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> CC: Conor Dooley <conor@kernel.org>
> CC: Rob Herring <robh+dt@kernel.org>
> CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> CC: Paul Walmsley <paul.walmsley@sifive.com>
> CC: Palmer Dabbelt <palmer@dabbelt.com>
> CC: linux-riscv@lists.infradead.org
> CC: devicetree@vger.kernel.org
> CC: linux-kernel@vger.kernel.org
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> index 4c7ce4a37052..a93bc7eae928 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -85,6 +85,12 @@ properties:
>        User-Level ISA document, available from
>        https://riscv.org/specifications/
>
> +      Due to revisions of the ISA specification, some deviations
> +      have arisen over time.
> +      Notably, riscv,isa was defined prior to the creation of the
> +      Zicsr and Zifencei extensions and thus "i" implies
> +      "zicsr_zifencei".

also Zihpm and Zicntr.  I'm going to put this one on for-next, though.

Thanks!

> +
>        While the isa strings in ISA specification are case
>        insensitive, letters in the riscv,isa string must be all
>        lowercase to simplify parsing.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
