Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB0FAD59D99
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Dec 2025 23:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EHBxYnEt/D7RPNUGEZx+jTwEVp4GG4Dps0YHEQoMdj8=; b=zqaQppVsEG+2xl
	h8siZEO4LDRtAAXyuVPHG51rzMaaG2wQkZSr5ZdEk/ReaYWgbUaRSMotYE/JGCVlAzKxzu9aHp/QL
	O7Gmut0CNHu+sxkW0fo4XAFcidA+lUy21CK7wYP5UXgHNyYWpbZRS8vtWbjgZhz4x64sGajJbdkru
	7FRFQqCNtdAHGNn6LqiqWSr+j84RJCEdriYs79dbJDplAJDybfMcXExc0kWS0rtNMwnId4PPt0hnR
	JCq4cNqwpbybD2xT4E4dLsP3L95EP7L5og0KnYPkEHaMW91/FrjhXW3Ym9F8PrhLQNWaPKUBUHbgC
	ZC/3tVmUUVBIiGdFSMGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUvkc-00000002qTO-2Dwd;
	Sun, 14 Dec 2025 23:43:42 +0000
Received: from shelob.surriel.com ([96.67.55.147])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUvkZ-00000002qSz-3UGi;
	Sun, 14 Dec 2025 23:43:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=24kY9Nr5wlYZDF7jnKs9v6WeM4iMH9sHuTP5M2EV7I8=; b=WXbduQIYx6FgowO4SUfZ6UQl8P
	es6kKDSIyUC81IRgmPtsbh+zvONXuh8F1ntYsGSJ8xdAThIZdkwX9XlhvtqzPCbuBM1D4cxC2xKwA
	opuECmoBWHf337R/5oq41e1VeSiKyHsglXCKnuPrghV5bxnd3CqEFW6jxaaPMPLi7wTF8qQtdJbAS
	B9u9iNZDrTMvqVOoPBRu6RRtycVbFB1OY/IuCcsQjEm/75/P7FxC/6jOKZ8vI5+CZxc6AaGP5rkYo
	gUCxc0xFH5f4buE701MUd96DxLK5EJ8SxwPRYSCYnXsBWlfzFYY0SQtprriLKSo/yXcJ9dFI30JQr
	/IKZRalA==;
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@surriel.com>)
	id 1vUvgx-000000003ch-1imb;
	Sun, 14 Dec 2025 18:39:56 -0500
Message-ID: <ce226891413fe9c1d6f0c02697a32b646b4e0a0c.camel@surriel.com>
Subject: Re: [PATCH v5 2/3] sched: Make raw_spin_rq_unlock() inline
From: Rik van Riel <riel@surriel.com>
To: Xie Yuanbin <qq570070308@gmail.com>, tglx@linutronix.de, 
	peterz@infradead.org, segher@kernel.crashing.org, david@kernel.org,
 hpa@zytor.com, 	arnd@arndb.de, acme@kernel.org, adrian.hunter@intel.com,
 agordeev@linux.ibm.com, 	akpm@linux-foundation.org, alex@ghiti.fr,
 alexander.shishkin@linux.intel.com, 	andreas@gaisler.com,
 anshuman.khandual@arm.com, aou@eecs.berkeley.edu, 
	borntraeger@linux.ibm.com, bp@alien8.de, bsegall@google.com, 
	dave.hansen@linux.intel.com, davem@davemloft.net, dietmar.eggemann@arm.com,
 	frederic@kernel.org, gor@linux.ibm.com, hca@linux.ibm.com,
 irogers@google.com, 	james.clark@linaro.org, jolsa@kernel.org,
 juri.lelli@redhat.com, 	justinstitt@google.com, lorenzo.stoakes@oracle.com,
 luto@kernel.org, 	mark.rutland@arm.com, mathieu.desnoyers@efficios.com,
 max.kellermann@ionos.com, 	mgorman@suse.de, mingo@redhat.com,
 morbo@google.com, namhyung@kernel.org, 	nathan@kernel.org,
 nick.desaulniers+lkml@gmail.com, nysal@linux.ibm.com, 	palmer@dabbelt.com,
 paulmck@kernel.org, pjw@kernel.org, rostedt@goodmis.org, 
	ryan.roberts@arm.com, svens@linux.ibm.com, thuth@redhat.com,
 urezki@gmail.com, 	vincent.guittot@linaro.org, vschneid@redhat.com,
 linux@armlinux.org.uk
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, llvm@lists.linux.dev
Date: Sun, 14 Dec 2025 18:39:56 -0500
In-Reply-To: <20251214190907.184793-3-qq570070308@gmail.com>
References: <20251214190907.184793-1-qq570070308@gmail.com>
	 <20251214190907.184793-3-qq570070308@gmail.com>
Autocrypt: addr=riel@surriel.com; prefer-encrypt=mutual;
 keydata=mQENBFIt3aUBCADCK0LicyCYyMa0E1lodCDUBf6G+6C5UXKG1jEYwQu49cc/gUBTTk33A
 eo2hjn4JinVaPF3zfZprnKMEGGv4dHvEOCPWiNhlz5RtqH3SKJllq2dpeMS9RqbMvDA36rlJIIo47
 Z/nl6IA8MDhSqyqdnTY8z7LnQHqq16jAqwo7Ll9qALXz4yG1ZdSCmo80VPetBZZPw7WMjo+1hByv/
 lvdFnLfiQ52tayuuC1r9x2qZ/SYWd2M4p/f5CLmvG9UcnkbYFsKWz8bwOBWKg1PQcaYHLx06sHGdY
 dIDaeVvkIfMFwAprSo5EFU+aes2VB2ZjugOTbkkW2aPSWTRsBhPHhV6dABEBAAG0HlJpayB2YW4gU
 mllbCA8cmllbEByZWRoYXQuY29tPokBHwQwAQIACQUCW5LcVgIdIAAKCRDOed6ShMTeg05SB/986o
 gEgdq4byrtaBQKFg5LWfd8e+h+QzLOg/T8mSS3dJzFXe5JBOfvYg7Bj47xXi9I5sM+I9Lu9+1XVb/
 r2rGJrU1DwA09TnmyFtK76bgMF0sBEh1ECILYNQTEIemzNFwOWLZZlEhZFRJsZyX+mtEp/WQIygHV
 WjwuP69VJw+fPQvLOGn4j8W9QXuvhha7u1QJ7mYx4dLGHrZlHdwDsqpvWsW+3rsIqs1BBe5/Itz9o
 6y9gLNtQzwmSDioV8KhF85VmYInslhv5tUtMEppfdTLyX4SUKh8ftNIVmH9mXyRCZclSoa6IMd635
 Jq1Pj2/Lp64tOzSvN5Y9zaiCc5FucXtB9SaWsgdmFuIFJpZWwgPHJpZWxAc3VycmllbC5jb20+iQE
 +BBMBAgAoBQJSLd2lAhsjBQkSzAMABgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRDOed6ShMTe
 g4PpB/0ZivKYFt0LaB22ssWUrBoeNWCP1NY/lkq2QbPhR3agLB7ZXI97PF2z/5QD9Fuy/FD/jddPx
 KRTvFCtHcEzTOcFjBmf52uqgt3U40H9GM++0IM0yHusd9EzlaWsbp09vsAV2DwdqS69x9RPbvE/Ne
 fO5subhocH76okcF/aQiQ+oj2j6LJZGBJBVigOHg+4zyzdDgKM+jp0bvDI51KQ4XfxV593OhvkS3z
 3FPx0CE7l62WhWrieHyBblqvkTYgJ6dq4bsYpqxxGJOkQ47WpEUx6onH+rImWmPJbSYGhwBzTo0Mm
 G1Nb1qGPG+mTrSmJjDRxrwf1zjmYqQreWVSFEt26tBpSaWsgdmFuIFJpZWwgPHJpZWxAZmIuY29tP
 okBPgQTAQIAKAUCW5LbiAIbIwUJEswDAAYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQznneko
 TE3oOUEQgAsrGxjTC1bGtZyuvyQPcXclap11Ogib6rQywGYu6/Mnkbd6hbyY3wpdyQii/cas2S44N
 cQj8HkGv91JLVE24/Wt0gITPCH3rLVJJDGQxprHTVDs1t1RAbsbp0XTksZPCNWDGYIBo2aHDwErhI
 omYQ0Xluo1WBtH/UmHgirHvclsou1Ks9jyTxiPyUKRfae7GNOFiX99+ZlB27P3t8CjtSO831Ij0Ip
 QrfooZ21YVlUKw0Wy6Ll8EyefyrEYSh8KTm8dQj4O7xxvdg865TLeLpho5PwDRF+/mR3qi8CdGbkE
 c4pYZQO8UDXUN4S+pe0aTeTqlYw8rRHWF9TnvtpcNzZw==
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251214_154339_910033_A02625B4 
X-CRM114-Status: UNSURE (   5.32  )
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

On Mon, 2025-12-15 at 03:09 +0800, Xie Yuanbin wrote:
> raw_spin_rq_unlock() is short, and is called in some hot code paths
> such as finish_lock_switch.
> 
> Make raw_spin_rq_unlock() inline to optimize performance.
> 
> Signed-off-by: Xie Yuanbin <qq570070308@gmail.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Rik van Riel <riel@surriel.com>
> Cc: Segher Boessenkool <segher@kernel.crashing.org>
> Cc: David Hildenbrand (Red Hat) <david@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: H. Peter Anvin (Intel) <hpa@zytor.com>

Reviewed-by: Rik van Riel <riel@surriel.com>

-- 
All Rights Reversed.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
