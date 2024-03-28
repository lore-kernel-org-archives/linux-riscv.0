Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D7D7CD11DF
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2024 19:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NesOi8bBXS5RUjr9IPS5s99rbNoH3eiQWaMbog82tSg=; b=DvG9ccxG4Zj3fT
	huUlh3i9EsBlvuM8MMzi3jtHO/FFd/nV2m82nQq8nQ2zuQPt8apKx1YhZFm3/qsVhAGeer8eeOycV
	XDJcDL8G7bgntpxMhNc8ot9PBWdPRTcVBcRnrk6L4rAetYwmVYaSH0sK2/GtOXDjZhACJU83hGvfx
	jgYqmMspPS36PXkJNHq7rrdLtCkNAsEBbK3x0fWWpaRMedU7Yt3NhuZ0O7jyZeAxEaSyUMaAIusEs
	+H/jKV0CuboS5jyKzQPJCdwfDCuYVfJC3vVxDoxor4h4n1ynHoDSWo1sj+CbUOAtk3vNPPtS2PsiV
	NGUgouoRXIZxm09szpiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpvWg-0000000FP7w-2OFC;
	Thu, 28 Mar 2024 19:35:02 +0000
Received: from fout4-smtp.messagingengine.com ([103.168.172.147])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpvWc-0000000FP4l-03kS
	for linux-riscv@lists.infradead.org;
	Thu, 28 Mar 2024 19:35:00 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfout.nyi.internal (Postfix) with ESMTP id 8E0EF1380073;
	Thu, 28 Mar 2024 15:34:53 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Thu, 28 Mar 2024 15:34:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1711654493; x=1711740893; bh=1wroJ6gxxD
	eLsMepRfJkcEGfQ+xzSMYnsCgYqPB17lg=; b=RprfkRrb4lqIie2zx95VsX0uSA
	tXwkUzQVzseArejgb0Q6q7S5h9svGYJnU53jnHsRy9tqgBqDtiF6dFxH27RRRt43
	jPpiNBtRTwMqTo5DIRgDRUf3wa0FJKcNAPFQE0vEelg2FjmcCubQsKuz+Nzc2e0g
	IDT/axyESPyX/cmZ2BzkRU+aB8e1NqF1/xskFOjYRxpkVXw3X+d33BXn2bLJoYPq
	p7ChI2r9jB89zQakTo9Y4/ucsCB8AnKVHqylPzmI76y9oLLNh2Eq3o3IwafWEtrB
	aFZBnQ+5Umhx9gTeaTld9LinH35/YgDR7BnA0ed2Gyp9XQ3Zg5qW8JTb7PnA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1711654493; x=1711740893; bh=1wroJ6gxxDeLsMepRfJkcEGfQ+xz
	SMYnsCgYqPB17lg=; b=AtPqO5pq3O71xO6KoCsopStmRibJz8M3+hmXJq5sFCe3
	Xlh9ZzmjugGZIENWlwEccYsEu0mNvSyTy1iYUGEr8AQDO32cFOycDyCZwElzUuZq
	uXOWaEfFCN698bH/Fc0+r2X/C4SwDYpdmY60Xpf40RCID7ga9ojGvojsxuVo2eeD
	R9xbwVqA6FthsOHJTCSH9s4I9PxdB9oUNJc8gwuICzErvHfookupC1vh2nzqs0h4
	HwThBwL2w/ljn8noyJXzYId4A/JigT9uqVTsMWpYFk7JoSqPfPct5XHnmJe9zRf0
	b6GjIHcVz6NtDbrxCbHCLt6Gj6SA2A0/lcS+R0II/g==
X-ME-Sender: <xms:XMYFZvXOjUEGtnpA8XzCxMC43uUDZSFlPUSxpiYOj_TooUWPx4Zrjw>
    <xme:XMYFZnlYI9my23lE7rICO0ngkE2vU6YgDghotGjd_7NikrG3dbDBBiJCW1y637Mxi
    qC73eHWm92gpIiN1g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudduledguddviecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdfu
    thgvfhgrnhcuqfdktfgvrghrfdcuoehsohhrvggrrhesfhgrshhtmhgrihhlrdgtohhmqe
    enucggtffrrghtthgvrhhnpeejueehgedtueetgefhheejjeeigffhieefjeehuddvueeg
    tdfhheevgfeggfektdenucffohhmrghinhepihhnfhhrrgguvggrugdrohhrghenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsohhrvggrrhes
    fhgrshhtmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:XMYFZra5dar7f5APnXX6SzlwCPDUbMVtWUev97Y14pSvGW9Q_1Mkng>
    <xmx:XMYFZqUCpaU983LCXMujiM8VyMCRwC94XpA5B8UC60vlOVgb1hDw_g>
    <xmx:XMYFZpkiAooXC84y8E5rVCnVKubZo9Zgm_7AYNp7HD_LtTih72O_1g>
    <xmx:XMYFZnfN8MG3jzc1XVwjlUsEE2dC0zp16KyDmRqNhILN9E842ZpULw>
    <xmx:XcYFZpEDIvVHwGqtCqHR7VUu9aptWV4uJNyoXcuVhraZ-ZzKfsfDEw>
Feedback-ID: i84414492:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 6D5391700093; Thu, 28 Mar 2024 15:34:52 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-333-gbfea15422e-fm-20240327.001-gbfea1542
MIME-Version: 1.0
Message-Id: <3ed9fe94-2610-41eb-8a00-a9f37fcf2b1a@app.fastmail.com>
In-Reply-To: <20240328124916.293173-3-pulehui@huaweicloud.com>
References: <20240328124916.293173-1-pulehui@huaweicloud.com>
 <20240328124916.293173-3-pulehui@huaweicloud.com>
Date: Thu, 28 Mar 2024 15:34:31 -0400
From: "Stefan O'Rear" <sorear@fastmail.com>
To: "Pu Lehui" <pulehui@huaweicloud.com>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org
Cc: =?UTF-8?Q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>,
 "Alexei Starovoitov" <ast@kernel.org>,
 "Daniel Borkmann" <daniel@iogearbox.net>,
 "Andrii Nakryiko" <andrii@kernel.org>,
 "Martin KaFai Lau" <martin.lau@linux.dev>,
 "Eduard Zingerman" <eddyz87@gmail.com>, "Song Liu" <song@kernel.org>,
 "Yonghong Song" <yhs@fb.com>, "John Fastabend" <john.fastabend@gmail.com>,
 "KP Singh" <kpsingh@kernel.org>, "Stanislav Fomichev" <sdf@google.com>,
 "Hao Luo" <haoluo@google.com>, "Jiri Olsa" <jolsa@kernel.org>,
 "Mykola Lysenko" <mykolal@fb.com>, "Manu Bretelle" <chantr4@gmail.com>,
 "Pu Lehui" <pulehui@huawei.com>
Subject: Re: [PATCH bpf-next 2/5] riscv, bpf: Relax restrictions on Zbb instructions
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_123458_869367_35785D7D 
X-CRM114-Status: GOOD (  16.70  )
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

On Thu, Mar 28, 2024, at 8:49 AM, Pu Lehui wrote:
> From: Pu Lehui <pulehui@huawei.com>
>
> This patch relaxes the restrictions on the Zbb instructions. The hardware
> is capable of recognizing the Zbb instructions independently, eliminating
> the need for reliance on kernel compile configurations.

This doesn't make sense to me.

RISCV_ISA_ZBB is defined as:

           Adds support to dynamically detect the presence of the ZBB
           extension (basic bit manipulation) and enable its usage.

In other words, RISCV_ISA_ZBB=n should disable everything that attempts
to detect Zbb at runtime. It is mostly relevant for code size reduction,
which is relevant for BPF since if RISCV_ISA_ZBB=n all rvzbb_enabled()
checks can be constant-folded.

If BPF needs to become an exception (why?), this should be mentioned in
Kconfig.

-s

> Signed-off-by: Pu Lehui <pulehui@huawei.com>
> ---
>  arch/riscv/net/bpf_jit.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/net/bpf_jit.h b/arch/riscv/net/bpf_jit.h
> index 5fc374ed98ea..bcf109b88df5 100644
> --- a/arch/riscv/net/bpf_jit.h
> +++ b/arch/riscv/net/bpf_jit.h
> @@ -20,7 +20,7 @@ static inline bool rvc_enabled(void)
> 
>  static inline bool rvzbb_enabled(void)
>  {
> -	return IS_ENABLED(CONFIG_RISCV_ISA_ZBB) && 
> riscv_has_extension_likely(RISCV_ISA_EXT_ZBB);
> +	return riscv_has_extension_likely(RISCV_ISA_EXT_ZBB);
>  }
> 
>  enum {
> -- 
> 2.34.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
