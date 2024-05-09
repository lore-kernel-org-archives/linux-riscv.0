Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9054C10F1A
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 19:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TUG8O4hUnBUKQR540+kgbaFjpBN2zzaM6pUHkcPFa3s=; b=YzQPTfDBx7yOKfboiNQFWwXS7k
	3/4UBkGKe99bkzEGkyuGM/9QkOe9S8xl3QzA6Su+EaegsHQ4/E08KRWbXYKVTaJ8E5iJFh53B4hQW
	CF3LcTiPx48dQQMslAig0mIdrFYnbFzmVfsodipIPvDD2Jayb1PiBf73QcfcQsdF9XvEYp7tXKDxF
	GoKChMPfAeTQ8uGP4Sr/F1jW/w4kP9DZK27mVZrjUGBfliOZGrZx7vnjWlr1fcEaI0OYCNnviMOWd
	2MMyTmg5zSAuPu+M/vAaPlvjbb8y9ocY3S/Pyqi+d0fkyDvmdLb6QhN1fqU/VDtaSLPiv9nL0FEWh
	ITizCobQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59G4-00000002Uwy-1DdE;
	Thu, 09 May 2024 19:16:48 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59G0-00000002Usu-3aWq
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 19:16:46 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1eb0e08bfd2so8386585ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 12:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715282194; x=1715886994; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WRd0Lx0MMpPCEzZHJ+gP+MBiwgoDsG5pFDJFXbEvS5E=;
        b=OdWj0Vilz7hKtKfmEk5RcD+OAY3N71WJRQuTbyYxezTQ4S0UYDCT6R/4/gwy4h441G
         bsCbfZn/kE1oe4Hx5bf6/NHtvrxgY3yrlEWdWkIiXQnvxmvpyh8x+32ppSQGk0dMfEcf
         Aj8uEmffi0FFvGqCHB5OmvUgqNdJ0ZbLeolDr4gYJJ1v0IhBPotOfszr8QEGAvH2AZR0
         HT8A6r/O9lYtEtyGTVCPezHS9pJasIrdtQ7E3QZMwp+31TJCrtZr2cgIJCtOXvXeHgrj
         os7GaGyo7+H6np0Jhrm9O/GLfhZ+hXNgqO1IgcdfRHJl6bWLvzzQuzwAqSO2XYSCTEnA
         ScUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715282194; x=1715886994;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WRd0Lx0MMpPCEzZHJ+gP+MBiwgoDsG5pFDJFXbEvS5E=;
        b=a2Ztc6UqAOV8K/lYlfGn/V+POjfT4DroRIsXRiRWqFUGLL6AJTKeBIpBerq4M1ibL/
         vX8UA8/arW1ivp3DbVCarnyCZ3jHtnrR4FxXzmzbRST3oz5sDl2PMz/RGnTOkuCbBkPN
         GcM58eZNyvV11fETLfNYSZJTKEGonaQFVygwEe7xU+QWa6hGuE0Ce1y/KkesUK88VYl5
         W57umsYJ0LJVb5A1JAbO95Dm8CLUBGFmWp8FHF+dD77tku+7wgloMRn+eMJ1Z1nctQAF
         2QeOB97wu54JWN3tWGum0+7jMAmFK9Hy8JleBB6d4FXjNVfCRByVMJa2city8IKIa7sU
         xx9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVLgzh/e4xS8gpbg+xlFWvAb8zvMKEjjqyPn5WSYoJnKil/zlydfs+4XY1F7mqJEhdhwa1NjEsBN/ytZruBfGXHDRLmu6neTmWfDxFIrb7Y
X-Gm-Message-State: AOJu0Yy9ZCj7PmmBWqCfk8F6TAqoVzJ1L2HQPv+z/oY3/cxDOSpX9BLy
	4hk4K9I0dF2GCEX+MyadNINgrrHphslhQJ7Z4u8FWOLi1meYk7Oa655aHyPAURM=
X-Google-Smtp-Source: AGHT+IGVLZ1hk7FPNudPJKafIIo2jYjbH8+I3TnNil7Sy8OT8DfcbS5dMB3RJTTTCW5vQbF2H1ruBQ==
X-Received: by 2002:a17:903:191:b0:1dc:de65:623b with SMTP id d9443c01a7336-1ef4404b8cdmr7695675ad.60.1715282194292;
        Thu, 09 May 2024 12:16:34 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c13692asm17812885ad.252.2024.05.09.12.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 12:16:33 -0700 (PDT)
Date: Thu, 9 May 2024 12:16:29 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: paul.walmsley@sifive.com, rick.p.edgecombe@intel.com,
	broonie@kernel.org, Szabolcs.Nagy@arm.com, kito.cheng@sifive.com,
	keescook@chromium.org, ajones@ventanamicro.com,
	conor.dooley@microchip.com, cleger@rivosinc.com,
	atishp@atishpatra.org, alex@ghiti.fr, bjorn@rivosinc.com,
	alexghiti@rivosinc.com, samuel.holland@sifive.com, conor@kernel.org,
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-mm@kvack.org, linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org, corbet@lwn.net, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, oleg@redhat.com,
	akpm@linux-foundation.org, arnd@arndb.de, ebiederm@xmission.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, lstoakes@gmail.com,
	shuah@kernel.org, brauner@kernel.org, andy.chiu@sifive.com,
	jerry.shih@sifive.com, hankuan.chen@sifive.com,
	greentime.hu@sifive.com, evan@rivosinc.com, xiao.w.wang@intel.com,
	apatel@ventanamicro.com, mchitale@ventanamicro.com,
	dbarboza@ventanamicro.com, sameo@rivosinc.com,
	shikemeng@huaweicloud.com, willy@infradead.org,
	vincent.chen@sifive.com, guoren@kernel.org, samitolvanen@google.com,
	songshuaishuai@tinylab.org, gerg@kernel.org, heiko@sntech.de,
	bhe@redhat.com, jeeheng.sia@starfivetech.com, cyy@cyyself.name,
	maskray@google.com, ancientmodern4@gmail.com,
	mathis.salmen@matsal.de, cuiyunhui@bytedance.com,
	bgray@linux.ibm.com, mpe@ellerman.id.au, baruch@tkos.co.il,
	alx@kernel.org, david@redhat.com, catalin.marinas@arm.com,
	revest@chromium.org, josh@joshtriplett.org, shr@devkernel.io,
	deller@gmx.de, omosnace@redhat.com, ojeda@kernel.org,
	jhubbard@nvidia.com
Subject: Re: [PATCH v3 29/29] kselftest/riscv: kselftest for user mode cfi
Message-ID: <Zj0hDT1EZmOaEkCj@debug.ba.rivosinc.com>
References: <20240403234054.2020347-1-debug@rivosinc.com>
 <20240403234054.2020347-30-debug@rivosinc.com>
 <Zj0UGweLoRD1U9Po@ghost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Zj0UGweLoRD1U9Po@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_121645_036778_B5E182B4 
X-CRM114-Status: GOOD (  17.99  )
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

On Thu, May 09, 2024 at 11:21:15AM -0700, Charlie Jenkins wrote:
>On Wed, Apr 03, 2024 at 04:35:17PM -0700, Deepak Gupta wrote:
>> +
>> +int main(int argc, char *argv[])
>> +{
>> +	int ret = 0;
>> +	unsigned long lpad_status = 0, ss_status = 0;
>> +
>> +	ksft_print_header();
>> +
>> +	ksft_set_plan(RISCV_CFI_SELFTEST_COUNT);
>> +
>> +	ksft_print_msg("starting risc-v tests\n");
>> +
>> +	/*
>> +	 * Landing pad test. Not a lot of kernel changes to support landing
>> +	 * pad for user mode except lighting up a bit in senvcfg via a prctl
>> +	 * Enable landing pad through out the execution of test binary
>> +	 */
>> +	ret = my_syscall5(__NR_prctl, PR_GET_INDIR_BR_LP_STATUS, &lpad_status, 0, 0, 0);
>
>There is an assumption here that the libc supports setting
>INDIR_BR_LP_STATUS but does not support the standard prctl interface
>defined in <sys/prctl.h>. my_syscall5() is defined to fill in gaps in
>the libc, so this test case should also set the status manually rather
>than relying on the libc.
>
>I don't think it's necessary to define my_syscall5() since every libc
>should have a prctl() definition. However, these CFI prctls are very new
>and glibc does not yet support (correct me if I am wrong) it so these
>prctls should be enabled by the test cases.

In one of my previous patches, it was setting landing pad and shadow stack enabling
directly via handcrafted prctl macro. I changed it to check for status for following reasons

- If this binary is compiled with landing pad and shadow stack option then toolchain being used
   already has libc with shadow stack and landing pad enabling

- Currently upstream glibc toolchain dont have support but libc with toolchain has the support.

In case of shadow stack enabling, macro is needed and `prctl` function can't be used.
Because you enter `prctl` function with no shadow stack but exit with shadow stack and will lead to
fault in its epilog.

Due to all these reasons, kselftests have to be compiled with toolchain with cfi codegen and thus libc
should have support to light them up. Here tests only checks if they are already lit up, If not it fails.

Although you're spot on one thing here, since this test is assuming libc already lit-up landing pad and
shadow stack. It doesn't need macro here for status check of feature and can simply use `prctl` syscall
interface.

>
>- Charlie
>
>> +	if (ret)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
