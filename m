Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21FFAC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Oct 2022 16:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:MIME-Version:Message-Id:Date:
	Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=g72uNM60rgqyZcQxVzzYNoFjW4KDX7cDM+GIkfFmA00=; b=rjR1q8C2Lo3ga4
	1SZqYDAR0vl4qSLcTWKuv+k9BifldWovYyA0IiiVssgl7VC5nPQCy8kB60PGhacqDa80cyFewJADb
	bxvg5/cu204tjfnsRfvYOPwXZFqHYuYF4xIbPMAT7jdRW4Gsb5d3Vl9U2+HCnWqT7EjvARyjpyG2r
	vkEXxUijg3RsjbQACs4rrtVwdpoSPTHVSk5HxeJnLRn5gO25So2uB3lsHHqpTXqNF/ZmbYbh68tMk
	31Mg+OECOLAzvjqLjoZt1VhvPGpEbFN03JiTIvrQGryifukclivARSWLXxcrW8vgyDvVXAbioEXAI
	25XHx9PqIwqY6uka0VTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj1Bb-00CREk-9X; Thu, 13 Oct 2022 16:35:55 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj1BX-00CRCf-Ig
	for linux-riscv@lists.infradead.org; Thu, 13 Oct 2022 16:35:53 +0000
Received: by mail-pl1-x636.google.com with SMTP id i6so2260597pli.12
        for <linux-riscv@lists.infradead.org>; Thu, 13 Oct 2022 09:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=hZEf8nDjNjXMcMqk1mBpQt5msb/92OZicJ649nQpMuQ=;
        b=stVMZIgp+JLamwbDO6ubPoZgvVlUi6/gZAOyh3Pg5c/hVJK9gbImJVJvTGIYWbXTM3
         jVa1hDmiNLL+OI/woLoM+j3OPyF8md7Zb8p/IAv+9KqcZullEhaWIfKqLAPW6RcJG/q0
         Kzt2JjN2Mlz8/Vp2osii/Yi3vy1CJ12s4GSTovR3bI66UBbF9vuJpVsnXnL4ZOM9CzPR
         3yssfvMFN7Hwdm5dFat7s860uf0ERn+oq7OsR+pf8U8aO1fY+Y0sVMGwHXJEeOFLgbZg
         NdY+jf/YCwZmJm9wpRxQHx9Ar4N/JL1rZN8eSUyOk+XwulRwK/2oK1+TlzK8rPjDp2b7
         btNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hZEf8nDjNjXMcMqk1mBpQt5msb/92OZicJ649nQpMuQ=;
        b=E6/h8ql3aUJSMUmPfY3nvwc7zVGqrjc+EZJYyr9psCxnw4x5UuGFxAsVffY0nZFCfo
         9xrncNEhRGXJ1ktqmhtk+b+D96IremDKAXIybe6Rsjt5ixXcJIOR8ltJZD+qOqum0Vi0
         AEA7FO7OxPwq9tOguE+Ox2mKXlEduU2gWJBFq1/ijf2IYjf0s/wmVLwaFuVaOC0PXbgV
         c8YMPGrbrhSVu8W02IQBIP/qoeOeSSQySAIlY0JIGJ5F8dPP3gqh5qSwRyl6swrJc8PO
         lKo3grozJ6SB40AH/UO1iXqbT21k/jEjKqSbpwpUzYNAZKPDyHhZMiGtg5Fo5gv9LaSr
         AQLQ==
X-Gm-Message-State: ACrzQf1Nkhe7G8Y1W8eoxkhrt6APesmy1XC+SpA4KbRMwgCcEfP1D2ht
	bMQ4G8yFt+Gz8TJEpuY7aCCGu39dUO+1lw==
X-Google-Smtp-Source: AMsMyM4eVGdkaVx4FjidSPEgamnOK8rVXjxogrHP0rMwMhKQjI90KCvh6HYjZSbOUjHAslN3pfMSjQ==
X-Received: by 2002:a17:903:1105:b0:178:ae31:aad with SMTP id n5-20020a170903110500b00178ae310aadmr720842plh.3.1665678948172;
        Thu, 13 Oct 2022 09:35:48 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id q15-20020a170902a3cf00b0017c6959724asm54032plb.258.2022.10.13.09.35.47
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 09:35:47 -0700 (PDT)
Subject: [PATCH v1 0/5] RISC-V Hardware Probing User Interface
Date: Thu, 13 Oct 2022 09:35:46 -0700
Message-Id: <20221013163551.6775-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_093551_834328_3D7A07A6 
X-CRM114-Status: GOOD (  20.38  )
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

These are very much up for discussion, as it's a pretty big new user
interface and it's quite a bit different from how we've historically
done things: this isn't just providing an ISA string to userspace, this
has its own format for providing information to userspace.

There's been a bunch of off-list discussions about this, including at
Plumbers.  The original plan was to do something involving providing an
ISA string to userspace, but ISA strings just aren't sufficient for a
stable ABI any more: in order to parse an ISA string users need the
version of the specifications that the string is written to, the version
of each extension (sometimes at a finer granularity than the RISC-V
releases/versions encode), and the expected use case for the ISA string
(ie, is it a U-mode or M-mode string).  That's a lot of complexity to
try and keep ABI compatible and it's probably going to continue to grow,
as even if there's no more complexity in the specifications we'll have
to deal with the various ISA string parsing oddities that end up all
over userspace.

Instead this patch set takes a very different approach and provides a se
of key/value pairs that encode various bits about the system.  The big
advantage here is that we can clearly define what these mean so we can
ensure ABI stability, but it also allows us to encode information that's
unlikely to ever appear in an ISA string (see the misaligned access
performance, for example).  The resulting interface looks a lot like
what arm64 and x86 do, and will hopefully fit well into something like
ACPI in the future.

The actual user interface is a syscall.  I'm not really sure that's the
right way to go about this, but it makes for flexible prototying.
Various other approaches have been talked about like making HWCAP2 a
pointer, having a VDSO routine, or exposing this via sysfs.  Those seem
like generally reasonable approaches, but I've yet to figure out a way
to get the general case working without a syscall as that's the only way
I've come up with to deal with the heterogenous CPU case.  Happy to hear
if someone has a better idea, though, as I don't really want to add a
syscall if we can avoid it.

I threw this together during the conferences so I would be surprised if
it's not broken, but I figured it'd be best to just get something on the
lists sooner rather that later.  Happy to have someone go fix my code,
but the new uABI is really going to be the tricky bit here.  There's
some test code included, but I haven't even booted a kernel with these
patches so YMMV.

These are also up at kernel.org/palmer/linux/riscv-hwprobe-v1 in case
that's easier for folks.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
