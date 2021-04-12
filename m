Return-Path: <SRS0=xUWo=JJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4436DC43462
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Apr 2021 16:26:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB3ED613B8
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Apr 2021 16:26:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB3ED613B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=O50w9EfEaTMadctOqllcikV20joRkTr9ePKIYYW8Q1g=; b=j6M75tkQAFkY8HIalB/Fw1loK
	Qb1GkD25pU7aLpdc8wK9yhoZZwNdLqo//57KdFMnxDRP1Y7ujCXrBeN0NH/RjRq6MYUrm2dyWG5YA
	393x2Wepu1BoI0Fv41z753gQYdAnvHlT1sLixN/yR5GUMWoN7SDMCnb4+tHy4Ds67FNHa3rzSG5OS
	/OCKv5MlCty5VPMGNk7N+23BRSdwNHkbG8dm7kkprfE4zGXIHMQYdKCz8t3uk4ebk3xDWP6FCxG6h
	IJ45Elrtc5w3V8HR3L7F9mg3/bdIJmjrrBuZS29y3xDyPgyiC0y6b9pGBHMqX5IxLkQMVbWOWf52Y
	UfbOx5Ziw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVzNl-007FMJ-GF; Mon, 12 Apr 2021 16:25:49 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVzNd-007FJN-VT
 for linux-riscv@desiato.infradead.org; Mon, 12 Apr 2021 16:25:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=fvalhZunXH7epLYYoSy6BgPEhU+DOrmdmcJv5fbgncY=; b=fvRnuzIMsyZqci2DxkaBwLgEpY
 b1zTINRfYWjsFMbEr9ABfuQTis2pwXYKLRRxva3O76qJKdkyxxpALTd3C0Bpny4DOnrbP/6l8tPJQ
 r6Vn76xI0IDr/r9D7vT9cxaFIaD0x83cEU351bMgpndwZ4Gxz+Kou1QOWNOtE3cqzyYSGO1/rhikK
 cd3R7JsP85YvsOvPaGPKzSac5e06oNFecai4riApy2NEmDiVkb+/mKo0XxnURejItzrxArr2LLeOF
 jC6Np/EOnmb+5rn2Sv2b6RyLasdWaERBgTacbePHnHTiMUVw+R2ezVsX2h1jIUOr8zCgzu2wLsbNv
 HWNBa+DA==;
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lVzNb-006OT7-4Y
 for linux-riscv@lists.infradead.org; Mon, 12 Apr 2021 16:25:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding; bh=fvalhZunXH7epLYYoSy6BgPEhU+DOrmdmc
 Jv5fbgncY=; b=krv6YJoXIfDnNRAi5GyPYct+lmsTEWhVDZXVOg3eeqaFsJAu6g
 cq6sVsEt2U2SZ2TQFmf0YRw9btCBcNVNZ7KaNlU9Oa03mn06YN3lBYXeoyBVzsCt
 k63RdMQgn+LTCSyCHPWbqRGMe1Ow5VNDF5CyySKP3ymRXMIyu34gl5S2o=
Received: from xhacker (unknown [101.86.20.15])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygC3vExddHRgRELLAA--.45187S2; 
 Tue, 13 Apr 2021 00:25:01 +0800 (CST)
Date: Tue, 13 Apr 2021 00:19:59 +0800
From: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Andrey Ryabinin
 <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, Andrey
 Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, "
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=" <bjorn@kernel.org>, Alexei Starovoitov
 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, Martin KaFai Lau <kafai@fb.com>, Song Liu
 <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, John Fastabend
 <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Luke Nelson
 <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, Anup Patel
 <anup@brainfault.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 10/10] riscv: Set ARCH_HAS_STRICT_MODULE_RWX if MMU
Message-ID: <20210413001959.5d2b221b@xhacker>
In-Reply-To: <20210413001110.7209bae6@xhacker>
References: <20210413001110.7209bae6@xhacker>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygC3vExddHRgRELLAA--.45187S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GFy3Cw48Cr4DZw4DKF13CFg_yoWfGFX_Ga
 yxJryUur18Jay8CFZ2gr1fZr1j93yUWFy8uF1Y9ryDZa42gw13X3ZIyas5ZF15Zw1jqF4x
 ZayIqF17JryjqjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUb4AYjsxI4VW3JwAYFVCjjxCrM7AC8VAFwI0_Xr0_Wr1l1xkIjI8I
 6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
 8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0
 cI8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4
 vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40E
 FcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAFwI0_Gr
 0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY
 04v7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
 0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y
 0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
 W8Jr0_Cr1UMIIF0xvE42xK8VAvwI8IcIk0rVW8JVW3JwCI42IY6I8E87Iv67AKxVW8JVWx
 JwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU8tKsU
 UUUUU==
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_092539_644411_0A81B6FD 
X-CRM114-Status: UNSURE (   6.51  )
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

From: Jisheng Zhang <jszhang@kernel.org>

Now we can set ARCH_HAS_STRICT_MODULE_RWX for MMU riscv platforms, this
is good from security perspective.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 58a1d69713a9..e8074d248457 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -29,6 +29,7 @@ config RISCV
 	select ARCH_HAS_SET_DIRECT_MAP
 	select ARCH_HAS_SET_MEMORY
 	select ARCH_HAS_STRICT_KERNEL_RWX if MMU
+	select ARCH_HAS_STRICT_MODULE_RWX if MMU
 	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
 	select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT
-- 
2.31.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
