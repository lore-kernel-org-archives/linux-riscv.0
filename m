Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F765C77B75
	for <linux-riscv@archiver.kernel.org>; Fri,  5 May 2023 07:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QeGUSjA3geXoSE3lY5PNDglqkyhg7gsYUCPH757qRHU=; b=DZWqw1whdwY41N
	z4hNpRqCpMw9MWTbe34TVeAiwjc+cKsWlEyOGJ6pvhHAFYyG1hH08JTPVy6qnpUxKcJ9ndR2NE+mw
	SV7d3iLowVQHPM4hoMTFDDuGcCp/jqkATaOFAKyl25sBVLFgBx01feJxU3CIe9H0d67huv91Y9nHM
	+7oKPq3yB6I2pW6apn9NBarynAPS06QglSlFAtY0Zi3CyTVvIeC5VbX7+7oU0IZ5h1UfAugzwdDwE
	qYrdarewtq3yvHhFYItr5M60zOZqxVaiu1PfL2xOnRW3zDDhnvJXIBXlkjXkEbzJJWiJ093ahiRQj
	eALAz9GkeFiQ3cbQYI0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pupUf-009sws-05;
	Fri, 05 May 2023 07:04:41 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pupUc-009swD-2y
	for linux-riscv@lists.infradead.org;
	Fri, 05 May 2023 07:04:40 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-50b37f3e664so2401741a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 05 May 2023 00:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1683270277; x=1685862277;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0qVttJJl7zkxdFrSvisstxtdfx5cNf2NOYlwSZOvY/o=;
        b=W2dw770k1l/JXipVI5PZaWFRZFXjXPPOFbu/veDOmyT7hdYqFp62NDjES8LL7h1Cpj
         uQMCEenifJR5vROS7jCNzYe9ChoaFwKwVTETLnqdjQYp8RefoYanLJLYG+l+4fvsKWku
         I8djslKkWkCgUZBtKu/0fRLCVkohaaSWFbSNpFauNffleTFNlO3nVKImDGRRCC0ugeCd
         1TKHtw7WHe2+i6pIMFf0d5nXwRwep04Cu32+Bi39L8LnCaWVNP+Fc/PNtdcfz16SuqFG
         1DgCTyVT7vpc655Ga7GUlWK/hW1ltoHbwC0QIEN9aMPk2uGfqvFEop8N7wlVZ+xfptY/
         SprA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683270277; x=1685862277;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0qVttJJl7zkxdFrSvisstxtdfx5cNf2NOYlwSZOvY/o=;
        b=TdkARPidMw2nLRhR1UNWtfMw+EmtALgFtlLF1aQOSiqMUkWlQuU6v9Fe0T7sgVSWk3
         dEvzzw/knn0ml5T+arSCXid9x/z2vk2/S6G5i48MxjCNC4o0udfghH+LE7mz0C8RjBDu
         jgu32LhVvemvDdc/Is1qOTpbJQ0T0sdj5hfqEKSn8YebIXefiGkVi218BCdwxUnCtKJU
         qB/FrilvxouNBB5B5pKKHsh4gzD8A4uCW/8oTzBoKNFr/BW4QdvIb8isdbcvrx/7pjBW
         YEOPJZ9T1SksAM+hd1zPFkwzcsnbsTO70M0uo+rT/2miPSurA0n3J8pi+ubdMsBc3Bq0
         x7kA==
X-Gm-Message-State: AC+VfDwPFTRHRGv350mVkRwNvh9zXCCKBI6XEeOJWSkkVDkWqW/iSS3n
	3H7vpXDMw8AI8xuTtoxBd2LcNQ==
X-Google-Smtp-Source: ACHHUZ5oc3VvpPeO1f5M1MwZ7APQMvSqLtacoQsy3ZavxND4h2ZAhn2LJ4auEbf6Z1XC6Gu7Ga3qOA==
X-Received: by 2002:aa7:d88f:0:b0:50b:c1e3:6f02 with SMTP id u15-20020aa7d88f000000b0050bc1e36f02mr535324edq.21.1683270277071;
        Fri, 05 May 2023 00:04:37 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id o10-20020aa7c50a000000b0050bce352dc5sm2634513edq.85.2023.05.05.00.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 00:04:36 -0700 (PDT)
Date: Fri, 5 May 2023 09:04:35 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v1 1/7] RISC-V: simplify register width check in ISA
 string parsing
Message-ID: <20230505-719ce7d94e0b4b77d3f81620@orel>
References: <20230504-divisive-unsavory-5a2ff0c3c2d1@spud>
 <20230504-twirl-caution-3a2248aa24bb@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230504-twirl-caution-3a2248aa24bb@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230505_000438_961621_65F61CEF 
X-CRM114-Status: GOOD (  13.85  )
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
Cc: Yangyu Chen <cyy@cyyself.name>, Conor Dooley <conor.dooley@microchip.com>, palmer@dabbelt.com, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, May 04, 2023 at 07:14:20PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Saving off the `isa` pointer to a temp variable, followed by checking if
> it has been incremented is a bit of an odd pattern. Perhaps it was done
> to avoid a funky looking if statement mixed with the ifdeffery.
> 
> Now that we use IS_ENABLED() here just return from the parser as soon as
> we detect a mismatch between the string and the currently running
> kernel.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/kernel/cpufeature.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
