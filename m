Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF03F606A321
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 06:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Arv647/G;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tsCVCYPn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=UMTJFIcZx9fFWUbVU0WCzl0f0MtZyX274J7hVq0KhlY=; b=Arv647/GroC+FElYlUAf4+c5CP
	cY8qSdmbxdhI6/T6jqKHKQcaiG1zkI6f7s/AFJK0iv00M3HEPQvXaDozJbcfyMAXETYc/oY0VRlok
	mWECZT+KoO+bQkdgyxO6sd5fjKLQd38q6QSINb5z3xEX4m5Feu4A5fN7ikt1b8dP2ZKvnw1k5VnV2
	hi5CCkLuB4TNKaGSqYnrgQNjMBYbZKlEBLWMG/5UrUTzOT2AOk3yKuK8mJPliHW/jwgH9urgdAug5
	NkY2PK/iOTiNxrN02i7f9+C+v7cBJursXOWDT73/Fm5WnLskwhjFNaRh2f5q6apdNJMGHTZMBREq8
	lJckj7EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfRs-00000002f72-1OaD;
	Tue, 10 Nov 2026 06:35:16 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfRp-00000002f5r-1YxZ
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 06:35:14 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-49465892f7bso1120905f8f.1
        for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2026 22:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794292511; x=1794897311; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SrAtUp9emSKSwdDhGVp75ycz8yJkKPQkr0AQDP+R5XY=;
        b=tsCVCYPnNFErOpVg6cl8WqT1X72MRbblT9wNfU56gZ/9k0YkgqGinTrgsRbDJ6cQoz
         Tn/ZEPdx1QnEkYbzJeIdkF0ZRDYEpieP3EiocVM8gZPthhOeOBkT4w/wblVlI7+mgV50
         Dar8jEU6mYZyolI/uPOsXX+fheGjTUy4A2lqylhJG/Ww/Z3A167RqSF3PmxkaoVToLQ4
         iXh7Dpti20CQMZqskFKSXR+0dxTR+dlZq3850ZikCGVYkaM46KT56RHG0ZU7y00TtHHs
         1gcLSoITCJ01D2qO9MHthZd+i9h7py7r8hJcuQg6vA48A8I2DOZcow1oQjiCBVzbEA7x
         eYTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794292511; x=1794897311;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SrAtUp9emSKSwdDhGVp75ycz8yJkKPQkr0AQDP+R5XY=;
        b=BMNVdTxLNLQXeWcuAwdEkF5H1JvCBT+9DdRTUKcLOMRik8yonCV84pyTf8kJ61Du9D
         4KT+HaJsZ5Xz4fQ1cs2n5lwmQ+qcfPWg7GKJgBwiMIK6APw8/E5WSEgdZjkgous/YgH1
         cc9RWH4Rpz4EnXZ/lWhcMHzGtYnsYUpM8D5/d+7Cmv8f8WzpG6WrRImCv0Tspo/Gzpdg
         wwNfh0JSMYBeLnZ3gSQ+jcFiTQb/UPGwRR1g31QQO0Rb51XGDd+NcQvBV4D4KZEo4gQL
         pGdozBwsc4jzvRFvKjLrcNx77D+vVXa9vty6d0NjI9vUWX14ap5guTPuao52jixM1SOf
         ZBFw==
X-Forwarded-Encrypted: i=1; AL+hErGlUHfivVmeBrcg4W2AP38Q3jREGBkz+Si+vJJfxAxN7xVF1MauOFekVQ4XbhgYkRdxjzgrmXRr2c01uw==@lists.infradead.org
X-Gm-Message-State: APuU4Z8CMhT3FWW6iaZkL7BIqW89XMEammkyDA2I1HoAYSPMnG69pJmv
	EQ1Pa7mmKWFfaSaCErEE0bv2f6qkDHrSKJklQBADjTaOo5xZ6WFRq56K
X-Gm-Gg: AYBFou3tqg6nxCRnN2MRr9lNSKneu/HRf9iU92rH+5NqtlvIszkteS8zWYJE9D14jGQ
	zr9apO9138lu3PYQEWvkq0kwoes1A6aFe0UuIYs3Rhv7P6Wqzxei5txgDntuW/BWNalj7Xg+Zjb
	vlgJJR7ugXUDMDDYwa7I/LWXFN3ovUePGKDz1+S1QIl1DwqIQeXeB7uBwsX41ibH4CpQj8TG3TM
	hku3PbJFZGInqCVbEyXg46FuxYeahDtvLBYdzDXGagZHhy4Rhu84HZPAm64d5CbJVhT5szqLCax
	QiAxA1/BR3oIL4sjNFjhFEk4+VAfzjyaRZBaOA8HIFEOJQlTNbGlCjb8jjzMOXXf8zZwT5pUVVb
	h4g+fr3QZ3ThsV7LnVo9SQ0n5Ibr3jWHXnzLFqJjVsz25VkILcNksUIH5OZDiI7P2yuXkRlx/Ny
	iig37i8QheAGeJ6OQZZkGxDCH0JYVEP4mEJyHt2PXSPPRee6eX8dUA4/uVwIzNmBrUbvJtMwS4q
	p3x+kgbxlTbH8L9JvEW7rOBjY03ZNplbwbjgkCWQxuBtLkqKS0pyEgGmrKcJ5EKsxrHfMD93qjp
	tLnFrEzV7uefJgjmH++und0G+9UJVfVXDmNiDyjXiNYCKk3vSumKl4PA6zfpxN9YyUWwkhXT+Ca
	ny2dhnPuAvlFKElgdA6zvWe3Acqj0F8Obz/mLzWck9X5bdLQWsvJ/NnRddrQPbkB0QwTA5H+Zc1
	EFQaw0x55jbRkqDCz5riDWBSP0QgjSStQ=
X-Received: by 2002:a05:6000:288f:b0:48e:3cec:b852 with SMTP id ffacd0b85a97d-498306d02e3mr2957082f8f.40.1794292510590;
        Mon, 09 Nov 2026 22:35:10 -0800 (PST)
Received: from MacBook-Pro-von-Karl (dynamic-2a02-3100-a0e9-dc01-c402-36c1-c306-953c.310.pool.telefonica.de. [2a02:3100:a0e9:dc01:c402:36c1:c306:953c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498366c500asm3241156f8f.48.2026.11.09.22.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 22:35:09 -0800 (PST)
Date: Tue, 10 Nov 2026 07:35:07 +0100
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Shuai Xue <xueshuai@linux.alibaba.com>
Cc: palmer@dabbelt.com, pjw@kernel.org, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, linux-riscv@lists.infradead.org, oleg@redhat.com, 
	rostedt@goodmis.org, mhiramat@kernel.org, mark.rutland@arm.com, peterz@infradead.org, 
	mingo@redhat.com, acme@kernel.org, namhyung@kernel.org, 
	alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com, 
	james.clark@linaro.org, jpoimboe@kernel.org, jikos@kernel.org, mbenes@suse.cz, 
	pmladek@suse.com, joe.lawrence@redhat.com, shuah@kernel.org, mpdesouza@suse.com, 
	martin@kaiser.cx, oliver.yang@linux.alibaba.com, zhuo.song@linux.alibaba.com, 
	jkchen@linux.alibaba.com, linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v7 00/10] riscv: Add reliable stack unwinding for
 livepatch
Message-ID: <avK6oydgmtsa_Sjg@gmail.com>
References: <20260914092648.51254-1-xueshuai@linux.alibaba.com>
 <20261110013750.36800-1-xueshuai@linux.alibaba.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261110013750.36800-1-xueshuai@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_223513_450730_723A2B27 
X-CRM114-Status: GOOD (  12.79  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 10, 2026 at 09:37:40AM +0100, Shuai Xue wrote:
> Changes since v6:
> 
> * Rebase onto the current riscv/for-next (based on 7.4-rc1).
> 
> * Fold in Karl Mehltretter's two patches [1] as 1/10 and 2/10. Patch
>   1/10 stops arch_stack_walk() from reporting the walker's own frame as
>   the first entry, which corrupts the skip-frame accounting of
>   stack_trace_save() users (page_owner, perf), and adjusts
>   return_address() level accounting accordingly. Patch 2/10 adds a KUnit
>   test for the start frames. Both patches keep their original authorship;
>   I added my Reviewed-by/Tested-by and sign-off. I asked Karl on
>   3 November whether he would like to see his patches folded into this
>   series; he has not replied so far. Since 8/10 reuses the walker
>   extraction from 1/10 for its !CONFIG_FRAME_POINTER fallback, his
>   patches are included here to keep the series self-contained.
> 

Thank you for folding those patches in. I'm fine with that.

Regards,
Karl

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
