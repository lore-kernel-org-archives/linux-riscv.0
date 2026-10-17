Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB8ABCCA463
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Oct 2026 07:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EfD3Eshdssu0RgPUJw73Pc31oFUrzk12Mt3ob40345c=; b=wwzEt5Y0VdbjzX
	9a8KDr23GDGMyUrZQgZL60fIRWNq+qcojuvEHNEdlYY+p8oIN00E5tnU7TO+MVNBs3ONMuS7uE0Pp
	8sT4T77jpSj2gXGvskIpZyhiDcKCIeRWc6Co7klNN4cd0B/7dvg2UunDv9gZ8TA932pwy4s5o0GSr
	+S4Xb3BXQeMpMloK7Mb8Zi7td+iVWC4CGsETmKXCUimbN9mEVr3pcDk5J3xdIDNBaYuk5BmkRI58Q
	T+hv1bRVu4N9h7Dp15JBhWIFyAu9ZQox7g/YbLZt0ua1KAb2J5ESf3QgQHgTP3vbfXeaqh5vFU2Xp
	OWUYCaKo0zN4uCHNHi/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHz6h-00000004Xld-1wCW;
	Sat, 17 Oct 2026 07:45:31 +0000
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHz6f-00000004XlG-0nFl
	for linux-riscv@lists.infradead.org;
	Sat, 17 Oct 2026 07:45:30 +0000
Received: by mail-vk1-xa2b.google.com with SMTP id 71dfb90a1353d-5e3e525cf4bso545533e0c.1
        for <linux-riscv@lists.infradead.org>; Sat, 17 Oct 2026 00:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792223127; x=1792827927; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G9gHOokB2iUNg0rcd+4gK+6dCcLdNZHPpTlIwEx+WLg=;
        b=UEMM6NN456pNgJRRylS2oSF08NThFfGHiwwAooeSLRypGaddQ/oncNYnjpKvecfLBT
         1XVnXJBsJCYrHUVEolr6gcjzh0Ngu/vrQoL14gKDLkjYJSGnzB8O3fMhEfUSenjogxz4
         UxfOUdR9TSi4JX4qZsgTVZdFYYDUEv/Tz+NmXAmMWgkPH7eCHxG19+pF4Rjk2SGvGW84
         piY8aU42BlwrbaSkUYUGWErmrhW4RfZ7dRvs+8KWOl+GEcKblJzVSzA8U9j3Lmy6e9NJ
         RpNhdV0DgCGUvd8zVMGmslNvehxY8vA2txvIgZ9lUs/pCqKKlwdOjWQPJkBji5JAVbTY
         R/rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792223127; x=1792827927;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G9gHOokB2iUNg0rcd+4gK+6dCcLdNZHPpTlIwEx+WLg=;
        b=xQovET2ZO6OxxlUdWaR++13oOLISYSXGt1MSOwfHkEvMPYI6ApcsYppRfC2feL5X7P
         fFjYkLzHNItnk0M55+vX49BNxgcwsmt+nXdza0MqGk9XCFq6lGEaVfYgibYy8TGrGXQL
         vlTISfGUCnWYvh4NSYf+W4uLhdDMV3+WZu2DqVxasVFCp7t0eOcXJ2rZLri5mw77Shzt
         gbBay7pZdqRWOxFhsDEfa3BLX/9uG3hIdjwB7ETT4BsoS5D1DTibrzDEZZfFkZ9nSUaX
         kOCL45VdQatlh9kGjTj+p7ga7c/HLd/ksi4Bop8a7SQUA2I95K9QbDnmAhcSn1wyv7Ga
         207Q==
X-Forwarded-Encrypted: i=1; AKwUvBylNaVCu9VmUOa+n1im4t2VqtMjEVMW9Wip44tHkzqdCW2sAAaVFc3DA/btaT/mxEwViUv422lBy0IUhw==@lists.infradead.org
X-Gm-Message-State: AFq9FYKHnZjEYkAmB6EqUOV29X/U7QvDw62V0CN4MQTS7EbHL6Ls7GxA
	AN2DIG/5i24bmNaCMhO+SORPs/NJzZNvOm3cLvtkdkI9E7YIu95SQQJ4
X-Gm-Gg: AYBFou0lAv00UvZDlKzM4hr8YuTwsP8L+UpnZEhlf4HGVbPNqC2afHwzfVMExYGP50V
	5kSKo3+rcvm4j/Z7TpfO5XkQY9LKwBsqS1W0tlwNPPI/6WSuOQxcEmj/b+lHz8uS8yND7ZtkWWt
	4DIydHwI5QvcwQaj4+8IDfi5D0kGYbmGjM8m4BtHg415Hyh8RGK4/rlqQEyzvY8dLAH+3/87+XW
	6avCuWJzzTz+J02BJeJ7GCqtetZFoPVLQ9qllRGnbkiFsyBob8xVFkeBWZXhEVYI1mqExHPjM1J
	cGuRIUEktiqWWbDiwIipxsUyJMcTzXsVEHT96qcJXPzEDPsQ+q4gGI8azil6VMxyLWaM58+PP3V
	q9/F8GzhbvVT+BJE5iWtu0eK3IZisOBtPWuo8zmZuCKYwlJF+jAN9QJcaH0J4+D7DSVDzOdzsx+
	N3p7Kny4m16Odz8bcRyxAuyCmjPfy0yFi8gxChbwPEPFyWa0nF/k6gBCtQbQs6i8ri1EXleZWHh
	8TJiBl6xV1ikajZWTUE8IIL3atKQ9gHz4FsIXhPL8aKa95yUu2EJ5XMf03q3Lo=
X-Received: by 2002:a05:6122:3b8b:b0:5c9:a60b:e5a5 with SMTP id 71dfb90a1353d-5eaaa8c75e7mr970007e0c.16.1792223127505;
        Sat, 17 Oct 2026 00:45:27 -0700 (PDT)
Received: from localhost.localdomain ([186.151.100.62])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ea9b53cfdfsm3701836e0c.15.2026.10.17.00.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 00:45:25 -0700 (PDT)
From: Sebastian Alba Vives <sebasjosue84@gmail.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	pjw@kernel.org,
	samuel.holland@sifive.com
Cc: linux-serial@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sebastian Alba <sebasjosue84@estudiantec.cr>
Subject: [PATCH 0/2] serial: sifive: fix two init ordering bugs in probe
Date: Sat, 17 Oct 2026 01:44:51 -0600
Message-ID: <20261017074453.62645-1-sebasjosue84@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_004529_270006_904746D2 
X-CRM114-Status: GOOD (  23.15  )
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

From: Sebastian Alba <sebasjosue84@estudiantec.cr>

Hi all,

I found two ordering bugs in the SiFive UART probe path while working on my
undergrad thesis project. The project uses a HiFive Unmatched board with an
FU740-C000, and I spent a lot of time reading this driver to understand how
the console comes up, which is how I ran into both of these.

Both have the same shape. A resource gets turned on before the state it
depends on is set up, so there is a window during probe where a callback can
run against a half initialized port.

Patch 1 is the one I think matters. request_irq() runs before
uart_add_one_port(), so the handler is live while ssp->port.state is still
NULL from devm_kzalloc(). If a byte arrives in that window, the handler walks
into uart_insert_char() and dereferences the NULL state pointer. The patch
moves request_irq() after uart_add_one_port(), masks the interrupt enable
register before adding the port in case the bootloader left something on, and
adds the missing error label so a failing request_irq() unwinds
uart_add_one_port().

Patch 2 registers the clock notifier before ssp->baud_rate and
ssp->port.uartclk are initialized, so a rate change in that window divides by
zero. This is worse on RISC-V than on most other arches, because the ISA does
not trap on integer division by zero. divu by zero returns all bits set, so
DIV_ROUND_UP(12000000, 0) comes back as 0xFFFFFFFFFFFFFFFF and the udelay()
in the notifier becomes a busy wait that never ends. Instead of a clean oops
you get a hung core. The patch sets up the divider before registering the
notifier and adds a cheap guard inside the notifier.

I reproduced patch 1 under QEMU. The machine is qemu-system-riscv64 -M
sifive_u, which reports itself as HiFive Unleashed A00 and models the FU540,
not the FU740 I have on my desk, but it is the same UART IP block and the
same driver. I added six lines of instrumentation right after the
request_irq() block to print port.state, unmask RXWM and hold the window open
with mdelay(), then fed bytes into the UART while it was open. With panic=-1
the kernel reboots and retries on its own.

Without the fix I got 318 windows and 318 NULL dereferences, so every single
attempt crashed, and port.state printed as 0000000000000000 every time. The
trace is always the same.

  Unable to handle kernel NULL pointer dereference at virtual address 0000000000000080
  epc : uart_insert_char+0x66/0x154
   ra : sifive_serial_irq+0x94/0x1f0

With the fix, same instrumentation at the same point and same input, I got 18
windows and 0 NULL dereferences, and port.state printed as (____ptrval____)
every time. That is what vsprintf prints for a real pointer before the RNG is
ready, since ptr_to_id() special cases NULL and prints the literal value
instead.

One honest note on those numbers. The window counts are not equal, because
without the fix the kernel crashes early and panic=-1 restarts it right away,
so many short cycles fit into the same 180 seconds, while with the fix nothing
crashes and every window burns its full mdelay. The count is not the argument.
With a 100 percent baseline failure rate, 0 out of 18 is not luck, and the non
NULL pointer is the cause while the crash is only the symptom.

I did not reproduce patch 2 the same way. It needs a clock rate change inside
a very narrow window and I could not drive one reliably under QEMU, so that
one comes from reading the code. Happy to be corrected on it.

Both were pointed at during review of the off by one fix back in August, but
as far as I can tell nobody sent patches, and both are still in master today.

This is my first series to this subsystem, so please tell me if I got the
format or the split wrong.

Thanks,
Sebastian


Sebastian Alba (2):
  serial: sifive: fix NULL pointer dereference in probe IRQ window
  serial: sifive: avoid division by zero in the clock notifier

 drivers/tty/serial/sifive.c | 32 +++++++++++++++++++-------------
 1 file changed, 19 insertions(+), 13 deletions(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
