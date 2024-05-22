Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 500E7C25B79
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 17:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gMdNhh/xPa8t8raMTRKwwCkxeb3dGIQCbatnWGx2wiM=; b=xbHllbKBdLw81Y
	u9YP/xRkrL5oiNDVWTEBEmBgfYRr7YWpu59FLf9R+PA4s7NxmHKpKOW6iALMgRLsw+NqfD+QqZa3n
	5DcVP8A8PxUcQZ/41W2Ju6pWXQ1gW03drFchnVOIDUMZ+7qTT0TcvlWUhWxq3Gg7Zlg/O8VoDXb2D
	2GUbmrJRFlJ7EvW5dSpa6kzN21lYGujYNQwt92YJn1wb8G9cy6NxTj5jWXG/VfaQPYt1tP4KpHQY3
	HOr9iWbfOw2qR2twTY8lEUPB789VscTj6BFY8U5TCu0xvcGPnqiszgWM2YecyHloAvHI+t30hPp2u
	veOQyHg8lW3nCZj4a68A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9pXL-00000003d0q-1kCO;
	Wed, 22 May 2024 17:13:59 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9pXI-00000003czK-0YzA
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 17:13:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0F7EDCE1192;
	Wed, 22 May 2024 17:13:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E92FC2BBFC;
	Wed, 22 May 2024 17:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716398031;
	bh=60LHAtzrKidGyWFU1huo2XzSzZXTtfyfRyB9guGBkOE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=UeFxgPqNVyEgTI0XJHmMlqgVNwR2qk549KtkKSQj2xn6VpsjZwqC2Lf+iDGZOM5df
	 0pIFB6FedIZ/eSAj34yv1Bx+FunjVdU3oXJTN9JCuPirVygCgAdPEBau4VikcgzwOQ
	 vlGypaEUL6B4MLskgs7u6vTkyDaanEs1bahwrtj9f+XSO7m6MP7DKDlUm+A0438Ht9
	 2a4kdmt1gQm5HYO3RfBeVkC9R256x/7f0QwJz18xlk3m5e89KQ/35CBOktYzcP1rKi
	 EodPgwktvtviUOk0lBkjMML7i2DmwbUNREU03/GeffV5q/eqjOx9u6S0Sn1Z0ZUMco
	 ceoRRyLMbHS3g==
Date: Wed, 22 May 2024 10:13:49 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Shuah Khan <skhan@linuxfoundation.org>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Edward Liaw <edliaw@google.com>, shuah@kernel.org, =?UTF-8?B?TWlja2E=?=
 =?UTF-8?B?w6tsIFNhbGHDvG4=?= <mic@digikod.net>, =?UTF-8?B?R8O8bnRoZXI=?=
 Noack <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, Richard
 Cochran <richardcochran@gmail.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, "David S. Miller" <davem@davemloft.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend
 <john.fastabend@gmail.com>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kernel-team@android.com,
 linux-security-module@vger.kernel.org, netdev@vger.kernel.org,
 linux-riscv@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [PATCH v5 00/68] Define _GNU_SOURCE for sources using
Message-ID: <20240522101349.565a745e@kernel.org>
In-Reply-To: <6caf3332-9ed9-4257-9532-4fd71c465c0d@linuxfoundation.org>
References: <20240522005913.3540131-1-edliaw@google.com>
	<6caf3332-9ed9-4257-9532-4fd71c465c0d@linuxfoundation.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_101356_399036_EEB335F9 
X-CRM114-Status: GOOD (  11.26  )
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

On Wed, 22 May 2024 10:19:33 -0600 Shuah Khan wrote:
> On 5/21/24 18:56, Edward Liaw wrote:
> > Centralizes the definition of _GNU_SOURCE into KHDR_INCLUDES and removes
> > redefinitions of _GNU_SOURCE from source code.
> > 
> > 809216233555 ("selftests/harness: remove use of LINE_MAX") introduced
> > asprintf into kselftest_harness.h, which is a GNU extension and needs  
> 
> Easier solution to define LINE_MAX locally. In gerenal it is advisable
> to not add local defines, but it is desirable in some cases to avoid
> churn like this one.

Will the patch that Andrew applied:
https://lore.kernel.org/all/20240519213733.2AE81C32781@smtp.kernel.org/
make its way to Linus? As you say that's a much simpler fix.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
