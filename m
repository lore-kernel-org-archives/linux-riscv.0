Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA46ECA5FA7
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 22:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ccPG5u3qKflRx0/bJGZc1KE1fw0Irf8lQEvjvoUu2gE=; b=ABAD5C4lzfKb8B
	ybK3QzqWRur3KGqi4sQQzguIRy5OZvlHJR+PTw6SRgiZ1gE7WSKOM/n43ku/1kSR6bnNfdWuF4Zfg
	fwjRiQKI+ibjNUa9enFSfGtHgjg0Td6vvOoUjns+ZPhew4tkzGsSrmZ5s5HzU9htTUNSd2uvT/FgV
	V1QwMecgR38vMIIh4oSryiA0pE3ux5Xm90Exy4JGquy+CXmBhZky6/fodtx7oZ2XDwuF0qDJqVWeo
	Vp8v2CbohxOgWeIdzrnf6qX9cCqyHoxokpflbMIwPCoXOAkgGbNzI5adQM38Di+8Ld9/9drZnqwPF
	zN/0fnGxJdBiq70DpCdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBgUB-00000004ioR-1NeS;
	Tue, 29 Sep 2026 22:39:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBgUA-00000004ioG-2WH9
	for linux-riscv@lists.infradead.org;
	Tue, 29 Sep 2026 22:39:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0E5BE6022B;
	Tue, 29 Sep 2026 22:39:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 723381F000FF;
	Tue, 29 Sep 2026 22:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790721581;
	bh=mFtGGCLVV5rmv+Xh2UYKAbY9gvj9cxkqM2U8a49A7Mc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NjDXrUz+ThTSNc1oh9hWIDJ96fDUWXY8RGjqUOdMQAXf7a4aUwkz3lro9Khz9cgip
	 tWd5txGT2XmH4QgyboWgW+//Ur/RvS02deKzWgEi/jJriepGgNnYsAXtVXHyWLC82+
	 AhFXoPlCtp0zZtajUYZenccXut8Il5lgpbTFKV0yq6exjVb59yxhJALdR/ohGaMwIO
	 qoXK5EVR9HRFbkqmzWU2c9AOJaYnjTOLVofJpBcydR5qSXe3iariOxYaI3fTBZcHSJ
	 vc5nD3+O580iVkFYIEIgFCpMgV995vEumIBKnP1ryynNKqDIOuOJ/6Wp5fITtDBzvy
	 exwFK/5XzBkmw==
Date: Tue, 29 Sep 2026 15:39:40 -0700
From: Drew Fustini <fustini@kernel.org>
To: Han Gao <gaohan@iscas.ac.cn>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Han Gao <rabenda.cn@gmail.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] riscv: dts: thead: enable HDMI on Milk-V Meles
Message-ID: <arw-LGxaHEYnBeCH@thelio>
References: <20260929-rv-meles-v1-0-effdd14a76e8@iscas.ac.cn>
 <20260929-rv-meles-v1-4-effdd14a76e8@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260929-rv-meles-v1-4-effdd14a76e8@iscas.ac.cn>
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

On Tue, Sep 29, 2026 at 06:22:48PM +0800, Han Gao wrote:
> Enable the DC8200 display controller and DW-HDMI transmitter. Connect
> the transmitter to the board Type-A HDMI connector with reciprocal graph
> endpoints.
> 
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
>  arch/riscv/boot/dts/thead/th1520-milkv-meles.dts | 25 ++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)

Reviewed-by: Drew Fustini <fustini@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
