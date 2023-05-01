Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23742C77B73
	for <linux-riscv@archiver.kernel.org>; Mon,  1 May 2023 16:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dCBeIKyPJ/mQ/jSZAci333+OCSz1MGN8X0Zfn+AUqP0=; b=xK4HLhROEzT656
	IfbCNP5dqnGstaZnI8IfZv3itISb3GQ9w90mdo9FVNseNuUo4vrHqYiLDxRU2lXsu8zyNu8OHVKN8
	wv5dEhtwqjrQIqGc3G8xActmKHrjHvm+KkisWg/0WFHGcjMJu9NzXPLRXgTgkh4cR4DH6EQe23EB2
	98MUH/zrOQTGWrMecd9bI/kP+2lx44WfoDTcZjv3RBirrxNXASTWldnzzjQferk6OybYD+VW8f5Ge
	HywOMK2RtRIao9pMdiOifuCTnD4Oc41ui7sJsmEeNXSH8YtIk3E7rURvwF1rTg2ocY1oPAzcPueyb
	r9hnn146XXMu26PVLVpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptWFK-00GIg9-1h;
	Mon, 01 May 2023 16:19:26 +0000
Received: from out203-205-221-155.mail.qq.com ([203.205.221.155])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptWFH-00GIf3-2P
	for linux-riscv@lists.infradead.org;
	Mon, 01 May 2023 16:19:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1682957959; bh=mXp6SRcjWPRCwi6nlesU+F55lVnmPqOB5ATTOwT5NWM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=X2n+SF0uuGlnqX/KZLBk4b/25G5B5q1am65Rg4cdtVFLBG2RAlI+YAE20u3s+0M9E
	 sVkFOROPRT3QncGKuwqah34O+HTe+/zdg4BMXrctyhYHQRuveE62djEEe1RDHADq0M
	 k+9oneflofdjrzLMrAsa4WSKGC3zJj5crQ6MVqPg=
Received: from cyy-pc.lan ([2001:da8:c800:d084:c65a:644a:13d7:e72c])
	by newxmesmtplogicsvrsza10-0.qq.com (NewEsmtp) with SMTP
	id 4A78EECC; Tue, 02 May 2023 00:18:39 +0800
X-QQ-mid: xmsmtpt1682957927t9od3563r
Message-ID: <tencent_3B8290DDC66D3E624132ED39C7465CDC9807@qq.com>
X-QQ-XMAILINFO: MW5hkHoBpWXyzdhmgeaTiGdwAayVVBNizcyU1Jfob9MZjrC9CFbTPRnmCQIVCA
	 baJDKCSZw/z8pNn+tVF9I/qytqEgyqxcUySgaCif5lWD9BXTtrUtbRSkGtzOmer++Av4Oihic5Of
	 Ln0U2ZLwijgWnvk0pheO9ZJ1/doXtLUyYcUg9TQAgxvQEw12tU4caKmi6UADJByOohcBMMjQ55jz
	 Qcw5j2EQH99Y1xlIkZp3fxQyL+qhLjLQDf5bj8S13TZEcYt17D1Pn25cFfRsvZT/DgAhmoaX/Jul
	 1idHVhKOYEqy/p3f4ZpPqsqHCi7F2F83rzS4ulr4rld8hnFwcHMmYcPD5zlYarAyWlYfBnlOWUNo
	 ycTS2YTFY9mJP6lVvTCkZ8ul7CKqPHVHZ2Z0b6c1FYVOfTU6P694SLz3flyh+iPUmCnAuU4u1UAV
	 elPMahYdm2b/GL+GL/5m1Cw275YpfYlLweieY1EZjo6vwTFSIhXZlBcF5XIZ6S94KqtDEIlnDVBK
	 Lm6kBxK2XDbCiBP8yldxjJ4rs5FF9jPVsWQ1zOdSs6YWKmIw97WWqp4GmWwKol4wLjpmSGgDYIS9
	 TztSJrrbF4r+Kx4/jVUMSRK7WPMtvQxefMlDjiZYhzh699D7YKIq3sj/iO+oRnu0AYa735/9CJ3v
	 ihuuRzES/+oIf4tzdMHQ3a/LcAyuhopvfd0AwXjvk5O/POfW/qR9xrVh2CdfORNfVTf+pxBIn8UM
	 KNQ+oBQUlES1cVNX0UpzrTwYGZzwiqa3CYMqISzt71kz8SSBfkWYKwgc/JlPBdPdXNTcHUix318k
	 H3pjaXZFwtmRgYT6jC2mlDN9i4srDTNe8ujw2CkuW5KOIGR30O9cGFDK2ijGgQxRBR7YjNlI4svX
	 Os+QEanAavVhcIfd89w10DbFidhCmZvXMRxKAbbUmvMh6RHYL2ca68xdi+yQul0ZMig19Zz7C7Ms
	 qZ+fdzZkuACVCScXunC8ArPOkAFsTGymvdlNi3HN5CqcUyajj/l4WJ6Obj5VGDHPNEIDS7LxA=
From: Yangyu Chen <cyy@cyyself.name>
To: Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrew Jones <ajones@ventanamicro.com>,
	Wende Tan <twd2.me@gmail.com>,
	Soha Jin <soha@lohu.info>,
	Hongren Zheng <i@zenithal.me>,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Yangyu Chen <cyy@cyyself.name>
Subject: [PATCH v3 2/2] dt-bindings: riscv: drop invalid comment about riscv,isa lower-case reasoning
Date: Tue,  2 May 2023 00:17:39 +0800
X-OQ-MSGID: <20230501161739.152403-2-cyy@cyyself.name>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <tencent_E6911C8D71F5624E432A1AFDF86804C3B509@qq.com>
References: <tencent_E6911C8D71F5624E432A1AFDF86804C3B509@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230501_091924_084971_C33B57B6 
X-CRM114-Status: GOOD (  10.66  )
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

From: Conor Dooley <conor.dooley@microchip.com>

"Ease of parsing" may have been the initial argument for keeping this
string in lower-case, but parsers may have been written that expect
lower-case only.
For example, the one in released kernels currently does not behave
correctly for multi-letter extensions that begin with a capital letter.
Allowing upper-case here brings about no benefit but would break
compatibility between new devicetrees and older kernels.

Drop the comment to avoid confusing people.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Yangyu Chen <cyy@cyyself.name>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 25d6e8dbffb8..7dd792e7bb45 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -88,7 +88,7 @@ properties:
 
       While the isa strings in ISA specification are case
       insensitive, letters in the riscv,isa string must be all
-      lowercase to simplify parsing.
+      lowercase.
     $ref: "/schemas/types.yaml#/definitions/string"
     pattern: ^rv(?:64|32)imaf?d?q?c?b?k?j?p?v?h?(?:[hsxz](?:[a-z])+)?(?:_[hsxz](?:[a-z])+)*$
 
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
