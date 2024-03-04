Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC17FC54E49
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Mar 2024 21:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mLoVq+dnV+oeeUSIUR+p6NCvv2pKFMf6DRba5GCZBiQ=; b=wx5ZhYbAZxdwHR
	kbPFUtalwsivzLUfyH6DfkwYN0CFTC5rVNkSZjLqVYGGm21sYg8y95UWVWhbh+Cn6zW9otYpaHu+P
	/VM+/ZmgGtYQE0ykvYRcccIN+RtK6WwNMYFPOBNByklDSKVwxQMA8UVPMcxe0IpkDkozF2PFyWWqz
	GuWfGNWSHZyBcm4pfkl3lnD9kPh3QCRy+eg0yv2UJSYUA4rzqh3c3SjHKUeTxQsfBOc84XyR7L0xl
	SM7DQCgRXq2/7DrRx/pwnVNjOlPyRksvdWQwlBzbHEPXxJTodkew4ynaGpC3v4dxwKAGsxYXUzQUe
	86QnVLCwlq3efrhWWz/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhFWB-0000000AhqR-1vOH;
	Mon, 04 Mar 2024 21:06:39 +0000
Received: from out203-205-221-221.mail.qq.com ([203.205.221.221])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhFW6-0000000Ahlg-15Ge
	for linux-riscv@lists.infradead.org;
	Mon, 04 Mar 2024 21:06:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1709586391; bh=pMaLts8PXA5REiyGeypCyU36YZO+RzJa569u2oVazis=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ceaLihVg8y5mUsomMZbBLA+atCasT6619NzNq1ssi5djzsT0hmjbz8Lsa+bHQqcz+
	 ES454s55XjrlpsN1CBLN2VIHsl28yjzfjg+iNgqjrnYG6oNDAXAjtgrnKWsz3jaGcT
	 onDQZsGyjpleE2iZU26+qHGsCNcO1Q+hbzUhjbNo=
Received: from cyy-pc.lan ([240e:379:2240:e500:994d:62ab:74a6:932b])
	by newxmesmtplogicsvrszc5-0.qq.com (NewEsmtp) with SMTP
	id 1953A8D2; Tue, 05 Mar 2024 05:06:21 +0800
X-QQ-mid: xmsmtpt1709586389tfhvjy0km
Message-ID: <tencent_CC6884F036B6F3D50A6269733BEAE226C40A@qq.com>
X-QQ-XMAILINFO: N7h1OCCDntujUM20gunPaMedHkDBepcC8+uwF0oYczOXSdekrAihPwKwaTG3s3
	 WmSohxDN6+V0rQGtpzybTDviWfbbJqiJqLjvmYxKpSP8dWGRDhGwmZKFpeY+UcsR3S5k2HY1bu/v
	 rwsxzQuLj7RjbBSD/bVBnOZriqSFsse/K/2IlVILbvVr9OQjwcfrilAY3CQk2G8eZnlDVjwK3eeK
	 eaz7cy1Uw0lyDu7I/gQramQlatjcshUnERa9W1Inbx8kB6eEhEQvhzlBzCALzfu1eaIlFti83/hX
	 chC1CscEVeWmvEtmFK/kYHkg9RcOQyZb7Oo7P2FIFtEECJ06cQ3jr7PalIkv94y7cTRJeEcdqXDK
	 zrOmtn0ZuvORy3xN9w9OqLXRXzQx9TxHkgAvt08fNrFGqb+UkbVxTqly9IYWoocj5sVa05eCqbkN
	 Ubh1dKEHqF2u8gFSx6xOXCiwo47mPIlnMvcNawoAc7xq6P/xydXespiO+ObcvvwjO4TWAqwSREGA
	 Lrxi/UOB9Jh3NV73emoTB0WlRVDc5LpeCZlyVGnhzMqc4TtR9Tgzozgxjw/bDMb0CaFQYF7UOO9v
	 lCA7jOySVlyIbgH5uRcg1IzZ5WMV2vMiWmPuTwlCIpy/HFY/s97W1AFPUOrfBkP6JkFqg66B4TqZ
	 kEPaQnP7yax7ps3zT0jdrlrFg7yhW2ydpWmWhk5zKUDnnfBVEWk17Khm4a1S37kawK60X9toWLU/
	 Q8MyHUMLtYn894lwUDhv7u049CbXtpITq4sgv7osPfi4y4fxHLpek3Skoxaau9g7FfpKVFsUUGp8
	 faUaYou4e8pC/D8C+ZmbAyMgYsok6P/2xkgklWWUMnjz2ARBP8C2iEc/TWaI9ILAIeJWgtNFgr4f
	 jISb10vTSuqGK57GRy7jZVOSltJ/uNRrw7tZf1OQ8SpHTYLhnKYKqk4sPCEYIcHrvHKDKw5fk9mk
	 wseMuPwo4JF9CwU4Rnjj3LdIxv4F31IvExtgH3wqeucztDHo9sQt3V10YZZC8CXbbzsj0fzPNYH3
	 qa3Bn1UyH5oTJt38VUa2GSgv0KVVvgUPdW3jrnoXHB7HXaIFhZ
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
From: Yangyu Chen <cyy@cyyself.name>
To: linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yangyu Chen <cyy@cyyself.name>
Subject: [PATCH v3 3/7] dt-bindings: timer: Add Canaan K230 CLINT
Date: Tue,  5 Mar 2024 05:05:57 +0800
X-OQ-MSGID: <20240304210601.777883-3-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_BB2364BBF1812F4E304F7BDDD11E57356605@qq.com>
References: <tencent_BB2364BBF1812F4E304F7BDDD11E57356605@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_130634_692236_240FF5D2 
X-CRM114-Status: UNSURE (   7.61  )
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

Add compatible string for Canaan K230 CLINT.

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
---
 Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index fced6f2d8ecb..06c67f20ad3c 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -38,6 +38,7 @@ properties:
       - items:
           - enum:
               - allwinner,sun20i-d1-clint
+              - canaan,k230-clint
               - sophgo,cv1800b-clint
               - sophgo,cv1812h-clint
               - thead,th1520-clint
-- 
2.43.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
