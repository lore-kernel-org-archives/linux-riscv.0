Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F9EBFF8875
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Apr 2026 12:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eeIf2tzmZXACSiGV6gyXbOPBjCSIe5KDGMtUAoVK7bE=; b=kKUd9L623sIl6b
	Z0i+i1s27s57RXki/wG3/dZWKQx00sBwJoReJy+mWRGVcDUucFMGjR9qo2tI68i28WCxXueSwZ5Vv
	OKpQ+E1ZMtS/FTFm+ehBlEt6Yzf9Y611UoTZHiPm4aBQmyXo+f5gjBw4xDy02/4UpjO0nm1BydDj4
	IZTf1Rb5JpOH6zPVsC7C+Rp8tKv0XbYzYfwIBjGXxYthCz8pG73XYPuWtTbA27nb1MYqFQB6BI4oA
	ClQPpWyXnZletv5BC9oCeUMCBFNN9hmxNVPyjG3eZYYztAUY/yD7/vEUu+xrW1BW5EGHCvrL1d2LD
	7ncPPoP68wwLFSA23RfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI48a-00000003ZrS-4BY5;
	Wed, 29 Apr 2026 12:35:33 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI48Y-00000003Zr7-1v3l
	for linux-riscv@lists.infradead.org;
	Wed, 29 Apr 2026 12:35:31 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-35e576110adso591900a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 29 Apr 2026 05:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777466129; x=1778070929; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JgQqfgYWSA68LM6eambu1VWNYKMusGRf22zT6tQJHig=;
        b=Pbi6qGbFMyEthsRI4zZfDEOmuTW6Jjiue3XJOKmm43BT178WmUq+/NEu7AtAGsa0zK
         tKXJmdGMcH7oXcmQahMr3E3VtrKyrDX3EDg88Lzcc73IP9nSv7XcgSiL7K3834zADz02
         NxNs0LaatTIR3R+RkGth904LZYq6wnEboZGErIS10DvogylAXIb7T91+yVAOgXszOl9G
         VcFaaISiE8Ma6Ktx66/9BJIwCKlCo6AG1ZWzEhelDcD80HcmR0j+yAlURo1QqyJ9K7qD
         lbUvixBbGwsxzliIUBP+Gt+HIKhbsGe1FLsmolidyh66rPWe2bDNVXd/kDSkv2M4rPQL
         Hohg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777466129; x=1778070929;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JgQqfgYWSA68LM6eambu1VWNYKMusGRf22zT6tQJHig=;
        b=mwHPOLZYghYH3PT2jdbxsjq2W3s97NaflTo3yGcW5jTgXsh/QQujdU7IlBVaKeIR80
         vENG9/KHhP7jrWW34MWt+ahf+FFfmx/oUrQxolT2WyYYC2I4MEG3ZCWFCmVxH0AgyfcP
         xmD+YeckRy42j9NX+I1agc/KdBpkAuKowFRqU8RZzGFYhyc6ixfjqKgIzxhDoJHJUA8T
         pLlpKnTehOwmavRx73XfFvEEVSg/E32mQZvq3PJ4dQnwI5wV3qfTLudS0iCN4g7HZDeF
         UAVsHGLWpY75ueGe4UUYUmkleFEU+xTOPrwkaIyOT3dls7djLs/+tbQ7g58r+psRugv0
         mjHw==
X-Forwarded-Encrypted: i=1; AFNElJ97ZV9hdgYlY8It2G8ikwgpWyrE6nNK24OViZgERgRyaxX7eHLffwKmZ1dm+1nalEUBMNKGEK7rj1iJrw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxhS4Nd6f6yBfMa8ObtjoM5budEKTg7IvzFBCaz5v83EgiueBLz
	+sw2EvHzR9lnIODyrQ/h6c/5pEC0pdnRCfz3doPpXIT9lp3N5qFwjRdI
X-Gm-Gg: AeBDies8f5oym+hNlre7P/6CepMFWWZ9bjbhU2wG8BIHU3YPF4gt9VW0WoJkqyD/FDr
	MwTCUay9bL/7UXkCkjNEm7aaXeqAEEN6GnAqPKKVYFSSNCKMTjb2LGJmpmY7slqR3BzPHPRrb0Z
	x+GqRnVaL2O97Vo/v0oqiakcheHC+OWW+aPfofE0ogHnBdh15sbgaRy4ClWlH8v8ajrbP9LeRqX
	wlyfupGSAdXJWLqjEfzLDUlppmFWABvMYHXf/jF4EGboGfM2fdok7X+KiOMn7Cq8jUMOF74bCio
	TzGx8npB/5xA/XfbCDsl0EbPmwW6N1cNBDntAsh5BiloULNek+TdLQCtBMMxlgfJ6h9vtqi1AIP
	uMV7WJFJ3eo2XNDLKFdZI7hVGlyFwEcmVjgfiQMZeDTlGLj7C9+pLJyo04R4JV0IinJ5LQDT0S7
	zm/QJh/oVlOyX2rf8ZuW0aME2D/USVrtzIfAdmCVWAKg1/C9/ZqzDWQfWSaWsMjKvledMJyBFUp
	EMOz7F0vikzbeTpPQghpcCaAI1A79Bi8PlTkVnqHyLg
X-Received: by 2002:a17:90b:2711:b0:35f:bc9f:e1b6 with SMTP id 98e67ed59e1d1-364a247db58mr2292751a91.1.1777466128927;
        Wed, 29 Apr 2026 05:35:28 -0700 (PDT)
Received: from visitorckw-work01.c.googlers.com.com (32.237.80.34.bc.googleusercontent.com. [34.80.237.32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a419c9a6sm2261855a91.7.2026.04.29.05.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 05:35:28 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	luke.r.nels@gmail.com,
	xi.wang@gmail.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	alex@ghiti.fr,
	jserv@ccns.ncku.edu.tw,
	eleanor15x@gmail.com,
	marscheng@google.com,
	bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH bpf-next 0/3] riscv, bpf: Fix signed operations and add 32 bit atomics
Date: Wed, 29 Apr 2026 12:35:10 +0000
Message-ID: <20260429123513.3477780-1-visitorckw@gmail.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_053530_504444_341135DC 
X-CRM114-Status: UNSURE (   7.62  )
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

Fix miscompiled signed operations and expands 32 bit atomic support in
the RV32 BPF JIT.

The current implementation ignores the instruction offset field used by
the bpf instruction set to specify BPF_SDIV/BPF_SMOD and BPF_MOVSX.
This causes these operations to be treated as unsigned or
zero-extended, leading to test_bpf failures. Fix this by checking the
offset and emitting the correct instructions.

Additionally, we leverage the mandatory A extension to natively support
32 bit bpf atomics (and, or, xor, xchg) by mapping them directly to
amo*.w instructions. BPF_CMPXCHG continues to fall back to the
interpreter.

As a result, test_bpf.ko now runs with 0 failures, and the total number
of successfully JIT'ed test cases increases from 843 to 902.

Kuan-Wei Chiu (3):
  riscv, bpf: Fix support for BPF_SDIV and BPF_SMOD in RV32 JIT
  riscv, bpf: Fix support for BPF_MOVSX in RV32 JIT
  riscv, bpf: Add 32 bit atomic operations to RV32 JIT

 arch/riscv/net/bpf_jit_comp32.c | 98 +++++++++++++++++++++++++++------
 1 file changed, 82 insertions(+), 16 deletions(-)

-- 
2.54.0.545.g6539524ca2-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
