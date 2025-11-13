Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB33CD6E54
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Nov 2025 19:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SqZLT/XGLwZeQE5DInKlhCQquqEDHUuHKkFFTjDXhN8=; b=Wr8WknwpSwf0I2
	ydvoprwt3KV5dl+lLfXLW0M+5GVyxGWip0tIW64aevRypArs3lYPjZNqj23JXHoVA3EZKCdw8AgVJ
	9ui5ESpQNOLoYFzuLJP7X2RUd7oBiCakagwmQmLYRkOFkPThX52jj9rbiynp1J0sxZIiCHf44rf8t
	wjUZpMZwGQcItAgE1kM4GbH34c/n0oT3bidEOy+wSf0wsR2tpb5nIVv6+nvXHq94TFVLqHhy9n30u
	vNCZYDIDp2xKcgM3xbp4C1U2rwZ97OCcAFIGtwkrz2iLbKWtTfWcOq8SxY+QWfVJEtBTkJBJ/Y1KS
	BMORXK8v1Er4TSnkPBFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJciS-0000000Ayc5-0D2A;
	Thu, 13 Nov 2025 19:10:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJciP-0000000Aybm-2PF7
	for linux-riscv@lists.infradead.org;
	Thu, 13 Nov 2025 19:10:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 19FDA4061F;
	Thu, 13 Nov 2025 19:10:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2347CC4CEF1;
	Thu, 13 Nov 2025 19:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763061040;
	bh=44TFkluQ8NjYkM/UonfvdyIjixH2154CCmS8Jt4lT68=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=R3toaTeLMEp1d+NiFs6A+mAY1QvXx6w8f3DWOLVS/1Maj4RyEyaI5L5hN7YTyPF1r
	 h9/gJnDm459DS/Gtg/XeJaLhWgMeRLqXpKO4Am6wfK3HgR4bQiPeky/lIH+Etx/T2g
	 /AflA7CydDfqNxJv1TsKtJV4AQE/KWXmEUEeXlgPv4q4qa+5pxYXsBGRu8S9RnKhNU
	 A2RqgauhajKhHy6HUToubqfxEOYUdPdK8CwTC2hVKKG5+XtBC5WvBmwudvJyoIL0VM
	 sRQi9XZ8z9NLL1aDBRjzrOW3qboZSkFNBjF/E8SmOAg9BjFBoU8h51AoHQNur3kYlo
	 aYtC+RKaddxSQ==
Message-ID: <0898b3ab-ae9a-49c8-a026-b9dac50e38c9@kernel.org>
Date: Thu, 13 Nov 2025 20:10:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/22] perf/events: replace READ_ONCE() with standard
 page table accessors
To: Samuel Holland <samuel.holland@sifive.com>,
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
 <Liam.Howlett@oracle.com>, Anshuman Khandual <anshuman.khandual@arm.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, linux-perf-users@vger.kernel.org
References: <20251113014656.2605447-1-samuel.holland@sifive.com>
 <20251113014656.2605447-5-samuel.holland@sifive.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <20251113014656.2605447-5-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_111041_641350_C6103DE6 
X-CRM114-Status: UNSURE (   7.80  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 13.11.25 02:45, Samuel Holland wrote:
> From: Anshuman Khandual <anshuman.khandual@arm.com>
> 
> Replace READ_ONCE() with standard page table accessors i.e pxdp_get() which
> anyways default into READ_ONCE() in cases where platform does not override.
> 
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Arnaldo Carvalho de Melo <acme@kernel.org>
> Cc: Namhyung Kim <namhyung@kernel.org>
> Cc: linux-perf-users@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> Link: https://lore.kernel.org/r/20251006042622.1743675-1-anshuman.khandual@arm.com/
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---

Acked-by: David Hildenbrand (Red Hat) <david@kernel.org>

-- 
Cheers

David

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
