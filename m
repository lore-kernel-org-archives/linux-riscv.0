Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57705C4829F
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Feb 2024 20:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=U9l+DAooNLRjYtcvtAdmLlAetO9UJOUa2ywZzB7bpBs=; b=J6gh+QZoh5c2v558LDJzI2T9fg
	fxdcTgPExAMxU7z3/3Yp1/iBEOgD5hYlnv1Qh/+c2NnjNqNJmO6XWC+HQrwkhmAJymb1gp9WQkYKe
	2y+HWFWAi1CSpdJmax6MJi9dAnFD4IRHXNnd6y0TOICAHMCQB135v5pm3t+U7YYdrKDRZ7FkDda+t
	kryPG9psETHt3lv2avYp5uJFbCjR14uE64f1ofXiku/CE09wcJ5Pfi5V0DPe31OcC7yG3WJegaSAh
	Yqhwb7a8nC6f6eX7xDGTcnxb+3IxNPn4PdM5DdoXNsKzNjMLCIUe+dQKnYvcTXX4+Z6TBVzy3uk2p
	oeJiSrSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZz8D-0000000AaPd-0yq6;
	Tue, 13 Feb 2024 20:11:53 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZz8A-0000000AaPH-2Aok
	for linux-riscv@lists.infradead.org;
	Tue, 13 Feb 2024 20:11:51 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5ecfd153ccfso96868437b3.2
        for <linux-riscv@lists.infradead.org>; Tue, 13 Feb 2024 12:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707855107; x=1708459907; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9AN85m1qKFo3T4IguFVx7FthdqHAYUz/jnXNP6aoo4M=;
        b=dpl0EyhSwWYekBbFMB8Q6OeU0Y754o+Hr98J/szWTtHf6JkHqjYBlidZ/Htb2vojMn
         Onyo64GNeZUeNuMoNoHNsIR2X2s7C18K5ajC4veXtn61VrVb3SnhzfYEG7ae4sTkqKeZ
         OHHZodt3jzTjqXQW5l/5//f8+SGKcJOTQnVdJuCI+VrrH+q6Z25kNmKJBIa0H1Y3yc+Q
         o2JCi3IG/ZY8GNbLoO71OkhRXMN+VxT4PYlwecTuXHaRzIOQ3Vrvtx5igTrbtwTCksH8
         za/JQIoXyBZP9lmQjnup/TMoH6zFdiA65F7S3P0bqf3fBf5wRawjyijGTIJHiiShRlfx
         RcNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707855107; x=1708459907;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9AN85m1qKFo3T4IguFVx7FthdqHAYUz/jnXNP6aoo4M=;
        b=vmN0b2JqS9OR4kHMwLuGV9f+PMxkxGOXYQiBdJsCIPcJkcTWHxiKl16aykypn3F3fn
         GLbaL0WuYiqGaWDQqc+zAV6SJPHXOaBoS0oUjFHHwmUkiY//y3FpNUyD9g+viXdd/4h6
         9l0/jNyp+ipI2humth/NAt68PGYA9IxtSPupCATfCsNbMZnjqWDN5ao/WZoFaVVOTQuX
         dKOi7LuPrEu+Xqt2GTLOfEmzexNO08myFiifjmXhdi50KK47dYfs3RxBXdZ/Vrbiy11r
         S8Ttz2pYiyCAHGmjqa+exSvfzAzdGU+/gdsNtCKxbkANs41CrDp1MByBEm9FnteVdsYR
         41ig==
X-Gm-Message-State: AOJu0YwnVvPylZNP06JkV5f7qtzPVHCkV+iHccm6TWlyLH9muVxFt3kN
	2gRipYrrERg6R+9knsW/lEnwynU09SeIB2bo6P0qNC0XNw9tiQJzivYU/FKmoMMiDHWWcDR3BHi
	t4zWk9Ga1WlwJcdNsyA==
X-Google-Smtp-Source: AGHT+IGMIclG+7YbInh36DBFGSv+S+9wOLUvuY0VCBHEkOA7/oMOOhJaZ/IoUpXnIoxvZ+FmUQ5Y/z21q44C2Xhz
X-Received: from ericchancf.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:4139])
 (user=ericchancf job=sendgmr) by 2002:a0d:d989:0:b0:607:8b76:4744 with SMTP
 id b131-20020a0dd989000000b006078b764744mr104441ywe.2.1707855107574; Tue, 13
 Feb 2024 12:11:47 -0800 (PST)
Date: Tue, 13 Feb 2024 20:11:41 +0000
In-Reply-To: <20240213200923.2547570-1-ericchancf@google.com>
Mime-Version: 1.0
References: <20240213200923.2547570-1-ericchancf@google.com>
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
Message-ID: <20240213201141.2548566-1-ericchancf@google.com>
Subject: [PATCH v4 1/4] riscv/barrier: Define __{mb,rmb,wmb}
From: Eric Chan <ericchancf@google.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	ericchancf@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_121150_586904_26DB85F0 
X-CRM114-Status: UNSURE (   8.23  )
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

Introduce __{mb,rmb,wmb}, and rely on the generic definitions for
{mb,rmb,wmb}. Although KCSAN is not yet support, it can be made more
consistent with generic instrumentation.

Signed-off-by: Eric Chan <ericchancf@google.com>
---
v3 -> v4: fix commit message weird line breaks

 arch/riscv/include/asm/barrier.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/barrier.h b/arch/riscv/include/asm/barrier.h
index 110752594228..4c49a8ff2c68 100644
--- a/arch/riscv/include/asm/barrier.h
+++ b/arch/riscv/include/asm/barrier.h
@@ -20,9 +20,9 @@
 	__asm__ __volatile__ ("fence " #p "," #s : : : "memory")

 /* These barriers need to enforce ordering on both devices or memory. */
-#define mb()		RISCV_FENCE(iorw,iorw)
-#define rmb()		RISCV_FENCE(ir,ir)
-#define wmb()		RISCV_FENCE(ow,ow)
+#define __mb()		RISCV_FENCE(iorw,iorw)
+#define __rmb()		RISCV_FENCE(ir,ir)
+#define __wmb()		RISCV_FENCE(ow,ow)

 /* These barriers do not need to enforce ordering on devices, just memory. */
 #define __smp_mb()	RISCV_FENCE(rw,rw)
--
2.43.0.687.g38aa6559b0-goog

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
