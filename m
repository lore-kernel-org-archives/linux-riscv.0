Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13A27C48BEB
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Feb 2024 00:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JRpp2oKK1KetPNT0Fkgmj9iCA5G3SVkNA/7el/c50Bs=; b=WiuyfO18GAPWClZMx7RxPoTgAK
	bubn1qxELbviXzxeaXue4O04hYFz2MB6RC+XqstEiUzBnnRO8aW44pvfj5XCt05OAd5cD7XY9BBSr
	F8wfOgnq5nFvZkTvv4ySxLsYndg2RpQ/K6PkytDK95vj49x0gTGemRYeSdi8KR8TDLJZgTVK/s+kx
	rK1IEOEpNyl8UQvEWD0j3TZ1QkiKBqTwd92K0mYSk3dUu4b6o3F+GSwAKmhQcs3WzGdF3MieQo0Cm
	V1RIoBLTeVtFCcgc4R/oszyJznQoS55fg+gN1Hx1875CajOT8nB0DxQ6JNpz74N6qWd5CEwpwkRot
	Nx3QK1Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcxB8-000000035Cc-2DOR;
	Thu, 22 Feb 2024 00:43:10 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcxB6-000000035AF-0vun
	for linux-riscv@lists.infradead.org;
	Thu, 22 Feb 2024 00:43:09 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-5dc949f998fso4996704a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 21 Feb 2024 16:43:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1708562584; x=1709167384; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CR24aAbNKMU+aX5oJp3mmjRiDv2V+IvxS0ZLhqmyJiA=;
        b=fY0sk/Lsif6rmgOxLeK8n7Nv8OnlUGckOlbknAggi556wosPgYrb4zWDIqmF6kvvfA
         ZUoFOXPj9ec4Xt80ZeQ2BbMjG68D6ge3Ug5ZZ4W2fdrrTpkqkIS4BPbkOtt6A4YicHzS
         RAK49PH+b+YES4SLVTpoBKgP9zPgpd3dQ1+hww5K0rfQU1BHF1Vq3mllgeETl4OFRUuV
         k3FZBsYZ7mEulRGoV/aKaiHF1kgTCkHapSewGQqjc0NbFhoIEr+c8TIQNZIyekDem9pl
         cd7vKUv9E0X5Ngo25VouvA7rbqSUUdz0YndKjQpS/y2ETKTL84Qf3D8TeleT7FikEf68
         eH7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708562584; x=1709167384;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CR24aAbNKMU+aX5oJp3mmjRiDv2V+IvxS0ZLhqmyJiA=;
        b=xO9d4/MYKODaO5AdmF4u0VPEkU4zrwVssB6ljGuXWyiGZst4oXXOqek/n/eDFPOjuf
         Kq2q01KCfOnTqB9pDv8m0AcxexCZzImJvDOUMoyB+X7154wzSeRDJqYwnn8hnkLgc/W6
         WoeFWLtZRrZ/VJ2bFFAYMNGtUdBK6HhFCj4LcnAhdYMuvr/W2rBcedgsh3Q2nH49Anp4
         jUcYx8ze4j5oOLDuU0tBMudEyos+1HazsRmXMIApeCU6Yu6nhEv1qGJ4CHZ8Elgh05TY
         dFbAG1zyXwJET/2+LJXM57VZwoeO69G/UzDpO7LwTqeEcV9wO3xaET7tddafWi2UfjuW
         R7Vg==
X-Forwarded-Encrypted: i=1; AJvYcCWeYTpDFioIWs6lOO6hhIZetLnNLx9Vbc25L1HpDqwF8x71tibeDhW0/EJFQjLfucdtQ/ZSS7ytKdkqWgE+D5oqslEkGTw+C29jecBYZ4cp
X-Gm-Message-State: AOJu0YzMSiR6BYw5O943nBXFvrFNU2CSG545BjWS/18YroqU2x83QUyS
	nX0ziMpPYL/w8aG9bcbTe8LIdo3S2gBgQR5RmzTfRNioxVHDaZCWBnbP+hLelDE=
X-Google-Smtp-Source: AGHT+IED8Qc8cv5em+hY8R0laXHeLyNpZm08160QFNjQ7Gn8Te5H8kX7oc01tG3ELGqs1k3ZjWLKiQ==
X-Received: by 2002:a17:90b:606:b0:299:99f4:5911 with SMTP id gb6-20020a17090b060600b0029999f45911mr9465260pjb.29.1708562584637;
        Wed, 21 Feb 2024 16:43:04 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id bx12-20020a17090af48c00b0029a4089fbf0sm390177pjb.16.2024.02.21.16.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 16:43:04 -0800 (PST)
Date: Wed, 21 Feb 2024 16:42:59 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: Mark Brown <broonie@kernel.org>
Cc: rick.p.edgecombe@intel.com, Szabolcs.Nagy@arm.com,
	kito.cheng@sifive.com, keescook@chromium.org,
	ajones@ventanamicro.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, conor.dooley@microchip.com, cleger@rivosinc.com,
	atishp@atishpatra.org, alex@ghiti.fr, bjorn@rivosinc.com,
	alexghiti@rivosinc.com, corbet@lwn.net, aou@eecs.berkeley.edu,
	oleg@redhat.com, akpm@linux-foundation.org, arnd@arndb.de,
	ebiederm@xmission.com, shuah@kernel.org, brauner@kernel.org,
	guoren@kernel.org, samitolvanen@google.com, evan@rivosinc.com,
	xiao.w.wang@intel.com, apatel@ventanamicro.com,
	mchitale@ventanamicro.com, waylingii@gmail.com,
	greentime.hu@sifive.com, heiko@sntech.de, jszhang@kernel.org,
	shikemeng@huaweicloud.com, david@redhat.com, charlie@rivosinc.com,
	panqinglin2020@iscas.ac.cn, willy@infradead.org,
	vincent.chen@sifive.com, andy.chiu@sifive.com, gerg@kernel.org,
	jeeheng.sia@starfivetech.com, mason.huo@starfivetech.com,
	ancientmodern4@gmail.com, mathis.salmen@matsal.de,
	cuiyunhui@bytedance.com, bhe@redhat.com, chenjiahao16@huawei.com,
	ruscur@russell.cc, bgray@linux.ibm.com, alx@kernel.org,
	baruch@tkos.co.il, zhangqing@loongson.cn, catalin.marinas@arm.com,
	revest@chromium.org, josh@joshtriplett.org, joey.gouly@arm.com,
	shr@devkernel.io, omosnace@redhat.com, ojeda@kernel.org,
	jhubbard@nvidia.com, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [RFC PATCH v1 18/28] prctl: arch-agnostic prtcl for indirect
 branch tracking
Message-ID: <ZdaYk8XERnOtiR3P@debug.ba.rivosinc.com>
References: <20240125062739.1339782-1-debug@rivosinc.com>
 <20240125062739.1339782-19-debug@rivosinc.com>
 <ZcJas4tZNzOJv6hW@finisterre.sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZcJas4tZNzOJv6hW@finisterre.sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_164308_290787_C51F438A 
X-CRM114-Status: UNSURE (   8.20  )
X-CRM114-Notice: Please train this message.
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

On Tue, Feb 06, 2024 at 04:13:39PM +0000, Mark Brown wrote:
>On Wed, Jan 24, 2024 at 10:21:43PM -0800, debug@rivosinc.com wrote:
>
>> To allow userspace to enable this feature for itself, following prtcls are
>> defined:
>>  - PR_GET_INDIR_BR_LP_STATUS: Gets current configured status for indirect branch
>>    tracking.
>>  - PR_SET_INDIR_BR_LP_STATUS: Sets a configuration for indirect branch tracking
>>    Following status options are allowed
>>            - PR_INDIR_BR_LP_ENABLE: Enables indirect branch tracking on user
>>              thread.
>>            - PR_INDIR_BR_LP_DISABLE; Disables indirect branch tracking on user
>>              thread.
>>  - PR_LOCK_INDIR_BR_LP_STATUS: Locks configured status for indirect branch
>>    tracking for user thread.
>
>FWIW the arm64 BTI feature is enabled per page of executable memory
>rather than in CPU state so it'd be hard for us to adopt this interface.
>I don't think that's a blocker, just noting it.

Got it, makes sense.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
