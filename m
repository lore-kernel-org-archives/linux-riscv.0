Return-Path: <SRS0=ovIN=HY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D139C433DB
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Feb 2021 10:24:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E912F6024A
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Feb 2021 10:24:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E912F6024A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=p2p/Dlb5CneureHirSJaSpogaj+v93YlTYHtrTEEZDA=; b=FgLa4jKQpgijR+fE1CmafALyt
	WNTPxR4uB2lUmoIc0Ro8s0mdTXkC7nVifrxTVkQHeuvUrylaMPmLw9hdCGzabmNrbIcu5GCAMHpGu
	qIRZeYHDfQplpANZ+NvL1LvhbH3eq6MIIuQfTW00TlFCJSfctyUCpXQ2BfXjhLD7lc24PiiKN1p4L
	9r0L0B+UNozeXLGgxqXD2jjGldJMk6a4FhnbcJN/LjWa0pXIpYyy4nrGgkrnLZpjnLxn/GMKjGqQr
	AjQK2oWiX3r9yCZqCnjH6yfJLnzYAGuk2II2sNhwBr5K0m+bUhIflIEDC5rSzzTN3Fv5ruMEjT1bf
	P+0b05moA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lE8O7-0007E4-2Q; Mon, 22 Feb 2021 10:24:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lE8O3-0007CL-2m; Mon, 22 Feb 2021 10:24:19 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 09BB564E2F;
 Mon, 22 Feb 2021 10:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613989457;
 bh=hPfUfFtTmjkrQbsktsKt6yfqMzt3/NRJ4jjF/NEBc8g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b3V9NfUxwhwIYN04tZ4xVJ3p5sqw8LDNui76vseSDtV/Re6690BnkfF+nR9DcxpOG
 pUgE90vqEFMU/X/MPAhMaZnhkphLp2hZD3Ly/S74TC7UD+nyJ2MxvQgUFzQn0n4cWr
 O38zmX3c++0vqSgjip+sme4YMMtTL5UAgX7/Dvrcr8EOMRxrQU75JWaHMRk39qP/AW
 lgAw/KQkfggAeoHx3YM+5n3m6vnlhaY/3Jp3VStjpjmNap+nGK6+o3g9qwoOyHxtFy
 vWZY83MCClCfU5xmCjWJ66fOJT92kzAT9sZgszmOAF/eGW/eyThqm6caGmwW8QA7LL
 32a3PdFZcp9HQ==
Date: Mon, 22 Feb 2021 12:23:59 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH v17 08/10] PM: hibernate: disable when there are active
 secretmem users
Message-ID: <20210222102359.GE1447004@kernel.org>
References: <20210208084920.2884-1-rppt@kernel.org>
 <20210208084920.2884-9-rppt@kernel.org>
 <20210222073452.GA30403@codon.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210222073452.GA30403@codon.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210222_052419_227795_9B79E277 
X-CRM114-Status: GOOD (  14.70  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Michal Hocko <mhocko@suse.com>,
 David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Christopher Lameter <cl@linux.com>, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Elena Reshetova <elena.reshetova@intel.com>, linux-arch@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, linux-nvdimm@lists.01.org,
 Will Deacon <will@kernel.org>, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Michael Kerrisk <mtk.manpages@gmail.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Arnd Bergmann <arnd@arndb.de>,
 James Bottomley <jejb@linux.ibm.com>, Hagen Paul Pfeifer <hagen@jauu.net>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-fsdevel@vger.kernel.org, Shakeel Butt <shakeelb@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Roman Gushchin <guro@fb.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Feb 22, 2021 at 07:34:52AM +0000, Matthew Garrett wrote:
> On Mon, Feb 08, 2021 at 10:49:18AM +0200, Mike Rapoport wrote:
> 
> > It is unsafe to allow saving of secretmem areas to the hibernation
> > snapshot as they would be visible after the resume and this essentially
> > will defeat the purpose of secret memory mappings.
> 
> Sorry for being a bit late to this - from the point of view of running
> processes (and even the kernel once resume is complete), hibernation is
> effectively equivalent to suspend to RAM. Why do they need to be handled
> differently here?

Hibernation leaves a copy of the data on the disk which we want to prevent.

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
