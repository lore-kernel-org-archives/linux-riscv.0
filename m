Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE7ACAC5A7
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Sep 2025 15:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ayOtzTG4G5DXScSmYslTir5ppJQZS1JEnvYnAATpVO8=; b=FFx+4UphP3EVKX
	9scKlHeS8Ruvw78SdDyVUN0vCdOKDLuEL6jIv3AE5C49iHI53HaXpBTG8yysgtOVMPiFgE9Hapxhy
	sosw3//A10c4gyle8HXXUt5LrebmnFP8O1rjTpjkmEXgfrJjAexeAVZsXgr6lGLPr5fEOKe/AYne4
	1e/gHgsQ/sgy6joAjjhlmh9ZD+eJBiwLS2NfsvMl2rz0CXv97YBrO+K9WhZB3UpgznhdsvnfuWqPc
	khOrJsor1IdtRVPTaUpp5D4xvuJUu2rhJeXOxGzRuU/p+FQdms+hveO+2CEI/8AXNrkMTtgjrCGM+
	NcAKqbEfEP0TXeX2Wb7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v155E-0000000E5ed-3b2w;
	Tue, 23 Sep 2025 15:37:36 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v155B-0000000E5d1-0va0
	for linux-riscv@lists.infradead.org;
	Tue, 23 Sep 2025 15:37:34 +0000
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-eb3671a7db4so12953276.0
        for <linux-riscv@lists.infradead.org>; Tue, 23 Sep 2025 08:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1758641852; x=1759246652; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wa5b2Ox9cKpFtfieebnhk7CueJ3gddY86USQDYphg/s=;
        b=gf1yP1IOmhsAbIKXCe0YZ1rMtVDaR7FJWToJtK4ZdSXjBqx3On2HlZCP1TTYEVOUdv
         8dwP6weTqwW1xy8xW6/ZbL/5RWnpLa6bLpVpXQZjwzAv1Q/fAWo4G8fWUtW/MnpsW8i8
         4ATCOs7F2YqsM72mGleAayPeCbUex+xvvgyI+CmLUHIeho4MibndcWpdrEvkLevXVrF/
         GwjEH2YjArLRq77N4tdh8oMGFUAOzOPQh1b+z8uSmfy2OUj6LzekuTf0H+NptTAuqkMl
         HU06W3Nn3DEtbWKh0ZF53R5tct3UZqF4gllGCW2qO+HZgqVjN6QNibHBLo1yw++M5oJz
         DYHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758641852; x=1759246652;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wa5b2Ox9cKpFtfieebnhk7CueJ3gddY86USQDYphg/s=;
        b=j/ZceFqslyITlHh6AbqB4chqMTo9Kb13DV4QdQgG1NwwqEJjoJQyV8u3Ebr+9rWfa1
         iKo2smmi1HmpHrClHy6QsPhrldxWTM1GrtAQ0iVrRQ3v8d7YQgYYgSFibuge8ZOkRhJJ
         u8cnzjoSotcFaTcuEcVnTBi3sSbOba/yS27VMGnl5GbQBdzTU6rw2wQTmmPASw/dnxsW
         XmGr9S2ZWr7rwWkukBJgYbHnpm1yTG433kQe7dMf6q437vC5tgCF0JZCu2rCEsgCGU1i
         gXonqCIjukWiaAwOmrsRCdLCEOyP26hE0iN9aaFnb2k7b4UANmTlh3PWxejjR0P3xebu
         FVhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYpc5P/dW1mjUfyxhpePiGA4a2lVQkhO1ZLwqUshlBa1zL2SA5gkkAi2pn0Qi3Oymvo/Cyo7j7O0MIWw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyjGoh2/sWmKs76vCDIqNgtsRDjfM02YY9FDWkKFKIUYIYgtAD7
	zICqufVSJZCr57/vnk3yZju2DzhR4xRH/C2k9HsJCicWqxLjPPkJEka32vV8ZKKaC1M=
X-Gm-Gg: ASbGncs1ryAtAsNzH/xnkrTTVGuSTRxy0qg8by0CNVPIt2aoNl0tParMYqGaQNS1xb6
	P/l/zNl5qKIOef74cPOoExuaumqXke1GJv1jP8zDCrLHroMdCDhQm8LwSpETuHBtQ6Mj8tpGD8B
	SRXqB36+SZ/aW5hCKegGvuh9TA8GAmwgG8zAk5wZCPxln9tf7xLJsyjdt57rE3WwR+w0o/QK/ph
	8lx9fQzbuxBhaS1okWZRs9JWaYw2Akhru9CJuR8HAaZsACKmMQ9GXtYpn4ZEunfqWfG8PdQh4sv
	GzmSFMjEYQJ1NzDyngy/o/DDyh6gBbvbKDWuHYJ3mM4u5TytP7TlRPsDQVNN9qS1TahgmqNxUW4
	NROjEwdJBI+uwtPv/akF/irAV
X-Google-Smtp-Source: AGHT+IEg1iVUs6leKP9cHj2cx58SzsL13TI+csDZL0P1k6w1OJijHfrbcJXnEnD/4J+xBKVTIxDONg==
X-Received: by 2002:a05:6902:1381:b0:eb3:6e74:dd0c with SMTP id 3f1490d57ef6-eb36e74defcmr792195276.24.1758641851831;
        Tue, 23 Sep 2025 08:37:31 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-ea5ce854f57sm5087789276.22.2025.09.23.08.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 08:37:31 -0700 (PDT)
Date: Tue, 23 Sep 2025 10:37:30 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, iommu@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, zong.li@sifive.com, tjeznach@rivosinc.com, joro@8bytes.org, 
	will@kernel.org, robin.murphy@arm.com, anup@brainfault.org, atish.patra@linux.dev, 
	alex.williamson@redhat.com, paul.walmsley@sifive.com, palmer@dabbelt.com, alex@ghiti.fr
Subject: Re: [RFC PATCH v2 08/18] iommu/riscv: Use MSI table to enable IMSIC
 access
Message-ID: <20250923-54e8e0f39d672845e2979286@orel>
References: <20250920203851.2205115-20-ajones@ventanamicro.com>
 <20250920203851.2205115-28-ajones@ventanamicro.com>
 <20250922184336.GD1391379@nvidia.com>
 <20250922-50372a07397db3155fec49c9@orel>
 <20250922235651.GG1391379@nvidia.com>
 <87ecrx4guz.ffs@tglx>
 <20250923-de370be816db3ec12b3ae5d4@orel>
 <20250923145251.GP1391379@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250923145251.GP1391379@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_083733_265748_18DC18CB 
X-CRM114-Status: GOOD (  28.22  )
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

On Tue, Sep 23, 2025 at 11:52:51AM -0300, Jason Gunthorpe wrote:
> On Tue, Sep 23, 2025 at 09:37:31AM -0500, Andrew Jones wrote:
> > undergoes a specified translation into an index of the MSI table. For the
> > non-virt use case we skip the "composes a new address/data pair, which
> > points at the remap table entry" step since we just forward the original
> > with an identity mapping. For the virt case we do write a new addr,data
> > pair (Patch15) since we need to map guest addresses to host addresses (but
> > data is still just forwarded since the RISC-V IOMMU doesn't support data
> > remapping). 
> 
> You should banish thinking of non-virt/virt from your lexicon. Linux
> doesn't work that way, and trying to force it too is a loosing battle.

Well, we need to consider virt when the hardware has virt-specific
features that we want to control. We also need to consider virt when
additional address translations to go from guest space to host space
are needed, as in this case.

> 
> If you have a remap domain then it should always be remapping. There
> is no such idea in Linux as a conditional IRQ domain dependent on
> external factors (like how the IOMMU is configured, if the device is
> "virt" or not, etc).

The remap domain is created when the platform supports MSIs and always
does remapping when the IOMMU supports the MSI table. It could even do
remapping when the IOMMU doesn't support the MSI table since it could
use the DMA table instead, but that's left for a later patch series if
hardware actually shows up like that.

The difference between virt and non-virt is what addresses get remapped
for the remapping. For virt, guest addresses get remapped, for non-virt,
we don't remap guest addresses. And, since we don't remap guest addresses
for non-virt, then, rather than invent some new, arbitrary address, we
just use the host address. Remapping is still in use, but, as I said
above, it's an identity mapping.

(Note, for the current riscv iommu, "remapping" for the non-virt case just
means keeping the set of IMSICs that a device may reach limited to just
what it should be allowed to reach.)

> 
> Be specific what you mean.

I'm always happy to clarify when asked. I'm not sure what I said that
would lead to thinking remapping was disabled for the non-virt case,
but hopefully what I wrote now clarifies that it is not.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
