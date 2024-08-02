Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 806D5C3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Aug 2024 11:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x+pZjlhHZQrRgE/jWANBxZHeQN6ILXf7biEoRa/KPyA=; b=uQA9rJYhPHLKJX
	TnSKjH1Ix8tTENA+IJnPSRmRkGKkQEAD1Odd3pE7H9uQyStdW0Xhvt9Y3PHl1bL7eiwzjO6DFJGmB
	weYJvMIL0fU/ie0lRU0R8K6uv6O74vpZ1UcXdG14xJ1zQOK8XR31m+nhmmPmnea4th++nTzyX8Mt4
	uWbfyP8rgUkj5zsj+LOOE21R4yus2BqedRT+3cCyQyNhLT6z5M7aqMr28ehrkrL2iCH1Y51GlQ6EF
	PdxQiHfiF2rr/xGq7tt1Kt1InTHn6Wyug53YtI69vytqyTfXQSQsLnpFer1JO40Ih1syaCNkkdUEi
	O0t/+177xIW34JTCJpWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZqpa-00000008jOJ-0Gyp;
	Fri, 02 Aug 2024 11:52:22 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZqpX-00000008jNQ-0AP6
	for linux-riscv@lists.infradead.org;
	Fri, 02 Aug 2024 11:52:20 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5a156556fb4so11707864a12.3
        for <linux-riscv@lists.infradead.org>; Fri, 02 Aug 2024 04:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722599537; x=1723204337; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=46L6nTfwlpEOKrJbpXIYVmIVoshBQpihOVyTwQcqTFE=;
        b=dTlh3knC39mjvvOaOuOOn19JM7Tr+dIDZsc8s9SBYug15h0FEsLA9n+gdRsGsF7shd
         cWnnLNU83Vo0mnMi5G1bHRtUdPkoiuJhBNQwS2awE489CYly5Fz5PmoAgFyB8FfnTGGQ
         K1LeJg8Qawl0uX5uDozoKy/j5bd5ppQpMA7gXxAG+E01SjLpcEr+4phrWM21pZDeI/qM
         wVuAk9BHHNc2xctAR7esaBceGdzTVFn1IYwnOEdOrX3O94UVYh2fxNe84RL+M7HwFkFv
         sJGOZ+5w66Zq5PhhNpQu1cOjgPQKsprJ88+5QhfiTIx/fqYFrikO3eQDS5rXUySCJzF4
         Xiew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722599537; x=1723204337;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=46L6nTfwlpEOKrJbpXIYVmIVoshBQpihOVyTwQcqTFE=;
        b=BFyrvrcoCHFOfeXSEq0FH0RiUQ0EvTYlxMQjQKhj6I2CRnWint7LEC26sYKrZrGhao
         mfAqa16L5vGjKGSv1ZshJ5/OQM3QPu3TqVUpFqwaMWUzW76+ydykUFTYHqkBKok+LzP/
         GrwOCoGFuHGxZ8ZhqN35MEG/CmeVBPVXY/U85zcf6dV2nn8/icEnXp1MfyR1X/i+iKeU
         Lfp+DMbjdt3ZhLAPqrAah696j+MFjUr3dWvCxazgCwpWaMY5nsBb9brqcMCvQAmi5F86
         omcoVmmofPMGuW3A4MbbYKYQ9cbhroHMfDu6zCiPnPu5iV9G9TArfvBrdFqKipmxlzm+
         sDxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkL/vAu3l+MXvmLnF/36PJDpyUoBG2D2o2Db0DSnxzTNcW8qM7bEwi9DTIQt323jD2MhRdYggYUeqNRpTLmGPvAlC5Y5WOEhie55GC/lPD
X-Gm-Message-State: AOJu0YxMKCPKrIqtcaHSqOnR5t6JiRIgvkNI5C/VcdXlOdRf3JrvsnDx
	0/qyuEoxtzsEAxHbmKEcztGs6I1dFobyk5BFRpXV4P3Gabcdvsji
X-Google-Smtp-Source: AGHT+IHufQNlGzmcrJffDFBWsb/bmgsJq/VLohwdwIe5kh6bRAB1LAYhwpPtXYIzKtv8V3TcSCECmA==
X-Received: by 2002:aa7:c406:0:b0:5a0:f0c4:aa7b with SMTP id 4fb4d7f45d1cf-5b7f5129461mr2068504a12.27.1722599536954;
        Fri, 02 Aug 2024 04:52:16 -0700 (PDT)
Received: from krava (2001-1ae9-1c2-4c00-726e-c10f-8833-ff22.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:726e:c10f:8833:ff22])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5b839b2b0f0sm1009301a12.28.2024.08.02.04.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 04:52:16 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Fri, 2 Aug 2024 13:52:13 +0200
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Guo Ren <guoren@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Kees Cook <kees@kernel.org>,
	"peterz@infradead.org" <peterz@infradead.org>,
	"H.J. Lu" <hjl.tools@gmail.com>,
	Sohil Mehta <sohil.mehta@intel.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Andrii Nakryiko <andrii@kernel.org>, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [RFC] uretprobe: change syscall number, again
Message-ID: <ZqzIbU_T6sN01o5B@krava>
References: <20240730154500.3155437-1-arnd@kernel.org>
 <20240802181437.29b439e26608561f1289892a@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240802181437.29b439e26608561f1289892a@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240802_045219_107398_40525182 
X-CRM114-Status: GOOD (  37.40  )
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

On Fri, Aug 02, 2024 at 06:14:37PM +0900, Masami Hiramatsu wrote:
> On Tue, 30 Jul 2024 17:43:36 +0200
> Arnd Bergmann <arnd@kernel.org> wrote:
> 
> > From: Arnd Bergmann <arnd@arndb.de>
> > 
> > Despite multiple attempts to get the syscall number assignment right
> > for the newly added uretprobe syscall, we ended up with a bit of a mess:
> > 
> >  - The number is defined as 467 based on the assumption that the
> >    xattrat family of syscalls would use 463 through 466, but those
> >    did not make it into 6.11.
> 
> OK... that was not expected.
> 
> > 
> >  - The include/uapi/asm-generic/unistd.h file still lists the number
> >    463, but the new scripts/syscall.tbl that was supposed to have the
> >    same data lists 467 instead as the number for arc, arm64, csky,
> >    hexagon, loongarch, nios2, openrisc and riscv. None of these
> >    architectures actually provide a uretprobe syscall.
> 
> Oops, thanks for finding.
> 
> > 
> >  - All the other architectures (powerpc, arm, mips, ...) don't list
> >    this syscall at all.
> 
> OK, so even if it is not supported on those, we need to put it as a
> placeholder.
> 
> > 
> > There are two ways to make it consistent again: either list it with
> > the same syscall number on all architectures, or only list it on x86
> > but not in scripts/syscall.tbl and asm-generic/unistd.h.
> > 
> > Based on the most recent discussion, it seems like we won't need it
> > anywhere else, so just remove the inconsistent assignment and instead
> > move the x86 number to the next available one in the architecture
> > specific range, which is 335.
> > 
> > Fixes: 5c28424e9a34 ("syscalls: Fix to add sys_uretprobe to syscall.tbl")
> > Fixes: 190fec72df4a ("uprobe: Wire up uretprobe system call")
> > Fixes: 63ded110979b ("uprobe: Change uretprobe syscall scope and number")
> > Cc: Linus Torvalds <torvalds@linux-foundation.org>
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> > I think we should fix this as soon as possible. Please let me know if
> > you agree on this approach, or prefer one of the alternatives.
> 
> OK, I think it is good. But you missed to fix a selftest code which
> also needs to be updated.
> 
> Could you revert commit 3e301b431b91 ("selftests/bpf: Change uretprobe
>  syscall number in uprobe_syscall test") too?
> 
> Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> 
> Thank you,

yes, it still needs the selftest change like below
otherwise if that new number works for you then lgtm

Reviewed-by: Jiri Olsa <jolsa@kernel.org>

thanks,
jirka


---
diff --git a/tools/testing/selftests/bpf/prog_tests/uprobe_syscall.c b/tools/testing/selftests/bpf/prog_tests/uprobe_syscall.c
index bd8c75b620c2..5f78edca6540 100644
--- a/tools/testing/selftests/bpf/prog_tests/uprobe_syscall.c
+++ b/tools/testing/selftests/bpf/prog_tests/uprobe_syscall.c
@@ -216,7 +216,7 @@ static void test_uretprobe_regs_change(void)
 }
 
 #ifndef __NR_uretprobe
-#define __NR_uretprobe 467
+#define __NR_uretprobe 335
 #endif
 
 __naked unsigned long uretprobe_syscall_call_1(void)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
