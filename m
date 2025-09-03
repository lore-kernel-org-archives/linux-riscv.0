Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C6ACA1012
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Sep 2025 22:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eZhKwF+XhWNTkzj9M3LXUfEYQcNknUgotp5XYMskaA8=; b=vLfRtWjUtFUw+T
	mHmK7p3KXTaavjophYFQX1GAvwC7jYVccBufgySXswqgj4sf/Mzjxuc7lhOl1jpugpqV1wo6UBOBc
	9jF0CMq+1OtO4Jah73bzVNwdRVZr9nuNjnYJZh8ZUprTjmp3mw+6P2yjWtMrAw+m4Q+DA+FgdBqQV
	dD8VBck/RY6NJrp2RXJ6hF+raw6mhjZNPGm+Olkxl16gFXsnLM6JAOBDtSsDTP/kzjdBPZBc0L62s
	owqmxchbTi6Zg3kB1vebrwNzVZ9CinWymgE2YUu4+CwGpBMibiDxiBdGNWvBmAm7TI4o7n7zv9o7R
	eLYvSp4D2CGKTZ9OAZSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utwFs-00000007p3D-3ZsH;
	Wed, 03 Sep 2025 22:47:04 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utsc2-00000007Mcw-47j5
	for linux-riscv@lists.infradead.org;
	Wed, 03 Sep 2025 18:53:44 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3dcce361897so208957f8f.3
        for <linux-riscv@lists.infradead.org>; Wed, 03 Sep 2025 11:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1756925621; x=1757530421; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jw9BHN0FeRhOuxnLyFuwgicmhR7Ua+FygQwocs16V4c=;
        b=LB9H0E2G9rVT1Os6Tq/XncM8/diEvow89qHAGEbjZb1o+D4VFoWwx/y+KAlKBdYeYJ
         aIvpCFV5NWxclMNZF7O+AvuHcGO4/RRQQWp1EynfF28sMB/imzGqBPaFAWSF0LRjx7Y8
         zcm4rI+0sX+zIqD40ZFUqBffe+lbBZsBzbtl69Ghtd0UB2VCMDkCS9ghXWH2LOummVJn
         Hl0r6wHSkcOh1AUxh+ipaEVqohGiSkqDySxdcziiLamtstajeBKOBoZjdCDOo19tLUmT
         R64Nbehu/dMzXFb2G00aXW2f5O6JGFBur744HuJ3JSdcyeOwDuEfQJGp2iDap/FoExBJ
         x4xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756925621; x=1757530421;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jw9BHN0FeRhOuxnLyFuwgicmhR7Ua+FygQwocs16V4c=;
        b=cLoIXM1W3fqeLQbxHyD7y5Ucb+s+bp3aHnyEPUu3La4W0ioNsNuOM+23p4CWi3vp7T
         OP2qWdP7oJZBT4Pugp07Cj/AG8jXhYAtQ51XKpVkVucL/mSMdsgmHTe0CCqX6UvKF3pX
         wK+DzXnAKt4DOaolMQGuPqP85KSP6QFL2Ah18E+ikEjVCYfbLM8ZTW0UZsQwxOt2C1mK
         hDTmhN6SMqfGeNfF6VcQmIRZCxo770jUhlgpRWwpY8UswWBAmUoD/K2uRmAY/kljEQ0y
         /LSHD8S24vqD36Hkw/NsvlscF6mq6TI8tTViXRZHZ33zBR1J0VdC6YEbcd9zOVuWmY43
         zSMg==
X-Gm-Message-State: AOJu0YxmPvDKxjv26Q1ACvKXAM00lNzqjF+jSMKGCFV7HyGEDvthnvPv
	7SNHfXQBw9t7HF4R+JZOm9gyRI0IVXRnxSK+iIi96Fz5r6kLFmWfxO6I4XjzAG/DDKA=
X-Gm-Gg: ASbGncs0DVyc2MqkFG6wxZzo5Y98NbZ9dSbHww8aazhwfkqzK5EtjZYN/GHe18xNX76
	KJpZrFQm9+16nKJoj9tVtx42lNfF1qsKnQqHWo1aN5yF4dh1OfBW68WFmyIyxlfw765zf/WCYsB
	bwPnC0nrhxANZcF2YY8kW4djjdM+mNP35ehFtV/I63ZZQ0O+i2iUOyqNk3gvZbLGN3duBRFCmA+
	x4gk7OyIzf48EjGi5RF7Ldc44VUp0iomc4bHT8NU28+zNqld9EuF1/R6Wre/yjAbehejwd1oMxx
	Wj62kpmKhOpjDqG+V4XVTjt+upk3h+4NThlEbHO4Ia65MU8OAx/7aNlmvR5atP4puGVRwHnWYJi
	H74MKtNTfsCqmCxHCWV8lIBKUVVZOjW9UTIZzkjdk+CvIUveRIcXZvVuNCFkJJnh+Mw5bOdXq+G
	66Y/uJltXMeis/R1E=
X-Google-Smtp-Source: AGHT+IHOk7OXAl6oV2267O8szo6YMPylYzzI4Dr46hL2gWcdyGl5LwYgLiSHECqfj11Wp5eTPIQCDQ==
X-Received: by 2002:a05:6000:2381:b0:3d7:cd09:ae1e with SMTP id ffacd0b85a97d-3d7cd09b425mr7585878f8f.17.1756925621431;
        Wed, 03 Sep 2025 11:53:41 -0700 (PDT)
Received: from alexghiti.eu.rivosinc.com (alexghiti.eu.rivosinc.com. [141.95.202.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d690f2edf1sm13920647f8f.16.2025.09.03.11.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 11:53:40 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Wed, 03 Sep 2025 18:53:09 +0000
Subject: [PATCH 2/2] riscv: Fix sparse warning about different address
 spaces
MIME-Version: 1.0
Message-Id: <20250903-dev-alex-sparse_warnings_v1-v1-2-7e6350beb700@rivosinc.com>
References: <20250903-dev-alex-sparse_warnings_v1-v1-0-7e6350beb700@rivosinc.com>
In-Reply-To: <20250903-dev-alex-sparse_warnings_v1-v1-0-7e6350beb700@rivosinc.com>
To: kernel test robot <lkp@intel.com>, Al Viro <viro@zeniv.linux.org.uk>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Cyril Bur <cyrilbur@tenstorrent.com>, 
 Jisheng Zhang <jszhang@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexandre Ghiti <alexghiti@rivosinc.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1897;
 i=alexghiti@rivosinc.com; h=from:subject:message-id;
 bh=WwDwWn8PUMqzNmPRX5AJQr10TNESZyHkO/C2KBJ6k40=;
 b=owGbwMvMwCGWYr9pz6TW912Mp9WSGDJ29G2qCX+T9j37/c+fnfq7dTqqNA5eXy6TvlXmVMS7P
 PGnVtNsOkpZGMQ4GGTFFFkUzBO6WuzP1s/+c+k9zBxWJpAhDFycAjARwV0M/xQO+NxrPcCz4seK
 jYcYj+6IT7lUv6Ak6sOCQHb/cyx8fr8Y/hc0d90o7N7GUtb3nifIusPw69mPluJuU+yUKnK7Jl9
 p5gUA
X-Developer-Key: i=alexghiti@rivosinc.com; a=openpgp;
 fpr=DC049C97114ED82152FE79A783E4BA75438E93E3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_115343_040017_7C888A60 
X-CRM114-Status: GOOD (  10.76  )
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

We did not propagate the __user attribute of the pointers in
__get_kernel_nofault() and __put_kernel_nofault(), which results in
sparse complaining:

>> mm/maccess.c:41:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got unsigned long long [usertype] * @@
   mm/maccess.c:41:17: sparse:     expected void const [noderef] __user *from
   mm/maccess.c:41:17: sparse:     got unsigned long long [usertype] *

So fix this by correctly casting those pointers.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202508161713.RWu30Lv1-lkp@intel.com/
Suggested-by: Al Viro <viro@zeniv.linux.org.uk>
Fixes: f6bff7827a48 ("riscv: uaccess: use 'asm_goto_output' for get_user()")
Cc: stable@vger.kernel.org
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/uaccess.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
index 551e7490737effb2c238e6a4db50293ece7c9df9..f5f4f7f85543f2a635b18e4bd1c6202b20e3b239 100644
--- a/arch/riscv/include/asm/uaccess.h
+++ b/arch/riscv/include/asm/uaccess.h
@@ -438,10 +438,10 @@ unsigned long __must_check clear_user(void __user *to, unsigned long n)
 }
 
 #define __get_kernel_nofault(dst, src, type, err_label)			\
-	__get_user_nocheck(*((type *)(dst)), (type *)(src), err_label)
+	__get_user_nocheck(*((type *)(dst)), (__force __user type *)(src), err_label)
 
 #define __put_kernel_nofault(dst, src, type, err_label)			\
-	__put_user_nocheck(*((type *)(src)), (type *)(dst), err_label)
+	__put_user_nocheck(*((type *)(src)), (__force __user type *)(dst), err_label)
 
 static __must_check __always_inline bool user_access_begin(const void __user *ptr, size_t len)
 {

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
