Return-Path: <SRS0=jyWZ=FH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E40FC4361A
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Dec 2020 15:47:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2649205CB
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Dec 2020 15:47:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2649205CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=09F/r7rU4IG+HxCWT+Lz37kUf72Rrn8z/ynFDYJuk40=; b=A944irvR6DVRkdxMHJXy+GSsC
	OTeVJ/dtCf+89txalnqgSnuGsdORc6Jq8RGJ5eOqKbaAQ8snoL8GG6x/tqm6gFYCkSxHFI+5TQOa/
	1DS+khAHeqjLaCjnLWyp36r+GeLMhHhpI6ilQBBVLF+/+efWb437Yii/3X3VyOVZh4Kuqo+PfvFu5
	+52nOqzz6UhM2x+7/qBGRiMOeffz4dMlReKu9oXQShcnuw6G1j/gY3iuQEIISbe9JL3cITUNC6URG
	dor9aedz00Jy895+ln4b8tZvi7gMVXcqTzTrykY9bFMzcAQ8StKbNi9EGZihMqjXRY8v41oCO4njU
	eQcFVoJzA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkqpN-0002KC-V4; Thu, 03 Dec 2020 15:47:30 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkqpJ-0002I7-JN
 for linux-riscv@lists.infradead.org; Thu, 03 Dec 2020 15:47:26 +0000
Received: by mail-lj1-x244.google.com with SMTP id y16so3053646ljk.1
 for <linux-riscv@lists.infradead.org>; Thu, 03 Dec 2020 07:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/ayfcs9PdWYm7lbPtI7skq4RBm0f2Hr2bSO79nAHtFc=;
 b=qeNyZ8YsBRIcSSEnxPslZwdaQzbHNHWQrVBr58zRszE0F8P9QlO9s+F6Eup0AC7FxW
 QCI9RwkC5r87S1DcMFuQ0LGorDW6hc5tvP0HfgHeOOAQ4yRiIDrmcnabMErr46z25doA
 KuS+R05984StHPoMfsXc6p3fX8UtHh/OTtoHz+R5rvw8+PEVFCbi/ODbvauIcTOeBy/l
 LjY8bfJMs0j0jbctFehRcbnTYB5vfU33O6FRUX3G3dJeEzqE4yjZP8cwtzrXBtIu4V9x
 qG8OhxlOwT0sXfEVrrlcH+U1SXqjVUNsoLXauBwPRBppDacfBHal0+6hTivZDoWfPiUF
 I5fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/ayfcs9PdWYm7lbPtI7skq4RBm0f2Hr2bSO79nAHtFc=;
 b=IgxPWOsnx+5PF/8jAzefV/naXIkam2wHIfu0EWAtTfpVepsCwW/2q88aclLZLgRTv0
 5+9Os2isEWgKu901b3yoBc3GeEFoM5BGr09qKmhxauGiQE4limtmnglsvVgaFtSyCo+R
 eo8Mzx0ILpvGgd+Bq5MDYoyOAGccSB8XgRJr4MtLLOG0ylDflI55eOt0TV4bgK9hIu5m
 EsfeABxEa+Nrf1P4b5pJJOo0I+sEBpPV2cBtJ0uf5ia9lQOw0mEmaJkBOre35vie27ZM
 aY+XKfv6LMH//iSRuusNFs87pDsVj4QWXq+QLFLoD2kWGagXM2NvUBV0Aepkzj6km8Zi
 XDOg==
X-Gm-Message-State: AOAM532YHJBJU8G7aqBkxnKaJGt1Cymb2HCQ4zHKWcEchp9j0MK08TaP
 6MeEirtqSXhHQDLxya7V7T2ka8oriBdLASwIddSfvQ==
X-Google-Smtp-Source: ABdhPJwIWQzmwxHBiRB8EE+s5XaHTO5aY/OfRodwgESsla0us6E0o0PYvgEf52SU6B5EtE5PNDOv6vNy/ZwtEjOqjbg=
X-Received: by 2002:a2e:3c12:: with SMTP id j18mr1526064lja.192.1607010439133; 
 Thu, 03 Dec 2020 07:47:19 -0800 (PST)
MIME-Version: 1.0
References: <20201203062949.5484-1-rppt@kernel.org>
 <20201203062949.5484-8-rppt@kernel.org>
In-Reply-To: <20201203062949.5484-8-rppt@kernel.org>
From: Shakeel Butt <shakeelb@google.com>
Date: Thu, 3 Dec 2020 07:47:07 -0800
Message-ID: <CALvZod5-r+TmuAYS7ErpSPdF0RKN_F_CbNMoXQdqONbhPxunTg@mail.gmail.com>
Subject: Re: [PATCH v14 07/10] secretmem: add memcg accounting
To: Mike Rapoport <rppt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_104725_662176_62FC64AF 
X-CRM114-Status: GOOD (  11.36  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Linux MM <linux-mm@kvack.org>,
 linux-kselftest@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Christopher Lameter <cl@linux.com>, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Elena Reshetova <elena.reshetova@intel.com>, linux-arch@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, linux-nvdimm@lists.01.org,
 Will Deacon <will@kernel.org>, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Michael Kerrisk <mtk.manpages@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, James Bottomley <jejb@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Roman Gushchin <guro@fb.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Dec 2, 2020 at 10:31 PM Mike Rapoport <rppt@kernel.org> wrote:
>
> From: Mike Rapoport <rppt@linux.ibm.com>
>
> Account memory consumed by secretmem to memcg. The accounting is updated
> when the memory is actually allocated and freed.
>
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> Acked-by: Roman Gushchin <guro@fb.com>

Reviewed-by: Shakeel Butt <shakeelb@google.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
