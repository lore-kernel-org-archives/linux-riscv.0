Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 002FEC87FCE
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jul 2025 16:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OMUbnWB5qaXKxGbM1y3nv7wKSCergH08JcRc40l2HHg=; b=t2EEoaxVK1hdldNSyPK52ePwMy
	bj2ri3rKr/2pQFA+lcVurBuKgpH09+IlDWD764pBOiV3jUjYumz249O/2f+5i1ju4+0/vEb0jMRPk
	XgsrfjEK8o1os1JLnJAlL9+s8ZdKiaivDw6yW7kGP0HtHJIFLIGqPXNdZRdQvX3Ohnxy0N2Ch+4rt
	fryT3CILfJwd9L0bx/4Aa2kvg2xYJDwJ3tqUARPcBNUh1afP1PAhP8XGBbQjgs/RvqQKCVumL8jea
	OUSthaWJeMilbC44eB/AyxBA6feBYd0nARS24E1fw4VLASnNJWi9hSeWHOuVsWqaK1ls+YVfl4VpD
	YSUSFmNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufLky-0000000AGwW-35ur;
	Fri, 25 Jul 2025 16:58:52 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufLid-0000000AGTp-0WfS
	for linux-riscv@lists.infradead.org;
	Fri, 25 Jul 2025 16:56:28 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-748e63d4b05so1568431b3a.2
        for <linux-riscv@lists.infradead.org>; Fri, 25 Jul 2025 09:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753462586; x=1754067386; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WtgAXG2zxYUZH6Gw9dzWRKSuSkjlPnsCAnmjzmjgcv8=;
        b=cF51i9mXsndNqhgYKgG+zPoGyQxyakcz6Ip87pjiswcxRC6RUDpBZ+Xi5olUYnatCa
         FVJQ3lF5uL+/a5JS6WGVlfEt4gPui67drS0/OSMNtSsWAyTCsaYpLmbQaS3QwCIbI7Jq
         UNMc1zk4sdP6l0lUQoFvh+IWkIXC8C0hrf848H/bj2lLPdN5QRXn6HX8ZzRz+Z/FCqoj
         +TNqwSSmQvH5zCQ+DSY8fMM2xn1n4z1lwMlIK9d5n5fRSgXwWaax+OdC4SoeGjsrzyZl
         amAgd44usQ/nZOFOlZYzca1P/g1hh712VKJAv74VjygfcYOGBGnDLzzQt21gvRBweUmG
         JKRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753462586; x=1754067386;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WtgAXG2zxYUZH6Gw9dzWRKSuSkjlPnsCAnmjzmjgcv8=;
        b=EkB7kqKwbMD9NzABulGsOUVfq3nDI812zR1aavlpVG86Rn6x3/AZdJOLayPkxbgcd+
         /OA1kDVNXwd3rnE0VC0zRGI5YvkH/YmzL0/tmAp8HrbqOR9h0j10lSbMnKdH4n/YxjD4
         RoUJpvJPPzSrExG4jIaVe7K9zJWOWi5nNybhyf74k+IsSjySXKKnhcAoGzAWH08j3Owy
         7bI+a0fwv4MDqKf6OdEyijLaut1VgGl/uofkxj36227hFHsAvzHUsu3aM73iv2WCNxZ5
         +ZqsjgVdwL70WhLWWyH2CwZUDyc/BNqMEirDfoo5P+89mwvn6dK2tIOEkDNAVKjw/2GW
         GtGA==
X-Forwarded-Encrypted: i=1; AJvYcCU0jG965DzF2JhRhMeM42yU3NtzdEgNF/wcYsc85xXFRQE6ogGn1rLmF1xqKoLdBQxqe9XP112cW/QHzQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwCVdlMnQGor+KXAYBxOwIPz60MKp1gierlp0ngC2Aar0lPYxf3
	Nz1B1+lPZaJK9+jvJbVTwPO6GePbrEMQWDj+h9dQ3i+6e5eS59ycVYahtDiiRY6JTuY=
X-Gm-Gg: ASbGncshTd9mIZs3MNpvWknhlleMJUmk+lm32y8wRf8Xb5ZQbd8F7n6m7lX6dsNNj+V
	JbvpY1G1sEtCNaqWUCGXQyo7pTgVf64zA6jrjdfosCDSYy8nQGk2ybqZwsuaU1J2Nzm9BnFUw8U
	T+E4T+wQ0BY0ukYZbThQS61JbC3ul//J1MSlSFLaQW60qlm8RbgZU8mOe3eY+r6E9qAbgiYjvz4
	mscJd3HDNKBSOplIOx9z1hY7odkC7B/annE+vem5rvpMMr41KqkQlMSU4a6U8fdjOv8eus/0FnH
	QvTfDq0mSBQM2Eu7CdifnItfEGiKoQ9TUjOoxG+VXCQc4CnGLwnkrnNSUxF/sKiWdIt0bg1tGPl
	4TWTCnO8kHdxCKRmCa/gNgTPK/7eSZdHSiMHzt17YCK0=
X-Google-Smtp-Source: AGHT+IETBPZe8HlkltWjZZmkG8X/wqZoM335inOFOubYlGpOP3IUTPKQOC96UsFlPqNZzJonrdrGDQ==
X-Received: by 2002:a05:6a00:b50:b0:740:a023:5d60 with SMTP id d2e1a72fcca58-76335b7ef36mr4059760b3a.19.1753462586198;
        Fri, 25 Jul 2025 09:56:26 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f7f6d6312sm231084a12.62.2025.07.25.09.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 09:56:25 -0700 (PDT)
Date: Fri, 25 Jul 2025 09:56:22 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
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
	Justin Stitt <justinstitt@google.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-mm@kvack.org,
	llvm@lists.linux.dev, rick.p.edgecombe@intel.com,
	broonie@kernel.org, cleger@rivosinc.com, apatel@ventanamicro.com,
	ajones@ventanamicro.com, conor.dooley@microchip.com,
	charlie@rivosinc.com, samuel.holland@sifive.com, bjorn@rivosinc.com,
	fweimer@redhat.com, jeffreyalaw@gmail.com,
	heinrich.schuchardt@canonical.com, andrew@sifive.com,
	ved@rivosinc.com
Subject: Re: [PATCH 02/11] riscv: update asm call site in `call_on_irq_stack`
 to setup correct label
Message-ID: <aIO3NtHJ1iCoGOs7@debug.ba.rivosinc.com>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
 <20250724-riscv_kcfi-v1-2-04b8fa44c98c@rivosinc.com>
 <20250725153351.GB1724026@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250725153351.GB1724026@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_095627_164704_89CB141B 
X-CRM114-Status: GOOD (  14.03  )
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

On Fri, Jul 25, 2025 at 03:33:51PM +0000, Sami Tolvanen wrote:
>On Thu, Jul 24, 2025 at 04:36:55PM -0700, Deepak Gupta wrote:
>> Call sites written in asm performing indirect call, they need to setup
>> label register (t2/x7) with correct label.
>>
>> Currently first kernel was compiled with `-save-temps` option and
>> normalized function signature string is captured and then placed at the
>> asm callsite.
>>
>> TODO: to write a macro wrapper with toolchain support.
>>
>> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>> ---
>>  arch/riscv/kernel/entry.S | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
>> index 2660faf52232..598e17e800ae 100644
>> --- a/arch/riscv/kernel/entry.S
>> +++ b/arch/riscv/kernel/entry.S
>> @@ -389,6 +389,7 @@ SYM_FUNC_START(call_on_irq_stack)
>>  	load_per_cpu t0, irq_stack_ptr, t1
>>  	li	t1, IRQ_STACK_SIZE
>>  	add	sp, t0, t1
>> +	lui t2, %lpad_hash("FvP7pt_regsE")
>
>Ah, I see. The plan is to hardcode the signatures in assembly code and
>keep them manually in sync with C code. When we implemented KCFI, we
>thought this would become extremely tedious to maintain after a while.

This is extremely tedious and not maintainable and primary reason (among
other secondary ones) to keep this patch series as RFC.

>Do you have any plans to add KCFI-style __kcfi_typeid_<function> symbols
>that would allow labels to be determined from C type signatures instead?

Yes something on similar lines. I have asked toolchain folks (Monk and Kito)
on how best to support this.

>
>Sami

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
