Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BECB5C52D7C
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Aug 2024 13:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ASsK+6VBK9JOwcJ9aZk+5uW5Q9OQLOUZNP4iM4Jk+0M=; b=UOOJ/fMtYusZq1
	miOeAHp9urVuheBauu6sh1+BTGsIA3zxCO2YJueHBoGzsgQRod4k8xZOF7sGLdilYC9ZUvyRW4UEW
	Emd4FmRb35YI+hSCp+NFzgUBTztF9XLZJ2VI9FRxBNLPmrs6yNjYhCuO+FKtITZlzBSmGPZTpCCvz
	hxIUikJigmEbv7WAq6hHXvdUxUBxD9ByFL0LnAiMkTjG1SRPfEqcWxDDNhuFhPrCd0tYnhZ0dCPJJ
	rkVdGk0GXYKfHbcO2IGTMkRV/IopP68p7dy90r6CnvD5IdgWv8dNBzXngwFdF7p2U+RQCA+UbNISi
	+61wFPFrvjker/GerN6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh85C-0000000CzlY-3DaJ;
	Thu, 22 Aug 2024 13:42:34 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh84M-0000000CzZX-2QC5
	for linux-riscv@lists.infradead.org;
	Thu, 22 Aug 2024 13:41:43 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-533462b9428so1389715e87.3
        for <linux-riscv@lists.infradead.org>; Thu, 22 Aug 2024 06:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1724334100; x=1724938900; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=imZf6FTHHFv1jc8blHwhJuknb8qH4z1prHELoYZxzpU=;
        b=aDMv4AUBvEC0Qp4H01yvxttvnQk2UjP+HEWE+EKk+q+lkrfX/Uy1LHQsKPMyYJt0Hv
         Vb7gCIMWF/b6WSfZXbHowWZ/OeB/1k9ffFNZXfgDl3c4fJnUyCtTswmgX0+WNhT4djVc
         4WcrYjg3BuXeLY0aYcJ+KbkDOz+A5Lr0FTMbelQhLrJRmgsnSI2eCeuODzCqVZwh7U4/
         3gMxwTfztfFViFgLPNK/myQ6ryLD5xInGkPhkKNZ34JmpEg8L/JAZOiX7AqYgzrfCfDW
         /3qFlMipGcoyYXoeFrXaPfiIe5TfhwyLZTJpV/1YBLZJFf8aG2SoR+msnWYRgO+egCDR
         7uQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724334100; x=1724938900;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=imZf6FTHHFv1jc8blHwhJuknb8qH4z1prHELoYZxzpU=;
        b=BpXhPYsEjK45fMwz5rfCVr0MyXmjx6zR5CpsZzMy/2j3Gp1K8egfq2sOE9gmWwP4eD
         mlNt2CkbuUOD8CBDsaDoKj1DXi2HqexuUF4zKaYlsC+feUWqhuVOdy3JxbsF4HK1kryn
         VRMVEoIHVAP3NXX2i6nt8+KkndlCaLsZMUK5tnMExDq6iksLt3IJUxg3Vt9sZ4pee7jf
         nlvFZOD9Jd8tSnb1Nqkq25K5qDtGSPYeVYrkaKr7C+/UEQlCoj0dc3gXl8No1UmA+kie
         KBt4GjMXZC+PGnitB0Qgnr2vcvUnN9EGAEdvMHep0xyJkxjtk9XJuSQktKYH7UUWYDSD
         0fEA==
X-Forwarded-Encrypted: i=1; AJvYcCVxTITWXdqAIRdLqIUn8XZ1dpjjf1RSGDMhtbZZZMCDrwiCvrHlZdbK0cqjcafTFtFovP4vgFr8kBZYfw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2sJpPBxRvBEYdqqbQPiX5RgkSVx9r4s+WrwZvEHDBY8vqY5eD
	hVN8n1AElSTOim8/78l27KnAR6KeLU2rL23cglW9BkRGbzRRJXHyYJru53lwsL4=
X-Google-Smtp-Source: AGHT+IH32O883q08dUa5KOEo4YvEjt3Mp2Ar6drhkiJlCswVQ0XO6rq1iTaTl5tp3/AuAH3rpAo2EQ==
X-Received: by 2002:a05:6512:3c89:b0:52e:d0f8:2d43 with SMTP id 2adb3069b0e04-5334fbe593emr1743888e87.17.1724334099444;
        Thu, 22 Aug 2024 06:41:39 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f220ccbsm123140966b.36.2024.08.22.06.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 06:41:38 -0700 (PDT)
Date: Thu, 22 Aug 2024 15:41:38 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Quan Zhou <zhouquan@iscas.ac.cn>
Cc: anup@brainfault.org, atishp@atishpatra.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, mark.rutland@arm.com, 
	alexander.shishkin@linux.intel.com, jolsa@kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-perf-users@vger.kernel.org
Subject: Re: [PATCH v2 1/2] riscv: perf: add guest vs host distinction
Message-ID: <20240822-a03a7c96ebceb658325e7fce@orel>
References: <cover.1723518282.git.zhouquan@iscas.ac.cn>
 <3729354b59658535c4370d3c1c7e2f162433807b.1723518282.git.zhouquan@iscas.ac.cn>
 <20240821-f5e1d6afb0d2230c1256a75b@orel>
 <430f3d38-b12e-4ac8-8040-33bab40380ab@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <430f3d38-b12e-4ac8-8040-33bab40380ab@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_064142_642810_5B938CAD 
X-CRM114-Status: GOOD (  22.62  )
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

On Thu, Aug 22, 2024 at 02:38:44PM GMT, Quan Zhou wrote:
...
> > > +unsigned short perf_misc_flags(struct pt_regs *regs)
> > 
> > I see that the consumer of perf_misc_flags is only a u16, but all other
> > architectures define this function as returning an unsigned long, and
> > your last version did as well. My comment in the last version was that
> > we should use an unsigned long for the 'misc' variable to match the
> > return type of the function. I still think we should do that instead
> > since the function should be consistent with the other architectures.
> > 
> 
> I agree with your point that the type of `misc` should be consistent with
> other architectures.
> 
> However, one thing confuses me. The return value of perf_misc_flags
> is assigned to the `misc` field of the perf_event_header structure,
> and the field is defined as `u16`. I checked the return type of

Yes, that's what I mentioned above.

> `perf_misc_flags` in other architectures, and I found that for x86/arm/s390,
> the type is `unsigned long`, while for powerpc, it is `u32`.
> These do not match `u16`, which seems to pose a risk of type truncation and
> feels a bit unconventional. Or is there some other reasonable consideration
> behind this?

No, it's just historic. I see three paths, one is use 'unsigned long' like
the other architectures and assume we'll never have flags touching bits
over 15, so it's fine. Or, same as the first path, but also add
'#define PERF_RECORD_MISC_MAX 15' with a comment explaining misc flags
must be 15 or less as a separate patch. Or, for the third, add patches to
this series that first change all architectures to return u16s.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
