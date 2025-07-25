Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9723C87FCF
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jul 2025 14:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+GpSgLTCuY/6qQVS0zRn9mFZDRgNj4IOiGMaVcbQaDw=; b=Ix2TC3H6ZZwzBrMds9LNYwP+DG
	bLSkpAvtG1CSXGCHX3b1/iwHFKVrBXLOp6LT5xXUSyT4o8q/WMOZ0kgkT0OaRelM1jmfDiL9QGyID
	8t5iQhA8vQhmWZMNPei4c058otWxLEKLq3DfXNlDkQMxTGi9jSL7YZYUm2Zkv2BhQ+5hq1M5D5mWL
	RTIdIIt/h7O3rdux4VW/c1NLQueSj5+lTk1liIZZQGa07Qtes18wPQcXPQsFuDplGH5iTRC3BG8OZ
	BGSBnCDk83YhJDVy2cdNmeYvEheJGOgco27Tb1KceHN1Qq3JRZVzlngR/jF3hk6XeA3P3z1bGa8Zh
	CzKqHe4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufJH9-00000009zmU-2Aq6;
	Fri, 25 Jul 2025 14:19:55 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufJDg-00000009zJu-2pct
	for linux-riscv@lists.infradead.org;
	Fri, 25 Jul 2025 14:16:21 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-235d6de331fso27476115ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 25 Jul 2025 07:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753452980; x=1754057780; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m4zb8NrY5OXi5r9Et0ByFU2sSCQJb+4fxBPaABm8ZNI=;
        b=aAPOIaL9m65g+WlDEcE2pEdqcPdnIQGs+Uj05Vi3i+TNxvcExWw+FMZCIVlFSAIFzY
         yuqbfAsUcHeMPe35ZKgjvQlaNBVB4ExN1Of5bD5UXz6ufL6RDweg1Wgxy/8m0NYFmAgn
         cHnySYN3dF6E8CntAHBYkpdJRB8HYR3uanLuCNc16BG+9Spuvmmbjllkud+uYD11ZaIe
         nM+8/5ZXUEmI0OGGol+Q9MboPFHXAvbhRdT0dQxqUKmX6CM8Y8KbYIk3Pg/xfNeCYOrR
         8HzsvAh7NKWKpcAT86QaOM5DenqAlZMm/wiRewsMX3/Jf5mqyEjWM5E0Cwa+jetP5By7
         +e7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753452980; x=1754057780;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m4zb8NrY5OXi5r9Et0ByFU2sSCQJb+4fxBPaABm8ZNI=;
        b=DQiYL5/fISQJg6qRnMzuW1f/t/U4hq5Jp65lKvicF+qE0LYrM4uVRNDDM2W6oGUwZc
         Ztheo3mxaByxkyRPr2d+TGgDFFcxkllrBNXkSraoirwJ7GDpaYIM1JLYnn32l+2rkOlL
         U1vRNSt4LRX6GT+7bgPJA639r/49gXyF9K5AoSkt4xB/IDHxeJD1kCrZf6zwzhvyktfM
         NPl+pvcAVJxB62e9uUPogyHfFzoK/6KDJoQYFYhqZpz/csdHyTIYDopsI7ihvpTZYQMD
         4BLFG3H5nvLP6suwfLKx6n8NoCztIEB/rIOBbcWhENoS/5vqiDz/01M8fEuVOxpmBDmL
         FIww==
X-Gm-Message-State: AOJu0Yw3hTRFlsy72Q8xp8oDPQx9+2Jk1Idb79AMAmhvCT9qqYbO+ri3
	ab2sPJFKkhgE4Xl5xRSymOkYwnAXCqCZ4A8Nz6LE61xL2TVS13VgDeBcY5na+adqzKA=
X-Gm-Gg: ASbGncuzllAxHl+6GBmAnxmWbX+7+LMCSj0VxRZWdQ4yVIDPDAmrKVI8vReVYFiUDZQ
	qCNpuakwQcfEpzXgW+xKHR3V+VGnvrk17LkG3PGLfXhVlTirnxVcmrG9ReW0J2QVY6u+WGipR/d
	Qta/dCEx/TJoe9bxE+7FwJrE45ctPxpB9wkY00j+VvqlJFvS+nGEWOwchpCLzF+m7U5oX5cE1yy
	lohvWvucMAjsPy2xUTcicKNb6u5K/9UipYV5eN4IUHJpbHXX0krnnT8yjr4aATvIC0GrDpssk27
	k9afbX/Do7hxsv+651VqLPJ6D5xTstjXU69JKo5FkN5sbFCCJfD4Qwfzy7m3BlKPVNy+PPE4Jd5
	mK9SDYLWknow4FTWAzehOjXzT6ZjoApZf
X-Google-Smtp-Source: AGHT+IE9XuwrXVXrIfvlI3DBKUdukDNvmbxm+Ndq+/QyLjAd0FPi4mKe09kh/NBw/3BKfUdqYZtXMQ==
X-Received: by 2002:a17:902:e5cc:b0:234:eb6:a35d with SMTP id d9443c01a7336-23fb30acdedmr35114765ad.27.1753452979529;
        Fri, 25 Jul 2025 07:16:19 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa491bb2asm38450025ad.213.2025.07.25.07.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 07:16:19 -0700 (PDT)
Date: Fri, 25 Jul 2025 07:16:15 -0700
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
Subject: Re: [PATCH 02/11] riscv: update asm call site in `call_on_irq_stack`
 to setup correct label
Message-ID: <aIORr7mQSbV8QMCq@debug.ba.rivosinc.com>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
 <20250724-riscv_kcfi-v1-2-04b8fa44c98c@rivosinc.com>
 <4ad699fc-a89d-4740-bdec-ecb9a2134c90@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4ad699fc-a89d-4740-bdec-ecb9a2134c90@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_071620_716537_595A52A1 
X-CRM114-Status: GOOD (  14.69  )
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

On Fri, Jul 25, 2025 at 08:23:44AM +0200, Heinrich Schuchardt wrote:
>On 25.07.25 01:36, Deepak Gupta wrote:
>>Call sites written in asm performing indirect call, they need to setup
>>label register (t2/x7) with correct label.
>>
>>Currently first kernel was compiled with `-save-temps` option and
>>normalized function signature string is captured and then placed at the
>>asm callsite.
>>
>>TODO: to write a macro wrapper with toolchain support.
>>
>>Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>>---
>>  arch/riscv/kernel/entry.S | 1 +
>>  1 file changed, 1 insertion(+)
>>
>>diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
>>index 2660faf52232..598e17e800ae 100644
>>--- a/arch/riscv/kernel/entry.S
>>+++ b/arch/riscv/kernel/entry.S
>>@@ -389,6 +389,7 @@ SYM_FUNC_START(call_on_irq_stack)
>>  	load_per_cpu t0, irq_stack_ptr, t1
>>  	li	t1, IRQ_STACK_SIZE
>>  	add	sp, t0, t1
>>+	lui t2, %lpad_hash("FvP7pt_regsE")
>
>In patch 1 you use lpad 0 due to missing tool support for signature hashing.
>
>Wouldn't it be preferable to have a first patch series introducing 
>landing pad support with lpad 0 and once tool support for signature 
>hashing has landed create a second patch series using tags?
>
>Such a first patch series would not have to be an RFC but might be 
>merged soon.

It's mostly about security guarantees. Coarser grained cfi (only landing pad)
has been proved many times not that effective. Kernel is a monolithic piece of
code. If there is a good chance of adoption anywhere for labeled landing pads,
its kernel. If it becomes a long pole, it's a possible direction to go back to
unlabeled landing pad.

>
>Best regards
>
>Heinrich
>
>>  	jalr	a1
>>  	/* Switch back to the thread shadow call stack */
>>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
