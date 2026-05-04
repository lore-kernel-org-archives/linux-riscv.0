Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B82CD3423
	for <linux-riscv@archiver.kernel.org>; Mon,  4 May 2026 03:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uLM10efZYr8RD42aY4YNcz+sxXT8crbhJlGA3LcFXDg=; b=n5VQ1PfqNvOcIJ
	dqGuDkHuQcYss+SasyUWa4XuzlejZr70LsHj26pO6Jb+Nw02HIPBBzVQr9cXbDmYYkHoIVT04WddN
	ahgvO7fctauouUfF7wW8HRBXXyhwtgAVOGFHq0xXwPftoLUt0v9/d0R6nQ1YHucXVWTFimEbXSg7c
	VLykCJKkM9MK8hX5sMHHjRNUcBNBmj+P17nPezQRkq4htR3hO064Eqk7qWRj8atzHMui7wzy5JnI4
	bYr1pQ3J0P5gYfr7P9ZLZyu9RxoXwU/5LzG+0aHIe0/CtnJRbB9xdztxChmpE7gp0GERQe4Oflp3A
	UDn5TB+0Lak4z2auuKGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJkNY-0000000CHbF-3cAs;
	Mon, 04 May 2026 03:53:56 +0000
Received: from mail-dl1-x122e.google.com ([2607:f8b0:4864:20::122e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJkNW-0000000CHaV-0Yzw
	for linux-riscv@lists.infradead.org;
	Mon, 04 May 2026 03:53:55 +0000
Received: by mail-dl1-x122e.google.com with SMTP id a92af1059eb24-12dbd0f7ecaso8360642c88.0
        for <linux-riscv@lists.infradead.org>; Sun, 03 May 2026 20:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1777866832; x=1778471632; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/unc7W80mcfaLk/dCgB0s7hOcUfrr8Ysc/lFMmMdtPQ=;
        b=MsGOVO9QFRtDDWVUn/FQ54wX8UYyPVoXA6IZBnVwV0vDc9NS+nAxX2hdTWw+LxxYEi
         fVt7mx9+PAiqs5Bs5AzRT+34Z8P1l0F2US+cp4pHr2sLL9B2KqkHq2Xv6oWO5jLky7vP
         i4SRnx/NqDruLVlZf8Aj1o1MkRXQlosaealTjyfbpCDMoOuV6qd4Zire1wANPDsbWokB
         5Ybtlek2fYPf09q/TJCYKPclO1EDwYnfL2v0hdsF9cc9FF2X/MmuRoAmJnns6/Zd6lsk
         KMYv6r5dra39qEx9zYpD4rJFBIS3m8YKO9andsGn1GiC+JfQQh1GBM1OoRP5FqgNtzij
         hRtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777866832; x=1778471632;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/unc7W80mcfaLk/dCgB0s7hOcUfrr8Ysc/lFMmMdtPQ=;
        b=exbJ306a2I+FXnC6kJlaeraVD6zBWL4qmeCjkL/b1DTL6CQM4nT8EduJwCQQ0gGHUl
         KSTPFwpIMuTaiEEWa+F8pPGu/m9MkZyzluyGt+9CL7TtQb9cM+vfX9HYByioZselRs/D
         PzQP1KH8OWcJZjidxLfs4RVglPh+1A4kbK+NGt+ey2d3BzUyAEAg086f6tem/TT1qWLn
         WYKWZ1f6nGvvDTYnm4r9/5iaWk5zmpVxMNoMf++ko3dErx23R/X7OXaJdxnmR/VuBg8J
         /YRJMocTPdD9lum03Va/EMuJiIHUWDfyljs6aCTfiF+DfLlMTYxvRdxgWw/GG3WANc/7
         2Rkg==
X-Gm-Message-State: AOJu0YzOWE3znRmdZqBc3xKEqstGgeV+B4OIBiP0hsdbFMsLyQE/KdVq
	oFnEJ0zTG/sKPA+16xOa2YvVlSZZkqHkojcGwA7enem538qzh6/1MboZZZHKvpC9TisX8j+bTTM
	rQNUbOkpIqdG9BAjhW4k++kXiusc9yLu8UKzfTxziXz0UpzP4e2j/tmrK0dDPcYMXkO1JiPHLqF
	w+KeMH67XfJbYuVWJIaFJ6N4hxDZaZ/+1NISbqDL+jlfK861ANTZPeEgVeb6s=
X-Gm-Gg: AeBDies5EaIYsp6M6Gpm9zXj4AZ24g2EmhM8aJGV5+PAup3Vnoci1HegWRq2se0Sd1P
	WBjKyImoinvZBNjGEjDsNP4O/eA9bFePtOlDo/tXFQ6msY+C/HFM8RD59cvn1soLzcN9iUi32su
	51jzSGt6kCCxalWbkdHmUTdnPVxmmO3TAsX4wTRo7UW6nPtJSib2DK7kq0t51b1pH9soY4jnPuR
	4QGWg0BkPg/2+P3aLGE3v4duzCwG/aaOdhVTRONCpskjElsR9tbnOUeLXsIcw1HBwnXkuDLrQy5
	B78IMxnWDrby9orVYTh/IIsHbL2Ni7Dk7JvM448LWtyJXHCeL0bzcZf22Jxh4ie416xgaqssnRh
	OM/h56jflMjwC93qNumYxRe+7/0idN2sAj4FIXzx6L/fv3vlo2Q2yfjrBW2TM3gxyIvjkJotpbO
	nNxr6xTDl0U0TDlAV/KW4c5rW1iy3dO6MQ2yb4pLTa0UAdMG+jJzHCCA==
X-Received: by 2002:a05:7022:b88:b0:12c:8b9:720c with SMTP id a92af1059eb24-12dfd8113e2mr4714925c88.18.1777866832076;
        Sun, 03 May 2026 20:53:52 -0700 (PDT)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12df84252c0sm16423447c88.10.2026.05.03.20.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 20:53:51 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Sun, 03 May 2026 20:53:43 -0700
Subject: [PATCH v2] riscv/sifive: remove warning in errata
MIME-Version: 1.0
Message-Id: <20260503-sifive_errata-v1-1-6f12a81bc267@sifive.com>
X-B4-Tracking: v=1; b=H4sIAEYY+GkC/yWMwQqDMBAFf0X23ECaYCn+Siklrs92Pdiyq0EQ/
 91YjzMws5JBBUZNtZIii8l3LHC9VMSfNL7hpCtMwYebr310Jr1kvKCapuQi3xPqwNy1kUrzU/S
 y/H8PyoGep7O5HcDTMaJt2wH1cZ/gdQAAAA==
X-Change-ID: 20260503-sifive_errata-3c8ae52ccdb3
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Samuel Holland <samuel.holland@sifive.com>, conor@kernel.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 greentime.hu@sifive.com, vincent.chen@sifive.com, zong.li@sifive.com, 
 Yong-Xuan Wang <yongxuan.wang@sifive.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777866831; l=1068;
 i=yongxuan.wang@sifive.com; s=20260424; h=from:subject:message-id;
 bh=zo+0Udlcj2WN+ik80IClBgI+YMbBkl9zZrQFFlkWvBY=;
 b=ulplVFxAqFM1cpIiW4mGcF+U6l8lyi/HN251efmgulvuD8iKQEm0dLMhCSTWSOTwRV6isSaWp
 gwTqFb+qO/IB4iGpMJLeIBgKsIhfwRuamUyCd318f4XhY6y5LiGCeOX
X-Developer-Key: i=yongxuan.wang@sifive.com; a=ed25519;
 pk=+8NCHB1ZJvZthQAmZspOAaqjo+/snaW8mFSiDx45HxY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260503_205354_410333_A96ECF38 
X-CRM114-Status: UNSURE (   8.85  )
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

The alternative patching of sifive vendor extensions also calls the
sifive_errata_patch_func(), but the patch_id of the vendor extension
(ext + RISCV_VENDOR_EXT_ALTERNATIVES_BASE) is always larger than
ERRATA_SIFIVE_NUMBER. Remove this unnecessary warning.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
v2: update the description (Conor)
---
 arch/riscv/errata/sifive/errata.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/errata/sifive/errata.c b/arch/riscv/errata/sifive/errata.c
index d0c61f86cba3..98edd9143321 100644
--- a/arch/riscv/errata/sifive/errata.c
+++ b/arch/riscv/errata/sifive/errata.c
@@ -94,7 +94,6 @@ void sifive_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
 		if (alt->vendor_id != SIFIVE_VENDOR_ID)
 			continue;
 		if (alt->patch_id >= ERRATA_SIFIVE_NUMBER) {
-			WARN(1, "This errata id:%d is not in kernel errata list", alt->patch_id);
 			continue;
 		}
 

---
base-commit: 9b3a2be84803cf18c4b4d1efc695991f0daa153c
change-id: 20260503-sifive_errata-3c8ae52ccdb3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
