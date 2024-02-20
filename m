Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D839C48BC3
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Feb 2024 02:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:Cc:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=u+K7tOn4Oi3NCndCISIhofluvQbPPragXgPV6faFyew=; b=KDRyTGi9IJHEAHRZEILD6ey5oa
	W9w1RLpMwByhEPoat83Sb/oylN93SGfn1AgKPrcREKx/K91Q+WjJl3XijK+FO3OqhIzVAJEBPhxi8
	4WOkjVLWndmDAJdf/swpExot+uvfpuvjSdjiL4GNYs+RrrvOMkMapvTcJlXckrPT7hbw92Rnb8zJ2
	CkILFqHxcdxw5QS+4kw+Z7EqXqnw9Qa5k68Lkel6n6W1JZy3fpQAyxwCWa+NHGmRozhIrQ002LKZp
	AnnvPRpLFhn2TCDuBsfBX+HhmIqfaJxNoVzAxf/S1gp5mBVXwAgIUs6aavu3hy/ufgJQ3NkA1kZ+1
	pehA8cBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcFRJ-0000000CnvJ-2yjx;
	Tue, 20 Feb 2024 02:00:57 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcFRF-0000000Cnt9-2WDl
	for linux-riscv@lists.infradead.org;
	Tue, 20 Feb 2024 02:00:55 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-5cfd95130c6so2980654a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 19 Feb 2024 18:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708394450; x=1708999250; darn=lists.infradead.org;
        h=mime-version:message-id:date:in-reply-to:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=TPVEuybRyh8o5XcrU4e2hriNxyZdgI2hibiqaIMVscs=;
        b=X8VnJuQoUrBF811CWJXvEozuqyWQHSoCbMUkYGpE8sEpqRDZPLhqNbroUB5FpLe5R8
         LgahaXQfSuShqtA339hVkl2ycvjbkOoSRG20HTbBR5WEzpkNMszk2sN9jX5lRigAaLGb
         jIVxdnO57Z28IG70K9v/BqoOC3JL6zxcfRE9jmONQ1MNFgm4remt9qsWTpRN78O1Uhg+
         ENU8r+Ndojz939+bqTE9M9gqp+iRqh457PtgMgTukCcLhuasLJknuXqmX6HDKWp9EIul
         xCQK4LTK8rOte/dIBdFj0UOQzmmnPKeu3YUkHekE+kJtZVAgCniDZKnUBXlw+npdRWd7
         BD5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708394450; x=1708999250;
        h=mime-version:message-id:date:in-reply-to:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TPVEuybRyh8o5XcrU4e2hriNxyZdgI2hibiqaIMVscs=;
        b=nTBU/m/WADA3cuHxTVEb6Fw1AXmvyEKYhhq7tu5KC5AuY1qv2viqLSXnLSd9yMQa3e
         sqWWFpmiM8wsTgXHAQ/inbPBKabxVrtE0hBvmLvWbK5mK8kmvP5YFJ5D7ASpxXUjIL5Y
         VXoI19jED11rn+6DQ6MxtQpRU17IItl/2ni2AbNv783zlPWiWm5VFQnAxOEsbUhb4quZ
         rgcnAI+JvWToxv6jbyFFGSfcJIQ5PTDQg0cTOKrffybtZsIrutjvstksWAvyZgR4DijO
         uTkg/0v58YXnNsEnSmTbHKaP9HoILsEDEpuPJdAnZ7QbT2YHj64XYo12pTfxyUWeSeeJ
         Jxkg==
X-Forwarded-Encrypted: i=1; AJvYcCU7shimRQk3x08B2f6Yc3XIQTxaT6m9iPkwdSM5469tbB3grNSIVaE0vYR+0lSLp2CaT5jLhj01377FXS7METgiqJcQaDyPWHDfFX+Y4bmD
X-Gm-Message-State: AOJu0YwojFlxoE7n6zO+Ehu9AGxagBB5R1FlhRNu7mJN2SMiaJ9aVZLn
	4OXQcoLov/P+Ymzx9ZafijhWdUWsrm08/3J62adphuz7DQQfcsgV8Vbp6AkAi20=
X-Google-Smtp-Source: AGHT+IHQRCR15jZ5TkL4psb84wN2RgNzkdO9BEfcOkiOYvFiSNgotMA3Enz/ysz1JOMgmumVFviryA==
X-Received: by 2002:a17:90a:de0d:b0:299:3332:a649 with SMTP id m13-20020a17090ade0d00b002993332a649mr8755614pjv.18.1708394450582;
        Mon, 19 Feb 2024 18:00:50 -0800 (PST)
Received: from localhost ([2804:14d:7e39:8470:a328:9cae:8aed:4821])
        by smtp.gmail.com with ESMTPSA id z19-20020a17090acb1300b00296e2434e7esm6167416pjt.53.2024.02.19.18.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 18:00:49 -0800 (PST)
References: <20240203-arm64-gcs-v8-0-c9fec77673ef@kernel.org>
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
Subject: Re: [PATCH v8 00/38] arm64/gcs: Provide support for GCS in userspace
In-reply-to: <20240203-arm64-gcs-v8-0-c9fec77673ef@kernel.org>
Date: Mon, 19 Feb 2024 23:00:46 -0300
Message-ID: <878r3f99o1.fsf@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_180053_797002_504413DA 
X-CRM114-Status: UNSURE (   8.08  )
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


Hello,

Mark Brown <broonie@kernel.org> writes:

> Changes in v8:
> - Invalidate signal cap token on stack when consuming.
> - Typo and other trivial fixes.
> - Don't try to use process_vm_write() on GCS, it intentionally does not
>   work.
> - Fix leak of thread GCSs.
> - Rebase onto latest clone3() series.
> - Link to v7: https://lore.kernel.org/r/20231122-arm64-gcs-v7-0-201c483bd775@kernel.org

Thank you for addressing my comments. I still have a few nets and
questions in a few patches, but regardless of them:

Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>

-- 
Thiago

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
