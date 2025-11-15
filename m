Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EBFCCEB2C6
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Nov 2025 13:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MlTgK1Y1DW00DKq1Z0r1exVxQVYOt6oqLhzKZdBYcWg=; b=aenKW0NwBvUOtY
	IVIPzYfM1YPN0Ebb4iKx8Fq4vHGPVVkfV1FVLpA/n8FVwnSGg+4tIJIS4JttoZW2PlW4pqqeKmzMU
	klvHc9mjVWXN4KxeUpAp8CMM+652ffUDFQEZaKqXhPHeE473uY114cw+ve3T8NpetKH1UWj6uHMIQ
	rjKogt1YqGRBTFhqxNJrsOZmuBwTkSemTkBHpAiQVu0hR4wauzwXFixmwyE4FCC5+NCcgAj97igj4
	nnDthV5XnlFij9mYPeI86QXmK5HRxkMIcDRIOaonWw5FEklfRQd+0oujyXokygxtm+gsXGEq8+Jy/
	UZTL2dcrgAlZFHr0OBXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKGkY-0000000DomD-2PYi;
	Sat, 15 Nov 2025 13:55:34 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKGkR-0000000DolQ-0zxd
	for linux-riscv@lists.infradead.org;
	Sat, 15 Nov 2025 13:55:30 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-340bcc92c7dso3519784a91.0
        for <linux-riscv@lists.infradead.org>; Sat, 15 Nov 2025 05:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763214925; x=1763819725; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y5QUmSKzlS0amBxXurpdk6aXWqflSKro/h9ErGoIjwQ=;
        b=H2DqtN8eYlUYUd2YIqINAEwW5WuEHxJ5RKXHJXpsYaZZLi2cF/fQhG1pmHyvnQr6eA
         XCbvyD2LWJG+ednR3YsKN/mClzUvk2jsFWbNr80KrAlwLyixvJ/oZpGcFeI/VwwRLdEQ
         E9UDscqd6/pXCxHOEIkOjrYPJTPy1knP5fKj0issFIP6zSKfqt5cP7yJklZQP0LyN2jo
         Y1Qv00Xl2g2U3NnhTjFvmv8q5YyZOitJKuzZD/IYgb6j1VVQ4JHtUl60mOZC89z6Iwe9
         EP1cWerHnqtr9skVDonTst8q5EmFyOrGe+tPlKs5ZY5AUJycvY1+000Lw/Px1qB8OidA
         LaEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763214925; x=1763819725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y5QUmSKzlS0amBxXurpdk6aXWqflSKro/h9ErGoIjwQ=;
        b=JdWw3RyTz1XQBL8DPJx72l1aKqIA4uvjuBoezwQrenF6Ebo8OAip5mVsnZrfPmXGdU
         0gPQTHOnAEf5GALBMT7B8ubqStO3uY0h15Lb8jB7S2B/rBnPxfaUIzKe3KBSviIQlE0Y
         2N1frAEnDLMNyYjTKvOwYX2LdMUEuybq/p+QmxzaF8THmB7FUyTE2JqyGT+d3CbVnb5e
         2eT69ui1G3FudL1hcp5NBjefA4oppDoc2Hq69y3enFE8jD/r4xru0jLUpF05MYIJ+7BI
         Ml0zbmO/4q3//seUHF1fNFfA3ZAXmbA8OWN/jRWLxhRmnVm7B0A4V1Nl7y4mCjeL5IIe
         EfHw==
X-Forwarded-Encrypted: i=1; AJvYcCU8K0WCgYR1IqzF3/QyQsvxcK+xnNdGPUXIkmZuuvlL+K/Wwa9nYXmpuwGh3jsO7G0v5vNAiP9ByP85zw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzS53wq2LTdBqAnyBNh+rPgmmNEv+DtkhIvCoXgaxjprfQaRXRy
	z+NEJh5GWFmC6V64cJPQYeJgn9iXx4DeVv4GnOj3wzoLADN9yY+v4R8Z
X-Gm-Gg: ASbGnctTSZXqFS7vYfd1JbI8YSK2tfUm3GrTDlKEEQwXPQeG728bgiYl0i2AqPljhKq
	hE6BV/lPAEyBTfMYYyAhEPYgUnVq3TAzMTRcBIuK7kTh16ge9VmUYMlk7ZkiGlE0XvI4nrW4K3P
	efoPhdi9nrjfjPSxoqbe1hQTLytuoV4EYPvhKAeJF6TLHCFluQSkFs8FgGH2I3QmJPoBU09Xd6D
	lgU10sPGZAZEfqXhA4QpRr7J73+WrU0ubbddWItNmg6BeY5n6Np/YdWl6y5QKZ1RWDeu/AaFzuX
	PViXFCCuWp1dvcDHqAojh/HhQa7c8FjQQsf1Nk1Pq56UXNusHzqr7pwM9acdr7xboUP6QF+v0Zm
	SJVB1JQOhkz+r+jBwvUtfpze6ivJ2aE/Pr/QwrXeIRkHDvJpwURl6wMUmDE1KyH3Pww1p/H2fK8
	+jyTh484WN2r1yaoqiAarwNIBnhlk+Tyvy0Xk=
X-Google-Smtp-Source: AGHT+IFuTufEP59uKbwpymRKno9yjHG2whmUp7ulswIr3+CxbVVYv/nhc0N014IklbozTKH44HgIGw==
X-Received: by 2002:a17:90b:3503:b0:340:9d78:59 with SMTP id 98e67ed59e1d1-343eab07fc3mr11539361a91.3.1763214925468;
        Sat, 15 Nov 2025 05:55:25 -0800 (PST)
Received: from DESKTOP-8TIG9K0.localdomain ([119.28.20.50])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343e071571fsm12590727a91.7.2025.11.15.05.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 05:55:25 -0800 (PST)
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
	lkp@intel.com,
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
Subject: Re: [PATCH v3 1/3] Make enter_lazy_tlb inline on x86
Date: Sat, 15 Nov 2025 21:54:43 +0800
Message-ID: <20251115135443.460-1-qq570070308@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <878qg8bduc.ffs@tglx>
References: <878qg8bduc.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251115_055527_270916_4B559CF0 
X-CRM114-Status: UNSURE (   6.70  )
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

On Fri, 14 Nov 2025 20:42:35 +0100, Thomas Gleixner wrote:
> Please use the documented way to denote functions in subject and change
> log:
>
> https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#function-references-in-changelogs
>
> Also you make this __always_inline and not inline.

Thanks for pointing it out, I will improve it in v4 patch.

Xie Yuanbin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
