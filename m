Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 268EFE77188
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Dec 2024 08:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XFnx6oKfMUInKDN1eEF+entBYps2scLKymOK4i8t0Z8=; b=FfzwzUc0H3riDS
	65+yBUWmTm2MXkeafx3+LE5OP3BTV+QKbXQ9zbF5hlKot3Krt1MFayzWHQr8mae/t76RI2tu+ZGUl
	3hcC0MDyvmapZXRNnhB/Gbm/AijT5DDu0hKHs3oKppFau5TwSAe44AQjIgnvJumuNp+5B1UqsywQ4
	uxeF4k1G05iO0ZQcs4UOt2xb2ajm3ELHpR9CB/HxTId9fZm0NB+oOLTzKyYCq50yCvCAfFmoVpUTZ
	eMVa/Hw0wHeXvo39Ua4XUNAA6rSIkEYJ69Qv/EFBAuuK6C5bsU3Yc/SnCkGcK+unwALgn1Hf9qz/n
	iSM+S5kp0tHJytsmVzlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOYY3-00000004J42-0mm2;
	Fri, 20 Dec 2024 08:39:51 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOYY1-00000004J39-0YBO
	for linux-riscv@lists.infradead.org;
	Fri, 20 Dec 2024 08:39:50 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-46772a0f8fbso15350531cf.3
        for <linux-riscv@lists.infradead.org>; Fri, 20 Dec 2024 00:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1734683988; x=1735288788; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cQSLLajqK9/Yi+P6h7pwFzkLyoaPP0opuaENBjnNxlg=;
        b=O3/Ex5xADfLZCDsAMux7LpUk2EBP9HU62RrWuSkHl2G/kw2C0H/y7JKW0Pn2Qcri1r
         rMfPHqVXayc6nVlH6CGy7daQiwTCOtBeaw7wNINabO0/ziaQ48iIB+QlrQaAGlUJYA9O
         4VWworMwq7Q4Yrje5+cPftCMJ9Q/+0ET13M2TqsVqfQBSzpQLcVeQ11bHFdus1K1NQ2o
         zhjJkKakjpuudL+IySU+wm0KH5d/r6osPv7XhsdASRKvonfDNjbwehfKBd8xVLS+DN0f
         koz1y9rZZxoWguhCaisUXa9mTGG9JBFidq8C7NQC+8/cmPYOnPp+sS4kDXmHsRqe1HRW
         QFRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734683988; x=1735288788;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cQSLLajqK9/Yi+P6h7pwFzkLyoaPP0opuaENBjnNxlg=;
        b=YoBOZq5vEsIMh+NNkBegHdxxcyIaTLbcN/T5KGP0v++/JUgt2q2FnqRI27BDYJxOg7
         mwn512n4gtSXs7Q11eIwaihphLuGJ9liI1OO/Hy1EktorW9MxbvTujfHLU/tc1Kdp2h/
         MEoVrGdLTJzKY/JOrfzx2kWyB3H29iVM4sgx2u8OH62KbLXmALI6aJoC1dTfiKBeH3+S
         MdiGMtuP4A7YJ/VYe2Foq2oPgZRXk82vIG1wvmJhuduDPK+WBjeFJKZvPLieMf1cfCGw
         c1BkSxPed0KmOleXqRUhacJ5aiC7sYmwIZZPOqHP2PvMlWLXnFXerRmtsByA0sa7V3XO
         xHkQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4iCAlRaJ/rv4X4AX7ZSbUm7XiuXTD/oJnuK18BTjg63DkvI/GSOT4mRlJcFW+/fIQYcChAjNBh+ZLIg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzgDGeHJ9hKKOeMWZFGthl8qxAWUmd9wzrinDVeaKGAWDR1LFO/
	SgQC5XeituDTTVLUVzeYp3BTeAJNPWL4DKMYRpuCfzEijVRGRK9Kd89GWzY81tk=
X-Gm-Gg: ASbGnctsL5ltpe6XWpPShVZuuM+uRyZnTip9VN54/O26Ma1ZyTP3gZiiMZHM8zzdBKg
	VEuBSfC4chXlTMmnI8QKarXUkCUgJDs3J+jECSx1/ElADP4DlIT4obnRVTagAPQGX8W9N/4RXHZ
	45VMSBqGsuiEIx08Rx9KaoN9iHPRe9p6WXKFuo7SOWXoK6qoR/UwPAVbejV0sfjRHICt2sEJUg1
	Sa/iLKR5YRcLgnShCXAw99rrf+h3/WhrJqxdyvLLJzSWLt+aJbjMw1NBgCMMEwNHyOFkfG/6p9c
	hG161DFzAUA=
X-Google-Smtp-Source: AGHT+IFb57IJrd0YIawaQ7r5ij4De0HcVHVsGASgwZKgw6ra8PV8f6UdjsZAa8Qbw0KGd7y0QJ1Wpg==
X-Received: by 2002:a05:6214:19ec:b0:6d8:9f61:de8c with SMTP id 6a1803df08f44-6dd23358150mr31770756d6.27.1734683987784;
        Fri, 20 Dec 2024 00:39:47 -0800 (PST)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dd181d528csm14617866d6.112.2024.12.20.00.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 00:39:47 -0800 (PST)
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
	Conor Dooley <conor.dooley@microchip.com>,
	Zhongqiu Han <quic_zhonhan@quicinc.com>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v2 1/2] riscv: signal: fix signal frame size
Date: Fri, 20 Dec 2024 16:39:23 +0800
Message-Id: <20241220083926.19453-2-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241220083926.19453-1-yongxuan.wang@sifive.com>
References: <20241220083926.19453-1-yongxuan.wang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_003949_172773_0E2872B8 
X-CRM114-Status: UNSURE (   7.56  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The signal context of certain RISC-V extensions will be appended after
struct __riscv_extra_ext_header, which already includes an empty context
header. Therefore, there is no need to preserve a separate hdr for the
END of signal context.

Fixes: 8ee0b41898fa ("riscv: signal: Add sigcontext save/restore for vector")
Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Reviewed-by: Zong Li <zong.li@sifive.com>
Reviewed-by: Andy Chiu <AndybnAC@gmail.com>
---
 arch/riscv/kernel/signal.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index dcd282419456..c3c517b9eee5 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -215,12 +215,6 @@ static size_t get_rt_frame_size(bool cal_all)
 		if (cal_all || riscv_v_vstate_query(task_pt_regs(current)))
 			total_context_size += riscv_v_sc_size;
 	}
-	/*
-	 * Preserved a __riscv_ctx_hdr for END signal context header if an
-	 * extension uses __riscv_extra_ext_header
-	 */
-	if (total_context_size)
-		total_context_size += sizeof(struct __riscv_ctx_hdr);
 
 	frame_size += total_context_size;
 
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
