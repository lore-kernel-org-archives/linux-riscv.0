Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F82BC54EE9
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Sep 2022 04:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2fazou3bMd0ZHPy7UcorAg4DieUNBRfwXz2pro5I/eU=; b=NfFH6eq2qGZQ1f
	dvA8Bdf2wXSRMUwPlwgaA1HC/csWXogqiNK9SdcTqnqSqodh6AgK9qLqUbQuZdlvcM7wQ5dTvQYOr
	oIAMgVWqSbrIxxCuQNcUIywRwThzzyeLD1WPfyMBxP94cr6yPxAsC13PE8be72YqIpuyDBUXZTFbF
	LvrncGdaql1P7UeBwi+3EBFcqWFE3HLjxvYWXNTrprwN05SqobIc/LHG9taEwiN2r20+AUy3qM80R
	o52WBrC6XaKI+RcaE8tHa+d21ngyoFZO8fHDInwEYXfNmZRspmJEEn7XsZx70u+HhVUxnbP2vnaLE
	LO5fBlyGseIS7ae33E9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obDkH-00DK3h-56; Thu, 22 Sep 2022 04:23:29 +0000
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obDkD-00DK2I-M8
	for linux-riscv@lists.infradead.org; Thu, 22 Sep 2022 04:23:27 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailnew.west.internal (Postfix) with ESMTP id E81462B0598E;
	Thu, 22 Sep 2022 00:23:17 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Thu, 22 Sep 2022 00:23:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1663820597; x=
	1663827797; bh=OigcnZP430TIrgw/nzWxgq51e17a3yV3NjehKTHl2U8=; b=P
	0v29TFZCnIaJ7qc+NasbX4Ey+WXDCTrA0TTGxzjkVkdY1mp3xqYT/mskqRxUcffW
	TazKr94OLnz6KlMmiDuGVZe9GQsCfV24HLDJRW+q6Rhb9T8W2ebh9bkIJ+rK7TUR
	2XK9pZWdKlPd05R9tYNAbDqzHwX1gfS/rhY0tmEKZFXI0xD9SPpRcnZIRX5vEtUM
	ibIINIFFej6zmtOklzJHLoDXsRKzG4hUE76xpf8XsyQMQK9wnjyPLif/zEmiDoNT
	QQS5ZR4wMFIzKwpEG+fl6MQ9JZc65wHdgXQ57/hV/y6KLBsN1eT5PuSNszkTJ3wp
	XMfL0kRLVBG2LvMh0X1fQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1663820597; x=
	1663827797; bh=OigcnZP430TIrgw/nzWxgq51e17a3yV3NjehKTHl2U8=; b=h
	EN6jCwKlLnqDOStufdJkCilCTJtpEKLjPjdGqgTZAsRmQXYMLTDKNADvPCjgSNfp
	+bXSRqi+D4xYJNFAyrBO2uqnW7bIxt9/wuTRLgGnd+JOHdiqSxi1ajQxNCaLl2Ih
	oTyt0osaZrIjiYaHxBcy5/abV/MVuIMDJJ11Di7nhYBG3No1v/zend03nB2RMDmR
	IC1XgAnOjmRaT+hom0eJWgYS1NKLhDrkn9tsatJqRW1+zkI22lsognHuYEM7/06o
	/rcBwzlYnrDhoAzdrcrEAHBM0eNNkPIEUEXdNvcu/+Npg+rrDpXAScCTUxyThEXM
	dqCxQ6ythqBeX1U1KITBg==
X-ME-Sender: <xms:NOMrY6bo-jOIEXyCT-eKBq-x1B_Lx7sdpYtuhbNdtYwu80KR0Bta5w>
    <xme:NOMrY9ZO2ENp8dQsYMt6xLgG4xGmFjOHcdrv17UWvBVb1hJZkjvX9HOOmf-9n5CpT
    _aZZzwiiFqQ19t2ZQ>
X-ME-Received: <xmr:NOMrY08tlnKzW4syyaF0MDFd05r3kuzJEz3Xx7xig5qAu4tgUzGb69KXCe20_fJxFtYZQzzT3LUgorQRYwCSmWz4GQNlAqtxF3Ai6fY5QhoYuaKNl-sJYhwc_g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeefvddgkedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtfeejnecuhfhrohhmpefurghm
    uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
    ggtffrrghtthgvrhhnpeekjeelleefiedthfdtgfekgeehudefudeugeffvdfhudekleel
    fedtteejhedutdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:NOMrY8qwXUIJKVA5nogmgBykhnNUtIqRcDLCQ3Z3XM7G2cRXxBRIOA>
    <xmx:NOMrY1qGNdE4cx8T0dYO-hkK_OmxsUtRHVx933NaQUhuiRQUpyItQw>
    <xmx:NOMrY6SsXZLbDq4nVpIUg8LjADZR_hkQG3bp1d7wtb70KfYOscx1fQ>
    <xmx:NeMrY_biQAkQrdXq6J8kaJ9E7QhTa3P3t89ZEAm945kFTX2I67bSApEnC2E>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Sep 2022 00:23:15 -0400 (EDT)
Message-ID: <a91e3e67-d077-050c-48a3-1466c2deb7c4@sholland.org>
Date: Wed, 21 Sep 2022 23:23:14 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v12 05/17] riscv: Add has_vector/riscv_vsize to save
 vector features.
Content-Language: en-US
To: Chris Stillson <stillson@rivosinc.com>
Cc: Greentime Hu <greentime.hu@sifive.com>, Guo Ren
 <guoren@linux.alibaba.com>, Vincent Chen <vincent.chen@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <keescook@chromium.org>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 Oleg Nesterov <oleg@redhat.com>, Guo Ren <guoren@kernel.org>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alexandre Ghiti <alexandre.ghiti@canonical.com>,
 Arnd Bergmann <arnd@arndb.de>, Heiko Stuebner <heiko@sntech.de>,
 Jisheng Zhang <jszhang@kernel.org>, Dao Lu <daolu@rivosinc.com>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Ruinland Tsai <ruinland.tsai@sifive.com>,
 Han-Kuan Chen <hankuan.chen@sifive.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220921214439.1491510-1-stillson@rivosinc.com>
 <20220921214439.1491510-5-stillson@rivosinc.com>
From: Samuel Holland <samuel@sholland.org>
In-Reply-To: <20220921214439.1491510-5-stillson@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_212326_242338_B02ECC09 
X-CRM114-Status: GOOD (  12.72  )
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

On 9/21/22 16:43, Chris Stillson wrote:
> From: Greentime Hu <greentime.hu@sifive.com>
> 
> This patch is used to detect vector support status of CPU and use
> riscv_vsize to save the size of all the vector registers. It assumes
> all harts has the same capabilities in SMP system.
> 
> [guoren@linux.alibaba.com: add has_vector checking]
> Co-developed-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> ---
>  arch/riscv/include/asm/vector.h | 14 +++++
>  arch/riscv/kernel/cpufeature.c  | 19 +++++++
>  arch/riscv/kernel/riscv_ksyms.c |  6 +++
>  arch/riscv/kernel/vector.S      | 93 +++++++++++++++++++++++++++++++++

This file is not added to the Makefile until patch 8.

>  4 files changed, 132 insertions(+)
>  create mode 100644 arch/riscv/include/asm/vector.h
>  create mode 100644 arch/riscv/kernel/vector.S


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
