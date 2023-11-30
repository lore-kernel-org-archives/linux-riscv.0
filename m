Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C4A7C4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 02:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P+Y7e1t40LRf1qO/I4u1cTIajWNbQDZdEGkqFgs1vEY=; b=hr4NhkJ2a6ZrYg
	u87TqAm1jZ4c2rVNRHHiERN2jFAGmAIc6Qz2x15HoUWLxv1gBVnJH2jAxCn64rnkHJdFnQvuWhxpv
	IY5ifq3Uj/y1wrjhGGI0tfLH7wxQAiAT4KAxe3Nb2x42Q5QTnEJ85c004s6Gk5OfHN9yRQirPqfbA
	kavETDtY3kbqn81c0Bc5i2JD1wapR5CnixJ03mqgl9rVK07Mgntn1mIzDsIr5ppUmpVXc/SYGfcuj
	cmYYxWNSlPBrs6x1e0zCqZnZkHY51j/sE7ylcYVHK5ETOSiZcoVJdjbSEYTf+JZ7BQa4yV9xfl8qk
	awW65wDmlWSSMtq7LpKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8XAK-009o41-0r;
	Thu, 30 Nov 2023 02:52:36 +0000
Received: from smtprelay0013.hostedemail.com ([216.40.44.13] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8XAG-009o38-15;
	Thu, 30 Nov 2023 02:52:33 +0000
Received: from omf05.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay05.hostedemail.com (Postfix) with ESMTP id 0CD43406F7;
	Thu, 30 Nov 2023 02:52:28 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf05.hostedemail.com (Postfix) with ESMTPA id 2F8892000D;
	Thu, 30 Nov 2023 02:52:25 +0000 (UTC)
Message-ID: <81c62af671ebbfad61dd46aa056050a56bf535a2.camel@perches.com>
Subject: Re: [PATCH v3 2/7] kexec_file: print out debugging message if
 required
From: Joe Perches <joe@perches.com>
To: Baoquan He <bhe@redhat.com>, linux-kernel@vger.kernel.org
Cc: kexec@lists.infradead.org, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-parisc@vger.kernel.org, 
	akpm@linux-foundation.org, nathan@kernel.org
Date: Wed, 29 Nov 2023 18:52:24 -0800
In-Reply-To: <20231130023955.5257-3-bhe@redhat.com>
References: <20231130023955.5257-1-bhe@redhat.com>
	 <20231130023955.5257-3-bhe@redhat.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-Rspamd-Queue-Id: 2F8892000D
X-Stat-Signature: gwk7qi3h7jx8h1ywf1jic8xo76gqerwm
X-Rspamd-Server: rspamout01
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19dPUefOesSFHLQCs3wqOW/oGlv3aC7z+4=
X-HE-Tag: 1701312745-366478
X-HE-Meta: U2FsdGVkX18k/ADXByHc+CtueZc2/kIRg2iYeavR6SwxdbkG44laEheGJWfEZEWXVPPjQNlGsgWVgExQ2v2SkjkkfNjpPwEMSuNPMyCDovT0AEEC3qeJ3Q3CanYRUyaIkLf9UCVzbPHogNji1emX5sy1KMlEpsNMU2L1IT5Ygh0f8/d2RbC7l5Zlkk01sF8weznUFCSh7sTGbvtjt1bjs0D9vOhDdBlZRMDNhbUzmGZ+P97DoYPvnsvnrduPVTPJ/denAd96V06q4DDxaFl1zt06dspwDHAATuNX205GsU5+pYEk/u0vlxrjfS1T3iX3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_185232_457534_C60E1E85 
X-CRM114-Status: UNSURE (   6.66  )
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

On Thu, 2023-11-30 at 10:39 +0800, Baoquan He wrote:
> Replace pr_debug() with the newly added kexec_dprintk() in kexec_file
> loading related codes.

trivia:

> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
[]
> @@ -551,9 +551,12 @@ int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
>  		phdr->p_filesz = phdr->p_memsz = mend - mstart + 1;
>  		phdr->p_align = 0;
>  		ehdr->e_phnum++;
> -		pr_debug("Crash PT_LOAD ELF header. phdr=%p vaddr=0x%llx, paddr=0x%llx, sz=0x%llx e_phnum=%d p_offset=0x%llx\n",
> -			phdr, phdr->p_vaddr, phdr->p_paddr, phdr->p_filesz,
> -			ehdr->e_phnum, phdr->p_offset);
> +#ifdef CONFIG_KEXEC_FILE
> +		kexec_dprintk("Crash PT_LOAD ELF header. phdr=%p vaddr=0x%llx, paddr=0x%llx, "
> +			      "sz=0x%llx e_phnum=%d p_offset=0x%llx\n",
> +			      phdr, phdr->p_vaddr, phdr->p_paddr, phdr->p_filesz,
> +			      ehdr->e_phnum, phdr->p_offset);
> +#endif

Perhaps run checkpatch and coalesce the format string.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
