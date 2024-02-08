Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABE82C48260
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Feb 2024 17:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=G6JBz641g3DU50XxX6BP7L352DMyrothwvKLp/dt4H4=; b=VXV2LqQhFRt0yl
	JuuCGNm5fvwZDT3YRapjin8/JGcJ1dFt383SNZ3iEKUUxBDLRN/5rSV+OQUpjPjGF1jAMbbz2rRn3
	933SIqiGA74egJl4i+K4S3RwjeQSQ80ys08THCfjj29b467eq5OSYz0ox85dijKN40O57i86q6IhU
	VsCpTSi8feGwd9qm63CJY7DK9BSrWPE1MAyA6Ftdfk1zMynbB/iFnN5S1BBdGyyoidjoh6D1MiCh2
	logWMViu0CGGe+BUZxK9gVWW9m1ZXQQV9x3bBaQJmH7Jnfc8PJTVGosNw/tjcmp+ll1I2WSANFtKh
	BzwXi3U4gLDRZAxh/ZhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY8PF-0000000EWH6-439s;
	Thu, 08 Feb 2024 17:41:54 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY8Oi-0000000EWCb-0Usq
	for linux-riscv@lists.infradead.org;
	Thu, 08 Feb 2024 17:41:18 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a2a17f3217aso3609366b.2
        for <linux-riscv@lists.infradead.org>; Thu, 08 Feb 2024 09:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1707414074; x=1708018874; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rf4ak4y7a21DDni/9iTuMaCFfNzpeO4ri+6JtKkqXps=;
        b=nsL4oND4+SImOMbnUP508xpYBjXiDsPBHc8K+Cgmj7Kw9PHtgXDslOOYZcO7JBwbHM
         y4k7P9dHRDG+rjxtinQqaMYOStCUtbgjxmGuVhduy9IR7inGIen384w2X01BE79v7JIw
         RFWraCb419UFvqQQMhwS+OVpcHjTAvjvsGH56PR44FSW1JXZ5tgy89EKYbZmFB07it7J
         XW1ImRIJD9Xgr/eG1x8J/i+tZ4v7Ba+eL+DXt1ORr9qrn6uRt0nY4gjruyGcU8UwXhzL
         O7o8uQ0B/HQvkIdcvkmF6bsS+pV7PoK9NZK9HpNyBH1qOmM67iA0MQ+ElqHHaZbMlRNy
         5OHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707414074; x=1708018874;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rf4ak4y7a21DDni/9iTuMaCFfNzpeO4ri+6JtKkqXps=;
        b=Uw0UlbZlu7bS2T+hAnYhl+rve5oVYqR0BIXsmI3g5P9F0i5RTzv3ZftE1tgIK/f16r
         l5nHsKm49yIjHuGHRPmbZqnt22TdcGBKAHcMki8i4c4yZXKGRVpCe4DvtqT4UHM2G+E5
         K0+IUYYqETxADbrgHvITEtJORLxm1+AsbBsggCxWP1+eAL4CELolbioZh61ZEs0SiD+9
         op8Fs6+az8FyTADBEOg7x7l0dn3zyXrCX0nbdmfgpdd4Nz73raNQ70a0lfTwT9nDKuYl
         OSie/xcCGZHALbSjc1YXrdEVkEFEJxlnz1eSp8i2YX2Xw303ZLU6qX547G2DlomqKmih
         +HzQ==
X-Gm-Message-State: AOJu0YynGz1Aa8AUlE5B9Yq1rMnAZ9SlfmkkT1taUK9e1hXvl75AkbLP
	QXDg5ig/fZm5W5LI4KRg8It6saERK/+bpenXpcR6ZfQ2NNogOcMpDMhhw4GD5Qg/RQQH/Riqm24
	O
X-Google-Smtp-Source: AGHT+IFRUhYogGSGadzWGpSNeimsCxiciJXP+tUslSALCYQrjsMvfR1FLl7L950wrqHDH4shPnrE4A==
X-Received: by 2002:a17:906:c7c9:b0:a37:ff6a:744e with SMTP id dc9-20020a170906c7c900b00a37ff6a744emr21895ejb.25.1707414073764;
        Thu, 08 Feb 2024 09:41:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWC5GXA62u2biSYfCLEHWAKoOVQsp5S6SsvGb+MolSdMJa86vGyP/u9wvTG8PVF8+t68jg7P6lXa9INhvw0FjfVs4ELseWNLoL4OgRRfQ==
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id cu10-20020a170906ba8a00b00a3bd7052c22sm16982ejd.60.2024.02.08.09.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 09:41:13 -0800 (PST)
Date: Thu, 8 Feb 2024 18:41:11 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org
Subject: Announcing RISC-V support for kvm-unit-tests
Message-ID: <20240208-d78f3ecdaf1c2c9237aa90bd@orel>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240208_094117_086350_F4E4B62A 
X-CRM114-Status: UNSURE (   8.43  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


Hi All,

I'm pleased to announce that the initial RISC-V port for kvm-unit-tests[1]
has been merged.  With the initial support we can begin writing SBI tests
which can be used for SBI implementation verification, as we've previously
proposed in a tech-prs call [2].  Any SBI implementation which supports
QEMU as a platform may be tested, e.g. OpenSBI, RustSBI, and KVM.  SBI
implementations which do not support QEMU, but do have bootloaders which
support EFI, will also be testable soon when the EFI support for RISC-V
kvm-unit-tests has been merged.

CPU validation tests may also already be written.  When CPU validation
tests are run on QEMU, then they will validate QEMU itself, which may
be useful for the development of new QEMU ISA extension support, as well
as for regression tests.  Additionally, on platforms where it's possible
to run Linux and KVM (e.g. QEMU, other emulators, or actual hardware with
the H extension), then tests may be written which validate KVM and guest
mode behavior (this latter test scope was the original purpose of
kvm-unit-tests, hence the 'kvm' in its name).  With minimal effort it
should be possible to use alternative KVM userspaces with KVM testing,
e.g. kvmtool instead of QEMU.  Finally, on hardware that supports KVM,
it's already possible to write virtualization micro-benchmarks.  After
the EFI support has been merged, then micro-benchmarks with scopes
beyond virtualization will also be possible.

Thanks,
drew

[1] https://gitlab.com/kvm-unit-tests/kvm-unit-tests
[2] https://lists.riscv.org/g/tech-prs/message/649

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
