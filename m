Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17472E77179
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Dec 2024 10:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uT1B+2crqGJQpHXcUvS+aZRdkURk+zTdLberkzyCYlI=; b=0hsrlB7VxccOt1
	kpl+x2v5YuM0hpWjNoA3o+oIELGYhDtnvAJ/rBCGdK3CH+Z3mGvcTT07b6bHLudrUOfpbV5BhmzVu
	uZwCLtv9cCpo8Advs2c/Sx8rs7IExRcOae/JOuQVJ0gGCfPJfDECRktHVAdB7MgpsPkdp0ZgR77jo
	Ieeyx6CayCOdFWEWHPj9Xdm/g7z70mspvaV4FobZrsZZdScZ/dj1/Msbq3BornCwRX3IX6TWymvPO
	ebuW6GDP+92AZWUKpsXs3i6H9paj4y+G+VmS6TdH6Bj3njYcXzKfdYviMc4Cew92nbnZy70klnENK
	hL31dzSLRzh9BAHIxdWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9Lx-0000000FaY8-1UNZ;
	Thu, 05 Dec 2024 10:45:01 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9Fo-0000000FYJo-41uu
	for linux-riscv@lists.infradead.org;
	Thu, 05 Dec 2024 10:38:42 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-3a74d9aeb38so2661175ab.1
        for <linux-riscv@lists.infradead.org>; Thu, 05 Dec 2024 02:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1733395120; x=1733999920; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uQ/0Scy9E/wZ7/MnA5BYlbNUXDy/8A/TpwTZAMtapEc=;
        b=FH0A+dteoegbLPMy9M5NQkRlc/gp/62vrdVkaXWlXOine5hccCut39ZJ7pFIRw87MQ
         d6X3Lg3Fo0H6fBYN3eJ+oVDcJKmbp8MjeI606rrdaJfT2bXVAZtUbx2C/3uTJgGpLIuf
         JHcYXxcz6RZxelb04VEgo6d/osS3F70v0a96xTkPShyfeXOH0zLUmp0aXag8Z/h3BVV7
         clORTddaMMxHQyCVVC4cNttq0VUZ9/OnutOVq0NnQ9p9SHEI/TS2jExXgcBd6py2xzky
         h5fqqL8WBIx4uzQOBOcPVEyL+86IVCHYoSMyD0yUEr0/HbVXQPpZAc+lKjHdkGt05/yO
         pugQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733395120; x=1733999920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uQ/0Scy9E/wZ7/MnA5BYlbNUXDy/8A/TpwTZAMtapEc=;
        b=OhR+OaiuaMfp1QW5ghR2Q3SoTEpnAO3Xmj0gX4wc4kxzWSQxgb1UenR/2FDocf0IU6
         Fmxqpibfhh6mHjb0bqKfvCHk8PXDju8LfbXnyqf4utbvrnfxo1K8J62Aoo+XdF/t7sKZ
         XILbeWXWN0x2yOIxtgIpblFbpVtyUrhBa5Uejo8mdSypd53VbBkn1iqVzCU57wpNYOHc
         jDtGBUzCbXmQnitqovDs0HCYTzN1msH0tAmiSZ6UxRxms1dsjDJOaTwnfLW62+8gkSxs
         9NZVxn33YQFmgwZxgNc3yLJVUAJo2KcFRZRbSR2llcIZI1PAET+zguucp7wr5dvgxtJa
         dmVg==
X-Forwarded-Encrypted: i=1; AJvYcCVJwGtEahUWOCrOVWhzE15TwOstmtsrL7W+1g+4RryexIcZgFhhlcD/bTIeZZtqJd1NIKhGTU+LedKdMQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxSJFNkaaAVsFiyH8QgHpURg598ZQlZpPt5dR+ZbB41GzpO1vWB
	0EAVfT/IYKT9dPvMZXpRaInn/CSLfDaE0zJ1PN48vffV1365R7KRUQLw6wOGI74=
X-Gm-Gg: ASbGnct7O0r5kit/X0QJlWh8OOC7q5zmZljzx5H+U6jDW4V4/YyyNqFaNJo15Nk/1G0
	rRdy1f/oPHpac4gUpE1LPhG2blZ7Xcitk5ZEUu0TI3j0KKV8vt6sY3ZQzcigT6+OCmJ8IhP480V
	5E3d7BQbwAdiaT7XfjfGgYYKaHhL7R/JpSZyuJgtjEqKLdcjZb5JiYjFgPnu4Y5KmXIZqsD0hcW
	ivNQSMwcmKfttXv7JEyxNs9B/VM/42UU9ux7xD9Zm/u3SJM3FeLPbMQkXfldqpA04mDcb3G8QoD
	f5piwiG8upNIfQfo0f2fLiOmeOToadPe
X-Google-Smtp-Source: AGHT+IE8l6yfJ87eJad5FAeGJqDd+iC1OcZn198mK7ZYZDH6TLk8OTxSkqSKrMniNwvDITNae2Qz7w==
X-Received: by 2002:a05:6e02:144c:b0:3a7:d792:d6ad with SMTP id e9e14a558f8ab-3a7f9ab0ff1mr115272635ab.22.1733395119846;
        Thu, 05 Dec 2024 02:38:39 -0800 (PST)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd156f048csm886826a12.39.2024.12.05.02.38.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 05 Dec 2024 02:38:39 -0800 (PST)
From: Xu Lu <luxu.kernel@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	ardb@kernel.org,
	anup@brainfault.org,
	atishp@atishpatra.org
Cc: xieyongji@bytedance.com,
	lihangjing@bytedance.com,
	punit.agrawal@bytedance.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [RFC PATCH v2 15/21] riscv: mm: Adjust FIX_BTMAPS_SLOTS for variable PAGE_SIZE
Date: Thu,  5 Dec 2024 18:37:23 +0800
Message-Id: <20241205103729.14798-16-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241205103729.14798-1-luxu.kernel@bytedance.com>
References: <20241205103729.14798-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_023841_004646_9F558127 
X-CRM114-Status: UNSURE (   6.88  )
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

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/asm/fixmap.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/fixmap.h b/arch/riscv/include/asm/fixmap.h
index 0a55099bb734..17bf31334bd5 100644
--- a/arch/riscv/include/asm/fixmap.h
+++ b/arch/riscv/include/asm/fixmap.h
@@ -44,7 +44,8 @@ enum fixed_addresses {
 	 * before ioremap() is functional.
 	 */
 #define NR_FIX_BTMAPS		(SZ_256K / PAGE_SIZE)
-#define FIX_BTMAPS_SLOTS	7
+#define FIX_BTMAPS_SIZE		(FIXADDR_SIZE - ((FIX_BTMAP_END + 1) << PAGE_SHIFT))
+#define FIX_BTMAPS_SLOTS	(FIX_BTMAPS_SIZE / SZ_256K)
 #define TOTAL_FIX_BTMAPS	(NR_FIX_BTMAPS * FIX_BTMAPS_SLOTS)
 
 	FIX_BTMAP_END = __end_of_permanent_fixed_addresses,
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
