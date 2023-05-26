Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC4D8C7EE23
	for <linux-riscv@archiver.kernel.org>; Fri, 26 May 2023 10:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fLseLdL7Ll/tb7MR9cHt9TfHZIKpSN7pVfPTmarsGFs=; b=FZzdmSeTrDbScM
	ooMLszrI5/LlM4X1kebgZ4udcV7plqoRRFrZ6kdwCRMnDUaQZR4GUJIjp8suU3VWFqemURGSTd/hs
	wx6hv53vaz7B9eluz3qJTWtePoV7C+Mjovvj0MflLPbFyOjg8nz3zVhAu8h81iql9InEk78BXyjNf
	D9EwHruZRiAd5zeh6CSLd80KVvQK07JPq1SYrFLLQCYig3esxRTN1ZCpuH8zj/hjF223X7XzOHWtf
	qbhbn2VC1uRF5Z5h1EZrpe+SDNKSjrC/JkBdhYuZO3KXEEc0/wglSc3ZXOzGVT2cK9ttd4UCqDo7I
	LaLwEYY8Xhcmhw4VJsXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2USv-001yad-1g;
	Fri, 26 May 2023 10:14:33 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2USn-001yWO-1g;
	Fri, 26 May 2023 10:14:26 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1685096062;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l0JCLWaWxAiVqnK2HID86lF3S13SCfgrB4rF/jITy/I=;
	b=ip+IsKji95mPrphWLVAUcdYl0y7pMoo/0rzxXxKZorc2i1ogyDwgLlmNAyb0qqipND//Q9
	mcdcjSKoJ1BmMv2yfve0Ih3RShF4W067n1L36VQOlRFjew11DbOIHP9BY3hPEmKWEMkYtF
	3++Mlj3E1pedAPDLuSJp8O8yrjmKl61cO3sikLlCo0aFQA4sDzjqIug5Y2sHJzxAouulen
	yWchVZzHYCyYvLl2IBhaE7LhZZ90HvEDnnYiIPfmZVnM5oPDhrPgISY7m926weiwqHfWOw
	VMBPX/ASMwnX6UaU0XNMhsxdic6Oppo5GnIK5pHcSkZVNuJmv/nyAhmosdGW7Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1685096062;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l0JCLWaWxAiVqnK2HID86lF3S13SCfgrB4rF/jITy/I=;
	b=mQPEsm7iwifOjyLdaiqWmBusXWewAsMMsfF7/82drVMMawEZjza+eT9dmICykmFbK9zGX6
	K4OvjM1+WRhVDmDw==
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org, David Woodhouse
 <dwmw2@infradead.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Brian
 Gerst <brgerst@gmail.com>, Arjan van de Veen <arjan@linux.intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul McKenney <paulmck@kernel.org>,
 Tom Lendacky <thomas.lendacky@amd.com>, Sean Christopherson
 <seanjc@google.com>, Oleksandr Natalenko <oleksandr@natalenko.name>, Paul
 Menzel <pmenzel@molgen.mpg.de>, "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>, Piotr Gorski <lucjan.lucjanov@gmail.com>, Usama
 Arif <usama.arif@bytedance.com>, Juergen Gross <jgross@suse.com>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org,
 Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren
 <guoren@kernel.org>, linux-csky@vger.kernel.org, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller
 <deller@gmx.de>, linux-parisc@vger.kernel.org, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
 Sabin Rapan <sabrapan@amazon.com>, "Michael Kelley (LINUX)"
 <mikelley@microsoft.com>, Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: [patch v3 31/36] x86/apic: Provide cpu_primary_thread mask
In-Reply-To: <20230524204818.3tjlwah2euncxzmh@box.shutemov.name>
References: <20230508181633.089804905@linutronix.de>
 <20230508185218.962208640@linutronix.de>
 <20230524204818.3tjlwah2euncxzmh@box.shutemov.name>
Date: Fri, 26 May 2023 12:14:21 +0200
Message-ID: <87y1lbl7r6.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_031425_716615_3BA4401B 
X-CRM114-Status: GOOD (  14.49  )
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

On Wed, May 24 2023 at 23:48, Kirill A. Shutemov wrote:
> On Mon, May 08, 2023 at 09:44:17PM +0200, Thomas Gleixner wrote:
>>  #ifdef CONFIG_SMP
>> -/**
>> - * apic_id_is_primary_thread - Check whether APIC ID belongs to a primary thread
>> - * @apicid: APIC ID to check
>> - */
>> -bool apic_id_is_primary_thread(unsigned int apicid)
>> +static void cpu_mark_primary_thread(unsigned int cpu, unsigned int apicid)
>>  {
>> -	u32 mask;
>> -
>> -	if (smp_num_siblings == 1)
>> -		return true;
>>  	/* Isolate the SMT bit(s) in the APICID and check for 0 */
>> -	mask = (1U << (fls(smp_num_siblings) - 1)) - 1;
>> -	return !(apicid & mask);
>> +	u32 mask = (1U << (fls(smp_num_siblings) - 1)) - 1;
>> +
>> +	if (smp_num_siblings == 1 || !(apicid & mask))
>> +		cpumask_set_cpu(cpu, &__cpu_primary_thread_mask);
>>  }
>> +#else
>> +static inline void cpu_mark_primary_thread(unsigned int cpu, unsigned int apicid) { }
>>  #endif
>>  
>>  /*
>
> This patch causes boot regression on TDX guest. The guest crashes on SMP
> bring up.

I rather call it a security feature: It makes TDX unbreakably secure.

> The change makes use of smp_num_siblings earlier than before: the mask get
> constructed in acpi_boot_init() codepath. Later on smp_num_siblings gets
> updated in detect_ht().
>
> In my setup with 16 vCPUs, smp_num_siblings is 16 before detect_ht() and
> set to 1 in detect_ht().

  early_init_intel(c)
    if (detect_extended_topology_early(c) < 0)
       detect_ht_early(c);

  acpi_boot_init()
    ....

  identify_boot_cpu(c)
    detect_ht(c);

Aaargh. That whole CPU identification code is a complete horrorshow.

I'll have a look....



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
