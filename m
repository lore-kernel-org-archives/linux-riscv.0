Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24992C25B7A
	for <linux-riscv@archiver.kernel.org>; Fri, 24 May 2024 03:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lQhz3MbHSx9geIZovWvcNHFpoIaZvai/1gv/Vb+PpXM=; b=qILUbYGYoGr85c
	eCE4GFxXQBFnt6DWZEG49w03AGU/6okJ1Jyd1+wfbYzEWtxYta210sddwqihqe+uqYhhYFsf4ekpb
	WvPH3Qr+FJYhWb6IN6WUqCOLwpZyNcmmOx+9RS+3t1vEm5WXPCWUraHIWQT5EMwxaoM7lCwq9Je7D
	QR5VNGrmYfi2qWAZZpYsconvu030QPbA3x1cPNDv9CQ88GIl+D7eo7ipeVjE5ahCqe+qRDfJ3g5sz
	X0i/OYySkozeckeINh3GXdkK9QSClrCGOP0w9NgLCNPPeEU979GN3cYi3Q10zvEEDGjohsMcLDaVk
	JrrykuLu8muVCR4cC+dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sALjS-00000007wCS-2TD5;
	Fri, 24 May 2024 03:36:38 +0000
Received: from out203-205-221-221.mail.qq.com ([203.205.221.221])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sALjO-00000007w9I-2YTv
	for linux-riscv@lists.infradead.org;
	Fri, 24 May 2024 03:36:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1716521781; bh=KZ8llW7PPo2JKBuxKIsoxtxbFEW9rp9tvBG99x4q/wI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Hv/L3+R3eDM7YBWaB67KaJaBM0oYm4RIWRxInfhomKuM5YzIiprXmr8la56jl42ql
	 38qhO0nM6zGXsLKIaKCkyHyBUgKiVKZcnk+WzMp8HY6BgPairH8YITjGxTSkbLTySo
	 K66WJBdXznEvuSAd4u1+0xVuekGIFpSiDGfJRyH8=
Received: from cyy-pc.lan ([240e:379:2259:4c00:b652:79f2:d4c3:c8a8])
	by newxmesmtplogicsvrszb16-1.qq.com (NewEsmtp) with SMTP
	id 90C8A481; Fri, 24 May 2024 11:36:12 +0800
X-QQ-mid: xmsmtpt1716521778t5i4qy2rz
Message-ID: <tencent_01F8E0050FB4B11CC170C3639E43F41A1709@qq.com>
X-QQ-XMAILINFO: MmpliBmRb3iCDSzsEAV2QCRH5vaNsl79saeANBHcFPSmOQXivvawGLedK6zLPr
	 C6mSD1uDd5uzWWi/YulJLDc6Pv1YEnWDxHt4Q4RMEjMcQ6DREjst3OQ50ccNhNHM6FgOCsRMidEN
	 9d5Z1MN9U3Q0oZj1mFNak0IlCin00nFFFRlFoIMVSYP7xIWFYnhT86cetkL5bZmLw1ZubkdPOkOu
	 AA0K5pmNaEuyVTmxrl8mJHkY1I30DjBXy5n7hHN/zGkq7HrdcXELbBfDfabAoXlX5mBONAh98Jg5
	 0c/q8wI1fMwYEOfcNFVs0M1nAJwCGzstvrgWFgyb2Auf6S2FjwkK/PutecdhGw+dxsmbB6Figlz4
	 tmvIGL/NDEWmVkuYayN9DjjZX7i+c2fd7GIcZsX3Q495Q3UVQDyQ5fMMVFCWONEZ80oFbop0PXEI
	 6Yngro2Hi2QXfImfUjlw1xdvhrQIDQCe8/vZQIiLxUZ6+o1pOxtshHt/jb6iVFb3E6I9q5OTJf8y
	 uZ9mR6XiwE84P8o6Mmq02Vc3K1SthZJPSzssHIBeoSWXtzjPKkwqsH80IwI8igtOn1W6Z4uBERu/
	 TQjvcIHWMLhuquWvRiisgE47b9IVjH1lKDkfJDQjsyQrY68NulOIbWvdg88WUHtgpfTQBgKH2+E8
	 BeHJp4hIbK1IiOH37zNW5i7xQhZ3EdYFFl4Lp5jNlDwIZ18DnJJgmJRsp1L81QjXPv9HFdqjb1Qt
	 dnsI5Jj72QFS3A+mJMTyt8Vt7iiEgk0oW8Bnt5fCTKK4Gku9MU0HMYqRfmYwduvzL9aI1tljLnmu
	 V6AAxUCpEVsrawdKD3yFfwwZOQXm4xik9Q1iNN6msSOTBJ0IixkJb9Qe4WoHUSgyiMrtIXuuTkRa
	 xVQcH3k4SWOYt+cKyubf3VDDP5UqMN3+mFkAIblOdAQ6ElzEpJbpNxdwotl8BDWzA9vGh3KlFFWm
	 8Ma06Pq55hrXIoB7tHKGdq7H/Ym+uz9v2GBXmsyeRBiB0wZgMbxaByOMqJGGFtoHEVkBaY3eyc6r
	 Ij43nubzE6o+1kO38R
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
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
Subject: [PATCH v2 3/3] RISC-V: hwprobe: not treat KEY_CPUPERF_0 as bitmask
Date: Fri, 24 May 2024 11:35:59 +0800
X-OQ-MSGID: <20240524033559.298935-3-cyy@cyyself.name>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <tencent_1E3506F09D08066B8F3BAEE136C4F887540A@qq.com>
References: <tencent_1E3506F09D08066B8F3BAEE136C4F887540A@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_203635_007771_0FE7F9C3 
X-CRM114-Status: UNSURE (   8.31  )
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

Since the value in KEY_CPUPERF_0 is not bitmask, remove the wrong code
in hwprobe.h.

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
---
 arch/riscv/include/asm/hwprobe.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
index 630507dff5ea..f24cad22bbe1 100644
--- a/arch/riscv/include/asm/hwprobe.h
+++ b/arch/riscv/include/asm/hwprobe.h
@@ -20,7 +20,6 @@ static inline bool hwprobe_key_is_bitmask(__s64 key)
 	switch (key) {
 	case RISCV_HWPROBE_KEY_BASE_BEHAVIOR:
 	case RISCV_HWPROBE_KEY_IMA_EXT_0:
-	case RISCV_HWPROBE_KEY_CPUPERF_0:
 		return true;
 	}
 
-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
