Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F9EC77B7A
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 07:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7cAjtsxVLc5HmEtOdt7yLKNfRlutEo7DTAiNhtwaavc=; b=S0KmIMTIem11LJ
	ZhFnosk25uv4CEMOnA95KlJuAaoNunZUSElSZGYZ/ZR8J4zekoH+dSjLvQCWyifwQv5Jnh7jiF8Dh
	vtOMqh8scixQdm/RoFos5euyfyc3nolF9r2894xcIGBsO2NyYYxo7O51Rbqe2JpRYzt2k5x+KPxXJ
	e5LdUlySj4/HXYmVbKb0ku5pJIV13laL7nMsP4FfrGFv5A9ngOEN2eqT4iPkjnfr5VdmE+v0CMtAP
	Ijr/3JFQ10gmyE7atLE8swUTBh/H6uNPx9BxsMj7SWyZdXWVk5/kq+3qbvZMqIGmLah16Bs73byUK
	yHxWSWydVtVLrDjADJbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6REX-000Y64-0r;
	Tue, 06 Jun 2023 07:36:01 +0000
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6REU-000Y43-1b
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jun 2023 07:35:59 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 129EA5C00CC;
	Tue,  6 Jun 2023 03:35:49 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Tue, 06 Jun 2023 03:35:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1686036949; x=1686123349; bh=JP
	6R94uQbzQBfUBBvYz80fUZWf0TL/O0HNFiOYoH0g8=; b=VzA/5wvw+R/Q0vEigx
	C6bAunIc1d6yzEraxrGySxrM2Id2FfJbsuAgHJIWW7cxm+dvWvB+5urBCTuP/aCt
	oBtRxJh+nBd0aERvmDnApWrYKp9f+vx1onw2ekLHupDXSbY1FoeS1M0XW1vntoYb
	QILd8QYJa+0e2BlpOuwrHwouhgh8HewOcxOwEZjxWf43hJtvhpcbUDhizkUiqr4W
	6XPiIvx3fOWe63trfROGA4YOvcPc4PFY6vjuSb6FTWqBJaD4F5DlISMf4dvrOHKp
	CN3YJvGMiM1ktsW/dO7PZ+kK5QPvg8i7+CdDMH53oVygrDLDsIx+HdbQ9crCMRnD
	RdxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1686036949; x=1686123349; bh=JP6R94uQbzQBf
	UBBvYz80fUZWf0TL/O0HNFiOYoH0g8=; b=NJZ/bUauyn6r9C2HniX6H8c+cfhTz
	zWalf2888DaLopnoz27/2Bhayjh1J7fAqLRxel8pdEoGtvN74uqeJskTSRP+PjKx
	1ACNlag3qsQY4TwYXeJOX+b6caxIE6GXgCvw4UocZ0dAj8RKictsabo9jR4oKDSb
	1kPRfEvSld4q463ZukNMi2EZc6nMf5UK3T0Fo1KnhqbzjaBEyZKdIbUbcpwUoKGw
	O2+xz/3sKW1RDpfi5te+Ln8XeCEquZEZYHke4XoS6cJg+aDrbTXLBxYVcKZsKBGE
	d4uBpzsPSLmAiOa9419nOpkYnrH3vHZog8Nh8bztyXiKFPz58qOvk7IWQ==
X-ME-Sender: <xms:1OF-ZKt9FM-Vh1KjIFQye05jUJr2DB9M0kJ3xkz2GOCM6xJIrEKTNA>
    <xme:1OF-ZPc_OwDlWmBUK1wtW1BsCPhNvqwQxqXM5bja4oepM_sVkE4bblHJ4TNFnAUFe
    l8u3RWEGfH9F8vJeIQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgedttddguddvtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeevhfffledtgeehfeffhfdtgedvheejtdfgkeeuvefgudffteettdekkeeu
    feehudenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:1OF-ZFx-xnV4OSZPeRQwP67_ZNCCCObOLZBge6a0A-hiiSGnA4RcPA>
    <xmx:1OF-ZFPhvQTI52yGaUY8KdiJAuK1kW_ejI79kv0KPVwIzhhHHWtTaA>
    <xmx:1OF-ZK9GEYwyjb3dy3bwc6Lir3zhwym7NWTiTM4_J37LyQs2LkUklw>
    <xmx:1eF-ZBZ6vCszYkLrJswcZcm_k0XMuUbT_z6z-oydrUerYNiK6XLS_w>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 5175CB60086; Tue,  6 Jun 2023 03:35:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-447-ge2460e13b3-fm-20230525.001-ge2460e13
Mime-Version: 1.0
Message-Id: <4fcdd08c-e6fb-40b7-9f2b-77f96e798b37@app.fastmail.com>
In-Reply-To: <f2776eb566b8cf2409d2c21f83ebf85ab92d2f09.1685780412.git.falcon@tinylab.org>
References: <cover.1685780412.git.falcon@tinylab.org>
 <f2776eb566b8cf2409d2c21f83ebf85ab92d2f09.1685780412.git.falcon@tinylab.org>
Date: Tue, 06 Jun 2023 09:35:27 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Zhangjin Wu" <falcon@tinylab.org>, "Willy Tarreau" <w@1wt.eu>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-riscv@lists.infradead.org,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas@t-8ch.de>
Subject: Re: [PATCH v3 1/3] tools/nolibc: fix up #error compile failures with -ENOSYS
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_003558_622115_7191B71B 
X-CRM114-Status: GOOD (  12.75  )
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

On Sat, Jun 3, 2023, at 11:01, Zhangjin Wu wrote:
>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Link: 
> https://lore.kernel.org/linux-riscv/5e7d2adf-e96f-41ca-a4c6-5c87a25d4c9c@app.fastmail.com/
> Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
> ---
>  tools/include/nolibc/sys.h | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
> index 856249a11890..78c86f124335 100644
> --- a/tools/include/nolibc/sys.h
> +++ b/tools/include/nolibc/sys.h
> @@ -124,7 +124,7 @@ int sys_chmod(const char *path, mode_t mode)
>  #elif defined(__NR_chmod)
>  	return my_syscall2(__NR_chmod, path, mode);
>  #else
> -#error Neither __NR_fchmodat nor __NR_chmod defined, cannot implement 
> sys_chmod()
> +	return -ENOSYS;
>  #endif
>  }

I think the most logical would be to have each syscall (chmod,
fchmodat, ...) have its own function that returns -ENOSYS if
that is not defined, and have the logic that decides which one
to use as a separate function.

This patch is a step in that direction though, so I think that's
totally fine.

     Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
