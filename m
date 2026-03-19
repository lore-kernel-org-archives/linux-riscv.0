Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 452F7109023F
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Mar 2026 15:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EWnEJA7lVl863IeUaVrI9pFtkHVlat8xq/cryUduUw0=; b=vOBz2j8cn2jPmB
	QP0Ci3TpyRXf3b7gZFG6FJQ9m6CWiKQH3SLJk+eHqX6CFy5Onjo4iaiJZhmeBEDBe8GJv2IKKsBwT
	gcvVJ4me01YGg3fg0PaR2jXQpyf/MmEtJBXLOeI+dOnsTfb7OZWy/KYRjtC3PMbFfWv4DGvuFO7z2
	9gWl8udKxdID+y5rQBQlJHi1gkax0o7Z1k5nJMWAkYqWBooDhwXbLJmsfqhXV0lcXhLW1znHp52mq
	jRZjmi6bfkN2iK0MN6iv2FT2b3iNIeddH5/WnEwmBoeHg17sVDlq8aHvIp4fOIr5Hg9FB2M6CyGYT
	lnzxL//A3xW8jaenePvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3FEg-0000000AuQS-39x2;
	Thu, 19 Mar 2026 15:24:34 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3FEe-0000000AuPm-2PMo
	for linux-riscv@lists.infradead.org;
	Thu, 19 Mar 2026 15:24:33 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-899e87b04d8so16593096d6.3
        for <linux-riscv@lists.infradead.org>; Thu, 19 Mar 2026 08:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1773933871; x=1774538671; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CAHdFeNRl4yy2sR/1LOHb2d72hyJTySGsjAok8mzB+g=;
        b=fE9/lPwutGfat2UvN5ldmuBlJUEC0vb+d6YlEDp+KY/MMNYoOWt6j+fyLX08NrSNQ7
         42kMC9cHasZu214J/gJfYK8RNx6k7Fi5WSLvH5y17gdZxZOKsg7b10A30QFzIn5WSz0p
         CHcNcYsqrYDPyOnRyui0SLy9f8hLyD1e/zh8o9KiveU1aBsn6aUUSfSIv6EZ9F9cv+KC
         w/07i1pO8L3sPrXAT8JuuKb5JO0xaMUMKs2jDfewJ8MeAdA/9udsWvoabmunbfaw008I
         GQ7H9cWitbqZjHLXASIcXvJ+LwTOoZhRW3dXLwOxIBq/PM3iogmLrsI6+4CYdE2sMTfS
         IOtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773933871; x=1774538671;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CAHdFeNRl4yy2sR/1LOHb2d72hyJTySGsjAok8mzB+g=;
        b=G7V1QfFLp9KNI6WuGKj9FWOnGBkyz+6sWzIwncn5BAzHK5OJPUuHnpwiR5Sgbjnk9g
         YY51cw4BUMmVp8e0uXFizHzvOX3XRieUCd+uU5fpwICTwFkZ7DgSeAl600c6dASETNvh
         nLhEECzJCYZOf6qi2ge+woVhXkYaZe32Mrzdsc8d/r6et9c1KDmEP4nH9zu5Pojw1RhP
         A+v2+bfR8vMCWgKAqjnvoemHJoFPdbDpvdDyPj0AWPybWl2MRyax+C9UOY25+3ZeXEYB
         ZjvmBUtiXM+5Uwt6SE63UJlk4811v53vQ9x/ggD0tIgQX4jPP2b4B4fF9psnQu97ABTi
         WNwA==
X-Forwarded-Encrypted: i=1; AJvYcCVHPqjW74tWnDEJZ6Sgiv7Q5qFbaDW/O/A+Vyhys2uwdhNOIyAZEJq58biOsn1wyeGqTwyDFOfzgqIDMQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/VOo0agzau7Wwzufhb+tmxs0032fNQLsy2KH3qSrSvLeAkVd9
	PWq8TjV0v2db9eEgkMlDWwBfZTohimgcE1VQ4maqgUe7F1LST0RrLkzJBAORYDnoeNc=
X-Gm-Gg: ATEYQzxi1hytG4hHj10btKuzXsdrer4PquikA5WRDLduhYU1HXHn3PG+ocaxMdgVmq+
	k9l3WO5kCKhIljRN71aT9ENsjldNFU0+vQB1IBJ9yZ5iDtbeLz1nb/if3FDfURF7g5Cc9X4209f
	r5s9w5ELIu4Stwi7sndSY1rxl2trYVNt2X7k2HwuahyPIVPF1Jj1H3ZMJ1GAAtE85k3DhyOh7x/
	PNKScqtGc4zozj7iaM8ObHP2Yt9wA2MI+SpIccblxB10l6+mpjLyWt7Mx7hU/sdyKDKLcwuLnFZ
	c7rT4J/0qdz/0qovZNbms8JTiUZrvllezy6/UaCLjjLGIOGN6rcHhQhVavqN4q19Daq4zahtBhT
	brY1jugOpUa3o6EtFcUH8hAaCdrsqI+B/LNJvJvB8WuiQ7ywu7+7dtXAKZAoG98JdD+6yU2EJIi
	4+JuR57tIHoWFPKcIznPUoCkS+fuiYt0u5uhlts6f8mfY+edAtz2grqb3hV8QlYymJTLgvxbr9z
	Mq4PDPOPg==
X-Received: by 2002:a05:6214:3314:b0:899:e702:b852 with SMTP id 6a1803df08f44-89c6b5fbac4mr107205736d6.57.1773933870639;
        Thu, 19 Mar 2026 08:24:30 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-96-255-20-138.washdc.ftas.verizon.net. [96.255.20.138])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c6b8dfdf6sm49250646d6.5.2026.03.19.08.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 08:24:30 -0700 (PDT)
Date: Thu, 19 Mar 2026 11:24:27 -0400
From: Gregory Price <gourry@gourry.net>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
	Byungchul Park <byungchul@sk.com>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-mm@kvack.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH 1/2] mm: remove CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE
Message-ID: <abwVK8nLpSLVcT5G@gourry-fedora-PF4VCD3F>
References: <20260319-config_migration-v1-0-42270124966f@kernel.org>
 <20260319-config_migration-v1-1-42270124966f@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260319-config_migration-v1-1-42270124966f@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_082432_622798_A2D531EC 
X-CRM114-Status: GOOD (  10.66  )
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

On Thu, Mar 19, 2026 at 09:19:40AM +0100, David Hildenbrand (Arm) wrote:
> All architectures that select CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE also
> select CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG. So we can just remove
> CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE.
> 
> For CONFIG_MIGRATION, make it depend on CONFIG_MEMORY_HOTREMOVE instead,
> and make CONFIG_MEMORY_HOTREMOVE select CONFIG_MIGRATION (just like
> CONFIG_CMA and CONFIG_COMPACTION already do).
> 
> We'll clean up CONFIG_MIGRATION next.
> 
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

HOTREMOVE has long been a thorn in my side, I appreciate you cleaning
this up.

Reviewed-by: Gregory Price <gourry@gourry.net>

~Gregory

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
