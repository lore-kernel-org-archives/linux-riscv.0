Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 298C3C79F85
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Sep 2026 19:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ln6NiHPmc5qSRzUJUadVCHRiL9rFuCpyx3Ij26XlnaU=; b=mFSGYU/5OXSRZI
	TNhuVmXZLvq/TUydqFoXY9+/BhK8tHRi530h7asVf/yRqC2xyImQAWhSs1DwonnkOzZE74b/ryqk3
	TQLSUusCgFxJa3IdbaQUpVviRFLxa3Z9fUUbhaKTeP0x3LjFKuVPZUdYNCEPuwCHwUOAg4UftsAOX
	NzBXP6/yt2k2TKyhatUzY0Dq5RmngKkdw/L+4zNgSu5JWeBXl/7wYJO5eoRRyqql7CVb078BESQTY
	/6Hd31hWj9xrEKeWPa6/l8jiw2Yq7AadyaiQrNcJ3tVjwQRi958pVCa4H6miKjHZgg1/R9Ed7cCac
	QIlHSKWhmc05UOB5qcDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Zws-00000003DA5-3zK4;
	Fri, 04 Sep 2026 19:51:42 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Zwo-00000003D7U-1N8Q
	for linux-riscv@lists.infradead.org;
	Fri, 04 Sep 2026 19:51:40 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-853c07a76adso1276437b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 04 Sep 2026 12:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788551497; x=1789156297; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+qDNedZBe5IOgOVXUT3YGJ7aNww3Lf+ZOsFiBHpPGIg=;
        b=Bc1W/u7sPoUtI0cYB2bJSjSdCpzfcH0OWCgPuJXzERZwk31xCPjR1R9wkkpRXXAEYa
         WIzuAWtHYOOgVmSuKkfyPWGzkWDClbIG0h9tU0HsWLDIu4IsXN/cuqbuA2ltedOTnI2y
         9mVZ+pp2D5RBJfZFUYpP1gsmMX+C3TXW+XRER3sWlrm5q4H5tcY23o2DGORCfZksjr7F
         v2AcoRupUJu85VWrDB3FDqtLIMiwXLJOKivMXjGL0l1Fq7Mgz4kHkw/CHkPdDA+ytnaD
         kWQ47/5jUT1HW0BAgBQGukvzzOuhYx5bNLZ0GSGfadefpLOo8cpdDxD558daCaIAgksF
         3TNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788551497; x=1789156297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+qDNedZBe5IOgOVXUT3YGJ7aNww3Lf+ZOsFiBHpPGIg=;
        b=OABftN8q4n+sAmoL3y98aYU2u+3IGvOKZxJY+plcF8VVmg8OTPN71eS9zN+/VI5WI/
         QjhvFV9V0+so/1cRR8iDgC8txPhcPeSXYC4Jmi3HDB7fz54i41g2LGv1YAspzMUCpavP
         xKoUW0r7kGMDktmQzvf3XGs4EkP8lSUlShlsy+KPH4xldte5VaXFeS2KEzRcCgm1h0nu
         I29IO+KhP1G4MR91mdNSXsjo2dVuV4DRCZu5cCTtT36jHKwHk5rPcCD/4CeJ7AzFKx5r
         9MZ3uaMNlw8VXjt6lRRbP3WGNQ23A36l3UqNZ0KFZwAHNL3VEemhT71SiwjH8ycbrh+Q
         kdAw==
X-Forwarded-Encrypted: i=1; AKwUvBwHMZgG/p3Vh1zwj/r5y8VA176TL421GiMxZchk2VkDFt3S67aM/+0DwKFe171NcNVywDH364hTK9UrGQ==@lists.infradead.org
X-Gm-Message-State: AFuF++nFDz2u4WdMnBLEcbtTbv5fcAlWvmblEOYBxxOGkc1ADp1SzC3G
	OHk9d/CTZ0ocMwKDROOiF6qg7Y/XWXY6KBJSwpVB82Eok96yzi0T0cju
X-Gm-Gg: AYBFou34B1DoPeeZ+66MchqbI81jH6Y309CBThwyKNHTsrcgrVsDgMrAoGfyZJVrq5m
	+x/y+LFl9CPoJpViljHEa2indEBKarn+SQu2iYYxATc1HrO6PiFQsE37Tf88GjJvKxSqGooAAp/
	OWGvP3McM1jDnLfqcgT+GOZrP+pRX9qJNGBjwJwg3nlW/eztYSW+6zuekc9p4rRPOAaWnNzlc2A
	Ne2zhke7Qdqxh8sxJMIiMSMnJ1MbNen6hu/2u84h2whvJpgnJBz7OF2lSv/aoY15Xt2IZ4gmwjx
	TxWRpYAmyPzHzfjFgS/Hqw5qdETlS+jZnx7K/h4CDZklRrzSGY95uX4WNghG3UcKDfm+Qa0v7qm
	mk/lP8uJpfxWjMNfHqUr9rJquPtKqacFWiBnaX43vwjhUUPY/AQLFUd6t4BYPDHaKZ50OQd7hEU
	fwq9QwdkAWIaDY31H29I42YxOA4jZH+gt+0qRJIhJ0JV/q03+D/p0Pfw72blnqj/Pu5Tm/UWJ9E
	vPi364i24s5H324TC2bMOphGVlPFbv7QMOmB6MJtAX+4AMpF5fVG0oipo5Wl1qTY6QdrG84I2sc
	+453OjKcMarqY20U+NMisyZxaplg/FpWLTgm1l/YggJlzU9q8z2KYfrlsB6klQI5nHd7LOynAIk
	=
X-Received: by 2002:a05:6a00:3007:b0:846:4d4c:23f8 with SMTP id d2e1a72fcca58-861662d4c34mr11674869b3a.1.1788551497395;
        Fri, 04 Sep 2026 12:51:37 -0700 (PDT)
Received: from sid-dev-env.cgrhrlrrq2nuffriizdlnb1x4b.xx.internal.cloudapp.net ([4.155.54.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8615404876fsm1497684b3a.59.2026.09.04.12.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 12:51:36 -0700 (PDT)
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
To: bpf@vger.kernel.org
Cc: Siddharth Chintamaneni <sidchintamaneni@gmail.com>,
	Jeremy Jean <jeremy.jean@oss.cyber.gouv.fr>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Anton Protopopov <a.s.protopopov@gmail.com>,
	Puranjay Mohan <puranjay@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	rlmenge@gmail.com,
	hargar@linux.microsoft.com,
	apais@microsoft.com
Subject: [PATCH bpf-next v1 2/7] bpf, x86: Use resolved pointer for timed may_goto
Date: Fri,  4 Sep 2026 19:51:27 +0000
Message-ID: <20260904195132.141068-3-sidchintamaneni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904195132.141068-1-sidchintamaneni@gmail.com>
References: <20260904195132.141068-1-sidchintamaneni@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_125138_363737_C031FF7B 
X-CRM114-Status: UNSURE (   8.10  )
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

The timed may_goto fixup now passes the resolved counter pointer through
BPF_REG_AX instead of a stack offset.

Use the pointer directly rather than adding it to RBP. This preserves the
private-stack address selected by the JIT through R9.

Fixes: 2fb761823ead ("bpf, x86: Add x86 JIT support for timed may_goto")
Reported-by: Jeremy Jean <jeremy.jean@oss.cyber.gouv.fr>
Link: https://lore.kernel.org/all/20260824213158.3755932-2-Jeremy.Jean@oss.cyber.gouv.fr/
Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
---
 arch/x86/net/bpf_timed_may_goto.S | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/x86/net/bpf_timed_may_goto.S b/arch/x86/net/bpf_timed_may_goto.S
index 54c690cae190..6e9d9e7c2b1d 100644
--- a/arch/x86/net/bpf_timed_may_goto.S
+++ b/arch/x86/net/bpf_timed_may_goto.S
@@ -11,12 +11,6 @@
 SYM_FUNC_START(arch_bpf_timed_may_goto)
 	ANNOTATE_NOENDBR
 
-	/*
-	 * r10 passes us stack depth, load the pointer to count and timestamp
-	 * into r10 by adding it to BPF frame pointer.
-	 */
-	leaq (%rbp, %r10, 1), %r10
-
 	/* Setup frame. */
 	pushq %rbp
 	movq %rsp, %rbp
-- 
2.43.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
