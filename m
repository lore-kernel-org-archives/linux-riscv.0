Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F56FCCFA0D
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Nov 2025 01:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dRVKFixkgxAxc2WAJnefGT0QfMbUMOF46oZg9sGJerw=; b=QVqY5mzqc6770t
	m6kFqZQbaRZ57zA8AWr0PN+F2EwknJuOvq7diubM+MvzT/wE+pcu8+9QoHKudg9qrIApLSm1GX0gA
	dHPdrsNjSfPM+kr11lVlIjOFX3Hyx+cg1ymIkT9Is/VbyZk/X5r2hJsZRIrTU7B7w0jFUHHTlDzFv
	nbZVrIg+m3QBxJ9QapDYBC31vsbNTcqNfOSRXM21LghnhdjgFQ6V4mAryWcKatvEtMp4Miy0WGK6b
	YQa0MfndMouIJxFmhlwAa4gg0QrCRuDfZfXmbZsJ1D96zvzHI9Yw6bQ8SJLYiuMYEy9D4LX0/HQLT
	L//D8iIiI8K0/pLktFuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGoNQ-0000000Efm9-1IE7;
	Thu, 06 Nov 2025 01:01:24 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGoNM-0000000EfkZ-2VCB
	for linux-riscv@lists.infradead.org;
	Thu, 06 Nov 2025 01:01:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1762390822;
	bh=3kT/wXXpOECHC7SoUGMt7kZX+LFSbhnovtqEAlsizPY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=N1RHxR5VgrwIuATZpZeh0hUZQJPYuvxXvoCLicfLJhle2/ECrTHKJU0rjbJ3DqBcm
	 suwKGnx/n1O/s0YTgSDpL1T5WBX6In7PkQxfMdXmKCrVLiThAu4pvFXdHE7fc+iRR4
	 aexziE0V1pju3QYuLrqzoZLbid7rrbcm3mFbo3lo=
X-QQ-mid: zesmtpsz4t1762390815t94e38ff7
X-QQ-Originating-IP: jh7uI1plMvRhjrULDkiB/2I1zCGQl9LYTt+0qWnurlM=
Received: from = ( [183.48.244.176])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 06 Nov 2025 09:00:13 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5046835240228934872
EX-QQ-RecipientCnt: 9
Date: Thu, 6 Nov 2025 09:00:13 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v4] i2c: spacemit: introduce pio for k1
Message-ID: <723F1D1C8151FC6E+aQvzHbueB3FgfaU7@kernel.org>
References: <20251009-k1-i2c-atomic-v4-1-a89367870286@linux.spacemit.com>
 <aQvP4HVcpX-MDZBJ@aurel32.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aQvP4HVcpX-MDZBJ@aurel32.net>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NqDbsGEQdAdVWmRY0+uVZ1oy2a7MxfPjSr0Bqs2Ob3JkfXtg8+ca7AJZ
	PiBCOvKObdKuIytqdC7OM0UWEFuT5Zst37ZDa2GHWR0dEutKgVBNWHkMZeFQkw/opEVyBRk
	W4yXRJTr9dW7fNL5XSyylS/71ZyARQrzdELIYMXaVX9uJzUQRBexWzSeHrmV4wwEYBNXPLB
	KMi9bEzd+zZiKEeGy0+XYEHruag9e2YNbWd0XTbtNQSLDJQpobezJAOWx9wj3ssLlBY2d6u
	uK0FGpfCwcB5CKKfb9orvdWXHcG/qT9GqB2ILzpQqLKi/BJjzSysX4CC0NpvfiU7hhKlo3P
	EUpbhjbuSh72UUicnuSM7QMHrpto155/nU5lDz59HkS+X36luCrVqbgDclLmvaTlNov2QIv
	KzbE4NMe2joRDd+i5Skh8b2WQIp+tEmZBJqTd4B8fOPhROtXuJWYF5iNd6WXoIUmPInSWIi
	ZSsu3UaGKzU+Q3rD5UoKHwaGcyfC4sJy9XJBo6T2rHAP/QJdhcfbqNUPTFWXAvP11WdowQW
	xpBcluaSA7R5JNV6IwfGtOr/jeTrA3endI4QgR5MJFlXfjriuQCayHZjKXk/dVfwDpbxcNK
	BDpF7oEQLmmwZaYjJy0fHegpTMppyHv3wCnM4cws5iZaZPTnUN9VLm7YIbxmaidQA1GpLD7
	t8zJq0WJRRMmmIyWXqcegJgx/+HTV6az1X02EdWPRF69VyFqzqvuXgjgfFwSEjVpW/UuxSq
	hH0WsWeCeKdd/OZX2jYHgM2nFjtDb9SY8UHqUk3/r6yf3IvfggqzJxI+UBm6Co6bLRmOeGE
	nIG1qUF9uthzPFNtj0pgdGlLxS+EMGwq3yZxuwnX4K5mx1wy9M5vL+T8s0NBGcUePWWh0SI
	xvJWi/1N3Qx05psgI9Iu0vU4kHblet5WGKvlon01nrHYx2j2XBgyZBNtee1fSlqS98YW8Rr
	KCW6Jl9VASmVNF4T5GznHczR7aguCHu/JZ2B0Uah4pAWJkK5y0a8i4tUkn5ewyLtotIOQ4x
	y+AVLoqdrLAGMRpQav3G9vlpoydBYnIqKhlbiUfwM8XUafnzKtt7ZDmhjcSODEVmGp2djLr
	Upggly6TeL1
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_170121_315006_63BF9EEE 
X-CRM114-Status: GOOD (  10.70  )
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

On Wed, Nov 05, 2025 at 11:29:52PM +0100, Aurelien Jarno wrote:
> Hi,
> 
> On 2025-10-09 17:59, Troy Mitchell wrote:
> > This patch introduces I2C PIO functionality for the Spacemit K1 SoC,
> > enabling the use of I2C in atomic context.
> > 
> > Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
[...]
> > +static void spacemit_i2c_err_check(struct spacemit_i2c_dev *i2c);
> > +static void spacemit_i2c_handle_state(struct spacemit_i2c_dev *i2c);
> > +
> 
> At least for spacemit_i2c_err_check, the forward declaration can be 
> avoided by moving code, which is anyway probably better done in a 
> separate patch.
Maybe I'll handle it later.
> 
> Besides this nitpick, this sounds good, so:
> 
> Tested-by: Aurelien Jarno <aurelien@aurel32.net>
> Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>
Thanks!
> 
> Regards
> Aurelien
> 
> -- 
> Aurelien Jarno                          GPG: 4096R/1DDD8C9B
> aurelien@aurel32.net                     http://aurel32.net
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
