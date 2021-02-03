Return-Path: <SRS0=OV2N=HF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 553BCC433E0
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Feb 2021 12:16:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93BCF64DF4
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Feb 2021 12:16:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93BCF64DF4
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GLfQeLbdM59zaXd/sCfuw87WUoZR+PDO3keVEn49jsQ=; b=c+jS6w8xarws4SqzShu4EBKUj
	mrUPs/vk9k+PmE8x+OyPJIr20/qZ8zU79dAjj7PiYC+gPWheTqswRc+NR0i0cdPzd1MTM1wpqYQ3I
	/jCdlzg+ydJsb1vyp42KhcJpd4u1vHvvECBBs1TmEPdrv8rHD9AW7VDv7Iz7vh2Pw5mk2ONVyckDi
	U303RclSzsL2BxA4snD4lRtQZEIkY9IFKvXhi1d646cU3e/bT4EeC6TkhooUqnADs7hHYi2d/WPJz
	bw7R1pGjhUBw29JyWKwo2zR/pFQzvvG4iXzrQzu8D58x9YAcU8h7z3TB2ht1os82SdR78S5vIsM/Q
	p8oahfgKw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7H4t-0000SZ-4u; Wed, 03 Feb 2021 12:16:11 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7H4n-0000PH-A2; Wed, 03 Feb 2021 12:16:06 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1612354564; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CWryIVYU+uhWQij5Zedr+mthwADlpM4pzIqLbc2PJTE=;
 b=ZO1FDrig5tnUD0sD709rRk12j9b+f6/535vnUH3W+CDbRbO/2c6Kc8pifEUT1BMziNVfXa
 CPTfjc6g/FfslyAYggad3k3ARdbimmNlG06TOX0F6IyHHo/BNMtx/NehxH/OCa8d7HxX5C
 VpPnKpOaRmZ4e14jLHdyuC1KXNF7S80=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E0430B17A;
 Wed,  3 Feb 2021 12:16:03 +0000 (UTC)
Date: Wed, 3 Feb 2021 13:15:58 +0100
From: Michal Hocko <mhocko@suse.com>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v16 06/11] mm: introduce memfd_secret system call to
 create "secret" memory areas
Message-ID: <YBqT/nwFpfP2EyeJ@dhcp22.suse.cz>
References: <20210121122723.3446-1-rppt@kernel.org>
 <20210121122723.3446-7-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210121122723.3446-7-rppt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210203_071605_545379_7E7C11B1 
X-CRM114-Status: GOOD (  14.20  )
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

On Thu 21-01-21 14:27:18, Mike Rapoport wrote:
> +static struct file *secretmem_file_create(unsigned long flags)
> +{
> +	struct file *file = ERR_PTR(-ENOMEM);
> +	struct secretmem_ctx *ctx;
> +	struct inode *inode;
> +
> +	inode = alloc_anon_inode(secretmem_mnt->mnt_sb);
> +	if (IS_ERR(inode))
> +		return ERR_CAST(inode);
> +
> +	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		goto err_free_inode;
> +
> +	file = alloc_file_pseudo(inode, secretmem_mnt, "secretmem",
> +				 O_RDWR, &secretmem_fops);
> +	if (IS_ERR(file))
> +		goto err_free_ctx;
> +
> +	mapping_set_unevictable(inode->i_mapping);

Btw. you need also mapping_set_gfp_mask(mapping, GFP_HIGHUSER) because
the default is GFP_HIGHUSER_MOVABLE and you do not support migration so
no pages from movable zones should be allowed.

-- 
Michal Hocko
SUSE Labs

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
