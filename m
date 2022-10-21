Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8576AC43217
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Oct 2022 10:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PLmbcUu+1YtgbPXVdV5bjbUw7a1Vh5BZoKPhXFa4OuU=; b=oQPk2vXPBFxYog
	EnVQG8AHaiW4A6EF8eQLymNkhQj975wsD7OfNSKQlgE7NQcLyeedZaA7n1psW3E4cR5AQXjmiyJmJ
	4IJ/+ciPEnJ+EDK9x8YUr30YFMgM08/kE94NmvC68puZE5E1WvtfoKbk8wIDhzf1nQQ/V5GHmA9mk
	3YiVB8Ag8BzKBJ+R5WThnR7/Xzz5RnvXqMEe2w3XI0Qzw1Kn/xvrg56QPg4+9mkCQrIvl6P9ynj3q
	SZZ9WewTywcTsKKfW0h2z2rDkNE4/7VSnrJ1pklEiJ/ENLUJhGkb5ibfWGZSJMk0+GsjDzUR5Oneh
	wbiPjsc25xejhfWfbRVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olpkF-007Fi7-26; Fri, 21 Oct 2022 10:59:19 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olpk9-007FeG-0D
	for linux-riscv@lists.infradead.org; Fri, 21 Oct 2022 10:59:14 +0000
Received: by mail-ed1-x535.google.com with SMTP id u21so4341273edi.9
        for <linux-riscv@lists.infradead.org>; Fri, 21 Oct 2022 03:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kUBRhR1TzMPRlwt058tHxt9tC26aKYFVoa5R0ObwQMU=;
        b=Gfk3arAiX79Ol3wlq1f93vZWqnXXT35WvvdQl5VbIiB8fbqoEUMTngXW8Ped4H1s/i
         PVBIulwsp8hC/5JWeI+OzwRFrW7BD5ed+4tp0cYbu3C5VSdOC05hrrIILNn5IkpvWZqC
         w+9juzakCsDXIBr7QpDbEQgn6QcLvlQoMxwYVWl8HO48e8EaYS/88GuKbu9oli3DMOuQ
         xwMWf58SKccF7E6XG2llcpQxsUwz00JEi/wDAfry+1o37fZFJdD085LWmD+6iu543aLU
         jpNRwBZEo5Py9kzAMqxQm3y+3vArPq5iX5PuLon0MqVPNGmhUS/RNktw8tDBB5IGzvNz
         wG2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kUBRhR1TzMPRlwt058tHxt9tC26aKYFVoa5R0ObwQMU=;
        b=RZ08eJNYvxpVdyOfBHz8RvQAuKqf6ddc27Vk3k889zrIGGENqb/fC622bEVBtnk4As
         wXyD3KoteweiLDyyr6o7QWwP36sJoUFMGjxEVM8/ZNahPFwD0n3F13hm4azoZVXWOq3T
         K7Tp9UAjEV2ihirianMJeW6p1FYHI/dKeL96o87R+4mtOzsnjId+AMc90tsA4XerV6JM
         tCKa8IhjZ080zAUnFNThlvdboTDP6oPvwIWtfVcLiX5CgDTkymku5E/0aVBwfy1oLU1f
         l1uGx8HC8ToglX2VBEB57QPUq/smLrX2RObRcGgba5yKeOdFKgGBmHoi49nVqXPxAKUa
         TwRg==
X-Gm-Message-State: ACrzQf3QbK2LLHhdRpxPw9pFEFEWB+TBEAQgh5luUQ3vaNNAHMYkKG5G
	BYwqEQI7XtMCJwdX/xYVYc4y6BEdbwJ+nQ==
X-Google-Smtp-Source: AMsMyM59Nk7hwS/jQsQwY9kaHEK2nipyhvYpXwSCCN0PSvOl7KE2rQXbYaMApC7wEmdNkedIOp9nGQ==
X-Received: by 2002:a17:907:60c7:b0:78e:1cc:57de with SMTP id hv7-20020a17090760c700b0078e01cc57demr14963085ejc.33.1666349950001;
        Fri, 21 Oct 2022 03:59:10 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id r2-20020a1709061ba200b0078d76ee7543sm11398542ejg.222.2022.10.21.03.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 03:59:09 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH 2/3] RISC-V: Introduce riscv_isa_extension_check
Date: Fri, 21 Oct 2022 12:59:04 +0200
Message-Id: <20221021105905.206385-3-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221021105905.206385-1-ajones@ventanamicro.com>
References: <20221021105905.206385-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_035913_064769_5AD9FE28 
X-CRM114-Status: GOOD (  14.07  )
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

Currently any isa extension found in the isa string is set in the
isa bitmap. An isa extension set in the bitmap indicates that the
extension is present and may be used (a.k.a is enabled). However,
when an extension cannot be used due to missing dependencies or
errata it should not be added to the bitmap. Introduce a function
where additional checks may be placed in order to determine if an
extension should be enabled or not.

Note, the checks may simply indicate an issue with the DT, but,
since extensions may be used in early boot, it's not always possible
to simply produce an error at the point the issue is determined.
It's best to keep the extension disabled and produce an error.

No functional change intended, as the function is only introduced
and always returns true. A later patch will provide checks for an
isa extension.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kernel/cpufeature.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 4677320d7e31..220be7222129 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -68,6 +68,11 @@ bool __riscv_isa_extension_available(const unsigned long *isa_bitmap, int bit)
 }
 EXPORT_SYMBOL_GPL(__riscv_isa_extension_available);
 
+static bool riscv_isa_extension_check(int id)
+{
+	return true;
+}
+
 void __init riscv_fill_hwcap(void)
 {
 	struct device_node *node;
@@ -189,7 +194,8 @@ void __init riscv_fill_hwcap(void)
 #define SET_ISA_EXT_MAP(name, bit)						\
 			do {							\
 				if ((ext_end - ext == sizeof(name) - 1) &&	\
-				     !memcmp(ext, name, sizeof(name) - 1))	\
+				     !memcmp(ext, name, sizeof(name) - 1) &&	\
+				     riscv_isa_extension_check(bit))		\
 					set_bit(bit, this_isa);			\
 			} while (false)						\
 
@@ -198,8 +204,10 @@ void __init riscv_fill_hwcap(void)
 			if (!ext_long) {
 				int nr = *ext - 'a';
 
-				this_hwcap |= isa2hwcap[nr];
-				set_bit(nr, this_isa);
+				if (riscv_isa_extension_check(nr)) {
+					this_hwcap |= isa2hwcap[nr];
+					set_bit(nr, this_isa);
+				}
 			} else {
 				SET_ISA_EXT_MAP("sscofpmf", RISCV_ISA_EXT_SSCOFPMF);
 				SET_ISA_EXT_MAP("svpbmt", RISCV_ISA_EXT_SVPBMT);
-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
