Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7136C77B7C
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 14:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4LAOkEY8brRjtgURfUEb6/+fMDyaO3BLwjci0utjtpQ=; b=Cva0JeEEWAS/Ll/OJL3gfopZoI
	MmsY8frbmYhb5VQ1c6ECnaAWdB4npqF9TPvRoWI+jCS+tcbTK8T+sWuEfhgf5I3BFco/5JCckb3f4
	T98RBltArYHg0X/fxQb12M5qRHpIPeIeF60bBMnJCv+S/y00fbvBN8Sf5YLNwVngXsWLs/uR0v264
	zBzoWJ7YmsgcXiIqWMK6SnzTMoClYyn4SgHC6Hu5ag70zLmEwSTAxLz8Hf75RQ+eTf/kGF5tIkZly
	nKR+XKz3nrafaJEElLBDAevrN4WQ54dYSUE3/nERyYsRj7dcGbvI35J59h+kk84bTKOlJr+cdT6n5
	YFmrR4Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU4Pb-00000005r2s-1vgz;
	Tue, 24 Jun 2025 14:14:11 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU3yA-00000005lF4-39In
	for linux-riscv@lists.infradead.org;
	Tue, 24 Jun 2025 13:45:52 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-735a9e65471so306622a34.1
        for <linux-riscv@lists.infradead.org>; Tue, 24 Jun 2025 06:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1750772750; x=1751377550; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lT4n++xpjyEFl1i+V6mrdGeWr7oE0xpHnDaKlN0JQpc=;
        b=3RpXt/QMcappkG6U/GuujzTgEzgOsxW+SzpN7k5neiK1gHKM9ip5W+tbczgYNI7Ekk
         x0S5x6eVShTADeI2lFe0LglzluSs842Ep+Ku9lKp62nGqq+ftNCzeIqrpaw6aXp+l1+e
         hSUPm/Ot12VN0Leq6Auh0UT7oLXMH6EkaQDrZ4Cyhh7l9799GVxrjsvvM4aiFK6NmfKd
         pwssSnReYSZVuUYsdza5lq8QKCRyjlsotL7F78EiIoOXTOfVm4+9k0E9EujowDTZASUW
         g59VYz1xL5rg5ibGXj11G+Pky0dxTCiyMtNOdRve3u2J8G5SgnoOqe/Ed9lGwN1bdhmk
         l0fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750772750; x=1751377550;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lT4n++xpjyEFl1i+V6mrdGeWr7oE0xpHnDaKlN0JQpc=;
        b=aMV/Gyxw8k1HGfAa8pWuejL+4M0ujWMUbbdrjVP9kPJBaekdWqeAZx9nn2CmBoet19
         d09P4kUro0euYno3DNd7w4Emy2hOC3K2hsCj6LVDqNcbcB8I93ke+e8MbnMVS43gwvNs
         LamAACT5/2Kx/NCaiqunkQ0lFxbXpje78J3NATyH0ORR76cUVIdKP9Pc3+4ixw13xXCc
         qfp8EzVdsl8XnR7hisPRjOitQVpODIKT7fhc6wbThd/DOAf8443hUDj2EGEphRU/a6cq
         5RUKmo1N+o0niRHTncSt73Nibh2g3lBCR+hNeXm1AUgPBwku/28TZUe1C2eSv7MDZc56
         xB2A==
X-Forwarded-Encrypted: i=1; AJvYcCX0ByDLVYJcCJ2M5iD+sz4vko8GbuqQcKDDHi9bzfz59D3vnzGV3TTXqF0fZmHZMqzabNonJNv5wjRwDg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxMt1hseDxvXPyVYnWMJmlth7AQH5Vl+7KlgTqLSskOY5Rgc73P
	PrdRBj29R5e7vZyG9rBD0kUmtzvWJKZOFNlf8bmn9KkcN3rnNrvCcODplwF8sOA+bI8=
X-Gm-Gg: ASbGnct4NOvBmgMBgB5oxVZ7466W0BFM1rLUC7Bawb1zdHrhnbrD4ApLErz4H2HrPNS
	fNROe1FDrMChbr8ExKkYrHnQHmZJgrOBXOayx5hq+nfM1slI9HbyoW74rdr3FnEeVfRiJi5OdvP
	WxhAN6RzKHj2Al2JoIB8RZkz5DfbGUF2Q5L9g2CeMqB+r0CcBZcuIBCWHFH8OYt36uPIdQDA8vn
	6ABtvOcshTkYI7UIr8D4sSyrtlEPdp7wXO7DMcVVwm7TMQGA2aY5bNiyjp7v6lGSqfhecoMHz50
	z1YKoZe2dv3ggmFWhitqNM9ni6BuhAhDTWBoUpYYwlD4JDzJgTq+iUY1
X-Google-Smtp-Source: AGHT+IHye5NBlD5obt2KHWoCZCbO/Kdn5WPzM6Oou1wfcuG9MpPN0E3391EUVBxmyqZpv7fNFU2AyQ==
X-Received: by 2002:a05:6830:2814:b0:72b:9316:d596 with SMTP id 46e09a7af769-73a91c0fa67mr12338717a34.3.1750772749751;
        Tue, 24 Jun 2025 06:45:49 -0700 (PDT)
Received: from ved-XPS-8940 ([12.0.166.162])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73a90b15261sm1843265a34.18.2025.06.24.06.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:45:44 -0700 (PDT)
Date: Tue, 24 Jun 2025 08:45:41 -0500
From: Ved Shanbhogue <ved@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: zhangchunyan@iscas.ac.cn, Paul Walmsley <paul.walmsley@sifive.com>,
	aou@eecs.berkeley.edu, Alexandre Ghiti <alex@ghiti.fr>,
	akpm@linux-foundation.org, linux-riscv@lists.infradead.org,
	debug@rivosinc.com, linux-kernel@vger.kernel.org,
	zhang.lyra@gmail.com
Subject: Re: [PATCH V8 0/3] riscv: mm: Add soft-dirty and uffd-wp support
Message-ID: <aFqsBW1CT6qeG9Wv@ved-XPS-8940>
References: <20250619065232.1786470-1-zhangchunyan@iscas.ac.cn>
 <mhng-536B594B-996C-4A15-8744-C7A27B45720E@palmerdabbelt-mac>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-536B594B-996C-4A15-8744-C7A27B45720E@palmerdabbelt-mac>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_064550_785459_445E4E8C 
X-CRM114-Status: UNSURE (   7.21  )
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

Palmer wrote:
>>[1] https://github.com/riscv/Svrsw60t59b.git
>
>This 404s (with or without the ".git" suffix).  I remember seeing the 
>spec at some point, but I can't find it anywhwere else.

The ISA specification is available here:
https://github.com/riscv/riscv-isa-manual/pull/1907

The corresponding IOMMU extension that enumerates support
for Svrsw60t59b is tracked here:
https://github.com/riscv-non-isa/riscv-iommu/pull/543

regards
ved

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
