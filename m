Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 740B1CD1284
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Apr 2024 06:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Hnknu7k61Yy+zzNQ4j3dPe9XbeNpOUIefxRF8cmgkfg=; b=Xb9y9XNuc7q8lH
	0ibyJvOVAgUAhlIfhx1xPY0Pk0LDYI3kAfdA2k8Vj9GWf8Zmvwbi5HkhG/fcwlscEFyXaxehprdej
	bXCdUJEIKGsLiydexeHK6dfzo7eJjoU+cZy5rCK709ZQYDVbnQ0V/TUlWzpYY66lc1yDIau90/2Py
	sVhMcFWwW5TMOxtAHVWtTg2T4XHqvt/GbamqdD/1lDl5DtLnfF2jrqqJPpX4TaIqaG7CYVv/olVd1
	x4gnzPLePCreMMrrsgS+fo/3ncPde9xl9CbFYuON85rYbfcSWCDIhyw/eLD1gQCtiG7jELD6WyITs
	I6sxa5NsKTtCzTJZQs9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru4iO-00000000VtO-1igF;
	Tue, 09 Apr 2024 06:12:16 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru4iI-00000000Vls-4496
	for linux-riscv@lists.infradead.org;
	Tue, 09 Apr 2024 06:12:13 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1e36b7e7dd2so31353575ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 08 Apr 2024 23:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712643117; x=1713247917; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LNu+GMI0LnpE6OoNqPaNP2xIRA7y3ywXaMFD3+hEy+U=;
        b=KnvNLAL7OFGBW4koqtm2DUZPRpCJs285clKMIKlUA5qWP94wwQ4HBWhO7FIV7XlNL2
         bW+Tji0WLbS12qGK2DN6bNMTOviMoa8YiEiGgfgQhuW56flxQ2dGiv0UAMboZXSLvTRa
         3+fbBjG/kKOF0aT/OGtIYbvgQTm2w4SWBOR6ahm8J4bYsdFmK7iVJe77jZdnHG8ebejJ
         HvXHarm07g+vgg46k/0C2wFvU2zRLQWMka/lzFAmsF7ittznw/GL1mShFYUmwxUckFFs
         vidocnnbJajddNHWFOQ0Gmac6zeCiq5f5/CPD0Wg8tEKP+m80R5/qm4da056DAyEvOhS
         acnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712643117; x=1713247917;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LNu+GMI0LnpE6OoNqPaNP2xIRA7y3ywXaMFD3+hEy+U=;
        b=BSXBC0dHtAYOvhmtcbAHYrtxgfY7y/HN5KD3yXWwFip2OEutdZ8c/YUPDicAh0B0QQ
         pANQFENq9Dp+Qp9eObSBRAL+OB0IC2KV/O0pfXzaVq3krdNEX3Zgo25BGCbKzT+gK76Y
         pY4d69drf6O/RkPQjEg5jMnHNtqW3ju6AtR6lRQ7UGV+cFYHObGCj06PmaOKYvBoMHXE
         o9M/cHtdNEVF7tyytIOXz3tHrJYoqqeC2WvSADCE66ckeE8/DojrbeU5w58AQaPNUqsa
         J6aLKwGu3Z4zl8UJbFbT+lcMtv8ZWlz4g4ASeMAgeJW5xaH7UCuhbxiS8AuZAciDjcPM
         Nqyw==
X-Gm-Message-State: AOJu0YyUOe+bCK7j/LDBx831a94izVp24kiN2L65z3/BuPnyWCt6yzuz
	yQ0v+hufCSlw9M1l52mP8dCgbgSQ6ZWiY0eKDyY9PMsW+M5fL+eQstY7/09pzGnYuxjMC02uJ+t
	u
X-Google-Smtp-Source: AGHT+IFAEx2oWQm/CjdpGB2Fg/5zWgfQFm9z3OMamljMoc1Ud/BPFjN+0/Vy6Ix6zi2EHTDC9jxG0Q==
X-Received: by 2002:a17:902:cecc:b0:1e2:ac38:2657 with SMTP id d12-20020a170902cecc00b001e2ac382657mr10867433plg.24.1712643117037;
        Mon, 08 Apr 2024 23:11:57 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id n3-20020a170902e54300b001e3dd5972ccsm5775564plf.185.2024.04.08.23.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 23:11:56 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	andy.chiu@sifive.com,
	debug@rivosinc.com,
	hankuan.chen@sifive.com,
	guoren@kernel.org,
	greentime.hu@sifive.com,
	samitolvanen@google.com,
	cleger@rivosinc.com,
	apatel@ventanamicro.com,
	ajones@ventanamicro.com,
	conor.dooley@microchip.com,
	mchitale@ventanamicro.com,
	dbarboza@ventanamicro.com,
	waylingii@gmail.com,
	sameo@rivosinc.com,
	alexghiti@rivosinc.com,
	akpm@linux-foundation.org,
	shikemeng@huaweicloud.com,
	rppt@kernel.org,
	charlie@rivosinc.com,
	xiao.w.wang@intel.com,
	willy@infradead.org,
	jszhang@kernel.org,
	leobras@redhat.com,
	songshuaishuai@tinylab.org,
	haxel@fzi.de,
	samuel.holland@sifive.com,
	namcaov@gmail.com,
	bjorn@rivosinc.com,
	cuiyunhui@bytedance.com,
	wangkefeng.wang@huawei.com,
	falcon@tinylab.org,
	viro@zeniv.linux.org.uk,
	bhe@redhat.com,
	chenjiahao16@huawei.com,
	hca@linux.ibm.com,
	arnd@arndb.de,
	kent.overstreet@linux.dev,
	boqun.feng@gmail.com,
	oleg@redhat.com,
	paulmck@kernel.org,
	broonie@kernel.org,
	rick.p.edgecombe@intel.com
Subject: [RFC PATCH v1] riscv kernel control flow integrity
Date: Mon,  8 Apr 2024 23:10:31 -0700
Message-Id: <20240409061043.3269676-1-debug@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_231211_019797_3124DA1C 
X-CRM114-Status: UNSURE (   9.88  )
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

Basic overview
---------------
This is a RFC patch series for enabling kernel control flow integrity on
riscv architecture. This patch series enables kernel control flow
integrity using proposed riscv cpu extensions `zicfilp` and `zicfiss` [1].

`zicfilp` enforces that all indirect calls and jumps must land on a landing
pad instruction (`lpad`). Additionally `lpad` has 20bit encoded value as
part of instruction and cpu will check this 20bit value with t2/x7 register
, if they mismatch then cpu will raise an exception `software check
exception` (a new exception with cause=18). In this patch series, a
constant label value of 0x1 is used. As series will mature, it will switch
to a 20 bit truncated hash over function signature. Label based on function
signature allows stricter control flow and fewer call/jmp locations from a
callsite.

`zicfiss` protects the return path from functions where return relies on
obtaining return address from stack which is corruptible. `zicfiss`
provides a shadow stack which can be used by software to place return
addresses on shadow stack and while returning from function it can be used
to compare against return address from regular stack. If they dont match,
cpu will raise software check exception. `zicfiss` based shadow stack are
protected against tampering using special page table encodings (please
refer to [1])

To obtain more details about `zicfiss` and `zicfilp` ISA extension, please
refer to [1]. There is an ongoing patchsets for enabling this feature for
user mode software here [2]

Enabling on kernel
===================
This patch series introduces new riscv config `CONFIG_RISCV_KERNEL_CFI`.
If this config is selected, it turns on 
	- forward control flow for kernel using `zicfilp`
	- selects `CONFIG_SHADOW_CALL_STACK` /w `CONFIG_DYNAMIC_SCS` to enable
	  backward control flow.

forward control flow for kernel
================================
This patch series simply compiles kernel with `march=_zicfilp` compiler
option. Currently toolchain uses constant label scheme of label = 0x1.
This patch series manually fixes some of the assembly callsites and
sequences to make sure they are not breaking rules setup by `zicfilp`.

backward control flow for kernel
=================================
There is an existing support for riscv kernel for shadow call stack [3],
which is a software based shadow stack and uses clang /w instrumentation
to push/pop return address in prolog and epilog of functions. Although
software based shadow stack lacks memory protections and thus suffers from
same issue of return address susceptible to hijacking. shadow call stack
uses `CONFIG_SHADOW_CALL_STACK` /w option of `CONFIG_DYNAMIC_SCS` so that
hardware vendors hook into the flow to provide stronger guarantees. This
patch uses `CONFIG_SHADOW_CALL_STACK` flow along with `CONFIG_DYNAMIC_SCS`
to enable return control flow integrity on riscv kernel.

[1] - https://github.com/riscv/riscv-cfi
[2] - https://lore.kernel.org/all/20240403234054.2020347-1-debug@rivosinc.com/ 
[3] - https://lore.kernel.org/all/20230927224757.1154247-8-samitolvanen@google.com/



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
