Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5702AC83F11
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Aug 2023 08:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kF0qM/tzlQVo5+wTqthVehAs4ixZ3znbexeD4k9mXp0=; b=tNERO5mRhvQq0E
	224M+us3O1WQ5MaI/0zHDHqtziePf8UuNVEX8pqNPdR7aN10Sm9OZQWnMmubKMT8xq9FLZSujLsIt
	EuL2EZUUUQqGGRXpmjH2T48zOP0DXkSO5ErrWIhM9uzMXyRvcKj3FxL86MRUcUt+EDTqfKA0eKJdj
	2sXv5HUpGJEkiDk6vmI4fuLpOwyNnReNavTkyypnPHNxMhKZq0nbV5OxoPe9TKxemyqvDcCGu/hhd
	1qhLs7m1GI9CZ6F9CsbCKxgJgOQZVFvQlJvkXcPOv3E8toc4g4Q3lF+TZ0FiTiKF9yLGeqLixy1Yh
	GRwmABfm2k3/9uwecxwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaBEp-007faI-26;
	Sun, 27 Aug 2023 08:35:15 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaBEl-007fZJ-11
	for linux-riscv@lists.infradead.org;
	Sun, 27 Aug 2023 08:35:13 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-99c0290f0a8so289084466b.1
        for <linux-riscv@lists.infradead.org>; Sun, 27 Aug 2023 01:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693125308; x=1693730108;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Pfh0V8WhEptAH1pn8Pk3597byPb09Pv5kSzHshUdaBo=;
        b=cbRdxoIMaJz2PkjxawPLw9pVmr2jEZKyfO4dY60quz2U1GTHh+P5GfeK/ZVl7TlGWy
         YZ4SruqLYLmjSfmGpyH1c8NJverayKeP9Y4nkS3SnK15iOzv6wbOxJtnoD2zkyFIC5H0
         hgBYkKalKqlly0ipTibr0DnoLVBYTDH084loVDv3Y9wTH3BUoE+YHYlZ0PdV/NE8QaSQ
         WrpSS/bXQ3EXw4eb6A3MQoU3rXZsM0YgqIkUmLgr8Nz5AqmirTWIOOhKGOOy9QOXNFXV
         hCEXYfRZLyirfoUUOyT9htTnTOOJUGnCG3mhSRWRl0Yij9VXAVCYileAwoJEnQGiXkd5
         nsPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693125308; x=1693730108;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pfh0V8WhEptAH1pn8Pk3597byPb09Pv5kSzHshUdaBo=;
        b=N5UdwOHAAjgNAuFZwWbSdll3XZLjpxoiBusUcLuwdXhS27XjLTXMd1Qb3UNdvZ5JN1
         w3wqcGXn0vUh5vJZy2AMF1AF5gzlUkFWGJS0K1WV+cgPSsKdUSwCAGvjr5nBOc7krRLF
         0SzrjkIUyNFs4+e6Unzwo67B7QMFGVxCo4+6iVOyZnbYSoBgeMb3teImzBLl5UkNO/nh
         JCgRW4Dqg55K5TeEgPH6C8WHcGvMJ3gS/Z9SZNqoeBd/SNFivSMy3dWmmQu2BfiF38cs
         lHO4FUx31ESzbEzlJ95jM0bngT70wJpWkSB6PKop+saNcc5EDs/lht+GHFaHVfQ1VoSy
         WX8w==
X-Gm-Message-State: AOJu0Yzmmc2CTXp28aOkOfqyrHfGcJSXbdUZMJ1139bk46PmjoaB7kMQ
	5j0TPt8IBgNhBFutwPxSsLg=
X-Google-Smtp-Source: AGHT+IHaD0JIxtZTAf/gJRwrHt4bQrwDnUeo/LrlrJRrtALXFVYcVoMZZSHHY1ck0JEZW5W2L/xtGA==
X-Received: by 2002:a17:906:53d9:b0:9a1:aa7b:482e with SMTP id p25-20020a17090653d900b009a1aa7b482emr11934040ejo.26.1693125308328;
        Sun, 27 Aug 2023 01:35:08 -0700 (PDT)
Received: from nam-dell (ip-217-105-46-58.ip.prioritytelecom.net. [217.105.46.58])
        by smtp.gmail.com with ESMTPSA id v15-20020a1709064e8f00b00991e2b5a27dsm3169792eju.37.2023.08.27.01.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 01:35:07 -0700 (PDT)
Date: Sun, 27 Aug 2023 10:35:06 +0200
From: Nam Cao <namcaov@gmail.com>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Cc: linux-riscv@lists.infradead.org, Guo Ren <guoren@kernel.org>,
	bpf@vger.kernel.org, Hou Tao <houtao@huaweicloud.com>,
	yonghong.song@linux.dev,
	Alexei Starovoitov <alexei.starovoitov@gmail.com>,
	Puranjay Mohan <puranjay12@gmail.com>
Subject: Re: RISC-V uprobe bug (Was: Re: WARNING: CPU: 3 PID: 261 at
 kernel/bpf/memalloc.c:342)
Message-ID: <ZOsKukBz8i+h4Y8j@nam-dell>
References: <87jztjmmy4.fsf@all.your.base.are.belong.to.us>
 <87v8d19aun.fsf@all.your.base.are.belong.to.us>
 <ZOpAjkTtA4jYtuIa@nam-dell>
 <87cyz8sy4y.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87cyz8sy4y.fsf@all.your.base.are.belong.to.us>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230827_013511_358856_6AD2823A 
X-CRM114-Status: GOOD (  13.00  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Aug 27, 2023 at 10:11:25AM +0200, Bj=F6rn T=F6pel wrote:
> The default implementation of is_trap_insn() which RISC-V is using calls
> is_swbp_insn(), which is doing what your patch does. Your patch does not
> address the issue.

is_swbp_insn() does this:

        #ifdef CONFIG_RISCV_ISA_C
                return (*insn & 0xffff) =3D=3D UPROBE_SWBP_INSN;
        #else
                return *insn =3D=3D UPROBE_SWBP_INSN;
        #endif

...so it doesn't even check for 32-bit ebreak if C extension is on. My patch
is not the same.

But okay, if it doesn't solve the problem, then I must be wrong somewhere.
 =

> We're taking an ebreak trap from kernel space. In this case we should
> never look for a userland (uprobe) handler at all, only the kprobe
> handlers should be considered.
> =

> In this case, the TIF_UPROBE is incorrectly set, and incorrectly (not)
> handled in the "common entry" exit path, which takes us to the infinite
> loop.

This change makes a lot of sense, no reason to check for uprobes if excepti=
on
comes from the kernel.

Best regards,
Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
