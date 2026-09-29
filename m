Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E15D1CA5FA5
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 09:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2jxJVndOQ8yA/B67rfBR31PyqBvOLdjk2W3MucmdyFU=; b=Q3/IOLt6tSxC0M
	LhDVstaa4Wjez+1jxamwIeka8IkJaKqtA3slKxgynN0w/O5WBIQmZ3rjiSoUfdF3GpAFfBcV9FKS8
	QLLgMgxJCQOu2fhAigf4K52mxM5PrHTfnWppDgQI/xJMorH98cl6r9XQOXCtbxvGTXGSPH6KbwTcl
	mvz3CpXIT4ZJBi6Pb22xcb9AoDJstXKmz+dlX2mB2WzFQ3GQP6h6tFdtvtex9bzZvpe8Cxdnqnkfu
	K2CMBXqSYh439ANcWzJcBt6li17zo59+kKyeXC5sD+h0Db1a99aNj4e8HnYN3AyofYjwrrQO0Jt8e
	Z39GFM81cr9MNDx5NSKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBUZx-000000032LI-3KzD;
	Tue, 29 Sep 2026 09:56:53 +0000
Received: from fhigh-b7-smtp.messagingengine.com ([202.12.124.158])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBUZv-000000032KQ-1V7Y
	for linux-riscv@lists.infradead.org;
	Tue, 29 Sep 2026 09:56:52 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id D1B5E7A007A;
	Tue, 29 Sep 2026 05:56:47 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Tue, 29 Sep 2026 05:56:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm3; t=1790675807; x=1790762207; bh=D8IUYrRXtjkc2HSHXutSK
	zr1ZkVat0bgbq+ycjvQ0Gs=; b=YAVl7b291JYgRcjhYYd+myDZlGmYSuqALZEcB
	KdUCm03CUIzmKVNkkx0qdwjz190dW/9Az9wg9wExwCDopbRFs0NYZHhQgGEnE13E
	QQdWKInwdTC7g3iLMejDs55IuENxxnCKIH6f4M+YafF336T+9cEoD/1YLJxp5P01
	VvLwCs6H01yRyDSI6l7nw9dVwCKNzTqO0VVmdNgtp2PaWgVUwdINNCcjAOM/oCzr
	AM5DaXvzyVX86XImiOOwFdBhmbC68UktVyng0ifaBeVd/uGMDsrF6ID/urZojQO/
	a3alr8xpmS0pZ3OXEenoW7t+OTEW9oINDP1BAHreoAHkulYHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1790675807; x=1790762207; bh=D8IUYrRXtjkc2HSHXutSKzr1ZkVat0bgbq+
	ycjvQ0Gs=; b=dAg0tvpf8JEN9QGy3IY+EnUb31GLjarQd9bz7Wzb3hc+Iea8x2P
	IvXeeVYPs5lF3b4eXTvE9JjAje4AHmSYgh31sZS1hobndTH9DR8UgMGGzJSaTD4V
	5OrmUqU4RZnfwSCyJnoT5CnOrUDZAC7CpG6m34BH7hj0CsG1HK9+lrrj5gBerZnK
	GOh/un9vqTbvtWmH3eEdH6WPhLMWifielUe8Mxzq39XEldVRPF5rBtT6g6dIYMVk
	Q42Wj7vyiKGfKK8qVrB1qbjpwJY9ALv+VR+a0uwUH9DY+PRNU9CwvMjofIvB7W5+
	S3Y2PegdKnXXfryJXcRiRaPN2mXT+c+etOw==
X-ME-Sender: <xms:X4u7aj72SRurupoSdkUz6RdaacMRemzMJ9i8WZCKL2PnoMRsIU9Qlw>
    <xme:X4u7aqQj_DgB2pH05KNSUyoTTpphx87GwfndoJ3FwDGD0FX603yfgh6Nnfg7pJmuI
    sMTCY32LU-fwv46QyqidzhKKEeoQM4B70SyCbEPkaR9w3_UM6xfx5hS>
X-ME-Received: <xmr:X4u7ajtER3pjfd5vW79YpHsQNC_e17qaGVu-kEY5YCXg3lp-IHQCclnMOEc0otTciPokwhG8IfgwLo7aQrY>
X-ME-Proxy-Cause: dmFkZTFvS3OFwVHaxub+ihmrLrskOCZmNiUvt1Z6reROFj64gHR3tsdoNds+dRKnW1YbtW
    j5lCJiqHgqxPGdKQtMq7ysxB0x8OT9QnWoZKWUUbfVR5sHIRU2jQlWr0kFrVauvZjXgal8
    wS/Iq7H8TmvgzjZyuiQz7v91L7fBo6ZbyVN/R0ahvFSvmSKA+eSr8kzJutl8P/VzJKV8T+
    7cw/GaUVA81JbPC5rpwCSufv27Os11ZhtET9kGrXqRb6ly7GlzuUirfE1NsVOlXOCh7Gie
    cXYspOxF8jMTh8Nq25rrDDKwSl7ja8fOac6MoX628Imq/CRc58vGk8wVXYx1uwUbPCioBN
    fZz+pJu0I1yD2vRnjQWan+wbxGP1f12epgTJH+8j7flj227hSsFTwsvBiwvKjeIpsA/WAj
    9IXCWlxxvC/yAdNb563bKKS5k2j2XgPoCmiwFLRGnWBRgF/+cTn0/B4SW/VJZ1PxHeKvwh
    4tfpCrTUDsQIXeD8KosBerc0uRGU6qF+GKAd2szZgnwsqYdmC9KCZE4ZVScDXlHiHgTq3a
    pvzNZ7lrPR4OFoFaunrlChmuMQiq7QE0FJeWfTsnOWu5K7D0uwBh4FRV2+iFar7bnOlPx+
    sOjDyNTv68nxvUc3UUbTt4Z7TX2SRPX4stv2+6cUdmjnHcKlTzvdddBbGb/w
X-ME-Proxy: <xmx:X4u7asbF_yvVxDao8M8Olx8IbgAQivzQ54AEXCT3TD0coIv_12zwMg>
    <xmx:X4u7at8ixaNq5Ao7jEbuwtICxMMFSPBes22MG4PSCy3kOkvRCA-oew>
    <xmx:X4u7aoqQu3T9ASdXwh2VRDQOPZrnkLqf79rPihKybJa3YbD3hhQRtg>
    <xmx:X4u7agHZ39QwZALPpDVP3DxX52MqP2p-1BaFTgaBalTkrz87DlX2VQ>
    <xmx:X4u7apBmdM9FuaANTtyeRfxU7ey58iaXwQP0ywM8QZy90TM0an56t_Sw>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 29 Sep 2026 05:56:43 -0400 (EDT)
From: FUJITA Tomonori <tomo@flapping.org>
To: ojeda@kernel.org,
	fustini@kernel.org,
	guoren@kernel.org,
	wefu@redhat.com
Cc: a.hindborg@kernel.org,
	acourbot@nvidia.com,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun@kernel.org,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	gary@garyguo.net,
	lossin@kernel.org,
	tamird@kernel.org,
	tmgross@umich.edu,
	work@onurozkan.dev,
	rust-for-linux@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH v1] pwm: th1520: Fix 32-bit build with COMPILE_TEST
Date: Tue, 29 Sep 2026 18:56:12 +0900
Message-ID: <20260929095612.1072417-1-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_025651_733578_349D8AFB 
X-CRM114-Status: GOOD (  12.15  )
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

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

Fix the following build error on 32-bit ARM with COMPILE_TEST:

  ERROR: modpost: drivers/pwm/pwm_th1520.ko: symbol '__aeabi_uldivmod' undefined!

The driver divides u64 values when it converts between nanoseconds and
clock cycles. On 32-bit ARM, these divisions are compiled to calls to
__aeabi_uldivmod, which the kernel does not provide.

he TH1520 is a 64-bit RISC-V SoC, so the driver is only used on
64-bit kernels. There is no point in compile testing it on 32-bit.
Limit COMPILE_TEST to 64BIT instead of changing the arithmetic to use
the div64 helpers.

Fixes: 3c180003dffb ("pwm: th1520: Fix missing Kconfig dependencies")
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 drivers/pwm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
index 729776086879..abecd95b0c3c 100644
--- a/drivers/pwm/Kconfig
+++ b/drivers/pwm/Kconfig
@@ -772,7 +772,7 @@ config PWM_TEGRA
 
 config PWM_TH1520
 	tristate "TH1520 PWM support"
-	depends on ARCH_THEAD || COMPILE_TEST
+	depends on ARCH_THEAD || (COMPILE_TEST && 64BIT)
 	depends on RUST
 	depends on HAS_IOMEM && COMMON_CLK
 	select RUST_PWM_ABSTRACTIONS

base-commit: d266640c6c760c9bc215bf5a3ece122ca488b6f5
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
