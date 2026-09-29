Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7923AC9832A
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 16:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:To:
	From:Subject:Cc:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zi8UX6w/homp7nTdUXDtoyFpKoapzkoDZO++fJT014A=; b=ev8/vlhde9QkHa
	Z4kacxXJpz4ONFiEXJULuO//sOeMc/YVw3MSDJNCmP67MoSQTi7Js5248qTgM8bJYIZ5Z4lQd8K0t
	tvc5bcvDI0ZBGeYP58CZkT/BTtzw5KYtigPfXPqS50uArPhRlFfwKpZjbO0r2eCcPRKiBG2VKFbhU
	q7YezJ2sLpG46FKd0YG8T5DLiSNGcjygBj6Euawxj6GNBcYbnzWQLlfXUdsrkPbrAEdeDk24LYO71
	hh3wHNzLDjOg6x3Ublm0FXOgpvY9VC1g2fmAYmQLViL/e8+ZO3qoPklwbOh+RfXHWjXUbQr9Kviy4
	N7U81CQZcW1aij/teaTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBagw-0000000436B-3NW6;
	Tue, 29 Sep 2026 16:28:30 +0000
Received: from mail-pz2-x0c.google.com ([2607:f8b0:4864:3b::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBagu-0000000434i-1tto
	for linux-riscv@lists.infradead.org;
	Tue, 29 Sep 2026 16:28:29 +0000
Received: by mail-pz2-x0c.google.com with SMTP id d2e1a72fcca58-8804b59404aso2141432b3a.3
        for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2026 09:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790699307; x=1791304107; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xNj28skhAXgmnVsiwfcuNW6CLgzTKZ1pXWol9Jpkmuk=;
        b=FiVTXfcQCZa9CAX22BuQXiBUszCM9u/1bze9cKrom6FzQH50S/Iw4zBWkfXE/m1FqN
         Lxcsmxz8fBqZU5iRk4IKZh2JP+FEaoOoZ89FbRLfacO3FNehXOdlkUZ/hMn+NY1PpTAk
         WlMnuM5Z8JnIfbnSV/a0Qoe9CKWyG2f0SBO+HwCWvtZdgE3lLqu4O4j9q0Bj7klvaA59
         7RqSt88596yEi+Y5qgX4f0mX2GW44xUZfOA1QLfUTWXJU0MmNYtCccsO6loksuJH9fMI
         n3+JjnRjBHDnCrSuvWDCMOwghSKa8recBCrJrrcE55xpfdgD7A6UL6vhxsOobqHIpSHa
         HGJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790699307; x=1791304107;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xNj28skhAXgmnVsiwfcuNW6CLgzTKZ1pXWol9Jpkmuk=;
        b=ufWRPtcuCaR1sJoodVgJlXtMi33pIuCsPByQNLMXCKZJCZf/DJsv16mJUbI2RGEz1U
         0YMQSXb6iVnI1E6VE1mZUHL2WHIAo8THiX3PDJQpathTQ1nMddLP5YfxzoBsFL+ni/Gs
         dN7dmwS0vrN5gZ8UCpytppcVjw29LSCFWwJxIp3N/H2D9rhDG/tpCk9TyxTFuFnYqo8n
         9C5t0lhumjfmGL33KWhQOmwGt6kjkN7oFGaoBpAkNUKhq5grXCG0geQoZJGCHC6Y4G5O
         WCbtZBi0BvjQU+J/c5nXgwZ4UW5RtMOR9j/FxezRCSuSobsnU7yHVKHncHnKowqHVNpA
         SyjQ==
X-Forwarded-Encrypted: i=1; AKwUvBxI05Y10TU+y9Uh0jFq/wgL+32xVUO28RIodHI0HtI0kqNpYKyMUgKNN/Z3EdzDl8rZwr4Vx+jIEBcMGg==@lists.infradead.org
X-Gm-Message-State: AFuF++mR6ks5c1wA0CP1b1sgl4tKpJFpTyXVM5XwZyqLr5B3FHL2EUuk
	DN1oSNeMc+EnB8yApb8YpbN4sptQfKPxltywKjEpFku9/urdjFXvp/Xa
X-Gm-Gg: AYBFou2e8uLi19i42x/U2nibR1Y3JooD94vDOdb4sEm1wigorT/dvPo/3JwR+Xx4Ti+
	xtTEOSoIz7f3MEIN2ifQrnengJjhamlc0Xg6wlw9LiJ/FMg/O6X6YDKXcSiem2n8d/mBuZv3P+E
	864htx4TI8O7x783aNW8Sq21NpSCYLHMLpgxXONADZzK1FiRkrEk1DyHLwQvVnwKDxRk9dKIy4D
	pIgCNpSBY61XV1dUJayJpYpT6W9eCAIBzpXdUgMMxVfTYXwFpAM0NL8zgqXhCNwJ+UxC1557WjM
	CVE9rLu9MYwYXUOyA6wYtUsQbjP+7UrCKwQL8fUxZCByXJAKsjm0i78D+z4Nwc2175k3Sc3CuVL
	bgxf2OKjtsvwE+lAQ8UKxKZcf+o9r0/g5Z9rqASjFwsAFCnCjnzc18RS0NtTeZ7a1+jQB3Qefoy
	AjgCWb5HuKxClmlasg6kmbpP2vc8vw+V1mjLom57hyEtFb5yDMcStpaMWYF9mYbRlZjrHQAXE2V
	YTVsnpp4XWZugAS71OgqU+0fcV88O/DOOpjvGMEG3crZoPTDZ9j0AGxbXDuCUK2Q8sO8WQlbsmj
	7js=
X-Received: by 2002:a05:6a00:2356:b0:882:6993:25b5 with SMTP id d2e1a72fcca58-8826993339amr6934341b3a.27.1790699307008;
        Tue, 29 Sep 2026 09:28:27 -0700 (PDT)
Received: from localhost ([153.61.198.255])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88685653bacsm276787b3a.0.2026.09.29.09.28.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 09:28:25 -0700 (PDT)
Date: Tue, 29 Sep 2026 16:28:25 +0000
Message-Id: <DLRXXC72E2CS.2MRXIPM0KME7Q@gmail.com>
Cc: "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>, "Kumar
 Kartikeya Dwivedi" <memxor@gmail.com>, "Martin KaFai Lau"
 <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "Puranjay Mohan" <puranjay@kernel.org>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Pu Lehui" <pulehui@huawei.com>
Subject: Re: [PATCH bpf-next 1/5] bpf, riscv: Fix stack-passed arguments for
 indirect trampolines
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Pu Lehui" <pulehui@huaweicloud.com>, =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?=
 <bjorn@kernel.org>, <bpf@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
In-Reply-To: <20260929083924.1851840-2-pulehui@huaweicloud.com>
References: <20260929083924.1851840-1-pulehui@huaweicloud.com> <20260929083924.1851840-2-pulehui@huaweicloud.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_092828_497112_7ED5F68D 
X-CRM114-Status: UNSURE (   6.17  )
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
> Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
> Reviewed-by: Pu Lehui <pulehui@huawei.com>

You're sending Kumar's patch, so it needs your SOB.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
