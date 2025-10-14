Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0608DCCD187
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Oct 2025 11:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=892VGjfxPgZUls+l7yxXUUPlg/nQJac1RTR3DcH1XE0=; b=qoLA5lb1g6BVyx
	ZrwKGchLKF+fGz0Fa/Wti0mIampW+V5KpBjgM05mszRfOmFx4JDBCWTzH8/IXFeoznTp9ndf4rffD
	e3pAXvLCbeIDo3T0hgXvGs04lWV59Vo8dq5Re7LI4BbB6w7TjsZxle/2eI92kDG8LK+q9/5M4RHxW
	0wzqkipUppcKQrWa8d7jXHqsxeQjfKGnCAFSbICoTxQqDibUj4E1Ot1WzSFf4E0/D624sk16vQ02Z
	QyL+KgzS3xn9lc+zKl76Qvx0FNFXBDrEAH4x00kO0BWGFnYV4qssLmqMWXQUQK4cEo1BtGZkXDnVL
	cjMctWD5oaeEMJNT+8tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8co2-0000000G0GO-38eR;
	Tue, 14 Oct 2025 11:03:02 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8cnz-0000000G0Dn-1Uyi
	for linux-riscv@lists.infradead.org;
	Tue, 14 Oct 2025 11:03:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760439777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s2r/L8/q4C9e2I164NDxUGdYhK/0nvlG6dMGzaNBqVg=;
	b=e83mDdrqUjDTuwZOBUhrBr3TEQ/TkIV8qTEniGUfnpBREMz0qkkI/uMbWOP4Dgm+hIdaNX
	3moPEZQkkSVDIOsXJulDC95g9GeF0uOMCE/NtlX2T1xrFCJhz6UsRK8B9MFTOQy6Nw9qvD
	X4lXGxiqvUIynZmtSwM0Hy9XFEWA4EI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-22-7G9Y65g5M_qQ3ue6nw0fsA-1; Tue, 14 Oct 2025 07:02:56 -0400
X-MC-Unique: 7G9Y65g5M_qQ3ue6nw0fsA-1
X-Mimecast-MFC-AGG-ID: 7G9Y65g5M_qQ3ue6nw0fsA_1760439775
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-46e2c11b94cso38997155e9.3
        for <linux-riscv@lists.infradead.org>; Tue, 14 Oct 2025 04:02:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760439774; x=1761044574;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s2r/L8/q4C9e2I164NDxUGdYhK/0nvlG6dMGzaNBqVg=;
        b=tRBBtSKD1XsYrt5+vL9YdQwEJVtGCkpQ9q59KoTx7fJuKrL7fvZj9qCIk1VHYRIwwo
         dZUBfQ8WVFi7pX69cldikGEyL8EaTuqRLk5jW1OkqJoS2Nat4sudEJJ9RRv/nVktdahF
         GHcgdfzses3TP5APMiPm0wUqe/27UuPoteShmIw88F2AQ3y45SH5nvQBU0sdcD5LXKaf
         bxae/cedoCCZ2WoyAPRdgWdS+4/a1VeGYlCWCSn6ck/OLq3/OTJr5Ns32PgsSJPnxPpH
         K5JVFT4ukeZiVJL/WPpfOiuEudB0TP1vvt33ajCLg6zxZti366f/K4zvPacxiRNM5rTA
         wckQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6OphyljCAOH5cVw1TsWsp0pBfmzZoTBkKbh0shwLN0lu54tFYqId+RHpYJtjX9LrO/wxMhmx3GDWeOA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwUnT6jtJ2RSfjj9GvHqvR2LC1O11jz1UB0FNvJnosWNJv+Ki3C
	GWijnpNRVB1HyqCqPnun7elLpvZDwMnBci1uC76MaCRx+G/0BB9Ren4yrmeeP//l0/WyI39uc5y
	NnqiT1HqRO4zyUmvej9gNXLHmosSJhkAZCNAhBzW3GkcZs3Q3JY0126gQgNHf/UIVJK+DTQ==
X-Gm-Gg: ASbGncv8pATJb0dSBfeR78VP2Km6yzY7DxKYjFXpNWg3o6pBNGGfY97RL7YYaF6e8tL
	52rK23Ecq3GvXaBbyEGRBdIRxGueeu3WVbFkZRtP4uHranDJ67lXMa56esr7af2NS40jisM9idJ
	JKmxDWG5PBMmHbo0VCFnyYMwyhbRVcQi3yrSdYia1ofL7KF4siL+YGpx4xxilVoJBfitxUkeyzw
	LsvjEwXBzT3Nn2nQRKtSql8nFFQ/FiUrfPU0xED803WrcvwSTzccUWB8pcSw8/QPwC18QdSMo6j
	FQK9ltYzzYJpXO53cRZWrtiBErKun8mTYsfUShs4Bv1h4OuS4C++MbCSqdojvD5xTiGGHK5LN3U
	uDAY/tk/pcgcDfo36vQQyJyh1sg==
X-Received: by 2002:a05:600c:4752:b0:46e:3dad:31ea with SMTP id 5b1f17b1804b1-46fa9af8fb0mr181929495e9.17.1760439774571;
        Tue, 14 Oct 2025 04:02:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCodl08uTX0ubswP5nTiGxebtIpD1Qw4JnrqS3e+W7M5qhx4w6eQs0AuIjitoXX5t0l6/vwQ==
X-Received: by 2002:a05:600c:4752:b0:46e:3dad:31ea with SMTP id 5b1f17b1804b1-46fa9af8fb0mr181928825e9.17.1760439774097;
        Tue, 14 Oct 2025 04:02:54 -0700 (PDT)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-135-146.abo.bbox.fr. [213.44.135.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426f2f72e18sm1737515f8f.0.2025.10.14.04.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 04:02:52 -0700 (PDT)
From: Valentin Schneider <vschneid@redhat.com>
To: Sean Christopherson <seanjc@google.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, rcu@vger.kernel.org,
 x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Josh
 Poimboeuf <jpoimboe@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave
 Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Frederic Weisbecker
 <frederic@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, Jason
 Baron <jbaron@akamai.com>, Steven Rostedt <rostedt@goodmis.org>, Ard
 Biesheuvel <ardb@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 "David S. Miller" <davem@davemloft.net>, Neeraj Upadhyay
 <neeraj.upadhyay@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, Josh
 Triplett <josh@joshtriplett.org>, Boqun Feng <boqun.feng@gmail.com>,
 Uladzislau Rezki <urezki@gmail.com>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Mel Gorman <mgorman@suse.de>, Andrew
 Morton <akpm@linux-foundation.org>, Masahiro Yamada
 <masahiroy@kernel.org>, Han Shen <shenhan@google.com>, Rik van Riel
 <riel@surriel.com>, Jann Horn <jannh@google.com>, Dan Carpenter
 <dan.carpenter@linaro.org>, Oleg Nesterov <oleg@redhat.com>, Juri Lelli
 <juri.lelli@redhat.com>, Clark Williams <williams@redhat.com>, Yair
 Podemsky <ypodemsk@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Daniel Wagner <dwagner@suse.de>, Petr Tesarik <ptesarik@suse.com>
Subject: Re: [PATCH v6 19/29] KVM: VMX: Mark vmx_l1d_should flush and
 vmx_l1d_flush_cond keys as allowed in .noinstr
In-Reply-To: <aO2S3oZwOW_UgAci@google.com>
References: <20251010153839.151763-1-vschneid@redhat.com>
 <20251010153839.151763-20-vschneid@redhat.com>
 <aO2S3oZwOW_UgAci@google.com>
Date: Tue, 14 Oct 2025 13:02:50 +0200
Message-ID: <xhsmhwm4xpwyt.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9Ew_D8MUDH-uM7y9EK5peDPWm1AkFB876qja4rQkEHM_1760439775
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_040259_457555_B29414F6 
X-CRM114-Status: GOOD (  14.13  )
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

On 13/10/25 17:01, Sean Christopherson wrote:
> On Fri, Oct 10, 2025, Valentin Schneider wrote:
>> Later commits will cause objtool to warn about static keys being used in
>> .noinstr sections in order to safely defer instruction patching IPIs
>> targeted at NOHZ_FULL CPUs.
>>
>> These keys are used in .noinstr code, and can be modified at runtime
>> (/proc/kernel/vmx* write). However it is not expected that they will be
>> flipped during latency-sensitive operations, and thus shouldn't be a source
>> of interference wrt the text patching IPI.
>>
>> Mark it to let objtool know not to warn about it.
>
> Can you elaborate in the changelog on what will happen if the key is toggle?
> IIUC, smp_text_poke_batch_finish() will force IPIs if noinstr code is being
> patched.

Right!

> Even just a small footnote like this:
>
>   Note, smp_text_poke_batch_finish() never defers IPIs if noinstr code is
>   being patched, i.e. this is purely about silencing objtool warnings.
>
> to make it clear that there's no bug/race being introduced.

Good point. How about:

"""
Later commits will cause objtool to warn about static keys being used in
.noinstr sections in order to safely defer instruction patching IPIs
targeted at NOHZ_FULL CPUs.

The VMX keys are used in .noinstr code, and can be modified at runtime
(/proc/kernel/vmx* write). However it is not expected that they will be
flipped during latency-sensitive operations, and thus shouldn't be a source
of interference for NOHZ_FULL CPUs wrt the text patching IPI.

Note, smp_text_poke_batch_finish() never defers IPIs if noinstr code is
being patched, i.e. this is purely to tell objtool we're okay with updates
to that key causing IPIs and to silence the associated objtool warning.
"""


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
