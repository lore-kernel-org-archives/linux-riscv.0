Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CEA3CCF9F0
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Oct 2025 10:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YdwilDbL32gxjabwL1CoCz+2NEulejzsaqKwj2kNpxs=; b=go6Z128dyMVYjd
	V3Eoh6carzYAjFz+WUMp/Umupz0U0+HRoMOk1DkGdxUbMg21lSpACj9vhZ4T12FPSe+/g6dFqtgem
	NekU9QunLVdrAJiVDiCODMY2twpzs4jJoIEGpsBu7pUq4XPWpIxDkhFcHGH+tDCZeGWL9k9aJiZOC
	U+yahMqVDWBnNwEcoWzazQ3gz1TEQeitmvHbx8KDON45+9NWBhOzpWZXmGUryY7lBU3cUlU76zPsn
	XF1qd4l4gRRSthWzFVIt3C5GdEQhKbnFMg/6BNbEf7u0DmELZ2NrQyVOvIYq5gBXOk3dpmdEU6eh/
	egLK7Hwvvb87zGBlFxSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEPqK-00000003ygu-2ZuY;
	Thu, 30 Oct 2025 10:25:20 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEPqH-00000003yeg-2GGi
	for linux-riscv@lists.infradead.org;
	Thu, 30 Oct 2025 10:25:19 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-b404a8be3f1so15861166b.1
        for <linux-riscv@lists.infradead.org>; Thu, 30 Oct 2025 03:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761819915; x=1762424715; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lTgIsc3O+wDypaKqBlwZIo86kBPQGfr40arZuVCJ75M=;
        b=HUAHUuoFux2zbNVWK5K8CNDgb39Yzl+w7F1AFPAmnuCB4blsRDkRMwLO1mtps+iFcK
         aGuwuTpfQVr2auXe7Zh1lnyEOr9UnNZ1stywHys2NCJsVxsAyVvFkEUWGX+Z5OxlEYzq
         evZGPBCrrQuBWyKvZkQ3nZc8nHo35X50WkF6KMaKMwwuxoALAxLTL0eoUcN36wg0WM8E
         2Q7A1Z/TnjBSZKnxRlTnLgYyJlElQLfR0yC1yY0GKZPKirjmCvZuzDbk15c80NzaHi5p
         o59RBw5r9Q9hRNlGY0uOMUPOeoRm7F7YdMj04T6bRCjOyTqjSv/jTJabiv6zYSJjaiWN
         l96w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761819915; x=1762424715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lTgIsc3O+wDypaKqBlwZIo86kBPQGfr40arZuVCJ75M=;
        b=EZ7oczd0M/k3r8OZZW5Y7UBAG9Wr4UOsV72fMxX5Mory0JjYmS07XdQBBRnSzKkqNl
         SJjZ8PLc7VQmiiwTyRF8slwawQ+0Rf/6cvhDySDpPbkBDdNmA2I6YhWh1SJQJuLBoVAz
         aP4a7NMGbUg5AceVkzfXr++9mkBWJmS57mm+TRt5/LEMaKPSs1VH6xaTmmmC/rlvGG63
         CUA1RSm8Zr6J//UVr2vDPfR9/ia0NGI8owtPBfaacNfiaPgRYxuLPxn/zZrilw858W6V
         GmkhrSYkTCxrj/KQ4SEe2eJWE7gAT5+y2SufE1bivfbAYFNmqW8vdsO9q0Wsb1x6UKxZ
         6tKw==
X-Forwarded-Encrypted: i=1; AJvYcCXjh9O+TFAKYy8qrXQCVzWl3nx65cbtz8AJ2jcg2aDw9SjY9LsMiMkU1l8Mm+OUCb4XxHZfgc5Y2HOgLQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/dLJTPvrASsJbMpnpdT23usAsLhx3HkDEuHZ743XZ/37fkmwo
	hweYLUevESmA1ebTHiuRq1R2TXQ/cU6C6Vftp2ef76ea+JiSxKsAPwt1DuMXNRH1u5c=
X-Gm-Gg: ASbGncvvRd96XGYXEfTOqHEYfOjdlEzlWvS+mlD7WuEPftT6eM9PC5HcZ8MxgipfK2k
	7zenAhV+CqgsEHyGz6DKZZDYCfrRwvRBo1ncL/X70KBFf7RrZnh04OqQJKA5Kg+X2eGK7izvQpl
	IB63KAo3rjjA1+7zF5p6F4qzWjVkG5vNAOMsGJgyjFmY6Aw6MOvDh6o/FlohmYplzoIdAuiq5m8
	zpVUgvO3mD8FIjQR4IfT13F3JLzcO/CUB0y/nl99w7wLajshar5SDBmWiC9fDcGBdVSXAF9cvBx
	9KDa1Yw33aCq7eZMT0btsI2+evDDwhCJne84JTqa1ou2O8THgty5lTyDgbq347qhNTuZMMdQzkS
	RKVK52yZaqsARNC2d3C0ekDyhPiPZ9wWFqjDSt0+19ntzhYHxSe99UU9L/w4IqGPz0jTSU/KoYD
	YpLCcqYhHg/a1s/dTjDGBqxz9rAOjPWJXt1BBrohPzgeymwk0Jee213wv7OlCyanOLJAX+QJhiW
	aSu
X-Google-Smtp-Source: AGHT+IEXsUOIqP3MBMqvuO3EOkZU6BKA34oP58piwLuVoouucxjytl3skX6Ka8nntE+ckkHO79CK6A==
X-Received: by 2002:a17:906:f586:b0:b6d:5439:e668 with SMTP id a640c23a62f3a-b703d55e454mr372826866b.8.1761819915166;
        Thu, 30 Oct 2025 03:25:15 -0700 (PDT)
Received: from mordecai (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d853c549fsm1728375066b.37.2025.10.30.03.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 03:25:14 -0700 (PDT)
Date: Thu, 30 Oct 2025 11:25:03 +0100
From: Petr Tesarik <ptesarik@suse.com>
To: Valentin Schneider <vschneid@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, rcu@vger.kernel.org,
 x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Josh
 Poimboeuf <jpoimboe@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy
 Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Frederic Weisbecker
 <frederic@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, Jason Baron
 <jbaron@akamai.com>, Steven Rostedt <rostedt@goodmis.org>, Ard Biesheuvel
 <ardb@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, "David S.
 Miller" <davem@davemloft.net>, Neeraj Upadhyay
 <neeraj.upadhyay@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, Josh
 Triplett <josh@joshtriplett.org>, Boqun Feng <boqun.feng@gmail.com>,
 Uladzislau Rezki <urezki@gmail.com>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Mel Gorman <mgorman@suse.de>, Andrew
 Morton <akpm@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Han Shen <shenhan@google.com>, Rik van Riel <riel@surriel.com>, Jann Horn
 <jannh@google.com>, Dan Carpenter <dan.carpenter@linaro.org>, Oleg Nesterov
 <oleg@redhat.com>, Juri Lelli <juri.lelli@redhat.com>, Clark Williams
 <williams@redhat.com>, Yair Podemsky <ypodemsk@redhat.com>, Marcelo Tosatti
 <mtosatti@redhat.com>, Daniel Wagner <dwagner@suse.de>
Subject: Re: [PATCH v6 06/29] static_call: Add read-only-after-init static
 calls
Message-ID: <20251030112251.5afcf9ed@mordecai>
In-Reply-To: <20251010153839.151763-7-vschneid@redhat.com>
References: <20251010153839.151763-1-vschneid@redhat.com>
	<20251010153839.151763-7-vschneid@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_032517_612556_0605AED4 
X-CRM114-Status: GOOD (  26.48  )
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

On Fri, 10 Oct 2025 17:38:16 +0200
Valentin Schneider <vschneid@redhat.com> wrote:

> From: Josh Poimboeuf <jpoimboe@kernel.org>
> 
> Deferring a code patching IPI is unsafe if the patched code is in a
> noinstr region.  In that case the text poke code must trigger an
> immediate IPI to all CPUs, which can rudely interrupt an isolated NO_HZ
> CPU running in userspace.
> 
> If a noinstr static call only needs to be patched during boot, its key
> can be made ro-after-init to ensure it will never be patched at runtime.
> 
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
> ---
>  include/linux/static_call.h | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/include/linux/static_call.h b/include/linux/static_call.h
> index 78a77a4ae0ea8..ea6ca57e2a829 100644
> --- a/include/linux/static_call.h
> +++ b/include/linux/static_call.h
> @@ -192,6 +192,14 @@ extern long __static_call_return0(void);
>  	};								\
>  	ARCH_DEFINE_STATIC_CALL_TRAMP(name, _func)
>  
> +#define DEFINE_STATIC_CALL_RO(name, _func)				\
> +	DECLARE_STATIC_CALL(name, _func);				\
> +	struct static_call_key __ro_after_init STATIC_CALL_KEY(name) = {\
> +		.func = _func,						\
> +		.type = 1,						\
> +	};								\
> +	ARCH_DEFINE_STATIC_CALL_TRAMP(name, _func)
> +
>  #define DEFINE_STATIC_CALL_NULL(name, _func)				\
>  	DECLARE_STATIC_CALL(name, _func);				\
>  	struct static_call_key STATIC_CALL_KEY(name) = {		\
> @@ -200,6 +208,14 @@ extern long __static_call_return0(void);
>  	};								\
>  	ARCH_DEFINE_STATIC_CALL_NULL_TRAMP(name)
>  
> +#define DEFINE_STATIC_CALL_NULL_RO(name, _func)				\
> +	DECLARE_STATIC_CALL(name, _func);				\
> +	struct static_call_key __ro_after_init STATIC_CALL_KEY(name) = {\
> +		.func = NULL,						\
> +		.type = 1,						\
> +	};								\
> +	ARCH_DEFINE_STATIC_CALL_NULL_TRAMP(name)
> +

I think it would be a good idea to add a comment describing when these
macros are supposed to be used, similar to the explanation you wrote for
the _NOINSTR variants. Just to provide a clue for people adding a new
static key in the future, because the commit message may become a bit
hard to find if there are a few cleanup patches on top.

Just my two cents,
Petr T

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
