Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8917C3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri, 16 May 2025 03:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WQKaRwC2Jo7G+Ar7cGe+u0A5MtilQZlxMjgJnVNM95U=; b=X5IvTykg+BfQow
	fXXBlNtjXMxhwvzkg8YpmMmFhnzzx75lhmWOsba83R3Hsayroxo2CF0xYMSUpNMVHrtQUxns0W/UV
	PXdG8v/hLVPx9EQvEYfKNqXacbvIOwGU3uAtzZ6YQL3tsqbmz7SK3qZH1nHFP81k94A3GFY+xWSRl
	4bTBLWK3xE1a1iG9X83W+xuw3o7LSeIoGI9BHKAt2eZC31GFc0IViJ8L6bZ89ZOFKA7GMxBbraP+p
	trXj1Cw6lAA625N2hmhxtK6NoUTXzOa2m8I9rd8EYgjMyvmNAy9wbHYxp0RP6t1HMGCL18nQxcuB9
	QezS4YMBBG8bqAMM954A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFlOs-00000002KLA-0yRU;
	Fri, 16 May 2025 03:06:18 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFlOn-00000002KEX-0nWx
	for linux-riscv@lists.infradead.org;
	Fri, 16 May 2025 03:06:14 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-b24f986674fso1613216a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 15 May 2025 20:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1747364772; x=1747969572; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YHR6GhsJ93bX5ZzvrljhM09iosbdwKgwllH+L65tMJE=;
        b=jshGb5pDfFMF2UG8aPxJShuQjg/j81yOQ34IOOIGVl4yNcZwWVJYOIxlXVVDBXiDfI
         TlXSPsjnZmGjsel9hxQ07SFwDnqYUbURoxGa6IboLpL0FU6b0XAQhzDWW6ALejH96pBz
         uJ5Nx9W2XOK8XSLRAnvYwr/gU57+RSIU3ZPrBnYLso5WXXC197urLNkViI82ZWSjIvT+
         7GDsA2ZUOfLxZ/bJhoC4TPZxJKlcpPfKoYkxPmPv9eFxPGJz9U0foAS8H27RyU5L1FB9
         3D7k8HDOjGV7h+UCP+TwE45UYt25CXlYy2RHErh+xb/bt4c4qn7zK+shBkaXc8i6KFzh
         ksRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747364772; x=1747969572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YHR6GhsJ93bX5ZzvrljhM09iosbdwKgwllH+L65tMJE=;
        b=RXCiOPQO1NwcfQLFf2ZkZYNV66aDbikpvskaYT1AdBazI19QWtwY0Mr1SxU1jgYU+F
         +444qC1CT95Ot1Sv65tSEg5kapgyPfi/cTtvcx/ZIM86XvUcMyezWdge2OVlqpWhaor7
         8WW4CMvGpoh8OPFEfbeU66hxLUStDJ+mjBTeOqd81hy4zz493UUDYswQHSDOOXuiJ/X4
         rz56GPp0p4Ug4FgVJFtFhcuanrTbRQD3u15s27MOpHj0xWTxLJaQy1OvAUefJcdhkvnp
         FnMeVPpfTlLlcHVv2PNjxEU9c7ML1rZahrrD4i3YoH5fDCKY6+Renx2MixB2QyebwLBO
         tKEw==
X-Forwarded-Encrypted: i=1; AJvYcCW/KV0eb4fWPGYhZutSg0+EFiY8bJJiaxCeXmTaUenWQJruWtNYHhL9Qb58cTNTT0Ie819l0GrN5wo/Eg==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywn/YCRWO97RTBBczpRUEik9wOt4gTnQhGcGxqQ0fDboi8bIe6P
	fJmL58dez3B6aILdfHZwbzwI3OuSdWSn5DyFa3kHtianfQ+NKuS0G64bOWMKPqCMeck=
X-Gm-Gg: ASbGncs571PKRUf7HO/xL5g6pKilqgS/UUWVKbuNKD73UpbVNZ05gpVVxJAyZi8uT/i
	6emmkkMtwEPqd4scs2uskNh8yVruKRn70IKgKzP4c2ApmS+S5UiJgpRmZz1RVlWmlxSalRO5eIs
	YXgdDEvF54+wyqjPEG+PTyynDq7ndecR/rGW3IyBxstm3tgXztaFnEBOkQmaK/lItZBpRkp/2qv
	iq9TKi2Ohs7Ja1HkNXgviaokk/9589cuM1YZHkSPOlS95T05bYj3RsUNFTtnTSQQuVKr4e1YOO/
	vJcEvwDnIim8XA9Xp8Un+OHRXamGANcPoJGXPN7ArhNeGhGPLiTB77/zHtKfN22N7aU0mYNbjCZ
	9ClQWPtRqC68=
X-Google-Smtp-Source: AGHT+IGrzLhyAYfRZnDxkA+4hDDWDsptQiEhouC6msgaCuEbtNMMMwi7Lg79hIno1E+iRF7n6KqiwA==
X-Received: by 2002:a17:902:da91:b0:215:a303:24e9 with SMTP id d9443c01a7336-231d4ae1de4mr19300975ad.3.1747364772565;
        Thu, 15 May 2025 20:06:12 -0700 (PDT)
Received: from cyan-mbp.internal.sifive.com ([136.226.240.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ebb084sm4804405ad.201.2025.05.15.20.06.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 15 May 2025 20:06:11 -0700 (PDT)
From: Cyan Yang <cyan.yang@sifive.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	samuel.holland@sifive.com
Cc: linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Cyan Yang <cyan.yang@sifive.com>
Subject: [PATCH v2 12/12] riscv: hwprobe: Add SiFive xsfvfwmaccqqq vendor extension
Date: Fri, 16 May 2025 11:03:10 +0800
Message-Id: <20250516030310.16950-13-cyan.yang@sifive.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250516030310.16950-1-cyan.yang@sifive.com>
References: <20250516030310.16950-1-cyan.yang@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_200613_360859_99795847 
X-CRM114-Status: UNSURE (   7.65  )
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

Add hwprobe for SiFive "xsfvfwmaccqqq" vendor extension.

Signed-off-by: Cyan Yang <cyan.yang@sifive.com>
---
 arch/riscv/include/uapi/asm/vendor/sifive.h          | 1 +
 arch/riscv/kernel/vendor_extensions/sifive_hwprobe.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/vendor/sifive.h b/arch/riscv/include/uapi/asm/vendor/sifive.h
index b772d4631284..9f3278a4b298 100644
--- a/arch/riscv/include/uapi/asm/vendor/sifive.h
+++ b/arch/riscv/include/uapi/asm/vendor/sifive.h
@@ -3,3 +3,4 @@
 #define	RISCV_HWPROBE_VENDOR_EXT_XSFVQMACCDOD		(1 << 0)
 #define	RISCV_HWPROBE_VENDOR_EXT_XSFVQMACCQOQ		(1 << 1)
 #define	RISCV_HWPROBE_VENDOR_EXT_XSFVFNRCLIPXFQF		(1 << 2)
+#define	RISCV_HWPROBE_VENDOR_EXT_XSFVFWMACCQQQ		(1 << 3)
diff --git a/arch/riscv/kernel/vendor_extensions/sifive_hwprobe.c b/arch/riscv/kernel/vendor_extensions/sifive_hwprobe.c
index 2b9505079a9f..1f77f6309763 100644
--- a/arch/riscv/kernel/vendor_extensions/sifive_hwprobe.c
+++ b/arch/riscv/kernel/vendor_extensions/sifive_hwprobe.c
@@ -17,5 +17,6 @@ void hwprobe_isa_vendor_ext_sifive_0(struct riscv_hwprobe *pair, const struct cp
 		VENDOR_EXT_KEY(XSFVQMACCDOD);
 		VENDOR_EXT_KEY(XSFVQMACCQOQ);
 		VENDOR_EXT_KEY(XSFVFNRCLIPXFQF);
+		VENDOR_EXT_KEY(XSFVFWMACCQQQ);
 	});
 }
-- 
2.39.5 (Apple Git-154)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
