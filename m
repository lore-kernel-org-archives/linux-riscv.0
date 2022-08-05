Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80C8BC00140
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Aug 2022 16:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6yl4tQKItSkb/EsauVkoyOasLZeyvzhSsRkfivUBDCs=; b=mY3XQvwz4Ux0qd
	zFbMZTWNWDRsMmN5saThyUK5i/HCO8u6KQFJzOUneT09xTXkNOgQg+NyZ1UdAFjSG+SnyjEVzCZAH
	Butwlg3K3KqpUuDqg5uDRdPOP2nwkCW1nMP3IT3e7alrxjltlqLUmPqkGZbC0WgbIZQ3/jNXlBKsW
	Y/Me1uf0aHbr7HUui5aWxykUAKY1lvE95hcOnhdogmnFC+muWP8FZ/04IlUo6SNWAairiE6kADekG
	KxkHe2dgP6hWSQIcI0i5UBYPFavks3gUg6C6otVRdWqcuZDnQstUD2dq2gowT48rUkIgT3vqaXOHm
	12jbCgfk6oi17YAPLmEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJzkk-00GXLX-MW; Fri, 05 Aug 2022 16:00:47 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJzeV-00GTaY-Mh
	for linux-riscv@lists.infradead.org; Fri, 05 Aug 2022 15:54:21 +0000
Received: by mail-wr1-x42d.google.com with SMTP id p10so3691138wru.8
        for <linux-riscv@lists.infradead.org>; Fri, 05 Aug 2022 08:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=k/xzRy6n6kryMDsLlFXQYpE8ENmkU+xTgBLizNQ4axM=;
        b=VCbM1SuFksRv50tsWgQAocIb7lLKRe0Rj05acF8vAjax+hZAQAC0dCxxbSbo4/6sUv
         yC4oOt5UVo6+aJfUxNf3FCHmCQ+Q5OhB9kD8AidTvpVLbInR1vDplRStniKhs8BviImS
         V+bNyZw02DfIDSAIPRC4/D8PN/GPZtl5acTv2Mwj1xul8/yJpG386+zQAUryEyGT3eFv
         P4su4iW4iyaXbhMY7iDADPBN51dTgzTHuqFCLBvWuHarR9fuMGv/ZWcSUGJx7L4fHkA9
         RsdAS11TIVgqBEwM+uQL26fSu22xkR12FZanVZPrqiXmg7JnYKTrYd5AVjR9yvd2Ksqs
         N4Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=k/xzRy6n6kryMDsLlFXQYpE8ENmkU+xTgBLizNQ4axM=;
        b=Su2z9PLWsY7MOcudTGGpLUTgo9BImh4EArBcTjwqFif6af136ZrgAATWb/EW+Ht0ys
         tQepXqj1n4AAn1XM23arD4KkEWja+fth28KrPxLbZdEjZ0HCzuElo+fzDe0FSX6oXqkB
         QOnRuWHLuzjGaoYM4ZxGMuoDQb29rU9353HC3IxWm+Ko4XFVg/xToNa7tnxJnUwEn+7p
         wnIg1skeSmzN50ekqcNMRQbbVn8Rvuryy8DAKxeve3cNbo0KGBTu2m82JfZm0OQvZ4hL
         jdTOjurAvwVAmEjesPg81hPVIcWVZgo11q1Ow51elL38AGQOe5vawH7ViQrHt93JySoR
         iIOg==
X-Gm-Message-State: ACgBeo3VDRzBahFtyFcOd3+4AgPqs/UDuR5IpfWOUavKNyjbtsfFdWwQ
	dnDNn7Kcc9uZBvxxxdOuYnHQew==
X-Google-Smtp-Source: AA6agR5mcr2sQ/sALCUIzgWdKT5088DtbcOo38FdmnmtJqGqH8Fzuys8fOyttlA0Op+TFIdqvZxLOg==
X-Received: by 2002:a05:6000:693:b0:221:7a12:8d6a with SMTP id bo19-20020a056000069300b002217a128d6amr1570978wrb.290.1659714858342;
        Fri, 05 Aug 2022 08:54:18 -0700 (PDT)
Received: from henark71.. ([93.107.66.220])
        by smtp.gmail.com with ESMTPSA id t10-20020a5d49ca000000b0021d6dad334bsm4133543wrs.4.2022.08.05.08.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 08:54:17 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bin Meng <bin.meng@windriver.com>
Cc: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org,
	linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@sifive.com>
Subject: [PATCH 1/5] target/riscv: Ignore the S and U letters when formatting ISA strings
Date: Fri,  5 Aug 2022 16:54:01 +0100
Message-Id: <20220805155405.1504081-2-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220805155405.1504081-1-mail@conchuod.ie>
References: <20220805155405.1504081-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220805_085419_781938_4272319C 
X-CRM114-Status: GOOD (  12.90  )
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

From: Palmer Dabbelt <palmer@sifive.com>

The ISA strings we're providing from QEMU aren't actually legal RISC-V
ISA strings, as both S and U cannot exist as single-letter extensions
and must instead be multi-letter strings.  We're still using the ISA
strings inside QEMU to track the availiable extensions, so just strip
out the S and U extensions when formatting ISA strings.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
[Conor: rebased on 7.1.0-rc1 & slightly tweaked the commit message]
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 target/riscv/cpu.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ac6f82ebd0..95fdc03b3d 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1122,7 +1122,23 @@ char *riscv_isa_string(RISCVCPU *cpu)
     char *p = isa_str + snprintf(isa_str, maxlen, "rv%d", TARGET_LONG_BITS);
     for (i = 0; i < sizeof(riscv_single_letter_exts) - 1; i++) {
         if (cpu->env.misa_ext & RV(riscv_single_letter_exts[i])) {
-            *p++ = qemu_tolower(riscv_single_letter_exts[i]);
+            char lower = qemu_tolower(riscv_single_letter_exts[i]);
+            switch (lower) {
+                case 's':
+                case 'u':
+                    /*
+                    * The 's' and 'u' letters shouldn't show up in ISA strings as
+                    * they're not extensions, but they should show up in MISA.
+                    * Since we use these letters interally as a pseudo ISA string
+                    * to set MISA it's easier to just strip them out when
+                    * formatting the ISA string.
+                    */
+                    break;
+
+                default:
+                    *p++ = lower;
+                    break;
+            }
         }
     }
     *p = '\0';
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
