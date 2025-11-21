Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E28CFC299
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Nov 2025 17:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XFNnHpePa5QDeg64byHNEPdag2cT4XI/p/fRX5kxcXM=; b=fjw/8i0XUGPIt8
	S3yKRyGyimH3nLFz7ln01t0hPTNglii9Zyr6ey8tM7zvb5+PAEF/sS3a4BL+aVxb8srPyXNzNI3uA
	uf8OmG35JPozax9o+jvfU90Mr4/hWMvsW0HGQrcRkhkesOIB2T5qFcti2Robs4Gvs2Mb6qU+US+RL
	cqVDMvG5Vi45viyroIKGYpmlNOjRGSe5kxdyhTOh8k6V8G7N7cj0IoqIt9MdzkrGrid1mKEgCqs/e
	1gYStvnoyV7tPpU20hmtIIhvsS6zhNFy+iAgpN4sTUZqbTrYosv2MvJC+8oIOr1oeRsgkSZDelwMt
	Us7g/TS24Vs0sqXT0KLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMV4Q-00000008nt3-2tiC;
	Fri, 21 Nov 2025 17:37:18 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMV4O-00000008nsR-0Zb2
	for linux-riscv@lists.infradead.org;
	Fri, 21 Nov 2025 17:37:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763746634;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V3OE0zpMaGFe7FLO1SjE8KbYNBSyHZmUa+LcldBnwuQ=;
	b=OJRkF1yNZxr96JULB17P9/EUvhx1Ox0XH45RgxSDoXu12qcbb2Fsx2+fxxBe6klYybU212
	b+CpIW1WpaAYjcedmq2yVuzD9sRdjiy+lOZskX/WCBt0hAdREv4ja0gbYzdaO7ZAFZMslh
	wmXNjDsfgRVSWVwv2Koi4mQtjF9zlTE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-101-o58idbbJPVOT0qXuBDGF7w-1; Fri, 21 Nov 2025 12:37:13 -0500
X-MC-Unique: o58idbbJPVOT0qXuBDGF7w-1
X-Mimecast-MFC-AGG-ID: o58idbbJPVOT0qXuBDGF7w_1763746632
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-42b3c965ce5so1804637f8f.2
        for <linux-riscv@lists.infradead.org>; Fri, 21 Nov 2025 09:37:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763746632; x=1764351432;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V3OE0zpMaGFe7FLO1SjE8KbYNBSyHZmUa+LcldBnwuQ=;
        b=Ls+A+Nm2ZSSGLPLjZb1GMm9WnLgOtgQi0iMsXMgYR7LcT29BQoRDOnrfzrb+oV171S
         fe9vxiabamHWBv6lqXpMx10fevlwZ+hGoExH+jGoQsP9wzDJ3zgOzm19OLdiS4iyERSa
         expxw1+hloFmNFGuSuCmN+91Flato4H//EQ/vl3cjWLe/P0YEUAmeVgu+cPYSWhFmvkF
         3nTrGHbbx5U97jGKLpMNja9hyQUSwoG6mX5b7eEBMOkEnbpI5Ul5qmODJd8aPvwE/Uwh
         Na6MYsOmL0NP7VeOorI/TC3zTDHMcXst7tehlzXxPmXWC7JTmu5t/6hnPYQjEIYA5s6J
         k7YA==
X-Forwarded-Encrypted: i=1; AJvYcCV9iR2Gw9HRZ0TrnH5s1cliV7bs+wyFuAr+sDXscnSNEhX0unpLw75huzraQ4XEPBZvzlO9tKEFZKCyXw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzUiWmbuOOp7hOnWnO/CbKq8/qEoZqRfF1RZj/Sqk3NSlOYnxg7
	D66HXW39KXOL+RE8/UXGj30F/Hojfe/RBHp5TduVEadRmE7K50JZm7+KGY1aPpKx/2KWducKblg
	nIGqtLzp5bH0EijzzAyACEJnfMp7jhZj84f55312CRk2uY1nIqnqphKH6RrkLC7dmioSuRA==
X-Gm-Gg: ASbGnctRi/XOKRlkhL1ndmzaK8VyCVWsLMOHlPHCTik4Ge1Uy+aWFL8+IKQJgr9sbpP
	fGuzLnZgBRxBG26j/TvK4TwUHTNR9NBpilPpnh9wJRybSAbauj904RbpeyA6CHpMJyoqjFv2NLi
	c63IuPZtTmHaHQdhEz1VUgWWWuy1JC0Hz3TMwddVFeDc5GMv6ZcRadXW4lOQNX2+IJGV9VcjFn0
	H/jTEi3JW7JKeUypmBXyBnPYUOUzyVuATtGo65XuEOjTtfo/2F35GX9s4q1fe9WR5ye+MbOQKr5
	Ag+j6cXtIjOQLLkxypgjR+YqR0HbNbbcrtpITvQgo+xFt61PgOx6hC/wpcWjGpOX2nQS9R35HBv
	RgloouSXmZuan0R/E3lcpjKjJFpVClQBYcuW2VMmE8xMWce2sCy6EvnK3YTJRA+OZ4gzYz3E=
X-Received: by 2002:a05:6000:2282:b0:42b:3ab7:b8b9 with SMTP id ffacd0b85a97d-42cc1cbd0dcmr3334263f8f.20.1763746631957;
        Fri, 21 Nov 2025 09:37:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFwrptJrvQrMlATO+zOU3GD53XUKYoEIwVBRtwZMVM9uxcxDwDk+rU+CpbkpyNs1Ksl4qe7Bg==
X-Received: by 2002:a05:6000:2282:b0:42b:3ab7:b8b9 with SMTP id ffacd0b85a97d-42cc1cbd0dcmr3334227f8f.20.1763746631366;
        Fri, 21 Nov 2025 09:37:11 -0800 (PST)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-135-146.abo.bbox.fr. [213.44.135.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cc231dc6esm4094867f8f.7.2025.11.21.09.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 09:37:10 -0800 (PST)
From: Valentin Schneider <vschneid@redhat.com>
To: Dave Hansen <dave.hansen@intel.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, rcu@vger.kernel.org, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo
 <acme@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, Paolo Bonzini
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
 Daniel Wagner <dwagner@suse.de>, Petr Tesarik <ptesarik@suse.com>,
 Shrikanth Hegde <sshegde@linux.ibm.com>
Subject: Re: [RFC PATCH v7 30/31] x86/mm, mm/vmalloc: Defer kernel TLB flush
 IPIs under CONFIG_COALESCE_TLBI=y
In-Reply-To: <bad9eaaa-561a-498a-90d1-fe3a3ab8ba37@intel.com>
References: <20251114150133.1056710-1-vschneid@redhat.com>
 <20251114151428.1064524-10-vschneid@redhat.com>
 <bad9eaaa-561a-498a-90d1-fe3a3ab8ba37@intel.com>
Date: Fri, 21 Nov 2025 18:37:09 +0100
Message-ID: <xhsmh5xb3thh6.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: C6ezheUAitqpeIWDtAqFjhgXTIVT6aPPKJ-69Uy6rGc_1763746632
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_093716_272036_E12B1842 
X-CRM114-Status: GOOD (  15.93  )
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

On 19/11/25 10:31, Dave Hansen wrote:
> On 11/14/25 07:14, Valentin Schneider wrote:
>> +static bool flush_tlb_kernel_cond(int cpu, void *info)
>> +{
>> +	return housekeeping_cpu(cpu, HK_TYPE_KERNEL_NOISE) ||
>> +	       per_cpu(kernel_cr3_loaded, cpu);
>> +}
>
> Is it OK that 'kernel_cr3_loaded' can be be stale? Since it's not part
> of the instruction that actually sets CR3, there's a window between when
> 'kernel_cr3_loaded' is set (or cleared) and CR3 is actually written.
>
> Is that OK?
>
> It seems like it could lead to both unnecessary IPIs being sent and for
> IPIs to be missed.
>

So the pattern is

  SWITCH_TO_KERNEL_CR3
  FLUSH
  KERNEL_CR3_LOADED := 1

  KERNEL_CR3_LOADED := 0
  SWITCH_TO_USER_CR3


The 0 -> 1 transition has a window between the unconditional flush and the
write to 1 where a remote flush IPI may be omitted. Given that the write is
immediately following the unconditional flush, that would really be just
two flushes racing with each other, but I could punt the kernel_cr3_loaded
write above the unconditional flush.

The 1 -> 0 transition is less problematic, worst case a remote flush races
with the CPU returning to userspace and it'll get interrupted back to
kernelspace.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
