Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20623CCF9E3
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Nov 2025 15:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BBJ4Q2Jr1GqWrJ0T1uxEUrAjeUQQ7bNVMKdwAROYSGo=; b=r36DswE3PONS0X
	5Xns8dOKLsI++Fg4rfBuw0+Aafk9cE59xXe+9sR4bBVorpkxDMWer9byzmD2J3/RbCNjwPN04fHWl
	xkA9zGuo2YKYhZUSsVdz2PlwNwvO0I0XBftr1t3kV+/D577WAAetOWxk6kGuDa4qli+jOsfa1ac+1
	lPAjxXvrOzFcYaEauWXU7K0j0Unfy/NHv+T6Q3aWLOQgLSMbLIpjenBgnBc17plqQma83G9hl1OGT
	uSMq/ASkgP0GRryZEgSfH0+l1VKJ8p1Jl02ZCu6d/xd5TKqKR6tVZwr6fyQA7D8Vz6dkJPi3cEF7U
	i7RVSxvvUyyXNwikMd4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIU3U-00000005iVT-2aWt;
	Mon, 10 Nov 2025 15:43:44 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIU3Q-00000005iTB-3ifJ
	for linux-riscv@lists.infradead.org;
	Mon, 10 Nov 2025 15:43:42 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2982237a3b3so9028405ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 10 Nov 2025 07:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762789419; x=1763394219; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gLAK+1utwDQJnW79jqnXsBU1gEdDxofO6NOCNqDBYAA=;
        b=VVDpeet5QkaEOb1193U89D1Z018siVfwN5bL9qpYMCRLaxF8uToYtiQv/0YoRyEBE9
         JxgYB0D7C/kG4L84+Qo5ZNqjkC3/CV0FXcrIXkB50GOmuV5PAjjuNuqPFt2U1ZlxP46e
         hOzflcfcKagN1ZZLxasQpN68iS1TyCgijBWIGOhKZ+Zs8H/PtTKKOlZb8TsZYdCQzpjS
         g5yEL3g1Iy7GE/BK1jvfWjZ09wprHUXruoCz3yijPKp+D8W+zgbQv9DCRe8TKX7vSU57
         9ZfLTC2eTZ00jhnkUbr7okTr5RFDdp2ZrwG3lWcgpKWjlW33L3ZIl3eKdvE/KBSd3SEm
         X4DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762789419; x=1763394219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gLAK+1utwDQJnW79jqnXsBU1gEdDxofO6NOCNqDBYAA=;
        b=YNPujgdvCuySg5fgIHN+OJ09BD8PfEu5hSKf4s28yO5lTI9ym1p2Ocd1KGLBUYpb68
         G6hjjeHNwuR+wxVpLUmmkJjNX8VL4NBpfbeMXHg9uC5szjwKHSHjMCFNZr2WMDMS11Vn
         5z+f+9gtfr7JpNlZwW5OIsLIQTbxn4S73u/jhmM21GJMTs31oceECeKNz3W9z6s3qeuw
         nGsz2pIknmxt0IkpFfHYrJhkBeKyx7dA8whVgGx993vtUZXYYe0LaTCKKadYo277WtOo
         GvVckQNf/2TxtT/CVWnJ3hQtzU0DmQiY1ykze8z0QXJq367ZtZQPkkgNPg8nMaKFCt5r
         Wtug==
X-Forwarded-Encrypted: i=1; AJvYcCX0gs1FzYdyF69GQnskilHjiadyB724vG9Qh1RUo1KOWam8uQerPTOeUEWyhzgGqHLmT0Nv+CtPCLj3Fw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyHryomhZVpM0W7r/0LSIio/ixAzdEUyJfQK9/4wDL9rLdc/Wki
	0Tu1XMLdUqfs8cBROd6cJOkpsQpIidtxWOcrdRVcY6g+V0Rq5+LR9XWh
X-Gm-Gg: ASbGncs98k0POeOfyZnNupa/pX2BCmpHZ4u/Rb1045rVzVLTSOPW3RTqvxlNXwn2miq
	u7INWGyQ/siQeChNmH5k/bhYBQhQKLjbwYcTRYbp6NsQxjRZGT7IqY6rIfBVkRmPYop3JPkPyMR
	QgZ0m1p5F2OdRH4Xojf51V85s5rRY1bv3Q4pp0hR+IFVrswEEnwazWvRcMTDEmt4qd28blLeA0d
	DISKb+A9XDEccWbHUDcYpcaUmsnFOw0lVDgbRDvg/2gPBd3yJpmneca5NbLm6rzQMMZWVQUQ8Fi
	y2/bx6Z41866Gx4glklDF4gAEs8xDWZiXbGWv1m75PGuNJx92/zBhnCJTfvkdLQg8YQ3t3fcDgE
	tkRJfkf1ZMa3gvLk58ywlD5Y/2WXgNNBtlR1NdpxaI2B+SfZjj1JPJlWPksTonREgjsGkQnM+Gn
	iSwpH7nja0p0+R/gZXgu3QJO0kRcYZNqA0Zus=
X-Google-Smtp-Source: AGHT+IFhicyH9W7Mg5DiwE8MVpN4/er0oaakdgICmjAbGBgQnJD5pAHwQ51RtSmFFQvyQKJ0R4B9cg==
X-Received: by 2002:a17:902:ea09:b0:269:ed31:6c50 with SMTP id d9443c01a7336-297e5408bbdmr106752805ad.10.1762789419238;
        Mon, 10 Nov 2025 07:43:39 -0800 (PST)
Received: from DESKTOP-8TIG9K0.localdomain ([119.28.20.50])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-297d6859a92sm101566725ad.88.2025.11.10.07.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 07:43:38 -0800 (PST)
From: Xie Yuanbin <qq570070308@gmail.com>
To: arnd@arndb.de,
	david@redhat.com,
	tglx@linutronix.de,
	segher@kernel.crashing.org,
	riel@surriel.com,
	peterz@infradead.org,
	linux@armlinux.org.uk,
	mathieu.desnoyers@efficios.com,
	paulmck@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	hca@linux.ibm.com,
	gor@linux.ibm.com,
	agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com,
	svens@linux.ibm.com,
	davem@davemloft.net,
	andreas@gaisler.com,
	luto@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	james.clark@linaro.org,
	anna-maria@linutronix.de,
	frederic@kernel.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	qq570070308@gmail.com,
	thuth@redhat.com,
	brauner@kernel.org,
	jlayton@kernel.org,
	aalbersh@redhat.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	lorenzo.stoakes@oracle.com,
	max.kellermann@ionos.com,
	ryan.roberts@arm.com,
	nysal@linux.ibm.com,
	urezki@gmail.com
Cc: x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	llvm@lists.linux.dev,
	will@kernel.org
Subject: Re: [PATCH v2 3/4] Provide the always inline version of some functions
Date: Mon, 10 Nov 2025 23:43:01 +0800
Message-ID: <20251110154301.1930-1-qq570070308@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <a034a57e-d9f1-4c56-87f0-e9126246849d@app.fastmail.com>
References: <a034a57e-d9f1-4c56-87f0-e9126246849d@app.fastmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_074340_977753_14BB2471 
X-CRM114-Status: GOOD (  12.65  )
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

On Sun, 09 Nov 2025 18:35:23 +0100, Arnd Bergmann wrote:
> You can mark the caller as __attribute__((flatten)) to force all
> functions to be inlined into that one if possible. I don't know
> if that would be helpful or desired here though.
Thanks, you made me aware of this attribute for the first time, it is
really a great attribute, and it has been already added to the kernel
public header. However, it's rarely used in the kernel, which I really
think is a pity.

Perhaps, I can try adding this attribute to some hot functions in
another patch. For this patch, I think this is sufficient. There are some
cold if branches inside `__schedule`, __flatten will inline the function
calls in this part of the code, which may cause some unexpected
performance degradation.

>     Arnd

Xie Yuanbin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
