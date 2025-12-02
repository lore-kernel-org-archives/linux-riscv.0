Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 104B9CFD376
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Dec 2025 07:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3LemZhpCv4z2zkaOxWu07JhRJWwnQEn8PQvC1L8pdrk=; b=qzYzulXhFd3+bW
	i9i6W7kUVp7Tgat+KnNJnW/omGmqZBaSNil13BggLFJK2jThGobTArcqoX3Iaklt81Zol+5BE/aDn
	C1ueUaIWfdpPAEKcTGtkM/gmHptM3UL/2P5/COMR3TbAvz9V4GXm5kG8E/+y/d/ILZ7FrtTRHFgEl
	rhK7fYh+D0dnWgSabVN3fzJoO4BMDFC1wyIz7q+x/RJyK/9f2nHN8fcl+12+LeFK6a8AhLOPM5Nnp
	dqv0uY1xVWk4fAOp3s9OhDOafdBmef+vdNAjnzYnHijyw9RTSwzTOziMCwLPBjCY2SbVsNueOvjW6
	+X/EZpg/GdO6/QUZy2XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQL0w-00000004yd8-3p8u;
	Tue, 02 Dec 2025 07:41:34 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQL0s-00000004yZL-2leg
	for linux-riscv@lists.infradead.org;
	Tue, 02 Dec 2025 07:41:31 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-297ec50477aso20896245ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 01 Dec 2025 23:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764661289; x=1765266089; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w2q6telcg/QsshlBLoOse/YPsUmfsRR7i8AupYK9gqY=;
        b=Y7OMDAN+DBM8wfY5qtygjaAV8XXHMqYc4HV4hBq5/FXlExQvDtkJxR5sp+bZFB5Yir
         n9SfaT9KldjHVyUqFJ8Jk0e6j6pmHSSnE9IguLIvjYVwl4spPTbK293Bx2o2/QwQIfY1
         SzecXWeXH3krMjsosxajlXh87mMDzIWNOyxdK/dCbOh9GV2gRv+2nFjxDNYWyJJR5AI7
         UMrXw0f7oWneH4A4bbUWhwtHjZvqVqf2oDXCmrv/AQqMvcbRIEW+hYIG6ysrYGMLU2Wt
         sOkWcmpHKVFzXIDDCMhi7M3XyOtGovygtzNjS7/OPJUtdDx2BGTSKD4nDzTQECjF5++S
         Tpig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764661289; x=1765266089;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w2q6telcg/QsshlBLoOse/YPsUmfsRR7i8AupYK9gqY=;
        b=HmrqlyAnMFVubpHF83vQZtFys7JEGeUGgHpNaj6l918uGzZ40sOZQ63KvKGTPwxRYD
         Gn6X5P78pkc2Dqqmqs3cQ2bJdKxAOikRue1eBzu53A+ozJ8v0O8GHmlZTzDCWGMgiat/
         cdz91yOcf6LL4EspYuVZ7AjDCUSBdIFzv3z+i5ZNrBclkRBPrrLC+ktCy0Qjn9v4xu3H
         EZNGpa3wTmlDHz7iDsMneW0oYlvOto9zMKcG9xn30RrxFznygY52+0+YaI7npaeieFwp
         4arD3bk5oaLqO1ZB/9rwv89aqHza7rCQEGFWK2D+AnLhzSuBznKPIWWprZRcb2sTxaAc
         2fww==
X-Forwarded-Encrypted: i=1; AJvYcCVnz3ynLsnALliluREut5Tp1kERU4C1TxVnGkK60/ttGzi4GdYqGKnoi1WvwbitX5/JRlD7nb17/06JBA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyrLl1U/LwYClj38Q7Cqq2kCk98+t5C5QaHV+RHHHGoJSCpCsAF
	S+eFM24fVlx9MFEWJHIn0iU5uOkFPb2kPxHD2pxpQwPss9kwskUzsPg9
X-Gm-Gg: ASbGnctU8mzCYP+CxTxFCbjFCCnLHTmycp48OIqAbkEx39d4U3na/F6R9/xB9XMnq59
	9VcY0bCr1PHy3WvMsFodv4g32sXgAzJfhU2yvGIDt3lAyIfKIySfvv6x1P37u95wfVJZ2OzN3sE
	pUXzp7FThCXv2VjMx/f9KsfkqwT2JXVPQn36BpwwWBc/qPDt5Zk13FtIFh8TKO/jfBYtqSWcLB0
	IRiK0EzwXBaO92OYsK0a35fnY2MA9rvDPb6LGj4cZt6ozaUyTjXm0idSCCJZQwWoX+LZzsJ4zGG
	wZ5v/s18JbVGePMlL+WaFoxNG8TbekpplDaXaMH4mB8KxMGPbHynjQ+aPV0oSdRKX0tcHumzaMz
	71ErC5p5Aqrf2vruRlCKnzxAUTmUc/s13yv9Ql+wmQaH0ycbKEJN1mYrhpPd0TaWOuaO1P7XEPv
	KIAD0oV+Nd6sraNZ5rotrfB7Zf54c5rOizmbGDCR6Sj/iF
X-Google-Smtp-Source: AGHT+IFznH971tY4p3rpMndCd98S3a5M91d+eC9g7o4pmW7WaT8RC+BcW6tVEoSAhAE25ttCWo2c0w==
X-Received: by 2002:a17:902:e950:b0:295:28a4:f0c6 with SMTP id d9443c01a7336-29d5a359bd8mr20672965ad.0.1764661289223;
        Mon, 01 Dec 2025 23:41:29 -0800 (PST)
Received: from mao-OptiPlex-3050.hz.ali.com ([47.246.101.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb7f69asm142957605ad.102.2025.12.01.23.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 23:41:28 -0800 (PST)
From: maohan4761@gmail.com
To: pjw@kernel.org,
	palmer@dabbelt.com
Cc: guoren@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mao Han <han_mao@linux.alibaba.com>
Subject: [PATCH 0/1] riscv: Optimize user copy with efficient unaligned access support
Date: Tue,  2 Dec 2025 15:41:20 +0800
Message-Id: <20251202074121.81364-1-maohan4761@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_234130_706117_31F26F77 
X-CRM114-Status: UNSURE (   6.56  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RnJvbTogTWFvIEhhbiA8aGFuX21hb0BsaW51eC5hbGliYWJhLmNvbT4KCk1hbnkgbW9kZXJuIGhp
Z2gtcGVyZm9ybWFuY2UgcHJvY2Vzc29ycyBub3cgaGFuZGxlIHVuYWxpZ25lZCBtZW1vcnkKYWNj
ZXNzZXMgd2l0aCBwZXJmb3JtYW5jZSBuZWFybHkgb24gcGFyIHdpdGggYWxpZ25lZCBhY2Nlc3Nl
cy4gSG93ZXZlciwKdGhlIGN1cnJlbnQga2VybmVsIGltcGxlbWVudGF0aW9uIG9mCmZhbGxiYWNr
X3NjYWxhcl91c2VyY29weV9zdW1fZW5hYmxlZCBzdGlsbCBkZWZhdWx0cyB0byBhbGlnbmluZyBh
Y2Nlc3Nlcwp0byByZWdpc3RlciBzaXplIGJvdW5kYXJpZXMuIFRoaXMgcGF0aCBpbmN1cnMgYWRk
aXRpb25hbApzaGlmdC1hbmQtY29tYmluZSBvcGVyYXRpb25zIHRoYXQgZmFpbCB0byBmdWxseSBs
ZXZlcmFnZSBoYXJkd2FyZQpjYXBhYmlsaXRpZXMgYW5kIGNhbm5vdCB1dGlsaXplIHdpZGUtbG9h
ZC9zdG9yZSBpbnN0cnVjdGlvbnMgZm9yCnRyYWlsaW5nIGRhdGEgY2h1bmtzIHNtYWxsZXIgdGhh
biA5IMOXIFNaUkVHLgoKVGhpcyBwYXRjaCBpbnRyb2R1Y2VzIGFuIG9wdGltaXplZCBjb2RlIHBh
dGggZW5hYmxlZCBieQpSSVNDVl9FRkZJQ0lFTlRfVU5BTElHTkVEX0FDQ0VTUywgd2hpY2ggcmVs
aWVzIG9uIGhhcmR3YXJlIHN1cHBvcnQgZm9yCmVmZmljaWVudCB1bmFsaWduZWQgbWVtb3J5IGFj
Y2Vzc2VzLiBCeSBkb2luZyBzbywgdGhlIHNvZnR3YXJlIGNhbiBmdWxseQpleHBsb2l0IHRoZSBt
YXhpbXVtIGF2YWlsYWJsZSBsb2FkL3N0b3JlIGluc3RydWN0aW9uIHdpZHRoIGFuZCBhdm9pZHMK
Y29tcGxleCBiaXQtbWFuaXB1bGF0aW9uIGxvZ2ljIGZvciByZWFzc2VtYmx5LgoKVGhlIG9wdGlt
aXphdGlvbiBzaWduaWZpY2FudGx5IGltcHJvdmVzIHBlcmZvcm1hbmNlIG9mCl9fYXNtX2NvcHlf
dG8vZnJvbV91c2VyIGZvciB0cmFuc2ZlcnMgc21hbGxlciB0aGFuCnJpc2N2X3ZfdXNlcmNvcHlf
dGhyZXNob2xkLiBJbiBwYXJ0aWN1bGFyLCBmb3Igc21hbGwgZGF0YSBzaXplcyAoOOKAkzcyCmJ5
dGVzKSB1bmRlciB1bmFsaWduZWQgc2NlbmFyaW9zLCBwZXJmb3JtYW5jZSBnYWlucyByYW5nZSBm
cm9tIDQwJSB0bwo2MDAlLgoKbG1iZW5jaOKAmXMgc2lnIGhuZGwvY2F0Y2ggdGVzdCBzaG93cyBh
cHByb3hpbWF0ZWx5IGEgMjAlIGltcHJvdmVtZW50LAphbmQgaXBlcmYgc21hbGwtcGFja2V0IHRo
cm91Z2hwdXQgc2VlcyBub3RpY2VhYmxlIGdhaW5zIGFzIHdlbGwuCgpNYW8gSGFuICgxKToKICBy
aXNjdjogT3B0aW1pemUgdXNlciBjb3B5IHdpdGggZWZmaWNpZW50IHVuYWxpZ25lZCBhY2Nlc3Mg
c3VwcG9ydAoKIGFyY2gvcmlzY3YvbGliL3VhY2Nlc3MuUyB8IDExMyArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMTMgaW5zZXJ0aW9ucygr
KQoKLS0gCjIuMjUuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
