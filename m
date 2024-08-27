Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB0A5C52D6F
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Aug 2024 08:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qdRseRc8G7bXjNYc1QVxMOIv3td3Szz4O2QiMQJiZAA=; b=bSNuoFxN1MCFZ6
	L83czC0xzMM6RYFe6E4cY9c7qqYkshizNLqGkmXlcyB8KnI+GAKUuKQtaXGCdxXQqdPrvAB0ALuAG
	cKxeo6wS9FM2bX3ikzMJAkJyX4R4PfNMJVT7ubM/IT205tDevk74AKrrkpUEy22nRhoZoJczVQ3lu
	ZC1Wy5akOmRoj2B0Gaowy+5wCPMJxp0g2DbmRhDtJQLGKKDbKv53LqTJe9PNbs79R+Jx+sdSVH9Tf
	7N2pmEiAziehPQyC3U8clNzpxkY0OLs5WhfuDLB+mxk5Thiym7ALNrWI8COgjMoNXskpZhNNdbwWi
	zDtZX3XWgDZWeiglWkfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sirEo-0000000ALIn-2PcN;
	Tue, 27 Aug 2024 08:07:39 +0000
Received: from out203-205-221-205.mail.qq.com ([203.205.221.205])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sirEl-0000000ALGg-3l2M
	for linux-riscv@lists.infradead.org;
	Tue, 27 Aug 2024 08:07:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1724746046; bh=8n5ghoJPbarAekh4wde579rn7yevYYmJTRo6ruyL1Hw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=s+pWTzfbqoowNqEFCCWVMWiAioCywdnX7Gk5VyX2597V/ee13KiLfhFMtZiVGsZbJ
	 ECKjdCFV8zOwbpaaq4O8rNwuz8KvIgc2nOXk5gMbj/3CQqM1ByQ/Orj48TvK5At6E7
	 Ocik5+QYYGxlyAW8zDmo5ROmkS5kWlDK11WlXs8U=
Received: from cyy-pc.lan ([240e:379:224b:5f00:16b6:fb41:2849:da9d])
	by newxmesmtplogicsvrszc13-0.qq.com (NewEsmtp) with SMTP
	id 1CBA7234; Tue, 27 Aug 2024 16:07:11 +0800
X-QQ-mid: xmsmtpt1724746043tpuyub02x
Message-ID: <tencent_387731262004AB31874F45504D7BC2F11705@qq.com>
X-QQ-XMAILINFO: Mm0mzSig0p2pUXSd5oAdHOeLQuZOsj9T7ASgnZ5wcRxByrv6k5m3cjVaM+S36v
	 ObZgtDSbamsYnPtEBSOlXZKQRjS8noCBT3NEQRJ+2TekpQ4oGBhTOGUA0pMOw4fI0KfU7jzuRXes
	 EwY9yvV6Ul7qGPbA8Zu4ItVl9xCEKZZRTXNyITp8r0Q3v9ZYEmsF147TgEWtLYzjsa4mh+MXGOs6
	 8L7221oUUm3V+SPvCbxN4IUq0qREB2ZNVL+doHpA8pfdV7wT3JVZBOSxE9E/dv+Tu2yNK54uTOmU
	 R2AZChfkZmJ5IlOLGUgXMIN+d4F5TlxB9FoL+7FxGxT+WteO/Zb+BGnRobqAh1Mw5MgiwFFD1IJg
	 lwoey8gPI6s8vUZj0bPLnim52y/KnmhC6e/FUdp9TowYjx7DQ5S8dmKncs2P0e0YXUjwX+wXGNHw
	 2RfBo3OgwsmGi0Fw+Z5LU7KMQimdI3bNCFW7pWAYLO2hpET5bAgdPHfrtT7KfWBXG93x5rIk3DTn
	 4t16hU3EItrmZzhnxJTqi+wG6VdvtcPXj96tnCZESumhktY8Tqt/fS9l6yb+P4Nxi5oEkuTM4az3
	 DZxeyrz4wrFe4xP54pvYDpI/JFL1+JbvVUzFp6q81jWyHjw1eyLQw97IDY0/M4QvRBviT7PQUYR7
	 lQOF0Qpd9GrGABrnldzPpqabv3+QtMp1cxZYE8IxeuNL9CHQ/U9vAA8WANbW4rLp/fOfiuz/eS8/
	 X+KWZKR4b9h+vie1+s4J0Js35bJakp1FD2LP7gZJJtDnqvsbwFjGvZHMxw2EYpvbxuSgvWKqiJb1
	 1DQRkPKmo4xhemOIKLsBI7nRcV70OLEl8mjS94ow3ktxsMNYKAC4BbXCQnUJzoM+PLerEinpBdvq
	 H5/Mt+yD5xWNdnGZ97s4pIKtChSHiUjZfULRWEet6En6OXd584ynt85kmiNKPEQb8fFbLxXPJyyM
	 0mwoPc7fkuoXN7Pc3A4rUx12ZwjOR2tl2oRBlAGxIFCGf88EHGcikdcHWdR5SOp0SIfF6ccmHaG2
	 pfHkj9KExg6h4t1AS5dougdm6aSdA=
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
From: Yangyu Chen <cyy@cyyself.name>
To: linux-riscv@lists.infradead.org
Cc: Charlie Jenkins <charlie@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Shuah Khan <shuah@kernel.org>,
	Levi Zim <rsworktech@outlook.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>,
	linux-kselftest@vger.kernel.org,
	Yangyu Chen <cyy@cyyself.name>
Subject: [PATCH v3 3/3] Documentation: riscv: correct sv57 kernel behavior
Date: Tue, 27 Aug 2024 16:07:07 +0800
X-OQ-MSGID: <20240827080707.3788836-3-cyy@cyyself.name>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <tencent_108260B43689E30AAE5D0C7C085AA31ADF06@qq.com>
References: <tencent_108260B43689E30AAE5D0C7C085AA31ADF06@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240827_010736_264817_D0E804AB 
X-CRM114-Status: GOOD (  15.55  )
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

The original documentation treated the hint address on mmap as the upper
bound, since we have already removed this behavior, this document should
be updated. Most of the content is copied from the corresponding feature
in x86_64 with some modifications to align with the current kernel's
behavior on RISC-V.

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
---
 Documentation/arch/riscv/vm-layout.rst | 43 +++++++++++++++++---------
 1 file changed, 29 insertions(+), 14 deletions(-)

diff --git a/Documentation/arch/riscv/vm-layout.rst b/Documentation/arch/riscv/vm-layout.rst
index 077b968dcc81..826d0a3f4cbf 100644
--- a/Documentation/arch/riscv/vm-layout.rst
+++ b/Documentation/arch/riscv/vm-layout.rst
@@ -136,17 +136,32 @@ RISC-V Linux Kernel SV57
   __________________|____________|__________________|_________|____________________________________________________________
 
 
-Userspace VAs
---------------------
-To maintain compatibility with software that relies on the VA space with a
-maximum of 48 bits the kernel will, by default, return virtual addresses to
-userspace from a 48-bit range (sv48). This default behavior is achieved by
-passing 0 into the hint address parameter of mmap. On CPUs with an address space
-smaller than sv48, the CPU maximum supported address space will be the default.
-
-Software can "opt-in" to receiving VAs from another VA space by providing
-a hint address to mmap. When a hint address is passed to mmap, the returned
-address will never use more bits than the hint address. For example, if a hint
-address of `1 << 40` is passed to mmap, a valid returned address will never use
-bits 41 through 63. If no mappable addresses are available in that range, mmap
-will return `MAP_FAILED`.
+User-space and large virtual address space
+==========================================
+On RISC-V, Sv57 paging enables 56-bit userspace virtual address space. Not all
+user space is ready to handle wide addresses. It's known that at least some JIT
+compilers use higher bits in pointers to encode their information. It collides
+with valid pointers with Sv57 paging and leads to crashes.
+
+To mitigate this, we are not going to allocate virtual address space above
+47-bit by default.
+
+But userspace can ask for allocation from full address space by specifying hint
+address (with or without MAP_FIXED) above 47-bits, or hint address + size above
+47-bits with MAP_FIXED.
+
+If hint address set above 47-bit, but MAP_FIXED is not specified, we try to look
+for unmapped area by specified address. If it's already occupied, we look for
+unmapped area in *full* address space, rather than from 47-bit window.
+
+A high hint address would only affect the allocation in question, but not any
+future mmap()s.
+
+Specifying high hint address without MAP_FIXED on older kernel or on machine
+without Sv57 paging support is safe. The hint will be treated as the upper bound
+of the address space to search, but this was removed in the future version of
+kernels. On machine without Sv57 paging support, the kernel will fall back to
+allocation from the supported address space.
+
+This approach helps to easily make application's memory allocator aware about
+large address space without manually tracking allocated virtual address space.
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
