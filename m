Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3A3BC54798
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Mar 2024 19:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qdfz+w72Cc8r73tjzjTxB23RAqL6PYkqpJbbdWCK/CU=; b=C9gnd9Y0/VlU6v
	KLmNs2lhw+1b2AFT6MfgarBIupw321V46/EuaJGKDnkEec2gz5InGN3Yc4Kx3FWRyOxnWYZbHIYHk
	+IkUQSF54yiaxQbCP87f39Nwc2lx/ofibyxzK9BR+OB7L57/coEDmd1sUTZqL99MEWrKnCWjYK4Nu
	VWZ5bzM9YS3ZPAGZomqFOACmyrf+6dRhrrhGBYpF6wGCGBpGUdwSJpKBfLSotrJKJI6OlKz1PqLr4
	UpwKJwLidfNemh/lwZroaxjV17MXFi+iE4fjKQnxUu05q5qAXd/USVpvTx6QAKfbeKkrp2oU19IWq
	L2rHl4SBUt8KjKc/22gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhadI-0000000F2Xh-2fk0;
	Tue, 05 Mar 2024 19:39:24 +0000
Received: from out203-205-221-155.mail.qq.com ([203.205.221.155])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhadB-0000000F2RA-0git
	for linux-riscv@lists.infradead.org;
	Tue, 05 Mar 2024 19:39:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1709667545; bh=PAM4j2ksJa+2g8XGyPt5ykutgrheVO90IJO4uiwNs24=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=xj49IoD5EHf8EiJhLA6jeYq6w+pLhWDVgupIXcQzgi7auxI0RDrv/dkiQqMrzYYIm
	 GaU5r+SpFx6cIkwse5YCef3Yh2zbcC/gjmikju4oHfoG/k2epNotRXdPVCbe4obZK8
	 U6eCLFWdlmjt68i4f6gvHzDZcjBjFqoKxa/mPlM0=
Received: from cyy-pc.lan ([240e:379:2267:e200:bd8:e8f9:fb59:de48])
	by newxmesmtplogicsvrszc5-1.qq.com (NewEsmtp) with SMTP
	id 9B6B9246; Wed, 06 Mar 2024 03:38:54 +0800
X-QQ-mid: xmsmtpt1709667542tdlx0bm03
Message-ID: <tencent_368E67B8BA315F21068DEE7C158262DAA308@qq.com>
X-QQ-XMAILINFO: MDbayGdXPuoeWhkyCDBo0/3zD5Ub1Ne4uOLQ8UAN0XaOzrIQjCnd/2+jO8gaUj
	 kQWqoS8J6kwy4Hv8Xmt91kNYu15e1sL0u7oE5AKG6d+u5tXGEU7HiFgYX6o7gChuxFg7wfoR1zjc
	 GcWp6DT0qm4xe5Kw6HRLdegmyNZFTMXnT8jVUf/qQcEnpmoYpMSHHgaHocYk/MnVWW8PZhrNkt+n
	 FMVGI64vBZxfDHbsGj2LDKzXDApGxNWWYjZF12D6gDbzHOihs+FrDbEnXNwPxvyToSExOATSFW5f
	 S1M29IooTA92kParbUnYY+rxhrDets3tMcGlmWUh1Xv8HT5D+G1nKhmeFgo0SMc4etE1w6CL3/Qe
	 495mdI0eF9gj3yKRnVB2bKyIfRcC3355GhVLTMKTuv4+6qAhd3qHMtsp/yPa7QnBXZmpB2Sh61oB
	 ov7TsJQTCudUryDAgLycz0S2XLk4lNwIx8sCs+2mS5sR2GgyGgGa8eA1IGL4clxoBgcjYJWY2EqO
	 R3K3165G4v5r4bKDyMSu5xgOp3T5O3k+0mI5DUzanRCLjwAJCMqE32iQOqMj7wcvq1iV2xUgnrqE
	 JDcO8iNL3imaaaxBjYf4gMRZ01G/INOuM8+ZsoqL5w4ejFsiDbi0/AFUTnot/1cl4oZOad0XioOa
	 QojwgNZZIzvRjTdMsTRersfpl5Mrej7q/BzPGS/5UNY7Phu0ZjS/ymgMMc6uqB+ReunT6IMzCaOn
	 lbVRr+VWc+8I2kPyRYIEMndzvZquMW7z4s1sFyooDcznnIt9zFt9yvLfMuIL+hVw5CVL+Z06NacO
	 61wSmnIYES16J/dk+/M5u+WOXOqaxXwYuzvMeT1Mp1yh1A7sitDdztx1cnKH4aZ82wGr+BZFWMK1
	 qwQZJ5pXTBEb46lyD/f6JguZyCKdTK8rL25s73tvf37SnDF8hbaDkusL5SgX/2lHoNL8Ds4CsDpD
	 n6Ar9qZxYr6ORr2mnX4UKmYax33j3KIqURHUgFM1jSEQurcPxEexeQIgs1UoVRApowjbg/JEIFZb
	 buDEI5k3wpu8hhb/Wj
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
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
	Yangyu Chen <cyy@cyyself.name>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v4 4/7] dt-bindings: interrupt-controller: Add Canaan K230 PLIC
Date: Wed,  6 Mar 2024 03:38:28 +0800
X-OQ-MSGID: <20240305193831.1084556-4-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_587730262984A011834F42D0563BC6B10405@qq.com>
References: <tencent_587730262984A011834F42D0563BC6B10405@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_113917_723890_85943C0D 
X-CRM114-Status: UNSURE (   7.03  )
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

Add compatible string for Canaan K230 PLIC.

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index 709b2211276b..122f9b7b3f52 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -65,6 +65,7 @@ properties:
       - items:
           - enum:
               - allwinner,sun20i-d1-plic
+              - canaan,k230-plic
               - sophgo,cv1800b-plic
               - sophgo,cv1812h-plic
               - sophgo,sg2042-plic
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
