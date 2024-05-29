Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82ABCC25B75
	for <linux-riscv@archiver.kernel.org>; Wed, 29 May 2024 21:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tHT0pI/fexTuMN0ioNIct2wPcTqfabP3ufshXRNJivY=; b=ihBQNLQmR4g7L3
	SRmqKK7luR4JFcKEpKI7jjK9wiTWS8xZ+dMCevQ7imuy9QzrRG2ywOFt+lxXOKyCDqpvQ6crS24YY
	4v58oj/WZGE1ZcfTB0CC8LPGQ0RK5Nvv9E19SRG6E8A8JzvMoQa0J0J2+BoKR7RXR+fwQF+b3w/TW
	wDuAjAe0IXFi+9mKN2uDn2e4AtqBoLgcwemePmU86RKJT5sPf6pVUrPi4HyYWKRAKFzPb0+C4ybRE
	6caUv8gfwwzvRQRDBBkQZkhb0yoQB0ZzPpOVxPhEQyaKiSxSCLr6MOhKmMFyAEJw/u5rS9sjRoSKg
	naFYmXSIY6uRoAg/QyDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCQdO-00000005XCg-1piC;
	Wed, 29 May 2024 21:14:58 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCQdK-00000005XCC-2hfr
	for linux-riscv@lists.infradead.org;
	Wed, 29 May 2024 21:14:56 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-681bee6bb13so308884a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 29 May 2024 14:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717017291; x=1717622091; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DyPCzefD6ExSaxdr+PjCGM46RBwZY2JmPFT75MS1UY4=;
        b=NLpySoTahKU2amdpW7/DnCvXWmW6e8WpWWzh0iD/Vmet4Pb8oIXOdF43tAKNcg49Fc
         9MPgSLyt9h9AgYqePRRpvt4RJHyi8kc1ZwkEHj3WCXHu3yPl+y+UY+Ut/PHU8qQhzGTk
         W5Ewiq0jxTXTbB5U0ukOw8IpIQ3W1mmvS5MxalBNvQGaI+3m8nKDuE2yw7FA/b+c0MCp
         sPciWqTy3ERm77g3zCi9Spp5dcIUXxWK5eTAO3eHtBTDZ6qZxg+ativ3nfMKsM420evG
         NaEgsZf0O+L6qS6uk8UNqYMEaRVZ76YCDmNT+V0kEHa6qJXoYpbTz9JgrTcDiuXratCw
         FCqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717017291; x=1717622091;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DyPCzefD6ExSaxdr+PjCGM46RBwZY2JmPFT75MS1UY4=;
        b=F7CU44AGiR5SgLeq5A4/pGQWjOkdGdio2naI4/Q947AePFWjzHe/Fy5D5NGLiccnXN
         k+wzk/+a0yVbErsYGIQs28/m4sEnav+g0XHmpcY2naMPWzHQS4TMKBAtS1/KPeXK5/Mn
         qm3h9LrJ8jURqwhu/7x9pZij7J39wPgwuNsBKZEFsaCTHAGKaZUhpWcbzOP2QHUBnpZd
         KJ4xVs1ev0oXzWH7nba/W014xVfuX34FRugULaECn88gNqoxcyVXLlivNM7Kuy5feWZF
         l/Zxb5W3EZc+PSg2ftY4jg6YlIiXTE+hsaKj9EzMmktlAxZKSEiCR3Ks8OKUDKjUEPED
         kJJQ==
X-Forwarded-Encrypted: i=1; AJvYcCU53nAcWCToyS/cxrh2E1B2V8dSymBgBCrjPr0xKps3mtTUTl6adO9SdJ/99Wzif3/b1Ywwz+Es7XbC6WGaAJe+ZvwegcYdcZKvheAzzxfh
X-Gm-Message-State: AOJu0YxQobgaTGTF5bsJ6SCj2tQ1KPt2RMbcws8o2TkzqJTUGBimh17i
	5YC7wbjWvutORSid1fqlmqhSmDzHiXwSHIu+8g+PYZmRbtycPAaB+g0rScfEbQg=
X-Google-Smtp-Source: AGHT+IG2IgGB1U/59maFbM1d4vodmm/pXlp59to7IcvevJSTn91eUicHERweTS3JUiNUrA0BDLmMlQ==
X-Received: by 2002:a17:90a:e150:b0:2b4:329e:eabd with SMTP id 98e67ed59e1d1-2c1acc2d94amr11415a91.2.1717017290645;
        Wed, 29 May 2024 14:14:50 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:32f9:8d5b:110a:1952])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c1a77656e7sm237485a91.7.2024.05.29.14.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 14:14:49 -0700 (PDT)
Date: Wed, 29 May 2024 14:14:46 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Evan Green <evan@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Yangyu Chen <cyy@cyyself.name>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Sami Tolvanen <samitolvanen@google.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] RISC-V: hwprobe: Add MISALIGNED_PERF key
Message-ID: <ZleaxvrTZWr8I6AX@ghost>
References: <20240529182649.2635123-1-evan@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240529182649.2635123-1-evan@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_141454_831975_70DE8488 
X-CRM114-Status: GOOD (  32.89  )
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

On Wed, May 29, 2024 at 11:26:48AM -0700, Evan Green wrote:
> RISCV_HWPROBE_KEY_CPUPERF_0 was mistakenly flagged as a bitmask in
> hwprobe_key_is_bitmask(), when in reality it was an enum value. This
> causes problems when used in conjunction with RISCV_HWPROBE_WHICH_CPUS,
> since SLOW, FAST, and EMULATED have values whose bits overlap with
> each other. If the caller asked for the set of CPUs that was SLOW or
> EMULATED, the returned set would also include CPUs that were FAST.
> 
> Introduce a new hwprobe key, RISCV_HWPROBE_KEY_MISALIGNED_PERF, which
> returns the same values in response to a direct query (with no flags),
> but is properly handled as an enumerated value. As a result, SLOW,
> FAST, and EMULATED are all correctly treated as distinct values under
> the new key when queried with the WHICH_CPUS flag.
> 
> Leave the old key in place to avoid disturbing applications which may
> have already come to rely on the broken behavior.
> 
> Fixes: e178bf146e4b ("RISC-V: hwprobe: Introduce which-cpus flag")
> Signed-off-by: Evan Green <evan@rivosinc.com>
> 
> ---
> 
> 
> Note: Yangyu also has a fix out for this issue at [1]. That fix is much
> tidier, but comes with the slight risk that some very broken userspace
> application may break now that FAST cpus are not included for the query
> of which cpus are SLOW or EMULATED. I wanted to get this fix out so that
> we have both as options, and can discuss. These fixes are mutually
> exclusive, don't take both.
> 
> [1] https://lore.kernel.org/linux-riscv/tencent_01F8E0050FB4B11CC170C3639E43F41A1709@qq.com/
> 
> ---
>  Documentation/arch/riscv/hwprobe.rst  | 8 ++++++--
>  arch/riscv/include/asm/hwprobe.h      | 2 +-
>  arch/riscv/include/uapi/asm/hwprobe.h | 1 +
>  arch/riscv/kernel/sys_hwprobe.c       | 1 +
>  4 files changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
> index 204cd4433af5..616ee372adaf 100644
> --- a/Documentation/arch/riscv/hwprobe.rst
> +++ b/Documentation/arch/riscv/hwprobe.rst
> @@ -192,8 +192,12 @@ The following keys are defined:
>         supported as defined in the RISC-V ISA manual starting from commit
>         d8ab5c78c207 ("Zihintpause is ratified").
>  
> -* :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
> -  information about the selected set of processors.
> +* :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: Deprecated. Returns similar values to
> +     :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_PERF`, but the key was mistakenly
> +     classified as a bitmask rather than a value.
> +
> +* :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_PERF`: An enum value describing the
> +  performance of misaligned scalar accesses on the selected set of processors.
>  
>    * :c:macro:`RISCV_HWPROBE_MISALIGNED_UNKNOWN`: The performance of misaligned
>      accesses is unknown.
> diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
> index 630507dff5ea..150a9877b0af 100644
> --- a/arch/riscv/include/asm/hwprobe.h
> +++ b/arch/riscv/include/asm/hwprobe.h
> @@ -8,7 +8,7 @@
>  
>  #include <uapi/asm/hwprobe.h>
>  
> -#define RISCV_HWPROBE_MAX_KEY 6
> +#define RISCV_HWPROBE_MAX_KEY 7
>  
>  static inline bool riscv_hwprobe_key_is_valid(__s64 key)
>  {
> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
> index dda76a05420b..bc34e33fef23 100644
> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> @@ -68,6 +68,7 @@ struct riscv_hwprobe {
>  #define		RISCV_HWPROBE_MISALIGNED_UNSUPPORTED	(4 << 0)
>  #define		RISCV_HWPROBE_MISALIGNED_MASK		(7 << 0)
>  #define RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE	6
> +#define RISCV_HWPROBE_KEY_MISALIGNED_PERF	7
>  /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
>  
>  /* Flags */
> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
> index 969ef3d59dbe..c8b7d57eb55e 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -208,6 +208,7 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
>  		break;
>  
>  	case RISCV_HWPROBE_KEY_CPUPERF_0:
> +	case RISCV_HWPROBE_KEY_MISALIGNED_PERF:
>  		pair->value = hwprobe_misaligned(cpus);
>  		break;
>  
> -- 
> 2.34.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

I am not sure what the "best" solution is here but making a new key is
most logical to me.

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
