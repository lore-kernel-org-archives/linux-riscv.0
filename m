Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EB94C4167B
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Dec 2023 21:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:Cc:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=4JaFR+67wfTwCAEof5KLOoZeqE29efA86/XKa30oUwY=; b=lxQmHi2qsHhCnFXD+tG7N2e/Tj
	kxqqzC7d9iHvwhx7Txd+aYaP0nIQhZRuZJC8c+cU49E0EUh+PQgDOxgH8DcQDlw4UuQvY8ahXQlTe
	7jRFU+mwiDTuhNUL8tjISVkxzqQZu1gjduDMS/3ZcRFDJeFZ2oi26KO5XiPAYrX2jzUoElg/9JZ9n
	N3Pgdhc/MBQ1c36Vc7mU1CiXKlOKUQ+VYEOIL9i5TJRczHAqJ3vs5JPdfREut0u58UBTQJj0nqh3R
	kvpEZ0uMRxeUEddYbhD7coFwN+RgAVviVVbLih7DUfOM8irMfPTZZxgDHqLHzW8IHPi+Ew1IvoHDH
	YVF+Of0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAzgi-00BLYB-13;
	Wed, 06 Dec 2023 21:44:12 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAzge-00BLXT-2l
	for linux-riscv@lists.infradead.org;
	Wed, 06 Dec 2023 21:44:10 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-5c699b44dddso172646a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 06 Dec 2023 13:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701899046; x=1702503846; darn=lists.infradead.org;
        h=mime-version:message-id:date:in-reply-to:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=emWQ//128IChCAhCT/THcHGJcWxhncZjLzE78FXSX8E=;
        b=OdJPjARSeiVXDiTWuz9GSs/Y1c0CTPtiF2fvvvqI7KkRtovvPXiqL0HPCLpG9RvelI
         6Mt83sCO7I7sTt+wmEdTjL8q4DBzRNBtV1EMhbZD3V8nMwhEVz3pCF4WTgzhhlkvJvC9
         dhNOUgRJmtnq4ed6XkFtM5YYyuFiHKZcUNO1dA3hy/IzlvqW93D740TwbWlW2It8D3fm
         l9W4udT+0byZZb4J3idIA9xAZPc9IATO62QYsWO6ohH+Pm6bi6aBsdvL6gu/4YW8jQ3C
         f7Y5ESlhtoty30fw7lfwRn5rwiD+wcbXZeUIPPUweyNqDTFjz9ig7oKjzPAjimt/3uRB
         m+rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701899046; x=1702503846;
        h=mime-version:message-id:date:in-reply-to:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=emWQ//128IChCAhCT/THcHGJcWxhncZjLzE78FXSX8E=;
        b=vjoml1EfWf7AU/NWQob93W6/HGIe6o/KqV+2cjOlJtCbWdXxUKV4qYPXk+VAsUpPs4
         JUKaeQE8fz6J0gcqe9sf9WDKEHtaHrwuU/K78p3nvIIG9kHVWRdv1ljLwNRNKxX+4kks
         rKpCVQ5qUBecTLFLPk0YKIY/5ARBEY7DyNtZ35uGa0Uf7QRDDWvC6F+qAj2xVS4E2aTp
         IZLEzAdgkWJUUK8vpCyGK8rbLX6ocrYEcQNIw6Fy6JTDPtBF2mWNlG0MkPymb6y3ef6h
         iKVp7G1WcmZcsB+14wfaIC52rqXzBcga3/9CnX9oX6rF5Aa1IetZaF1ZuN/BXnKHhuIT
         pciQ==
X-Gm-Message-State: AOJu0Yw4SFGPBG9bjH0FayrCZbfSrmdrNTTBu9xOD4HgUASEdM2ATwT+
	cbF6lS9Eb6Y1ANTEbNquaB+0Qg==
X-Google-Smtp-Source: AGHT+IF/KxemxaFFxK+8duX7yz47wLjIg4ovMlgkotFmeA6CuhxmgEGVP9MOvenfubO04eLnbo0Zng==
X-Received: by 2002:a05:6a21:190:b0:187:f343:ab3d with SMTP id le16-20020a056a21019000b00187f343ab3dmr1422332pzb.55.1701899046588;
        Wed, 06 Dec 2023 13:44:06 -0800 (PST)
Received: from localhost ([2804:14d:7e22:803e:f0e2:3ff1:8acc:a2d5])
        by smtp.gmail.com with ESMTPSA id ju17-20020a170903429100b001c74df14e6fsm267818plb.284.2023.12.06.13.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 13:44:06 -0800 (PST)
References: <20231122-arm64-gcs-v7-0-201c483bd775@kernel.org>
 <20231122-arm64-gcs-v7-23-201c483bd775@kernel.org>
User-agent: mu4e 1.10.8; emacs 29.1
From: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Andrew Morton
 <akpm@linux-foundation.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton
 <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, Suzuki K
 Poulose <suzuki.poulose@arm.com>, Arnd Bergmann <arnd@arndb.de>, Oleg
 Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, Kees
 Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>, "Rick P.
 Edgecombe" <rick.p.edgecombe@intel.com>, Deepak Gupta
 <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>, Szabolcs Nagy
 <Szabolcs.Nagy@arm.com>, "H.J. Lu" <hjl.tools@gmail.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Florian Weimer <fweimer@redhat.com>, Christian
 Brauner <brauner@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v7 23/39] arm64/mm: Implement map_shadow_stack()
In-reply-to: <20231122-arm64-gcs-v7-23-201c483bd775@kernel.org>
Date: Wed, 06 Dec 2023 18:44:04 -0300
Message-ID: <87a5qnhuqj.fsf@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_134408_942033_AA83E9BB 
X-CRM114-Status: UNSURE (   6.03  )
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


Mark Brown <broonie@kernel.org> writes:

> Since the x86 code has not yet been rebased to v6.5-rc1 this includes
> the architecture neutral parts of Rick Edgecmbe's "x86/shstk: Introduce
> map_shadow_stack syscall".

This paragraph can be dropped now.

-- 
Thiago

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
