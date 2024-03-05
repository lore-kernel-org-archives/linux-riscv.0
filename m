Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 709F0C54E41
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Mar 2024 20:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qdfz+w72Cc8r73tjzjTxB23RAqL6PYkqpJbbdWCK/CU=; b=tgWTvq42FslVda
	vabY9U+Ocx2MvNyxZfPEJem0uIL9qgI8KAoVhqa+ZW1vTtUie/4AB4XHn6xdL8+hGGGsfCsY4ZL9c
	QR3gbXWDSxSyXuI9P/gotH8EeBGwYcj6DU33SdSEs8zUZsvDs1QvX26lvp7XzNIYmGqF+lIsJKpjp
	9V+WQjKWOBOolBGxcNJbN9EwHQcp/nByUpqKqDu/nciqReU9DCUW8J4zXeFR6zOE5yaLqtCNCZeHV
	F4MXfFQw4DeQr9vvlfERJ/QBUbYpr41xjp5EG9qxLkuvWLEVj0Xt2tiLZXK91CLDzHmvn8Y/Qm3Or
	aV0aGOirsl826CGoyqYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhb0V-0000000F7VU-2ChR;
	Tue, 05 Mar 2024 20:03:23 +0000
Received: from out203-205-221-240.mail.qq.com ([203.205.221.240])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhb0S-0000000F7So-03IZ
	for linux-riscv@lists.infradead.org;
	Tue, 05 Mar 2024 20:03:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1709668998; bh=PAM4j2ksJa+2g8XGyPt5ykutgrheVO90IJO4uiwNs24=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NSbYWgwPEEn6zFfih7tipewtKDT7JAbkIpElBFiy0vFUa58bRQ+XMKTMMEC90XhTI
	 vrcTMEdu2nA16PlsaO2QM/YQ8lFH2oOIYczbAuEg3Sxkk4FNeedbPukX7mwMYOSZDQ
	 TB4skwJ8lUy/Rz0zU7L6/xYVfC8/RmZrpfV7h6hk=
Received: from cyy-pc.lan ([240e:379:2267:e200:bd8:e8f9:fb59:de48])
	by newxmesmtplogicsvrsza1-0.qq.com (NewEsmtp) with SMTP
	id C898283; Wed, 06 Mar 2024 04:03:08 +0800
X-QQ-mid: xmsmtpt1709668995t8n0r1578
Message-ID: <tencent_93C7B4F91D79712162D243201AF9F8520409@qq.com>
X-QQ-XMAILINFO: MFWpArBVhhGTvYuSpRDZ+TORo4nQRbtLDg1dg4g4vTl3tn60Xtzo3eLAv//l0f
	 T43CjN387Ua2xf+kGVmRZB+Scq4zxw4gazgNVSvPKr741UihKi7FqVfvGGBhHFm02q52ku98GV/A
	 dzAdcrmSkLHhFjAdm8gnpUXiy9YGFLnApglcl9eSHpUSjYDURm0tv7a1b+ZLlyKpZeCLjJ4viCVN
	 FsqirxOluloz7leaJNEySO5n2iePRQZkgmGkLFwVzVSdN8o4E4c/WjPGfbH1lGpkfuIIy5H/Ud8v
	 irlHh1UFY4uIDZp1w3MIt3toE2WLdDT7XVQkqs1P3ebtCnWG1ZyzjNM1vdB4GYTw3FXsrrEgQU+1
	 k2nCiawtT9+S3gDcAGnwGNLFVucPLgxBZKFwiDrQdWSeI2UXK2YX4DHFyFOh2EcR+U4fJ7JdFt4e
	 81cysn8zdxdGa2g3HVcp+rGqV2zlNPNJuDUiUd5FdTlxRgyBXrHgsO15Nll/QEoLdmhR703fAF2D
	 64YxWZTPxbHRiixBV8h7BRMuMkyWDfXgp9OFRBgQKL2DVwjVaOOitLIZPwhT8HgT71+O7h78/J4m
	 6dHWo3ls7YTCHggg6W/q80J/e3R3IhBCDNy/D7p5LIJ93J0MlDwyp6Spa9+2M3r+A6gJMdNqpbxh
	 I9Mbg1Dhsty4blG/UG4qXij03BWsL9cKkSP9oQnY3NIFWnR/FtiNrYAN2f/MXUmBmEfHZTFhsc7N
	 s8HDdns81OXsNXsSblCN/1uS29aLJJUe5q0HMBeMdzdJjCxk43kCBMtkvalXb2FEn5gwLjZ2anKz
	 Obj+tqjP+A3SWyg5Kt4A3/0VxuXX5RQ+wjQpUScb+wseRcYVurtSzKq+B1DX/0YWra7CKPlDPgMv
	 dC1nFSb9wX2iF6UNt7+O+OlviABteaij3KkQs7K48gO2tyDK/GCCE/fj4UOgaDM/mxXlcaBAd8lE
	 RgFYam7ynEkaS+mAopMypPkp6ANFN/rDC4eEwIvNB8Raqapph1Nc1CDjQrAyLXTV8uJBUslJdXZK
	 JXRQ4g25PtaTf8lPIE4k06KUvDm7Mb1vD/tF8A6Eizmwqc6a6n5d+AV5FS+8UuLZvom8d0Vg==
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
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
Subject: [PATCH v5 4/7] dt-bindings: interrupt-controller: Add Canaan K230 PLIC
Date: Wed,  6 Mar 2024 04:02:59 +0800
X-OQ-MSGID: <20240305200302.1093082-4-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_FC10B3C630BE27412FED2547245CBE18D807@qq.com>
References: <tencent_FC10B3C630BE27412FED2547245CBE18D807@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_120320_422190_35D9F279 
X-CRM114-Status: UNSURE (   6.92  )
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
