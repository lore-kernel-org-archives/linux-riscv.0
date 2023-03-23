Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C748C6FD1D
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Mar 2023 07:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SOVwUTHRRe1qfEiHWsOXMUDpexmcdlqYMOvaX7BGvHc=; b=RYKc/B+s6KQqLJWCoMnQatTDRO
	FKiEuwc2U901I6Rdtu3bGbXaQJjTjEVPaPiYhc43BsSSyl4KBLqz8SVFj8ua46YWdM0KZdNxIElUA
	XQlFu08qB7XLKtmv8kmuofTdV8ju85Hta9SM/lj31ynb6+DL0FoRxp1YATARwZn3O/4l+UVG3gViG
	yAnDkpaWHGlilztLLUa0N8F3RRjPan8sFKa+4y9mDbaybWEI1DWwwF9ldP7uTgVECTzpypQBEjAN3
	j6XyhLgN+9CiDn7aMeIc2iVG+QJoWIoP+Ib3OVkwFkDV8YwihE3+d/6ZLkzamwJzZwKKEmNQoS5Di
	puRdUgtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfFiO-0019XX-23;
	Thu, 23 Mar 2023 07:50:28 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfFiL-0019VU-2b
	for linux-riscv@lists.infradead.org;
	Thu, 23 Mar 2023 07:50:27 +0000
Received: by mail-pl1-x62d.google.com with SMTP id bc12so20960772plb.0
        for <linux-riscv@lists.infradead.org>; Thu, 23 Mar 2023 00:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1679557822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6GQvyyWfzdZlNTPcJjFuNq4iVi6kYqIRTdIXM0bxkig=;
        b=YrA6kgUuYXXc/yhtRQjq7msKg6c5+EDSg8TFX0Lx/oemng6GYs/2p+aorlJgMm/2fW
         4wAgSJoVKSyBRG03vz63JfUwBWt/DBOgxVv+I2sIrRmEBmltH2QBWhPnh7Fccwtzgiq/
         4gBCtyWPN9dafmH7irN5n0eiQ/jCT/lsUOC83oqw2Md577Ejk2UaClNJzgBen3RjXW1W
         ZtzTgr2blbfcJf54cSlkKse2MCu8AFOlIoJmtSfNIHpzjJvE42Kblo2qEhJ1Fzb2lQFL
         ED2e+kPUYtYAuV7dF7NGikoDI5sYKGLXUCHlqKK3u74OU/SxWrEjTMkSJmWC2fKvxlLD
         TqYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679557822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6GQvyyWfzdZlNTPcJjFuNq4iVi6kYqIRTdIXM0bxkig=;
        b=j9C6peWL5zL1F+WdDFu0BgRJOge83PjXH+iXmE2AbCYCZ2awLoPeRyDp36olf8UQcl
         BbMZAV9MSOhG4PZzP8nXfXoW3EZbGAzI4olTaV0KtfIjlxOMHa6czNq8iYvA0hYbkZGZ
         f9EOwxSFHVfjlm2LMB9zq3rkcsuL9HmJk2R2HCoDpy8l+aXh6vO2THxTJXy7F39ml2OE
         QmqaVGPZjb6bTyRt+lixbXwRV9ThYDucnGm2YNYqHchdwdXPD6dJ5OLDqLe5rrkWDxJH
         4yFWdD4LNA2ciKEvjJqAmUWky9mHfbZYKbDloZaFk1hH6GnYwqf+6n1nbogmRQeMgVzL
         fQdg==
X-Gm-Message-State: AO0yUKU6ZisGMwD7oiXCVlgGnJHBCZ1HkCeZw4RitcmpYNCqNZ3sahfq
	O5oEtu2Qze9Do5ZOFqMPKdCfPg==
X-Google-Smtp-Source: AK7set8reMhX/0K1+rtbWu5hJYhaj/eSdvG6l3WSWzeAaiqpKAIhdJYZ/Zlz/C6BcxymP8O2h7O7/A==
X-Received: by 2002:a05:6a20:6aa0:b0:db:d1d5:1e00 with SMTP id bi32-20020a056a206aa000b000dbd1d51e00mr1664778pzb.60.1679557822205;
        Thu, 23 Mar 2023 00:50:22 -0700 (PDT)
Received: from archlinux.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id x16-20020a63fe50000000b005004919b31dsm11063641pgj.72.2023.03.23.00.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 00:50:21 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: conor.dooley@microchip.com
Cc: abrestic@rivosinc.com,
	andy.chiu@sifive.com,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	atishp@atishpatra.org,
	bjorn@rivosinc.com,
	david@redhat.com,
	greentime.hu@sifive.com,
	guoren@kernel.org,
	guoren@linux.alibaba.com,
	heiko@sntech.de,
	jszhang@kernel.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	richard.henderson@linaro.org,
	vincent.chen@sifive.com,
	vineetg@rivosinc.com,
	xianting.tian@linux.alibaba.com,
	zephray@outlook.com
Subject: Re: [PATCH -next v15 13/19] riscv: signal: Add sigcontext save/restore for vector
Date: Thu, 23 Mar 2023 15:50:14 +0800
Message-Id: <20230323075014.2135132-1-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <e0b5df49-4d78-4a0f-8509-ff29085486cf@spud>
References: <e0b5df49-4d78-4a0f-8509-ff29085486cf@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_005025_897411_C6F02F72 
X-CRM114-Status: GOOD (  11.47  )
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
Content-Type: multipart/mixed; boundary="===============2245542982460427306=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2245542982460427306==
Content-Type: text/plain; charset=ascii
Content-Transfer-Encoding: 8bit

On Mon, Mar 20, 2023 at 9:37 PM Conor Dooley <conor.dooley@microchip.com> wrote:
> Sparse, or at least Palmer's hacked up version of it that I am running
> [1] complains a bit about this patch, that you've added a few:
> +      1 ../arch/riscv/kernel/signal.c:145:29: warning: incorrect type in initializer (different address spaces)
> +      1 ../arch/riscv/kernel/signal.c:171:24: warning: incorrect type in initializer (different address spaces)
> +      1 ../arch/riscv/kernel/signal.c:172:24: warning: incorrect type in initializer (different address spaces)
> +      1 ../arch/riscv/kernel/signal.c:268:47: warning: incorrect type in initializer (different address spaces)
> +      1 ../arch/riscv/kernel/signal.c:282:16: warning: incorrect type in initializer (different address spaces)
> +      1 ../arch/riscv/kernel/signal.c:283:16: warning: incorrect type in initializer (different address spaces)
> Please have a look at those, and check whether they're valid complaints.

Yes, they are valid. Meanwhile, running sparse locally, I found the 
following, which are also reported at 19/19 patch:
arch/riscv/kernel/signal.c:78:13: warning: incorrect type in assignment (different address spaces)                                                                                                                                                                              
arch/riscv/kernel/signal.c:80:18: warning: cast removes address space '__user' of expression
arch/riscv/kernel/signal.c:92:16: warning: incorrect type in initializer (different address spaces)
arch/riscv/kernel/signal.c:114:51: warning: incorrect type in initializer (different address spaces)

And these need to be fixed, while not found by your sparse:
arch/riscv/kernel/vector.c:81:28: warning: incorrect type in initializer (different address spaces)
arch/riscv/kernel/vector.c:81:28:    expected unsigned int [noderef] [usertype] __user *epc
arch/riscv/kernel/vector.c:81:28:    got unsigned int [usertype] *

However, there is no way to get around signal.c:92 though. The copying of
__user pointer to a __user address should be valid.

+static long save_v_state(struct pt_regs *regs, void **sc_vec)
+{
...
+	/* Copy the pointer datap itself. */
+	err |= __put_user(datap, &state->v_state.datap); 
...

>
> Otherwise, this version of this patch seems a lot nicer than the last
> version, so that makes me happy at least, even if sparse isn't..
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>
> Cheers,
> Conor.

Thanks,
Andy


--===============2245542982460427306==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2245542982460427306==--
