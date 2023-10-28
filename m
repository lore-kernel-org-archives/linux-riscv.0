Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B22C27C48
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Oct 2023 00:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=67cW6HPaP7WV9YQtA1hVe+aoaMuKdqhlIsXKrXXmv2I=; b=xa+ypdyuiKX6cH
	pyfDP6/7VsAqRt2+1L+YjBxqUdf0KtbsM4PCalYD2S52Jhdn0LdR6Aor+PnooKfBVy/7mEV942WOD
	W//TP01jGRjAXpg+BbCVVQsFq9M9OFW8pl90iTsLklQtGFZYqEloK/vAErskkU4EDw9sypbdG4Z00
	YQsfI92nTDW2nP0jSTpBG1YNCUlpYvS8finjyc6ZiFq/O7JsjfiowAWBF056JcayMhQ0TTLQE5FEN
	/OTpEEU8e303VSl7Yxdq9M5yigtV7FQDTLLt5w3eXtrAiTcvVEyqqWlocvM6r2+XS738NEUoeDO1O
	OdummoJfHqwaNlGm9yyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwWp4-00HOIZ-2h;
	Sat, 28 Oct 2023 00:05:02 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwWp1-00HOHQ-2k
	for linux-riscv@lists.infradead.org;
	Sat, 28 Oct 2023 00:05:01 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1c5cd27b1acso23776115ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 27 Oct 2023 17:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1698451489; x=1699056289; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qU8qhN8NeuXvpuSaXXgUKByT7/WBJrVSQRx8q7qX/KU=;
        b=w/SKrBobM5RUVmquto7Y+CVUC0UnpRuD6TUA8uCr/fvQQ65tb+XSFVedLuRGT5JPTC
         SKTiVlKoQQMp8Nq2LhwdDibcqHr+dKJbYymidozQwMxY9C6hHKmJ3VFJrdTa+ADNWtCP
         tMliAzlIjLCwsPFManPtZxuuO5R9wGNmdZop5x9ktFzn0tlzITGrMIH1ov41NRiNkK+b
         lDHws1roKURnnWHpNK8MTQ8fEEfeLoyQIRCQWuhnCH7zAB1VRrlX2pCKbcRCaq8kZa1y
         vnpao5KdHtX1I54aKLne+XAdrocpTfH8mVTEgyj6OuTgrh2FTRWcCFDRWGAu5en7kBNw
         6Q9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698451489; x=1699056289;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qU8qhN8NeuXvpuSaXXgUKByT7/WBJrVSQRx8q7qX/KU=;
        b=Ku8ByNGzy9guxrHinOHtQyoDM0Yqo/f85CfAWVcaKuPrPxChRpylG2oNyDor9PKe8o
         Qh6phLwjqyJi/29eF3Tbbmoge9k59vNF+VqwKYfpG6EfhwVwr525sCueeyc0pRtyygi0
         sW/1/7zqrIDkiTcYQ0OwZCA2jf8Ek4rSRPrF+Q0v3EmsIkr/FMKLGD43lB5VPdUQp6Wu
         Bo/KZiYmFg9PnKTRgst7k8//TU1y7aPPZkaAldF0frbXn++S0x8PXKAwqIQ1AtJBT3zO
         G2Gr92n30KatUAGRFKaFf6hsraYhaxkxeL9GDFRPSs9LjWA4vkZ08YlMZGPR4TIwdMh5
         JDSg==
X-Gm-Message-State: AOJu0YywtunT/X6pbOimGHpZKq2C5TgNZ8GN5EA0dFRqMaG5P5Nv4Vvy
	YH7ylgDcWyhMzAHGwexKYM043Q==
X-Google-Smtp-Source: AGHT+IHCWZUCOBrHeYHsbktRHjy1dwHh6CQjMh1NI3hlaxVuQBaSwOfSsn52ubFNnvm1Dp9H4oR9Aw==
X-Received: by 2002:a17:903:1385:b0:1cc:23ad:c2d5 with SMTP id jx5-20020a170903138500b001cc23adc2d5mr2905369plb.39.1698451488878;
        Fri, 27 Oct 2023 17:04:48 -0700 (PDT)
Received: from ghost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id iz15-20020a170902ef8f00b001c9c6a78a56sm2136056plb.97.2023.10.27.17.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 17:04:48 -0700 (PDT)
Date: Fri, 27 Oct 2023 17:04:45 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	David Laight <David.Laight@aculab.com>,
	Xiao Wang <xiao.w.wang@intel.com>, Evan Green <evan@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v8 1/5] asm-generic: Improve csum_fold
Message-ID: <ZTxQHVplimd4tquE@ghost>
References: <20231027-optimize_checksum-v8-0-feb7101d128d@rivosinc.com>
 <20231027-optimize_checksum-v8-1-feb7101d128d@rivosinc.com>
 <20231027231036.GM800259@ZenIV>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231027231036.GM800259@ZenIV>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_170459_896929_EDCEA81F 
X-CRM114-Status: GOOD (  12.31  )
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

On Sat, Oct 28, 2023 at 12:10:36AM +0100, Al Viro wrote:
> On Fri, Oct 27, 2023 at 03:43:51PM -0700, Charlie Jenkins wrote:
> >  /*
> >   * computes the checksum of a memory block at buff, length len,
> >   * and adds in "sum" (32-bit)
> > @@ -31,9 +33,7 @@ extern __sum16 ip_fast_csum(const void *iph, unsigned int ihl);
> >  static inline __sum16 csum_fold(__wsum csum)
> >  {
> >  	u32 sum = (__force u32)csum;
> > -	sum = (sum & 0xffff) + (sum >> 16);
> > -	sum = (sum & 0xffff) + (sum >> 16);
> > -	return (__force __sum16)~sum;
> > +	return (__force __sum16)((~sum - ror32(sum, 16)) >> 16);
> >  }
> 
> Will (~(sum + ror32(sum, 16))>>16 produce worse code than that?
> Because at least with recent gcc this will generate the exact thing
> you get from arm inline asm...

Yes that will produce worse code because an out-of-order processor will be able to
leverage that ~sum and ror32(sum, 16) can be computed independently of
each other. There are more strict data dependencies in (~(sum +
ror32(sum, 16))>>16.

- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
