Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A191ECD11C2
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Apr 2024 16:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A7ZcxgJMDEcF1ZtQwhuXye85QbL0opjF40NY4HDWyWA=; b=UIMt8rnFAJfPN3
	O9Osi2xto74BbG319Wp1WWrx51kvoiy1sAgFyWq3/H/aPhRFAMkbcrFYO0fqWjmzGIdKZmcjcLTQe
	jLA8SreUmZdxYEc5/CyN7M+wez810ZKim8Nz0CFvtVXT/X6OFw9bWOOUq9jad7g8W0JVBYhBAJNOr
	gmuHZ7DZBjz5NQuRNsOHybR4Dhq1U3DMxJ4wc/rXhomZRwy7r/TdqDODGIEYukjpm8rkNcvIWqsTA
	EjcY2GmysSfcyzPf9nFyOqqLsX+TCs2ai/5WUXtHl2iihnF9rVfDb81eIsBNxS+2NPQSyqbimcFGy
	+ZwuUKQqDgI7+LZlUrjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtVO6-0000000D0tf-23Zv;
	Sun, 07 Apr 2024 16:28:58 +0000
Received: from out203-205-251-36.mail.qq.com ([203.205.251.36])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtVO3-0000000D0re-090k
	for linux-riscv@lists.infradead.org;
	Sun, 07 Apr 2024 16:28:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1712507326; bh=rcU9GmGkfYObnRvy+6sIXXI4nFg1KITAK23jcYZUxzQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=uQw3F+bAhsYsRxhukHC5AG+BE9UZMtfVa97fJMe4WMFYG2eqoswTFpTIyJYlw+Q8K
	 T5bYlJWdGFsbcjVNjlp4iNsEfipyovuhGguNkNzU5eG8J2DJakYC4BJj+MuVbsQ16g
	 b48FG31IlV92IkFAZsyL9u7TYgO1GU0WSoalI1X8=
Received: from cyy-pc.lan ([240e:379:225a:6d00:f878:7a6f:5832:7f4d])
	by newxmesmtplogicsvrsza1-0.qq.com (NewEsmtp) with SMTP
	id 726A94B5; Mon, 08 Apr 2024 00:28:38 +0800
X-QQ-mid: xmsmtpt1712507323t1fs8ch17
Message-ID: <tencent_CBA62384BD9191CF4FF0407BD17118B73605@qq.com>
X-QQ-XMAILINFO: OakVxA/3u/8R12L76aW4bi3wLSBBjKGo+MGgTo8NYImiAKoZmXjzk+W6r1Qy0H
	 kyMBROiT1RxVk8iEgN5L7Tlfb38tDH0mDfv9aH402v9A/kSN90FNKStOaXt456WeMEqrPDRa/hBz
	 LiprRh4MSPNBxxPxtB6sG5W1JLxzhNTYyCb3g17mJunw4k8zAREtjKY2TFV3DGpi732HnPunD/MU
	 MOar/ks4AePCm2X40YCxP1H7RyUYf9e0ffDGr4IEINGkLyJ3AR5fhRAkLibTU5/EqnyEK5TZRQjd
	 QJvth/J9pD70ykbmSp00G7uNXxW8DEeL1ef+p9Yp2he8ulxKtGdZOv7WazVVri4YkgEWt9FzJg3Z
	 inn2C+RZtvxbd8RClpEp7obd3mFlKf+mM3iZIIP7Ebk46Ww/O0kOF9fV+MVXTKRxsed4zOM13GIi
	 wSS20ubsX9krBjqX3E1bcmk1BNDkhfJ1Ovg1Lotk3YdjPi9DRQ3lD7BCS2M/ZD456jJu3fMSUan3
	 /RSwq4j/6rgKH0nRJgRHJ57u7K1FY5BuEW0lCj0nObLadSA2NU5v+TIymOXRe23w46xyXNDd0hMd
	 vkWMh/FjRxkWHLXYu+9r69oNcdk1VHAufbK7TRNCpsBH3sX7HEItJBl64Yds2OYhDPLHmgBA9oGX
	 MACG3Mi/BeaWrRMVOhSQKhTdKXbHSxggJ9AL5awAwKJJ3iDeZ17AlIvXPqeXkBOgKBaqxtNO6Wxy
	 BaVBGJQR0Rx5JwgDxdbvBnZC5TB4oGq0LZcmqkxvYsE4OySf/tnE+V0ks8j35Ucf3E9KF7K4SO9E
	 FhMO1bQojG0arbQIG+HK6kpyzhDV9eHQBxPGWRe/kxWOemKkwxGRbTgiUS2OK9BWm31wTFH19AEV
	 FVLizEfz8gzNjqOJKh3zG2F1Vxml47SHi8V0bTpcxfbvugKkQFpsbUMId9i9+o2mp1+jlLWSpUdK
	 6eFVml2pFdSKYutBo7jR29G06FZzv/GrgCEhONMOZQlwNu0EAuFJ9GE0PdxgXbOQAA0N0fUw5rd8
	 /FBbbDE1vcTzzjDRPzkT8BQWP30ePC8BK37cYMKAiKERAnEHNFqT/scTL3Xu4=
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
From: Yangyu Chen <cyy@cyyself.name>
To: linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yangyu Chen <cyy@cyyself.name>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH RESEND v8 3/6] dt-bindings: timer: Add Canaan K230 CLINT
Date: Mon,  8 Apr 2024 00:28:32 +0800
X-OQ-MSGID: <20240407162835.3199788-3-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_22BA0425B4DF1CA1713B62E4423C1BFBF809@qq.com>
References: <tencent_22BA0425B4DF1CA1713B62E4423C1BFBF809@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240407_092855_442660_5661EE3B 
X-CRM114-Status: UNSURE (   6.83  )
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
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Guo Ren <guoren@kernel.org>
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
