Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B631BC38142
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jan 2023 07:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=k7Owg3Yk1rd7mT3mgJrX5wAzoknJKo9KNh1c4YOqTrU=; b=KajvqmKTLVp6GV
	kiQoUtAL/kchXYd4ENEo7/Nm/NClTYiyXM3HG5ouofpjy+vwPaYXXkjMU8iMwzYBYL4GTPSA5FRH7
	yAw2Dnm3OSl7EENf3YKer0HcNn1NHp1e5rblD7Ql5eddnKktY8g+LbqeQWj2OVcO1IjCS1DGxSfJ3
	w2A3zwoXHoHZzftLWVlMAebO4JEpgXh3n/0+1QZVlcVim8D2fZJJ+rtWyjShA9ygj8Eo4oSP7jXZO
	SP51yMMaJzSow7axmRiSLW14qkWV2R1VX6ZCthbXREVqIPgPb7pZqYrSYx7UAXrJTmRvI0hhlMSMZ
	9+Ke90gyM6GMrGwyk89A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIPei-003vwX-3J; Thu, 19 Jan 2023 07:48:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIPec-003vtd-Cu
	for linux-riscv@lists.infradead.org; Thu, 19 Jan 2023 07:48:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D8F9F61BA0;
	Thu, 19 Jan 2023 07:48:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D872C433EF;
	Thu, 19 Jan 2023 07:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674114489;
	bh=UBy2lf9QPDUeI0P/AEbXMIS0GaU0lPZlJILHV4CWMg4=;
	h=From:To:Cc:Subject:Date:From;
	b=VFmIGrptY9lhoeESaA20rr5/B9gyn6+sATEFSRU3aF91619O2dyuZLtA4Ggyn+XQk
	 0XYIYgn42+x2JKX+VlHArb4bnjlYgPoNPMAip/72+dTqV5/eE5KkpdsZzFNRzg2JGp
	 JkxEu4h0BQzBLNusHMQWihe5ix4ge0fBo2LiMI1cpfPDcnVI0sJvGzdljT3jSrjm6x
	 hRBkp7t277aWYHKjMMqxAtS+4W671zwUz4DJ407w0uIblfuVSQiN9INl8IvC2RiqQv
	 T542/nwJ4X4ySTV0GXKUF8ItVvz4v4zbB640zrcrLA84UsW9HbExXDIROIuogQ1iUS
	 hiIJb9uifrb2g==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Andreas Schwab <schwab@linux-m68k.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] riscv: Dump faulting instructions in oops handler
Date: Thu, 19 Jan 2023 08:47:36 +0100
Message-Id: <20230119074738.708301-1-bjorn@kernel.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_234810_503007_1AEE60AF 
X-CRM114-Status: UNSURE (   9.98  )
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

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKUklTQy1WIGRvZXMgbm90
IGR1bXAgZmF1bHRpbmcgaW5zdHJ1Y3Rpb25zIGluIHRoZSBvb3BzIGhhbmRsZXIuIFRoaXMKc2Vy
aWVzIGFkZHMgIkNvZGU6IiBkdW1wcyB0byB0aGUgb29wcyBvdXRwdXQgdG9nZXRoZXIgd2l0aApz
Y3JpcHRzL2RlY29kZWNvZGUgc3VwcG9ydC4KClRoYW5rcywKQmrDtnJuCgp2Mi0+djM6IFNpbXBs
aWZpY2F0aW9ucy9nZXR0aW5nIHJpZCBvZiBjYXN0cyAoR2VlcnQpCnYxLT52MjogRHVtcCBpbnN0
cnVjdGlvbnMgaW4gMTZiIHBhcmNlbHMgKEFuZHJlYXMpCgpCasO2cm4gVMO2cGVsICgyKToKICBy
aXNjdjogQWRkIGluc3RydWN0aW9uIGR1bXAgdG8gUklTQy1WIHNwbGF0cwogIHNjcmlwdHMvZGVj
b2RlY29kZTogQWRkIHN1cHBvcnQgZm9yIFJJU0MtVgoKIGFyY2gvcmlzY3Yva2VybmVsL3RyYXBz
LmMgfCAyNSArKysrKysrKysrKysrKysrKysrKysrKystCiBzY3JpcHRzL2RlY29kZWNvZGUgICAg
ICAgIHwgMTIgKysrKysrKysrKystCiAyIGZpbGVzIGNoYW5nZWQsIDM1IGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCgoKYmFzZS1jb21taXQ6IDcyODc5MDRjODc3MWI3N2I5NTA0ZjUzNjIz
YmI0NzcwNjVjMTlhNTgKLS0gCjIuMzcuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
