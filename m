Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A496C25B10
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 21:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y9jvXCP7GTsel1ImotBl2CCm1adUMC9ZAE7EmPlM8Ts=; b=PzNUADsZJCczrC
	/hpKvVXlTclkmxzd0WaLZ1t5QBLspj9blygmn31EKHW/ZUvXWB8ooI0zwTXPMPxOefauufu+YGPB8
	IHZkY3lOosRTsbeSAcQRsg9npVOSs4uOX05cKsFtBagUc50H1nfDsBfyiGkxT/G3vTP7d50Pe24Pm
	aDNsU7KEAjlid5kWlc4Mfo6Gosq5sO9K+MtG+zcUkJTfOpZSQ2x7wms7U7NBdKBAML4M0gDXSXNrs
	ZJU1cD/hfEaxQPJITD2PXZsmGbF3X2vGfgS8QXimqAErYW0mxiyUatmek/tsF+5MS4LJDE+cM8mPd
	eCwl1EWhyAuxyR7czvnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Y1P-00000006ZGy-1zHa;
	Fri, 10 May 2024 21:43:19 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Y1M-00000006ZGL-3CVe
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 21:43:18 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-613a6bb2947so2020337a12.3
        for <linux-riscv@lists.infradead.org>; Fri, 10 May 2024 14:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715377393; x=1715982193; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=znZGy/yRb95OVSydA0Olf96JQhjDXvAUrAWe45/YUwk=;
        b=X7yY2E0ZkTxEIQaEQe8yWezNa/48qFDiANvX0nslCLtXlaoDbQFh4zMUBII9M5aW+n
         whJH0s5aqa7yhJpEYSJkYGjOCwCtltQTRfLfZE8Ss8MtY7R2kNdWbY7UACn88sH+LdEl
         b97aoTVrtnGQ4eCzFHzLyGF4rnp1/TwYC8ohNDdopCcgHaazFaIcPd02xgu6xMqTKc8L
         Ngt8kvA7S2uB2Kif5iq8xAYXjM+ecczCzHGwcL7BzKbDFxHt9kDP77i58hYSNwNFkW0u
         V3bt5IvvGX/xY0DTDoUDuSPNWG4fJyUTy7sbCW76uNWH6zHk4WrURKZD2PUxMekTAo2J
         fzfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715377393; x=1715982193;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=znZGy/yRb95OVSydA0Olf96JQhjDXvAUrAWe45/YUwk=;
        b=PkAgCiV/viwwHF0chk3iHHJwcQ6LAP5hQvzbH7VVO1fqyGOdrAY3nUk66sbLHuWrmu
         HmwNQehJ9vo/ooZVq82KzlY63S2xXm/2LVRwGx7x3/YCQGCFoZ0xP/JPS4fHVvZWIrss
         QhK2dxIuAqZIM6xdWnvAcxF7DdMyDHSGJ/fRzd2Heg3a7ZM6Tkxt+IIppQze4aiXHOos
         a7nDsqIlo5QYRNroHhM7fyHyHTkn5vu7dv9wYUU6I//Jgb9T7DesR/xymO2lKamqV0sN
         9pMVcZbnzaPiS4WTKEV27tz+AJ1r3nuRAu2sMeifaYtFXpNdwLWNUro73tJW9Gg4+LlP
         1TSw==
X-Forwarded-Encrypted: i=1; AJvYcCW6+++hlSABpTkQ6EDbbo545mY0CsNz3uiclUYsjsUcOTIdGBEA0n3OvGvT5dkQIB7dX3oaPXDhfINV5J2Xn6NTqbohBxBE52hS8N9dgPVn
X-Gm-Message-State: AOJu0Yy7SW/r1EwDDWyYd9ak0WrmsJlI/wMMBqMKdBGIXWhSEWIdyT/p
	TK5k3F6SfoApPAP4QcsG8YBavqIUs52M46zhdI3VZ0yt23z59BWzHD8Jk5mviBw=
X-Google-Smtp-Source: AGHT+IEtWLoTUTyK9dq4C93jgusnhYvSA4MYBGRO8UJYdGlNtOkcUj+f4EOdfFkiYl3CVVhOT2FWPA==
X-Received: by 2002:a05:6a20:2595:b0:1af:a4f7:cba1 with SMTP id adf61e73a8af0-1afde10ae6bmr4824878637.31.1715377393467;
        Fri, 10 May 2024 14:43:13 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:629e:3f2:f321:6c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2af2ab5sm3386387b3a.155.2024.05.10.14.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 14:43:12 -0700 (PDT)
Date: Fri, 10 May 2024 14:43:10 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Song Liu <song@kernel.org>, Xi Wang <xi.wang@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jessica Clarke <jrtc27@jrtc27.com>,
	Andy Chiu <andy.chiu@sifive.com>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/8] riscv: Add PLATFORM_MAY_SUPPORT_RISCV_ISA_V
 Kconfig option
Message-ID: <Zj6U7sZNNh8GQPYM@ghost>
References: <20240507-compile_kernel_with_extensions-v2-0-722c21c328c6@rivosinc.com>
 <20240507-compile_kernel_with_extensions-v2-2-722c21c328c6@rivosinc.com>
 <20240510-earthly-regress-7a8c8dba55db@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240510-earthly-regress-7a8c8dba55db@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_144316_925718_AA581F46 
X-CRM114-Status: GOOD (  18.78  )
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

On Fri, May 10, 2024 at 09:43:33PM +0100, Conor Dooley wrote:
> Hey Charlie,
> 
> On Tue, May 07, 2024 at 06:36:28PM -0700, Charlie Jenkins wrote:
> > Current versions of the kernel add "v" to the march and then immeidately
> > filter it out such that "v" is not passed to CFLAGS.  Instead of doing
> > this filtering, code blocks in the kernel that want to use vector
> > assembly have been changed to locally enable vector (using ".option
> > arch, +v").
> 
> Other content in the series aside, since this is a change that could be
> made independently of the main series objectives, I figured it was worth
> pointing out that this is not a change without downsides: I think that
> it would drop support for vector with most versions of LLVM as
> .option arch support there is much more recent thing than it is for gcc.
> Off the top of my head I don't know exactly the versions involved, but
> it is something like LLVM-14 supports vector but only LLVM-17 and later
> supports .option arch.

Toolchain incompatibilities are always fun. It does look like .option
arch was introduced in LLVM-17. That would be a regression. We do use
.option arch for every other extension, but vector was treated special
when it was introduced unfortunately so maybe we have to live with the
weird march parsing hack.

- Charlie

> 
> Thanks,
> Conor.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
