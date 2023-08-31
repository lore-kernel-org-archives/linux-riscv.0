Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2318EC83F2F
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 22:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MqMHx4HMpyV3HPZ+Bf3fWvc3ORWXmtHK4D/ey4EoYJI=; b=Om6fkNtR0DaJfg
	BRsoL1HdARbJOt/aPIenxEBRrYIUjWUaJ3q2aL8gWAHt6d++poauB3MhuXKTiIZPh9YdcgtlvJT2W
	dMQ6axVGS/QmPQOFuHGSMiLtgja/swwPOzQeVXydDUX1UclvDSQh8lUID7wTVcV8GalFS9zQQ5cbp
	vAztJIGq+7fTgaOhdc0lke4cZdEjh7UMOLIx0DF7Nf3ucGtGRtznBFZ/XUOYO5mIgoiXDsWE1f405
	MTh7aGFBft1qOrvk6WJzlhqoIo2gKrCtZz7c2YqNSah3pHJfr92Bs3ac9QmNtEnf5a6j3DpGIJyPc
	4tpPDt53LG6WEhCGxyRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbpks-00FsGe-0C;
	Thu, 31 Aug 2023 22:03:10 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbpki-00FsD7-1k
	for linux-riscv@lists.infradead.org;
	Thu, 31 Aug 2023 22:03:03 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1bd9b4f8e0eso9526005ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 31 Aug 2023 15:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1693519366; x=1694124166; darn=lists.infradead.org;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LZ1LrSazDYZnUcIRdca47yPJ+xiUW4g/psT72UeSX0U=;
        b=fhJGbvV0JAnV0YGU69EHaiK3BCMBe8xc6/TjEpDB7NdJcbWO91gj32eVvtb/RD6PHC
         u7Cz3uwVFueYKdFBrN/t5TSgCtBY2yd4H4yy0TlntVyTbMXnEtZatMZlh70J2Wo2oqlr
         d3upev1mtE9DXJwYwxnm368rbevrL9+cKTyZ1U+eti9WJzJC6ohCqeb7/9Wzxm8Km+Po
         iIL9j9YsNSHTu2pMiRFrIxuOu9EWpum4Zf5i6XFUDjyRooKO6mZ4FdiIAlxU6QYnMyla
         nMxLoEMcIvssILg78U13wSHQKiLsw3ft6eEO9eKUa2fJc48zeVY5Pyr/Fbp1bGdUFoxK
         KPEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693519366; x=1694124166;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LZ1LrSazDYZnUcIRdca47yPJ+xiUW4g/psT72UeSX0U=;
        b=SJVmUuiaGPWxPzukmnuMsz51kUm/OXqCV18LMdbwVaKN2Pdra6ZUXFZGAj9Td8SwHG
         /hvY5RblZ8h9DlNnjJ2EtSbzvdSMIxHGtkRYkQxo6PaLbweqfx0jGf7GKcPXw7hVM2d7
         u2p9dUZcCQS2PGImZbVo0ElUqmp/dLnqE5eiJcIlwhgskvfx0r7R+DL8XwI0xrl6QV0f
         r2KS7wZSZWw4MuLKiFLrrvce5ZwxmsEXvCd2vCOVKtUc3RSX1CNBp8fJMRW/ZL5Y9TzI
         lmr+mhUPhmH5k01L4FN+GwEM5w31qSDG0G9smym/uF6IxDbodf58a6KUdt5+ovWRYwIQ
         V93A==
X-Gm-Message-State: AOJu0YwceTQEguIkfuPCE0xAL1DlIoVOdFGnPw1k9z4tkD7ycsyIAwmW
	n01lD5Q1QIekdXip3z0bZRCR4swY2aM7KGxxjZ8=
X-Google-Smtp-Source: AGHT+IF5UJTL3feZeT+yCPAOUjqmOQg1cXAlS5YfgTmJdJf2JVPgJ2AGdwEgJse/apwMaUib4RsZsQ==
X-Received: by 2002:a17:902:d2cb:b0:1c2:193e:1106 with SMTP id n11-20020a170902d2cb00b001c2193e1106mr1119854plc.50.1693519366519;
        Thu, 31 Aug 2023 15:02:46 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id z7-20020a1709027e8700b001b03a1a3151sm1709722pla.70.2023.08.31.15.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Aug 2023 15:02:46 -0700 (PDT)
In-Reply-To: <20230830203754.24940-1-palmer@rivosinc.com>
References: <20230830203754.24940-1-palmer@rivosinc.com>
Subject: Re: [PATCH] RISC-V: Remove unused "size" in ptrace
Message-Id: <169351910648.23657.13688127900416740511.b4-ty@rivosinc.com>
Date: Thu, 31 Aug 2023 14:58:26 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
Cc: linux-riscv@lists.infradead.org, kernel test robot <lkp@intel.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: andy.chiu@sifive.com, Palmer Dabbelt <palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230831_150300_605357_5B0A594D 
X-CRM114-Status: UNSURE (   6.27  )
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


On Wed, 30 Aug 2023 13:37:54 -0700, Palmer Dabbelt wrote:
> Looks like this just got lost somewhere in the respins.
> 
> 

Applied, thanks!

[1/1] RISC-V: Remove unused "size" in ptrace
      https://git.kernel.org/palmer/c/899230bac3b2

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
