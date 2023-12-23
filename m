Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5986FC46CD4
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Dec 2023 02:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BDICqM+Wq64BhWvgGYS+LlVozLXwQ1xsFkbPbMKQPqk=; b=jZMET5UdnGfF9t
	lbbaPDJ9i7ZfXUWvu7yS42pjNF6W27pYuTr4HMsdFREaV7jaUH36p8+U7R3PCIu3K6cWgHke5sClP
	5b1/VFP0hCKhNHBVG4Jr2SqEq94uRfoTIIpfUCIhBjQD/nHbWeVxTIi6hG619Qibvs3oacFbyPQeO
	mlf+wsv7aNTxT+an3AGZEEDLngqzqGJ91vogmEXVulo43jrjyNnrOj7E6SKGxs2/o0LlSoFm66qQr
	u1ouRwKbR3pYl8gHCsNtUOr6BTjZ1q0zJa/uxT6XypNl6YLohuREHWmcbJva6tu23/SJlUQ/qHPGJ
	5gxKRp4QPuqkep0/U6Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGs7Z-007DUK-20;
	Sat, 23 Dec 2023 02:52:13 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGs7W-007DTg-0V
	for linux-riscv@lists.infradead.org;
	Sat, 23 Dec 2023 02:52:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1703299926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6FsXvda8piHC8mKVnVEUK8EOJKqYtl+i/XG7XRDw0vA=;
	b=JSK8eqBsPCc59sSrNB3kYBMfT/mJp2vmZP25/TjmsrBZ/A6kEnAFRu7ITCp0djbVmYOxGY
	8yCdDGYo/bTWD4UUzWLQ/xHNelNdQgKKuIFq11/Xefp78kUa8+U6WRAmeQZL5sqVwp8Ia7
	rd8OnrYx8fuQk1tIL1y08ITad0vy0AQ=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-6CzHsNafPSu37tkvXWNpLA-1; Fri, 22 Dec 2023 21:52:04 -0500
X-MC-Unique: 6CzHsNafPSu37tkvXWNpLA-1
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-6d26718254fso1301100b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 22 Dec 2023 18:52:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703299923; x=1703904723;
        h=content-transfer-encoding:content-disposition:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6FsXvda8piHC8mKVnVEUK8EOJKqYtl+i/XG7XRDw0vA=;
        b=w22uQQwluEvdNSiyAN6b0VsZIojFuNSNoRnk8mmANzLwcshpR1JuS9LAhBVveGOxh6
         aONiVKO2L/JP2b13SoFjrlvYQAzS3+MWPq+DTQIUTfvDX0m/cDLhqN6UNxj624nRXCJb
         Y3v3LvQii28QyBwm+0y85x/ocmPd1crrMBNzOXbUOmPgC2HDIdOeyExMeNRqYXc3xO6F
         +Nvf9I8r/Q+5EuIE9j4ZnNHM5KwEsXgsT3oQ7FHHpDoyYjgVzZ09Rkd0AfehKAOfySku
         l7sNABtyi226OMEnrcQSYlgFOszrAHQ7NfIyX3+A1CkCC0HxiVSDyNMMUrG1EnQjAUa7
         9ZIQ==
X-Gm-Message-State: AOJu0YwyTHSIX5SzydHYD36KkNskub3Ss4nsmwDHXjDRnJReXSOoJacU
	v+ymc1TClztQg8MRAjsovDbCzSaayoQ8k0LTw3DpM3GBQsrmzCJaqHb4CJ9ND01Z+IcVNtIPb2l
	azx9LgulsuVeni1Ri6hZYE65msJy15JVfu0/e
X-Received: by 2002:a05:6a21:78a0:b0:195:3e62:29b0 with SMTP id bf32-20020a056a2178a000b001953e6229b0mr977565pzc.81.1703299923021;
        Fri, 22 Dec 2023 18:52:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF6xlks/80GQ9vCPW4KsUSOdHlvisDMKZyHP//fnCHq7v50UmfEp6S/CaJroh718uKlIh90zA==
X-Received: by 2002:a05:6a21:78a0:b0:195:3e62:29b0 with SMTP id bf32-20020a056a2178a000b001953e6229b0mr977563pzc.81.1703299922697;
        Fri, 22 Dec 2023 18:52:02 -0800 (PST)
Received: from localhost.localdomain ([2804:431:c7ed:60ec:45a7:dfa:5e5:9eed])
        by smtp.gmail.com with ESMTPSA id jg13-20020a17090326cd00b001d398876f5esm4131410plb.121.2023.12.22.18.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 18:52:02 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: guoren@kernel.org
Cc: Leonardo Bras <leobras@redhat.com>,
	linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	alexghiti@rivosinc.com,
	charlie@rivosinc.com,
	xiao.w.wang@intel.com,
	david@redhat.com,
	panqinglin2020@iscas.ac.cn,
	rick.p.edgecombe@intel.com,
	willy@infradead.org,
	bjorn@rivosinc.com,
	conor.dooley@microchip.com,
	cleger@rivosinc.com,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH V3 2/4] riscv: mm: Fixup compat arch_get_mmap_end
Date: Fri, 22 Dec 2023 23:51:48 -0300
Message-ID: <ZYZLRNlEpVXECyq9@LeoBras>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231222115703.2404036-3-guoren@kernel.org>
References: <20231222115703.2404036-1-guoren@kernel.org> <20231222115703.2404036-3-guoren@kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_185210_294534_56DB70DC 
X-CRM114-Status: GOOD (  15.45  )
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

On Fri, Dec 22, 2023 at 06:57:01AM -0500, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> When the task is in COMPAT mode, the arch_get_mmap_end should be 2GB,
> not TASK_SIZE_64. The TASK_SIZE has contained is_compat_mode()
> detection, so change the definition of STACK_TOP_MAX to TASK_SIZE
> directly.
> 
> Cc: stable@vger.kernel.org
> Fixes: add2cc6b6515 ("RISC-V: mm: Restrict address space for sv39,sv48,sv57")
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> ---
>  arch/riscv/include/asm/processor.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
> index f19f861cda54..e1944ff0757a 100644
> --- a/arch/riscv/include/asm/processor.h
> +++ b/arch/riscv/include/asm/processor.h
> @@ -16,7 +16,7 @@
>  
>  #ifdef CONFIG_64BIT
>  #define DEFAULT_MAP_WINDOW	(UL(1) << (MMAP_VA_BITS - 1))
> -#define STACK_TOP_MAX		TASK_SIZE_64
> +#define STACK_TOP_MAX		TASK_SIZE
>  
>  #define arch_get_mmap_end(addr, len, flags)			\
>  ({								\
> -- 
> 2.40.1
> 


LGTM. 

FWIW:
Reviewed-by: Leonardo Bras <leobras@redhat.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
