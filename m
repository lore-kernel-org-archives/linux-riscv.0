Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3492C9832A
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 16:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Cc:
	To:From:Subject:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dn2nuIlS2WX0vsR/CO7upEciRgRnQINGwWr2wLCllzk=; b=C1u2xjkHUG5the
	Wad/AgjjhMo8Xl6N99Ht4XoRlfJkKO08KDlZYjNcG5lzIcH1+KeUzZOERf11+csp7jPaXBR8LJNUf
	+a/CrTmIw4K69u8UylFO1wOa04lO1zuGJjqjaNrA4zUsuLKPOIkWkLk+ex0eAoYg5EO7kXD1BysFw
	5vV57VZozIp9zIFjPTaNIjgxxaAHemrSVhdHOLtvNwUcxZB/eUc4C6PyyJ7myT0NNyFpPAeAm7RlQ
	JNyZfTHiJO0ux0JD4NnOXyWgSB/X2f4vakaB0HiOQfTLji52OM3X+4uvldCQT2E2HTJdxvjJI+GrG
	UBB2yx75YTKgKCrIypMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBahr-000000043Lz-0SS5;
	Tue, 29 Sep 2026 16:29:27 +0000
Received: from mail-pz2-x29.google.com ([2607:f8b0:4864:3b::29])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBaho-000000043LH-2rbm
	for linux-riscv@lists.infradead.org;
	Tue, 29 Sep 2026 16:29:26 +0000
Received: by mail-pz2-x29.google.com with SMTP id 41be03b00d2f7-cc7c9c2df74so217477a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2026 09:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790699364; x=1791304164; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NfII3LN3Gw72EP3w7593Da/fsSb/7y6Qp41qe4y8lCI=;
        b=REYtX8LhkL/3kJugu10Gh1JuRJH72GByA/saQC/1vAdKn2rUcHPR5O9bybg+Vi/QYc
         nUrEONOrxv6/RI46WeXfuGmIsc8lP4aUjEXLryJZEg+lM4RTvEIb4qlFE1vQjK6qQmPm
         1ulkn5Xbvrz3OadHbpuQ+XfuBq8z4lBad4FcazENsbns6budWcd06aA6QteBmEKatfUT
         wP2gKEbz0trgAsWVOYyJc75ygipPqB2UC48MrMVHXd4YIkIP3RQAQh6ov28YKzzxu5gw
         qJcK4Sj2UL6p857aMxHzLUTJwOMpkxb5WDppaKUJWUDANkC0Hptyvbg/FNqzgc7Wxzfk
         PbFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790699364; x=1791304164;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NfII3LN3Gw72EP3w7593Da/fsSb/7y6Qp41qe4y8lCI=;
        b=O8UQK62A0eMjx9CWE02JAbeqeL1IrpgJsC9WsaV/4MElspPa4YkI/PL/zQ+8iVMX7k
         bGw+ojAoJsljyd/0j+ksKH2Pg1TGSesB7p0YwSIuaGUxuxUmcbHqhmrbC4UyIuSiD9cY
         2nz8R5wH15aoMLk5m8pvPlk5dn2sejAecpPt7cUH1YVHM3K155Yhb0kjFETq/bj0SoRZ
         EgAS/8yvBnwlOICV0pd8UOSh+5wDDtMlTq83JP34q882dGn/1KWW+pDWYoWOBoVhLmhz
         CNJ9HlxdIUn03pjAOH3oizWXg3Prqug8+Vtn7o5ug6xXbcQrEvAJLHFuOVJdSBsDCPtD
         AgEQ==
X-Forwarded-Encrypted: i=1; AKwUvBx7JqSOaK2mes+ZP+r6Mc9poiBS/n2xy017c73YZ/Uly971FmVqxQ51T7i1AMuTcx+tA7xbjVSOlR265A==@lists.infradead.org
X-Gm-Message-State: AFq9FYIoDVqNwvWvSOBp4mfG9tKBHl7j1L5+wmEfiRF76dh11S4KxTzk
	nkMYS0cNCzLFP5qsRyj1uM88c0pD8eqyUpNTMXyU7AHOS6pum2acxo/t
X-Gm-Gg: AYBFou2u4hHEtR4wPG4KRKNOO8lYL3F8I1dBEaNv1LBFtg+97GW4MZHs9dhUQac0Rno
	TtxvcxB2+1NUSRkUVzaD3jyFyaxwQQyg/gnKOB7dGC1MkBJOCrIiaqQyO+HO6Tp/tnk0gHJJ5eL
	Tj7vj2ERHy6LTOG6g6tQrfYd+gf+aTr/aN2nBTy4oI9oHPhFJgYEuJeNIJvfTBqsBRwOPYEUdIf
	u3oIC4r6YYGT6mFWXZTzno/Ni5iftnbMEwavDmThgleHmSRmDvh36TGoPL8PxCw5sQPKJ/2sA6W
	M3dp/rIZU1BeS7pp/SJO8V+U1CHsyOweb3h2WNdXUvKI4/etuAKOUzdNYdHb69cQUMzYvHXS9Fj
	17WIA5lv+LFH+pFJYXU1ebsJris9yO63sotr8gIthjHFVHPH+3lRvYypu9YARUTk2KfZ/jwir9C
	OwRBrmtUXKAuoiWJX8iJKsBy1carLhxIapkQ39vC7G9X0wF4p8UOLS5GS1nc/Q0HowqZrfJ0ygE
	Lgz5PkfWmf18PHoo5uXHIudUDfRW7SKVKHCrksaobeI7YXN5c9tcp262WtNOorb1/0mAjZmfwYH
	nmw=
X-Received: by 2002:a17:90b:1a8b:b0:39e:3d38:7ef1 with SMTP id 98e67ed59e1d1-3a49c11ae64mr1853108a91.10.1790699363711;
        Tue, 29 Sep 2026 09:29:23 -0700 (PDT)
Received: from localhost ([153.61.198.251])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a497e90180sm7148752a91.2.2026.09.29.09.29.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 09:29:22 -0700 (PDT)
Date: Tue, 29 Sep 2026 16:29:22 +0000
Message-Id: <DLRXY2AQRPYP.1YQ75SL3XHQHN@gmail.com>
Subject: Re: [PATCH bpf-next 3/5] selftests/bpf: Use /tmp for temporary file
 in d_path
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Pu Lehui" <pulehui@huaweicloud.com>, =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?=
 <bjorn@kernel.org>, <bpf@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Cc: "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>, "Kumar
 Kartikeya Dwivedi" <memxor@gmail.com>, "Martin KaFai Lau"
 <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "Puranjay Mohan" <puranjay@kernel.org>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Pu Lehui" <pulehui@huawei.com>
In-Reply-To: <20260929083924.1851840-4-pulehui@huaweicloud.com>
References: <20260929083924.1851840-1-pulehui@huaweicloud.com> <20260929083924.1851840-4-pulehui@huaweicloud.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_092924_722636_70ED653E 
X-CRM114-Status: UNSURE (   8.97  )
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
> The failure occurs because the rootfs created by libbpf/ci [0] does not
> mount /dev/shm, causing temporary file creation under /dev/shm to fail.
>
> Let's switch to using /tmp instead to fix this issue.

This will break BPF CI.
The test was using /tmp up to v4 and was moved to /dev/shm in v5,
since /tmp is on 9p in BPF CI and 9p doesn't support fallocate. See
https://lore.kernel.org/all/20251206141210.3148-1-electronlsr@gmail.com/
vmtest's init mounts tmpfs at /dev/shm, /run and /mnt, but not at /tmp.
So fallocate() will return EOPNOTSUPP and d_path/check_mem_access
will fail on x86, arm64 and s390.

Mount tmpfs at /dev/shm in mkrootfs_tweak.sh like you did for /tmp in [1]
and drop this patch.

pw-bot: cr

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
