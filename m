Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A43C9CD1296
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Apr 2024 01:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KVaU08z5HudZrLyUQEqyjYr76s3spH7p5rltj4jCtWw=; b=eEc+Md+7d+L2WY
	hS1FE4HlJg/7F/jLdRebeWvZzXrHgoJvJuacRNmGS8Gv25v7xRDFAYdHQdiNQ/AMekkxulDor8sGM
	3Bb6PAeU8PAFBPcFCWwlwot53tGlH0t7Lq5T/NWfaydnlOiiIPD0du44bFL0kcoIhrKsoIwHGtoVX
	m7bvjaUH6GD2Zt5D9KgK9rfVda6xKh8y4uO4INwcuXy16K8NCtbywkCnxyhYKgyNVwWrkT4MDX7a9
	ASwhjhNRvJ7+LgsihZZ7ljD4KZU4emBzHUR7Y+k/afX4NcmRTIbksNI7wrbE3dE9PHKvRM2FMYVmT
	HGGD5uhzoovQQCY6DB2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtHME-0000000BOMv-0AC0;
	Sun, 07 Apr 2024 01:30:06 +0000
Received: from out203-205-251-27.mail.qq.com ([203.205.251.27])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtHMB-0000000BOLL-1Aec
	for linux-riscv@lists.infradead.org;
	Sun, 07 Apr 2024 01:30:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1712453396; bh=sxK2uMITViuWCRH/HETWDTh3a/M4c3Sxsj5q2qzVrG0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OEl/t+Q8ci/I3GEBTNNo7XNE4f7jqj32soALjyFr3HysHL5YxPlLLVcdi2FzIWd92
	 fKJcedfwHu3iBcWAF3phOMEeRkl67nf3554KadTcEjuD6I4SZqqKlyHLflrOMLiGZG
	 656kObijfwGciNZ/zkRY+Tn4pkSka/FxeSjLdklI=
Received: from cyy-pc.lan ([240e:379:225a:6d00:f878:7a6f:5832:7f4d])
	by newxmesmtplogicsvrsza7-0.qq.com (NewEsmtp) with SMTP
	id 7741FE3D; Sun, 07 Apr 2024 09:29:52 +0800
X-QQ-mid: xmsmtpt1712453392t19ym37jd
Message-ID: <tencent_A5B50F1D87711D625443361A3BF996042B09@qq.com>
X-QQ-XMAILINFO: Md0EpfRTqfgWnk8qoP/GWeCvf5JbI+UR1glwYtQp2wYl4oF+eAdbhgmeZPj2Vs
	 AZSYTsAFl/LQybfYoLWNm8YHWjtljUmFsrEMiCJGaNsn7eEpSVsJNZAh04bNUKosr+3fr4mN7biM
	 Xsi9hR/QJGf1YIOzT4Vx2US2VB7yWtIc9BmAud1OOVKUHpr3L5XbFWyirS/Qn4dBB5eXbkJ8Fe+m
	 D98eUA/Cl9aneRyuzUlG/F0ftwstGbAoy3lximw3zNTt8tdrtsEDnsam9UF7pVq8oWYOn1T05ARX
	 u+d7wiYu+7iMJnRquBpp5mMN9jnGTn3yhkiapls4I5/5s1SPmaq4UfYNJl/bUIfDT66fBM/+7Cw0
	 HpPixXA0RO1M0SWB7ynqBuHHNUO0hvzWY+qU3s6uPLpFBoegMZ5pJZUxtE7yVol1Z4qyJKikzQ3M
	 VUaiSIHMAuqiC7jXVLGq/OgVFju5qfnKzxuT4+IMzHpBz5crSALapRbHjFt6CkISWbKizcR4qBbV
	 gfANrIkJTOptYxGz5tkrAWQEutT5vX2TUY3AGEm1mhVhE9J6c6kOg9cVMwhm0uOZ8gfV8tdmy74J
	 zVDzq8nUPNIy6be6XYD9uK4XAzUXk4+ZKhwNofsPdcPqhkt4TJxklvqZzinhAYQn10LbqhhrpYIS
	 DI4drxrJpUrgpW5RbHzIZEoTQ1ci7RRpJO/2rIURbHiaWwa6vn5oPejEXWGPpuUXBjBUe2vtjkBA
	 XqI7tiMcTzc4YjxD4b+kO7aMLM65yjyLBb7n3h9K/BsYY1tg5HKe1AeyQb6zapuwjy8apnSmBjmG
	 cmAnB3nfPFsOfdYK7sZj5xPdjpcueUWvDVlmKvVg2kGdasx+T/ndKQL68Ly9Y4xKnIWN6cAVHHj8
	 8ZdedwQQLBb3Ws6/xG7F0+KatBF4kgiMNrLEo+fQDHvd/FOyBZbitl2KdjsKYVM+CV6ajjsYqxiH
	 Rrjg/F0VK1d6jRjaM2sVHrXGP/dUtSfSMm0dzKRj1WIYI2sMCINEKKpFsq+9gMkdFkGrxSDWlfCv
	 /LlmZfG6z8KWAk3jB7eYTnhlspwGTF05fYlIYOqw==
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
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
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v8 1/6] dt-bindings: riscv: Add T-HEAD C908 compatible
Date: Sun,  7 Apr 2024 09:29:39 +0800
X-OQ-MSGID: <20240407012944.2996666-1-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_9F423E3DC13F6D5FC7415C89988490F04607@qq.com>
References: <tencent_9F423E3DC13F6D5FC7415C89988490F04607@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240406_183003_648254_7D7BCC9A 
X-CRM114-Status: UNSURE (   6.88  )
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

The thead,c908 is a RISC-V CPU core from T-HEAD Semiconductor which used
in Canaan Kendryte K230 SoC.

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Guo Ren <guoren@kernel.org>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index d87dd50f1a4b..d067f2a468ee 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -47,6 +47,7 @@ properties:
               - sifive,u74
               - sifive,u74-mc
               - thead,c906
+              - thead,c908
               - thead,c910
               - thead,c920
           - const: riscv
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
