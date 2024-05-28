Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E38DC25B78
	for <linux-riscv@archiver.kernel.org>; Tue, 28 May 2024 22:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=+LQaJJscgBeRbrYPnV0N9J8UIBQo2G27HO75suIpwL0=; b=xoFO7QNoY+ICWf9xSZoJGgPZxv
	Qe89VpCZJlJu/VBbKusPgQVZ1V6BYmZZBKGw12avpZSy3rlzvg2T6GG7tnIab6HEmr0EoLIa0qpal
	QuF1dDoZshjbo8PhTIfb23dcSWw9MfWgh+m/MPDD8rg1MQj2So9IWBfoRZS0owpPME+brW4rO/7cx
	xQRAbldEJKqQJ9IA0zajJalUY+KUp88KICH2sfT0poM5qW+LDTT4Ytmd0frX3LGfcoswF+9VqOUKl
	BkYrwASzr9CUyg4VUilTO4bDgTum/4M3TasecVKpa/FVfrv5f6uVrAosy5NYv+IluSNx5anrt/6bb
	3powOfHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC5bv-00000002Epc-0cLo;
	Tue, 28 May 2024 22:48:03 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC5bs-00000002Ep3-0fZA
	for linux-riscv@lists.infradead.org;
	Tue, 28 May 2024 22:48:01 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1f4a5344ec7so2401615ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 28 May 2024 15:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1716936476; x=1717541276; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rqkUH5HUcPCwr3Rh3kiEj7RSOvIdcwFOU96UGAfngOc=;
        b=qUyjZBHi1O6/HBvq/DGwmxAX4mRaTot/rTZ3bW2TADSChW0QxDjgO+TGRrvfAJElr0
         WxP1l0i5/kHwEjv0ww/IZgrblIRsjjJOQE1qXUlnG3HE9NWov0OKNE4HA/ZPEKx4AeHc
         X2oo+PuWLOu1+H7QV0TqCNZvnJPSyD/WeTLI8zLqM7d2UWVmrw3CTeyRZFgZUMqRGVl9
         MeOuBTSIE0qqLKE8hChutzOyUWdy2/1qj2LAHgQyVV0nan49pCpdLAaEvrkVP99OpYcG
         xPOLcmLX1ydY8AoieotZrOSKWTC81ZKqjqPDgBUKy6D52Qv8jrLsG0v27N8W9sUUwZkn
         pVOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716936476; x=1717541276;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rqkUH5HUcPCwr3Rh3kiEj7RSOvIdcwFOU96UGAfngOc=;
        b=PIBL0cN5Jt4ByseZ8elN1S42gFt41h7ZvwNFGNaJEvAcKlN7iD/5g/GUQcRxnVjv65
         Mpw4sgP+TgVPf2J2rOE2cAJrZxvlF3dgd9gVoDLUzcBXYlVXHlLneoEWLDqCY+2HNL+k
         nisyf16XlsTeR1NqNecS1e/dEo9fWAXU8vkc3N1VD8j4HIlHP3H+qpxmQU3Iyyatmidv
         XNtpFQOuYmEp9Gk4EIyu+vi+DfDirUnEwFB2fa02K3PjlUZP2oeubSYlT3roOBnx+un1
         QOevxXxIn9hQlrVUEN1tmUQKyIJ51PuS4c1KYhTY79gJJ+h5ACW5zLXwrKPz3UefM+LS
         AwbQ==
X-Gm-Message-State: AOJu0Yz0YnVIRAmDWLXONOThXD766H/bhWg6AgU+Yt/PsA+6tQHZbxIx
	6zC17gNTh7pVkceGm9Exu51Lo2nzzjQxRNauQqNAG2kJX880J114K05nKpulgl5rAAq2rO+S1bs
	B
X-Google-Smtp-Source: AGHT+IGl0jE0hJFE5C9NJ2gcqWf7x4SgS6IMrW3pbxZoCfktEsOw54R/WthqC6Q1XCl/9upamuUVbg==
X-Received: by 2002:a17:902:c402:b0:1f4:8500:9f6f with SMTP id d9443c01a7336-1f4ea6723damr6866395ad.11.1716936475284;
        Tue, 28 May 2024 15:47:55 -0700 (PDT)
Received: from localhost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f48e6ff59csm49914765ad.36.2024.05.28.15.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 15:47:54 -0700 (PDT)
Date: Tue, 28 May 2024 15:47:54 -0700 (PDT)
X-Google-Original-Date: Tue, 28 May 2024 15:47:53 PDT (-0700)
Subject: Re: [PATCH] RISC-V: io: Don't have a void* PCI_IOBASE
In-Reply-To: <mvm5xuzwvg2.fsf@suse.de>
CC: linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: schwab@suse.de
Message-ID: <mhng-ffab58c3-5fe9-4e5f-9b1b-1764dd6b81a2@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_154800_228094_26F2B025 
X-CRM114-Status: GOOD (  11.41  )
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

On Mon, 27 May 2024 00:44:13 PDT (-0700), schwab@suse.de wrote:
> On Mai 26 2024, Palmer Dabbelt wrote:
>
>> I recently started noticing warnings along the lines of
>>
>>     include/asm-generic/io.h:752:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>>             insw(addr, buffer, count);
>>             ^~~~~~~~~~~~~~~~~~~~~~~~~
>>     arch/riscv/include/asm/io.h:105:53: note: expanded from macro 'insw'
>>     #define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, count)
>>
>> which are triggered by having PCI_IOBASE be a "void __iomem *".  I'm not
>> quite sure what the right thing to do is here: having it as u8 to make
>> the pointer arithmetic work seems reasonable to me,
>
> A u8 null pointer is still a null pointer.  Are you sure you are quoting
> the right warning?  AFAICS, PCI_IOBASE is not a null pointer.

Ya, sorry, I just saw the void* UB and didn't even read to the "null"...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
