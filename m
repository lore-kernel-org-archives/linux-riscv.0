Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F8B6CD1296
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 07:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7QQR03EaTCBHz7CZTXqVyXmrYEePrEGCEGThpklEnt8=; b=cLR4aIyOOEu9t7
	Ed+PL9AywkOangkIZbLtI9N+0PYtyzwJDqZXfOEa4TqPyO8QxcAo/JcZ8CJKQxz6tBint87EbLBZZ
	LYvJEzs1YXRGX7kujh9bi+wRMFmEzjRmtb51dQopeomy8c5ZGn8os0lIvu7jJFLqWGH6CUWMiP3WZ
	hqC7LDvBlw4hJy3mE8ADbpUK0phd3miQMwRo2R0rJKD2Ey8BMt3H0gz534WOycFxFrxpq2IC/Z+Xx
	rON3FyXd9e6eueptJ/2Pwms3+tOmjajz2dvJgBVn7lhbvdtutugWyuubFJ6e8tzphiDrcH1Z4mGHe
	ZxynSmsLX4scTzDvktqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruSnB-00000005itU-0Bwp;
	Wed, 10 Apr 2024 07:54:49 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruSn7-00000005irg-3Ui7
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 07:54:47 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-56e47843cc7so3756606a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 10 Apr 2024 00:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1712735682; x=1713340482; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xT4TfO1sl44M/nt04uaJynnbnIHdAjwI3dACDF2EjZU=;
        b=jHfFvBPVgpNQbLQSi1sixJua0gCbnxlamrnetKYdnCjT41lcKz9bfnwfSka8qwI1tk
         tl5f420NJwdbHcLgCA1Iaw5P3ND1I38OuVkLR9mCHLIs3cEvMCZ5gES6UIhzPb966uQz
         FBJfCuGfaw0LZRFCH55YOL90SJI/xhwVS4WRa3GPi436juS83586fvUh78V2trnUdDSQ
         eCg5ZGl3Pej//dWKIwg9kWJNHk0AOKelmH/0Qq9+shTDFB3BxEs8YIxlvSZu+18R6MY5
         NA0Nm2VvXg/KGnWlCggeA7MkTWQV2cC7zcYbC2c8XVm42zbpPveuhZRFl2o04dWs772N
         7aDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712735682; x=1713340482;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xT4TfO1sl44M/nt04uaJynnbnIHdAjwI3dACDF2EjZU=;
        b=M9q11ryo2Qi9UGQYcBhO2rPetNzLSS2CdH2PtMbZgZqerxj9Nl4DRwGTuekA8GojFT
         EWfjauQOciA6IjjGigpbXkFldwqKkE0rv7Ft8POKhoEAlMajP12kgtRyE21vjXBTTfoN
         /JuET4JQAYDnorTS1tftdVwW2iIUBQkfDfKDGm2Y/GEHEwySOHcvXIS6uVL4VOitViFf
         Ss5uzkev7UBJy/zyHpZHORBuysCkIpjHbaaDlO/gXA4O+vTjQI9ri7IdaOeNcu9iMIAK
         ere46AIJ/2GNc3YHmrAbL0W1lDcEDnSmSzrWKZnnP6l0lUveiylq/IkKO1TSL6jeMXTu
         sB0A==
X-Forwarded-Encrypted: i=1; AJvYcCWw8sBUQ9v4jwA+o34ILTZ0cbxO/lPk/jDwcyGBmnBetdCj21p3JZ1pMWQ7PpJFyYJpdwgDVbO+USdt5o1eN7kfYIJ2RJ0flP5G7lXQTWpo
X-Gm-Message-State: AOJu0YyFWoVh/qJSbn9ZmcJXEnDvviYoGvGMgdwYV5OFJeoKR6SPYwkD
	Nd6ViBrmm5BDTcVuJtg+5BrBQg0KqdfOSpRmQ03YKjHhFY3QOkaKaHxbRM1I170=
X-Google-Smtp-Source: AGHT+IHRLBNWYp5osm4g2tE72KL50pB81DvbKh3OKFJcV5WdtGMoowG4LIJqFVgVawpLvyMudGgyRg==
X-Received: by 2002:a50:8e54:0:b0:56e:3293:3772 with SMTP id 20-20020a508e54000000b0056e32933772mr1082442edx.29.1712735682410;
        Wed, 10 Apr 2024 00:54:42 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id x1-20020a056402414100b0056e307db93dsm6132199eda.86.2024.04.10.00.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 00:54:41 -0700 (PDT)
Date: Wed, 10 Apr 2024 09:54:41 +0200
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
Message-ID: <20240410-f46f91518afc0e151f375a62@orel>
References: <20240403080452.1007601-1-atishp@rivosinc.com>
 <20240403080452.1007601-22-atishp@rivosinc.com>
 <20240405-4e840120e8117c286cb593f9@orel>
 <8748dbed-d105-4f26-a808-667c3b56c8ec@rivosinc.com>
 <20240410-2a41e43624596a442d6a95cd@orel>
 <4a428500-4e37-4e7d-968d-3da20dd822af@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4a428500-4e37-4e7d-968d-3da20dd822af@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_005445_882510_AAB725DF 
X-CRM114-Status: GOOD (  40.01  )
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

On Wed, Apr 10, 2024 at 12:28:08AM -0700, Atish Patra wrote:
> 
> On 4/10/24 00:10, Andrew Jones wrote:
> > On Tue, Apr 09, 2024 at 03:52:40PM -0700, Atish Patra wrote:
> > > On 4/5/24 06:11, Andrew Jones wrote:
> > > > On Wed, Apr 03, 2024 at 01:04:50AM -0700, Atish Patra wrote:
> > ...
> > > > > +	probe = guest_sbi_probe_extension(SBI_EXT_PMU, &out_val);
> > > > > +	GUEST_ASSERT(probe && out_val == 1);
> > > > > +
> > > > > +	if (get_host_sbi_spec_version() < sbi_mk_version(2, 0))
> > > > > +		__GUEST_ASSERT(0, "SBI implementation version doesn't support PMU Snapshot");
> > > > > +}
> > > > It's a pity we can't check the SBI spec version that KVM is advertising
> > > > from KVM userspace. Normally we'd want to check something like this at
> > > > the start of the test with TEST_REQUIRE() before running a VCPU in order
> > > > to generate a skip exit.
> > > > 
> > > Agreed. I will send a separate series for that as it is an ABI change.
> > > 
> > > > (We probably should allow reading and even writing the SBI spec version
> > > > from the VMM in order to better support migration.)
> > > > 
> > > How that would work for SBI spec version write use case ? For migraiton, you
> > > can't go back to older SBI versions in the host. Isn't it ?
> > > 
> > > Considering this case your VM is running with PMU snapshot as the host has
> > > SBI v2.0. It can't be migrated to v1.0 and expecting it work. Correct ?
> > > 
> > We can start a VM on a host with SBI v2.0, but tell KVM to tell the VM
> > that it has v1.0. Then, the guest shouldn't use any features from SBI
> > that appear after v1.0 and it should be safe to migrate to a host with
> > v1.0.
> 
> That depends on when the VMM request to KVM to change the version.
> Most of SBI implementation checks the SBI version at the boot and
> enable/disable
> feature based on the SBI version available. If the SBI version supported by
> KVM changes
> to an older one, the calls from VM will fail unexpectedly.

We have to configure KVM's SBI version before the first run of VCPUs,
just like we should make sure ISA/SBI extensions are configured first.

> 
> > A more likely scenario might be this though:
> > 
> >   1. KVM userspace checks and captures the SBI version of the host where
> >      the VM is first being launched, e.g. v2.0
> >   2. The VM gets migrated to another host which supports something later,
> >      e.g. v3.0, but to
> >      - avoid possibly confusing the guest we tell the destination host
> >        that it should expose v2.0 as the SBI version
> >      - allow rollback to the source host without concern that the guest
> >        has already seen v3.0 and started to use something that the
> >        source can't provide
> 
> This makes sense though. As per my understanding, we should not allow
> modifying
> the SBI version that is less that the version VM already boot with.
> However, we can allow modifying the SBI version that is higher or same as
> the VM booted with.

Mostly only 'the same as'. Higher might work, but it's also risky since
there could be guests out there which capture the version on boot and
then for whatever reason do sanity checks against that later on and
freak out when there's a change, even if the change went higher.

> 
> I can't think of a use case for the higher version though.

Maybe only for a coordinated update which uses kexec rather than
a full shutdown+boot cycle, but I'm reaching...

Regarding a full shutdown+boot cycle, in those cases, we're usually
free to make changes as that's the same as a host kernel being shutdown
and then being boot again after a firmware update.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
