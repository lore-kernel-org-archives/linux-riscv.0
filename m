Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB17CC982D0
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Sep 2026 08:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8xWOuH011fYa1LdyqYYvbKs9ExJ4HzTE9H6eSu7UgBo=; b=Lo7fczuyqo1ueB
	SfjW8zrQkLeG1GzJsCDAFfAn3AK7MvPFQ2VjGtEHhwfSPLhdRygx+eKn3lJbYTsxRr6erRke7RP7W
	2VAel/HA4QPnRAl6YemYljJbBLrMSWERuVxDS/EQ4AKOJJrzINxESosOLILksAgiErQElV3SbXxE5
	WPQUQgsmQwv8qIM62gC0CH8ViXdlWEe5DKRlA0RdufvZ7SkiFHwaqBzOX36yG245dLAb/r0KU/iKf
	RWRk1WIT+dM5upI4KzKdd8bYNR+aaOB4J2dky13uhMp/cC0f0CcDNogkArEHrCtkh9gplNCPkjnjA
	IxqD++Bxzb26SUtr742Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Crb-0000000H6X3-0LgG;
	Sun, 20 Sep 2026 08:25:31 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8CrY-0000000H6WG-1SHq
	for linux-riscv@lists.infradead.org;
	Sun, 20 Sep 2026 08:25:30 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-482f63546c3so1574684f8f.1
        for <linux-riscv@lists.infradead.org>; Sun, 20 Sep 2026 01:25:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789892726; cv=none;
        d=google.com; s=arc-20260327;
        b=PsbIrzhBA4wI4o9llSRNQio7e+mHek6++T5wt947sipHxWCBVxxHUDuYMfEgipQD1K
         FzysH2DVMtwl7R2Xc0nA4/rp288CALvEpM/bf0OzS666O5Y4BUJ+QLVclJ6H8gB+Wadb
         LQ5ltD+mqUMx/GKrP05gBv6G93GX/w8Dy7mTahVtMDcGr8zwaG7nob5xtY3+HmSvXxmt
         +lm46mtopAaoZcgeckgTYAAWT1b3fT+wKxEFsSSIrLN0T3FcblNFlucSeFDuOGUZ7sMD
         kBX1AqkVenrFWjSZ2URgN4q1fICbITG1u23WnYaQ13i3n/qhq0SG7gXbnDA/OR1a1PUG
         Jheg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=/v5NR7eNmP+HJUBTR1GLDXgKiaOepq2osnsCYiJw7Nw=;
        fh=ybWVfEE0naupqbEoQpQznjmy6QQbizev29uCVp1qncA=;
        b=CS5R084mxUa+H7g2pzOPy2HWP1ffw1cNXkOcr6Q2I35xvsjzuRVXG57MnNlKbvBvkN
         vct8ItJEqmDFAKxqZVZHen2RHMYmIgECVe3LVYF1cHmQmp5kvV01u1Foe8194PErsbc5
         yx20IJ738wfwfj+ysowu82Zi1DjhW2LFpRuLN4D9EyxEBKrbipbppyeyAdcsL0Em84+5
         dTfO3yXq/GgwwZ2usujurtCIwZe0yDMiawhOAAfGxkzQY41hn8pihsCgLMKeRkC1pII3
         Adq5bXgBEDiS+P9j77a+OdNWS69Ld46+bg9GGWxH7EYrOpKnDRxHhZD2J4GRgJYL8qsB
         ZKUQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1789892726; x=1790497526; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/v5NR7eNmP+HJUBTR1GLDXgKiaOepq2osnsCYiJw7Nw=;
        b=qLzfgZviAQVh43MQ4jVNW5518x6uwPPTt00DJr4De8U5OK9oCcTdW4ugD66YSrg/Mi
         rFQPYHdKXUHa/P+3ziB6Gimhspv5mBb/5s7LF2h9cNW4ziZBHW5+ORWybfWxMnhCh8AO
         8nWLQuuQGAYFTqmNunNTYTgvNKkeO4pg3lXyRwMpuw3cPD0/tKtr5uR0Xr11QJGovC62
         AAP4725j3PqfHRToEAbqn+ErXPuvvjuxdRcb3fcZyVF0KmwIaL5FbHjW8fZc46aInEGN
         4k37nRAKW0rZc7UvY40c39bt8hjsZ/rDGiEEPJirvC8hPUba3XFI+qQ3vog7/VyEn/wS
         pzqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789892726; x=1790497526;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/v5NR7eNmP+HJUBTR1GLDXgKiaOepq2osnsCYiJw7Nw=;
        b=t5HRsx/od0agy6DDGSRfif8Ij8vvSq88lFWpxOABpWpVlt7+PXFkrG5jZZbLQ8BEid
         DpzqpSJi6jYDHsQiYjFtbx4vj0POatB/sVWcvM1JowQhQKCAUklQBCFc+YBYBFNKcYmB
         w8ZUUlRx/QW1oWv2FeRPJqKCHLQJRZRf1Qy3IVNUNEpMkQx5sCNuxpVDQaVJUtyOWPrq
         l+GS48bhjo/e7Gf2WtMSFEjuVNQ3v2KiLsFiaMNhu2VVr0bW9hu9fhcP26Qvhn3E+Lc2
         UruaKdT8ExZXuilGajA5yZdOZeV4Piez9euQANFws70MrlG8vMwyMgfhEVWUOzm2QfRi
         G/Aw==
X-Forwarded-Encrypted: i=1; AKwUvBwVh5IeotPM7F/tXJhDVPF3PGMGweMPd4ZclC4p+UiTPttt8nFeZLGK+KikKOgElPRp1L7J53WdEIrVgw==@lists.infradead.org
X-Gm-Message-State: AFuF++nOB9SzJ7Fw/gJtHttKyGJYDADODD0XByeXYNMXenpbbGa5fkVN
	MemU+BOM1pA4fj4LZ97zdugwFLJYKBHCE3+QFRr0kpOceMA1TW+IoAr3ETk6ql73oA5LpNCxZQj
	fjnU+vjVH83mwV0wL9Vpq0oEugzIk0RyEQshY1lZYMA==
X-Gm-Gg: AYBFou31wXM12vGkkeLDCqigZt5J0NHojWPssz838yRyq7s2uG+iV/xB/vrTr76Rtxt
	vKx1dywhe9RjQI8aUoowXa0VnFwCvmm3WbqYZjD/aFkWAVsc5BGrF8X/JSV2Y1PQzs642ct/XzA
	j/TlXY1ZDV5w0w5DADPXiCHTf8b6ifhq0svv2byefO1hzcVgM9OxhjPIiPw2YZ6HUQ5i//MikfA
	M7V4+w9SXmH0iojga9IQPSA+8cq4UdILPEfKssz3ClMQ6wv7hmL/JoaIG+A8+mCfeA+dBo+Up91
	NP6FxY1REckUXWg1V+ynM3KUuI9GALA6lrJMaC5xGpHzWvMRHFX9nJpQAts6UKgL9dN5gjhIdK3
	NkvGWrdGw538wVdKcwS4YWIA+ybJfD5P1CZ6JNJcnkufpSaMKQDggykTGVAV20J8HjoqK2aWsSQ
	==
X-Received: by 2002:a05:6000:2c0b:b0:487:6f0:8658 with SMTP id
 ffacd0b85a97d-4871e36d031mr10347126f8f.42.1789892725264; Sun, 20 Sep 2026
 01:25:25 -0700 (PDT)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Sun, 20 Sep 2026 13:55:14 +0530
X-Gm-Features: AcwNN1VHoP9FKod9I1ZhoSlWxL2KyjBkIxPhBW5MLSbl95fW79rnRDNl-xpnew8
Message-ID: <CAAhSdy2MbSq2eGDZfh_EKt2S3OUEn7tJRWUgvncPsWNVR7vqeg@mail.gmail.com>
Subject: [GIT PULL] KVM/riscv fixes for 7.3 take #1
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Atish Patra <atish.patra@linux.dev>, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
	KVM General <kvm@vger.kernel.org>, 
	"KVM RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_012528_406044_2A3B9104 
X-CRM114-Status: UNSURE (   8.25  )
X-CRM114-Notice: Please train this message.
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

Hi Paolo,

We have the following fixes for the 7.3 kernel:
1) Synchronize hrtimer during VCPU teardown
2) Fix the conversion between vsip and hvip values
3) Serialize IMSIC attributes with vCPU migration
4) Release unused page after MMU invalidation
5) Propagate interrupted G-stage faults to KVM user-space
6) Fix NACL hfence entry update order
7) Fix sdata leak and stale snapshot_addr in PMU snapshot_set_shmem
8) Preserve firmware counter value across PMU counter stop/start
9) Report PMU snapshot write failure to the guest
10) Fix perf-backed counter accounting across PMU stop and read
11) Fix HSM hart status error propagation

As you can see, the fixes are all over the place except quite
few of them (4 fixes) focus only on SBI PMU extension.

Please pull.

Regards,
Anup

The following changes since commit fd73f4a6659897191fa0d40695fe370925dd3780:

  Linux 7.3-rc3 (2026-09-13 14:38:02 -0700)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-fixes-7.3-1

for you to fetch changes up to 41e81f7e3ef96594fb840445343c0ee7723aa550:

  RISC-V: KVM: Fix HSM hart status error propagation (2026-09-15 18:55:51 +0530)

----------------------------------------------------------------
KVM/riscv fixes for 7.3, take #1

- Synchronize hrtimer during VCPU teardown
- Fix the conversion between vsip and hvip values
- Serialize IMSIC attributes with vCPU migration
- Release unused page after MMU invalidation
- Propagate interrupted G-stage faults to KVM user-space
- Fix NACL hfence entry update order
- Fix sdata leak and stale snapshot_addr in snapshot_set_shmem
- Preserve firmware counter value across PMU counter stop/start
- Report PMU snapshot write failure to the guest
- Fix perf-backed counter accounting across PMU stop and read
- Fix HSM hart status error propagation

----------------------------------------------------------------
Myeonghun Pak (1):
      RISC-V: KVM: Synchronize hrtimer callback during teardown

SeungJu Cheon (3):
      RISC-V: KVM: Preserve firmware counter value across stop/start
      RISC-V: KVM: Report snapshot write failure to the guest
      RISC-V: KVM: Fix perf-backed counter accounting across stop and read

Tan Chi (1):
      RISC-V: KVM: Fix HSM hart status error propagation

Xie Bo (3):
      RISC-V: KVM: Serialize IMSIC attributes with vCPU migration
      RISC-V: KVM: Release unused page after MMU invalidation
      RISC-V: KVM: Propagate interrupted G-stage faults

Yicong Yang (1):
      RISC-V: KVM: Fix the conversion between vsip and hvip

Zongmin Zhou (2):
      KVM: riscv: Fix NACL hfence entry update order
      RISC-V: KVM: Fix sdata leak and stale snapshot_addr in snapshot_set_shmem

 arch/riscv/include/asm/csr.h       | 20 +++++++++++++++----
 arch/riscv/kvm/aia_imsic.c         | 11 ++++++++--
 arch/riscv/kvm/mmu.c               | 10 ++++++++--
 arch/riscv/kvm/nacl.c              | 20 +++++++++++++++----
 arch/riscv/kvm/vcpu.c              |  3 +--
 arch/riscv/kvm/vcpu_exit.c         |  2 +-
 arch/riscv/kvm/vcpu_onereg.c       |  8 +++-----
 arch/riscv/kvm/vcpu_pmu.c          | 41 +++++++++++++++++++++++---------------
 arch/riscv/kvm/vcpu_sbi_hsm.c      |  4 ++--
 arch/riscv/kvm/vcpu_timer.c        |  5 ++++-
 tools/arch/riscv/include/asm/csr.h | 20 +++++++++++++++----
 11 files changed, 101 insertions(+), 43 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
