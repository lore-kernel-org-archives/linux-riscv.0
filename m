Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 366CFC87FCE
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jul 2025 15:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ORORa4oTpk521Yhzn2wl5lyvmx/7vj3adHJ0VcOnApA=; b=F1NpMdx0GaPLet
	8Qzk9GVuY44qOlL5JqetHYpQJMW0/4HKR+vjNGgBiAYET/ZmPyBEzjdTAK+lTjh/yFLfffODaQYlp
	J/v8CRv/BLuPRxV/rpezB0aKptnalPB/JFde5BgDkGcjAfjJ+ymD/P2R7Q6jcI7EZx6nPQUnRdKda
	bxNenXDDtokdgJ05yaGAEnqkL7z8JRenR0PAc3Jim+gSv5X+HqaCeLESOsGu8QB8Y+eOGqIKbGsRF
	akD++FKw0gSweKs/lqA+aq7Tw0Sp3xX7qKsIfmyc86wcxuSfBwVt/K6Slaqs3texFauix9Q0ihnbQ
	Ne4xm73ilLGprBseEfzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufKKy-0000000A6TY-2ZE9;
	Fri, 25 Jul 2025 15:27:56 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufKKv-0000000A6RL-03CR
	for linux-riscv@lists.infradead.org;
	Fri, 25 Jul 2025 15:27:54 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2357c61cda7so139715ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 25 Jul 2025 08:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753457271; x=1754062071; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rYghJYglv5xycj6lEIeN8UVfDvdCip7qw6RMPEir5D4=;
        b=DgqRtSvercuZwEmG6ctFVHjJmujflsS1XHRjWzmQ9z19/qTs7Qvnk/xd/ItYA3KUX7
         XRsWPbiegiC1aHIBEbnwArt7tkqahIRdeJZkcAQURo4/EHLG0TEijPgAbEoH2JYLibUg
         R9zHUr4tYiffgMXwxXiOMM2quz86R+iXCtbOAAnvs5dfJ7KKFkTPLRbJ3MQuhLooCgc4
         FwGAPTL6aWe9Y328wJwG6C9mUmyA+zHZh75AVLniLXpg7/z3pRv8kl0I2Jl+J4PGhChH
         CnaQn2XiLh+56WGDs4ZmmrAb6cW1wIwNiiLY5WCubLA4pAoUBRyxnZowBzqbzy8X5E7i
         V0gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753457271; x=1754062071;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rYghJYglv5xycj6lEIeN8UVfDvdCip7qw6RMPEir5D4=;
        b=HMQLeL/FDgIea2lYdBkbD/t7RoeUnOYk37PBTwjczP7fmak7mRzSDBBDrN7qL/kWML
         PVLIeHFqjO7DR4/SNqWA++uY6mV6Xpzxem8HpGCDIXot7rBdf/NpMU6krfP2cLuVpxfD
         ycsmrC0td065l2Gz6qUBhp/xjY72+Cm0St+qUF4XtBVv/F5H4lwRvlJ//nHzU2JL8CH1
         IlcrcW/kZL1BbR8Jbu9AhVlKq54wbH06oPo24ERkuiSozLrL/OlU2xBbQ65hn+OOIj4e
         gznsEFvZwwyfQNAgSqq+/xeejeguKfF0i6Rog0f7VW1zNx9EnY2dLntONTn7wJfSJOAk
         9+Rw==
X-Forwarded-Encrypted: i=1; AJvYcCULKbm+LHMT2rVwT2Uok7n3YwSB7eueQRjFaTk1PCEOj1DJCemPplECJAk6BCpcJ7fp+y2SFsVejQoDEQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywq8drwTQ0Th8urgX8JMlyMQhzEHJF4G5cv+SHFkt2WKo1TRqV4
	UFbqcHSZynmvMLThobVQbb4jQqDaLmKPx7PffqskFmJgVYLxAEYmxlM9imWvkXhlsg==
X-Gm-Gg: ASbGncu/XZoRsQ0JQL+dP4AE74e1sTH4OoyY1rT2wbsDqq730cwfG/GfPN0mNvGo90c
	2fEgk+wTuCzVgb0ljtgBQQK9He1Z7xrMnq09I4Wmq6f2kTHwDGXEX3cFFVDe9haIVEjPXNWEnBJ
	3A48qOl1qSAVK11Q3k2yXFxgx8508gCINt+qrZDnIOT1qS1Isr3o+/+n8akWfDnw/yj2TxS+QqN
	7rM5/Vo8Sn2QIs13gSuGd35xknoOTos+PAtfhptphv/Mrjjy9w5VzpgZ88qol+pq19X6+Fk7H1w
	vvm+WnuhfxGlkKkVwnr3ZGLysf9aU7lgQmv5JalMEDCSVMc0gbPr6c4HJdnjf6cPGjzmmJO2TGm
	9G32uPXoZOv8CoPxFFrfAMiN4DzZaB/vWm7OScj1+3TtwQ+FuDrDPJs7RfhwoJvEUpEyATnZsOv
	hqtc1wyg==
X-Google-Smtp-Source: AGHT+IECUS4ICPT72rez061zYucyKAEQSZl/Vqzwhl1r3oHDO13mDG6PFiHjVXy9pYhZCAlwaMGg8w==
X-Received: by 2002:a17:903:1a2b:b0:215:7152:36e4 with SMTP id d9443c01a7336-23fb044e610mr2864835ad.27.1753457271064;
        Fri, 25 Jul 2025 08:27:51 -0700 (PDT)
Received: from google.com (106.81.125.34.bc.googleusercontent.com. [34.125.81.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe30ae0bsm225725ad.18.2025.07.25.08.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 08:27:50 -0700 (PDT)
Date: Fri, 25 Jul 2025 15:27:45 +0000
From: Sami Tolvanen <samitolvanen@google.com>
To: Deepak Gupta <debug@rivosinc.com>
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
Subject: Re: [PATCH 01/11] riscv: add landing pad for asm routines.
Message-ID: <20250725152745.GA1724026@google.com>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
 <20250724-riscv_kcfi-v1-1-04b8fa44c98c@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250724-riscv_kcfi-v1-1-04b8fa44c98c@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_082753_049165_4A5D24AB 
X-CRM114-Status: GOOD (  10.19  )
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

On Thu, Jul 24, 2025 at 04:36:54PM -0700, Deepak Gupta wrote:
> SYM_* macros are used to define assembly routines. In this patch series,
> re-define those macros in risc-v arch specific include file to include
> a landing pad instruction at the beginning. This is done only when the
> compiler flag for landing pad is enabled (i.e. __riscv_zicfilp).
> 
> TODO: Update `lpad 0` with `lpad %lpad_hash(name)` after toolchain
> support.

I glanced through the proposed signature based landing pad labeling
scheme, but didn't see any mentions of lpad_hash for labeling assembly
functions. Is there more information somewhere about how this is going
to be implemented?

Sami

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
