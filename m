Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37369CD0427
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jan 2026 01:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iLlpOM2U2oNL7VoDaWCv+gRanDSnHHLPX+G/E6/EFc0=; b=W36vuZITo1wVhC
	CMaqzJl7/S4c+ZZHxrcouXYuKl4zIOto73XPZkYDYGPSZ+9FHF+ZgGrNfiV+rdBeaoDFban75SRts
	6/ARbQ1VBIg6Xzipuq4EDhJDZI5uX4W41QhxHkpych2qT02FoCnhMVTsYKbLsGeoAm5QwBqiQViZb
	eUpOOdqUDKWMr6Q63ndKiLlV2jcrZar8YZweXvbWnJFX4Cd2S8KI9KuOf5TAXkpR01QlYE+L+As3K
	kG8j8CIBzZRWSX9MURgX8tCpINSxYqp2H7u+H3urzwFRMPb7ocORnbfS9sjIP/Ik77S909w+3lQ5V
	2AjkkyAs98IMdc7JOneA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcvgE-0000000CJCQ-2Y8o;
	Tue, 06 Jan 2026 01:16:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcvgB-0000000CJC7-3et4
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jan 2026 01:16:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C561A436BD;
	Tue,  6 Jan 2026 01:16:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3B94C116D0;
	Tue,  6 Jan 2026 01:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767662168;
	bh=OzJHFsfEHzvgI2kXNEToJUDBn4I1m/TX38QGMIfzvg0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hRdbaEml+S9GmYO5A6Ks+1HyDRv07YQSj4dv6i2mxKPU9BvL8Yyf2Qvh1SVeOTLLo
	 NpT1ux2dV1gQYVrLVx3xBBEPqmgCw/vIH3bWVjyn5lIamyxHkMIEJUuNmL2RmoNP4t
	 lrUlrpfX/pOFwIf97hu7zXJb/9BvAQPcQk0v2fgns3pjOX8H7vV75cbn2r8e1sbqO6
	 DoW3KVbcPMbjRQglhdeU/093wI3TLUQNvowTHX21gawVxdAVYN60rW+Ur2WJ8IMDM4
	 cfphxA0EOpNGxHWd5SHPYwnvZeit9prItWKD5jSg1cvvwwOe7ML3K0fQE3ZjZjGDoV
	 t+x+1E/KRgOaw==
Date: Mon, 5 Jan 2026 18:16:05 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Soham Metha <sohammetha01@gmail.com>
cc: linux-kernel-mentees@lists.linuxfoundation.org, shuah@kernel.org, 
    skhan@linuxfoundation.org, linux-kernel@vger.kernel.org, 
    Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Breno Leitao <leitao@debian.org>, Song Shuai <songshuaishuai@tinylab.org>, 
    Andrew Morton <akpm@linux-foundation.org>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] riscv: kexec_image: Fix dead link to
 boot-image-header.rst
In-Reply-To: <20251203194355.63265-1-sohammetha01@gmail.com>
Message-ID: <1bb1f1bd-72a0-42f4-4183-75d44dd21634@kernel.org>
References: <20251203194355.63265-1-sohammetha01@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_171611_947706_8729132C 
X-CRM114-Status: UNSURE (   7.22  )
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

On Thu, 4 Dec 2025, Soham Metha wrote:

> Fix the reference to 'boot-image-header.rst', which was moved to
> 'Documentation/arch/riscv/' in commit 'ed843ae947f8' 
> ("docs: move riscv under arch").
> 
> Signed-off-by: Soham Metha <sohammetha01@gmail.com>

Thanks, queued for v6.19-rc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
