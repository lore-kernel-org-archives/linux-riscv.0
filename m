Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA02AC67861
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Apr 2024 01:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UPv5m3XyljSPrl/rYZvfvLGkOiWcHq6oqXSyM1Zr7gQ=; b=bcLzqliWaqQiOT
	rXA2KW4yxb7t3vb1MzXhhbUPEyNVUTlW/SWJZTLYnjXif2euIa0sJ8B+aTqO1+iTDhHd/Jq10O5AQ
	taFOJD+fAoAOiaiU48vcQwjc81yH5znAUq+yUC98VpBGJ6jVhTcnsqCcs+J/9FW+QNj4XmOjXy4eQ
	mY3mVMTFUpWMFqwTu4ji81/ewdMYPjcZKFBwugRJNFi94f+LWQouHIX7UL1gwXM7bBVyTdbU5jb7A
	Kth5rP37A2Od4tIxR33Tr8n6ehg/N41h549Lc3zfbSfNV85RblhPvJ3lo8DMGzgVSbL2AQZcRO6av
	dlJi9pJbensAE/iZXxqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtHMG-0000000BOOC-3LiN;
	Sun, 07 Apr 2024 01:30:08 +0000
Received: from out203-205-251-82.mail.qq.com ([203.205.251.82])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtHMD-0000000BOLn-0Fh6
	for linux-riscv@lists.infradead.org;
	Sun, 07 Apr 2024 01:30:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1712453402; bh=jaM56XVEDkeOpfko2CLF+2oPCWKBzRPYG5Ofw5dlTQI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Fm5Z+LWLW1LB0gM240l610qyG2rr3xWfcX5QQtI/Ie8ZQ71gsbCwHRchIJOOmcM1r
	 SBXdKcfCGk7YPpViDnXTPdg3UEi2YIHgRASrGo3oOUwjy/0S7CismQpaHMKXU6cfNT
	 /M8GMrFFXMDjomsRUmur88Qf8qT3OrRIACQ+C2kA=
Received: from cyy-pc.lan ([240e:379:225a:6d00:f878:7a6f:5832:7f4d])
	by newxmesmtplogicsvrsza7-0.qq.com (NewEsmtp) with SMTP
	id 7741FE3D; Sun, 07 Apr 2024 09:29:52 +0800
X-QQ-mid: xmsmtpt1712453399tsd3q6wi1
Message-ID: <tencent_CBC67085B03736F1A50ACA696F397AE1CE0A@qq.com>
X-QQ-XMAILINFO: No84gL0ijbqcWM57GT/1QME/lzlrWLQeu/s7M3RlS+CTR6sI54JpPOhYrgNPdg
	 wDZgknVmt0FGcwoGmu7Wb0s12qrzo2WdNNwpIKKW/KqasLipQyU1dV1OL1fye/As7Q4h2XeUnSU9
	 L+6L8WaX7ggRsHvav5Xyh8SNzwgIbQSztwbo/g9BR/Np+cZ/feRS1EHoTxK9W8DcU2ihWjRG8Bk0
	 3i0FYobGZBurUeUMv28aCpHYDTOXxUPg8CzDREmLWZyOYpjswul7qK+9jfxLsn7YQJQatx6xd4Bk
	 5GetmZPNvTnpMxyHeHqoZAAX70KhSmYQUGU0Tinw2pmQBc/gRDfdX8FcmG048Aq0URhi5NVesYvR
	 Lwz9yLSkX/AB1rAkAnnPM5fVph9mCIiw6U8ouM0093O55C1foT9R9iu7dAAAfA2V5eoOI0ooWN3v
	 GvnJ2nvXE7cmVdFww4Rar6lduEIHZWBfSkZFk+dA3zFpNsEtvQSqTylhg5Z65iMQnI1TKrwXKV+p
	 ik8SC5+bxx96ETGdIPcU+O+bCGjh1aMIhiymzswRoeyEpjairaA+RhUSM6dlMtrNXRxfGQJDJwib
	 KAle10t42MU9d6HNf+RQkAsW82CkWyEfwCgS+MHojPZjYFhHLxzpsFNrE5qiBPsMUrQoZdiVMbXW
	 RYxDhtPKI8XSZFEdo0Vo2/6Qc+XV3SWnSv3CfPuOwFsuGb87uisAelWAGUt+vG2TqgTO6UTqMdad
	 tQwyJoVVTfOV+5mi2X3W999gQXPxjIJY/QdLHeSmk13tZo9zRLKN3MUKpIUGQPqAW4CPKLHhNC9h
	 jQEA5RekfpH7ANhR+ZWzqnEgM9/HRD94u6ErKiNSOy+lvbRdH6ia2GOrzWw8MZW6TrntJM7k/uh1
	 YssajKAc84xZJa7j5iKzeMM87ncOGEMTVAEHJp0OUwLM6+OnqRVlYgJhsV2/L/bhAoIn2hAFomls
	 JnWpWyKrL7J2x64LHMkGA6TnpZ1K2Io19BCnwkGxx6sVopl4WJUxbGCorzCDnAjYD6NYyNsKTcAI
	 EfHQb1ctX9VfnpiJMRslRLiwhrCCg=
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
From: Yangyu Chen <cyy@cyyself.name>
To: linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Yangyu Chen <cyy@cyyself.name>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v8 4/6] dt-bindings: interrupt-controller: Add Canaan K230 PLIC
Date: Sun,  7 Apr 2024 09:29:42 +0800
X-OQ-MSGID: <20240407012944.2996666-4-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_9F423E3DC13F6D5FC7415C89988490F04607@qq.com>
References: <tencent_9F423E3DC13F6D5FC7415C89988490F04607@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240406_183005_439375_842C6D05 
X-CRM114-Status: UNSURE (   6.69  )
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
Reviewed-by: Guo Ren <guoren@kernel.org>
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
