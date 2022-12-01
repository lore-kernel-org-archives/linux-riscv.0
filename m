Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BBC3C43217
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 17:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wFRVcrASl3tvQWND21Fm8e7aZEraQ1OCKw71mrLwhg4=; b=xs90bqh3n9sY6e
	co4YIBZ/0kuoId3+liADDCm152znSCR+gDfs5v4kbn94uugdJGH1dMGwvKn+E7dhckg9q5xCSIVVT
	AsCclUNGGK1HhvnjfANigEutX80bIVXGrlJmBgJpr+JlsYAM8rt5Oy0z49n3PJEPpEkILZGLNph9I
	R5APfS8dJMV2f+XLJm3L5giDA9jBSSbiz/b0G2V63ZExr3G8OfxWOah7Htst+nCxfPS1J/cVYLy6p
	Y2cDhnakFGzgApSPLaMayHKjRHf2Ulma+YrBa1/mBBgjRO6ukEthAGA85nxNApcGyYHh/Egl0uUo1
	mGS3wkdv1+8nBlg9yF2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0nVq-0094eO-KX; Thu, 01 Dec 2022 17:38:18 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0nVh-0094Z3-Rp
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 17:38:11 +0000
Received: by mail-ej1-x636.google.com with SMTP id ha10so5940917ejb.3
        for <linux-riscv@lists.infradead.org>; Thu, 01 Dec 2022 09:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bJqqYSAsjPMcuG5vSsiyNCqhraQjpw3utzWkeWcy8J4=;
        b=h4+czWEskZcU4AMrBU/moWfkVYLOOSdRhHEq0pJ0nnD77xcizGLWxglyUyAhOkyjg5
         ZdaA+hmSdZE4xcx3gglzDioe0mPCtc+zREXXT0UtFVuAKbuyFwlhos1F+qfw+cqzgviW
         5jH1XoRyOAbbTJaVZS7/jwjLEI++UKES/RPv9swy30KyJcQc/m9VJT0pEWgT4xGfRJiH
         dthrbkgI5ii988sslltxUvuuXZo15rUyZ06Jxl4815f36cx7miwYjdod6tav+Gjbcy1a
         DP38a29dyV6ZcOpw7gfJrL65euxhVzT6ZXNJZ762LGQyoMUVBKj7ZxO9AHJy0HvXbOfz
         Uh3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bJqqYSAsjPMcuG5vSsiyNCqhraQjpw3utzWkeWcy8J4=;
        b=KtynDIB9PjLlUvTUiAMStNBIGcVndYYGsE7pq9kt5QnETu9XNmsRjy9VoT/LcgBwhU
         UToqYHvQV9T6OStLu/rGaMtMoJgirh5WeCd7ZddTmYtinCqpcH6D8D9ncuIS5pFsn3tt
         oSb+YBhnQm/oAsDjpkioTd7xcsV1s8VEN2D1G/2Q8/rLX5hFwx/u3upruGV4GslVBsVW
         bakzZTGPyp9fYAgn6suMvONTzELBgp9gqfVofbCsx0cbV/fdUe5tBBf2fR8kImWtohcj
         0XXRewGKZVGR8k4B3SOrVXft6tiKtq11STjmJDSbqIQbi5l96pUw7bnogEH8lGASphLX
         GGmA==
X-Gm-Message-State: ANoB5pkff3ZNf7pKBHSVTBTMKiYn7Knc6xv4X28GrxAvF1OkwUQkEptR
	PCNrUlF45gtbLo3/wJCP2+sMHA==
X-Google-Smtp-Source: AA0mqf5HVtlFtvahiDbwVNXEd0f+5Dj64yDpPTZMPC8HnmxFic7CgKKmIGiJ8MDcaPOxHFtoRMbF9Q==
X-Received: by 2002:a17:906:448d:b0:7ae:37aa:6bf with SMTP id y13-20020a170906448d00b007ae37aa06bfmr56319181ejo.481.1669916282110;
        Thu, 01 Dec 2022 09:38:02 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id bj15-20020a170906b04f00b007b5903e595bsm1995218ejb.84.2022.12.01.09.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 09:38:01 -0800 (PST)
Date: Thu, 1 Dec 2022 18:38:00 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH] riscv: Apply a static assert to riscv_isa_ext_id
Message-ID: <20221201173800.fgvhopyvfrxexz3f@kamzik>
References: <20221201113750.18021-1-ajones@ventanamicro.com>
 <Y4jjQcDlRPZkNuHU@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y4jjQcDlRPZkNuHU@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_093809_975930_A80A2C77 
X-CRM114-Status: GOOD (  22.96  )
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

On Thu, Dec 01, 2022 at 05:24:17PM +0000, Conor Dooley wrote:
> On Thu, Dec 01, 2022 at 12:37:50PM +0100, Andrew Jones wrote:
> > Add a static assert to ensure a RISCV_ISA_EXT_* enum is never
> > created with a value >= RISCV_ISA_EXT_MAX. We can do this by
> > putting RISCV_ISA_EXT_ID_MAX to more work. Before it was
> > redundant with RISCV_ISA_EXT_MAX and hence only used to
> > document the limit. Now it grows with the enum and is used to
> > check the limit.
> > 
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  arch/riscv/include/asm/hwcap.h | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> > index b22525290073..86328e3acb02 100644
> > --- a/arch/riscv/include/asm/hwcap.h
> > +++ b/arch/riscv/include/asm/hwcap.h
> > @@ -59,8 +59,9 @@ enum riscv_isa_ext_id {
> >  	RISCV_ISA_EXT_ZIHINTPAUSE,
> >  	RISCV_ISA_EXT_SSTC,
> >  	RISCV_ISA_EXT_SVINVAL,
> > -	RISCV_ISA_EXT_ID_MAX = RISCV_ISA_EXT_MAX,
> > +	RISCV_ISA_EXT_ID_MAX
> >  };
> > +static_assert(RISCV_ISA_EXT_ID_MAX <= RISCV_ISA_EXT_MAX);
> 
> FWIW checkpatch complains about the lack of a blank line prior to the
> static_assert, but dunno how much anyone cares about that. Lack of a
> blank line here makes the purpose more obvious to me /shrug

To me too. Hopefully checkpatch robots will feel the same.

> 
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
drew

> 
> >  
> >  /*
> >   * This enum represents the logical ID for each RISC-V ISA extension static
> > -- 
> > 2.38.1
> > 
> > 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
