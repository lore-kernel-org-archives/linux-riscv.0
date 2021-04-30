Return-Path: <SRS0=p8lL=J3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F5D5C433B4
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Apr 2021 19:50:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9661B61185
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Apr 2021 19:50:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9661B61185
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=FqQw70Amg6DSuMcKFl9OwzNovFTYHDNRS8IE7U6oJys=; b=kfcqkUL01Q1gSvNTBCVVmInWY
	qF7g9Py/btEZnmUPmlDEe2h1KU4kcgH+JrxRh0uWtfQgieiDblpMpD2jrceWyhg39PizTMGZ6CMMK
	jlkQhk6leivOdARlNjg4609/R+oJjW6gyp+wQwUI38WskR4ACZgIEmLxWTUMZrmI/1LR26NLtyuW1
	nHXUuNCuEFb1WqEAFEJC412gtbvYcd5n1nljVLz1sHVnCWxQN2khY6qCcdiPG1WRjk0Z7FDlY9NCQ
	u8lJvvIHhf5+nfJylUi0haaLF4He794+BpRTpVdyEUCyf4Bh6+WjidAdnrFZJaEH58q89Uy1fhAmX
	SHg6RT+wg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcZ9A-008SOa-VQ; Fri, 30 Apr 2021 19:49:57 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcZ46-008RoC-BC
 for linux-riscv@desiato.infradead.org; Fri, 30 Apr 2021 19:44:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:
 Sender:Reply-To:Content-ID:Content-Description:References;
 bh=2TLq4e6kvET2xht98betGHvp/vebBRLyAaxh+3CTBLo=; b=qbvBOBvHt6PQpgz3+AhvqBBiVR
 g3IOqGqfGKWbPNKo47xqg6+5qHCjyE7KBd7RF7X9VBj4PwOIcZrxMvdKy9JTH904kqwmSyoVl8az7
 0AuJQxqmrZ4JcX5BFdoyJe5UnVPNIF2ZSLKAWzyPBVdwLHCpGrY+CE73i0aQMFbt1ArvxibRkRlHf
 vHH7SVpR1OV3syUFv+jpNMwwIOdKyg0YHHgqXAF/bo2Rve+QOQkYviXREMlJcxZRtUjVI8mX4jT2A
 Yk3T9oVGS0j88ovzQFtxDyh5Tz3Bxc0tlQsVVE18vRI78RvnwO0vpOkVYRCT1xaSpyYywLeAP/5Co
 DjN8CCGw==;
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcZ43-001cXU-Sb
 for linux-riscv@lists.infradead.org; Fri, 30 Apr 2021 19:44:41 +0000
Received: by mail-pf1-x429.google.com with SMTP id b15so4941652pfl.4
 for <linux-riscv@lists.infradead.org>; Fri, 30 Apr 2021 12:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=2TLq4e6kvET2xht98betGHvp/vebBRLyAaxh+3CTBLo=;
 b=GnxY/quB8BUkeEn2JWmikGfrGIjVGHMjD8cHIEu0s8SPMnOzf/N4Uup7cCPCUqoqbP
 Pfg+L/76ea7FFxgmZ/U6pA96+PaylsvPKdtVweBq8jtBzOutQ/BTX/C9AUKxJlF4mzjg
 fCr4OMyLAwRROj24e57RKvlVu0kxYvnGZ/QSTd7FnI1HnKEZqqKOMxKlL+KaKZrl5DAs
 dcHLIBiJ7RQ4pzySFKib5zPWz9XH/yZGgB7YSzqPEdnMYjf9L6GOFbc/cP/uhcSuBKcQ
 wi1si8jk3HP2/bl2UPOTReRcYLe5zn5akvCnejvse6AkHVRykjkXcfaJUvJYgwnGtJ7M
 nrlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=2TLq4e6kvET2xht98betGHvp/vebBRLyAaxh+3CTBLo=;
 b=fIzgdmhRixfUMxDpop15idjJiO++GIamEZ2Yr+fKhLLLxNJvu/felcg28Xg5IXz9aG
 upI7d/Wa7QfqCHMqCBpibrY7dxCx7fIN9oOxxwOkBOyh2TNQs82YS2bIRTdzNZ2xfF+C
 LqZZfBEQdhtjZ7BZ/js8Q62insw2YfFemQjCW3D/pqtuSTziNAA5jY1v2OxWe74FQdk+
 EuQRzAyRV3qc+r74ljjKwy2h3aVJ96kuQLqYkOa/iJRsLDJQOzWfwZsqI53w5ww8QRd6
 s1w8ndiOHsiDMBPNVRtLtVEq2Y/D3PbbcgeDQfpM/ZoWCpXOtvNeop7CbI4E03MnMhlM
 CbSA==
X-Gm-Message-State: AOAM530fimp4/+2QkrZlOvnyk3qyZ9y2F1K3xDuGJ9z6KSgzfV9VgQT1
 EXIroW4dzkT2JdrjBre8jSyTcw==
X-Google-Smtp-Source: ABdhPJxq071PjYbmf0SF7onwhFr4uux4Yjyk5sPaoJd4hloG6xFLZf+5ajKHb3QPtjge4qxDhJMyrA==
X-Received: by 2002:a63:5963:: with SMTP id j35mr6056738pgm.281.1619811877688; 
 Fri, 30 Apr 2021 12:44:37 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id o4sm2935314pfk.15.2021.04.30.12.44.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 12:44:37 -0700 (PDT)
Date: Fri, 30 Apr 2021 12:44:37 -0700 (PDT)
X-Google-Original-Date: Fri, 30 Apr 2021 12:44:35 PDT (-0700)
Subject: Re: [PATCH] RISC-V: insn: Use a raw spinlock to protect TEXT_POKE*
In-Reply-To: <20210430073431.1bc4946d@oasis.local.home>
CC: Anup Patel <Anup.Patel@wdc.com>, changbin.du@gmail.com,
 linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, 
 peterz@infradead.org, jpoimboe@redhat.com, jbaron@akamai.com, ardb@kernel.org, 
 Atish Patra <Atish.Patra@wdc.com>, akpm@linux-foundation.org, rppt@kernel.org,
 mhiramat@kernel.org, 
 zong.li@sifive.com, guoren@linux.alibaba.com, wangkefeng.wang@huawei.com,
 0x7f454c46@gmail.com, 
 chenhuang5@huawei.com, linux-kernel@vger.kernel.org, kernel-team@android.com
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: rostedt@goodmis.org
Message-ID: <mhng-dbd1fd8c-37f7-4b60-a61e-3f8d22e5baf0@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210430_124439_962389_4D4866A2 
X-CRM114-Status: GOOD (  15.75  )
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

On Fri, 30 Apr 2021 04:34:31 PDT (-0700), rostedt@goodmis.org wrote:
> On Fri, 30 Apr 2021 04:06:35 +0000
> Anup Patel <Anup.Patel@wdc.com> wrote:
>
>> This patch only takes care of ftrace path.
>>
>> The RISC-V instruction patching is used by RISC-V jump label implementation
>> as well and will called from various critical parts of core kernel.
>>
>> The RAW spinlock approach allows same instruction patching to be used
>> for kprobes, ftrace, and jump label.
>
> So what path hits this outside of stop machine?

I didn't actually dig through all the usages of jump_label, I just saw a 
handful in places where it's generally not sane to assume that sleeping 
is safe -- for example, thoughout kernel/sched.  If you think it's OK to 
rely on users of the static branch stuff (IIUC the only jump_label user 
in the kernel?) to know that it can sleep then I'm fine keeping the 
text_mutex call in jump_label and adding one to ftrace (I'm fine with 
something generic, but it's simple to do in arch/riscv).

IMO if the static branch stuff can be expected to sleep it'd be good to 
call that out in the documentation, and I'd like to audit the uses 
before committing to that.  I'm happy to do that, we can just take the 
lock in arch/riscv's frace code for now to get around the lockdep 
assertion failure -- IIUC that's indicating a real bug, as nothing in 
ftrace avoids concurrency with jump_label and kprobes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
