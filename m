Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3A23C25B74
	for <linux-riscv@archiver.kernel.org>; Sat, 18 May 2024 15:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:Cc:To:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2Y9d1VbraCNnlmC24PVU6xL7q4f/R4tDcuEbQH8VJxU=; b=g30zxYpGDgDpJ6
	KlJn1PCK9otUcvkhJC11N0DUy/xCb8nGeQhBtOyK/VTbDf6OFe0M3/eXh2j9VZDo/HPLvFpD1Uy6f
	fM9OFytnlh84+Swq5dU3uwmlZsILn3Ot51G4VIDeuhdRqHJjZSKzuG7IGIM+DZUvHl6Rk/BsGTadz
	uvNX+rqFNbXNhvycPx3YrSFpkSAh1zXUsAM7vplOvKBKWbs7NLVFccrhNLOV0LvUGkgN5mQNLmEEQ
	2wpyQq1J+iansU5v/FsAJKhhbTnh7I+dXPh1vCJtLWnU7WS9W4bxmganPNEpLBWYzM8CFVqFM5+DY
	lPbDZ8WtVge5MR6npEbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8MS2-0000000ALvd-1jQz;
	Sat, 18 May 2024 15:58:26 +0000
Received: from out203-205-251-36.mail.qq.com ([203.205.251.36])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8MRy-0000000ALqB-0f7E
	for linux-riscv@lists.infradead.org;
	Sat, 18 May 2024 15:58:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1716047871; bh=tAscGdrOoDFuMMheeDr7p+FqOHBXTQvTsOI3LnIgptI=;
	h=From:To:Cc:Subject:Date;
	b=GGT+svErobVJZ9z26eiVNtR4Y6gTBka8K7cVS2rCPErFlJYbZlMOa8GHsg7yKegNg
	 ZDvD4Fn5gezQ3yO28YgTuh4ajfGEHSnoJHB6YRpqiiliuP2Z+JUL6OooL7Cb7a42Hg
	 JTAdWqvKSkC8HRNtBscCH/aXYVKueWczq5bBSbII=
Received: from cyy-pc.lan ([240e:379:227e:fc00:28c6:7f50:fe33:13fe])
	by newxmesmtplogicsvrsza15-1.qq.com (NewEsmtp) with SMTP
	id E6F39492; Sat, 18 May 2024 23:57:47 +0800
X-QQ-mid: xmsmtpt1716047867td774prpc
Message-ID: <tencent_9D721BDDF88C04DBB5151D57711D62524209@qq.com>
X-QQ-XMAILINFO: N1L4R2fPZA3sGxWRvyML2lSmPDupt8TqlCjRvFnm+hC6uaH9gXe0Pm3XD0PSL/
	 0erheW3tBktAEYY1aGCsZMQ+9Km7EjyMrugsV/1l1P6crb/C1CZff/eKpC/3Wa6GfdIumsU6HVkt
	 3NZKdmpULhbB7Z1uhNU/adSopXtbLEEk6HRJ8igxn/oNXPX1mOPoWR2PHaU3b5YazgVMHIYDHNjN
	 MPefZ91iplsmyKG5OKvi97a5lTfhCRCoLnj9VNxIKlrkLs1lPwJM+gxxJ9Vmj4PhxeNohlDZrfd6
	 XCohexsFERKvzDLN695swbTQX1chHh3r5099is1qYNaI1qn12kd5Icf/G/nZyfICbcxZzES6WRWX
	 8RJEo42Fkvyj+nN3Q4ZW5FzyDOlvigGNF7OZYI7v4PvRv1Y18NaqHe3aZ/hmXnF3egReKW+WN/dp
	 cH8LEDAqI/KaCJ9AtAAifV6YOdv8lEtBPJpwq7dIGSEiEP0oWbyCptsU8f1Yk/4lIK+x9K765QyC
	 QP4mnkX1pDMR/xyDrjtYvDeq6vbcYNLXAiKVLkelPWgsrh0VEyBTUzC7+TPqcfc9i9HCnGzNRZtL
	 +uIdBB69Shyd9rIG6DWrWKrnu9tFQzvREOEbRxM8xR2622D/lz4+546WyvXa6BuPv/8Umnkp3p4h
	 8M2F+ssKMuyOFlwgIeCGKAt7RGqUXVOiNngpMDt0EYGO/HruiBz5fSdUO5KjUScmBUK3+ogvESHb
	 HV3pjo7TwfB+Ov2oNhb8G24QKviYvmn16xcaAJ41J2sA2gd1Qbg830M9VgdtcUtsJyxJRIU/Rbkb
	 RtIm8wNJtyEL39MubshwbQKPx7kkfqmcnBoiDE7miufs0yTDawZlCrV+1XNplP+ioUY2wOK9JU6y
	 +kbMc1oN/820cub/UlbrJvLl398C+L34JYi+yxh9d4RGRVLpdOyQ8uVzWom35seoxo4onN1gxdUF
	 clsrI+752+eW1IvssCTQkEl1vZiv4qqtGPyqXXJx7+xDjBxcRJcedvF6vfDp4PuIb5Ta34AYOa6f
	 n7aD+rKA==
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
From: Yangyu Chen <cyy@cyyself.name>
To: linux-riscv@lists.infradead.org
Cc: Elliott Hughes <enh@google.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Evan Green <evan@rivosinc.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Yangyu Chen <cyy@cyyself.name>
Subject: [PATCH 0/2] docs: riscv: Some clarifies on hwprobe misaligned performance
Date: Sat, 18 May 2024 23:57:45 +0800
X-OQ-MSGID: <20240518155745.891372-1-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240518_085822_631191_094F30CA 
X-CRM114-Status: UNSURE (   6.07  )
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

This patchset clarifies some unclear things about hwprobe's misaligned
performance. Including:

- hwprobe misaligned performance is only applied to scalar from patch [1]
- The defined keys of RISCV_HWPROBE_MISALIGNED_* are values not bitmasks

I cherry-picked [1] rather than write dependency because the original patch
was submitted with a line wrapped to 80 characters. We can't directly apply
that patch using `git am.` 

[1] https://lore.kernel.org/linux-riscv/CAJgzZorn5anPH8dVPqvjVWmLKqTi5bkLDR=FH-ZAcdXFnNe8Eg@mail.gmail.com/

Yangyu Chen (1):
  docs: riscv: hwprobe: Clarify misaligned keys are values not bitmasks

enh (1):
  docs: riscv: Clarify risc-v hwprobe RISCV_HWPROBE_MISALIGNED_* docs.

 Documentation/arch/riscv/hwprobe.rst | 31 ++++++++++++++++------------
 1 file changed, 18 insertions(+), 13 deletions(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
