Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E3F9EB64DB
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 20:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9ixIH1DlRmyfrB2WPuoTEzpA2p0yIAYDYmOoLeaeP78=; b=imVT1mlAl/1g+3
	UEWUcabxjqoL0XhhS9zQRLMb1cwMx32KPRoENTbKLV6XUxBLef/57I6o+mCeKN36HVJhpGmLHy0RK
	kt7ch0GWfdhp6yGI9U8SkXnKAjMGE7+f89u1qG6+lQtWwvmCocK/1YSSr2bw+pnSmER6YLiSKkl38
	eZIevhOQ0qitv+AvAbpbzT5lJCXE0JEbdN+dCERr4eiMWPUcL8kX/pDBkzdkJ2XNOvZ5MIsWy181B
	x1nzQB+GJf1FGPIK69ZiNtI8ueOB54Aw5KHFWANLEcjEX8dWet0H9l9wMlNNZ2WmBVEUjQEiD/Gq5
	374IWY3DOlmI6IeqrC2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBhj3-00CGON-10;
	Tue, 20 Jun 2023 20:13:17 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBhiz-00CGNb-2t
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jun 2023 20:13:15 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1b51780c1b3so39975375ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 20 Jun 2023 13:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687291992; x=1689883992;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GmrSYTSQ2qUkhlzSpM0GcnhNM2r70wuMDYnO5JFeaLA=;
        b=gEGUXxiXONvsoVfzKoaFB6BPub3fU+DFlJ0bRt7Vxj0aQBADH03HLEgMl4I1rePXGX
         Oe1tjtOVf3ljedV8ZqTqcDiOKoP33OCQ1lrB5R6EMdRVB5Fs1VXb+j8OtzpNhPyO3NPw
         9OIQaKNBiKriAp1zVBnjvOXZmf35TDm97PWiOEm0njo3cEqrcElcJc7+Mxv38NMHdooS
         ofOW3UXZ+8tOpkJNnYPHiv34ir5wZYwal22B1f1yI6AUm9SXROVtf1FOpnQ4Zh3cXC5R
         TWk3LCy+jjyRHvzaoXDMXFpgFu/enVGW6jiQxCnrv1zn54hpR/MMJdZyipOEM6h0guzG
         BCsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687291992; x=1689883992;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GmrSYTSQ2qUkhlzSpM0GcnhNM2r70wuMDYnO5JFeaLA=;
        b=N9I8Macc5PJSVxYr4XUw8NvB/WTO75Bj00S9W9KQM5w0vWEfBx8OyZzTagMEsJNoMB
         LrazobvLFTa+4slBl6MsNonqDKeOLL3/dcxOe7+aJ87EW93KGUSmm9+LwJJxDRX9zCoA
         ezzN01cQj+rN1x17PF5NMkqkxEY8RMVgQpxZBLpsN1iR+7tYwj1t/cTkScJKdGGfnUna
         QIf0Q2xJoiLXbjOgrkLoE8RerFV/MQbg3MJsbI077xj8QvpopVzqlAVu7qC7jOZlEYHz
         1CJGPzRWLcRuo5Uv0Kd9tBfTgC3wBqMesJE+FC+b1bM536g+qgKlqHpzs45Jlr604ofU
         AB9Q==
X-Gm-Message-State: AC+VfDyZBbcCHFgCbo1PWc5lObd2lq9AN6Ud9ADfcN4PtBXwe0qVDQPX
	N/PpEMPVs4qe6ZF4iRwMzX/4GA==
X-Google-Smtp-Source: ACHHUZ6R39K1FnSTyHu9gjeCYRKQ9F5Jm/s2hzxrwffi4i/maQOWNihzpUGJp129d9ztVWFXyz8Tvw==
X-Received: by 2002:a17:902:c14b:b0:1b3:c98e:a114 with SMTP id 11-20020a170902c14b00b001b3c98ea114mr12444603plj.45.1687291992114;
        Tue, 20 Jun 2023 13:13:12 -0700 (PDT)
Received: from google.com ([2620:15c:2d1:203:2565:1a14:4024:2d88])
        by smtp.gmail.com with ESMTPSA id w5-20020a170902d3c500b001ae5d21f760sm2007132plb.146.2023.06.20.13.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 13:13:11 -0700 (PDT)
Date: Tue, 20 Jun 2023 13:13:06 -0700
From: Nick Desaulniers <ndesaulniers@google.com>
To: Zhangjin Wu <falcon@tinylab.org>
Cc: palmer@rivosinc.com, conor@kernel.org, guoren@kernel.org,
	linux-riscv@lists.infradead.org, npiggin@gmail.com,
	paul.walmsley@sifive.com, paulburton@kernel.org,
	vincent.chen@sifive.com, tim.bird@sony.com, llvm@lists.linux.dev
Subject: Re: [PATCH v3] RISC-V: Enable dead code elimination
Message-ID: <ZJIIUn8Da15neIwI@google.com>
References: <20230517082936.37563-1-falcon@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230517082936.37563-1-falcon@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_131313_933664_D305D692 
X-CRM114-Status: UNSURE (   9.26  )
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

On Wed, May 17, 2023 at 04:29:36PM +0800, Zhangjin Wu wrote:
> Select CONFIG_HAVE_LD_DEAD_CODE_DATA_ELIMINATION for RISC-V, allowing
> the user to enable dead code elimination. In order for this to work,
> ensure that we keep the alternative table by annotating them with KEEP.
> 

Just cross referencing the report from Palmer against v2; I see orphan
section warnings from the linker related to the EFI stub when building
allmodconfig with this patch applied.

v2: thread for reference.
https://lore.kernel.org/linux-riscv/CAKwvOdmsgMN5oQpDLh12D0X-CfQDtHC-EtxHcBnADkhnyitMKQ@mail.gmail.com/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
