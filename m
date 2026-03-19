Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03F20109022E
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Mar 2026 14:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+XFTs8SxiCwM+qLDtqjgOtFB7W8pjAYGxJ/hz39CdCA=; b=fqn6NIR1eKlujl
	mfWl6bVLXwslkqZfOyBvO6fA+R6CIyCvEaEh6A/Mh07+tFdFztHPs2Y3lXCB2B4JdSPmdyKI2cmcm
	7PrDGq3HdnYUktVMf+/lP+3AFeHspvV+kHnx12GFgmo4rsvcVZljlHv85eOWB1l8/gjRJ9+bNXy1o
	LxLFunY6M6AtVGC221ou62oA0/MQRhxpwSHAZAex/sdFFpeiSJCMwg/7V/xALWpTEL+dXqCcdf6Hg
	dQHbDTO9vn3Op2/eFsOrM3W+ezYO96h4iMM0NQQCCLCg65F/PEEemnpnNRqNBpb11oNPILJ9+PrRx
	wZPuhXYRsUQRWyt2QEvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3E98-0000000Al23-2AUk;
	Thu, 19 Mar 2026 14:14:46 +0000
Received: from mail-oo1-f43.google.com ([209.85.161.43])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3E95-0000000Al0R-22OI
	for linux-riscv@lists.infradead.org;
	Thu, 19 Mar 2026 14:14:44 +0000
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-679f6ee3fb0so449390eaf.2
        for <linux-riscv@lists.infradead.org>; Thu, 19 Mar 2026 07:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773929682; x=1774534482; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ntFH0htT9ffFrh9knb0jn+m+GRQSXC/6K3X5v8dqre4=;
        b=gAcXCwc0sfPTUDMjD5KUKkuD/rlF8EIQj1hvWmLVYUa/9u1e3S4qrBxqcyHuO9v1dD
         zYwTM/fEAb495WimBZO7+lTYwJ2Io0wYCQ9uqUHMwuPh+xviXBDvRLL2fB34uGB+YSqD
         HjJZkoq27M3pgbg8hbMDpr+6oTtjJqQ38sImSM4rUam/AZvASSjivwRAWwYi0A+Se3CC
         vGRbi3NNBBXmOr8LAZHkve0chRnC/QxjDJ1wooMdUO9wf7lQRdFMip0YA4H3MTQcUWGR
         AetVsoteYG4JvwyYLWxnXy/gKKzneX7wGbCZpjvdoeQUg0afPjyAfEN81DY6ayrSaogX
         K01Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773929682; x=1774534482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ntFH0htT9ffFrh9knb0jn+m+GRQSXC/6K3X5v8dqre4=;
        b=JSnolOmsuCwiQWDPuYt/MErNPKAA/4TY1rid/F55kb1IHjvY3NQA7/sA7LK3kKbDVr
         o4hV9t9de31zDQFbVukAc7zDzcAIWipG66MXwuLRqekzF2pATfqVT2o4laXcN2aMZuiu
         /ZDrUSvTz8UezR6N8KSXy8Y1aIci2C7HNT7QlkRDG1RY6REsubAzuayH8tMnNbzFV0we
         WZU+rH5AOGOKNJ5q1s7W31GtTX6aEARUeJ7jA2yxleEcskZeWZwZGCFtkC6QG30nmpLm
         zKSlcrqsVGBrqRvXu7SAVuxX7qxTTEiZ1YyvfJVw67/oRNXvst8cLvgIabVb3LtR5LYz
         w4Lg==
X-Forwarded-Encrypted: i=1; AJvYcCVLcgfqb0QiAucABgUrsGM5JVqKCJvrMRqDKxluzzuT+uh4fN7ftyHnc15lUy0GDVYlkijsxb9RMRwhdA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyk2WvgNiUwzXNwAFNovwXjWqZWvXR5g4VMaZrpiM94KnMRKgf4
	RvAvXpCKjSV+Tc8MwLSseyWCVVE+x0DQy5mrNKmYnMCnCuZE/UcUdRMz
X-Gm-Gg: ATEYQzxziBKNz780jcCroByEqhZQf0Z2R+CYokW1317a6xfTKkU1P7JnkWWUClEJfEu
	QyqYvkwXsXWObx6D3WsxwzMbSryVlvnp7FCeMrv5RfDGXTgTRi+bPrLFLbYWMRzqXJGXI9rW+Jq
	xE7r5Ou9bhrfIQHZGmlVgp6g2bNKxNcp+icGP4A9BmUwtDBVfhk7jf4d9vtGIcXpL51cbc2/9wY
	Ew51qMEHK9YkFGdpHLaY1KlWTeYY2BGXewhGV+7OrL93lWZWcs4JsjzqpnOZU8vYYl5UIORIZVj
	mWVyp4YBHEVk0GgaLj86TnZPelNfKcECUTvh4/NizuLutJqRtF0QAkdRnhlv1YR6m/UQb/BvwTb
	E8gawnxzTYI2h10KfYJO9Gs1kg6IpzMdhUqA+BEtGXL1rGEoFj4P5Bo21P+cQCCOawoEjty3trb
	IDl0opY8I5nU6tIrl00GdL
X-Received: by 2002:a05:6820:1518:b0:67c:c4e:4ca with SMTP id 006d021491bc7-67c0dab23c8mr4161966eaf.29.1773929681867;
        Thu, 19 Mar 2026 07:14:41 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:8::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-41bd689e3cdsm5313808fac.6.2026.03.19.07.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 07:14:41 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Rakie Kim <rakie.kim@sk.com>,
	Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-mm@kvack.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH 1/2] mm: remove CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE
Date: Thu, 19 Mar 2026 07:14:36 -0700
Message-ID: <20260319141439.218078-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260319-config_migration-v1-1-42270124966f@kernel.org>
References: 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_071443_518100_D8CF66F8 
X-CRM114-Status: GOOD (  11.49  )
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

On Thu, 19 Mar 2026 09:19:40 +0100 "David Hildenbrand (Arm)" <david@kernel.org> wrote:

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

Hello David,

Looks good to me : -) Thank you for the patch, I hope you have a great day!

Reviewed-by: Joshua Hahn <joshua.hahnjy@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
