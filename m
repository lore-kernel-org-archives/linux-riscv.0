Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05362C5DF88
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Aug 2026 12:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rXbhzRZlR82k861kIPZEerUvWejmkd/m0RtWgx7PfSM=; b=gPLHtBWH8FMCOM
	V1j0+GbwGh5g2Bf8H414fvUHK49Zu4dH/UI5ZLJGJCKj8WoNN9LDRcrCTTx2cQxil8+po6Qqev7dT
	IhuOvm3q8RodGVHCvx5ZpLE96dbhZLZbADCtLxQx0IUTsO4b6vmn1ODk27MzM2di58qXRpeXtGDwP
	KcDg64PmDosxm4Ijgt1sYEUNulkMDFht05OYG4t5qVLgvPjZm0kvRy/XwfxrCRhxfFiQ0FmpQ2f/X
	u8eJyLfAQ6t4Xdh0cfehIGbnWkYCBgYKjxdYhTAAthBmcIisxG12W5TPOnY0R1XSBQKboLHz1owZE
	2nQdDBImyRrscKV86pyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwf4E-00000009iup-3QU6;
	Wed, 19 Aug 2026 12:06:50 +0000
Received: from out30-100.freemail.mail.aliyun.com ([115.124.30.100])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwf4B-00000009iuI-3K7d
	for linux-riscv@lists.infradead.org;
	Wed, 19 Aug 2026 12:06:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1787141205; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=GUkYR9rTFV9fXstshGxCSzOaJRhNZLVndr7rGImjuSU=;
	b=IbGKK1HBmzhuo7iKniPBVbcTmtxFH9F5ziMtEnmiGuJtXfW61lIhSDqvRDQVxZG0sfvgP7aSxn6suh0q1Xmq5EY7cPLrjYX3GFBp8ObJgCLIkBtIsZjErUkEJuH1jzvjI4FYRAT0f93+mEIl4ZK3dPqLMPhloMNkyZT5VMhED6Y=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=11;SR=0;TI=SMTPD_---0X9Ga8Y-_1787141199;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0X9Ga8Y-_1787141199 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 19 Aug 2026 20:06:45 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: bot+bpf-ci@kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>,
	Pu Lehui <pulehui@huawei.com>,
	bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next v2 1/2] bpf, riscv: Add support for signed arena loads
Date: Wed, 19 Aug 2026 20:06:29 +0800
Message-ID: <reply-bpf-ci-arena-ldsx-comment-20260819@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <f6d031ece454ad8a2a3e09bbdf48d9030c74cb6741f76aabf58bf7af1931abfd@mail.kernel.org>
References: <a78cd29b238aa1aba87efeb2fc09d25a56c22f69.1787128322.git.cp0613@linux.alibaba.com> <f6d031ece454ad8a2a3e09bbdf48d9030c74cb6741f76aabf58bf7af1931abfd@mail.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_050648_485227_CB673A88 
X-CRM114-Status: UNSURE (   8.25  )
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

Hi,

On 2026/8/19 17:37, bot+bpf-ci@kernel.org wrote:
> This isn't a bug, but would the comment fit the surrounding style
> better as an expression? The neighbouring case-group comments all
> spell the access out in pseudo-code form:
> 
>     /* LDX: dst = *(unsigned size *)(src + off) */
>     /* LDSX: dst = *(signed size *)(src + off) */
>     /* LDX | PROBE_MEM32: dst = *(unsigned size *)(src + RV_REG_ARENA + off) */
>     /* ST | PROBE_MEM32: *(size *)(dst + RV_REG_ARENA + off) = imm */
>     /* STX | PROBE_MEM32: *(size *)(dst + RV_REG_ARENA + off) = src */
> 
> Something like this would match the pattern:
> 
>     /* LDX | PROBE_MEM32SX: dst = *(signed size *)(src + RV_REG_ARENA + off) */

Agreed, consistency with the neighbouring comments is more valuable
here. The pseudo-code form will be restored in v3.

Best regards,
Pei

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
