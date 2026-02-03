Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1249AE83057
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Feb 2026 05:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QGOhrYyHRBlrFQpPWzPR0hzX0oRw8rLqY9Pi4X25iCo=; b=RmJGpmSHjcIN6v
	EhOjCxuAYIu6gCHNKbL5oCHRJiBbOem9kuzk3+1khBum+i5J3hag/noHjHXF7EqQnKEpOBd/ksrkH
	lh1cJkjmyIKQW3wlRlpS9pOhxZGu6mBLWUICsRKYzrwU1toS7RErcMQkrP/PbkeJJHmAxP2aXQwm+
	nHAbscJgUUy0Gz6sbJ90A6KRczjXU+N43hEiJ4ZyH6DSMqaHTjJeNbETT8ErwNs0z+Uohw8s8mzBS
	4Pj4d06SgPrXEprRvPmVB0O2C1LD1WxtgJq1NUQzNETOL2QSI69ckUQM2Q3gqUUqQmzzKatM6lgZD
	MMVHgXimL55HCMDuQTaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn9LI-000000068vS-1opN;
	Tue, 03 Feb 2026 05:52:52 +0000
Received: from mail-qv1-xf44.google.com ([2607:f8b0:4864:20::f44])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn9LF-000000068tc-1Yr2
	for linux-riscv@lists.infradead.org;
	Tue, 03 Feb 2026 05:52:50 +0000
Received: by mail-qv1-xf44.google.com with SMTP id 6a1803df08f44-88a2fe9e200so50035996d6.0
        for <linux-riscv@lists.infradead.org>; Mon, 02 Feb 2026 21:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770097967; x=1770702767; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JBKc55eZpoTToABEyoP3jfOIFdx9NoLGQDjzruIsB0U=;
        b=lkwBL2PeX+t7OlZ09ApZWWSP6LZfxEIouZXNvHr6V9Ss8aD5jt3samULVmdoFLBZHb
         ePRtoaj8kAKF3GzV0WBaLDW0/uH6eBtylAH327+c3SpwEbxEBcOfDjwWRVIUBmdIRh+b
         rKPFS5QUimQO2+N29W7jWLRQCdJoQGdHHsce/Zp+FUPIU0S8TRyC0zMKAGHoEW1gjKAw
         p99S8h8pOp/TQDide5HXhViG6h3mwTwtHoURa4pgMwEahBb3Z3T3RqCtqJN1RM0APmKD
         cRpCnipY2WVuG/Us5dDUyGp8XcjJAoCBcNRHhH/8HQaugBIOQsEoyXU/snR7/hdiLZCz
         4Q9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770097967; x=1770702767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JBKc55eZpoTToABEyoP3jfOIFdx9NoLGQDjzruIsB0U=;
        b=VnsRimeTBClThfRGugUMLcb/2Erzf9WOmig29HG9lgA2BE+Ebr38ZlYNqaKZjLTxiw
         ZArFW7zchu7y6WeEKagHnT4N2ViqbC2uoCv5Nxa4fRrRi8IS/AaekxAsY60X7gjyMEIP
         f/crxiYQDR24GDMoWZ9Dn+Ptu9t8TPF8MNMz06MI8wDgbz6MZdmBodEEabDHbYcsUIPf
         R4jjjPmXKLQgPSqJ2i7CxCd92Iajr6s7LRgfSAnAIAuADWg0gI1Onh2COEIr7uuXP5yK
         D2Q/YmQGO/It2B8858RINg4OFZ3XBHXXjEBnsXrYiYK1ZwGbC4Qyi+g/tOBtaDAidbtF
         3P/A==
X-Forwarded-Encrypted: i=1; AJvYcCWNJ3g2KChMEh6Z9Ai/aPhjqwweR29TFudJQUGE6ydu1+M6g3trzVMQrYYUi4eEAxAFgk6GNU4wEkcZzg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5jiaWD96BX1qBRiCs5E1JQSS/avjtDi/iQDEU4elgBeNrYUFD
	dod6e4ZUXGYcSUm5pt3UDnulzuySAH7rB2Tv/rxs9LdXKJTtRuiPzxQy
X-Gm-Gg: AZuq6aLUiilxj5PS+ifbZ0Va69eZCQ6CtzxlDnMIbUzoIQ8ZJpvpdonCOc12WsuJ8pB
	GbYHY6Hz3mpGOn/NEjdbwD4a25ENMPfDLPZtlLsWZER6kcyvAiWWgTwggIJR4DTtRlgDSHwb7OU
	0syXkvBHREplq4XWQaItSUs3MEwHwUgOwdsrFDKuZsddLQzmwfoo1rFA0oMziWy2gHVOfQY+rUa
	OMIusDbKDGvqjgjXIfFrrMNAn6f71dlr4v+h5rNAbCWErSWm/ijl0NCt9xCi7nNT5Skz+Nkh6sT
	Spm08HtXXK6Q67N78eYlmdF9Dk+jMMZ+WXraXfH8Y4sE6OCinUTi65QxTl3Epru2fEurhY4diUY
	Xyzqy35DBTrAlpw+d4RNmtOe5BcxyUSGoLcLEJkQs9hD0SgeH65vEEoss8pthJLgoQWaqJ2RXTw
	y6vDZR8I8=
X-Received: by 2002:a05:6214:2467:b0:88a:2444:36e9 with SMTP id 6a1803df08f44-894ea0a7b75mr196311776d6.67.1770097967508;
        Mon, 02 Feb 2026 21:52:47 -0800 (PST)
Received: from 7940hx ([23.94.188.235])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-894d376e65bsm129844996d6.55.2026.02.02.21.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 21:52:47 -0800 (PST)
From: Menglong Dong <menglong8.dong@gmail.com>
X-Google-Original-From: Menglong Dong <dongml2@chinatelecom.cn>
To: ast@kernel.org
Cc: daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	john.fastabend@gmail.com,
	kpsingh@kernel.org,
	sdf@fomichev.me,
	haoluo@google.com,
	jolsa@kernel.org,
	bjorn@kernel.org,
	pulehui@huawei.com,
	puranjay@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	jiang.biao@linux.dev,
	bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next 0/3] bpf: fsession support for riscv
Date: Tue,  3 Feb 2026 13:52:28 +0800
Message-ID: <20260203055231.1088479-1-dongml2@chinatelecom.cn>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_215249_419424_27E86E07 
X-CRM114-Status: UNSURE (   6.11  )
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

Implement bpf fsession for the riscv architecture.

Menglong Dong (3):
  bpf,riscv: introduce emit_store_stack_imm64() for trampoline
  bpf,riscv: add fsession support for trampolines
  selftests/bpf: enable fsession_test on riscv64

 arch/riscv/net/bpf_jit_comp64.c               | 92 +++++++++++++++----
 .../selftests/bpf/progs/get_func_args_test.c  |  2 +-
 .../selftests/bpf/progs/get_func_ip_test.c    |  2 +-
 3 files changed, 74 insertions(+), 22 deletions(-)

-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
