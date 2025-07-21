Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93ED9C83F1A
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Jul 2025 13:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t5Nt5Q3Cs/4Gk0QMXWvoX5FfQVkZYhPMa8yLCRddXZ8=; b=As6iJ4DIFrPsX+
	hP5Qyh9RCSRVqgz/DfwoxIOpI9g/v15kypM36TyPXR1IkPPWUCcc0tjMz0eGtnBAUPoHVp5+v1EyY
	4E4+udvR6Q39LksO24NfYgciy5mWIvml8GhgAs1bVlXA+YPc+IKgNjAvY7ovAM6+08xMwSK3tXM4D
	AA+3MDgt5NfG4kAFOK1snbW/eevefKsiZJjZuRQT+7EyDRKWB8KWLfzqd/YA+/254KFOS5tOaSDYJ
	so/8jAF7sAvAvbfj2DAFOI4/JnGB6gaCqhDzkQ9tssghTaxBiiTN8QWUF/jIZE6CchiUGcoeL0X5y
	kmKq3p38J1UTISLOhqeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udqpK-0000000HQ51-2aFD;
	Mon, 21 Jul 2025 13:45:10 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udpk7-0000000HGgM-1arJ
	for linux-riscv@lists.infradead.org;
	Mon, 21 Jul 2025 12:35:44 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-45617a1bcdcso7664425e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 21 Jul 2025 05:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1753101341; x=1753706141; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FhfW4Yl2ze2Tz30g9DaUQC2yawhgCgjVZKlnhz6aclQ=;
        b=de3HMW78DTO5VET8rIbY73bFcwx/AojeVqMecIUoxtkUbGN21lDM4xpLbq0wHtnJZU
         zKC+vN/IDV6rbhtFasySu0F2Qv0g8U+8PmaLlyu8yePqeuYz+Js98MxBH9XLvEcxn6Q0
         sPpbo/MTPpqQOvNRRU/Ofu1nvvSgb7yvLkaNTVqVkWDNaopXf3nokrKAx4D9ccV67FOy
         o6IJuASS0hOegcRBYSggWiCk8Puh3GZTsEg4AnO55Krm6BL48KSFqV4SH6hhW/ewB8cS
         Ua6zRKKD8V1fvCQlH4BirYEX4HbGsDaetGxvXlx7tvvjjnWB3od+WJkwC6WGWZiOkkbj
         XaSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753101341; x=1753706141;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FhfW4Yl2ze2Tz30g9DaUQC2yawhgCgjVZKlnhz6aclQ=;
        b=T81fOT+cB7CIiC/8MK+h+sB+qMrVjX2UWoVqa41xmlt7lng0Uaizwdbp0bVeCv8N9W
         Xl+ndyijOWG2JFuLnHO032bi8frXaEDRUqRJiLScAthYPiyv23oNqkhEErIZADVk6LGe
         QEaHLG+mg8bNFacpRcHnsGkjmOe3qzAoLagptICR9WHMH3guFqPQjOce3DiJC3w1yztN
         Ts04RfnssfnCcYPsMzDF0nbSBdp6T2eQZAnDhH3oyJvVMLFFelCMgSG89TLP6D06RpwD
         MgP8CujrAZyYY9Erb4Oga4/y6GO+HbnTxIz1p1YK3lpgcIBxVvASacabg+G9e90QilDH
         3MBg==
X-Forwarded-Encrypted: i=1; AJvYcCVQ0lyfu6z/p0oFGcvfwN0h0HeCV46+81wrS+URWo1b6SRDaf33/x3RJs0l9T8VX+Bq9qvPY4JgRO2eJA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8QO8pCnKhPr8d+jXoX7HDVbPIxaD0ClZvmt1XED1x6wXfvDdc
	DUoGrXJzysT25quzJjGBOP0WHZOTucmqyB+Fnylx5K/Iu4kMzRZLO7Rr/yfM3AajaV4=
X-Gm-Gg: ASbGncsIQW/UNpsaRrrVovdmhYIRcBdhTRwLUif4nRt/XVAHJ5vBApV0MhnWhYDUirb
	YW2Cpm8YrVNkUvQA1iCbeB6EhL7448IYrLHm4rPPZ+ARHJUcxvUmMJUEj1INGwtOgNQUNj3oZeQ
	2VoaiP4BzhraSh8+c+ey37+0Cx/pO9dCOWXnlM9e3rM9sdW/xJHrNKRprbmIQFlk4bIrDIZ2jmt
	myVOa2CnW5aUAXa4RhOl3g7ciMFLSj7EeJPbC9MITyY/7PwRkjnFR399bjzaFf7ZaR0Nb7t+ID4
	otQ8D7diaD9UAeVY/BJDRMUFcYujrJ4xyYvzT96pAlu+i7Awbaot6GE+TsjPOY3IYtIetwGf+WY
	K4meZZDHKlZrNvhzKr1Tz4IQS5LpFaA==
X-Google-Smtp-Source: AGHT+IEcyghpQXedg8Fbb1DgxtR7REF0rvMfT2EEhXvMZGbm0ucdzrH+CV2xboEPsvvhaT8T0Y261Q==
X-Received: by 2002:a05:6000:208a:b0:3a6:d403:6429 with SMTP id ffacd0b85a97d-3b60dd60554mr6524784f8f.4.1753101340935;
        Mon, 21 Jul 2025 05:35:40 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:25d5:2321:c8db:1609])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b61ca2bb80sm10369612f8f.23.2025.07.21.05.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 05:35:39 -0700 (PDT)
Mime-Version: 1.0
Date: Mon, 21 Jul 2025 14:35:38 +0200
Message-Id: <DBHQK4W9CL9F.1WM8JFVDQZ44F@ventanamicro.com>
Subject: Re: [PATCH] riscv: Add sysctl to control discard of vstate during
 syscall
Cc: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
To: "Drew Fustini" <fustini@kernel.org>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?=
 <bjorn@rivosinc.com>, "Alexandre Ghiti" <alex@ghiti.fr>, "Paul Walmsley"
 <paul.walmsley@sifive.com>, "Samuel Holland" <samuel.holland@sifive.com>,
 "Drew Fustini" <dfustini@tenstorrent.com>, "Andy Chiu"
 <andybnac@gmail.com>, "Conor Dooley" <conor.dooley@microchip.com>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250719033912.1313955-1-fustini@kernel.org>
In-Reply-To: <20250719033912.1313955-1-fustini@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_053543_417413_C0872E27 
X-CRM114-Status: GOOD (  15.63  )
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

2025-07-18T20:39:13-07:00, Drew Fustini <fustini@kernel.org>:
> From: Drew Fustini <dfustini@tenstorrent.com>
>
> Clobbering the vector registers can significantly increase system call
> latency for some implementations. To mitigate this performance impact, a
> policy mechanism is provided to administrators, distro maintainers, and
> developers to control vector state discard in the form of a sysctl knob:
>
> /proc/sys/abi/riscv_v_vstate_discard
>
> Valid values are:
>
> 0: Do not discard vector state during syscall
> 1: Discard vector state during syscall
>
> The initial state is controlled by CONFIG_RISCV_ISA_V_VSTATE_DISCARD.

I think it is a bit more complicated to do this nicely...
Programs don't have to save/restore vector registers around syscalls
when compiled for riscv_v_vstate_discard=0, so running under
riscv_v_vstate_discard=1 would break them.

Shouldn't we have a way to prevent riscv_v_vstate_discard=0 executable
from running with riscv_v_vstate_discard=1?

> Fixes: 9657e9b7d253 ("riscv: Discard vector state on syscalls")

Programs compiled for riscv_v_vstate_discard=1 are compatible with 0, so
I think it would be simplest to revert that patch, and pretended it
never happened... (The issues will eventually go away.)

Shouldn't the RISC-V Linux syscall ABI be defined somewhere?
How come we could have broken it with 9657e9b7d253?

Thanks.

---
I don't think it makes much sense to clobber vector registers on a
syscall -- a kernel might not even touch vector registers, so they are
efforlessly preserved in that case.
If kernel needs to use vector registers in the syscall, then the kernel
needs to prevent any register leaks to userspace anyway by restoring
some state into them -- and why not restore the original one?

I think that main point of clobbering would be to optimize
context-switches after the userspace is not using vector registers
anymore, but it's terribly inefficient if the ratio of syscalls to
context switches is high.
Linux can also try to detect the situation, and turn to lazy vector
context-switch, with sstatus.VS=off, instead of eagerly restoring
clobbered state.
(A good indicator might be that the userspace hasn't dirtied the vectors
 since the last context-switch -- kernel didn't need to save the state,
 so it will restore lazily.)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
