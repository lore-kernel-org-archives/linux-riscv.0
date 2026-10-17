Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71CCCCCF2C1
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Oct 2026 15:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kvTWLl4G6u3wrXOCSBzoiiIlnGm2VQu3wi6sTTid+fI=; b=5CoV3H+78Tnuek
	CPuw/tRn6XDmwHiumqPa05YWXD7OT7u5Y6X6v/FNSJoOx6BmNHkoXFZZkDu37Wm9g47a+J3RlG02I
	ycIKlT9EpmTTaCXL+RxTru0coaygOTmUaK5fECaxyuJ4+o+BrkyxgrWXik8GwALXQxExB7fc43Qi+
	Xmz4eqjr0oE55PvNr+id0bmK+eNtLXe9zixT02oTvgnjBiKQH8jsClDI89aBMvY+WltKDdyxocAJl
	oeSEs0DJ2HkMu8XsCHpObL8p/GgjfRYuTrC3+d3KE4kmRSJpqPQEZ9G1PC1F6nMNgiiELcpIog9tU
	zqX97dtSC9N9JxYIvDaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI6Hh-00000004sVs-3B3W;
	Sat, 17 Oct 2026 15:25:21 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI6He-00000004sUm-0K2R
	for linux-riscv@lists.infradead.org;
	Sat, 17 Oct 2026 15:25:19 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-530e75d1ba1so7895301cf.2
        for <linux-riscv@lists.infradead.org>; Sat, 17 Oct 2026 08:25:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792250716; cv=none;
        d=google.com; s=arc-20260327;
        b=Fs7f5Cmxdht68l4oyuRt4uYSeAYcDC34q8g7JQVbVQ/GFz5P2U9h5b1C1PquLeJkJE
         CMcLBQm6YSQbuTV0pMhrt45rEb9mvEG0M3kR4IqVoUKivNBci7WYqcZ9GLjrJ9kyii5y
         pBQQ0ssfxbO/TxFWZ/dFPYSLnxm/Hv0l5g0qU6lUNHirVf6D7/nwUdBkpAt6OdJTQPZA
         azPIc3ZEOr3s3y/afLKu+htypdgUT8anb97Jz9qgAsP7hmZbkoluSXRuBQgeRAcN41MB
         +JqXL2kil7cvpQzb1TPqyS+Nq6jod42NdkOByfDCzngl6FeWC6nbm5tgU8rDNhhaCQ8f
         +97w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cBiNZFwCvoEsAVFQ+85lVVDF8nZW55yFDyjuRN5OJEE=;
        fh=n+4ugkQ2l+tobJbHGLmSOqRGZ1U5G/647QCtR7fFjGo=;
        b=kUaUwHl0KzY38R8/yvVR24FWaQ6lZLTIqgNcc6N+vt3ZJ63UnUSquDM1CPe4NMCEwL
         CdKIC8fL89HlN/3Ojq3SQCxdlOyrPsEgZf23Nc6JyTS3cRF5FQyf3s/RyBA6GzV9Etvp
         pwe3M00aAw8Vl4nrCOjCjfO6oy1OsDHDsV2yPmu4gc2pbuPChjQbmY9z6A4kvqvNfMsO
         nv8MBo6X6W44sPhqxCns5s5beENLKasNrogHEdo0EdASN5pUaaQTPNlg6w+v1TDiGU4P
         FYLnAt++YMt3xSSc187+lK349k3lVnNJIfOC8J94+N39HxY0/RCh/reja8zShxSCr0S2
         5w6g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792250716; x=1792855516; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cBiNZFwCvoEsAVFQ+85lVVDF8nZW55yFDyjuRN5OJEE=;
        b=PTznQW5bFH1/LSLOqaDPxujZM02lhDU0K9RB/voeKTNOKxJMGykq3wZ5mpMWUEExem
         eHQTowGQrIVQUzamMpGoYFzVmdgQNxnlrO+S/OeGPH/werUTl0Oy6KfQ3ACRF0qrUtLt
         GFXL9YW2UxQMjeVCCAeQcyjbnxIE9EdSKz5zHtIrMT3bZg1Rha50VGFDhzfC5F3qVqFK
         acEAWVxGv5jYOPDJDLCE1XMBWPD2bp6urRLUJ9Netsba6e89BQsADLzyK/JTIpYFSomu
         s3inpyhK5ig6j1kK2zQDfSQ6zPsvF6KQ5/VbaYZipydU9cL007HKZfATta2kG2ZA8+sn
         xbqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792250716; x=1792855516;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cBiNZFwCvoEsAVFQ+85lVVDF8nZW55yFDyjuRN5OJEE=;
        b=IIaCax+X31+lrx3qifw/G6zEKq2des6evNQUwbrx74USHslO65g2vbEaRmDckz2Bar
         S1NTxdlWLu6cTMK03wmZoTvbUGSRknjInV9QB6Sxg7nd6MKcGskoO4etJikxPay50wYL
         WZsBrNt02zPOaRTJKMnhQBT1rF0RC/azcMFBTxFfO64XdclE6CSoYAS7juImnw1oxVP5
         Iyy+Z8j0dADqAxto15YWGAVodZpDj0K/f1k6J/1aSM3X3BnfXGg+bT+XTxRKsOQprI29
         Or9Sj7NV5e2hs7r1DNplxuZkWmVNaUF99xhUYbkwKU37V9cD05vm/fSsZ2W8OJ2hLyPi
         sT9w==
X-Forwarded-Encrypted: i=1; AKwUvBwtZNFr112Kk7oTzcUwG5UkL7tVioVeFOdzqFDLYx47ajsjFIa18rnexLhG7xcZrnXuPl/cRooA576m/Q==@lists.infradead.org
X-Gm-Message-State: AFq9FYJ/7f6FTxAvQxmc/DC7tGiTvCpCb5BRQKt7vnLUK/w1plwWz1D/
	tYup1s9N4t/5Xh+HBiI7yOhsSPZYfXi8ji2YS00HvCbH9l+sHw0JWHn3wXE2Lxd0VDKYsMzG9c1
	3ANVlDfuAcphxX9ClAnbEKykogJY2+2M=
X-Gm-Gg: AYBFou00apyg41zRBW9+GShcEuoPg0XyX4/9Tmh3Hk8zrn/fZivYpcExk5Ng+/1ts0R
	Hv+ZiNrhZrhc/AonEefS7Vu9581Psvnbe796g2qZKscZI5NzCqzgvCaNmx1GjJ6oSQ4SFBhGOZ8
	dOMeQw4u0GXyKHhh+4y63I1UJfS6ST9LG+av6kO95UUrGCp5vIpWD4unaB0SUxhr5DpgDv2piVX
	m5ZjYfepbdWAfyYsXbR9PfVPoFQPvXTcF8Tqj8XfL0cyMlB0gOG7IBZ/I0Jljeauswd7Nt+qpKD
	4CkkeGpgmzJzfdqqEkPzPNyvOiYgZTGBG9UdaoHK1Q1XaBXcsUtfCuhDP0tiJQg1MEVjA8Mm/He
	AgisulLh/wt3fwZUwClKSfHz3xkp5ShPcPRd/EiXmtVX8Xg==
X-Received: by 2002:a05:620a:2783:b0:93e:d051:8f19 with SMTP id
 af79cd13be357-93f29ced575mr485953085a.40.1792250716444; Sat, 17 Oct 2026
 08:25:16 -0700 (PDT)
MIME-Version: 1.0
References: <20261017110213.46199-1-tharitt97@gmail.com> <20261017110213.46199-6-tharitt97@gmail.com>
In-Reply-To: <20261017110213.46199-6-tharitt97@gmail.com>
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
Date: Sat, 17 Oct 2026 22:25:04 +0700
X-Gm-Features: AclHuK8Bu8EDo40zZmiyUcWdeJAzBkx4-shpMZtTbASYDmEugT246DxrXg3J2Ik
Message-ID: <CACak8wNa-dbNMGO=4U=JpTqSYWdk9MC+DWZS3WxRwuRRvC1T7g@mail.gmail.com>
Subject: Re: [PATCH 5/5] KVM: selftests: Test protection of the ucall MMIO region
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
Cc: Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel-mentees@lists.linux.dev, 
	skhan@linuxfoundation.org, me@brighamcampbell.com, jkoolstra@xs4all.nl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_082518_127335_256EAB6E 
X-CRM114-Status: UNSURE (   6.44  )
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

> +#define CLOBBERED_SLOT         TEST_MEM_SLOT_BASE
Upon self-review, this should have been hardcoded to 1 (to clobber the
reserved ucal mmio).

> +       ret = __vm_set_user_memory_region2(vm, CLOBBERED_SLOT, 0,
> +                                          vm->ucall_mmio_addr, slot_size, slot_mem, 0, 0);
> +       TEST_ASSERT(ret == -1 && errno == EEXIST,
> +                   "Expected the ucall GPA overlap to be rejected: ret=%d errno=%d",
> +                   ret, errno);
This should have been errno == EINVAL check to catch writing to the
exiting read-only slot.

The earlier test accidentally passed because it used a different slot
ID (=2, not reserved) and received EEXIST for overlapping the reserved
ucall GPA. It therefore tested GPA overlap rejection, not the intended
rejection of overwriting slot 1.

I will fix it in v2

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
