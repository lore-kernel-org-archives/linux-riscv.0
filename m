Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B79EE57DF
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Sep 2023 18:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7+XeD0OrWIafYBhovXzCCqrOuOki6rvP0tmI3YVE4DA=; b=qBnzfyJSLIYFvc
	3lPdub1tavsJhNW6EjjHF6oeHrigAMkT3WTIEotYo+77+/KPs2JbAnplgrApJU3i5HE0f2faJAVi2
	XMFJi5m8zIQ2MxueTW5RKPStyMXJmeHVjZBdBiSv8ggDFlekpo8GMYzXSX6pyreofFTZLClVYONj4
	rm9EdEEDHUWaztR+fQxrPrW/AYf8ZeXtoAxjo7EHS8D6Dcroe+k8rgyjBSGMiwqhQ3GgXBLOE7eRi
	DarHxQKR3O55NYfp9HrR96s9zWdRw2BecfA3quTyLL75rXtTZrxV3n7VjWfCsQp1LchsiDmaDCsf4
	T9QXHx/4mT78KgCuGzWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qflSw-00175R-0u;
	Mon, 11 Sep 2023 18:16:54 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qflSt-001754-04
	for linux-riscv@lists.infradead.org;
	Mon, 11 Sep 2023 18:16:52 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1c3bd829b86so8872805ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 11 Sep 2023 11:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1694456209; x=1695061009; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MjhADH8UGjZeZbL1DxQMJ3F6ebKKJi8760M3qyFc/vM=;
        b=owAzuBH7RH70GVfyapQRkLztnhtJU9VR5lDXpFZAcBe2hjnBVqKypzSqP2FwRI+8fy
         84utfo9UQx8nXjjsb6F8ZcUXKd/HZl/cyp01h7gt00AdgQiWfcPgWsWmW2J1DzDLawUL
         btvWpMYpFlCA/AbTi7qol3KdsFnP/rfGeebb2oKPk5ENOIBCd1KSfx5rNIna1oK4s4Ey
         s8CzxXowsylwLE7b6PXsvNwck4hvFYzqJzL5cd3U79CvWU0Qzv7b/n67GHtSHV6d5eFF
         f7icAi+NorxHoKWc91/cqB2cIhDe7/baJRfI47mTuieqcjn9YWkkx7n7mkCO0cYBkPvC
         Cf2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694456209; x=1695061009;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MjhADH8UGjZeZbL1DxQMJ3F6ebKKJi8760M3qyFc/vM=;
        b=A+8fEcvNPh/R8AKRRYdgYQq7bIicMTNgGAB8dJbXQnV5Wx5MTfjVvI1i7StX1J/rxI
         kpG5iocWquduaXgxJuyoxFdNO3FmQlNF1teON0f2UPwqLz16Yu6Y2sAUGKqz8yxENXEW
         EBvrI8HU4MCn3XAZUlqzqw+WSeNwSLXz+59tHRWIPYZeGiS28Nn4tLjVfcZYNxxVjy47
         1tApVSCT2/oNQmpR99UX7SbfdAp8Psy4RZgE8rRjp2B7gvK65CRqSHtxkbqmjiUgCFxd
         q0YiZKGGaZDXb30nVURgMIC4tZfM4RG2xt84ZsDFpE7wgp96hL3k+Ap/0ZQmpXQfg8Xe
         8B8g==
X-Gm-Message-State: AOJu0YzPVHSiAR2RKJcer/J258wwTPykhHoRR7g67fRDv0Zr45ssisEt
	Qho3r2crCgSLJVXSusqK+EkVn0rCQl6oGIcMN6I=
X-Google-Smtp-Source: AGHT+IGE+2fPDidDBevqz3qxmsZScDGIrIOCV+tWsA4RlmlOOJ4PFSPK+bB/IOz42cL74l+xTtgS8A==
X-Received: by 2002:a17:902:e889:b0:1c3:aef9:872e with SMTP id w9-20020a170902e88900b001c3aef9872emr3984841plg.34.1694456209177;
        Mon, 11 Sep 2023 11:16:49 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:53c6:e395:693d:402a])
        by smtp.gmail.com with ESMTPSA id g2-20020a1709026b4200b001b8a00d4f7asm6750332plt.9.2023.09.11.11.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 11:16:48 -0700 (PDT)
Date: Mon, 11 Sep 2023 11:16:46 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: David Laight <David.Laight@aculab.com>
Subject: Re: [PATCH v2 1/5] riscv: Checksum header
Message-ID: <ZP9ZjoFk1GV8gcW1@ghost>
References: <20230905-optimize_checksum-v2-0-ccd658db743b@rivosinc.com>
 <20230905-optimize_checksum-v2-1-ccd658db743b@rivosinc.com>
 <20230907-f8c8993dbeb24d5ea5310ec7@fedora>
 <ZPoMAGYlIxPZsE7+@ghost>
 <cec0f23506a54b9aaaef054ea949e4aa@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cec0f23506a54b9aaaef054ea949e4aa@AcuMS.aculab.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_111651_078773_DB97F9DA 
X-CRM114-Status: GOOD (  16.42  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Sep 10, 2023 at 09:20:33PM +0000, David Laight wrote:
> ...
> > > > +/*
> > > > + *	Fold a partial checksum without adding pseudo headers
> > > > + */
> > > > +static inline __sum16 csum_fold(__wsum sum)
> > > > +{
> > > > +	sum += (sum >> 16) | (sum << 16);
> > > > +	return (__force __sum16)(~(sum >> 16));
> > > > +}
> 
> I'm intrigued, gcc normally compiler that quite well.
> The very similar (from arch/arc):
> 	return (~sum - rol32(sum, 16)) >> 16;
> is slightly better on most architectures.
> (Especially if the ~sum and rol() can be executed together.)
Oh wow that solves the problem of needing to zero extend the result
after taking the not. Taking the shift after the not both zero-extends
and places the result in the correct spot. It is a very interesting
property that it is possible to change the order of the operations if
the addition becomes a subtraction. I will make the change. Thank you!

- Charlie
> 
> The only odd archs I saw were sparc32 (carry flag bug no rotate)
> and arm (barrel shifter on all instructions).
> 
> It is better than the current asm for a lot of archs including x64.
> 
> 	David
> 
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
