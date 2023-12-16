Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7255CC4167B
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Dec 2023 04:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:
	Message-ID:From:Date:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=94+1dTeJamp+Oz6DImna/60PUwdxUHGK3fQljvv/D88=; b=W1N
	hpjuMQhw3EhzO2LuGfUVAe1zQYcS7ygOXlz+zZvrtJzctrExJQzmY1LO22CF8iQSpFbtnt1hhA2ND
	QbCxdeaZxySQtmqzOl5GmbgiXWSnNrvKn1o7ztjsK0KBMQjGVZJfSlYeQ3HG1l+DVEYzVjRKqVNNk
	SJeoYMFXpjTJqMmHn8INfcyFS6p+SX7jTO5O1U4xqKPxG55yu5uCeD1XVQqDCnNQM0qwyF4G1sO5q
	0iMXkj3msy0StLhRe93MYIKavdA9QguLp+Hkaz3HE+sGF403w/8HTiEEibXeV2wClBOFTL9HjR646
	tNtgTlpbgFReeLPmnMr568ekpz8DcXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEMGw-005N2S-2I;
	Sat, 16 Dec 2023 04:27:30 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEMGt-005N0f-1p
	for linux-riscv@lists.infradead.org;
	Sat, 16 Dec 2023 04:27:29 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-50e23a4df33so810505e87.2
        for <linux-riscv@lists.infradead.org>; Fri, 15 Dec 2023 20:27:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=torrio.net; s=google; t=1702700844; x=1703305644; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:subject:to:message-id
         :reply-to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zChb5qXA7s0Kg6SWfzt8nB6BFjwDISwc+19kuIfnzUQ=;
        b=CUtp79RhQ4v+n3SszHl+5faiYEDcy4assnVTeOv9OyotmK6bIEHsKSrtxj5tHY5DNm
         KNTi8fqCq+gow++LDaIWXpez3HXZqF+nVJM3nnuQ/IUvlJ8cxc8ZjEciEIGQOrAQSerD
         2JkVQy4S0x560mn3lupV1oyENlArL0vZMrHOy5WjqeKFWUVId7kiY2oLrOGENyERc4to
         nfBQaSiV1BHkpw0Exs5LylueCVUNAtyT+Cqz7R7tQ6+GuqY7bg2mAKaNo/cWqb+hF/fd
         3PCKG4IK0LHb+H0xEnS6qCguQzYaKK3pH2rjwzD0QHeId5a2jH6OQalZE7lzKdquZQtT
         N3VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702700844; x=1703305644;
        h=content-transfer-encoding:mime-version:subject:to:message-id
         :reply-to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zChb5qXA7s0Kg6SWfzt8nB6BFjwDISwc+19kuIfnzUQ=;
        b=ZzklOTbpinhNfOdrQW5+4OA3s1QX8fpg/MnttY1rOjaeQKpa+aplsNzl3BXusTOmuu
         +DU8ro7rZsdP1lHzIbZ5oU4cXezc/lh/SmdagBYXk4BblYY7BIBR3FdRvKN+6WWiH7OJ
         TurxJoE+nKzpUb45UEplbaQa+pCf7EQ7jbMPNGOa0qTeedqT/jFa9EW+ue146Kn8zToO
         jpofr2GlYPgz/622ea4fc1zLkRCk7BF8fVDTRJKGM0xbmxoAsgtYtgncD94A2ySbxkub
         xiu/PMM5rDsutEtrcDKP6HZmxhJ4RFJXKwv0+5YQlyeKzoMDNqqHjaeMA2zgyizvOovH
         J1aA==
X-Gm-Message-State: AOJu0Ywb3NxmnKYWS67BBa8DegORzKNcp121ioiofDVe4Cfnd8zZJZTs
	un6VZ8vwahh0bYvOlUZ/rHomgPPvjsmjc0t+QCsC
X-Google-Smtp-Source: AGHT+IGmHvETaK6qCF6F80HLPP0xJEyq6PEniL7SkOACgsTZo0GQyuJYyFnIP354cmnwAqoHoqhhOg==
X-Received: by 2002:a05:6512:3a91:b0:50e:1878:77ce with SMTP id q17-20020a0565123a9100b0050e187877cemr2239431lfu.1.1702700843737;
        Fri, 15 Dec 2023 20:27:23 -0800 (PST)
Received: from [192.168.50.125] (c-73-238-229-134.hsd1.ma.comcast.net. [73.238.229.134])
        by smtp.gmail.com with ESMTPSA id v11-20020ac2592b000000b0050bfda10057sm2299810lfi.85.2023.12.15.20.27.22
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 15 Dec 2023 20:27:23 -0800 (PST)
Date: Fri, 15 Dec 2023 23:27:20 -0500
From: Victor Isaev <victor@torrio.net>
Message-ID: <73883406.20231215232720@torrio.net>
To: linux-riscv@lists.infradead.org
Subject: [PATCH] RISC-V: Update AT_VECTOR_SIZE_ARCH for new AT_MINSIGSTKSZ
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_202727_951212_47C8977D 
X-CRM114-Status: UNSURE (   9.02  )
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
Reply-To: Victor Isaev <victor@torrio.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

"riscv: signal: Report signal frame size to userspace via auxv" (e92f469)
has added new constant AT_MINSIGSTKSZ but failed to increment the size of
auxv, keeping AT_VECTOR_SIZE_ARCH at 9.
This fix correctly increments AT_VECTOR_SIZE_ARCH to 10, following the 
approach in the commit 94b07c1 ("arm64: signal: Report signal frame size
to userspace via auxv").

---
 a/arch/riscv/include/uapi/asm/auxvec.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/uapi/asm/auxvec.h b/arch/riscv/include/uapi/asm/auxvec.h
index 10aaa83db89e..95050ebe9ad0 100644
--- a/arch/riscv/include/uapi/asm/auxvec.h
+++ b/arch/riscv/include/uapi/asm/auxvec.h
@@ -34,7 +34,7 @@
 #define AT_L3_CACHEGEOMETRY    47

 /* entries in ARCH_DLINFO */
-#define AT_VECTOR_SIZE_ARCH    9
+#define AT_VECTOR_SIZE_ARCH    10
 #define AT_MINSIGSTKSZ         51

 #endif /* _UAPI_ASM_RISCV_AUXVEC_H */
---

Signed-off-by: Victor Isaev <isv@google.com>
Signed-off-by: Ivan Komarov <ivan.komarov@dfyz.info>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
