Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E25D1C369AB
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Apr 2025 05:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WQKaRwC2Jo7G+Ar7cGe+u0A5MtilQZlxMjgJnVNM95U=; b=A1a8x3tcU1k+cO
	r+Lv+FJoCr3s4H0lusnwrkggyRsFwqVEfhjuzptf3SB7VPde/OnbDvOLsTwHYwayKDwrbNlsJVk3j
	5Ef1Xv7kHH7hosWjkGhgnYz5e7xTIhbufwER3LNkqx5dgXX1xvFEYLz/GUehL2tdo7844CypGCy16
	u/G/+MwCpQVQGOOhnAsp0m3kHnFsVpyBKnYuZojfcScfL2lqEN+OzSnRbHRCUXIThvNySbl9LJcwZ
	ij0mpHB7MdHwzzxqCLjxK0lxKQmOaqAof+Ul2GuVLxbHj3JncvW/yCuqaytHpN0ZrT06hxeiYNhWy
	i5ABkX9hwzZAO9TWzoLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5eNG-0000000F9p9-2klU;
	Fri, 18 Apr 2025 05:34:50 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5eNC-0000000F9lV-3Aw6
	for linux-riscv@lists.infradead.org;
	Fri, 18 Apr 2025 05:34:48 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-736b98acaadso1595610b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 17 Apr 2025 22:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1744954486; x=1745559286; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YHR6GhsJ93bX5ZzvrljhM09iosbdwKgwllH+L65tMJE=;
        b=kSOcaT2iedin+VZ0FMDae56QeQPu6jLpQg3ZmlmQ6eQV6wIzqP7UxviiQN3KfUlWRj
         CwsKHPOuYY64QAn4Jz3qGN04LBzdBe3mGWzhIDsATiBG5TUyFytUcqbEI2qjTr+Hjo7o
         s5o2fumKK8GcVqMVDGKc9CPrx1/QO6KPARVNiYLZa5edMfwBlsQVY549KekfWzt9qe5I
         yL4KA7pvwjMk40xjCPCdjyYimALoeU/XJFWQPU4e0vVWcbZ5+bh/qeHhfHTZ0pY6CzLo
         GoTVsvvzm2Hf4f9hVFn0BNQWGvWIgRnIyh3ISij3giBGPoQOO90lwvtyY6CuL1fblc9y
         iRnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744954486; x=1745559286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YHR6GhsJ93bX5ZzvrljhM09iosbdwKgwllH+L65tMJE=;
        b=pbrDmzbC43s8g8GgP5bG3v3KJQptD+jT+haablHiQNemR+NVQGUqzxo8U/1RmnlGLq
         jFwTNuPgNpHijlmK4pxMLAOlTqSrGZAP5I44z4hz0f5rEdU4DAdtHmNYR8b34eUpNW6j
         k+5EnwBm+BCXFLfNWv4NIs2XQeh9Og0uOVvZDmylyyoIL+uViA7/A/+3Yj5N6lzoxgUO
         Yn43bubFW/o0c4XDraZGiPfTU2NrKysfleBJ0bUjLf1eW88si9B+4OjbQGBEZAC+32Za
         lCQ8Z/FabL8x5bWMrZiXhOkXKY5ZJWmAqROA0Q7LR1j4W8dYNPR96sa2K4Gjbp+gadhA
         KCHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKGb1hr76XFnh33Mw+jZbGHk40ciHiHdajL9OzaRfI5TBTMxDFoyQb+yFDCP8TkZ2xmhbXEwMEU+IxCQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzK28O19jbEdQtXGlRTOQeIvt9LqMLqWgLaHQm9dUpxhug8J1Ur
	NVybacbA/eINHo+K6O0SZDhp3a4G72DBpDsqbvJOYjoT5VTIO3nTDq9SYebe6wU=
X-Gm-Gg: ASbGncvr1eWjigKcT1m3kH+fanL34LuxEBi3orWLmmocCGtZjo3Nd6LQuHXDTWOH1As
	0/vxiIzUFXtK5ZbVWYhSy0jKoe5U3DYLRaNRFoYlMMGf7g3OEu2ONghKcxyJ8iXkcXmQiCcsCIk
	9/8LkrFaEwef9Oh8QxupuElMBozm2H31SsxqlQjz1oF5yH/GWPlqRDG21ZT6CEeaARiwUIAHV8R
	oZzgna6zmTqGIrJ9yMluy36Kxw9i1a2mea4a3tS3y1UTjoItoFcDa2ikTyecieXObUnjK+y2jGe
	uHlZOhwLS8TvHfDvXK2Goitwl89cfYNItLgfOOMep7rgzaFJ0tLrXVe5vj4mc9ulZDWpbWFast3
	DTztU5R2wZjI=
X-Google-Smtp-Source: AGHT+IE94GrG6NgY94ivBPu/h8Nj3d+BVoWj25z9GYvOP7uZPO9BGG//BTMuP3HCRMD4vlqRI/woGQ==
X-Received: by 2002:a05:6a00:4acc:b0:736:3be3:3d77 with SMTP id d2e1a72fcca58-73dc156f96bmr1971764b3a.16.1744954485769;
        Thu, 17 Apr 2025 22:34:45 -0700 (PDT)
Received: from cyan-mbp.internal.sifive.com ([136.226.240.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfaed86csm834555b3a.180.2025.04.17.22.34.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Apr 2025 22:34:45 -0700 (PDT)
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
Subject: [PATCH 12/12] riscv: hwprobe: Add SiFive xsfvfwmaccqqq vendor extension
Date: Fri, 18 Apr 2025 13:32:39 +0800
Message-Id: <20250418053239.4351-13-cyan.yang@sifive.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250418053239.4351-1-cyan.yang@sifive.com>
References: <20250418053239.4351-1-cyan.yang@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_223446_803234_B6DF21E2 
X-CRM114-Status: UNSURE (   7.23  )
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
