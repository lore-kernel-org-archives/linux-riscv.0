Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DABC6C7EE24
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 13:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s5LqxxpFVCjPfNdoxB3TWHJj9h54K0yGxDCMBztb/JQ=; b=ftRCZHF8DGCT9K
	UZZHhiCM5G2YA/rSmZWBnlwy3ASvi7lx2Ibf0rE3Q+BPFXlr+aqX0w/uQrWGIJgcWnDhy6wkEa4mA
	hx/rix4n/hghtWJudy+fJky3Pd5Sm/ZcDftEJ3WGENyXWn8q1MkX3ZrHzX5FpdfCPRX5FKYwofO7e
	YAFedIG+s/6mnPJadoqxZPM/D+jghgZBLQs70cmY4GQnYPqHn8AEiIrK5a468C6VMhsJAS4oR4bte
	TWVz/YTr9h11MTGhyb07w96qdAIrGaMbIvf2FFxXf1U1IJwA5pclXJP8XlSHldJI2JbZluo5hwITl
	74w1RhUm0q98lEje6h3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwMxU-003Lsl-0K;
	Tue, 09 May 2023 13:00:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwKeR-002u6z-1i
	for linux-riscv@bombadil.infradead.org;
	Tue, 09 May 2023 10:32:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=le6WsiFFpntTNhwR6ZdThyFuzfVMTXPYkTAyRr8nwRI=; b=p3A2jjPtcJgh+fFvceNXxJaCnv
	+0NX0cnrCZJ01Nz6UqxyxonL57m7QDdsL/qi6Uc2euWPPKRDv4brn8R4QQtNHA9z4D3ba2BvkwRmR
	pBSZwU1x+nOZ+KwAuxWqg908SRgtaawBmRGoNd0iVIWjawooBSoYSYfRI12inGilE+vqav3OgFJcR
	z3UWkj3tIhEcrhDRPbkiuw2mb14ky5mZfK+2B2GQtMDmvU2n8kL6cH6NvlRg1qW3weHTn0IcuKgGW
	Po4o5c7RxnHaBUlg+AXlXQ1hZYotfsNSs+SA4eciclNMdCBGpNZ0AZOlAqyQqEUYcOCCy08ELO2kI
	o5yesJxQ==;
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwKeO-00667t-0q
	for linux-riscv@lists.infradead.org;
	Tue, 09 May 2023 10:32:58 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1a5197f00e9so40114565ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 09 May 2023 03:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1683628374; x=1686220374;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=le6WsiFFpntTNhwR6ZdThyFuzfVMTXPYkTAyRr8nwRI=;
        b=dkcYXwuoWC+sWSXkRa1UkLXyr+4XeX3wyrwCnJW1m4VUC31Sc/0XGayn6JJ/j/cD00
         9NAkxSPLSJk8NztvhxgyuIEcv6aGgxydyzXNVJqsi4T9U720OmiUDVYJYJKJZZm/J28Q
         ccwMzjTHVkzXDsF6ftKJiOuAIDQ9YAaJPwkwricp2/BqNbsYPzJEeYqo1PgLdkkB526W
         +32RH0S3cb7fUOpmYREceNRXiOsChWS7gHaCG2oNdLGikKclVjo8rLiVhPI/cvdloWvF
         8KJx8n0bHIpvthsrQUCP3ToQIiDIkwiI+jpMJ351x8X8DkDyWa1i9VnYlHnBdFAYfSOY
         io/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683628374; x=1686220374;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=le6WsiFFpntTNhwR6ZdThyFuzfVMTXPYkTAyRr8nwRI=;
        b=ejOkUbxerHwfeviGD0oi3Phi8kDH2kjLLBEsh8lVLay1QK8pGNLKtMfDUyeoLgwXz1
         p9BSTJUmBzAZ8UysGevjcAegIk/p8v0BCAPYs7vly72X0I0B1Wj0hGlX/7xV+j7dbqMd
         swYth+w/c26u2NCYcqna9QgFctf2CpoKeWHLhx71FT542xrOyyZ6zjAyIO2KjZurD7YD
         rNh0zeOujpCpUr6dsC7nSdTGiln+vog4yQ3v+7u9k7mEqW0gNaOeQmA/OMdCk/9DWPmU
         OcZAgZmdb4wUBCslFZt/tFXi3o7gcq9MgpOXAB6qZvaa0tsyow6q52Lp5PlOhpfjeQoJ
         tW+w==
X-Gm-Message-State: AC+VfDymoGAKDuQKn6f/zHQXpUg7FI3JburQHUuoC/JxXL29Bwx+Tm1G
	w++BE2F6oJdKeEQszo4bdEynkjTa6sbeLI9ohgjfxkqkxW5ulhIEsjedaSBVFtCuu8PrJKanm6K
	GoIf9l1WiMl95gTOjnx881mO27atT/BdQfhvPE4wPha903Az7vSsnpz+48EE7dKI5Bv+bnYB/sE
	bWbeaCOm3Y4PDx
X-Google-Smtp-Source: ACHHUZ4foWCrYcy+o18/SjgL1rsvMsKKMsfLDxh/nHILJosxokD4padIvzV9kYiYkeuD+KnqM3ICaQ==
X-Received: by 2002:a17:902:bb8c:b0:1a1:ee8c:eef5 with SMTP id m12-20020a170902bb8c00b001a1ee8ceef5mr11531654pls.7.1683628374212;
        Tue, 09 May 2023 03:32:54 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id o11-20020a170902d4cb00b001a076025715sm1195191plg.117.2023.05.09.03.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 03:32:53 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: vineetg@rivosinc.com,
	greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Bresticker <abrestic@rivosinc.com>,
	Vincent Chen <vincent.chen@sifive.com>
Subject: [PATCH -next v19 16/24] riscv: signal: validate altstack to reflect Vector
Date: Tue,  9 May 2023 10:30:25 +0000
Message-Id: <20230509103033.11285-17-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230509103033.11285-1-andy.chiu@sifive.com>
References: <20230509103033.11285-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_113256_549354_84A707DC 
X-CRM114-Status: GOOD (  10.73  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Some extensions, such as Vector, dynamically change footprint on a
signal frame, so MINSIGSTKSZ is no longer accurate. For example, an
RV64V implementation with vlen = 512 may occupy 2K + 40 + 12 Bytes of a
signal frame with the upcoming support. And processes that do not
execute any vector instructions do not need to reserve the extra
sigframe. So we need a way to guard the allocation size of the sigframe
at process runtime according to current status of V.

Thus, provide the function sigaltstack_size_valid() to validate its size
based on current allocation status of supported extensions.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
---
 arch/riscv/kernel/signal.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index f117641c1c49..180d951d3624 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -476,3 +476,10 @@ void __init init_rt_signal_env(void)
 	 */
 	signal_minsigstksz = get_rt_frame_size(true);
 }
+
+#ifdef CONFIG_DYNAMIC_SIGFRAME
+bool sigaltstack_size_valid(size_t ss_size)
+{
+	return ss_size > get_rt_frame_size(false);
+}
+#endif /* CONFIG_DYNAMIC_SIGFRAME */
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
