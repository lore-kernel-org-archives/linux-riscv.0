Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D81DBCCD187
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Oct 2025 11:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pVvtT2oLGuxW1Bgc++7vVGJS4MzLMsyOGs/Pd5KXYgY=; b=wBA3nQqsLBCZxm
	vSpOsPq835p8sg6OY7onMjXYSyEjphqqX8VfoDDMYnlWSsxNr8vF7y6qzEa6iv7+/akQUl7gMUZQz
	qGCXrXuNCLi7dFpgrEN584L2+fMFnZiJ5y38U8n6l84D8YKI9PL8b6xjm5T3Yercm6f6xXrP/56K6
	LGPFaFznJhS299fJtL+DtvgiQRFy5rDkl1vWcSOcC+AedbOZiW4MsifwrfpDEPPGbIIGVM4js80Bm
	tNVU83Se/J5Z6JWB05dg/ReLg+jR0oYrHdQc5h/w8loF5GDM4HR7K74Z6SmT37SBRw47HyaYW5mcc
	5fraosyaOVMOKnsJr/Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8d4i-0000000G4OL-2cQ7;
	Tue, 14 Oct 2025 11:20:16 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8d4f-0000000G4N2-0Bb4
	for linux-riscv@lists.infradead.org;
	Tue, 14 Oct 2025 11:20:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760440811;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Imuve1iPcSxB4uVU/yFQsIzQ6zKzpq/61jJo3KbkM2Y=;
	b=JLtaCswHk/AW7ow1AFK8jpTTCTDmRdtWf4uRPQp+yJ+Cxgn9K2tK3EJ3EGx3Yxyuv5VOvW
	8MeIBKkAvdUbrmjYWsS33vur/yPGKfntdccd+N0/n4Jaz5s7kZS2eR6PLLvt3t0j3RlMxC
	JICyHnc66knRbsr4oO8lRpKs7rDX7So=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-135-Fo7bA9XbNW6yyZuLYma5vw-1; Tue, 14 Oct 2025 07:20:09 -0400
X-MC-Unique: Fo7bA9XbNW6yyZuLYma5vw-1
X-Mimecast-MFC-AGG-ID: Fo7bA9XbNW6yyZuLYma5vw_1760440808
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-46e2c11b94cso39118625e9.3
        for <linux-riscv@lists.infradead.org>; Tue, 14 Oct 2025 04:20:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760440808; x=1761045608;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Imuve1iPcSxB4uVU/yFQsIzQ6zKzpq/61jJo3KbkM2Y=;
        b=ckLe2DpoUu1OS3cyFrmWvFiC/0uxyevsmx2V8TUZ/I6S9gh2BEI6USpZeMHzEXLXNR
         0kO32BeAorTlCNDns0I97SixTvJHsQHVLDp43Rg/+VmXRozOlXDenbiWJaoDTfM5yDnB
         4I0CnifSm+bAK0ThmvLd6L7gyZcd9XNNJ15rsnOVj6ba669rJ3xaWiOXzqu60UJ90HG1
         hCsAraxKpIB0DW5VAqrOYYTkEWIHDa9dpp3cGDC+3Jw3qaJLuB1icrSZMqaSb4svkieu
         k9fDnCJaO9VZ0O3wf/+B0JT652YzT2g+B/+zke9QEuN+bKfdcfcc5xZdKZV+JPAYDNft
         vZLw==
X-Forwarded-Encrypted: i=1; AJvYcCXVn422v5w0wLZDGNXBSOkf8MYhIAT0T99fN25sVTD3wH3O2tc8ARrsh23OITEaHz6sUEhQ2WVwDF9Vmg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzgth+onv4f7vUrMpPTNP0AEtBUeJ/vkODEAQEK35ttRY1Zk6/g
	gQYj+fYLDrxzMY3YE4wWy9zLGIq5HGhA5zh3O7dCvMiTqA14mBj66Je/ulo0mwHGe8wC3Yj29hL
	eNsEdgt7lAxyrOKsE34As28RO5HTooynE52fDCJjRU+1h/cp4MsMHwBpzayFZr241K5yuXQ==
X-Gm-Gg: ASbGncsYLgxZVuNo6WBb2EyIij18FPTjPkug+nAdVDa+5lFi2rYk2Ij+O8/TXYI5dKB
	cbGm05WByUc7179LSxdFx3AaXaaAbioIA746JzNiNcSmjKJYgcIYL344GImmyWBKDfAOJe8QPAK
	rMjUE/7CZCpRIiwBPcEAn2cSB1/xRMlL81oj6NTW3IYBZfS+exRQrNReGKSR0CiM8jW5LBYQ1sb
	LyLp/eIdD4Xi8BzVx2AYVwTbBY1vaI2DlLlAnrzkbfrSM4hoJWlntjL6nzzm9plzGd6XTt1jQG+
	TrC4a29t+yxwy/OLvzSzj50ZeF2aEHbjI4AAj916WbL3TaLka/cy2RmhYWtXg73oXVTvRvrG7LD
	ha38B6Ui+YQUjQKdIYQpqwFJipw==
X-Received: by 2002:a05:600c:37c9:b0:46e:477a:f3dd with SMTP id 5b1f17b1804b1-46fa9b1b18emr175576585e9.36.1760440808233;
        Tue, 14 Oct 2025 04:20:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPNHhJVacE21hOu+c1s40cKBm99NOdKTbqBsl6lzaW/V++U98Y1cwp6CoRkBLGlZny7BSyXQ==
X-Received: by 2002:a05:600c:37c9:b0:46e:477a:f3dd with SMTP id 5b1f17b1804b1-46fa9b1b18emr175576075e9.36.1760440807708;
        Tue, 14 Oct 2025 04:20:07 -0700 (PDT)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-135-146.abo.bbox.fr. [213.44.135.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb492e6ddsm265506695e9.0.2025.10.14.04.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 04:20:07 -0700 (PDT)
From: Valentin Schneider <vschneid@redhat.com>
To: Sean Christopherson <seanjc@google.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, rcu@vger.kernel.org,
 x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H.
 Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter
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
 Daniel Wagner <dwagner@suse.de>, Petr Tesarik <ptesarik@suse.com>
Subject: Re: [PATCH v6 16/29] KVM: VMX: Mark __kvm_is_using_evmcs static key
 as __ro_after_init
In-Reply-To: <aO2TKOY5JV9OoRUg@google.com>
References: <20251010153839.151763-1-vschneid@redhat.com>
 <20251010153839.151763-17-vschneid@redhat.com>
 <aO2TKOY5JV9OoRUg@google.com>
Date: Tue, 14 Oct 2025 13:20:05 +0200
Message-ID: <xhsmhtt01pw62.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zf2FtXDV0W4IzEZekyBiIyW88-SqUN1IfvSsfYYVrQ0_1760440808
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_042013_160045_FA95998D 
X-CRM114-Status: GOOD (  12.53  )
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

On 13/10/25 17:02, Sean Christopherson wrote:
> On Fri, Oct 10, 2025, Valentin Schneider wrote:
>> The static key is only ever enabled in
>>
>>   __init hv_init_evmcs()
>>
>> so mark it appropriately as __ro_after_init.
>>
>> Reported-by: Sean Christopherson <seanjc@google.com>
>> Signed-off-by: Valentin Schneider <vschneid@redhat.com>
>> ---
>
> Acked-by: Sean Christopherson <seanjc@google.com>
>
> Holler if you want me to grab this for 6.19.  I assume the plan is to try and
> take the whole series through tip?

Thanks! At the very least getting all the __ro_after_init patches in would
be good since they're standalone, I'll wait a bit to see how this goes :)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
