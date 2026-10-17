Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC559CCA463
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Oct 2026 04:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DQFPA8gVTF0JwUMU9fcjgcBoNYdKmhudnA7+lr79rHw=; b=xsefUSyxpCz+7x
	CDNZKH/5t0N3o1gcr9+dhDIg+a8yIYz5ZRE0L3avXfLk8JZfm7xoxam1R9Zfr6dk9xDBswOCjzS5h
	AfMMmnWb/lknpCxoU1PGpaF9UT52+VZhrAQ6OSxayNYKaluRme5Tqgl4RHCot0KnVWa/SRyT9Qoi6
	La2Wp8DnHL2/rDctsxPcqM1Tgh3BUP2gW0VvuyT15J1dbV7DRlCmEyNjqLWuuruKZPGEb5raet4EC
	b/IME0SP8+TTQJLXi1jw28lO6I+8wNTBairsJc2BvyuYT/TEsjVDeHZPg/7YUH7JIjAD4Nt2hEKpi
	tdEmO57FZo6/r5aH0X1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHwW2-00000004QjM-08VA;
	Sat, 17 Oct 2026 04:59:30 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHwVx-00000004Qio-2lvv
	for linux-riscv@lists.infradead.org;
	Sat, 17 Oct 2026 04:59:28 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-35c76e9614aso762481eec.0
        for <linux-riscv@lists.infradead.org>; Fri, 16 Oct 2026 21:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792213163; x=1792817963; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UnAk8G/A+hhdAdk7bHYU92K3ZOqNeCV2RRCOnYZL228=;
        b=Eov9+mAj8KtwabLGLizRVVbtStRKspNBwOSQkQysJvFs3oy/sA7F8SElqqXUCnhkDr
         aFzK+bPlQ5OP6CEVqmylrwKjq9P8nNPKOTAHV+Et5oe6G3p9waVNSwHCtoHpQcw+BE91
         zt6SCeOoQtr0dNKEOetGc7cq53uUd5HuzynKumiKGZQw3SklHfdo9mWP6uJLBxS3aTd1
         s9ABe6uxZFar/KMJJhp+O2ywLx6q4SZKe8NTlIaL9Q9aU3ixMzGn4tX+hPOxaoGA+A5g
         PL5MvVLQf/EctMduIKTBA/FB5PTJT5mO4Io/t5CcKitsK+R+HCCbBL3FFJtRIFt9qDts
         /9IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792213163; x=1792817963;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UnAk8G/A+hhdAdk7bHYU92K3ZOqNeCV2RRCOnYZL228=;
        b=IAIc+5ZBTuFUpIiJbG73gNvbTi0MaCuPxJ3jwQujTNOHjSzGW3+/SCjl1iSFAVNxAh
         S5TUomdGK3X9mI4mFhl6nWDJeDR3MEzg5/ceKl44+2f1u3sWxPpukQwhRah0ZeNY+rXZ
         Mz6+NsuScgEJu0y3W90PckSTY1rG0Vrth1sVYz9aljWScqkhx7ldLQ7sxgGRilJFYD7b
         I0/wFQ0slQVwSof4rl4W+mkQ/mwvfcOZO62JJb+mlBxUY5VGsDMe4I+Ca84BOX8bW7LF
         wczZc6IiCXmPcZzY/1PEbgPREHyqi1jL6NehyyrKdKelzS9khpfjcelqAqPnn61SOQxA
         BCLw==
X-Forwarded-Encrypted: i=1; AKwUvBzGvRqLilxt9HZRwRjS61q8ayfFUGdGyz7csbgHGcye96ywPUG5xuSrFuk5MUvar4V74tzEbna5/IDosA==@lists.infradead.org
X-Gm-Message-State: AFq9FYLDgDc8kOkwfLnnMCKa2dmB7PQoBBRhHxEojDi08lEEZy0LlYN8
	uHQjzHaCdpcrr8+H8D4LtKaD29pmzQoleJTQW5liC9l+A34JWBF2AZmx
X-Gm-Gg: AYBFou1cL6oTpj7gtCjTbLMLLu3E8+XS8fSTsG9J7ho39RQpGpKb3h5+g5BbWigenxR
	gb2H65w3YmltfjjhD/opCXqTkyapL8dAyeVoYaH6wmNDVnzUcJwRKnetYmHLOufEzz0sRMh5L3H
	sK7s/l7+JGxlxHlxw/fdpxo6E+lRR81IRIz/yFNRFoFy25RcmSf9qKoXQqZovkUju4O5TZIZ2Xe
	ID7jIPThfZsNFzwejCVX6HUOmr8Ji1oh8U8H5+FHDL6vSaTiP2Z0qlyIdNc0QAwiz2UtB0NjqPc
	SiAgAEfBeq8oXsqnMV0lBdJ9Th/MLbLgynKM1Xt1b/DHfftgOM/cd2qoHvD1A/0XvwdaYPJiEM1
	XN1zq5+uAfULyftAbmj1Skb85cLOCFWM1OkRrHnwlx6I/ouK1CQxh88qv5evv1PKP9pRxd2rH6G
	KhKF357HbvlDOKUZE6macsFX1ntIQjae7nGgxwRF/TX1KaZOb1Rhcu+I/uNzNoh+7XQx4yVv2D4
	VS2ZdH+YAHPIA5OxjsW7Yqyc2Z16iQeuw==
X-Received: by 2002:a05:7023:a4b:20b0:162:e05:e43f with SMTP id a92af1059eb24-18512b3e562mr2633163c88.23.1792213162960;
        Fri, 16 Oct 2026 21:59:22 -0700 (PDT)
Received: from blinky ([67.174.242.98])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-18314ef8ed8sm9893994c88.3.2026.10.16.21.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 21:59:22 -0700 (PDT)
Date: Fri, 16 Oct 2026 21:59:20 -0700
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Nam Cao <namcao@linutronix.de>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] riscv: misaligned: Fix
 fast_unaligned_access_speed_key init
Message-ID: <atMAqLb3itG3RFIN@blinky>
References: <cover.1780002199.git.namcao@linutronix.de>
 <2468816ceb433394099a00d7822f819745276b49.1780002199.git.namcao@linutronix.de>
 <179213417712.1857356.6461669805362228910.b4-review@b4>
 <87v7723v1n.fsf@yellow.woof>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87v7723v1n.fsf@yellow.woof>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_215925_724566_40A7CE5B 
X-CRM114-Status: UNSURE (   8.55  )
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

On Fri, Oct 16, 2026 at 10:32:20AM +0200, Nam Cao wrote:
> Charlie Jenkins <thecharlesjenkins@gmail.com> writes:
> > Thanks for the fix. Looks good but needs to be rebased (apologies for
> > the delay on the review).
> 
> It's already upstreamed ;)
> d585018a9258efed01514bae369ab3d4f21e7b1a

Oh good, I missed that somehow...

- Charlie

> 
> Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
