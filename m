Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05559CCF9E9
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Oct 2025 12:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Crw9EoJYlCXTvBlEwTcfkaFt5hgroDd2k9iLf18kRc=; b=qH49bcZRsOgos8
	FdtzDSz14ZqwfVPImDyXgXeWQhjT+uQSm81JO1sbiDRA2RR6/uZ3k/JzDJ4KlT/IigS0mqQdXp6zm
	ie+43p6r1XDBCLdu4hLvyh4YNDvuwVqIR1MbfLBhqXVwGbcZrfLYPBUgzO/a54fGuOo6fpfqJa2PX
	AZOayKJvt/CKFNxtR9HIhxgYIpKYBI19L47JSW9sdotlYm4wP/MqO9MCLQpDOUSxJPuFvOmuaRUeH
	jbAP+96EyR5sSUPV8Dd4a9wtwTzw58m8Lkmu6bO6ctBhKe0BSYkL9lvefy9WsJVIOp3YRXnY+oTxi
	UWizKY38rXmm46SjqzIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE5f9-00000001Edq-1YPp;
	Wed, 29 Oct 2025 12:52:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE5f4-00000001Ecm-2mNf
	for linux-riscv@lists.infradead.org;
	Wed, 29 Oct 2025 12:52:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3272C43855;
	Wed, 29 Oct 2025 12:52:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F402C4CEF7;
	Wed, 29 Oct 2025 12:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761742342;
	bh=1HAJ1BJ3hJr4rMA1mSnM4Z+EA/gpodPOwk5FC2dXS+8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eR089nn/rglpiimPihlYCj2SAY7spC2qAj5Lr7H6Goy6akWpAa25G5+gOrKYvQ424
	 MoaGPeC0uz358YVaYuA68Xmgpu+OTQO3hZ+xSYhXinicU4oLgbMDuN+tndeRCNsWki
	 jenc5xV1wdfqBHdaxOJ/1pv+/eQyxjndYz45Qi7IYLuuxgRKGVSe1TbkSVX1e2PYmq
	 2jq5hqWLHMD4bRNG6H/vlmS8WV618g19vR/E5AeXpInNitu+gGfbaXJW2HSbfKCIjG
	 OuafbZLakfKlxk7EWUkm24lWPX9UccCbRtdWTLxiIH0RxWJD31ryDwlbS3NcZR4sSf
	 7h6QQMFcwwLsw==
Date: Wed, 29 Oct 2025 12:52:14 +0000
From: Drew Fustini <fustini@kernel.org>
To: Yao Zi <ziyao@disroot.org>
Subject: Re: [PATCH v3 4/5] reset: th1520: Support reset controllers in more
 subsystems
Message-ID: <aQIN_lVnn3wcwBCg@gen8>
References: <20251014131032.49616-1-ziyao@disroot.org>
 <20251014131032.49616-5-ziyao@disroot.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251014131032.49616-5-ziyao@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_055222_737203_F2EEC83F 
X-CRM114-Status: UNSURE (   7.79  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Michal Wilczynski <m.wilczynski@samsung.com>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, Han Gao <gaohan@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>, linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Oct 14, 2025 at 01:10:31PM +0000, Yao Zi wrote:
> Introduce reset controllers for AP, MISC, VI, VP and DSP subsystems and
> add their reset signal mappings.
> 
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---
>  drivers/reset/reset-th1520.c | 793 +++++++++++++++++++++++++++++++++++
>  1 file changed, 793 insertions(+)

Reviewed-by: Drew Fustini <fustini@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
