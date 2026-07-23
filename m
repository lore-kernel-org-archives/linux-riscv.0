Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D77C531C7
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jul 2026 06:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EtxYb2hLPxy2NLSe6PJsUhv8ulXnOQoUVb6c8FsIvLY=; b=lMNkXKWtBhsM6O
	GXO6LXioAt5qrcKGkULnlq/XDUzAbkZaWN2ICOsqB8QR5Gtd1NPE2ZOd4J4Wnx9kLylyQSjbXFZBn
	Iyf4g8+SCrAlfJK7ccymWv72QZwebw8CwGLKSVmgVaaLIvoxY2vQXE4CVM0elxroVMGh30ne/r5Kw
	QgaOKjhYdI2B9fJpqv+zZqI/EV3ZOYscPpaMvC7v7mPGEDKWDsxQzicG2CvsSvsi06Vmae6JMo5fP
	03OlpWNXfcnL6ftrO+4J1rdFRElQ2MGxC3Ne1J9V5+XbPG3v/CTc5hEaFwFJOCx16fhdKM6mO+ZvJ
	kVfL1UBibZ4JlSJvwi0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmnAo-0000000DZSm-1Kan;
	Thu, 23 Jul 2026 06:44:50 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmnAk-0000000DZRp-3LgL
	for linux-riscv@lists.infradead.org;
	Thu, 23 Jul 2026 06:44:48 +0000
X-UUID: faaebaf2866111f1aa26b74ffac11d73-20260723
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:e242e081-c494-4aa3-a82d-733feacf8b5a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:c4a2b4a85359be396a6d2c449ef42505,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|865|898,TC:nil,Content:0
	|15|50,EDM:-3,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:
	0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: faaebaf2866111f1aa26b74ffac11d73-20260723
X-User: jiangfeng@kylinos.cn
Received: from [10.42.12.56] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <jiangfeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 839911132; Thu, 23 Jul 2026 14:44:40 +0800
Message-ID: <3355f1cc-4059-475e-9e52-4bca9b10ed98@kylinos.cn>
Date: Thu, 23 Jul 2026 14:44:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] kunit: string: add strnlen SIZE_MAX test coverage
To: Gao Rui <gao.rui@zte.com.cn>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>,
 linux-hardening@vger.kernel.org
References: <20260722064037.1111467-1-gao.rui@zte.com.cn>
 <20260722064037.1111467-3-gao.rui@zte.com.cn>
Content-Language: en-US
From: Feng Jiang <jiangfeng@kylinos.cn>
In-Reply-To: <20260722064037.1111467-3-gao.rui@zte.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_234447_153563_338AA350 
X-CRM114-Status: GOOD (  13.75  )
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

On 2026/7/22 14:40, Gao Rui wrote:
> Extend string_test_strnlen to validate strnlen behavior with
> SIZE_MAX input:
> 
> - Add explicit test case for strnlen(s, SIZE_MAX).
> - Ensure fallback to generic path returns correct length when
>   string has no NUL terminator.
> - Complements existing tests for non-terminated strings and
>   boundary conditions.
> 
> This improves KUnit coverage for extreme inputs and verifies
> the correctness of the new fallback logic in strnlen.S.
> 
> Signed-off-by: Gao Rui <gao.rui@zte.com.cn>
> ---
>  lib/tests/string_kunit.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/lib/tests/string_kunit.c b/lib/tests/string_kunit.c
> index 0819ace5b027..8e2e8980aa75 100644
> --- a/lib/tests/string_kunit.c
> +++ b/lib/tests/string_kunit.c
> @@ -155,6 +155,16 @@ static void string_test_strnlen(struct kunit *test)
>  
>  	for (size_t offset = 0; offset < STRING_TEST_MAX_OFFSET; offset++) {
>  		for (size_t len = 0; len <= STRING_TEST_MAX_LEN; len++) {
> +			/* Test strings without NUL terminator */
> +			s = buf + buf_size - offset - len;
> +			if (len > 0)
> +				KUNIT_EXPECT_EQ(test, strnlen(s, len - 1), len - 1);
> +			if (len > 1)
> +				KUNIT_EXPECT_EQ(test, strnlen(s, len - 2), len - 2);
> +
> +			KUNIT_EXPECT_EQ(test, strnlen(s, len), len);
> +
> +			/* Test strings with NUL terminator */
>  			s = buf + buf_size - 1 - offset - len;
>  			s[len] = '\0';
>  
> @@ -169,6 +179,9 @@ static void string_test_strnlen(struct kunit *test)
>  			KUNIT_EXPECT_EQ(test, strnlen(s, len + 2), len);
>  			KUNIT_EXPECT_EQ(test, strnlen(s, len + 10), len);
>  
> +			/* Test Count overflow fallback */
> +			KUNIT_EXPECT_EQ(test, strnlen(s, SSIZE_MAX), len);
> +
>  			s[len] = 'A';
>  		}
>  	}

A similar patch has already been submitted:

https://lore.kernel.org/all/20260526085913.429049-1-min_halo@163.com/

-- 
With Best Regards,
Feng Jiang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
