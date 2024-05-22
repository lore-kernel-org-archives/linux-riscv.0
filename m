Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7DD2C25B79
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 16:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=f5RUaLQBwSrQcCcapWZSrUQ8bScwSGIGT8WznI6CKlg=; b=rro87/XwrWucu5wpnURuXVNlvz
	uDyqYibjt6h6B233c4zkvsb1jFfvvjU69Oewp99WS9fMytu8krufsAlZov+tqQ3kz7s0eaOVXWrO1
	z7PFConW/d7xNqQJPWoNP7DZOEc2LtPCB2IpLBb/iJ+W+HQ2dxvJUmyOS9PuE+y9AE8jsME5IrCY3
	61IDnXMZwPJyRfI/KzOSpsHsMc++69+hSsywKFN+nlawyb2prIX/0SyHoiyu4CFJ82XYHg6fFbCPC
	JFacFIcYOWhC/JqwQczw7Wh4a7BHwbNe21H3aS1Iu89awkNmB8TAnSlWpWwGccpTs6rZHMFMQf0Tn
	SiWyjstg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9owL-00000003Xxz-3nVR;
	Wed, 22 May 2024 16:35:45 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9owI-00000003XuZ-0TQC
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 16:35:44 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6f44ed6e82fso1571252b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 22 May 2024 09:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1716395739; x=1717000539; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zqGp54J8ESCUs+m4e0ISGDjXBHl6d8o9SoEATv+WGEw=;
        b=1N2jwQscwTlpicXoRvsKP5p7SBsxlf1KONKSJi+nfalSrCqhiDXgTgp3XvJr7XqsK+
         F9BZfo8T3fEvBA4z7hLakE8gFlH5B1VKnyzT9wo5JoqTZp03b6C+dT1ZEitqgCorC99+
         tH4lcAPBho0vhUoGVZ6JsMWLoeUVpnqEK4O7ANqFiQwpTFg0nEQ4Fw8gBfwaivC7N/Yo
         hLIf+oma5ytIfU1lGhidcq8O79Kkb3BueyobXp+eDi09ove8C9rACn+6oVCKpE3/x63L
         UQKCMlZ1S+hP+ltO4rBSV15PcCugbCPs89RXtaU90f8eg24pSJZMUmZZfzKH65GQb2zE
         laDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716395739; x=1717000539;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zqGp54J8ESCUs+m4e0ISGDjXBHl6d8o9SoEATv+WGEw=;
        b=IeZlrkvmWJXOwGiSkioLqG4KWqMRZ2V5G0OiLfPIuNwO8OzHyKz9DfvAdXvWGqHK3v
         S2Hhteft9C2mWNf73Wqfd8IHK+hibYHXhXBRGWUWo0iY9VbLlC2V2y8KR8zPUTftgJFm
         JVRRQ8oMDXIS//yHz7zbVcZLipbbtf3UpxRIL48Nxt5XcdLA14+gvzHrNqTNxpa0op1L
         RV4hppurBvF0v37VXejpG4TlYXeqCtw09rXOGprMq58TT7FZ5Mq04oZVciW5yxY7CYpd
         vEQBUg9CcspVrLM/Uy1hHtJJ8wG8qgvuhq3Se8ItfzkyHhUKNJjddl9TmYImr0mb2InQ
         FWWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOvX6mH22cEWtkyWNAmDIDtXE4Mqwb5d4qvKSXG5QCQso/fTls/jnUJHvqqoLnc0IkzCY4Bjdawb8WWmZ6xpyK93qSt9USxgN1X/KA5PWz
X-Gm-Message-State: AOJu0YwOadW8WiYGCchA5/ksHbTVzzeXe7ofaz8piGImEq6aGUX5kjUz
	XzXFxSQuHRRjwPsOoOMp5HOtZVjqv/s2sCNnJWefulurNg3fkJ/t5SULuQxjt2g=
X-Google-Smtp-Source: AGHT+IHNg4G/+FrYZDK16ARdepdZLQp6DOCEY9we0rv5z5/42V7Fb/cT4nWy7dXR6Rb1X80XjYbanA==
X-Received: by 2002:a05:6a00:4f8b:b0:6f3:ef3d:60eb with SMTP id d2e1a72fcca58-6f6d62200f1mr2432509b3a.34.1716395738743;
        Wed, 22 May 2024 09:35:38 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a82896sm22664747b3a.69.2024.05.22.09.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 09:35:38 -0700 (PDT)
Date: Wed, 22 May 2024 09:35:38 -0700 (PDT)
X-Google-Original-Date: Wed, 22 May 2024 09:35:36 PDT (-0700)
Subject: Re: [PATCH v2 0/7] riscv: Various text patching improvements
In-Reply-To: <20240327160520.791322-1-samuel.holland@sifive.com>
CC: Bjorn Topel <bjorn@rivosinc.com>, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, samuel.holland@sifive.com, Ard Biesheuvel <ardb@kernel.org>,
  daniel@iogearbox.net, jbaron@akamai.com, jpoimboe@kernel.org, peterz@infradead.org,
  rostedt@goodmis.org, bpf@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: samuel.holland@sifive.com
Message-ID: <mhng-0ba9a35d-4bf6-4331-9c58-67305b5b56ad@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_093542_265353_89F58844 
X-CRM114-Status: GOOD (  18.10  )
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

On Wed, 27 Mar 2024 09:04:39 PDT (-0700), samuel.holland@sifive.com wrote:
> Here are a few changes to minimize calls to stop_machine() and
> flush_icache_*() in the various text patching functions, as well as
> to simplify the code.
>
> This series is based on "[PATCH v3 0/2] riscv: fix patching with IPI"[1].
>
> [1]: https://lore.kernel.org/linux-riscv/20240229121056.203419-1-alexghiti@rivosinc.com/
>
> Changes in v2:
>  - Remove unnecessary line wrapping
>  - Further simplify patch_insn_set()/patch_insn_write() loop conditions
>  - Use min() instead of min_t() since both sides are unsigned long
>
> Samuel Holland (7):
>   riscv: jump_label: Batch icache maintenance
>   riscv: jump_label: Simplify assembly syntax
>   riscv: kprobes: Use patch_text_nosync() for insn slots
>   riscv: Simplify text patching loops
>   riscv: Pass patch_text() the length in bytes
>   riscv: Use offset_in_page() in text patching functions
>   riscv: Remove extra variable in patch_text_nosync()
>
>  arch/riscv/include/asm/jump_label.h |  4 +-
>  arch/riscv/include/asm/patch.h      |  2 +-
>  arch/riscv/kernel/jump_label.c      | 16 +++++--
>  arch/riscv/kernel/patch.c           | 69 ++++++++++++++---------------
>  arch/riscv/kernel/probes/kprobes.c  | 19 ++++----
>  arch/riscv/net/bpf_jit_comp64.c     |  7 +--
>  6 files changed, 63 insertions(+), 54 deletions(-)

I don't have any issues with this, but given that we've run into some 
possible text patching bug with this ftrace thing I'm just going to hold 
off until 6.11 for these.  Maybe that's a bit too conservative, but with 
the bug only manifesting on HW it might be tough to sort out.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
