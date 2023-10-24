Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69682C07545
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Oct 2023 03:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qVhCLbkPKT2VaYih21ALx+CWCIm0tyzfFtOfIQemxXg=; b=sH12yK+XQmUKSH
	vwl7PnuGUosnLGS1eiaXAJoG7JsVsfpJOrOhHXUrHOb0fji87PWFOIKoOIrP/Fuz5BAXzFUgR8ZSf
	Mgskl+BOyKT1yK2gKyyGqufOOstfpxoSc9+VvjdZTzy267ytuYfbjqcx+uzgs3v649B1aLe1Y5aU0
	FGwL/zshN19q9LtQMbcU1nnAJApVwpR0YhUmmNEo1wroKnj8kjh/WAf6OS/JsEEKfRddvTUjRLFFm
	ty+PkfUy+i+sksE8OWH1laNkMhHV0SfLLsaWNC1KJdYHRz2iBA1SVdPhRY0+HU9LZOK82pkuXelmy
	7u3PYcpn/9AM23S8V6rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qv8WI-008l7d-0i;
	Tue, 24 Oct 2023 03:55:54 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qv8WF-008l6k-16
	for linux-riscv@lists.infradead.org;
	Tue, 24 Oct 2023 03:55:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698119747;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kNDuXbYjtRLJzfaUrnn30bwHvtiVZ7rNQxf0BdBPcfY=;
	b=Zo4ecurStT/4IsTz8iqmUOyCzNxcY5Ei5UXa/sJ1VeaoRDs41kBdoMdNqHQcHMSXhFC/oK
	ChDxvJ7B4vxLvykGYGvCKcKWvSvAfsdq6z5GdpGN+ZYmiGugq3pS+3HTGQgDgFOum1zLTj
	sD6P/PvZ97tBaIqrkbAFkox/AVimh0E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-570-nUyCnobAM5ix9yYjgAujlg-1; Mon, 23 Oct 2023 23:55:32 -0400
X-MC-Unique: nUyCnobAM5ix9yYjgAujlg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D8E0680F8F5;
	Tue, 24 Oct 2023 03:55:30 +0000 (UTC)
Received: from localhost (unknown [10.72.112.15])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F066D492BD9;
	Tue, 24 Oct 2023 03:55:28 +0000 (UTC)
Date: Tue, 24 Oct 2023 11:55:26 +0800
From: Baoquan He <bhe@redhat.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Vivek Goyal <vgoyal@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>,
	linux-crypto@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Eric DeVolder <eric.devolder@oracle.com>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Ard Biesheuvel <ardb@kernel.org>, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, Hari Bathini <hbathini@linux.ibm.com>,
	Costa Shulyupin <costa.shul@redhat.com>
Subject: Re: [PATCH 2/2] kexec: select CRYPTO from KEXEC_FILE instead of
 depending on it
Message-ID: <ZTdALtO2rN4FaneC@MiWiFi-R3L-srv>
References: <20231023110308.1202042-1-arnd@kernel.org>
 <20231023110308.1202042-2-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231023110308.1202042-2-arnd@kernel.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_205551_470312_FABCAFAF 
X-CRM114-Status: GOOD (  22.57  )
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

On 10/23/23 at 01:01pm, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> All other users of crypto code use 'select' instead of 'depends on',
> so do the same thing with KEXEC_FILE for consistency.
> 
> In practice this makes very little difference as kernels with kexec
> support are very likely to also include some other feature that already
> selects both crypto and crypto_sha256, but being consistent here helps
> for usability as well as to avoid potential circular dependencies.
> 
> This reverts the dependency back to what it was originally before commit
> 74ca317c26a3f ("kexec: create a new config option CONFIG_KEXEC_FILE for
> new syscall"), which changed changed it with the comment "This should
                       ~~~~~~~~~~~~~~ typo
> be safer as "select" is not recursive", but that appears to have been
> done in error, as "select" is indeed recursive, and there are no other
> dependencies that prevent CRYPTO_SHA256 from being selected here.
> 
> Fixes: 74ca317c26a3f ("kexec: create a new config option CONFIG_KEXEC_FILE for new syscall")
> Cc: Herbert Xu <herbert@gondor.apana.org.au>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: linux-crypto@vger.kernel.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  kernel/Kconfig.kexec | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

LGTM,

Acked-by: Baoquan He <bhe@redhat.com>

> 
> diff --git a/kernel/Kconfig.kexec b/kernel/Kconfig.kexec
> index bfc636d64ff2b..51f719af10e79 100644
> --- a/kernel/Kconfig.kexec
> +++ b/kernel/Kconfig.kexec
> @@ -36,7 +36,8 @@ config KEXEC
>  config KEXEC_FILE
>  	bool "Enable kexec file based system call"
>  	depends on ARCH_SUPPORTS_KEXEC_FILE
> -	depends on CRYPTO_SHA256=y || !ARCH_SUPPORTS_KEXEC_PURGATORY
> +	select CRYPTO
> +	select CRYPTO_SHA256
>  	select KEXEC_CORE
>  	help
>  	  This is new version of kexec system call. This system call is
> -- 
> 2.39.2
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
