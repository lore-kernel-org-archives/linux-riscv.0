Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3825AC2BD05
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jun 2024 18:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G5+eoAsyCtNpobwnurx+y0hBEtrT3ASZ2a9U5jCD1OQ=; b=KtslCFxi9BnuSu
	5U0ZzXipkzCky498jQoWk4vELDXzxrCHiaRP1HLRrQWg/1XOm25dMSXqbS/rFU6wKyqk0jreYBdux
	X9Jb+n/Gbcd0T/RsNQ6CZWJt1mQtwM5rz1FlMLgeskmMEE0Qp0HWJbNxM3SHQSorP6RJcQcgEt1vq
	C+KrXE2QSsZcNnSqPGyhhQpmiS93TvqUA3rwDd5LAuHJ5oNdO2AGAA0d9zB1IGGuJ68q7U9cnc84B
	vL07ucS3lggRza0jIFKsl8saDAkOErDUJAaJiRS92QIICYXcbNonKagTewME0eWEuQQrD+9XBU8Qo
	/hE/M32LkCvWSs0WhSSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKiYd-0000000AAMV-2AIi;
	Fri, 21 Jun 2024 18:00:19 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKiYW-0000000AAL7-3qGj
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jun 2024 18:00:17 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-42108856c33so20510195e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jun 2024 11:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1718992810; x=1719597610; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dcW2S4JnM/18YUMxiJvbZaNnlkBv83HxD2e/gGhKLxA=;
        b=m7BgROg0y5KOG9QSPw2E2AjdT3YQAxI6+qSFiPlvPIic1Go9bvOCzvNlJ5Hifu8BOB
         3FuA1qCdMjEJavrJ5CRnjR6Rai75w237yjfVgLJXXs9IPk5/7tj+4rnMWZDzU/M8tQhG
         sQmiRTmmObuONBgOYDOVxajR6AVi1CVA/zdukzEGYWenQb3OKNG0MEfFJGUodKhF/JkJ
         1Htl1uaF0Y1pFjFcIDLBqYcEFX3H3W3D95eV3z4TkFjpRiUBMuja/82hyL8NjEMHTvNw
         yAAd6MfN9cpMFM0e1f6IXiJVmWNWYBu1KugH6OATWfl6ggIX/QAnSzYpR/l+4vfi9lgo
         tCKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718992810; x=1719597610;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dcW2S4JnM/18YUMxiJvbZaNnlkBv83HxD2e/gGhKLxA=;
        b=kuSopqSOs10wez+HZoMCr/yDMbcBpj1XwNxw+0Qg+nOKFZbsfe5t24loArryCvYdmZ
         wXpt/Q7O91qcIKYU1tg0AQhEhodmy/YnYIJQxR9WtQxAwHPnZ3lP2E7pCCLlTiCAX8GA
         t0dx4ClQapYndhupNpzl/94W2ZxQU9SiCMq38qX3AfXm7GK4QgT/9H/5s8XTGpfxP6hb
         /MQ/nWCAmuJckWCALwuB5YDauO9Xl/8vBO3mB847lYQzyi6korUNrB0fTqgzA5Mu2JrM
         4JPM0mYbrXyREhv5pXClrqlC0NsW47/PC240U5HRg5lR8ZZlcu8WU79NKENP9OzZBdHo
         3XmQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+dHQ5VYKHyDc0sYm7IhbFB8OCbm9/6NrTxXaVXZ7zn4ukSvjg9OlAXMTO2MnCvCVzEHUzv5exwY9fewCOrItKyclhQgRsoTZy2Z0TYvo6
X-Gm-Message-State: AOJu0YzffwVXVN6UDgm8tqIeMOlpc0OVtyRpQJV1ZKo8cxYb443BXfVM
	8ewZxcrw9gjrqRuvd0vneBO7jnQ7rEy+BaDyFH7OpO4FSvI6Gpb0b3JEq0auTQI=
X-Google-Smtp-Source: AGHT+IHJZWd1LTX+rQA6S+wz85uWg7nnYgT+DKEAOy8tWyIz+TJ8SRQ7NPvaMSgBbS6QqFs2pP71fA==
X-Received: by 2002:a05:600c:1d28:b0:421:5a2a:3cca with SMTP id 5b1f17b1804b1-4248630f4a7mr4623265e9.10.1718992810372;
        Fri, 21 Jun 2024 11:00:10 -0700 (PDT)
Received: from smtpclient.apple ([131.111.5.201])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4248179d59asm40748835e9.9.2024.06.21.11.00.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Jun 2024 11:00:09 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [PATCH v2] RISC-V: Provide the frequency of time CSR via hwprobe
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20240621113143.35827-1-cuiyunhui@bytedance.com>
Date: Fri, 21 Jun 2024 18:59:59 +0100
Cc: Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 Evan Green <evan@rivosinc.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 costa.shul@redhat.com,
 Andy Chiu <andy.chiu@sifive.com>,
 samitolvanen@google.com,
 linux-doc@vger.kernel.org,
 linux-riscv <linux-riscv@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@rivosinc.com>
Message-Id: <705FA6B0-53E6-4CF0-B840-D51EC871B596@jrtc27.com>
References: <20240621113143.35827-1-cuiyunhui@bytedance.com>
To: Yunhui Cui <cuiyunhui@bytedance.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
X-Mailer: Apple Mail (2.3774.600.62)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_110013_001263_AEAA4AB0 
X-CRM114-Status: GOOD (  21.44  )
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

On 21 Jun 2024, at 12:31, Yunhui Cui <cuiyunhui@bytedance.com> wrote:
> 
> From: Palmer Dabbelt <palmer@rivosinc.com>
> 
> A handful of user-visible behavior is based on the frequency of the
> time CSR.
> 
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> ---
> Documentation/arch/riscv/hwprobe.rst  | 2 ++
> arch/riscv/include/asm/hwprobe.h      | 2 +-
> arch/riscv/include/uapi/asm/hwprobe.h | 1 +
> arch/riscv/kernel/sys_hwprobe.c       | 5 +++++
> 4 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
> index fc015b452ebf..c07f159d8906 100644
> --- a/Documentation/arch/riscv/hwprobe.rst
> +++ b/Documentation/arch/riscv/hwprobe.rst
> @@ -229,3 +229,5 @@ The following keys are defined:
> 
> * :c:macro:`RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE`: An unsigned int which
>   represents the size of the Zicboz block in bytes.
> +
> +* :c:macro:`RISCV_HWPROBE_KEY_TIME_CSR_FREQ`: Frequency (in Hz) of `mtime`.

This still says mtime.

Jess

> diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
> index 630507dff5ea..150a9877b0af 100644
> --- a/arch/riscv/include/asm/hwprobe.h
> +++ b/arch/riscv/include/asm/hwprobe.h
> @@ -8,7 +8,7 @@
> 
> #include <uapi/asm/hwprobe.h>
> 
> -#define RISCV_HWPROBE_MAX_KEY 6
> +#define RISCV_HWPROBE_MAX_KEY 7
> 
> static inline bool riscv_hwprobe_key_is_valid(__s64 key)
> {
> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
> index 7b95fadbea2a..18754341ff14 100644
> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> @@ -73,6 +73,7 @@ struct riscv_hwprobe {
> #define RISCV_HWPROBE_MISALIGNED_UNSUPPORTED (4 << 0)
> #define RISCV_HWPROBE_MISALIGNED_MASK (7 << 0)
> #define RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE 6
> +#define RISCV_HWPROBE_KEY_TIME_CSR_FREQ 7
> /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
> 
> /* Flags */
> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
> index 83fcc939df67..fc3b40fb9def 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -8,6 +8,7 @@
> #include <asm/cacheflush.h>
> #include <asm/cpufeature.h>
> #include <asm/hwprobe.h>
> +#include <asm/delay.h>
> #include <asm/sbi.h>
> #include <asm/switch_to.h>
> #include <asm/uaccess.h>
> @@ -226,6 +227,10 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
> pair->value = riscv_cboz_block_size;
> break;
> 
> + case RISCV_HWPROBE_KEY_TIME_CSR_FREQ:
> + pair->value = riscv_timebase;
> + break;
> +
> /*
> * For forward compatibility, unknown keys don't fail the whole
> * call, but get their element key set to -1 and value set to 0
> -- 
> 2.20.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
