Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D03C04AA9
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 15:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VIRierVu/QP3yk+L1HBWeUw7j/NczWvvl649mi4qD2s=; b=qa817UwfbChYG/
	HE7vGiqg+3aL5fNFV+qPoawYcNcRAzdra+45EECzoq4VJvJyYEh4k9OsZ96rwmY6YYPVc7xZjZWZq
	nQb3m5rMNmwsNtXBEmZGQXfQ84v1J5xZwkHzJQo0pbpMqPATQR4cdH0m2tHgOeeQ+xxWvtzied4pp
	IIgs14wKS6Tgx5bq7AnHnADjsRy5+8yog8dwMtaqu7hRbeX1O+Eb9qE8AlSd7uOCRCghH/TJ8NbzK
	jcimeyMBdr/I//WcH46cCtr8Bm7Zxyk3nxmHfhd8vD8xHGiHP+Jpwl9NWNL4aMVNDNqn1uDGEtC+A
	puvnmWUovF9Vg/pIoFNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qizbf-003ZbQ-0L;
	Wed, 20 Sep 2023 15:59:15 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qizbb-003ZaM-2P
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 15:59:13 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-9ada609bb62so906280666b.2
        for <linux-riscv@lists.infradead.org>; Wed, 20 Sep 2023 08:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695225549; x=1695830349; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rTOJJcBmIOT1+zi0OT/D2Ib8E/xBZc3n9UZuUTQAznk=;
        b=ovuzBG9bNm5PZIu0ewBc1CzCNbJ5wvjSA/fI3aSYAN95GQtSfxATKGo+zQiAWFpbb0
         OzgKK5ru7xgg6H1bsek4UQaGN87IjoQ1z4uC1s08bbXVTWJ/4iiEYjUp4KHLHVCuUXU3
         vfabdVnZTaf7mjoziPNzOp/n0ohhfpThydOQY2JzBsuJb5o1wU6QZejv9toRSb7QCbLu
         gJKiw6iU22F6BjmNzygWUAi41w0KpVK+7s4yIj+vRxhD6pIZikkiQzfBC/QVio3wOk1p
         crXcNFOq3LayBTPcX8HCzqEAcaRqg9KlwWRCRBVI7sNmKJqNstvqrwXoVICv4VsCGAeq
         bMEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695225549; x=1695830349;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rTOJJcBmIOT1+zi0OT/D2Ib8E/xBZc3n9UZuUTQAznk=;
        b=rlI0CXAF65vg3cTO86HgjC7+PHjn+61GgiG5dfld5RidFojl3I2rnrLKryqpPytwW8
         Leu4WyD2Ai4nfjFOy6vcXTlM6aR3nJ5XQGnzDj0p8OgdDzbZhydZ6Uzl0qOT/p1icKGo
         JIvfAc1ohjJwPsO4ccpGUTEiMUlSAyd+gtuTj1OoO3d9XQdBrTrw8aWdJ6FiAP/G0uAD
         JFmM92bNyF6XG7FxtiERFN2n76ryY64Daz0+85QDkyAtARrQUeL+jmqcSpFzy/SYauIz
         zlYqSfkfesKAez3dxBp9xyOByM18EFYG6AAZa7y+EytUHEvqzrm7zTZG57nlNGuOs1p5
         mlHQ==
X-Gm-Message-State: AOJu0YzgmmfCQBUkkZYRS/r9g10WDGEVFGwzit1UJRDmsfQajnimq3os
	kme0Fn4ACDafUVpQrK32SDjM/w==
X-Google-Smtp-Source: AGHT+IHW9j1u4BZK6Q94x+QFx47AjJOr1ij3Eo4Zz9gh+6BWeijfKQS2YiZAaLykAhzJF3l96vQ3Sg==
X-Received: by 2002:a17:907:2cd9:b0:9ae:4d6d:ba5b with SMTP id hg25-20020a1709072cd900b009ae4d6dba5bmr1730696ejc.40.1695225548942;
        Wed, 20 Sep 2023 08:59:08 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id v14-20020a17090606ce00b00993cc1242d4sm9573744ejb.151.2023.09.20.08.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 08:59:08 -0700 (PDT)
Date: Wed, 20 Sep 2023 17:59:07 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v2 4/4] KVM: riscv: selftests: Selectively filter-out AIA
 registers
Message-ID: <20230920-e3fc5272a2818c67a17cd90c@orel>
References: <20230920154608.1447057-1-apatel@ventanamicro.com>
 <20230920154608.1447057-5-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230920154608.1447057-5-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_085911_806925_25B6C9B3 
X-CRM114-Status: GOOD (  11.75  )
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

On Wed, Sep 20, 2023 at 09:16:08PM +0530, Anup Patel wrote:
> Currently the AIA ONE_REG registers are reported by get-reg-list
> as new registers for various vcpu_reg_list configs whenever Ssaia
> is available on the host because Ssaia extension can only be
> disabled by Smstateen extension which is not always available.
> 
> To tackle this, we should filter-out AIA ONE_REG registers only
> when Ssaia can't be disabled for a VCPU.
> 
> Fixes: 477069398ed6 ("KVM: riscv: selftests: Add get-reg-list test")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>

I guess you missed my reply to myself where I corrected my analysis and
gave an r-b. Anyway, here it is again, and thanks for fixing up the nits.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
