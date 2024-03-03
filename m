Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CC8DC54E41
	for <linux-riscv@archiver.kernel.org>; Sun,  3 Mar 2024 13:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KTncHaswVWksWGbM36dYeCJ6UtO3IiQxb4wfDey3yEw=; b=R4HNmZV3sNzRXb
	kuYxB+wSV3NzbHFcAMu0go12A84QOl9LBXAjWAnhmIjw5muXqsYJtxWiopU77RBfvRbshaoYq0HU2
	PUPuSLzsbJU+f4FI37WxFZS7I207h05pScpRJNHWUTMo8WBzuflN4Etg0L/fmmNWjFMz2n3HoJd9J
	1FtToydcCo4cDWaxk6MD435ABJ0gsKxvXJXsKk7/aEuXpg8KGX3+4HPktRw3K6PZqj/X7rZ4AaP4t
	VfrkykznzKm2E35RA4j1hQilnWJ0+AJejEKBrSIy8HegWtMIXS90VxM4ffpD98N0+nM9H+y8Bngrt
	jcNRG3XQCwGD2rnmAugg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rglsH-00000005y1l-1W1E;
	Sun, 03 Mar 2024 13:27:29 +0000
Received: from out203-205-251-66.mail.qq.com ([203.205.251.66])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rglsD-00000005xwP-1MgW
	for linux-riscv@lists.infradead.org;
	Sun, 03 Mar 2024 13:27:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1709472436; bh=n2s+gXwdW2+QjJ47xTyefHF5QVT8S/PZfQcur2EDRe0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bZVjHBzwFWvi1aAIK/H45S92QzrmGf2mfM/AjKqtoPKB2aTbwz4enpYAWw7AoRYZA
	 ysSfwQeC9qE4LhesPwAiFR/AIRVHQVa5i4q6AMToCKtpH1hk9ZdHBYzQ0MgNuCFw+N
	 /CcKYOsUPq2hqsZ7zGlZ8lFf3NvxCuNm93QX/xdo=
Received: from cyy-pc.lan ([240e:379:2240:e500:994d:62ab:74a6:932b])
	by newxmesmtplogicsvrsza1-0.qq.com (NewEsmtp) with SMTP
	id 6C4A707D; Sun, 03 Mar 2024 21:27:04 +0800
X-QQ-mid: xmsmtpt1709472433tjc79lwka
Message-ID: <tencent_AB8C6AC86B23355F8DE096369A2317AE5D06@qq.com>
X-QQ-XMAILINFO: OLnGMPzD2sDVlqXcDkXPfya9vVmqwpnozEkItOhSPtXL957hjtkeImGA1UZYiQ
	 jo2Uo435vxlL+75zCehrIzdy5SP/c32+zPuR4DTvciSO/xbVWSDw0NpLnkTyk2qRkZYm4PZzCz++
	 6j38P/IRN0bqbzlp8YiKEeeHnhKXVxkYF3+iJPMbL2vCAFqdekPQYpWNwu3T+dCV+JTU4oItwB8j
	 oUHvWPAIx1/6VwpQ4TzaZd6V4WacVTvHiOSV0KbkCC2UVKN5IyMCFDsTCt835YDVMPc/Wi/rDitm
	 7WyjsIhV7M08PuOxCZ17AcUyIPt3YrApfANVCTyd6BPyaP3/TuuJzhHIUkX5H9Yw1jFOtugl0e+6
	 A/JIcjRh6MUIJ9dsDCT2Xemevmk3QEZ/pNATezpo08JY/m3Yz5DZJrlqpP+xXK0Q+U7ydK7s0rCt
	 wkBYekbKY9rEa6Op/J4pb08FgkquGrwlWV2tmQrko3lnPJ46siVWKmqgmIcHAvYgHNHw+jXGteQb
	 hZRKEFm+x4Ztl0VUeqalpPesEdiweL5Ykdda2CYSsD3JlDWK2MvZsgZ1ZUgIP9UFFyBV1BoZQFkG
	 b/enTlqOSckY225yrzVzuI+BsdiO9vpqhHvGfu36FNnKyHQ6MYLQvAhn1OoST2Ra6pnRVQlAZiJh
	 A8TgZuEYldYl109DEXb9eKyqhKRj3PI4UrKuFR5emviKSAa3XEnpenYBA9Sw0jnWnYBmgzHrzmtR
	 PyUAV9YMqpTeg+9Wj+JHaMdCtFEB5+UnAzmA6Bk7jxFK/HMYmTaUdykYuAN8/lB6qqP5AdZkzhv2
	 JJ1y0o2qGwFOrPtC0AuRPth3ckdtIJNn0aK5g9pAu5fCLFp8E0BZDsbd13xgQEmaY0+VIqF7Huzo
	 ku+0HVuca18QrpTp4PsS5cIHTr4cr3GPatGEHwv49KYXQqRG0gpfHevig7yv78WQN6k8kRBGVyzE
	 RGOk28OXJByphC4BZz+35QLiQwCxfPx6n6PJ+VTlW143LxxFZZyNqb2jZ6RLPZ55PXWqnLr0qmzk
	 rUA/uKhFxqJZRe00XnblCOKfgeDWdJFAiv0wk1M/iybnlCIPpV
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
From: Yangyu Chen <cyy@cyyself.name>
To: linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yangyu Chen <cyy@cyyself.name>
Subject: [PATCH 5/5] riscv: config: enable SOC_CANAAN in defconfig
Date: Sun,  3 Mar 2024 21:26:27 +0800
X-OQ-MSGID: <20240303132627.553698-5-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_E15F8FE0B6769E6338AE690C7F4844A31706@qq.com>
References: <tencent_E15F8FE0B6769E6338AE690C7F4844A31706@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240303_052725_815081_8603EC39 
X-CRM114-Status: UNSURE (   7.00  )
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

Since K230 has been supported, allow SOC_CANAAN to be selected to build dt
and drivers for it in defconfig.

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 89a009a580fe..20b557ec28df 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -33,6 +33,7 @@ CONFIG_SOC_STARFIVE=y
 CONFIG_ARCH_SUNXI=y
 CONFIG_ARCH_THEAD=y
 CONFIG_SOC_VIRT=y
+CONFIG_SOC_CANAAN=y
 CONFIG_SMP=y
 CONFIG_HOTPLUG_CPU=y
 CONFIG_PM=y
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
