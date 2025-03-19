Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E879DC28B28
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Mar 2025 00:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WsKszAv9w6/HB8tEraNPUgYlhmbGgc9a6vhhaG/w7tA=; b=PmiWY4YaLwbLRw
	ssZZo1hPIcaOk/r0iT+crlMDIg9fxvyOF7rUP6vZJ9f1eN4/rsx9hlTvQTFeJLzEw5Oez0HFcTi6I
	KTHGMryAYkzOKiqwD4CtRoSkSbhg2KVJMH2akhJZzJTWQH1rOMXLKNiI8RTqD4J2fyi23TopTcKiu
	OgII4r4W9obsjfJLTptHRFT4gVG1ZKhE1qx+TvOGb8AiwtUK8ZN3pkjx5vjqQ6GHwE2yB5Ju9GG6p
	7aza/ow0De7YPYrmYIxWEOSLgVKPLCZP9V+6u4rdso9RQ76PHpleXTgtGTkmulmbtiDUJSP9kZUl5
	oDcqoynZxOdUQiRoy7jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuhSY-00000007ca5-0HhQ;
	Wed, 19 Mar 2025 00:39:02 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuhSV-00000007cYI-0GLi
	for linux-riscv@lists.infradead.org;
	Wed, 19 Mar 2025 00:39:00 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-225477548e1so110884145ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 18 Mar 2025 17:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742344738; x=1742949538; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i6AMsqHhYAmFWD0QVOxOen+/UORp2DmAIgel+4FhOyE=;
        b=ChZqDm+8/M9yaTRgapPE3JPPon8D09YKNUcEw7ImLYwZJckZxGBSEKCVcSi9cI/nr0
         f7K3EM19rp9IPXut0mGCgv7dA/MNgz/5MdgapdAeZzjMuyik2rXKMyr42nwtz4/YbQic
         uQJeFQWWc5N9o4xly2MSd/3dR8vlC1z78bhAnheFVN6ekq7gEHz6U14ihsBA+hovGSo3
         Zlf+7trItMjpXdDPvRx5SbM7wuhJ7sYuZyAMEt7mnOipD5a9lLOFAKV04bW/9tHrQOGG
         yxCrqEpeyOq+Svct2lNe0mYhoisL/6veoGOYyBvX3jLpOfpk8ug+VliLaHst1gXF/SDn
         BV0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742344738; x=1742949538;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i6AMsqHhYAmFWD0QVOxOen+/UORp2DmAIgel+4FhOyE=;
        b=MzVMN5vyDC2hFnLabhAMf0RmoEv36KJUfwm+vNcPKiIY8diy2M87vXoPlwZdTYmbk2
         8iqmZoxVvTCngY1y0RKT4R7mBVznlGHap5aUPydjDFZUWWrtf89IMb43NHGV1IgG/wVw
         ox9sYzJsX5i1CWsK20JrjuJyNe/SbUD1U3F094gEntMnQMIKo+gbuoiemt2dbasEKVwn
         Bpx+bJg3iyKCvW86PmYvY4xKXe9PqOffaWzepKhE5VQ1yu4QZl2NNKShXnDJv2JDemEA
         7379UtNeBXFClug+yNJbud0eqBEK0SPyL437ynr16426Q5+Iy0v6+YxQ/vc0RLTj8j7X
         Lyrg==
X-Gm-Message-State: AOJu0Yw/JD0N7dcnH+zYaNdHQqvcpeevSvOcXebAflRmK+2i/hTezEXu
	WA6BrtCAPRptZxQgHtg/d3+nILl3AD1pU/v9C1RXvuZ9WXsyN+hiLjnXmO9P5BM=
X-Gm-Gg: ASbGnctSRpIUdu1AaLwOeKLgwhQnAOAXls9J4Bngzrt1rHpLfM+xqb/SHn4BshCHdGG
	elheD97tijt00UHI7G+OoktUZmwtL9d4YJOQql8uBdtmoCYn/Gpocy9MTOduJQxmOcUqVcM8Bky
	q1Z42QO33nOlNXVAdQpYG3B+7eGpsjwInkfwYex2MdCBGhohZxtkNxtsHVd33nwp5E+vqUZIXwM
	LZa6GVSIeXhPgIbkDwzJUjH+sos5c0HqvdMK68B7SQ15PdvJ0U7LU+HvEUA5pNlnccH0mdj4t7y
	CYHTWi6udz9fRbbZZ/v0VFHq9ThtFfg2DMI8yqigS6YE+RgWIz7t4Q7t6I+C
X-Google-Smtp-Source: AGHT+IEguwL4nKeiu40OBWdp9bVI5fB94ky3nWTc4cxopHEMtTnwIt5J6WclaQ8EVg0q2woZ7jkP6g==
X-Received: by 2002:a17:902:e5c9:b0:21a:8300:b9d5 with SMTP id d9443c01a7336-226499282admr9214455ad.23.1742344737996;
        Tue, 18 Mar 2025 17:38:57 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bbe890sm100843415ad.188.2025.03.18.17.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 17:38:56 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v9 0/2] riscv: Add runtime constant support
Date: Tue, 18 Mar 2025 17:38:44 -0700
Message-Id: <20250318-runtime_const_riscv-v9-0-ddd3534d3e8e@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABQS2mcC/43Q3UrEMBAF4FdZcm0lM5Nfr3wPkSVNEzcX20pSg
 7L03c0uyBaJ4OUZmG+Gc2El5BQKezpcWA41lbTMLdiHA/MnN7+FIU0tM+QoOSAN+WNe0zkc/TK
 X9ZhT8XVQfjJShIAGNGub7znE9HlTX15bPqWyLvnrdqTCdfrj6a5XYYBBWzlypOCQj8851aWk2
 T/65cyuZMV/MNgYK13QPlrtyHYY2jOmz1BjACyiNTbgRB1G7BjifUY0pm0rL2DUo/UdRt4Z5P2
 uq2zM6BVoUo7aTx1G7RjAPqMaQyFyEGok6Fas98wf3ejGBEGgFYHUMXYYc2eIyz5jGhOdUpGEM
 pP73c22bd8pY7PBqgIAAA==
X-Change-ID: 20250123-runtime_const_riscv-6cd854ee2817
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Ard Biesheuvel <ardb@kernel.org>, 
 Ben Dooks <ben.dooks@codethink.co.uk>, 
 Pasha Bouzarjomehri <pasha@rivosinc.com>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Peter Zijlstra <peterz@infradead.org>, 
 Josh Poimboeuf <jpoimboe@kernel.org>, Jason Baron <jbaron@akamai.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3163; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=9YtCGrT1TuziOH3DDST8Z7oX0GEI1Z6jgZhkeTJNXXY=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/otIck4sdvvpDU/ddikSIuashTHuc1m1T3CtuvR/9zy+
 I3p+dM6SlkYxLgYZMUUWXiuNTC33tEvOypaNgFmDisTyBAGLk4BmIjUUkaGu9sftSRvmVDN+1pM
 62ZC692dHcYqu+c8/s57/+WExyfO6DAyHFq/yUksnT9p1j3uU69ZxbQPLLllb5XT1aEmonTkKt8
 hbgA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_173859_378509_46B489BE 
X-CRM114-Status: GOOD (  15.86  )
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

Ard brought this to my attention in this patch [1].

I benchmarked this patch on the Nezha D1 (which does not contain Zba or
Zbkb so it uses the default algorithm) by navigating through a large
directory structure. I created a 1000-deep directory structure and then
cd and ls through it. With this patch there was a 0.57% performance
improvement.

[1] https://lore.kernel.org/lkml/CAMj1kXE4DJnwFejNWQu784GvyJO=aGNrzuLjSxiowX_e7nW8QA@mail.gmail.com/

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
Changes in v9:
- Fix bug where stale register data may be used when an lui is replaced
  with a nop. In the following addiw, add to register x0 instead of the
  stale register to resolve.
- Add locks for text_mutex before using patch_insn_write()
- Link to v8: https://lore.kernel.org/r/20250305-runtime_const_riscv-v8-1-fa66f3468dac@rivosinc.com

Changes in v8:
- Rebase to linux v6.14-rc5
- Link to v7: https://lore.kernel.org/r/20250218-runtime_const_riscv-v7-1-e431763157ff@rivosinc.com

Changes in v7:
- Added benchmarking info
- Added CONFIG_RISCV_ISA_ZBA and CONFIG_RISCV_ISA_ZBKB to check that the
  compiler supports the extensions.
- Link to v6: https://lore.kernel.org/r/20250212-runtime_const_riscv-v6-1-3ef0146b310b@rivosinc.com

Changes in v6:
- .option arch only became officially supported by clang in version 17.
  Add a config to check that and guard the alternatives uses .option
  arch.
- Link to v5: https://lore.kernel.org/r/20250203-runtime_const_riscv-v5-1-bc61736a3229@rivosinc.com

Changes in v5:
- Split instructions into 16-bit parcels to avoid alignment (Emil)
- Link to v4: https://lore.kernel.org/r/20250130-runtime_const_riscv-v4-1-2d36c41b7b9c@rivosinc.com

Changes in v4:
- Add newlines after riscv32 assembler directives
- Align instructions along 32-bit boundary (Emil)
- Link to v3: https://lore.kernel.org/r/20250128-runtime_const_riscv-v3-1-11922989e2d3@rivosinc.com

Changes in v3:
- Leverage "pack" instruction for runtime_const_ptr() to reduce hot path
  by 3 instructions if Zbkb is supported. Suggested by Pasha Bouzarjomehri (pasha@rivosinc.com)
- Link to v2: https://lore.kernel.org/r/20250127-runtime_const_riscv-v2-1-95ae7cf97a39@rivosinc.com

Changes in v2:
- Treat instructions as __le32 and do proper conversions (Ben)
- Link to v1: https://lore.kernel.org/r/20250127-runtime_const_riscv-v1-1-795b023ea20b@rivosinc.com

---
Charlie Jenkins (2):
      riscv: Move nop definition to insn-def.h
      riscv: Add runtime constant support

 arch/riscv/Kconfig                     |  22 +++
 arch/riscv/include/asm/asm.h           |   1 +
 arch/riscv/include/asm/ftrace.h        |   1 -
 arch/riscv/include/asm/insn-def.h      |   2 +
 arch/riscv/include/asm/runtime-const.h | 265 +++++++++++++++++++++++++++++++++
 arch/riscv/kernel/ftrace.c             |   6 +-
 arch/riscv/kernel/jump_label.c         |   4 +-
 arch/riscv/kernel/vmlinux.lds.S        |   3 +
 8 files changed, 298 insertions(+), 6 deletions(-)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250123-runtime_const_riscv-6cd854ee2817
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
