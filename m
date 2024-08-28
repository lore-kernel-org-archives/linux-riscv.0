Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6FD4C54754
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Aug 2024 09:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3ZAqcSeR3zLeEmkcns7YjC6oIkJtkbheh3jFe25sY78=; b=uZINV1O9QtQtKW
	huQ376+yR+MVKwyH8wiYub0WRYLDdTZSFYRcPTY/CxvVvWXi1feUc8n8zGyGZBYVaEbF46QV8849q
	kZPfyEARbR7zlFckhWb0ObiraxBZIJg+ynNA+bkX3stADJLTeoWhGPMqQ/oFfd72W2L14OXYop4zN
	ntvcn6WuW9YX7xVMiXfGlU1asub3kDkK/w3Mmgkt33gQTgS9dYTddnaXBZThjwZ1DUMMSvy660fOO
	dFsLeGhIVmuBRvorIeR05nRieCruTVy/WwKVourOFO7Ykbfc2srG7tA9jTT/CuZbwkfbUhACrJqxB
	EknW2nHdRXSXASQgSoYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjEdp-0000000EdtL-14bh;
	Wed, 28 Aug 2024 09:07:01 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjEcy-0000000Edhe-1180
	for linux-riscv@lists.infradead.org;
	Wed, 28 Aug 2024 09:06:11 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2f4f5dbd93bso49907291fa.2
        for <linux-riscv@lists.infradead.org>; Wed, 28 Aug 2024 02:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1724835966; x=1725440766; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eUwP1bH89y2mjDwy+uYIsF7q8d+iUjc7F7MG+V5YoHA=;
        b=YNVH7mPI+fd0G8r1xqpJycf+OYGyAdjA19CZYhL16N+HF7RZ+xEdF8bmnlZNGo/6yj
         xBy1Nd9nx1hCPrtnxDJ2bLQujpsW/5iUS2FD5UPvr6PIULaH/ZgqsdOzLg75isiZItOL
         SukhxTJwhoUhnqTcZQZ9gGi0w8v7hO/pPuKc3DmBTrpGiUC8xDsNP8v1/b3IF7vjN7TL
         vC5Hgtu2PkuRwmNVr9Z8j9W61p6yzCRiBTFyrgVd9sbQFx/7k779gvKuLROJi/ZfUdyR
         00Yy3tUBvK5xMBz+rnMNFTCJgIKOHDTj6LsSR91uNePCsM5kL8ZxPunI8ugirkm9XT0o
         Na9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724835966; x=1725440766;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eUwP1bH89y2mjDwy+uYIsF7q8d+iUjc7F7MG+V5YoHA=;
        b=gGwBcYIUKOGeTrIuvDTdMIL5LeXon5ic7aeahrak1QCVho2ft2LI2vc5l+yiarQcnO
         v0Q4LsvXT5+GG0iVEpD2kFkyPNVBSYY55LSEHfObWzul0hH4Skm2PJkkhxmPyFO7Mi2n
         KV1J2vIRSMuHCGWu83O6sZPBU+6IU6zhkhepg5ic23z/so/R5zmLn1DixdKimZWc3NKt
         ZbCnmaALEXLOM+FS0sf+9sMLCu7hvCpbz3oQxyo2VQvz+Ifcboua3UChAlWU533fjod+
         4y0MFn7lQ0tFehQt0P0zf+4bMNGr6xiAtV7DqqVD8nwcGWXv5ZyTYQIp2ee6KKwSR+ry
         fDhw==
X-Forwarded-Encrypted: i=1; AJvYcCUsNbn7O8CAIe7Km1nDXffllMelyUcyMLpqQ5Rhix81Fl04dHiZ9VKWMElipPqX+4mPkw5gsjZ8iJ347w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyEns4uXkduThTZH572+DbAe9xrcDrc33bXsEo+rNqXIrse8oPz
	EAQgGT22KzBiOotcAZFdF8Gf016AIVKa21N+iVvD1EIbAfOVgjtgt0IUV46BH04=
X-Google-Smtp-Source: AGHT+IEk0hGUKNFKy1gAbF519cS1Zf9jNVuoleszEhO12zfKPjpQIg/vIHKKuEXsuMjAwz6KFlZ/ow==
X-Received: by 2002:a2e:908a:0:b0:2ef:2d3a:e70a with SMTP id 38308e7fff4ca-2f4f49090f4mr89975361fa.18.1724835964996;
        Wed, 28 Aug 2024 02:06:04 -0700 (PDT)
Received: from localhost (cst2-173-13.cust.vodafone.cz. [31.30.173.13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c0bb4824e7sm1973814a12.92.2024.08.28.02.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 02:06:04 -0700 (PDT)
Date: Wed, 28 Aug 2024 11:06:02 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrea Parri <parri.andrea@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Leonardo Bras <leobras@redhat.com>, Guo Ren <guoren@kernel.org>, linux-doc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arch@vger.kernel.org
Subject: Re: [PATCH v5 13/13] riscv: Add qspinlock support
Message-ID: <20240828-801ce72599586044dcaa767d@orel>
References: <20240818063538.6651-1-alexghiti@rivosinc.com>
 <20240818063538.6651-14-alexghiti@rivosinc.com>
 <20240821-ec1ec92842570050429621d1@orel>
 <CAHVXubgtw3rZq1+jNv2LrsQBhViu4Sm9Gw3B_7-XLzBw52x6oQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHVXubgtw3rZq1+jNv2LrsQBhViu4Sm9Gw3B_7-XLzBw52x6oQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_020608_304055_BB50B1CD 
X-CRM114-Status: GOOD (  14.70  )
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

On Wed, Aug 28, 2024 at 10:16:40AM GMT, Alexandre Ghiti wrote:
...
> I sent the kernel size impact using -Os as asked and
> ARCH_WEAK_RELEASE_ACQUIRE should be handled by Andrea.

Sounds good. Thanks.

> 
> Thanks for all the reviews drew, the patchset is way better now! I
> won't respin a new version since there is only a minor comment change
> requested in "riscv: Improve zacas fully-ordered cmpxchg()" unless you
> insist.

I don't insist. It might be nice to change the comment text at merge
though since it's safe to do with only compile-testing and it would
improve readability.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
