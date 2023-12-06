Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3246CC4167B
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Dec 2023 07:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sR31c2u+c43GRppFnbzQyjv5rEEByZgqLiWUjNmhqUA=; b=PDtKKrAXFnzKpN
	slCd3PFRVnJqQHd0qBxytCRSRlGPxBHkwmqu6Bh+vSBQXmJhQODwkARq49KKj6Ri8+UKT5nXY/24S
	dGA9DA05M188crPwx3FrGGZ7FyJz6CjVjn0ZMdMMi6fdpoVzqCUI0iQ5aQzkEBIQ3hP5oOBpR4AjE
	KcNc4H3BWy+fUPevSAHiV9B+ENhfgp6Rg+1dKuiFZuJcY0aOICcPu7R0mf6EbKFKLnIVjAsMB8msW
	3AmrDHVdyY5mbXPwyNr41cQSPB7Ja2G9XWns0QLikqcT/gEqvkXEM4iqxqVtPZ8KOD0XqwF15agk2
	YU4Ldfg/c4/gDgaQmnJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAlvo-009G6s-0Y;
	Wed, 06 Dec 2023 07:02:52 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAlvk-009G5g-3B
	for linux-riscv@lists.infradead.org;
	Wed, 06 Dec 2023 07:02:50 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1d076ebf79cso21626095ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 05 Dec 2023 23:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1701846166; x=1702450966; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fu+2zCulSKmRYIMjAz25mOHD/VLglGiacC9LPzc0jW8=;
        b=O9I5vfSXfoj/LAUK8dI1jMekFn0oJq8IvG456MchW9blubFwhH8GJ+z5/w+ChWRiEb
         03MgEBHZHJs4Uz6TEeHYQZSnz2XdQbx5+kZHJSo0EoWv2E1jORq+AzEW1LMbKl2nonHq
         x9K0c93F2RpINJJUFgXlLQKB08xAnAB7JTUKeJZDtlqd7F6wfZ3jUYAW4DDT/mMIedRu
         2KI4B54Sj5NhuHKGXtI6ED10UXJqyzRVHIcIyAWpuMcaJULnlixRnUGpLf3y6oiC2LjD
         FXU0orTmDokuwrpVbcxyL3LfMEq5Q/CA4gON2C2PwuRk5S8rr2JksWhSwljd+wsM1GYD
         GMjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701846166; x=1702450966;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fu+2zCulSKmRYIMjAz25mOHD/VLglGiacC9LPzc0jW8=;
        b=AzTxNqIbWkbBZ1Q0yK3plftpffSg277TM+lbK7AWfG4EnrS2GFzhqY9k4qxtEK0N4t
         +YOhwY0K2pJNJUyeAGACxFTG7WpirTyFfGFGoRX3zA/FJ7QFxzjxqUCz14WaI0XkgcAO
         XU0Jm1jJYCnbQDrvnt4Hb/bUTOmHUtE3lROhyzi39nOzdcDEblDugyqJKxEVmyBg/rk+
         AJfI5IWdVHMEXg19fu1cgBpPkYuku6a/woB9/Vc5QnG7c6pAr0VEw0EC5mlVDNvAmV32
         BrLCNr3NU/YiyFUnFsBDqN1RMDY70t0o6IlUf9yFF5d3K7MQh4X6pkuLIUSm80Gv1zmY
         7CoA==
X-Gm-Message-State: AOJu0YyRjGHtKL7iLA7XsZLmhOGcvpJbnSW/e9WOp/ThKOdbxe5l/IKL
	+i2vpvpsHad2XtARrEqVWp/egw==
X-Google-Smtp-Source: AGHT+IFutllwNx0W5P2v7t+uVkRlQHqsiAuymkq135vI7dgBN2unDgIUr+uxElxPzn8LDzhuHQ4wTg==
X-Received: by 2002:a17:902:e5c5:b0:1d0:6ffd:cea3 with SMTP id u5-20020a170902e5c500b001d06ffdcea3mr223805plf.92.1701846165671;
        Tue, 05 Dec 2023 23:02:45 -0800 (PST)
Received: from ?IPv6:2402:7500:4d5:3caa:a552:1ac3:8952:64cd? ([2402:7500:4d5:3caa:a552:1ac3:8952:64cd])
        by smtp.gmail.com with ESMTPSA id q18-20020a170902dad200b001d0c37a9cdesm2591565plx.38.2023.12.05.23.02.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 Dec 2023 23:02:45 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.7\))
Subject: Re: [PATCH v3 00/12] RISC-V: provide some accelerated cryptography
 implementations using vector extensions
From: Jerry Shih <jerry.shih@sifive.com>
In-Reply-To: <20231206004656.GC1118@sol.localdomain>
Date: Wed, 6 Dec 2023 15:02:40 +0800
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 palmer@dabbelt.com,
 Albert Ou <aou@eecs.berkeley.edu>,
 herbert@gondor.apana.org.au,
 davem@davemloft.net,
 conor.dooley@microchip.com,
 ardb@kernel.org,
 conor@kernel.org,
 heiko@sntech.de,
 phoebe.chen@sifive.com,
 hongrong.hsu@sifive.com,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org
Message-Id: <434A2696-7C9E-4D13-9BEE-25104D37E423@sifive.com>
References: <20231205092801.1335-1-jerry.shih@sifive.com>
 <20231206004656.GC1118@sol.localdomain>
To: Eric Biggers <ebiggers@kernel.org>
X-Mailer: Apple Mail (2.3445.9.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_230249_059628_4A22665D 
X-CRM114-Status: UNSURE (   9.68  )
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

On Dec 6, 2023, at 08:46, Eric Biggers <ebiggers@kernel.org> wrote:
> On Tue, Dec 05, 2023 at 05:27:49PM +0800, Jerry Shih wrote:
>> This series depend on:
>> 2. support kernel-mode vector
>> Link: https://lore.kernel.org/all/20230721112855.1006-1-andy.chiu@sifive.com/
>> 3. vector crypto extensions detection
>> Link: https://lore.kernel.org/lkml/20231017131456.2053396-1-cleger@rivosinc.com/
> 
> What's the status of getting these prerequisites merged?
> 
> - Eric

The latest extension detection patch version is v5.
Link: https://lore.kernel.org/lkml/20231114141256.126749-1-cleger@rivosinc.com/
It's still under reviewing.
But I think the checking codes used in this crypto patch series will not change.
We could just wait and rebase when it's merged.

The latest kernel-mode vector patch version is v3.
Link: https://lore.kernel.org/all/20231019154552.23351-1-andy.chiu@sifive.com/
This patch doesn't work with qemu(hit kernel panic when using vector). It's not
clear for the status. Could we still do the reviewing process for the gluing code and
the crypto asm parts?

-Jerry
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
