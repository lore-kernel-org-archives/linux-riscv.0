Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FBD3C38142
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jan 2023 19:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8RA1i0EE1+921f/GGEICExq0UPSDJOm+sDqHBJm+xTA=; b=2w3/sN1sCiDZtf
	cejWroUjji7VtKVZ3V5W57l2kCa6w36gCiymlzwzqwt8naKdi9nVTLgMtEsUUxswo6G/J9HHW7rDD
	QaOFbHNZuTgMTMXmKKf8h8eVpHEq2KUINuiq9JMnL/FS0RhmMTSdFW+Q+J7KJ6ykvdLKvxCvx3mpW
	gCBuDCMWkKavtkiaaWNk66eOrhA1M+VlVxxIjItoKwFOGLgLAmT8HIaL0SrEV7dbaUx/+7MvyI84E
	U0z2MUaNH+bP+2+jQshmBkR0l+GKpfnFCSiFHlXlVpno9hKh9wrSLASsos+7PkaeyMIFwF1rRcZBu
	gGqqBQ7oCYrYiQKkTL+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLTzg-00G5g3-8m; Fri, 27 Jan 2023 19:02:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLTzd-00G5dY-DJ
	for linux-riscv@bombadil.infradead.org; Fri, 27 Jan 2023 19:02:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=VYOVEt3jt/KSlQQ1kq4H/LNDYTWOBqHX+UHxFdJqK+A=; b=ga4T7iR3AW6Rmkl2+grRmnQ6WP
	t/yKA9DuD9OVRyoNSLbvrAw7oohYd9bzjLNfTRMiFbz3balstnCqvbhzhLj/vvuwC9Y1AaOrjjGS+
	b77NDcNF/FfeEcOQuluVM/iDchKf9D8Vp+n8luFlbWVXUumT2ndSUxZc4u1TGGKGtHxcO37QctNKh
	OAx24ZpIGCZdcjpA+aLyd8yh3Kfz6O2yZS9MuKnfMNSh/aZKcR2fLHWG8YT7yJPGh5U3F9K6mUde6
	plunFwqiPFmtaciCShCTenspC0gM5VB3iujYrJQoUC+rqL4bDGCHGslmGKQOcvmFGAmQ6r1hpS3qw
	5bNAXvoA==;
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pLTQE-002vee-21
	for linux-riscv@lists.infradead.org;
	Fri, 27 Jan 2023 18:26:01 +0000
Received: by mail-pj1-x1031.google.com with SMTP id nn18-20020a17090b38d200b0022bfb584987so5533493pjb.2
        for <linux-riscv@lists.infradead.org>; Fri, 27 Jan 2023 10:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VYOVEt3jt/KSlQQ1kq4H/LNDYTWOBqHX+UHxFdJqK+A=;
        b=kmh1lQGUzNyTV+SJvoAKXkHkMGjivjZAJea6T5Hr7EIlrPYBaMWMvcEiaLpqyM/KtS
         ePUoVDqeA8FMW6jaejIY4R3VgjOlyByf9TehWXCybvPMj+3uRjKWKop61ca/PFAC6MT4
         u3APAiin9cC4fpcKBa+GtGHu3seYOHxtbVJgMIUBvfzxemER3gL+mJmlsb0jlsOtQ+oS
         uOR1c9hgmjpmrfdg2V/+etjez1klBx34/ATu64GSwu4Arvg8fJLRv0JOESyyZq5JJ4hV
         TMtYAzqqBm3p15eDA0DYzPXUxJxBvUsdN3ACp+QtTe86hJ8JnVWhd0xd34wW7zvkSCt7
         3xuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VYOVEt3jt/KSlQQ1kq4H/LNDYTWOBqHX+UHxFdJqK+A=;
        b=3SnJzpNI1/ja2FS3Q1PxUR7QUREq48++HBfARQ/BcXi4lEbjIrgRLK+v/xQ0JKrPIt
         /ubMoNYncAeGfVKH+LcwKq7UuugCLd+4no9q4YTB4gZdjb6Mvtg2xaqba4HHZquyjcAx
         th3A4qUTLaNtxN0U2caxwch/It+EEs3OF8GgRGgyYB6G0k6CiKeDDrqaDZAMaVp3KMER
         a+qYkUCg+u16Th2ZqKk1hieEm+dGEd4WZriju3/dPpxUoGarEB5bjKVYwwwV+GtZ+9J5
         Ppqpj9jH/ayGx3S39XTJJabbXiCqkYTaYUwDDZBkbEf9JUhtxXz2nth9m3EIttiNKvGb
         1eYQ==
X-Gm-Message-State: AFqh2kpadJtPd4isfX5uRbhuDaW7pyMQ5Ji8y9GnsjxH2fm/SMNNFrOA
	kpRU/+LSi/XOo4HjyTJDMq0p5g==
X-Google-Smtp-Source: AMrXdXv28M1C5TJfJZfYHoZMjXL4lC3hCwkbE2KMfgzJPjpOMAP1NeiIdUKuchXc6Zc48jYRIYXapQ==
X-Received: by 2002:a17:902:e811:b0:194:5066:fc20 with SMTP id u17-20020a170902e81100b001945066fc20mr51140337plg.40.1674843981856;
        Fri, 27 Jan 2023 10:26:21 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jc5-20020a17090325c500b00189d4c666c8sm3195219plb.153.2023.01.27.10.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 10:26:21 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v3 09/14] RISC-V: KVM: Make PMU functionality depend on Sscofpmf
Date: Fri, 27 Jan 2023 10:25:53 -0800
Message-Id: <20230127182558.2416400-10-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230127182558.2416400-1-atishp@rivosinc.com>
References: <20230127182558.2416400-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_182559_086216_6C94D0DE 
X-CRM114-Status: GOOD (  11.82  )
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

The privilege mode filtering feature must be available in the host so
that the host can inhibit the counters while the execution is in HS mode.
Otherwise, the guests may have access to critical guest information.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu_pmu.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index d3fd551..7713927 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -79,6 +79,14 @@ int kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu)
 	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
 	struct kvm_pmc *pmc;
 
+	/*
+	 * PMU functionality should be only available to guests if privilege mode
+	 * filtering is available in the host. Otherwise, guest will always count
+	 * events while the execution is in hypervisor mode.
+	 */
+	if (!riscv_isa_extension_available(NULL, SSCOFPMF))
+		return 0;
+
 	ret = riscv_pmu_get_hpm_info(&hpm_width, &num_hw_ctrs);
 	if (ret < 0)
 		return ret;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
