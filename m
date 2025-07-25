Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E55C87FCA
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jul 2025 14:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g+iD6VheDdPecANaY3r54nxizzNkjJuv2HcxQs+mIzM=; b=ftkunLDMoODCDdJDYsiCGvU8fh
	Ew6CJnF8r3Iy9Vqb74zfsqe0CrXZ83YdXodtxrQ39y/Xu3vcb8ZoYkkflQUH7UOmid2rnabkJeIli
	GlnMluSfJcIIGdSY+jjPbMgJdHRBmp9QGzQbpttiL8agE3rb//lFPlgGEfCmXqlCkPxVXTMRK6z07
	LpbyN0Zw9gTike9zOSbmrJPOOYh0TOfvxPz388Ye2HwGvYk2qOF+LZUvEfs4PabsQitW2bRDr3RQf
	PhV9BZGP+lxEW7/fZf13jswGjbDuRpwMW91QtMOC34bqjElmeOqW4sEvLGmPP4AqGm6EZMJI03uYF
	dWwVULjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufJ9X-00000009ylX-1rB4;
	Fri, 25 Jul 2025 14:12:03 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufJ7y-00000009ycz-1CD4
	for linux-riscv@lists.infradead.org;
	Fri, 25 Jul 2025 14:10:27 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-74b54cead6cso1493128b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 25 Jul 2025 07:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753452625; x=1754057425; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Jf/mOhm/oVbqNLjepUkvAGKUCLK5QqEVSdfRhcGCSHg=;
        b=v0ucl1zKr0wxhmS+c2eOk1S3KNzckb5VIgIqTzCS9S5yNx/eArB+nHrpjJ71VL/niD
         DrUyVIy1/TGdRmlX3a5gy0AbZSb5FT4ndoYUcOUUUoWplpbs+cHl89EuzbBkWa6lcw9d
         r7iKiecty9Kp/hfFtBvhsK/8kZ4MrP1J5C6lT25+u5ICkXU8OxgbjKdqISurwUJOoZbV
         HbOLPm+AKL3sCr3t61EULLyWzZ8HaU02kKc2vWZecAznlFcmPDb+Rv3mwoMZ0EftEsYA
         3oGz7Ale5oX/UfT4Mfi4ht28ovrxU8EkPnEobdrC1wvVsJyfTfMjKQWv8a2PnkO/+00I
         +ONg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753452625; x=1754057425;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jf/mOhm/oVbqNLjepUkvAGKUCLK5QqEVSdfRhcGCSHg=;
        b=egjIZf+i86mcUOn59Nrbs/VKRW54qL29y/zsQ6YDmh6SOFJ5f4JaFgDhxbw4yCXQ+y
         ZQeqzE6vdw09WrKnwCwvGFVb9ZDEElolOPpF3wzWRvTwJymABUiw3oYQgMYw9QQ9DX6K
         2qr9bAMEuMulYadpErL5BSbrab490U73oKF0Mjf3vnOKkBP51gI0wdO85zAriLG4041S
         lbevtMhGm0GZ6v4puTh7niaU/vclyy4K33Z+wMQvP+TeLv8P5tzlqftiMeytQDJKQ3F9
         xSH1WBukFHNRfXt51kcXg44KJZfux9f9ycMKW8Dn+FDMXQlWFr/oO9oNpCSl3RT5c00n
         3QBQ==
X-Gm-Message-State: AOJu0YxZLdXCjhZl0/XAhuApd0hzh9Sw5BYG9422/Bqyvupk4sG87Ba2
	USqDDgV1vA7G8l9klw9Sh1DUpvcxMXreIwARW8IddqQ0WToTuNjGtTZ6pipGiH54Wvw=
X-Gm-Gg: ASbGncvMlhOvkkS2ymMzJi4h+K3Er0QtHjdkXYHU4LJp0VBqUPqp+hBBwK7IFhOi31g
	tgOB4O5GUjuPkqUEpGddxBEmmSTzt+t6vquQPEjIPFmE06ki5Pk5CK98JwwyJl1o1ZYxRG5vGQ1
	D7bN8OrgYm3C52osv/UNKjmvn3IItN8ly+JpxNatajtQF4+k60uFZV5xSMQSs4q6Ip9FG5g/zcq
	KsWHMgUD+xerTrING3hfg4EXZSTcuzWXiEQn3+n+HbP3SoUt48S+9rsfLwby3Ik9SGck8Zys8v5
	GMwAiDlMM4XoHQmiQIbxyQ/JpU1McT9Aa2g0yk0SQ9QOlqGtZUc4Em2PosZr48Ya7YQ5IoLSon9
	FjW7dyv3B75+Jbb/NuJVox5Xb1KGSKPm4M8+YCbyxz/M=
X-Google-Smtp-Source: AGHT+IHNN/h9IcORot4a3xhdjrHaAp7ln5/qPNI4g6XxmpxQs89n8kgWy8jMRw30pgwpyInfWpB5eg==
X-Received: by 2002:a05:6a00:1142:b0:749:456:4082 with SMTP id d2e1a72fcca58-76335849218mr3090044b3a.1.1753452625116;
        Fri, 25 Jul 2025 07:10:25 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-761b0615d7fsm3945846b3a.105.2025.07.25.07.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 07:10:24 -0700 (PDT)
Date: Fri, 25 Jul 2025 07:10:21 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-mm@kvack.org,
	llvm@lists.linux.dev, rick.p.edgecombe@intel.com,
	broonie@kernel.org, cleger@rivosinc.com, samitolvanen@google.com,
	apatel@ventanamicro.com, ajones@ventanamicro.com,
	conor.dooley@microchip.com, charlie@rivosinc.com,
	samuel.holland@sifive.com, bjorn@rivosinc.com, fweimer@redhat.com,
	jeffreyalaw@gmail.com, andrew@sifive.com, ved@rivosinc.com,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Monk Chiang <monk.chiang@sifive.com>,
	Kito Cheng <kito.cheng@sifive.com>,
	Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH 01/11] riscv: add landing pad for asm routines.
Message-ID: <aIOQTSVNkC1RztDW@debug.ba.rivosinc.com>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
 <20250724-riscv_kcfi-v1-1-04b8fa44c98c@rivosinc.com>
 <2ba0c09d-2783-4dce-a889-06e16abbde61@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2ba0c09d-2783-4dce-a889-06e16abbde61@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_071026_558994_29D92FA3 
X-CRM114-Status: GOOD (  11.34  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Jul 25, 2025 at 08:13:29AM +0200, Heinrich Schuchardt wrote:
>On 25.07.25 01:36, Deepak Gupta wrote:
>>SYM_* macros are used to define assembly routines. In this patch series,
>>re-define those macros in risc-v arch specific include file to include
>>a landing pad instruction at the beginning. This is done only when the
>>compiler flag for landing pad is enabled (i.e. __riscv_zicfilp).
>>
>>TODO: Update `lpad 0` with `lpad %lpad_hash(name)` after toolchain
>>support.
>>
>>Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>>---
>>  arch/riscv/include/asm/linkage.h | 42 ++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 42 insertions(+)
>>
>>diff --git a/arch/riscv/include/asm/linkage.h b/arch/riscv/include/asm/linkage.h
>>index 9e88ba23cd2b..162774b81158 100644
>>--- a/arch/riscv/include/asm/linkage.h
>>+++ b/arch/riscv/include/asm/linkage.h
>>@@ -6,7 +6,49 @@
>>  #ifndef _ASM_RISCV_LINKAGE_H
>>  #define _ASM_RISCV_LINKAGE_H
>>+#ifdef __ASSEMBLY__
>>+#include <asm/assembler.h>
>>+#endif
>>+
>>  #define __ALIGN		.balign 4
>>  #define __ALIGN_STR	".balign 4"
>>+#ifdef __riscv_zicfilp
>>+/*
>>+ * A landing pad instruction is needed at start of asm routines
>>+ * re-define macros for asm routines to have a landing pad at
>>+ * the beginning of function. Currently use label value of 0x1.
>
>Your code below uses label value 0 which disables tag checking. As 
>long as we don't have tool support for calculating function hashes 
>that is an appropriate approach.
>

Yes I made the fix at other place where function prototype was determined
to be static (see `call_on_irq_stack` in entry.S)

In this patch, it wasn't possible.

>%s/Currently use label value of 0x1./Label value 0x0 disables tag checking./
>

Thanks its lingering from earlier. Will fix it.

>Best regards
>
>Heinrich
>
>>+ * Eventually, label should be calculated as a hash over function
>>+ * signature.
>>+ */
>>+#define SYM_FUNC_START(name)				\
>>+	SYM_START(name, SYM_L_GLOBAL, SYM_A_ALIGN)	\
>>+	lpad 0;
>>+
>>+#define SYM_FUNC_START_NOALIGN(name)			\
>>+	SYM_START(name, SYM_L_GLOBAL, SYM_A_NONE)	\
>>+	lpad 0;
>>+
>>+#define SYM_FUNC_START_LOCAL(name)			\
>>+	SYM_START(name, SYM_L_LOCAL, SYM_A_ALIGN)	\
>>+	lpad 0;
>>+
>>+#define SYM_FUNC_START_LOCAL_NOALIGN(name)		\
>>+	SYM_START(name, SYM_L_LOCAL, SYM_A_NONE)	\
>>+	lpad 0;
>>+
>>+#define SYM_FUNC_START_WEAK(name)			\
>>+	SYM_START(name, SYM_L_WEAK, SYM_A_ALIGN)	\
>>+	lpad 0;
>>+
>>+#define SYM_FUNC_START_WEAK_NOALIGN(name)		\
>>+	SYM_START(name, SYM_L_WEAK, SYM_A_NONE)		\
>>+	lpad 0;
>>+
>>+#define SYM_TYPED_FUNC_START(name)				\
>>+	SYM_TYPED_START(name, SYM_L_GLOBAL, SYM_A_ALIGN)	\
>>+	lpad 0;
>>+
>>+#endif
>>+
>>  #endif /* _ASM_RISCV_LINKAGE_H */
>>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
