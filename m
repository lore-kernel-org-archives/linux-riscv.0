Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB7EACA5FA7
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 16:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:To:
	From:Subject:Cc:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kRbosSOXAoI6vu2NSGQ55ywhG0ZFFiUH0IvCSEXl+C8=; b=Dz0IU958MF21/M
	2wDjj7p9gxvzwBMiOsVG3yk4OpsRo2gkWKP72p+u9Q9mD9pD9eUM7O1gjoQXE3BRDMjMSz+fiQ7HR
	hUmjCPWYh9F9anAh+LQVPTFMjV0pTXOuhnIu769B3KYyT5jisGkFunN3CANmCwJfFoNkzJYDbrE3T
	Iya3T71SjdyNrLqDMFqGYjSEwjFTx1zubMYR0atBo/b6BCpC6MognfiuXRiIL8AHLybTIECn6b26i
	KZKHhXwgMW8Ir8Gvrl1pGGaWhN6PyCvhBCVnN+BT4WLlrLXuU7MYBDdlySt53nuSLKhegNeYujKSH
	T/TtPYVFBju2bB0SQchw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBaiD-000000043TW-1EjM;
	Tue, 29 Sep 2026 16:29:49 +0000
Received: from mail-pj2-x0c.google.com ([2607:f8b0:4864:39::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBaiA-000000043Sa-0eqB
	for linux-riscv@lists.infradead.org;
	Tue, 29 Sep 2026 16:29:47 +0000
Received: by mail-pj2-x0c.google.com with SMTP id 98e67ed59e1d1-3a0d2c37b0bso1633963a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2026 09:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790699385; x=1791304185; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5gmBRPrdCcT1/ykMZonXArmE29LxS0sCmqHY0q+fG44=;
        b=VISU4m9d0bPg+NK+I4nDzIW/2XnREtgwkJtMYKm1tDQfoJE7qtnGolP/PjxFVg77fq
         5xMs5QI25x6gEIm3XFuEcWMszJG9yQevKkwn+5sX/ExsVW4WP4Dr0Y1tA2SfmtiBJzn9
         nf3ffz0e8MUGCqYzIFFYJ9wBurVaCVfIb5KTVdg92Q78Dg9FVwpDcE1SXKoZ5cjPvpaG
         4RbBlZ232fjJvWPqd4dLbs4DtXw+TyhLua2M/UBJz2S8ZUmpD4nUvk+zlZds2OZl3jMP
         hnnlDam2qiiAdupH28OzaHeFu/6/WTP2IeFMtX56J4NhIBUEFv/WX50ZLIpvN3wWt7Yk
         Nt6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790699385; x=1791304185;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5gmBRPrdCcT1/ykMZonXArmE29LxS0sCmqHY0q+fG44=;
        b=AeTfX6phWay17Hizu5YPEa4UUsdgECryWir4Wr90iVTJG8ojl4WhG2AO5Pnm9qqcBP
         20u7Y3E9vldydWF33/GlqIfdlELVzukPRY3NVuTgh5sc5u5Jw47DvEtkf4HzEQYLgZKV
         4M9kezZu9ZyKzD6J2KD9sbnuj4YLg/YJqTRL7+8vw8NmwzpNAP5mbw1wJtDRYoPq+Iwu
         D8fGpg39rJPX4s6GxtxlRvtZKplQEHUEy01d2zMoCDlxQuxLDCQu1y+rWKR/t4N4FsWz
         0Kly1ETv5YmmN4kCq9f8PlXleaxeSdCuhtRWC1lm/vQaSAr6LdxV/GJRCZWBTxydBgDw
         MRKg==
X-Forwarded-Encrypted: i=1; AKwUvBxUicEuV0hMZBC3/y/iPzGmYIEknXgWLsqTfIabddrrJcbmCM9lUVKWJamtp4eOU8z9pP+mOx1viYXz3Q==@lists.infradead.org
X-Gm-Message-State: AFq9FYIP0glUfbai9KtKvWUU1je9rIBSzhrMcypN255u5+EoHiO/th66
	1jPR3gIU/Sc3SBTEaMYNdvcLLv1NIk11YftmtdDxd0fsJ65ZoJEPZQlS
X-Gm-Gg: AYBFou3bOTUCqCjZk1hp6sK40auaKjmttoX5DZSO6qmFNr/qbGpVW8mkGOlQznh7nIi
	wxXNOgc2q7W2MRTJhP6rylwthWxdNGnD4Y50QfnSOJ/Ce1XsP7mVFp/lxJlxy1Uulw+5/v1E5Fu
	g8rl03QHRfLaIVtsZKphB28bKl3V8rgJ5XfhUZ5y0USrJJRZtTQAxpg++fiDVCbw6NskJf08VKs
	hsPj2PaO1VwwXgbZdbVib8CGvuklW8PRb5jo8yHSX10MezgnHP35q7GoTpX6Wv/idpZRdlvGIwG
	k8MFoQiEsgI1ymwUmgiFkmfi9uvf3HzoQlyJdwONiLCm5mgJ8Vw5dXHA5VTYojWJv0Pojpz4BoL
	7YZUyfEpim+j/2Fd0rNWogU5S1BGL39bfprs5l5Q70lRYqquuXvB4Ub4S/roNOgrA+Y/6bmQWrL
	gtHEreUGVQBt86vddQ6G2H1tRRHfTVlh3/CnCwRJh+fPzRl90cb9z/ZcjVl2PQTg7XuriktVJqz
	9yrceTmXXpMCaUm3RGEr22PqfNcFZ52+aQk/GkRgMVFfPTrkHGPCyiVJ5JptXdRRQu8ErTic4ci
	blQ=
X-Received: by 2002:a17:90b:4a89:b0:39e:6c69:34da with SMTP id 98e67ed59e1d1-3a098fc84eamr14040423a91.62.1790699385067;
        Tue, 29 Sep 2026 09:29:45 -0700 (PDT)
Received: from localhost ([153.61.198.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a498596aefsm7239381a91.6.2026.09.29.09.29.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 09:29:44 -0700 (PDT)
Date: Tue, 29 Sep 2026 16:29:43 +0000
Message-Id: <DLRXYC55FZOH.3CRQ4XBJ7K3CV@gmail.com>
Cc: "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>, "Kumar
 Kartikeya Dwivedi" <memxor@gmail.com>, "Martin KaFai Lau"
 <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "Puranjay Mohan" <puranjay@kernel.org>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Pu Lehui" <pulehui@huawei.com>
Subject: Re: [PATCH bpf-next 5/5] selftests/bpf: Update DENYLIST.riscv64
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Pu Lehui" <pulehui@huaweicloud.com>, =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?=
 <bjorn@kernel.org>, <bpf@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
In-Reply-To: <20260929083924.1851840-6-pulehui@huaweicloud.com>
References: <20260929083924.1851840-1-pulehui@huaweicloud.com> <20260929083924.1851840-6-pulehui@huaweicloud.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_092946_196586_5081206D 
X-CRM114-Status: UNSURE (   8.22  )
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

On Tue, Sep 29, 2026 at 08:39 AM Pu Lehui <pulehui@huaweicloud.com> wrote:
> diff --git a/tools/testing/selftests/bpf/DENYLIST.riscv64 b/tools/testing/selftests/bpf/DENYLIST.riscv64
> @@ -1,2 +1,4 @@
>  # riscv64 deny list for BPF CI and local vmtest
>  exceptions					# JIT does not support exceptions
> +probe_user					# kprobe hit in trap
> +stacktrace_build_id				# kprobe hit in trap

stacktrace_build_id is already in the generic DENYLIST.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
