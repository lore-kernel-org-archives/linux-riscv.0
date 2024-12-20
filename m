Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 657C5E7718A
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Dec 2024 08:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=700sbuNrpNl0REzR7tWvlBaqX9DP9w26zu6gGNgI9GU=; b=HHv1sUJ6gDspzL
	jUn8I2uDDTc1ZuZPm8ttCwurHiRqC8oAmmN/ijYev0CfakkN2a1dQruGRPTCDw5kDgyyJ91NPUYIw
	ZL09iIArKIYSO63IeJsMwWgPbQWYOC+Rb9S8SwMH9/9iMn9yTRLxaTfoZyHpbilqKYmjuOD7WHa0i
	gEXzRvbM9/UNdo9YaOtYGSh0kkXxE9faMYsf6IEkXyKb8yaiVi2PIJMCuIpjYrSAYRpnp7zr1aOZZ
	f7HQAfawSnHYym2dMYj8yD25zta4IVhlGwxZxnmmU/azTNczc0oHi3nyWprmKIO29G9lG94uBjiOG
	YlmTuPxF2y3U4hZli0rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOYYB-00000004J7i-3GEe;
	Fri, 20 Dec 2024 08:39:59 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOYY9-00000004J67-1NJW
	for linux-riscv@lists.infradead.org;
	Fri, 20 Dec 2024 08:39:58 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-6dccccd429eso13317846d6.3
        for <linux-riscv@lists.infradead.org>; Fri, 20 Dec 2024 00:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1734683996; x=1735288796; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/DCrfl/NIbhN/0GmBTkqnjtRxDvspYr0XuLBdF076MQ=;
        b=T24Rd/toOWDCIXVtC5EOUAIkIHeL6OXeSOJG8usrkgxSA4E8Wrfapk8SSs9XzJQGPX
         sLtU+ad3mEsr/IiBnOUk5f1sd6nuexlTojHXlR79Ai1h8hXsYizKzwLekvX3S/YD8Nhn
         g69QTGDLAsvASMR2kkjgYDq4/yenp+cZdyYABK2t3m3ByIPtHk9P6xBVXrpvMYWdmKe5
         Fy6ALmVYmpFjmEbdnKrITGenNJwB4iXjksY0rqk6w6mFUhaLW0iURl/mwMtumU7TS3Up
         6DQj49sydXtIhuJUAwBjWtxflL0yZHd4WMBKO4u1mZ98fRcx78WozZwJjH2q3SIzGaKV
         2i/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734683996; x=1735288796;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/DCrfl/NIbhN/0GmBTkqnjtRxDvspYr0XuLBdF076MQ=;
        b=aU1rERyFO8XW3cXYRoujqOECvcw1P52AMFIkzdt0r8WPJadAX1iA4LDNlT5G+OWFxk
         NbxM1p2Y4w0UtfiExSgHDQu5c+GrnVEcq0DyT9vgTwauZWAUdoNrPNd2XWfMbadDKKO7
         waUtzXS6wpL18ZJiWBb2uD8WMHcXXa3+DK4CoAs5dEluBg/lGn9v6aAcZNrdEJ+8hvjQ
         fvlqb0uzivBvWm/7fL74DrTxj+gb4SLY+90LHIIIEUODtAOWeZorJFChGicrle1s81Q7
         Xip8CyKJOIzCtYO9515fkGsuBEVG2drGhYumZBMzwyUlCuGTKlAuhMALzwoaMfPQ/ghk
         zPOw==
X-Forwarded-Encrypted: i=1; AJvYcCWlNDCc7t78gXqzGMfr1Ge1i2HJUQAIIiCJqCk51Lq/SGHczwiSAe3GVjzaC+4zS4qU+f/o0u/JCWR3MQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyVcSjQm1aGnim+C4PAlF0q3rtUREcGVo89KDi2fP5is+Djkors
	sO2sa4SZsmDGxjizJcEqChqnAfGjH/r38/7ZX3s9QBNl4VRUIz4XmGI2H3YYIxo=
X-Gm-Gg: ASbGncsdOKnAVjNyegUc/zVqQAg1vvfmczaHi0ey3vIcPVygQYO5UTYLBEcs2OxknNb
	xqyEnaQKygla2XLgIIQe+poqSNfVSUP5UecSEJfi8K0HSJNKlWv9w8M94Jly8YCvf6Gx6oAV6e4
	tfXzpHub1YQN43PaOGjceT7xSH8Sw2DhPXetTva89FlEr1FQTp0iq2/AkWqUOP9gG8gE8lQ0g2r
	9Eag7Tajb6075cnO9FCGr/BO2AdHBSXTueJ5mTDxTiYg5Co+W6BDCjgmrCJKpGxEcmmUl+Rik2p
	XZ5YyV8Ewho=
X-Google-Smtp-Source: AGHT+IG1JM8P7f2k/egij+vaKzbdVWyi35vUVzr5XVWO0Yo/nnrjRf5+BTxxyrwON5wXzuCyju4x+A==
X-Received: by 2002:a05:6214:2a48:b0:6d8:ab7e:e54f with SMTP id 6a1803df08f44-6dd2339e122mr35113636d6.34.1734683996224;
        Fri, 20 Dec 2024 00:39:56 -0800 (PST)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dd181d528csm14617866d6.112.2024.12.20.00.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 00:39:55 -0800 (PST)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: greentime.hu@sifive.com,
	vincent.chen@sifive.com,
	AndybnAC@gmail.com,
	andybnac@gmail.com,
	zong.li@sifive.com,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Haibo Xu <haibo1.xu@intel.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Usama Arif <usamaarif642@gmail.com>,
	Hanjun Guo <guohanjun@huawei.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>
Subject: [PATCH v2 2/2] riscv: signal: fix signal_minsigstksz
Date: Fri, 20 Dec 2024 16:39:24 +0800
Message-Id: <20241220083926.19453-3-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241220083926.19453-1-yongxuan.wang@sifive.com>
References: <20241220083926.19453-1-yongxuan.wang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_003957_364839_81E9566F 
X-CRM114-Status: GOOD (  10.79  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The init_rt_signal_env() funciton is called before the alternative patch
is applied, so using the alternative-related API to check the availability
of an extension within this function doesn't have the intended effect.
This patch reorders the init_rt_signal_env() and apply_boot_alternatives()
to get the correct signal_minsigstksz.

Fixes: e92f469b0771 ("riscv: signal: Report signal frame size to userspace via auxv")
Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Reviewed-by: Zong Li <zong.li@sifive.com>
---
 arch/riscv/kernel/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 016b48fcd6f2..b7c91f546453 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -324,8 +324,8 @@ void __init setup_arch(char **cmdline_p)
 
 	riscv_init_cbo_blocksizes();
 	riscv_fill_hwcap();
-	init_rt_signal_env();
 	apply_boot_alternatives();
+	init_rt_signal_env();
 
 	if (IS_ENABLED(CONFIG_RISCV_ISA_ZICBOM) &&
 	    riscv_isa_extension_available(NULL, ZICBOM))
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
