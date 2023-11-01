Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE123C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Nov 2023 17:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4/JV1Nmuw0bluF5qoayITxO7h5AvCXk0sDgHdFB1UWk=; b=1UmCWhkElDXl+I
	Tr3qELJsS35lIOXJBf58pwunEauuMFaWtcuu1blh9trUo0Uqr5x1ZXJjTEkAjH0cFUuMxS84+GIvo
	haU1Tr+RLgIfWTY6ySCbH2U+cCciEas+ooCmXjhpjx2DIMFb6fMqsDHpeWoaA+A1LYEf0cDBNcork
	TqgijRhc9i4oa0LWmH/+6YbD7NW+ItJj540r7mDkWiPKsl25jKotIibLVEOmEjRDiC9551dC4JKAf
	lJjugbAn3TcG+/PueiLBL6nJBdEW1QZ5eaAWFA+hAfquzwOOa06+hKj4JCQeLIIh74BLwHJMSEnPO
	ejCIgmPJfI+4WWCPjYCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyEfp-007qkv-0X;
	Wed, 01 Nov 2023 17:06:33 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyEfm-007qkZ-1L
	for linux-riscv@lists.infradead.org;
	Wed, 01 Nov 2023 17:06:31 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1cc30bf9e22so287915ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 01 Nov 2023 10:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1698858389; x=1699463189; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ACtbDGuD6MnDLtRfrY8r3GOV1M4ngbjpcwXbhvL0euE=;
        b=xrMB7n1TKi8IZomi0SzFirDSS3iMiM3g7I/40/GLmLkynxBbvhW/+2KMpb9JSPjEqq
         Ki/SNJXQsISbmCaGerBwDwPvlbPIcyni/BnBjwW0xTW8kCqR/ZFLpWlSHLrp1pq7N4No
         2Yr6E0NwIurxzymm4NeGZXc5AtQEnCcOiXncIw/mp4mWD1+OgdCTyXNl5gyFsDDf4Don
         bsiCgkiDTzQhu9XfwIZT7rtNAmyMPvboH+W2hUMaeRJSHZ4+XneejvvfraCzKNDHnG7M
         ghwotTTMG+bG4JlUaze3NFVGprkewzzplV7ry3sKBBeBS+x9yXR8bJkz70Z/wOkNTFL6
         EOQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698858389; x=1699463189;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ACtbDGuD6MnDLtRfrY8r3GOV1M4ngbjpcwXbhvL0euE=;
        b=JGS7HB2OyuTat1lGDVxVOucUZNe0QF9MG1xP02dy10tbNp+NCXxmXhQ0WpE9BQtW+9
         YYHHsNRGPn8kJUIhr5IyOrIpnjtkU/qWymJ9t+gxjn68aNE2URmmUu1M9FWQiKPWDwPX
         jfwGhfr61DYV/KdTfNVZD3n5Hr2Dxps7KuPUIgOYvIDIbW9h+Q+mhSL+uvhrs7aVtToT
         BHT3ZQmTU2QWM7+nsNiICfHY0SbDLOxx8IE+np4s4xkVY65ooPs0sJLfqOC0lFLJh6Ov
         0Lg+0UFCtrp2QbkwIAkH9daFydlGTv2XZqyZQx8IQPmMabYvunuSi6nT6SxaHf+VcRU6
         Z1/g==
X-Gm-Message-State: AOJu0YxHrHahfWy2YNsJszzqNJvnyiYJrUMNBvydd3maeOW7b8xCp/qA
	8cubK9IgfAlioqo+W/tepYyvdw==
X-Google-Smtp-Source: AGHT+IGDzF7Sr80/ji5fpFgmiXPcEYqf4bfWA92oba3hW5WW+ntNPgwDgNSORh/ITQ3cqqhDMxHbBw==
X-Received: by 2002:a17:902:d488:b0:1cc:5f5a:5d3 with SMTP id c8-20020a170902d48800b001cc5f5a05d3mr9031339plg.22.1698858389079;
        Wed, 01 Nov 2023 10:06:29 -0700 (PDT)
Received: from ghost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id jh19-20020a170903329300b001c61df93afdsm1580553plb.59.2023.11.01.10.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 10:06:28 -0700 (PDT)
Date: Wed, 1 Nov 2023 10:06:26 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	David Laight <David.Laight@aculab.com>,
	Xiao Wang <xiao.w.wang@intel.com>, Evan Green <evan@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v9 0/5] riscv: Add fine-tuned checksum functions
Message-ID: <ZUKFkn/PzOjw129p@ghost>
References: <20231031-optimize_checksum-v9-0-ea018e69b229@rivosinc.com>
 <20231101-palace-tightly-97a1d35a4597@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231101-palace-tightly-97a1d35a4597@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_100630_472877_BB2AB3FA 
X-CRM114-Status: GOOD (  26.70  )
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

On Wed, Nov 01, 2023 at 11:50:46AM +0000, Conor Dooley wrote:
> On Tue, Oct 31, 2023 at 05:18:50PM -0700, Charlie Jenkins wrote:
> > Each architecture generally implements fine-tuned checksum functions to
> > leverage the instruction set. This patch adds the main checksum
> > functions that are used in networking.
> > 
> > This patch takes heavy use of the Zbb extension using alternatives
> > patching.
> > 
> > To test this patch, enable the configs for KUNIT, then CHECKSUM_KUNIT
> > and RISCV_CHECKSUM_KUNIT.
> > 
> > I have attempted to make these functions as optimal as possible, but I
> > have not ran anything on actual riscv hardware. My performance testing
> > has been limited to inspecting the assembly, running the algorithms on
> > x86 hardware, and running in QEMU.
> > 
> > ip_fast_csum is a relatively small function so even though it is
> > possible to read 64 bits at a time on compatible hardware, the
> > bottleneck becomes the clean up and setup code so loading 32 bits at a
> > time is actually faster.
> > 
> > Relies on https://lore.kernel.org/lkml/20230920193801.3035093-1-evan@rivosinc.com/
> 
> I coulda sworn I reported build issues against the v8 of this series
> that are still present in this v9. For example:
> https://patchwork.kernel.org/project/linux-riscv/patch/20231031-optimize_checksum-v9-3-ea018e69b229@rivosinc.com/
> 
> Cheers,
> Conor.

You did, and I fixed the build issues. This is another instance of how
Patchwork reports the results of the previous build before the new build
completes. Patchwork was very far behind so it took around 15 hours for
the result to be ready. There are some miscellaneous warnings in random
drivers that I don't think can be attributed to this patch.

- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
