Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 503FCC54E66
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Mar 2024 05:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kf1wR+6T/0V9C0Hg9j2vky5G/y8Z7sITGgAsMAGRxSQ=; b=tkKH5rkYZw/dii
	CppDNgOV7okwz90QuZoYORBs19sJnYNUrm6OdP9vgoMvqzaGZ+7dOaT7PnGwijRR3w37u190eVWKO
	60e0RLkeAFa7rufUQOfZ7pCNY16L7GdqxT0F28/MRAz4cN38ovEYvBnryqj3U6EY0zHjsRwpb1Qg9
	sFj/f5NIyng5I0dcseTVKO7rk76vj+CbAKSD8OysPGjgVd/VLik8Z3iZSN8nDqWa6EHLBCxM5AtPb
	cOdkAWC97ih6oqiJxprQPrIlC5P+wp8u4UnZ6nbDbZH3XebQdyL8wDbIkQomnm66YZKGhe9phcFe6
	6FJcIIPp9IDQjDgetDbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl0Vf-0000000Glw1-3ARA;
	Fri, 15 Mar 2024 05:53:39 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl0Vb-0000000Glv0-37U5
	for linux-riscv@lists.infradead.org;
	Fri, 15 Mar 2024 05:53:37 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1dc09556599so13327155ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 14 Mar 2024 22:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1710482013; x=1711086813; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6143Xt6B1fDIKqVroZrZ1l3ARGTZuJpSXXKGYmPvAls=;
        b=Rs5EPNH6YHJymb5b4KKTkRD7tEN69HHuSbnPI5rnsunDgXvJoTRWJ6xIckaHgrNzy0
         gWOhJp64XlI5k7593csJxtJXwGxs2VrzKEFznwbKAYq3XJ6kVkJ9H6QLmgEcoFifADD+
         TMxPVzRROmps+X5QWWA13qEA+U+n9rNgstAlAYjuTKTAm72NqfVloMFtUM19wAWjBmcQ
         OwEs66w2JdGvinpbXbBvYBfVFsUpw1s5JDy33qwSD9rNH0HvLAE0VQUNWqNoXPMVSSX0
         r4hq6G696EJq6xwwaWxvrpXmKaY1N/zN5xlJzAYHuEKPVv5s4jCY7czRWDPsvJ4I4XEM
         vvpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710482013; x=1711086813;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6143Xt6B1fDIKqVroZrZ1l3ARGTZuJpSXXKGYmPvAls=;
        b=KELUexEV+TWeN1fjefIVAiQiqz59XED6VRyVIB9RrfgzwEfG9QzaTDepagDUsqkgu8
         4va0MJ4S51U/po+NcUp7Ulshec6Fr7NPJHOUY6KF1WF/hTuONhRGbShEG6075A0z4QUZ
         ThKxrDZFmMwTdUY3fxvpZwuSpxxlGmbIwwTd11P/UmFm/Wnwrza8adh74H9Jfp3z0dm1
         dzqQGQj7g/AcuMmaYoDnfV1rUS+FMR8HXHIoxO8vLDScVtT+4JpRiVu84kLGkIuuiGQy
         Ceb1sMH8g8Jty23nJyj+U712vNZ7/4jClupkN0H4ja1qT97juCVxRNsrJqA4Ihg5Zvd6
         8ljQ==
X-Forwarded-Encrypted: i=1; AJvYcCU31geUIgJljsmAF6DE7vS5hLOywYH1SDX8UiiBpwI/DD5uGU3FRjBhTiLAcbpsex3Ymj4/v4vvs+6dfJ2KT6QSVjFv5x7/6rZayKVJNNit
X-Gm-Message-State: AOJu0Yx277p4tpxcZ5g4jELdBENEJMWfen9hBcUvvSoVgHYJeM7XZbSz
	Ehrq2PEY3+4wr1hun8/VMzvqYBZzwXe/+ger05MhBxbiwk5b0UtkGocfa+N+5TI=
X-Google-Smtp-Source: AGHT+IFdhVX1m34Rty2PqcdB9AWHBwlmpI+1s+YRgrPY8LLbB4ruxR0YBRVt2iLRDYdvkYdiR1xfvw==
X-Received: by 2002:a17:902:f706:b0:1dd:8df3:1727 with SMTP id h6-20020a170902f70600b001dd8df31727mr2720117plo.44.1710482012859;
        Thu, 14 Mar 2024 22:53:32 -0700 (PDT)
Received: from sunil-laptop ([106.51.184.12])
        by smtp.gmail.com with ESMTPSA id u11-20020a170903124b00b001dcbffec642sm2804203plh.133.2024.03.14.22.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 22:53:32 -0700 (PDT)
Date: Fri, 15 Mar 2024 11:23:23 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Drew Fustini <drew@pdp7.com>
Cc: linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@ucw.cz>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Len Brown <lenb@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Atish Kumar Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v3 -next 0/3] RISC-V: ACPI: Add LPI support
Message-ID: <ZfPiU5aSw0jML3S1@sunil-laptop>
References: <20240118062930.245937-1-sunilvl@ventanamicro.com>
 <ZfO5oiVSVSmlP8eL@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZfO5oiVSVSmlP8eL@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_225335_893848_4B5ED097 
X-CRM114-Status: GOOD (  16.26  )
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

Hi Drew,

On Thu, Mar 14, 2024 at 07:59:46PM -0700, Drew Fustini wrote:
> On Thu, Jan 18, 2024 at 11:59:27AM +0530, Sunil V L wrote:
> > This series adds support for Low Power Idle (LPI) on ACPI based
> > platforms. 
> > 
> > LPI is described in the ACPI spec [1]. RISC-V FFH spec required to
> > enable this is available at [2].
> 
> I'm interested in trying out this series. Might you be able to provide
> some guidance on how to setup a test environment?
> 
> Are there specific branches of qemu and edk2 that I should use?
> 
1) You need LPI objects in the platform. I have added dummy objects for
testing this for qemu virt machine. Please use below branch.

https://github.com/vlsunil/qemu/tree/lpi_exp

Since interrupt controllers are not merged yet in linux, we need to boot
without any IO devices and use only polling based console and ram disk.
Above qemu branch disables IO devices as well.

2) Enable below config options while building linux kernel.
RISCV_SBI_V01
HVC_RISCV_SBI

3) Use upstream EDK2 (RiscVVirt)

4) Boot:
qemu-system-riscv64 \
 -M virt,pflash0=pflash0,pflash1=pflash1 \
 -m 2G -smp 8 \
 -serial mon:stdio \
 -blockdev node-name=pflash0,driver=file,read-only=on,filename=RISCV_VIRT_CODE.fd \
 -blockdev node-name=pflash1,driver=file,filename=RISCV_VIRT_VARS.fd \
 -kernel arch/riscv/boot/Image \
 -initrd buildroot/output/images/rootfs.cpio \
 -append "root=/dev/ram ro console=hvc earlycon=sbi"

Feel free to ping me if you have any difficulties.

Thanks!
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
