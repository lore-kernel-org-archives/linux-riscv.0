Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2B95CF45AF
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jan 2026 17:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2DUCnQM1WJLviNYyKJqy//u759KElvz0JF5AU7W1IME=; b=X5kBdoZBA+an2u
	JmNnVY7zBCG/3wpwonawkbCUMZJ+oNFlLwfj5GO1leMHmyZtDUy0NHLvbiFj7fgt0tfTRDoLZ8kX3
	sg/437JIdQMJEJ5erFRbLaNAhwiFpMC1KBddhBd5HTcPSWZXV5Rbm8wkRNOLhBXlJv3VSwGftx5NI
	dxXbhqgc3cwU0ZnLtXpJXDHNlgLCMroJkb7NWHLwLNs570nG0CCwHd/LcTV2IPR+YR2hX+2OPvdlX
	4S9My1FcJfhG2AMHs/pb6SGbT/Fvcwi1u0SmVun07ZGdAOrJlIeiPImSQCQb1ZYlWjk0YnKz1C+xI
	iXtvdIe+o6hPTOfQPXbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfLIk-00000005mTO-3Abl;
	Mon, 12 Jan 2026 17:01:58 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfLIi-00000005mOF-2tNa
	for linux-riscv@lists.infradead.org;
	Mon, 12 Jan 2026 17:01:57 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4775895d69cso33068245e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 12 Jan 2026 09:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768237314; x=1768842114; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lukVQ7KDZXgDePhwHjEBoVHZr7RkstS38svXbD+t2r0=;
        b=XvCdBNjfURI0ZprSp1ay/eJKTzcP4SDnj/NM5VZqty80KNgHki6J3bAy96z5Z7Zz3E
         /ozr5kzU0Oxy48ym6KA1+DxqgyDLjX9RZBDCVQT6imqcddoIKL3TeFkzFBQK3aYcJXjr
         sRvPns9zFhawRMwH8jB+exwNeVrxAlYhp6rBD8k5HrSAVTTp3U/WDVi5QK8nur4Sr4ur
         WWDi63EI1QvLJ2BVf7wku0UzgPg82Raoy7xweqmi6tV8oOTuzGD20fKAw51YEkp5zsK6
         ocHkjQFun5FtK1PrmkCBS0TNbM2z+GP05HWWer8SZok2uEtDOzXAbCoyExX8Ah1Dg6nT
         KmmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768237314; x=1768842114;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lukVQ7KDZXgDePhwHjEBoVHZr7RkstS38svXbD+t2r0=;
        b=K3odGC7wIXWOdy+U+nREF+gCJKTZmo8Qh39Q9/QVEmt3mn6DEXjuX40JcxJNsgykC6
         xM4/A8of7jgBkqslGes3umkkFt8ar68DsiR3hJzQhb6zqyAVI0kn8NVCswz4l2Rn2a3U
         fQTx35TLlx5yoCrHewPX+lF/37vb8vVqF2d5PdZfHWnwmbrMOVSwr//DUGI2SVh8gFit
         pz6w6zNbiAqgsJ+Uk4Z/mre45PW+dVC+N4n9D05J+ZXYMhIhRsxoitI8YP51TBpMTfwy
         oAx1G6//vI02oVPsF0yYdu5D8/cLgBR4ebre7+OXtDAO3+AQkx6P/WYEe3HlFUwVtHOR
         +weQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJBiE2l8BosWPpCkQhoZ1FAGcx48942xUDySAbMrUijKzqG+13tAXblo5ve61ONm90oSDaWpe2D+I8wA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwZv/nJ/0EhYF7CPUZI5HZ5aVJTSPakc4PVomYQqlhGlENmmbmv
	FQAB0O0zkrp2mpjmpSDWUChmvGVHIkeaoIiMqaLrwzoSSdsZQ6mTGlxE5TOkvSM34n5hZShYYxI
	cr/KeNEKfXnu/76k116O+f0sCLdFzHsg=
X-Gm-Gg: AY/fxX7+72lURhRjjlmebPIQdYQZIQFsHUvN9/19dQoETQ1wjTBHIWyLE2bqdHhAcAV
	LQgEAuES5lgg9OZrTKDN+Y6lIZ3HlypGca7K2I0GqF7R7kNqq6s8w3qW9v0Exhm0vY2NEe/inX8
	b1YNcETbK/1uj40KLepaemipJUUH+m0Rej2UJ531x7F2atsHpKdbKCW0qog2yd0RuK1A6Yb1Rol
	gVk1raoHHczMlATj/BKsNPknWHIjTUN3zAXlaBnf+mkjcTgmNwtcVdvl89gkBR2PEmTiwAJyDni
	gzuo7/u10ow=
X-Google-Smtp-Source: AGHT+IFvGRZzqyjHWJDJYgNsKv9Tbb8vJ0Z8L/ie3Mosac44Bzb7BJs1Zkq34W2OJET3bLfRZghsAl66EnWrpvcgaQw=
X-Received: by 2002:a05:600c:a04:b0:47d:5dae:73b1 with SMTP id
 5b1f17b1804b1-47d84b3b668mr237910895e9.23.1768237313950; Mon, 12 Jan 2026
 09:01:53 -0800 (PST)
MIME-Version: 1.0
References: <20251219142948.204312-1-dongml2@chinatelecom.cn> <6964d168.050a0220.57989.2241SMTPIN_ADDED_BROKEN@mx.google.com>
In-Reply-To: <6964d168.050a0220.57989.2241SMTPIN_ADDED_BROKEN@mx.google.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 12 Jan 2026 09:01:42 -0800
X-Gm-Features: AZwV_Qhc3LzN7Q_zg3hJWdrpRhvqt6NT_zOW9RTteSioPtIzHVqMW0n3FVX8wQI
Message-ID: <CAADnVQJwh7Eh=NF3Qj+fiLDXnk5Wn+VpuBDuPsTZjKWCiXPJjQ@mail.gmail.com>
Subject: Re: [PATCH bpf v2] riscv, bpf: fix incorrect usage of BPF_TRAMP_F_ORIG_STACK
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Menglong Dong <menglong8.dong@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Pu Lehui <pulehui@huawei.com>, Puranjay Mohan <puranjay@kernel.org>, pjw@kernel.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alex Ghiti <alex@ghiti.fr>, 
	bpf <bpf@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	LKML <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_090156_740320_46B78DF8 
X-CRM114-Status: UNSURE (   6.61  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBKYW4gMTIsIDIwMjYgYXQgMjo0OOKAr0FNIEFuZHJlYXMgU2Nod2FiIDxzY2h3YWJA
bGludXgtbTY4ay5vcmc+IHdyb3RlOgo+Cj4gSXQncyByYzUgYW5kIHRoaXMgaXMgc3RpbGwgbm90
IG1lcmdlZC4KCkl0IHdhcyBtZXJnZWQgd2Vla3MgYWdvLiBTaXR0aW5nIGluIHRoZSBicGYgdHJl
ZS4gSXQgd2lsbCBnZXQgdG8gTGludXMKdGhpcyB3ZWVrLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
