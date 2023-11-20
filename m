Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2EB4C2BB3F
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Nov 2023 17:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Rkj8m5VD7pXCKqsVXB+5InzK/Q0ao2P4oseRtj6Q5OY=; b=QMfkJ4PIUIURh2
	OW3546hnZn/rh7uumVngU1O4GK6YyETkUASkmtdxejS0u3NSwTA5nkmZ2Vy0BjR3pUjX95CwVaHt9
	Gab+k0HgOxzh2XU5GsD0p+ZUJhRQ+CtmE1NJOsDlD1ZuQ1M7/mSkIdRUUmsItahW6CeyOar3MA/ok
	nKEVBCv9L6eBggO2UJg+a2fxg0dn0g+0w1ZjCMuVMwVmLO2/BVAlfpBfeAIsbzXCJsKZUrSeOL+JP
	9tJEvg/PjuOVLy95kwIBqjrUeWR+Eu4839lB0umT3oYNGURy/v5tD9ObEiELY6iOV6vaK6PSTP+fm
	YQTyCPXflgnjUrDlbfLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r58Cc-00Dtnu-0c;
	Mon, 20 Nov 2023 17:36:54 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r58CZ-00DtlK-0d
	for linux-riscv@lists.infradead.org;
	Mon, 20 Nov 2023 17:36:53 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-1f9601fd9b1so84385fac.1
        for <linux-riscv@lists.infradead.org>; Mon, 20 Nov 2023 09:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1700501809; x=1701106609; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6S4PK8WT3cwW+G2GrOmybB1YODe/+PbVzMA49NRihL0=;
        b=AZ2xjK6g3Rz5013+NCCGqQXCFDH7JoLxSMgh2TYDEKaYPM2HJdU0AiW3eNCJNhuUhF
         b5SEc1gL4ypYh0tyfuu9cLBXmYnQ2twl93hO2HVP6fLkQT7RmRJ/acY1kDvF8/il6LYV
         6LE8Fe3YTn5XGo3f5U8rRVUpPh9C90+cqoVbOmi4jxdGHpI1iGd5rB4uywk9YAmf1UQw
         JTamPGdfodb6LwW9KSkhSEu2NW6TsbxVMRYEKWT4IeNrLh6LlUTHpI2ZQItt0Y+gODXM
         Kjed/7Yrt08+OVi/n6rbJX8JE7vCH4bVSGjS1/Jiuy3eKid3XigLufPP6NF9qi01vvCd
         9sTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700501809; x=1701106609;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6S4PK8WT3cwW+G2GrOmybB1YODe/+PbVzMA49NRihL0=;
        b=is1dep5oFktezCzLOJQPR0zsYtJKpiLjPE1kJJsGAXykJYik9pm82cbxl+CLbxfvlD
         P52nWr8U0CX3Dr/8ew8MK93NOT661NXrrWYhNIdU71M8slgudsDz/PDE6Bvg9L2DALQg
         vG+5UD9oQ+vdiDZVhKIbi4nteDQmx+IHoRSugCsEr1Fs2tNYm4CtIeEOX6w/+SlaFfpO
         rHZZmCckss8mh5pNza7p+p1L+1pCMRDmlSO4hQrh+S80bsXcH+TViuMrSuYaH6Q3/src
         3XwlGXqObmaG76RrBE1NMDh+TKWQLCGXjnEFm/455vBYJh/WYrq3ZrpUnVoqO6L2yZsH
         hGng==
X-Gm-Message-State: AOJu0YwFDNjyFSYJLIO65mVhUgXevjpWa5+EZQU6B1InvGzbreYnH8kb
	aOoguoXNu3EVBBdlGzPtgKejWg==
X-Google-Smtp-Source: AGHT+IGl6FR1QPuWw83tR4YZijGxBbFwW2zBDfGjF5hcAg8Pg3Q6u4xrWAUQF0k15hXtsQj+Z3VEbA==
X-Received: by 2002:a05:6870:d3c3:b0:1f0:4e1f:e09a with SMTP id l3-20020a056870d3c300b001f04e1fe09amr116089oag.4.1700501809323;
        Mon, 20 Nov 2023 09:36:49 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id x55-20020a056830247700b006d64b970519sm1245547otr.2.2023.11.20.09.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 09:36:48 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 20 Nov 2023 09:36:39 -0800
Subject: [PATCH] riscv: Safely remove entries from relocation list
MIME-Version: 1.0
Message-Id: <20231120-module_linking_freeing-v1-1-fff81d7289fc@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIACaZW2UC/x2MQQqAIBQFrxJ/naA/3HSViMh61aeyUIogvHvSa
 pjFzEsRQRCpLl4KuCXK4bOYsqBh6f0MJWN2Ys2VMazVfozXhm4Tv4qfuykAmYqd7SvH1joLyvE
 ZMMnzj5s2pQ90t4V7aAAAAA==
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Ron Economos <re@w6rz.net>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_093651_456558_6C1E6EA8 
X-CRM114-Status: UNSURE (   9.35  )
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

Use the safe versions of list and hlist iteration to safely remove
entries from the module relocation lists.

Fixes: 8fd6c5142395 ("riscv: Add remaining module relocations")
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/kernel/module.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index 56a8c78e9e21..209db949a06e 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -624,18 +624,25 @@ void process_accumulated_relocations(struct module *me)
 	 *	- Each relocation entry for a location address
 	 */
 	struct used_bucket *bucket_iter;
+	struct used_bucket *bucket_iter_tmp;
 	struct relocation_head *rel_head_iter;
+	struct hlist_node *rel_head_iter_tmp;
 	struct relocation_entry *rel_entry_iter;
+	struct relocation_entry *rel_entry_iter_tmp;
 	int curr_type;
 	void *location;
 	long buffer;
 
-	list_for_each_entry(bucket_iter, &used_buckets_list, head) {
-		hlist_for_each_entry(rel_head_iter, bucket_iter->bucket, node) {
+	list_for_each_entry_safe(bucket_iter, bucket_iter_tmp,
+				 &used_buckets_list, head) {
+		hlist_for_each_entry_safe(rel_head_iter, rel_head_iter_tmp,
+					  bucket_iter->bucket, node) {
 			buffer = 0;
 			location = rel_head_iter->location;
-			list_for_each_entry(rel_entry_iter,
-					    rel_head_iter->rel_entry, head) {
+			list_for_each_entry_safe(rel_entry_iter,
+						 rel_entry_iter_tmp,
+						 rel_head_iter->rel_entry,
+						 head) {
 				curr_type = rel_entry_iter->type;
 				reloc_handlers[curr_type].reloc_handler(
 					me, &buffer, rel_entry_iter->value);

---
base-commit: b85ea95d086471afb4ad062012a4d73cd328fa86
change-id: 20231120-module_linking_freeing-2b5a3b255b5e
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
