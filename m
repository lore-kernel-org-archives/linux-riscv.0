Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4C11D111A8
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Nov 2025 17:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+hoQZETuCCBM0Dk2wHE/oaPCfLR0uRykm1d9pgSOj8o=; b=QOAYrJtBmasTxd
	DFUYetACumZsiGCA9grg0Gl3ahd7g2i87lt5u52sY/CgKMzCPQtnnbZuWns81uFRbBjyNQCNvv1Gu
	a2weOBrKrL7HC+jE+eT7Id4XE9iQZbLjWyZBE7wr8wCFl/ZzWnBkxbUSEeymYGd84K/yy2+WTq6tr
	EzxNkiWDAPLIIZzA9TUPKmJJ+KxsIsGsDPO9k421s79auQgg5TLp8nYgKubot11zigzeKauPjS+pi
	XJPX5DO8VKCEypTMOWqzYMXgQXa0wbolGPeETi+f5gO3uDqoP49Sq41ztPlegvw51hG7qPP0T5lOd
	Dy/wRtd1wrKQC9HRVUuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOg5u-0000000H1si-0xL4;
	Thu, 27 Nov 2025 17:47:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOg5s-0000000H1sc-3SDZ
	for linux-riscv@lists.infradead.org;
	Thu, 27 Nov 2025 17:47:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BD99F60242;
	Thu, 27 Nov 2025 17:47:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50BA4C4CEF8;
	Thu, 27 Nov 2025 17:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764265667;
	bh=Mlj7IZZ9H7pQFN5atJKwwNiI0cnR56p2vYQ4LsbFBWg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iEQQhc+ttHIHJkNB4yomtmyZLO6gdTFX5PHlESo0TWPWQL5MlnAywIoAm1AvBiW/5
	 nrB+DeAsOtyZPTc/P2z5EmWv6f4s9q9xTRzwyPn5V/xzzWFwxMzlrHThBl8AUy8ICg
	 9ZrBpeodUN5Q6lvikvYgjXz3KzIHK3eoiv8A6LXSMSl7HWJqvzOkTJQB7M60mpnosl
	 DYWSlcTeWY/75NXidb/E0FWSvZ/AsC6BhYZBodRJJi9JU+NWOQl5appR4AQ3DePDII
	 EI4DFC0FWXGhMp6Jhe07jPc/d9LGLcY1XSCmbC9JIngzm2WjeHo45t7mTu4YBHJbcs
	 MyQiKQ7x3LlsQ==
Message-ID: <c2597d43-d909-4259-bb5b-9294e4069385@kernel.org>
Date: Thu, 27 Nov 2025 18:47:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/22] mm: Allow page table accessors to be
 non-idempotent
To: Ryan Roberts <ryan.roberts@arm.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
 linux-riscv@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-mm@kvack.org
Cc: devicetree@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>,
 linux-kernel@vger.kernel.org, Mike Rapoport <rppt@kernel.org>,
 Michal Hocko <mhocko@suse.com>, Conor Dooley <conor@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>,
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>, "Liam R . Howlett"
 <Liam.Howlett@oracle.com>
References: <20251113014656.2605447-1-samuel.holland@sifive.com>
 <20251113014656.2605447-9-samuel.holland@sifive.com>
 <fbfef7fc-4030-462b-b514-498eea6620aa@arm.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <fbfef7fc-4030-462b-b514-498eea6620aa@arm.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 11/27/25 17:57, Ryan Roberts wrote:
> On 13/11/2025 01:45, Samuel Holland wrote:
>> Currently, some functions such as pte_offset_map() are passed both
>> pointers to hardware page tables, and pointers to previously-read PMD
>> entries on the stack. To ensure correctness in the first case, these
>> functions must use the page table accessor function (pmdp_get()) to
>> dereference the supplied pointer. However, this means pmdp_get() is
>> called twice in the second case. This double call must be avoided if
>> pmdp_get() applies some non-idempotent transformation to the value.
>>
>> Avoid the double transformation by calling set_pmd() on the stack
>> variables where necessary to keep set_pmd()/pmdp_get() calls balanced.
> 
> I don't think this is a good solution.

Agreed,

	set_pmd(&pmd, pmd);

is rather horrible.

-- 
Cheers

David

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
