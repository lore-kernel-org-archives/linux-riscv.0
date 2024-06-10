Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ACCBC27C55
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jun 2024 17:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b+2P6crVE2rnxynrX+YINA+9z+g7AABgEcT3SwjbjEQ=; b=fDgQiCAsoQhdoM
	vBy1wCx8ubmKgqYQZfrORTa1n5+FR8uRxdEP2qx931KIyIhWgQb6jp44NJx/xTXsMmyO9MA3Ju3k9
	qrP0vztTnVVrdt7gzVlyiEFnSWSORgx9tUggaZHXWgvfUgoaqvgL/d3Nny0w3ZA1V1sa7xx38xkdz
	Snbb5lg8QS6DdVrTwFonw0XrukHO+K1fTWFcBvFeOS+KEVSgrgeM/SD5XW+XhonEfdZWgiP3CQM5a
	m4lqnZkibjN5MLes005toWvqXuXvSWWqpHmO6IK5BN2l9e5YVFUoCQjxhMgqNVYeh/1jeAYAVXuZb
	hoKC+0AA5/o/peH3A5rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGjB5-000000062XO-3WfX;
	Mon, 10 Jun 2024 17:51:31 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGjB2-000000062WE-3CGT
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jun 2024 17:51:30 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1f68834bfdfso34923175ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 10 Jun 2024 10:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718041886; x=1718646686; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XqAidOJkzifwbi0aDp05YiJHEtIMzMs4UmIa/z6sCUY=;
        b=tQF90Lh9LDxVnCkK6tZ0cRtuEagw6poYiOEQ+0FfIukftqmYbu/w4O4ES1sH70LWwS
         cR5ycuCg799DlRByOrq9Ad50s/Nsg1F4P0jREnOj6EhXOvNPr0/jcjZxJEwd/0JBL3FT
         cVnahl8LiCF/3v+yDSPA3jyc0wtBZ5ON9RCvBj8Hg01yubwRm/TBrq5dJfYWJ/FYpp6M
         XJq2qbHoX7efBF6F3+B5OtSnYOUEhAHRgEf9IJmLPgyxcIOOs4TFt7OtVlV4q5DST4wX
         i0+L5if+GCLOxQyOVQwvqFQF6c++opAZKKHToecKDD5zBUYfLU3NFXBQ3TMUWSn6cbpt
         qtug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718041886; x=1718646686;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XqAidOJkzifwbi0aDp05YiJHEtIMzMs4UmIa/z6sCUY=;
        b=EaT90+euq5m3C4yeuNxcdV/oDapt+6FyAJJZkrb80F4NrJ5ZlyvmXJgHrQXF4Bt3+g
         KB03z10EZwjs15QjcN+9Xb2DQ3puiekCFSDIsYVfVxcnMcSzorB4hQVImGgHHMn2AZkR
         txnoYLTtJNSPCUDey8Dvim+Klrler2ZB0CEXpEzFrv++uROL+xTKodhrh69iOj/DhjlV
         5GVuhUFbBL7LBxbQvXPKc0JpBaqk91x3JO7+38C0nKSNv6iMAVhF6UDSCxsHDHGvSwaX
         L1dWeD0oldz6wGd+TAi3FLNhCmbHXJzquPlnDjtBriq+uLN6ca8i4HH5Q8MeyAeCtL8i
         CgeA==
X-Forwarded-Encrypted: i=1; AJvYcCV3sjbRvVMy7LGJ9BWAGrO8g2sb7d2CrW1rzr2/Jk2jykGakI5tokTcWcb+PGrmDVvf0s5tNjDmZ+uw4Raxr9qcHtil5BXM1G8gA/nzEUTS
X-Gm-Message-State: AOJu0YzELiZiJcE0wTNJoRoz2iMJDBUhh89afwjdcVQ6QC7jN9/dN9pN
	EZ+HxL/IkMOUPdbVxGIfAL95MgMWjq5ob/0exfjdMV7A86DKSAnYvt4Spfi5lts=
X-Google-Smtp-Source: AGHT+IGI7ZtC5yMFeVhgobcpC4ELjQ0rXq8graZvm2aNnJqlgdJJt9Tf50Z+1bVL5t64KhWiB1DChw==
X-Received: by 2002:a17:902:cf04:b0:1f6:f5bc:51c5 with SMTP id d9443c01a7336-1f6f5bc5391mr72332595ad.47.1718041886043;
        Mon, 10 Jun 2024 10:51:26 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:129d:83bc:830b:8292])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f70eeaedf7sm27441255ad.84.2024.06.10.10.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 10:51:25 -0700 (PDT)
Date: Mon, 10 Jun 2024 10:51:23 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 03/13] riscv: dts: allwinner: Add xtheadvector to the
 D1/D1s devicetree
Message-ID: <Zmc9G2syeLF2rBZM@ghost>
References: <20240609-xtheadvector-v1-0-3fe591d7f109@rivosinc.com>
 <20240609-xtheadvector-v1-3-3fe591d7f109@rivosinc.com>
 <FD6771F5-5739-469A-9C0B-952AAC62AB68@jrtc27.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <FD6771F5-5739-469A-9C0B-952AAC62AB68@jrtc27.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_105128_946488_4BCAA326 
X-CRM114-Status: GOOD (  17.85  )
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

On Mon, Jun 10, 2024 at 06:49:30PM +0100, Jessica Clarke wrote:
> On 10 Jun 2024, at 05:45, Charlie Jenkins <charlie@rivosinc.com> wrote:
> > 
> > The D1/D1s SoCs support xtheadvector so it can be included in the
> > devicetree. Also include vlenb for the cpu.
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> > arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 3 ++-
> > 1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> > index 64c3c2e6cbe0..50c9f4ec8a7f 100644
> > --- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> > +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> > @@ -27,7 +27,8 @@ cpu0: cpu@0 {
> > riscv,isa = "rv64imafdc";
> > riscv,isa-base = "rv64i";
> > riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
> > -       "zifencei", "zihpm";
> > +       "zifencei", "zihpm", "xtheadvector";
> > + riscv,vlenb = <128>;
> 
> thread,vlenb

Oh right, thank you!

- Charlie

> 
> Jess
> 
> > #cooling-cells = <2>;
> > 
> > cpu0_intc: interrupt-controller {
> > 
> > -- 
> > 2.44.0
> > 
> > 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
