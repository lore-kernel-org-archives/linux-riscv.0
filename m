Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23DD606A32A
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2026 03:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ABSUx+W6;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tvfj3C6x
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=w1s4mmPtEIsuSONdIKwQVOqDNUFmf0psv3Hymsm3FRY=; b=ABSUx+W6ASgnUh7N40UV1pTLef
	Iw1s29neAVxzBXLQK6PtWLs7wfmYqTQyNArNETrVi13b0DLTgQsrD5QQ65EJ+1IZxEAXG2ReIJ1kF
	Ic4WLOoHqi6tfFDZon7sVCI0IKUga2ZrrLfj2OJJT2UIMx2R5NGhSYr4sFfrXxxbBKh0tVcK1df5g
	XIVlHp48Cf4y6qwTX46zJGsbeye4y1ZB1OCmD6mvLL1DvJHXX2u3ILSFH622CuZaDytSFw5xPVusY
	f33NqFNOoQ8jGsG2HRoqhpYwLVRQjOYX2sqzEo5U3MIRoK4FTHP4OuxrNQY6bFUWlJRWlrS5p4JJ0
	FATxjBbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVhHf-00000005Rc7-2mhq;
	Tue, 24 Nov 2026 03:33:31 +0000
Received: from mail-pj2-x09.google.com ([2607:f8b0:4864:39::9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVhHd-00000005RbH-0Qzt
	for linux-riscv@lists.infradead.org;
	Tue, 24 Nov 2026 03:33:30 +0000
Received: by mail-pj2-x09.google.com with SMTP id 98e67ed59e1d1-3b3fb6d5edeso746568a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 23 Nov 2026 19:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795491208; x=1796096008; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HtQGXmDLK1knncRVdCTkTy3fQnI6z6mdkboXAFgFAyA=;
        b=tvfj3C6xp18+Q/dbanphNBmALVppq99aqXVd/S9DoDGmdrdTJO2B9O/+QZ47Wv3GT3
         +pWqtUjnM+Vrd9ZyUf7IoywyDDmukl+4Bl1lfzVFDBMbf8pGbNcjwAOFtru6PD2hTwtu
         v0LJ+5suaip4qepQJLkTeJiU3gH0/K608AhuuDSPJ1wQA71mgaU2efA1lENSpaa0xFRv
         fWyCst6JPGRF05xSq+1zwhBTSTQyUY56E/6td7WEalPt5gB0O2S4UO1/fEW2jdJ3E8m9
         PpR3BTioAokLlCfsEUIjKUQ3qOgHfGi0EGSNANXdi2LuKFO5OTspuJc5//dfunAmp4p6
         CLBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795491208; x=1796096008;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HtQGXmDLK1knncRVdCTkTy3fQnI6z6mdkboXAFgFAyA=;
        b=EmrWdYhRuBZ7Qqn1stf/tqBCMbmDaSvWhygaH6YLsNwGDyNOLs7fqSBiSZ33Rta1Hq
         imytG6yqzOnnppHFCG3ciDHtFAVeRLqovEbvJZWQbzkqGutzJIaDiMIehD8EkDbbcX83
         ZURJL4AmwbgLu9fF9ZHnzJvKEdG6g4lBlWN0PpI8//a7womM4EYmj0lyFrwd3Vm72iLZ
         w+ULzT226Oi38T5gUsvAUN4VmwdfdmZGHwAjlSmsyIho353PueCcyOf0eEhnadumUkND
         1WFz/CPedk9fAukxVF2V3XA+2R0g0ZkNSMylZLVZ4IhkLAw9a7kMlEWCHggw2tR/OncD
         6tNQ==
X-Forwarded-Encrypted: i=1; AL+hErF3hHOj1Ebjk19GV+C52v4uKgSOSDR5W/R6cLcv3UXALu9sDREc/pT4H3Zi9C89u2fnD8htH0lzx88rCg==@lists.infradead.org
X-Gm-Message-State: APuU4Z+7F/7lskGn0aVNt1EUL/Pt+4AsbYEFdUKGu2YICYe8KP56AaAY
	jwzKx5Z95ROYc6EIFCmdwQdq4oTxcnOq2tz04OGyFtZSVNfmKU7NZ0xb
X-Gm-Gg: AZFdTZeJ/B6mMsRe7+VSjNAhQAnV2AGWY0nQi1GROW8tqQfp2KNIwy5W2ZVux1j37T/
	ZPvgYTWUkfRph3Z6FmjpxOh26nJHTX5zBdzNr+9U/Waw1G80Omopmok6A6TuWV4Zw1HcyNRpPh5
	L8V3jRqsCTJ5Y9DJWQVMfN3hATZeULdPcwEuY9VHzAGEC7WxdQFMUkoIJ9tDDNT+yvpHEFuPn3H
	XFI5wGVJrpcSHxmMZtfzLCsKnGEDSzM/pI/JEh5xIWP9VKqFuiXeNH4AHOy5qhbnHOCzQvE0Bdw
	Yzdj6LVjaUX9uWeY4hn37aWIhM6U3v2AWRVkaUX9ayw/aFLawpuW1WzgY3AhVX21cWtbTT1Uwsg
	5ElcoxBNxo3JzBdWc3nRpUrln2i0DK8L+atVZgM8++nIPXSUwSCBMTVgVpwheOC7bvSLbUlTajc
	wB23CN4A6AR698DpWq31YGR+PGn5jOkREbeA1Ye1czWOBvWVUSqKbR0kL+fTMCCGSVCZUGgw+UJ
	QnzGLC4V8VBadv2l8q+hCx5tmX76XtHQuUyjCirD05iO54sXHV5LomK9ecr5cf5/me9KUG2A1RR
	VSD7dcTfZR4jjeP3Of0mrmtgdvCa4WMgdNWpJyk4qg==
X-Received: by 2002:a17:90b:2247:b0:3b1:83aa:5b53 with SMTP id 98e67ed59e1d1-3b41c98a1b0mr13226363a91.58.1795491207740;
        Mon, 23 Nov 2026 19:33:27 -0800 (PST)
Received: from q-Legion-Y7000-IRX9.. ([223.86.210.47])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b217a5bsm9122009a91.0.2026.11.23.19.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 19:33:26 -0800 (PST)
From: Bingyu Xian <shanbeeyoo@gmail.com>
To: Andrew Jones <andrew.jones@linux.dev>
Cc: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Quan Zhou <zhouquan@iscas.ac.cn>,
	linux-kselftest@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH] KVM: selftests: riscv: Test the SBI STA shared memory lifecycle
Date: Tue, 24 Nov 2026 11:33:18 +0800
Message-Id: <20261124033318.612773-1-shanbeeyoo@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <av77j8rN593sxIDh@orel>
References: <20261115085457.889873-1-shanbeeyoo@gmail.com> <av77j8rN593sxIDh@orel>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_193329_144510_53E02EDE 
X-CRM114-Status: GOOD (  10.12  )
X-Spam-Score: -0.1 (/)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Drew,

Thanks for the review. I should have separated the scenarios and stated
what each check establishes.

The enable/disable operations are used by the Linux RISC-V guest CPU
online and CPU-down callbacks. The selftest invokes SBI directly; it
does not run Linux CPU hotplug. Hotplug motivates disabling and
re-enabling the same area, whereas active address replacement is a
separate SBI transition. I have reworked the test to cover disable,
re-enable of the same area, and direct replacement of an active
registration separately (v1 disabled the old area first and missed
active replacement).

For dirty tracking, the intended property is that KVM's writes to the
shared page are recorded in the guest RAM dirty log. I have moved this
check into the common per-vCPU test path and cleared initialization
dirty bits before checking accounting writes. main() no longer needs
the added #ifdefs; architecture hooks select any protocol-specific
lifecycle cases.

The update checks now arrange runnable contention on the same CPU with
bounded waits instead of assuming every KVM_RUN advances the sequence,
with a small prerequisite patch making get_run_delay() fail explicitly
if schedstat cannot be read. The revised test passes on RISC-V and
x86_64, and a local control omitting the STA accounting dirty mark fails
at the expected assertion.

I have also dropped the MADV_DONTNEED case, since discarding page
contents does not model migration or establish a content-preserving
backing replacement scenario.

I am posting these changes as a 2-patch v2 series.

Thanks,
Bingyu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
