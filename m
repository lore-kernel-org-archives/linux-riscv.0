Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0EACCCD18E
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Oct 2025 19:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Qh2O3HAA5/nvvPcGlqHV/3d4owZtkeV92WTQ7E6XRFQ=; b=kmLWvz2esK6AL4kvDa+xN8SEL5
	dmMINs17zdjAvVpRnPeLhyc6CU/+SyXnK9mBtNsXugrM1Ri5yC8iuKumco+q5vQ0tGOqygWhEB9uX
	q2/qd22AvFhDIAa/VzQ2/AYYjYWoq4wGEhp2Vq34u0+6vTJYG7yog2VaB3+KuXdSkWyN0fE2O6Lw4
	COqRR+Nlh30Wg3l+a9DCo5w70N7jlAqpcURisaRL6dVSTsSfdHv5rjXuuGbXAPFzw5BCdM58qGUQ7
	NTYU797/rl8zuyMMjDJY9kFZ9pGJtbt246kUx96rtvMFLuGSZXK3vtp6DaIsU1dAf4xxuCxkwyKwL
	JKaH8ciQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8kM2-0000000HED8-1Ge0;
	Tue, 14 Oct 2025 19:06:38 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8kLz-0000000HEC8-2UnU
	for linux-riscv@lists.infradead.org;
	Tue, 14 Oct 2025 19:06:36 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-b60968d52a1so16299340a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 14 Oct 2025 12:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760468794; x=1761073594; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NJxlV+oNDwXk+z+h9rw/7gmtAEVoUIc/lNQpO7FKflY=;
        b=U5XuV1LhwRkTe9ppD6r0OFDMom+rixPke0afIqJ4Zqk/tQ5UR+4cHhr78XEewcyWuf
         6j9cJPpQVy1JpbHSvbxPj+SKalMpifrc9rrMEv+Hp2asNQtjMQFKj6Ve9TpYIUFfM5JG
         lLHkSsHL1cTc1u6XcZavTaYsk4YKm+i6whYHOjq7X4I4Lni0EBO5GFsdJeWyOHl4BJdM
         GP7m86IM96VIyiK7S7TJEYISh+WRwDEonDTXsDtMZsJeJefmzu1463wMtMtB94+ezqIc
         Fy4LhAwaHMxvTjzfLE5hWwulU+ytRqKhA42zGEj1Rhg8gYHvqVoNvss/SgqbwcN2UHcE
         HFoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760468794; x=1761073594;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NJxlV+oNDwXk+z+h9rw/7gmtAEVoUIc/lNQpO7FKflY=;
        b=w4yXNVK/v01fhA/NmLnTlePZYWuHNXa3agRweVm1Oq9rC2hNUiHiZ8Oh+noPuB2sNH
         eqebmW3iJ3wpkTG0E9PdKv7PgwKdFi/LEHQWwBZB5GCdGTvUpRdSsO6/mmFpf771niIg
         up2/pO3BMDIJWefffD8fihQZlRP4BSMgfDNew/wrs/g504IvVrgvI90+k9JdSXD+u87h
         4X1eirZXRFuuDK1MhjZhuR5zABZ4j64tureA6kTZgumySnKCZf3U2QWiTgxMwY308Fo9
         x//MB/mA8PVarvbL4xn4TP3CFXoS+6CextKrZpUayUNaDNppYIqO48e6MUizHZyCoIKF
         RZ/A==
X-Forwarded-Encrypted: i=1; AJvYcCUGIXJYubwmbJxRn0MX7UiOKdFjm+v0HF0bZZTaWfaWG2HneaiQSr328Kzqb2gwfeAhZPwlv3L1p40Rzw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwY3mUVzJL7Xb2rtYEjGziAC0Q8iz4gxjmHqAFiRaawWHc+OLlS
	IcuarXZ3AtMbUkbdbBZiO93E9aOhpmE00zxMjz7A28dMrTS1xOf6X7IVN8nNfGIMuEgZCYCSp5t
	7Bq78qQ==
X-Google-Smtp-Source: AGHT+IG9Zd3t+86XRNhfr6MOl3z2x5n36Sr6uReq0nGSm2P7jNviBzkfzWGC0x9bWFlsxNGdGfsNX6JxluA=
X-Received: from pjuj14.prod.google.com ([2002:a17:90a:d00e:b0:32b:95bb:dbc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3ec5:b0:327:e018:204a
 with SMTP id 98e67ed59e1d1-33b50f85081mr35201870a91.0.1760468794156; Tue, 14
 Oct 2025 12:06:34 -0700 (PDT)
Date: Tue, 14 Oct 2025 12:06:32 -0700
In-Reply-To: <xhsmhwm4xpwyt.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Mime-Version: 1.0
References: <20251010153839.151763-1-vschneid@redhat.com> <20251010153839.151763-20-vschneid@redhat.com>
 <aO2S3oZwOW_UgAci@google.com> <xhsmhwm4xpwyt.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Message-ID: <aO6fOM-XydknM6NJ@google.com>
Subject: Re: [PATCH v6 19/29] KVM: VMX: Mark vmx_l1d_should flush and
 vmx_l1d_flush_cond keys as allowed in .noinstr
From: Sean Christopherson <seanjc@google.com>
To: Valentin Schneider <vschneid@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, rcu@vger.kernel.org, 
	x86@kernel.org, linux-arm-kernel@lists.infradead.org, 
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-arch@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Arnd Bergmann <arnd@arndb.de>, 
	Frederic Weisbecker <frederic@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Jason Baron <jbaron@akamai.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Josh Triplett <josh@joshtriplett.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Uladzislau Rezki <urezki@gmail.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Mel Gorman <mgorman@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Han Shen <shenhan@google.com>, Rik van Riel <riel@surriel.com>, Jann Horn <jannh@google.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Oleg Nesterov <oleg@redhat.com>, 
	Juri Lelli <juri.lelli@redhat.com>, Clark Williams <williams@redhat.com>, 
	Yair Podemsky <ypodemsk@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>, 
	Daniel Wagner <dwagner@suse.de>, Petr Tesarik <ptesarik@suse.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_120635_629401_854E669A 
X-CRM114-Status: GOOD (  19.05  )
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

On Tue, Oct 14, 2025, Valentin Schneider wrote:
> On 13/10/25 17:01, Sean Christopherson wrote:
> > On Fri, Oct 10, 2025, Valentin Schneider wrote:
> >> Later commits will cause objtool to warn about static keys being used in
> >> .noinstr sections in order to safely defer instruction patching IPIs
> >> targeted at NOHZ_FULL CPUs.
> >>
> >> These keys are used in .noinstr code, and can be modified at runtime
> >> (/proc/kernel/vmx* write). However it is not expected that they will be
> >> flipped during latency-sensitive operations, and thus shouldn't be a source
> >> of interference wrt the text patching IPI.
> >>
> >> Mark it to let objtool know not to warn about it.
> >
> > Can you elaborate in the changelog on what will happen if the key is toggle?
> > IIUC, smp_text_poke_batch_finish() will force IPIs if noinstr code is being
> > patched.
> 
> Right!
> 
> > Even just a small footnote like this:
> >
> >   Note, smp_text_poke_batch_finish() never defers IPIs if noinstr code is
> >   being patched, i.e. this is purely about silencing objtool warnings.
> >
> > to make it clear that there's no bug/race being introduced.
> 
> Good point. How about:
> 
> """
> Later commits will cause objtool to warn about static keys being used in
> .noinstr sections in order to safely defer instruction patching IPIs
> targeted at NOHZ_FULL CPUs.
> 
> The VMX keys are used in .noinstr code, and can be modified at runtime
> (/proc/kernel/vmx* write). However it is not expected that they will be
> flipped during latency-sensitive operations, and thus shouldn't be a source
> of interference for NOHZ_FULL CPUs wrt the text patching IPI.
> 
> Note, smp_text_poke_batch_finish() never defers IPIs if noinstr code is
> being patched, i.e. this is purely to tell objtool we're okay with updates
> to that key causing IPIs and to silence the associated objtool warning.
> """

LGTM.  With the updated changelog,

Acked-by: Sean Christopherson <seanjc@google.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
