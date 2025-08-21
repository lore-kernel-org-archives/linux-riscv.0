Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FDB2CA0EEB
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 03:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kKy0gAvQM6nlnmWoNs03Q+O6oxumu8jKv/tzrxxsDHg=; b=yusrlqUTmthX/t
	aTWidPk8Tl2cappeX3gx9H0KsF4LdqO1rcSYf2oGShHqd0OH9hEKjJzvMLCyFgRRtVkz6JVcXOZUd
	eINrsCQxU2Tk2G7xqc8SQT+5aE0ZXtf4phkA90ZvM4FS0UJX/+jwjdgUQabrdTX5KbwFkUU+b3+os
	oaZp3CyMV9KQoY3mlD3Bn7SzLBuVtSzshc8VrKDvFnJCOP4E8o5xRDam/erWp51L/2oBDVbdUIPqk
	5cXqkiGLlzjNBthYQXkJhUWxM5oH1/uHYTUyv5Z6QdGtM3Or+XuUbIGO2WIrDNTFSJ80v5j+3V36k
	stKz9dwNUn5tmn2RDoqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upIWb-00000001OaZ-3P9A;
	Fri, 22 Aug 2025 03:33:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upDWx-00000000iZc-3iML
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 22:13:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C71F85C5996;
	Thu, 21 Aug 2025 22:13:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BA09C4CEEB;
	Thu, 21 Aug 2025 22:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1755814390;
	bh=OZVsV1pjh5cFcCuKO5I5KInQUt83XkwpyN8e5LAvhKs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=h8PefxhwzUDkEVO/G7Udqk5ywBFaWt9v80jL/AxtOQi2x3HrajmGLKlp/Jzy3IK33
	 jRNdGw8nWXvygM/jJFn4eftYLX1BV7wHKc/GKOYZJypKp3M12AanRlfcEb8RG6EBDB
	 3AU+Ot/yjoAk7wmY5xRhet+2x2RivUMY3LZGC/Qg=
Date: Thu, 21 Aug 2025 15:13:08 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, kernel@collabora.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Vlastimil
 Babka <vbabka@suse.cz>, Albert Ou <aou@eecs.berkeley.edu>, Zi Yan
 <ziy@nvidia.com>, David Hildenbrand <david@redhat.com>, Suren Baghdasaryan
 <surenb@google.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, Baolin
 Wang <baolin.wang@linux.alibaba.com>, Mike Rapoport <rppt@kernel.org>,
 Peter Xu <peterx@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, Palmer
 Dabbelt <palmer@dabbelt.com>, Ryan Roberts <ryan.roberts@arm.com>, Leon
 Romanovsky <leon@kernel.org>, Shuah Khan <shuah@kernel.org>, Lorenzo
 Stoakes <lorenzo.stoakes@oracle.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Barry Song <baohua@kernel.org>, Dev Jain <dev.jain@arm.com>,
 linux-kselftest@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-mm@kvack.org, Nico Pache <npache@redhat.com>, John Hubbard
 <jhubbard@nvidia.com>, Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH v2 4/8] selftests/mm: Add -Wunused family of flags
Message-Id: <20250821151308.915362b14e82f5626f659481@linux-foundation.org>
In-Reply-To: <4abd97fe-412d-4e3e-9efc-cf3092d66e57@collabora.com>
References: <20250731160132.1795351-1-usama.anjum@collabora.com>
	<20250731160132.1795351-5-usama.anjum@collabora.com>
	<57c816d6-a9ba-47c9-8f40-3978580b7f67@arm.com>
	<8e9d7c59-46b4-4e1b-8a55-1898302f5080@collabora.com>
	<88ea592c-c6ff-4a19-a366-eadeca66b039@arm.com>
	<4abd97fe-412d-4e3e-9efc-cf3092d66e57@collabora.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_151312_166289_C8C7E7BF 
X-CRM114-Status: GOOD (  14.69  )
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

On Thu, 21 Aug 2025 17:31:21 +0500 Muhammad Usama Anjum <usama.anjum@collabora.com> wrote:

> > My
> > feeling is that unused parameters are expected to be allowed in the
> > kernel and it isn't helpful to go against that expectation in just a
> > small subset of kselftests.
> I thought kernel must be giving error for unused parameters as well (from
> my memory). But just checked and it doesn't seem like it. I'm okay with
> dropping -Wunused-parameters.
> 
> We need to drop patch 6/7 and in Patch 4 should have only:
> 
> -CFLAGS += -Wunused  -Wunused-parameter -Wunused-function -Wunused-label -Wunused-variable -Wunused-value
> +CFLAGS += -Wunused
> 
> @Andrew, Should I resend the entire series or would you can make the change?

I think a new series would be clearer, please.  It's unclear (to me)
whether Kevin's various comments have all been addressed.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
