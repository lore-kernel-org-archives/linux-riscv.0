Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B56E92FD7
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Dec 2025 20:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GRTotQ9oxD+M7YnftL/kNaLJ1WqKE/EJ1QEMJE6Az1U=; b=TyJP7vvo2wNyCnGvc44/603JpJ
	pSXFIYUg5tK3FFHolgAnEUQniiWI/+HXgFpvGpwbp7ujY+ZyPj239g/MzEK+6f5Q7LZpjTQei+vUv
	/wnaYPoaYB3xcetVxcIYgxGrx9nTX8D3pIw0gioPiF6c8QA1wFxJ8wVEz6yspIcbrGmwPF7Gdc47n
	+myNQcgMKVxBSlnDns9CXPJDms8Ay1KbKMXoOr1vk88XmNc74TRLQ/Lmss65R/D/Y6suYH/9MBZad
	BWDiE1SCmc96ZWqUuCRaNL4v7hoTbxGbhmpCHYyOQLRPqPfKViPCendNDo7AZwma+wmEPjh4XfRLC
	WwPin7Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaK3c-000000043b2-2HiS;
	Mon, 29 Dec 2025 20:41:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaK3Z-000000043aI-3cSZ
	for linux-riscv@lists.infradead.org;
	Mon, 29 Dec 2025 20:41:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EAA664183E;
	Mon, 29 Dec 2025 20:41:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9322EC4CEF7;
	Mon, 29 Dec 2025 20:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767040890;
	bh=GZ+1KKfaWUAEcxuxIpgqLNo0r9p6egS5f7P9gKbzco0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QSRG7hvxBwQ796IfjClt8gqnHeEg9FV3z8mjQpYJOHPTnhcOUr+/cnAT4eS+xWhcw
	 Ry/Yz2NJZ5DA5UhE7xlqILcigyZGgJoMpuIuB0HMrcb7Ey7m1vgaCm9xAfhtLSz4bn
	 sbTYmz31UIAeLJcFVaXN7OOZdttuepR+uxZUfFaBQo541btafW7mlmwhzqU1GM58MY
	 M1UJdK4hRPnph8apO7+VSUObxlZC5iMC2GiurW2KC0C0UTBxkCWb1C8TBghjVP78ye
	 lD82sIfiiyao8xdsYvHQc2rwHPPIbHwa6sC1CjLJJW0iqFCco3pfM0oBcDvtUsNP3Z
	 l3grsjsZqTnwg==
Date: Mon, 29 Dec 2025 15:41:29 -0500
From: Sasha Levin <sashal@kernel.org>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Sourabh Jain <sourabhjain@linux.ibm.com>,
	linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
	Heiko Carstens <hca@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>, linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
	x86@kernel.org, linux-riscv@lists.infradead.org,
	"David Hildenbrand (Red Hat)" <david@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: Re: [PATCH v7] mm/hugetlb: ignore hugepage kernel args if hugepages
 are unsupported
Message-ID: <aVLneaA6gaGUaBJS@laps>
References: <20251224115524.1272010-1-sourabhjain@linux.ibm.com>
 <20251228143533.33e2be2d6282d036f55e12cb@linux-foundation.org>
 <398ca47d-19d4-4b26-98db-2bf283b6b0cb@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <398ca47d-19d4-4b26-98db-2bf283b6b0cb@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_124133_939974_F2E20031 
X-CRM114-Status: UNSURE (   9.79  )
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Dec 29, 2025 at 07:35:18PM +0100, Christophe Leroy (CS GROUP) wrote:
>
>
>Le 28/12/2025 =E0 23:35, Andrew Morton a =E9crit=A0:
>>On Wed, 24 Dec 2025 17:25:24 +0530 Sourabh Jain <sourabhjain@linux.ibm.co=
m> wrote:
>>
>>>Note for backporting: This fix is a partial retrieval of the commit
>>>mentioned in the Fixes tag. It is only valid once the change referenced
>>>by the Depends-on tag is present. When backporting this patch, the
>>>commit mentioned in the Depends-on tag must be included first.
>>>
>>>Link: https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Flore.kernel.org%2Fall%2F20250121150419.1342794-1-sourabhjain%40linux.ibm.=
com%2F&data=3D05%7C02%7Cchristophe.leroy%40csgroup.eu%7C93a8f925fc024ff9c3f=
e08de46616c3b%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C6390255814040270=
66%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAi=
OiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D3iVUdaMBW=
hExKkDiV%2BBfYufPTKva1dVikhyQShOq7mc%3D&reserved=3D0 [1]
>>>Link: https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Flore.kernel.org%2Fall%2F20250128043358.163372-1-sourabhjain%40linux.ibm.c=
om%2F&data=3D05%7C02%7Cchristophe.leroy%40csgroup.eu%7C93a8f925fc024ff9c3fe=
08de46616c3b%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C63902558140405320=
6%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiO=
iJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DGamDe2R87S=
dpFurnj9Cmt9wOQtkGLgIO1z7nl5QPxgY%3D&reserved=3D0 [2]
>>>Fixes: c2833a5bf75b ("hugetlbfs: fix changes to command line processing")
>>>Depends-on: 2354ad252b66 ("powerpc/mm: Update default hugetlb size early=
")
>>
>>This will be the first "Depends-on:" in history.  Which is a hint that
>>we're doing something wrong.  This innovation will surely fool any
>>downstream automation.  Let's use existing tools if possible.
>
>What do you mean by "first in history" ? Do you mean it's never been =

>used before ? As far as I can see it has been used several times =

>already. First one was in 2014 with commit a0855054e59b ("iwlwifi: =

>dvm: drop non VO frames when flushing")
>
>Sasha, do tools use it ?

The standard way to annotate dependencies is outlined in the docs:

   To send additional instructions to the stable team, use a shell-style in=
line comment to pass arbitrary or predefined notes:

   Specify any additional patch prerequisites for cherry picking:

   Cc: <stable@vger.kernel.org> # 3.3.x: a1f84a3: sched: Check for idle
   Cc: <stable@vger.kernel.org> # 3.3.x: 1b9508f: sched: Rate-limit newidle
   Cc: <stable@vger.kernel.org> # 3.3.x: fd21073: sched: Fix affinity logic
   Cc: <stable@vger.kernel.org> # 3.3.x
   Signed-off-by: Ingo Molnar <mingo@elte.hu>

   The tag sequence has the meaning of:

   git cherry-pick a1f84a3
   git cherry-pick 1b9508f
   git cherry-pick fd21073
   git cherry-pick <this commit>

My tools don't look at Depends-on: and I don't think that Greg's tools do t=
hat
either.

-- =

Thanks,
Sasha

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
