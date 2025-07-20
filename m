Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B74CA0EC4
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Aug 2025 22:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8wPZYQ7+Ufq6izFpop/O6QeomWtClPGIM8aqNBbdYqM=; b=kJNfAPcRuKkkGB
	NsuGzNgEsiyNLVBkJTCPVGbzO+PuxjewuaJZkkXLR0S/1m2AmnLY95FIgE7OVBKGZtw3HWJmsBpOh
	xy149tEETXFoDgof06F6L5veV1ES7j+M3tUgc542i+WG2+vmM+9tUGb+51L5G0yamcGDdAWt7Wn4i
	n5TDh57Y8BrToGpJXcIgJFAWx0Ha0g1DguB2XiJZiMzQc5w1HkmuBXAFTYTwM41dudvPaEu0wHwVw
	3gx27lJHnswKDBte7vzH57qTsC+Kxb28C3VpoAsxRAQzdYUmwFeDdEr5PnmpSzzOLef17geKqZQkN
	gKGLI7Cev0kzeQkWeZNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulx25-0000000C6ro-0tYo;
	Tue, 12 Aug 2025 21:59:49 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udQ3u-0000000F4wV-2aH9
	for linux-riscv@lists.infradead.org;
	Sun, 20 Jul 2025 09:10:27 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-32b561a861fso29362171fa.0
        for <linux-riscv@lists.infradead.org>; Sun, 20 Jul 2025 02:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753002625; x=1753607425; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=N0ftmC07bPJUHX/2kEDOcXbA7qHmCdGf8ARIf1w4s7g=;
        b=dnCAu7ei7lI/eK+gvsgTg9ovoccxKdVWYi/UPXXlcAL/uJt7YZIN3QYRFtpvh6vq38
         LoNN/0bqS6oTTkEhXUU1/s9t/ShRIrlJ1vXStdvRhartFIKWLlcwa4XqO8hFgU0WZPFP
         UeSce6cY0wg7XuvWBL7fMqMkxwzu/+oMLv66mZmillkVFyN7PIFw8dd8BxlL1yyVMQDM
         eNviPptxW7Ap9NNYefkDfVCcltxiY3Rce9KKVctp8UdCYXSUd+8p/Lff9a3RUZeRM1sJ
         NqhvtHqVnjHpicb0Ce0REhj69zOvqDUgAh4yfcpQxzD0X9nWUPfEfe1uwD1XeuwbKx9V
         /xhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753002625; x=1753607425;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N0ftmC07bPJUHX/2kEDOcXbA7qHmCdGf8ARIf1w4s7g=;
        b=FGIBBJr5rllmZTE0vf0YGyvkuXneWUgb9jkebQJX7w/n8pi94wS2LA8pfqm7zuk3D2
         kZJX5U4yFUXyYCBgJ8N4Ktyy5gDortCpjoZ6Di4mqLC0amXdbKkSNGPjShnjA3pjJkuU
         5d6sWoAE+LEx8eiRMIVZAb7av29/7qd4AUnH6mrRZxB0iojcXZeXX4hvyZ7AhhWrBkcG
         zWpEr3VAcBwgznYNy32CJldMrmrazJEY68xsFmO8UHwzjugYEuv9ehrPOxBj1trziJcY
         QVdAiaOPUBvkpXyG0hi8HlwEFO0WIrNSiyM5PMlZ9X4yw6gDutXm9ynCO8rPPBnYDbvL
         Ii9g==
X-Forwarded-Encrypted: i=1; AJvYcCXyec0Ua8GRkZWgzwglhe0V1wgnES2mzzWhqVeV8ladRp/iGq5BV/Ua/nL5QclCiQL3HG8YraxqEUpIig==@lists.infradead.org
X-Gm-Message-State: AOJu0YzUabSFTTOckF4gjtNBz9DzQkD/sEFUejw2lWNZn/uX741Rnj7n
	p2AxzsbTNtItx0KDr1HlMuABuayMuzQiC/8xElhWAH/PqUk0UfuvpATgUit4jIKMDJnJHQmn34M
	1+cOUDjDpLKZNT6z2U32ykl0Hf3SPJpI=
X-Gm-Gg: ASbGnctWmdMXuztTiImEzej9iOwPqPSQv/TaRRv54rzg5/7qmxW2dnwLANTZh94RqS7
	Ra/42vRgfGYLc/HUDknrjwMKRCxqoix7/wugsfBZEAaygpvpcKoDGLltMZVJzbamtyhc0V1/fFS
	gD31eWC6xs5+vilGwuiNOUOmu1uSl6fJzWMN6DGozR8MQ1dOPLFXTvax5cDB4Cj6MJoOl96AXlg
	vBVxg==
X-Google-Smtp-Source: AGHT+IE5xxEtscj8W8X3uqNEj4QG9qJNtLWSFq770DqhyUeRlqJ6lVyN1byWziP7D7DbO8NLTjOth80sHUD6ftGLYmU=
X-Received: by 2002:a05:651c:2105:b0:32a:66e6:9ffe with SMTP id
 38308e7fff4ca-3308e546bcfmr55243641fa.21.1753002624524; Sun, 20 Jul 2025
 02:10:24 -0700 (PDT)
MIME-Version: 1.0
From: Zhihang Shao <zhihang.shao.iscas@gmail.com>
Date: Sun, 20 Jul 2025 17:10:13 +0800
X-Gm-Features: Ac12FXzZ8rJlzdWF1XPFH0ohGBsLc_3zNJMrBV1GZXcoS4313sbwM3QBjyvjyPY
Message-ID: <CACGDn=Rn079JhB7dwqbC-3GNiydJs=dGEXtcw+cC8z2Yjp2Qbg@mail.gmail.com>
Subject: Re: [PATCH v4] crypto: riscv/poly1305 - import OpenSSL/CRYPTOGAMS implementation
To: Eric Biggers <ebiggers@kernel.org>
Cc: alex@ghiti.fr, appro@cryptogams.org, herbert@gondor.apana.org.au, 
	linux-crypto@vger.kernel.org, linux-riscv@lists.infradead.org, 
	paul.walmsley@sifive.com, zhang.lyra@gmail.com, 
	Zhihang Shao <zhihang.shao.iscas@gmail.com>
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_021026_659614_0276DE59 
X-CRM114-Status: UNSURE (   5.90  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Tue, 12 Aug 2025 14:55:28 -0700
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

Hi Eric,

I recently ran a test using the Kunit module you wrote for testing
poly1305, which I executed on QEMU RISC-V 64, . The results show a
significant performance improvement of the optimized implementation
compared to the generic one. The test data are as follows:

--- base.log    2025-07-19 17:41:06.443392989 +0800
+++ optimized.log       2025-07-19 17:40:45.650048601 +0800
@@ -1,31 +1,31 @@
-[    0.668631]     # Subtest: poly1305
-[    0.668774]     # module: poly1305_kunit
-[    0.668857]     1..12
-[    0.670267]     ok 1 test_hash_test_vectors
-[    0.679479]     ok 2 test_hash_all_lens_up_to_4096
-[    0.696048]     ok 3 test_hash_incremental_updates
-[    0.697645]     ok 4 test_hash_buffer_overruns
-[    0.701060]     ok 5 test_hash_overlaps
-[    0.702858]     ok 6 test_hash_alignment_consistency
-[    0.703108]     ok 7 test_hash_ctx_zeroization
-[    0.846150]     ok 8 test_hash_interrupt_context_1
-[    1.235247]     ok 9 test_hash_interrupt_context_2
-[    1.250813]     ok 10 test_poly1305_allones_keys_and_message
-[    1.251138]     ok 11 test_poly1305_reduction_edge_cases
-[    1.287196]     # benchmark_hash: len=1: 2 MB/s
-[    1.305363]     # benchmark_hash: len=16: 61 MB/s
-[    1.321102]     # benchmark_hash: len=64: 212 MB/s
-[    1.340105]     # benchmark_hash: len=127: 263 MB/s
-[    1.353880]     # benchmark_hash: len=128: 364 MB/s
-[    1.370118]     # benchmark_hash: len=200: 377 MB/s
-[    1.381879]     # benchmark_hash: len=256: 570 MB/s
-[    1.394125]     # benchmark_hash: len=511: 657 MB/s
-[    1.404265]     # benchmark_hash: len=512: 794 MB/s
-[    1.413356]     # benchmark_hash: len=1024: 985 MB/s
-[    1.421925]     # benchmark_hash: len=3173: 1131 MB/s
-[    1.429956]     # benchmark_hash: len=4096: 1218 MB/s
-[    1.438184]     # benchmark_hash: len=16384: 1216 MB/s
-[    1.438462]     ok 12 benchmark_hash
-[    1.438686] # poly1305: pass:12 fail:0 skip:0 total:12
-[    1.438763] # Totals: pass:12 fail:0 skip:0 total:12
-[    1.438904] ok 1 poly1305
+[    0.666280]     # Subtest: poly1305
+[    0.666413]     # module: poly1305_kunit
+[    0.666490]     1..12
+[    0.667702]     ok 1 test_hash_test_vectors
+[    0.672896]     ok 2 test_hash_all_lens_up_to_4096
+[    0.686244]     ok 3 test_hash_incremental_updates
+[    0.687263]     ok 4 test_hash_buffer_overruns
+[    0.689957]     ok 5 test_hash_overlaps
+[    0.691393]     ok 6 test_hash_alignment_consistency
+[    0.691622]     ok 7 test_hash_ctx_zeroization
+[    0.769741]     ok 8 test_hash_interrupt_context_1
+[    0.930832]     ok 9 test_hash_interrupt_context_2
+[    0.940068]     ok 10 test_poly1305_allones_keys_and_message
+[    0.940478]     ok 11 test_poly1305_reduction_edge_cases
+[    0.964546]     # benchmark_hash: len=1: 3 MB/s
+[    0.978836]     # benchmark_hash: len=16: 78 MB/s
+[    0.990414]     # benchmark_hash: len=64: 289 MB/s
+[    1.003012]     # benchmark_hash: len=127: 397 MB/s
+[    1.012755]     # benchmark_hash: len=128: 517 MB/s
+[    1.022928]     # benchmark_hash: len=200: 603 MB/s
+[    1.030981]     # benchmark_hash: len=256: 835 MB/s
+[    1.038706]     # benchmark_hash: len=511: 1046 MB/s
+[    1.045233]     # benchmark_hash: len=512: 1240 MB/s
+[    1.050733]     # benchmark_hash: len=1024: 1638 MB/s
+[    1.055620]     # benchmark_hash: len=3173: 1998 MB/s
+[    1.060247]     # benchmark_hash: len=4096: 2132 MB/s
+[    1.064695]     # benchmark_hash: len=16384: 2267 MB/s
+[    1.065179]     ok 12 benchmark_hash
+[    1.065425] # poly1305: pass:12 fail:0 skip:0 total:12
+[    1.065498] # Totals: pass:12 fail:0 skip:0 total:12
+[    1.065612] ok 1 poly1305

Next, I plan to validate this performance gain on actual RISC-V
hardware. I will also submit a v5 patch to the mailing list.
Look forward to your feedback and suggestions.

- Zhihang

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
