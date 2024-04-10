Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F539CD1297
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 07:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fMHoyY3mQS9PASJ7Rrl/nPE22XVYY+q7BrWrclphzZY=; b=vJWPL0IGluPQNn
	APqf/B5DJB/jZdg5Mh0eGpwlZW2bZ2LntDdsNBBR5gFtQjbqwNF3msdhIl3QwwAkqT1VrBsI2wh1N
	Msg2ZtDFWifqDB5klfaq3+axbZJTG2yAZNX9Ay8g08UTzDE5+f+XJ5ZbgFQBmeaCo41lwVrfwUW7X
	vf5O5BGhchiIkU3V6Kh8//YtCB5zuh4OXRsDvQirsrHWnZ0B8fjzf5escLhEppGjYE9zrDpEhJ+Ra
	CyztZ9OU3WKeUWwtWZLwgMHWT8Z8BEFUhVaMooeM2Z3IIBpPLRImd4H/fK4FDPCSEkhPxKk3ki5rN
	UT14Qy0a+ujEQRXsjeNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruS6L-00000005XSY-0ZE1;
	Wed, 10 Apr 2024 07:10:33 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruS6H-00000005XJn-3M2H
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 07:10:31 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-565c6cf4819so12522516a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 10 Apr 2024 00:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1712733016; x=1713337816; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SZ18eCyb0XZAICmBnfaeK08LTmFa9T66gJC4R8KSh1g=;
        b=PbjCqefL3gi0akuav/dLoUqZFcgCoUfTDaev/wumWO+2KEBIXBcm7x+ds399lnz+HM
         VJNwhG8leMSODB6b7THV7TScBTxP8BEVL7uDV75jFpCJoqzxTtTfYJFVWIO676XkRkIY
         ylYKrB6zGoytKLb6SuACTaHhk1RkZ+OOh4Jxe1/0bUYjZ50fSq7+kdsE9WEzicGiBafM
         dIJDx4K/y/xWZO81VMDIolRnjbo6xKJhi5uTPYbN8RNMZtPDAfHFsiA72ZkTnj54wAgT
         nlWIuC7jSdaMBRMtNFygkGLTj1r2U9ySm+vZuRIDl2neuv2Xs+jU1M1kOWQf7u3bs7d6
         v0qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712733016; x=1713337816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SZ18eCyb0XZAICmBnfaeK08LTmFa9T66gJC4R8KSh1g=;
        b=FQK81wU76axl3MvsBn6PS4ybEfcKovjHtT7C0RVLhY6uDsbmdV/HVzRK8n2HJ1SUXG
         GVs04AEEMOVyIShS06yAo7t/D1a+E1TviVNZjaCtEqRdZN79/YwRvIzi4v3YVLNH9dt3
         C/RKXYNfH2QD7d5/gHkQGyz4KnbjtJFj3WynkUE3REjPzMU1akqTqdIZOBuFQxj2mPjU
         Sx06MGUv4YBFEGOXASuJQctRtGll4IHqZLYYTLvTUcUDFnuOmVZV4EUj9vZCf5YnmV6/
         XKfbb3EZefcB68wBvHaQ8YnUTMP/dM4MmUKYJbY2sZDBa9R6s303M2e9JeBrwXYnJy/C
         Q3fg==
X-Forwarded-Encrypted: i=1; AJvYcCVUKZnSURBd067Z5tZJ+cOuCxekR4xphwrbsVKBChkVXyxg6WphHkMx1AAXFSoKbsVP8P/yEOOY/BKjmJ3BKO5m0FCW7RvutRa8Ohn+/Z7C
X-Gm-Message-State: AOJu0YzPGUeCMMze5A0qCByYaj6LsrXhNshlYssVJ6CBKpe8VaMpsobn
	YONbP6TekDoztq1y1D5vtj/uguEipFuVZ5CW93ywKZJH2RJrsjmw6+fY8uFLtwE=
X-Google-Smtp-Source: AGHT+IFxljZJ08Uz0yhQgpMjKNeXFWA7BWx83bzmmJAW4p2u+kQE1tRwcsho9/acuSekX0UatVujKg==
X-Received: by 2002:a17:906:2844:b0:a52:a25:2077 with SMTP id s4-20020a170906284400b00a520a252077mr982535ejc.14.1712733015975;
        Wed, 10 Apr 2024 00:10:15 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id l15-20020a170906414f00b00a519de61bebsm6612955ejk.137.2024.04.10.00.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 00:10:15 -0700 (PDT)
Date: Wed, 10 Apr 2024 09:10:14 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>, 
	Ajay Kaher <akaher@vmware.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Alexey Makhalov <amakhalov@vmware.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Juergen Gross <jgross@suse.com>, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Shuah Khan <shuah@kernel.org>, virtualization@lists.linux.dev, 
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>, Will Deacon <will@kernel.org>, x86@kernel.org
Subject: Re: [PATCH v5 21/22] KVM: riscv: selftests: Add a test for PMU
 snapshot functionality
Message-ID: <20240410-2a41e43624596a442d6a95cd@orel>
References: <20240403080452.1007601-1-atishp@rivosinc.com>
 <20240403080452.1007601-22-atishp@rivosinc.com>
 <20240405-4e840120e8117c286cb593f9@orel>
 <8748dbed-d105-4f26-a808-667c3b56c8ec@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8748dbed-d105-4f26-a808-667c3b56c8ec@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_001029_855469_666D83F1 
X-CRM114-Status: GOOD (  24.54  )
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

On Tue, Apr 09, 2024 at 03:52:40PM -0700, Atish Patra wrote:
> On 4/5/24 06:11, Andrew Jones wrote:
> > On Wed, Apr 03, 2024 at 01:04:50AM -0700, Atish Patra wrote:
...
> > > +	probe = guest_sbi_probe_extension(SBI_EXT_PMU, &out_val);
> > > +	GUEST_ASSERT(probe && out_val == 1);
> > > +
> > > +	if (get_host_sbi_spec_version() < sbi_mk_version(2, 0))
> > > +		__GUEST_ASSERT(0, "SBI implementation version doesn't support PMU Snapshot");
> > > +}
> > 
> > It's a pity we can't check the SBI spec version that KVM is advertising
> > from KVM userspace. Normally we'd want to check something like this at
> > the start of the test with TEST_REQUIRE() before running a VCPU in order
> > to generate a skip exit.
> > 
> 
> Agreed. I will send a separate series for that as it is an ABI change.
> 
> > (We probably should allow reading and even writing the SBI spec version
> > from the VMM in order to better support migration.)
> > 
> 
> How that would work for SBI spec version write use case ? For migraiton, you
> can't go back to older SBI versions in the host. Isn't it ?
> 
> Considering this case your VM is running with PMU snapshot as the host has
> SBI v2.0. It can't be migrated to v1.0 and expecting it work. Correct ?
>

We can start a VM on a host with SBI v2.0, but tell KVM to tell the VM
that it has v1.0. Then, the guest shouldn't use any features from SBI
that appear after v1.0 and it should be safe to migrate to a host with
v1.0.

A more likely scenario might be this though:

 1. KVM userspace checks and captures the SBI version of the host where
    the VM is first being launched, e.g. v2.0
 2. The VM gets migrated to another host which supports something later,
    e.g. v3.0, but to
    - avoid possibly confusing the guest we tell the destination host
      that it should expose v2.0 as the SBI version
    - allow rollback to the source host without concern that the guest
      has already seen v3.0 and started to use something that the
      source can't provide

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
