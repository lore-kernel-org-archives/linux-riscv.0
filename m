Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2BB1CFA76B
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Nov 2025 10:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4YRKa6IGF46VdWJwJoCmVuUwm7RzdYL3A9iNeK7t21o=; b=lrkO/HxLYl5V1r
	rYudE/9ximEXnfiQfvJUPxrNn2mcOanzWVCOce631aqmqeDzLWZ5DDcZf59cPlzfgNncbTbYtxjse
	hQ3tWSnHuYOv0BmFCv6jPsCfmOes9eC8G5kdLt9Uh3OK8JYR+r0xYsEywO9xFbBAKZV76eUFi3FHA
	gLMacxxg/phQMkkqSzRHoIxU7PF+B0RdtUyr9Ikp6RjSoltEWtFkD1gCIpmlHMlp02lq8FhyucheD
	863LTNoUVQX3gpYmI7Rx8KCmDGcq0XKi8n9nxpq5BVn8aFP1mvm7kcThl17+x2jETIblEko3ynqzy
	0fSird18ox01WYZEEKBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMO7v-00000008DSA-3SSp;
	Fri, 21 Nov 2025 10:12:27 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMO7s-00000008DQr-47Gk
	for linux-riscv@lists.infradead.org;
	Fri, 21 Nov 2025 10:12:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763719942;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OZIk/6eiWFE7r0Pz8jIgtNeqgPIl4m+Z/Z67QWlEwbg=;
	b=YOK+FY879Am7GnPXbNLmSgDD9+CwCE35ZTP111/C75w6L6OtMB75MILjDrXLsK9Yl7VOqd
	9vkqDFih2SuH6BKKfbDoa82R2hHE2K5NtORIUpXT2hp6wqOPmxxN81vmwMRCetrS29N8wq
	zHDfF3e3Mwkpx7biyfMKytTcPvPA2fs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-304-I3D1YNtSO1ah8tjxO-yd1g-1; Fri, 21 Nov 2025 05:12:20 -0500
X-MC-Unique: I3D1YNtSO1ah8tjxO-yd1g-1
X-Mimecast-MFC-AGG-ID: I3D1YNtSO1ah8tjxO-yd1g_1763719940
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-42b3c965ce5so1515086f8f.2
        for <linux-riscv@lists.infradead.org>; Fri, 21 Nov 2025 02:12:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763719939; x=1764324739;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OZIk/6eiWFE7r0Pz8jIgtNeqgPIl4m+Z/Z67QWlEwbg=;
        b=lQmuFgKh+1QyibzCMXdD39BxgoxMNccRMQXJt+UmVigm0qYkwIua/tCyUGHFo90KwC
         4oxR28uGovbRRXPOf8ja70zTv/FAM8wLgRjkvA5KbmnnlDSNJnpaKqAWRza6vnboP2Zz
         LuNltNNgC3pkIq690Yy/A0E50IcPMRbJub37h+6m7mXFYRjHF6+nXL1ZQfaSOGy+uCc/
         wBT21xSiGkRESAR+PRGRZspZct+jzAvqe5dsDBIF3ReqkQu9Xq0AFlxAI8AUJ3qVsFvm
         n1Es00MwODFKfw6P7SY5JCun3XOrBGvsp7X0udSI+LmJjVjObUv3D/wNB+p+UduZbYB4
         WNFg==
X-Forwarded-Encrypted: i=1; AJvYcCVA4mjg5Mo37nc/djwkpJLPD3nfIQZtda1blFHsWyF2DKr9zhV7IIz2J44hUUsizyr/pAfQt1lOAK8ovg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzbLA8eTdfIP54shdtYDmO+VPJyj0kytlcoIxUrjXIjtx/NKT9+
	L5rkP6BwsB0Mf0UnqzDq64FPPb8Wt4Pzo36hjiX5tlLKzApa94QJKIbhFuDzbRt3m1g+4hPiiY6
	uspZBUGLeaNRUv2po9tObJAAKk4XWnumEcEwLR/UKUionP/K2X6NdbSEGpVvmxE+uNo71pA==
X-Gm-Gg: ASbGncvyiyZdaPOwF1pb74gf499F2/Xu99xwbv4ry2JBuT3Eg5+Je2y/F3FFBHOsVVi
	4Aeei3IEDTNU+c/sjwTJMvOxZET/9bKVsyoXK1ZuiEpaQWROMF7PnTEw5JB7WVznmJ4XzmaAgme
	bjsikH6/o2kgKwvzw3R0ddMti5q53dFVrHCmEbPKsZ+QbcuwM4lXqKCZ4I/H4L75fR+khJ4+LWd
	lPzhBQAcFV9RiJ6O1j8Q7PKGf2BWNfutNFsXr/+39vKy0hwiPSaW54UZ7Fuw1aR2KxW4cOKj/lB
	3yfrOzaxQVN+aPM6SDasOgbf4UJuLPFMGOcVzeh1JzdvTboHhHKRaO//eNhLC08Tluqsc3XlMA2
	mZXM+mgtzP0qiLD231tZta3xQ/tNS9tWhLX78FdECsKnXMm5h+YV/hNiA7uDM30DEVEXcLtc=
X-Received: by 2002:a05:6000:1888:b0:42b:3ace:63c6 with SMTP id ffacd0b85a97d-42cc1cbcdfcmr1795911f8f.16.1763719939495;
        Fri, 21 Nov 2025 02:12:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGQwvNnN1+6xkIr+bJK+olrvC0Z5OYdiF1L0OBTcrYbQMUdl7o+C2/hye3fKlSOf/cE5aQ8Qw==
X-Received: by 2002:a05:6000:1888:b0:42b:3ace:63c6 with SMTP id ffacd0b85a97d-42cc1cbcdfcmr1795834f8f.16.1763719938945;
        Fri, 21 Nov 2025 02:12:18 -0800 (PST)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-135-146.abo.bbox.fr. [213.44.135.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f2e432sm9799426f8f.9.2025.11.21.02.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 02:12:18 -0800 (PST)
From: Valentin Schneider <vschneid@redhat.com>
To: Andy Lutomirski <luto@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, linux-mm@kvack.org, rcu@vger.kernel.org,
 the arch/x86 maintainers <x86@kernel.org>,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, "Peter Zijlstra (Intel)"
 <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Josh
 Poimboeuf <jpoimboe@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Arnd
 Bergmann <arnd@arndb.de>, Frederic Weisbecker <frederic@kernel.org>, "Paul
 E. McKenney" <paulmck@kernel.org>, Jason Baron <jbaron@akamai.com>, Steven
 Rostedt <rostedt@goodmis.org>, Ard Biesheuvel <ardb@kernel.org>, Sami
 Tolvanen <samitolvanen@google.com>, "David S. Miller"
 <davem@davemloft.net>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Joel
 Fernandes <joelagnelf@nvidia.com>, Josh Triplett <josh@joshtriplett.org>,
 Boqun Feng <boqun.feng@gmail.com>, Uladzislau Rezki <urezki@gmail.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Mel Gorman
 <mgorman@suse.de>, Andrew Morton <akpm@linux-foundation.org>, Masahiro
 Yamada <masahiroy@kernel.org>, Han Shen <shenhan@google.com>, Rik van Riel
 <riel@surriel.com>, Jann Horn <jannh@google.com>, Dan Carpenter
 <dan.carpenter@linaro.org>, Oleg Nesterov <oleg@redhat.com>, Juri Lelli
 <juri.lelli@redhat.com>, Clark Williams <williams@redhat.com>, Yair
 Podemsky <ypodemsk@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Daniel Wagner <dwagner@suse.de>, Petr Tesarik <ptesarik@suse.com>,
 Shrikanth Hegde <sshegde@linux.ibm.com>
Subject: Re: [RFC PATCH v7 29/31] x86/mm/pti: Implement a TLB flush
 immediately after a switch to kernel CR3
In-Reply-To: <91702ceb-afba-450e-819b-52d482d7bd11@app.fastmail.com>
References: <20251114150133.1056710-1-vschneid@redhat.com>
 <20251114151428.1064524-9-vschneid@redhat.com>
 <65ae9404-5d7d-42a3-969e-7e2ceb56c433@app.fastmail.com>
 <xhsmhecpukowa.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <91702ceb-afba-450e-819b-52d482d7bd11@app.fastmail.com>
Date: Fri, 21 Nov 2025 11:12:16 +0100
Message-ID: <xhsmh8qfzu22n.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JpdSYYq8hHoiZdaY2MBSIdnR4vwSzJFw1PUdYSPsXhM_1763719940
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_021225_082122_6A7CFBF1 
X-CRM114-Status: GOOD (  27.33  )
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

On 19/11/25 09:31, Andy Lutomirski wrote:
> Let's consider what we're worried about:
>
> 1. Architectural access to a kernel virtual address that has been unmapped, in asm or early C.  If it hasn't been remapped, then we oops anyway.  If it has, then that means we're accessing a pointer where either the pointer has changed or the pointee has been remapped while we're in user mode, and that's a very strange thing to do for anything that the asm points to or that early C points to, unless RCU is involved.  But RCU is already disallowed in the entry paths that might be in extended quiescent states, so I think this is mostly a nonissue.
>
> 2. Non-speculative access via GDT access, etc.  We can't control this at all, but we're not avoid to move the GDT, IDT, LDT etc of a running task while that task is in user mode.  We do move the LDT, but that's quite thoroughly synchronized via IPI.  (Should probably be double checked.  I wrote that code, but that doesn't mean I remember it exactly.)
>
> 3. Speculative TLB fills.  We can't control this at all.  We have had actual machine checks, on AMD IIRC, due to messing this up.  This is why we can't defer a flush after freeing a page table.
>
> 4. Speculative or other nonarchitectural loads.  One would hope that these are not dangerous.  For example, an early version of TDX would machine check if we did a speculative load from TDX memory, but that was fixed.  I don't see why this would be materially different between actual userspace execution (without LASS, anyway), kernel asm, and kernel C.
>
> 5. Writes to page table dirty bits.  I don't think we use these.
>
> In any case, the current implementation in your series is really, really,
> utterly horrifically slow.

Quite so :-)

> It's probably fine for a task that genuinely sits in usermode forever,
> but I don't think it's likely to be something that we'd be willing to
> enable for normal kernels and normal tasks.  And it would be really nice
> for the don't-interrupt-user-code still to move toward being always
> available rather than further from it.
>

Well following Frederic's suggestion of using the "is NOHZ_FULL actually in
use" static key in the ASM bits, none of the ugly bits get involved unless
you do have 'nohz_full=' on the cmdline - not perfect, but it's something.

RHEL kernels ship with NO_HZ_FULL=y [1], so we do care about that not impacting
performance too much if it's just compiled-in and not actually used.

[1]: https://gitlab.com/redhat/centos-stream/src/kernel/centos-stream-10/-/blob/main/redhat/configs/common/generic/CONFIG_NO_HZ_FULL
>
> I admit that I'm kind of with dhansen: Zen 3+ can use INVLPGB and doesn't
> need any of this.  Some Intel CPUs support RAR and will eventually be
> able to use RAR, possibly even for sync_core().

Yeah that INVLPGB thing looks really nice, and AFAICT arm64 is similarly
covered with TLBI VMALLE1IS.

My goal here is to poke around and find out what's the minimal amount of
ugly we can get away with to suppress those IPIs on existing fleets, but
there's still too much ugly :/


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
