Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E274606A327
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Nov 2026 09:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zVsKXBVM;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nYLup1+8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CaS3SxzWiJtyYo+Wqcw6VacM0pmTNqLLmFN5bj77pTY=; b=zVsKXBVM4eKdaB8yty0FQMKxVM
	217FoSxHA8j1QfNYYspxYgJWKz4VsDSu+9OnykXSnvU7d/3NBHREv9lLtHQCejJwQIkTcMoa3nTNJ
	DgzsZM3U0OguKnWiVsZAm7Xx0qvek/fPyiJ1z5c34NPdEHw34liFL2O82GBeeXq//hOcZgo/cfXE5
	d+rvhrzKeRV6nZUxpGgVqu/ZYwYjo9A2bIvdWsfDXVXKwUR1QzarKfdo+RYr2iMM9HGqxoJFb77wo
	DYDTcJF3odbxmr/i/VbrTddqPIzHYq0EJV1oGIblQg/vASnCYyZ51O0ayjH0WFzAis+SkwZlH2Xsg
	sgLrRxvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSA4m-0000000Fff7-2F8M;
	Sat, 14 Nov 2026 09:29:36 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSA4k-0000000Ffeh-0sdM
	for linux-riscv@lists.infradead.org;
	Sat, 14 Nov 2026 09:29:35 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so18450255e9.1
        for <linux-riscv@lists.infradead.org>; Sat, 14 Nov 2026 01:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794648572; x=1795253372; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vz0vstI9OA5h3bsTRS3tRWw1Hwov6sM88rpH9FbtfYM=;
        b=nYLup1+8qZD7CCx7mMwR7MM/BJjWdGOWij0+xUfrg1YPn7tu5FlGpMviJJWW4BdZWW
         jPnjnlr7H4e7aSrUEJLzCIvAbvrI5EK0UUG6Vdr719ZkY5smna0U+1FSrgLvGdvuHDuM
         0JSkP+SM9AcBcxNsQca3JeSFewmfmoHtMlPMTfYK1eTWl5NNaCwmEGEvL1zdB6LUnNms
         Qq0wKB5n7vQ8sNBD0TMCgyaZqcInd3UDQy1PYYOwHFVnW8eRuTlUbM+jVUF8a0DSONHg
         uoC4NiRWThcJ1XmXRFgfGg5ytmwAjkr6fY10/NJDu9fJ7Vgsns35HzKiSeIJdHRpIegN
         57Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794648572; x=1795253372;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vz0vstI9OA5h3bsTRS3tRWw1Hwov6sM88rpH9FbtfYM=;
        b=0ETHxFc2Wfl4mp5/Wl4BdGfKBz2mB8Zf0yS0xmvHHK637JJN9YG/8InKyZBZ4y2vLY
         +VnS+3lxXOeUbTVz1GL2bg0PF1fMvBKz4/KsuQCF7I22LJwB7RtSK+9UyYO5A5qdiCJ3
         B+l5CmMuH+eqO5XuMGqY0499S2FH+feiaAfLRHpYMcRtvPP3VEsdfKjuCZ80X9qCvtUv
         X8yiqoGBaFX8MonOavkvF42vBaosX1AGtlzDSqQ28mhi4YAqUnoRXIbBvtLOYcljbZmo
         tDm0rQ3JG5P/UnkRtOGOoX+MDjs6KqyCTZzOnjtk+yxMEyQsLXWr0TtYWwad3RD6wf8V
         m/hg==
X-Forwarded-Encrypted: i=1; AL+hErEJFSKlYWCRDg7TM0MeQlwH+akdc5bteuu9VUO1Twrnz4EewVBOFqLsLK8gH6GvxMf5ht9LoNCc9hwf4w==@lists.infradead.org
X-Gm-Message-State: APuU4Z/gEZXLuyv+hRVaNGBcWbl9537b02xi+bNMA32lSHMvKKD+zAvH
	6CTQuWxYgaWkYr06P4vmbPALDlxlxu++4PpuPOxMmSzvnAJYCsilKKz6
X-Gm-Gg: AYBFou2AS9Gaee4L+VzWg51FUayPM+aBrgzO3i8MtHagT7d15rV9wLSJiyh9SoQXGID
	3rb67xwuQS8SWAlsYCOgBNfBUeTlF8SdHBqe0UUm8+Bs0Ad1E0Sd/4dCGCzkq/w0SsQkXR0we3/
	9t4wAWpgZhfCtbam3VErrbv0cYvZOD1OLsSyQWvD0MbozDH2Fh48AiI86CutZzmVUuMhKwoYSmr
	h6DxCHcT5Csx6rmO92/IyXLBShabCZXfYHtU7TNZm7S27h7QCUdv8lOSLIAwRhQpJlWyuEbdngY
	R8Mr9jsXWbwp+k69oCgy9R/1WsY916D4FfLg9TWMby6qPahqNO/aYMoblLmdFkHkX+H90zf7eel
	Ma5KyXVv5NTEU8gdfopgm9nIY1u6bXVAF0YowSlMtnqAoc4U5FcK2R1vb1O4dQ3GRwLCDl0V5cY
	DFBONPC1MZNyUC7pzB0jjPcG87sjEXLq3YKfnyLvwZmVK87743Q+TSosC8lXYADDq+cmDcrfwSo
	alcZ9UQbUd1C5Y433j1xTAZCUDFNQZBhQS+MLFjTg69EWOiUrLh9Do8vhw4hWE5zJhXiqWfPOpJ
	/InUZLx/6hSandtA3QaGDY7q1sDs8baRorTVDxX3SDo8vzjc+JJwNbdRR0NnC9yLW+40xF9Q7In
	4JeJHzu6N1fjfpkem1RrRY8rRf8M3AqlOB3I7bOH/rcmZMWutUAXh3wu5M83uNG+HzA3fPLfqTq
	oSBx+foxHE4yudRhZCNDhD8V49NzQQT56cUg==
X-Received: by 2002:a05:600c:4504:b0:49e:6581:7baf with SMTP id 5b1f17b1804b1-4bb559f044amr99585225e9.2.1794648572072;
        Sat, 14 Nov 2026 01:29:32 -0800 (PST)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-b358-dd01-fd08-0f0c-fef7-8409.310.pool.telefonica.de. [2a02:3100:b358:dd01:fd08:f0c:fef7:8409])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60da0a03sm8078945f8f.53.2026.11.14.01.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 01:29:30 -0800 (PST)
Date: Sat, 14 Nov 2026 10:29:29 +0100
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Mike Rapoport <rppt@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: mm: Pre-allocate module page tables for execmem
Message-ID: <avgpqlpWf01mwo9P@gmail.com>
References: <20261016102847.96530-1-kmehltretter@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261016102847.96530-1-kmehltretter@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_012934_269143_37BB3234 
X-CRM114-Status: GOOD (  10.39  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 16, 2026 at 12:28:47PM +0100, Karl Mehltretter wrote:
>   Unable to handle kernel paging request ...
>   [ffffffff78000000] pgd=3D0000000000000000
>   ...
>   bpf_jit_fill_hole_with_zero
>   bpf_prog_pack_alloc
> =

> Use CONFIG_EXECMEM for the module-range pre-allocation, as powerpc does
> for its execmem page-table setup. Both CONFIG_MODULES and CONFIG_BPF_JIT
> select it.
> =

> Fixes: 2c9e5d4a0082 ("bpf: remove CONFIG_BPF_JIT dependency on CONFIG_MOD=
ULES of")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Acked-by: Bj=F6rn T=F6pel <bjorn@kernel.org>
> ---
> Changes in v2:
> - State that the BPF JIT region lies inside the module region (Mike).
> - Add Acked-by tags from Mike Rapoport and Bj=F6rn T=F6pel.
> - No code changes from v1.
> =


A friendly ping on v2 of this RV64 execmem page-table fix.

Is anything else needed from my side?

Thanks,
Karl

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
