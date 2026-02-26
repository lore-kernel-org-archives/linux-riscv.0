Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F4EFFD9E0A
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Feb 2026 21:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gg/GPgAhYAi0B7upHbK8nFcOKO02wgW8aj+kzSKuy1Y=; b=QntGsGuGEEkOQ+UqBUZ9DjcqCo
	+IXP7blXXHxUrBPB0FQ9F0cRyHVCUyxeorE5ZV+NI8HeT5RMbtbrNtEklI9N9HrRzZPNSnOglQdx0
	Y1wsaALCuo3/vKheqPA5+tfFAH26JTCM9F4k4YnTMTgRVQJaPYgH7cZHWijaZGqszKKja/L7UYE53
	VhFCBjKm/g+fs2A4iDDqH2byScmot1Of6/h2ji7Stes/bIWVGZu5Piuv0+br20mXQc7z4fpA4+0qC
	aJ7nPbVxwVJraocqrcriw42fNRvAtVZXwwC/MWpkM+NVFqrQidz3tuePOcgCyCApnaeJgwo6wfVJW
	9PchTQlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vviX3-00000007C9S-2jZB;
	Thu, 26 Feb 2026 21:04:25 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vviX1-00000007C90-0Ii6
	for linux-riscv@lists.infradead.org;
	Thu, 26 Feb 2026 21:04:24 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-2ba9c484e5eso1351430eec.1
        for <linux-riscv@lists.infradead.org>; Thu, 26 Feb 2026 13:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1772139861; x=1772744661; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BfmlzwEDHS4WYea4lib/8b6e0GAArKK1a+mu7MGsjt8=;
        b=D7IBPlgHNyRJTd9KNP9jbOO8iJPufBaaFBnG4QqekAmo24Bbwv6mAiqZubemgQVt6F
         tJXMcac3X2+3B8TFKUxXz3Pe9k/FjWhtgDB1OxtTMl+Ds0/Pdij5OSDs2CE6obvBbRUI
         41RfEjPqohrYCBNPAuwSK7T8ZS7GvNOQUptxYIoTK7Nf+4WlFbtWPIW+/YUVkJ4ZOwz4
         J7CAFUY6my7x8pc1ZJOC+3Rc3UpgxMXJiwHxra+xk6kYXwjsNMtDZVJuXM4ToHAT4/Kg
         Dazaj85XaL2G2LzH0hpBuRS8PL9bRgkahr/DsjsdtvAc9dj2Oxzd7LAOEy5lhJsXHgJ0
         /y1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772139861; x=1772744661;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BfmlzwEDHS4WYea4lib/8b6e0GAArKK1a+mu7MGsjt8=;
        b=D6y0D7DBVjkeaZVHwSJNOF0/+5kpUjH1HJzlCQEWAXR963CYuEA9lafil9l8XHEYls
         fVq68uVekQ4kxFzjysPxY+PcVk0KIjBACsaz/roPwONJbb7Rc63hG6qdUFzfGTCZW/69
         8N4jH0i83u+BIp/GST1qhkcDsKlxAbFQw3XLZYA9Xxs6jxFkgq9iXE5xVYpEWaY2Ify9
         m85a5pkz7RznT3zyyTZp1UhTqthaVCiOqUSdIsTQLg4pR1ljXWIUhxdeoDKxLDSszNK2
         bX7ktt98TEYIluXDm8NDzddddI3Ry/yK0TBVQQpcA5h51GvU5kSLcbRax+yXOHttc8F8
         a7hQ==
X-Forwarded-Encrypted: i=1; AJvYcCVce9aITgS7j/02GZKdnrepCMfcZyEAd9Lio6aVsq9CuZ1er+wL6J3Ynv8aqJSDA3SeoZst6vS8v8YQmg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwCFVvXeZUrDDKCOu6+BvlO/S6SwiEeyWiw/b2EqD5tlqgBM12U
	JXuYYkXT5oVc1bIgpoKgFIEOcI/2MQSChJP3sVbXDs2Y16zNm54dFsWcIlXsa1kY0J0=
X-Gm-Gg: ATEYQzya4y3uOnHJLTBC5vQEpJ7sim0eaJKdBJlS1VVQ/SaIfQ5bGRxI2BYsss0+TUa
	pzXfUeZxkrfQgZ/qfehrUYlQD8Lv/jgyUyf1aDcsacU2Ys3/ki+UZvnx86jst+LCErX4SuxJH0l
	Jz45wXOI/M8DDumozai6bsy/cvNMFSuH49cw147B1/Wigqu7f4FEEkaHRxxeDc8BN0SUYIBNlCp
	3pZtCpJ63B1vCYHK1T3C6+nETNFlzmGvVd50sSd4OuBXEkrgW8c7gbdze26m24CSPzbw4YYhCss
	M2OoQpAbSEwb5FGKjbpz5KpNkWAkUEMqV+OdK95yPSTS8jQWI2tM5vxDFLBxRrd6fJc81KUZCz5
	YdHc5O+aR2q5X2QjJhOvLKASVEIBY6D1QsO7urKt/lUWQ2wy2li4jsYG4qYE0YZPxSlEgBwSaSZ
	9K3yVbGDzdOXFPlSukGm1n6KrPMEI6BmNN
X-Received: by 2002:a05:7300:3b24:b0:2ba:6b3a:7696 with SMTP id 5a478bee46e88-2bde1b504e4mr184408eec.8.1772139861383;
        Thu, 26 Feb 2026 13:04:21 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bdd1bcea4esm2597709eec.5.2026.02.26.13.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 13:04:20 -0800 (PST)
Date: Thu, 26 Feb 2026 13:04:19 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
	"torvalds@linux-foundation.org" <torvalds@linux-foundation.org>,
	"Yu, Yu-cheng" <yu-cheng.yu@intel.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"broonie@kernel.org" <broonie@kernel.org>,
	"pjw@kernel.org" <pjw@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"zong.li@sifive.com" <zong.li@sifive.com>
Subject: Re: [GIT PULL] RISC-V updates for v7.0
Message-ID: <aaC1UwUpGebEL5Rt@debug.ba.rivosinc.com>
References: <c554c02e-a791-5c4a-d329-7632de7a194d@kernel.org>
 <CAHk-=whUXMRa3py11kpZiDMau8uauiwZCok2UMQAecTshfTrVA@mail.gmail.com>
 <2248971d-d69c-65fb-93b4-10f0d7d8bbad@kernel.org>
 <b2aae256-7d3c-447d-aa8b-5904848cff6a@sirena.org.uk>
 <CAHk-=whfQXKr3Sgoc7R1tPWFD3A1gEhUh=j7GGwz8yg_EQVhNA@mail.gmail.com>
 <aZYZsBlH_tVxnZIf@debug.ba.rivosinc.com>
 <196537b2933567d1781901f813a72ffffedd10fd.camel@intel.com>
 <aZZuGYQUy11Gse7x@debug.ba.rivosinc.com>
 <20260226132342.GC606826@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260226132342.GC606826@noisy.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_130423_185260_9BFF9A37 
X-CRM114-Status: GOOD (  20.49  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Peter,

Responses inline.

On Thu, Feb 26, 2026 at 02:23:42PM +0100, Peter Zijlstra wrote:
>On Wed, Feb 18, 2026 at 05:57:45PM -0800, Deepak Gupta wrote:
>
>> x86 doesn't have any equivalent BTI bit in PTEs to mark code pages. IIRC, it
>> does have mechanism where a bitmap has to be prepared and each entry in bitmap
>> encodes whether a page is legacy code page (without `endbr64`) or a modern code
>> page (with `endbr64`). And CPU will consult this bitmap to suppress the fault.
>
>So; all of this is only ever relevant for programs that are mixing CFI
>and !CFI code. If a program has no CFI, all good. If a program is all
>CFI enabled, also all good.
>
>If it starts mixing things, then you get to be 'creative'.
>
>Now the thing is, if you start to do that you need to deal with both
>forward CFI (BTI) and backward CFI (shadow-stack) #CF exceptions. That
>bitmap, that can only deal with BTI, but doesn't help with shadow
>stack, so its useless.
>
>My proposal was to ignore that whole bitmap; that's dead hardware, never
>used. Instead use a software PTE bit, like ARM has, and simply eat the
>#CF look at PTE and figure out what to do.

IIRC, arm has hardware PTE bit saying this is a guarded page. That can be kept
in ITLB as part of virt addr translation during instruction fetch. So whenever
indir_call --> target happens, if target translation was already in ITLB, CPU
already knows whether to suppress the fault or not, without going to kernel.

In x86 case, using a software PTE bit would be different. There will be a fault
always and kernel won't be able to make a decision on what to do. It'll need
some delegating authority to make that decision. That delegating authority can
be a signal handler in userspace which may need a bitmap/auxilliary data
structure of sort to make that decision whether target address is a taken target
or should not be taken.

So decision point is either

  - do a software bitmap or
  - hardware bitmap (legacy interworking bitmap)
    (both will be slow).

OR

  Just don't allow/support that configuration to enable CFI. And put onus on
  workload owner to do the work to enable the feature.

Sidenote: I wish we were able to convince someone certain in Redmond to give a
sw bit back and this all would have been nicer. Given there wasn't a lot of
traction from open source for this feature, it was mostly a redmond driven
feature.

>
>Yes, this is 'slow', but my claim is that this doesn't matter. There are
>2 ways out of this slow-ness:
>
> - fully disable CFI for your program (probably not the thing you want,
>   but a quick fix, and not really less secure than partial CFI anyway).
>
> - fully enable CFI for your program (might be a bit of work).
>
>The whole mixed thing is a transition state where userspace doesn't have
>its ducks in a row. It will go away.


I have spent 8 years defining features to kill class of low-level exploits back
at Intel. And then next 6 years in places where software is deployed on these
CPUs. 

I am a security engineer and would have loved to get these features enabled.
But in all honesty, I am yet to see anyone at these places (hyperscalars)
willing to give up an ounce of perf budget (1-2% demands discussion and strong
justification) for enabling just the shadow stack feature.

So my advise would be not to care about enabling path where there is a perf hit.

Keep it simple
- Enable when all binaries have feature awareness.
- Disable when there is one binary with no feature awareness.

>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
