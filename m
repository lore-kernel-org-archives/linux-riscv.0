Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8040C54E49
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Mar 2024 19:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=id2Hi0FmMpFK6+8M9qMj2zvuRct9hI2+ZgpffVdo4m8=; b=r0xOgRV1TXZ9Br
	zyTO6Fht0zX/pSrLgmTgZdObVYMZY1deHqiDYHwt4gT+iOiBk61AEzYwd6xIxAmJ3ovpgEMiJfbHn
	Z1S/J6hJB6w1QtZlSbGeZl5H4d2cn8JYupxXn+aAmhv938bWuxJnPIBIeZ2B2onVC+UxyRXGJH4RX
	AD2Cv1TFggjmmZtX1BgtOKM/zGYClKRKlZ8qH5c0S3LwrbQO5osfxC7XYrwRxY5jgG1Ba618IYg0h
	1GCjyqzfHqcTPAuk0f+Lm0fur8+xGn+gVfKnrS+XPaG9XALQht4n+4BqKlS7oo0fzHDtn/ihM5gv6
	C5Kz/Fh8qaIoOeNgSUQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhx3z-00000001e18-1usN;
	Wed, 06 Mar 2024 19:36:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhvx7-00000001OdO-2fsX
	for linux-riscv@bombadil.infradead.org;
	Wed, 06 Mar 2024 18:25:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=2Y5GuVIgcMEMa1wdjCxyxHdeavu9gb67/KgkXVHvPFs=; b=DyKyhxpx1ht36iB5Ue2vYzYnn9
	i9Jza0EWX6cpYrMiyko7HkPJ+m8wBF5zP+mVEEsByNmtNmo1oPnrLdjIfRW3z3ddy0aJ+UvYKucsL
	rBpoS3bZy+VKs9dOe0LIIrS6Q+qGbXZrb+Nn4Zx4W5Z/KXaXkE1u2cwsURRKBNXqYf5YTtJNKcajH
	R34oNlTBLxCeZbDcROaG75wzctFz/NSVMQ8B2kM7rua6jC3Y1yNxaOpvgJqmrwgtJEfe7n7vvKo88
	tTVyn/oHEU4fz6idenZ9AW+k9zmve8LmBRYUJPPVl4uG5q0W7wRur3LRYJjDnh15cmFuBX+Kj6Jdq
	mOgThLxg==;
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhvx2-00000006EPq-3qgf
	for linux-riscv@lists.infradead.org;
	Wed, 06 Mar 2024 18:25:16 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-6e6381df003so29474b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 06 Mar 2024 10:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1709749509; x=1710354309; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2Y5GuVIgcMEMa1wdjCxyxHdeavu9gb67/KgkXVHvPFs=;
        b=FilKAqF60GhFhVCZvR5HjLL/U7rFQbv6ywIlaAbdnW2SHSq3ulU2nHpOKnEHrlLBGt
         xAfDyink3Vzmo9deLMBxrqfpd6XtzVKA34iMnI3fyh+3ODpDbmfnCzo+hQTsZDkv8spj
         Zp5ievXE0TqYhlwlQKYVdGVyhV6Mh6PP+D1WgKtcVCTQpfUUDvebJyJl3B4Xy5LJ5XeM
         3ry5gMF1DwyAVbP30D5xqHCjty7Gcl3k80t31SaLVtWi2WGqGQ1SthzRQM1N0p+IyJXx
         bJPbi6/VBHi4xWp8F052cZcc+JPa0mrXu0sz8IHyNj8rGZZYChKVWf4S1dmyydCBNTtp
         KoPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709749509; x=1710354309;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Y5GuVIgcMEMa1wdjCxyxHdeavu9gb67/KgkXVHvPFs=;
        b=sNDc3+xI5wvpx6BHHxkcyf3E1nG4bcm4iZUaLIVN3dd943oApBP1kyK0wsqE7WZ854
         BkwgmN92VoAzgMBXc+UjxQJpmW5+26QZvWT2qdhNQaIdT2lDsz7mO2WC3BA/XxVcFUvw
         8FsFHYU9IFOu06NDR2ivgB0MB7XHrEoxLfijyY41ePzA+IZPOtywc8POSmQlyJRaJqYt
         CG0T5SoaS1MjgZkbJbLMFsr5PKH4Ci1W+AGVs/IgmxNPEcj011OQ0Vn+RZG/4FIG4kcY
         iCXvjE3Yra9Z/vVuFvioaXjRkuPRArhP3Sa+VPhyjbb/6zRExu1Bn8klu+W/VV89Z/h8
         w5dA==
X-Forwarded-Encrypted: i=1; AJvYcCWu/DYr4lSTiVSQ6Aedjfy5G1zA1w4V+71uAKB5jTJXqGlG8dWMbgUo0fV9YD50n2bNE5KXjILnPh07cOR00gAlhi05p/tBN6/C/z6Ggg8g
X-Gm-Message-State: AOJu0Yw9zkylHOUWX7cPj/eu8cOD2GAAe9b/JflZhSvTKgWadJutKk0b
	MwZ03rmjnn5BuFYV8dVRVw7T+m+/PQ8bkJDrFkaqo6BO9PhLtVjcxmhWJGp6P+I=
X-Google-Smtp-Source: AGHT+IFzBSLMGaJ08Dnj/BOlVEgA32D3g8w6QsqRlEsrWvsKtK4rYL3jf902EvY1b1GzhFtzX6klyA==
X-Received: by 2002:a05:6a00:a86:b0:6e6:5374:411a with SMTP id b6-20020a056a000a8600b006e65374411amr1699696pfl.18.1709749509245;
        Wed, 06 Mar 2024 10:25:09 -0800 (PST)
Received: from ghost ([2600:1010:b05d:dc52:3fa4:a88f:2bde:e9a])
        by smtp.gmail.com with ESMTPSA id f17-20020a63e311000000b005dc4da2121fsm11201406pgh.6.2024.03.06.10.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 10:25:08 -0800 (PST)
Date: Wed, 6 Mar 2024 10:25:05 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v6 3/4] riscv: Decouple emulated unaligned accesses from
 access speed
Message-ID: <Zei1Ac8RKNJu01Fs@ghost>
References: <20240301-disable_misaligned_probe_config-v6-0-612ebd69f430@rivosinc.com>
 <20240301-disable_misaligned_probe_config-v6-3-612ebd69f430@rivosinc.com>
 <20240306-tactless-decathlon-b0df16517b1b@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240306-tactless-decathlon-b0df16517b1b@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_182513_429376_0C31FD53 
X-CRM114-Status: GOOD (  12.08  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, Eric Biggers <ebiggers@kernel.org>, Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>, linux-riscv@lists.infradead.org, Charles Lohr <lohr85@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Mar 06, 2024 at 01:19:37PM +0000, Conor Dooley wrote:
> On Fri, Mar 01, 2024 at 05:45:34PM -0800, Charlie Jenkins wrote:
> 
> > -void unaligned_emulation_finish(void)
> > +bool check_unaligned_access_emulated_all_cpus(void)
> >  {
> >  	int cpu;
> >  
> > -	/*
> > -	 * We can only support PR_UNALIGN controls if all CPUs have misaligned
> > -	 * accesses emulated since tasks requesting such control can run on any
> > -	 * CPU.
> > -	 */
> 
> Why was this comment removed? This patch doesn't change the situations
> in which PR_UNALIGN is allowed, right?

I'll add it back, that was unintentional. Thank you.

- Charlie

> 
> > -	for_each_online_cpu(cpu) {
> > -		if (per_cpu(misaligned_access_speed, cpu) !=
> > -					RISCV_HWPROBE_MISALIGNED_EMULATED) {
> > -			return;
> > -		}
> > -	}
> > +	for_each_online_cpu(cpu)
> > +		if (check_unaligned_access_emulated(cpu))
> > +			return false;
> > +
> >  	unaligned_ctl = true;
> > +	return true;
> >  }
> 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
