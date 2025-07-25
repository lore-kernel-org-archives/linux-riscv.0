Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E860EC87FCE
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jul 2025 17:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=orRtCCACb8IubVCUNvcGWdF2k0bBx5dmeqrINa/HEp0=; b=a6BisEh2yUlsSlp4MtJSm5rp1R
	nD08yRITS3NaTHhMV9beAbh4PMnO4CrUK+5V/vT7fDR7pXP9JQK3yTGDS7VEgDxMP2oLOQdi6AJ18
	cJ31nvhL6ZHZVLOpZO8w9c4Ei4605lG5qgKm5ymog/CoCAHnH/KGtC6T9wLqE4/iR1/mK4Kf7obyU
	gFOUB+PdOQG7RbulxM/1HVN+341xqiM7cqFZVvjNqUpmxG0+d35VkNRYZnfgMuXB81w6M7IUajhcm
	RoI1Xy8m0x/ei8IHdUJNNcyFXgdtb5QYUuwv3xaNAnS4VE2cUq99oGY8isFA23ACmGi9bCXFmEzQU
	PVoTApJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufLnc-0000000AHco-01TJ;
	Fri, 25 Jul 2025 17:01:36 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufLnZ-0000000AHcR-0air
	for linux-riscv@lists.infradead.org;
	Fri, 25 Jul 2025 17:01:34 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-b31c84b8052so2734814a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 25 Jul 2025 10:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753462892; x=1754067692; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ps+zs+NSAsN+PYjwfWa7tJ1eiD1ycr9gRg61OjyMFyc=;
        b=tu3L0c/ekKqkNxlwh5QA9aiGH95+nBbOBpIDUEqLsqB6PjMujmfPrzKev/dKDr41z9
         T/FSECbdDhgteWeloqRLh3fvT/UIGclEJyDI7RaCrlNnGQHF7uaKO3+N2RwHVW4Ey1iR
         GySwP6IcT9RAPQQ3MGGhL+AqSvBpu+GxRV8u03TypjmHMFmhLJJYmhWnSKe7zivI8Mns
         XOJbc1BmQomXfQPV8+M3czKn0wEBFNW9iRMxhZDimkCVpgabg8H9deyrnuFKbFiT/uCl
         Coj4dzL3z05YEL9kjm8ooWJa/M4fbNySb6L4xn1ubUaxv9dGg64E1vx0a21dsmxOC/IK
         N4PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753462892; x=1754067692;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ps+zs+NSAsN+PYjwfWa7tJ1eiD1ycr9gRg61OjyMFyc=;
        b=rRV/n42Ut+/hNpYzct5f4woN3GM0tRg4V7qts5/u+9kElq9JMyEGAh80x10XarYqPb
         JyxRW3qBbFlsweME688Q5JrP6NhRergKRDr83Ofoyq4plptLz/eq7ZrqKYDCvbuZygEh
         RKGEcX+ySZvDjB73CBk3eZryan0xmZHw78rxiSdy5HRcgRkS/vUuwNHb1IDXDaox8Ldn
         S559F4KvC7ax1GGIz3cLIF2i7hx4blxPmMueK8BLyRWp6ArFT/WmIc9+i6XRBGJo/xQZ
         PxlX5YX3R6ttrKbkT2I5SunftWgi2xi9XB/Jsjvi5GSl35sPOOZbthGva4Hrg5lzL2wy
         w5Vg==
X-Forwarded-Encrypted: i=1; AJvYcCUOQYmdglSEPgkyOGio1nikcHq+MTHh4Gv/sPGwmF+R7tkZxXms52SVvsxEHvjYekw8A9bfq2QWLprO9g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxG6W8kywufQBizxRLHkzxVJiQ6eUMqk+AclWMnK+BX9RTeT041
	KCN3xhUdHxo2WY+OUfZ9OQQp/z13P+fATtx762XkDfqWqyOqpijR/cxo6en77rTGpfM=
X-Gm-Gg: ASbGncun02IkTi/uGSvyRT+mHsFS5x//6dKiBTj/bvtfxnimQlyJk7eMURv7ge11vf8
	WjzV87I8QeL7rQE0zSGIeYteYhhTMQokuWbMZ/k3WytozvmLCIFk6fcxY8yICCU8rDW+OBaiCh6
	XsXdkqTEVz/oqqZjFmUfNx3nkAiGwwFRHL1rEvYUFIcCRiUyCKBlzjDo0aAACuk6kYANQHDyEvq
	A4w41/V476djvRcKxQFGZ/3tqqEh2EHefsCtI1lyxAgNPxDSZIry7Ndc9aV2jMTPYz2J29fjrvi
	QTvwtHXfluwOfLCw0hnqBn9gcDA0JtMh7rXt2GGsTvF2i6d9SBNEGXQVmruqwa6E4qyXmGUDb7q
	7hGfCWCYBYEZbrpuNUb066f0g+JXEDLUr
X-Google-Smtp-Source: AGHT+IGuTlAbK0hf8yj3kF3pYRz1gmjdG+I1foCKZPdWRPnBU4bPy84CJCnMtZUdxZdhK10DgDBerw==
X-Received: by 2002:a17:903:2b10:b0:234:f1ac:c036 with SMTP id d9443c01a7336-23fb31c4de1mr42286925ad.50.1753462892029;
        Fri, 25 Jul 2025 10:01:32 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe30bdf6sm1493345ad.37.2025.07.25.10.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 10:01:31 -0700 (PDT)
Date: Fri, 25 Jul 2025 10:01:28 -0700
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
Subject: Re: [PATCH 01/11] riscv: add landing pad for asm routines.
Message-ID: <aIO4aLLFrMVp_Yht@debug.ba.rivosinc.com>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
 <20250724-riscv_kcfi-v1-1-04b8fa44c98c@rivosinc.com>
 <20250725152745.GA1724026@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250725152745.GA1724026@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_100133_181310_63CC9393 
X-CRM114-Status: UNSURE (   9.56  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Jul 25, 2025 at 03:27:45PM +0000, Sami Tolvanen wrote:
>On Thu, Jul 24, 2025 at 04:36:54PM -0700, Deepak Gupta wrote:
>> SYM_* macros are used to define assembly routines. In this patch series,
>> re-define those macros in risc-v arch specific include file to include
>> a landing pad instruction at the beginning. This is done only when the
>> compiler flag for landing pad is enabled (i.e. __riscv_zicfilp).
>>
>> TODO: Update `lpad 0` with `lpad %lpad_hash(name)` after toolchain
>> support.
>
>I glanced through the proposed signature based landing pad labeling
>scheme, but didn't see any mentions of lpad_hash for labeling assembly
>functions. Is there more information somewhere about how this is going
>to be implemented?

Take a look here for generation of type string
https://github.com/sifive/riscv-gcc/blob/f26ae78e21e591f78802a975b68dbde9a224a192/gcc/config/riscv/riscv-func-sig.cc

For hash scheme, take a look here
https://github.com/sifive/riscv-binutils-gdb/commit/1d027fd590c8ad79eba997bcf9b979872ff38eef
`riscv_lpad_hash` function has detail about how 20bit hash is extracted.


>
>Sami

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
