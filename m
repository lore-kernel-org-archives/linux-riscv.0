Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B73FACEB2D8
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Nov 2025 14:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0gSLDazXZlt43d0hax+ulQ/MyypLgFUBKykKkZbBA6E=; b=eqv2dIQ9SvWiwI
	2lY/ZvWYv/8RpFnnVl3vVt67PcWYshwaslK8IN8DtZSmsqCCpuYhITxWxl027gn6z3vW8N5nmmIYE
	0GPz8Zg0/+iWsXXKQvjdFiiE5iJQQdqLpULZ9ETdFSh6QfNzwwGjwXTMnmqy2wWSI8Q6cSBEpP1AL
	NrsJ0HqtcAJbxEoJWEFzzSZrErYf4d6wbJYPWbdCRiZesuI3gWDoIV2242XOFytQTavQcpJ71QTun
	Ns8bHAL4rf8O07zwNzPEXqHUrEmaMRgthqRN6sruwK0eWN6W8IwLVSF0vdELZHj0OQovJlwSgKG7v
	j/M6UjgNVZMo9WhkyCTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKGql-0000000Dp4S-1urV;
	Sat, 15 Nov 2025 14:01:59 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKGqh-0000000Dp3e-0JkB
	for linux-riscv@lists.infradead.org;
	Sat, 15 Nov 2025 14:01:56 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-3414de5b27eso2431559a91.0
        for <linux-riscv@lists.infradead.org>; Sat, 15 Nov 2025 06:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763215314; x=1763820114; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=olQBQzbLF3fdlc7j5Y7W4kleJFMfa0UsHIk6o2GsAbQ=;
        b=RosY4wjFw8ifoGl3jYUpZh2CGiCLLjdtTnb7Rwk4crqG332cH3CWKe0c82HNISzMc6
         qVrItltUZ+Tgt54FGUzi26yg4ApEiAyy3E9bRtcdI1NEN/DjKVdmrmR+bLcHZaaJ9hif
         CBCWhnIgY4WQPw28MIzW9yVpzqo6EwZJVQi/6QAacXbw8a40sfZmL67Na0tWmNB2xIX5
         /ZWdQ01qSDbwSzmf7pmNeVbkIisF4GZuGb+1qVP6x9lcbcYCfS2kzh4ikcxpDLRrwkev
         og8ZfWsq45llSl9/YBV6nhNlsyG+0eVCTATo0AORvB9xnCDJ1+bozPe0wqdXGaLMfhS/
         hf0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763215314; x=1763820114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=olQBQzbLF3fdlc7j5Y7W4kleJFMfa0UsHIk6o2GsAbQ=;
        b=jcw1LhD+qpaAS3vn13ZioruDJE8Ow4c/SCAZLYO+OLkCsd+T+NPJuC385T00cPIh5c
         smMgC23PL35n2ns2cT9YzdjPMdR3/loKn8vVMBg6M+FKb+YrWracVnpAktpC1xO4A3o1
         tUzD8xFRVNfbqb1wm3Fw6EsK1fD+fsJb/eNeY+MO8UErnQ9yWyxyXrohW+nlg627ZcLW
         P1SBBDZswvEiy71nyh9sgqlLoEST7nMLSrJTutOnBncRGDk8NayKdeWNwSQGo3VIfOGD
         prUJ1KVY271u8Uwrl62gYamQYzo5EJAPrNktm7y/C9aWeOQq+DAjYscBPpfcI6sF4u1s
         APJg==
X-Forwarded-Encrypted: i=1; AJvYcCUhmIuAyillBn6M8V/+zgeGlI2TX/rD0ldFMxhjXvc94v2ps9eoXxlu908tS8RDDPOsw3AiH0ru7lrHUA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyoKRl6ljm2MM5fbDowTTHPDel6EJqbVcbS5kdOlbsfWzpOAh+9
	yxD0i2UTHDSnX/WWbDeqQ/dMlZtzIvwovyfG2aD6S/7U8QCwNItGNSaS
X-Gm-Gg: ASbGncvNY4Z9fm4XPoRGfskA4SkOUpG69MqZ19xNi0XPKrhR7pY8c84yiqamSAUi5nj
	kpNbbByU5ypd1+eZs6pr09UpiU/UcHQ+SQ7hlEu/OAaHz+5uKsK6q0IZLw3tznLIsa2CaQ3Gz9w
	Sp8XoWfUohpn5rPWprVQqkuh+hJB9rUnQJVCdrFQSgDn+MSZq7eajp0pbebrz+oKWFQg6+Bbl9C
	h72/Zbwknls0CXe7BdHnQusp4TArCQM3F1L36L1ic0KKpofggBdcC6oF8ZOXzL6+pRp8hhLf14R
	voQElFBUqN6XcgQ15ZWSDzlPCJTyqM0dz/VlbuesmXyIKiK91zGhMGFGbDZwo8Pj1h2Wx7SoyUl
	C718DxGdziKMeCgox7KSvNq9KzzlgJzKXFKXHhbbfJrCVO3hVOcj/Ix9/42NDFDD/aZGLuLsYW0
	MPxdH1eF4iwObnd7jbEcJVe6B7nUgmYO4Hm7M=
X-Google-Smtp-Source: AGHT+IG/TnOO0qzjxK2iaqcK1w8zb7Sll+uP2m9bSS0pCypnuHepcTcVoR++oPZWg3RSEvlIe1E8yg==
X-Received: by 2002:a17:90b:1dce:b0:33b:d74b:179 with SMTP id 98e67ed59e1d1-343fa74c2f3mr7051205a91.27.1763215313855;
        Sat, 15 Nov 2025 06:01:53 -0800 (PST)
Received: from DESKTOP-8TIG9K0.localdomain ([119.28.20.50])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc37526d91fsm7478366a12.22.2025.11.15.06.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 06:01:52 -0800 (PST)
From: Xie Yuanbin <qq570070308@gmail.com>
To: tglx@linutronix.de
Cc: aalbersh@redhat.com,
	acme@kernel.org,
	adrian.hunter@intel.com,
	agordeev@linux.ibm.com,
	akpm@linux-foundation.org,
	alex@ghiti.fr,
	alexander.shishkin@linux.intel.com,
	andreas@gaisler.com,
	andrii@kernel.org,
	anna-maria@linutronix.de,
	aou@eecs.berkeley.edu,
	arnd@arndb.de,
	baolin.wang@linux.alibaba.com,
	borntraeger@linux.ibm.com,
	bp@alien8.de,
	brauner@kernel.org,
	bsegall@google.com,
	dave.hansen@linux.intel.com,
	davem@davemloft.net,
	david@kernel.org,
	david@redhat.com,
	dietmar.eggemann@arm.com,
	frederic@kernel.org,
	gor@linux.ibm.com,
	hca@linux.ibm.com,
	hpa@zytor.com,
	irogers@google.com,
	james.clark@linaro.org,
	jlayton@kernel.org,
	jolsa@kernel.org,
	juri.lelli@redhat.com,
	justinstitt@google.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux@armlinux.org.uk,
	llvm@lists.linux.dev,
	lorenzo.stoakes@oracle.com,
	luto@kernel.org,
	mark.rutland@arm.com,
	mathieu.desnoyers@efficios.com,
	max.kellermann@ionos.com,
	mgorman@suse.de,
	mhiramat@kernel.org,
	mingo@redhat.com,
	morbo@google.com,
	namhyung@kernel.org,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	nysal@linux.ibm.com,
	oleg@redhat.com,
	osalvador@suse.de,
	palmer@dabbelt.com,
	paulmck@kernel.org,
	peterz@infradead.org,
	pjw@kernel.org,
	qq570070308@gmail.com,
	riel@surriel.com,
	rostedt@goodmis.org,
	ryan.roberts@arm.com,
	segher@kernel.crashing.org,
	sforshee@kernel.org,
	sparclinux@vger.kernel.org,
	svens@linux.ibm.com,
	thuth@redhat.com,
	urezki@gmail.com,
	vincent.guittot@linaro.org,
	vschneid@redhat.com,
	will@kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v3 2/3] Make raw_spin_rq_unlock inline
Date: Sat, 15 Nov 2025 22:01:08 +0800
Message-ID: <20251115140108.543-1-qq570070308@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <875xbcbdrm.ffs@tglx>
References: <875xbcbdrm.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251115_060155_120999_4D0C869F 
X-CRM114-Status: UNSURE (   5.86  )
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

On Fri, 14 Nov 2025 20:44:13 +0100, Thomas Gleixner wrote:
> That inline does not guarantee that the compiler actually inlines
> it. clang is obnoxiously bad at that.

Yes, I know it. I modified it to __always_inline in patch 3.
This patch making it as inline to make the context look more harmonious.
Thanks!

Xie Yuanbin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
