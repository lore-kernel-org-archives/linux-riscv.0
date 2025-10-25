Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66ED0CCF9E9
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Oct 2025 18:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W4kg0bERgtKPtFPV31Y4V1vc0y2iGysrjnRtvZ1zFAI=; b=v0EaUBJuX1sveR
	krm5LlgLNJ+dLJ8J3o6UKTIOxmE976ZsRunjEqc35VOffQvcUv5gJpE3eS+yOSiabPEL13jVb/+yt
	fYl41wiyZqlQjsAHUY4Js4YwihMy+pzzxW3CCvoABJVmW5wFrRZa/RYDVMETp20HJDo+vaLSwAVt9
	rTmo4cWKAJaPkuQ5peSZqHcyxNQW7oVOQBbbw6hY+WetV3FnOahjZhz8xDP4ufCF6mtloTNxXE99X
	lSZ29dn6y80JuFxNZ1wFqm7YRqAc2IwMRWFDIVsmdGPXGZehx9J5YXFfPWsJ/3OdSq8Bffhnnjuc+
	nIFUzkEdCp2YJWpV/ZwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCjMi-0000000Bdxh-3HSV;
	Sat, 25 Oct 2025 18:51:48 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCjMg-0000000Bdwy-1cbZ
	for linux-riscv@lists.infradead.org;
	Sat, 25 Oct 2025 18:51:47 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-7811a02316bso2344414b3a.3
        for <linux-riscv@lists.infradead.org>; Sat, 25 Oct 2025 11:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761418305; x=1762023105; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bIE1dNWJNDWO8or3nwiGA7qbCcPQuWvlUWlsOjJvHas=;
        b=d0J5CT9NnjWZ158hD0tL6/7aCuK3tC8JQPffWwhQGlNTd6lilBCufrUC/HYFiBpjDi
         3eGgjXGQg1G7i+7KBW6X1pMBQ+EdUgpIoM5VDiRqFf0nlwB0gBd2rv/zkU//kaVT/zdz
         TnHsuC30v8bWBz7Fz6+vpu9awtVXb2tNtm2wGwlmsibcsoIX4Ay+Id8s4RIfVgBFvsuW
         x76BBd6YiLAaLQ7TenP5Ft95tCwF6oyqgGQerPlt8VlVa6SUKUh7XCiJAF1jsp8VoeHn
         7jefCPOns/5JPXTfXyW5HBZu3hjOR+d+dUlKitpLNFRA6AFGEavxd5wOA+EdGudfRYZN
         pOOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761418305; x=1762023105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bIE1dNWJNDWO8or3nwiGA7qbCcPQuWvlUWlsOjJvHas=;
        b=cWo/u7sOhTdCJvU4E7ERhL18GRhUc2GnlYlssngNoQX0QBAs+fg9ZKf5GHnMho0Q5H
         in8KXDR0+bZZO+0ciVRjlrcZduug8vNjtO6hzAhnrvWk+7zk/509L1h+DitNhIzsLXhd
         4ECFIZ5NCNIJw1Uxv6XXmD6AN+HAFvgjKfShXcZ70pkPX0Dr74KX9kvkC6nZ5h4RYNON
         wQLIF310RWymjubUdrKLacjwzEGUsdYLwZC3Emcf4aQpQnkgNMyUeOvTlv7Qnun1sZ8e
         6BTvf2m9h+rbYjNmT0Ian1uPyzgVU8Dg9oK9Zcc8MEprbKnN/TIml8p+Wg6gM1uvAQhJ
         kGKg==
X-Forwarded-Encrypted: i=1; AJvYcCWzG1pl4F3E1ssoaxqkdLSJUZRTCFbqBlnIQoe9jEVZpLiupmnq4dZmvgAbq5E9tAiSbOcIsYOpiM/pbw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxlqsOR8uWkSPB0BiCjvy1Jg+D/2G4/canaBd2RtMvu4+04Q1We
	4zeuCc1BcCSbcXld2bkpWKeqiqfHy0OOkvE3Hc+eMNPD6FDHyXQsPb+w
X-Gm-Gg: ASbGncs0Cf4ap8p4qJq849EwKU75aTqLCCNbJtsG1jCGrteFqYtj6uUGbUHSgFJj0ga
	uSLNoBg8xne7Fyltl/xv9P0m2L0LU+5Jan6+TZjFPJOg48PYPVWF6BfPpRBGcD8wGfKGarj/mg2
	0OEEuNtaY2bpdXoccPUIkyx89HRae5UVhx86gIww7FX+qrBC/64ibAAeJLAdabOXXIb67wr0DtT
	CZESwewq0r5hUUR3BnnV51xY1Q1sELKicR75ggCBw0OpxQ0wCOEB0/NzKdUwMe9AqceGmd9wlIr
	a/n+PSqueV//Bt8UaT+shnAIxCDqJxdTLtfNZ1wC9ynQXnkgJc4Fl5GKNhubHnUmLut577DHGxT
	XxlCt9E1PCKCASAKnVwymLh8X/E3cOvb+6aqEU+hQzxSW0t99U5wYYWY5twx4JgksJLVo3zfeA3
	gpjghf3sUTFOkAFHtXJXwq
X-Google-Smtp-Source: AGHT+IFA/PpMad08k18p5dz1XblACJuseYn3XTA1biqGFVkwzh9uXMt+aH7CWADiafyloVKa8I/K9Q==
X-Received: by 2002:a05:6a00:94e3:b0:7a2:8343:1b1 with SMTP id d2e1a72fcca58-7a283430981mr9276736b3a.17.1761418304909;
        Sat, 25 Oct 2025 11:51:44 -0700 (PDT)
Received: from DESKTOP-8TIG9K0.localdomain ([119.28.20.50])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a41402e554sm2897425b3a.18.2025.10.25.11.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 11:51:44 -0700 (PDT)
From: Xie Yuanbin <qq570070308@gmail.com>
To: tglx@linutronix.de
Cc: acme@kernel.org,
	adrian.hunter@intel.com,
	agordeev@linux.ibm.com,
	akpm@linux-foundation.org,
	alex@ghiti.fr,
	alexander.shishkin@linux.intel.com,
	andreas@gaisler.com,
	anna-maria@linutronix.de,
	aou@eecs.berkeley.edu,
	borntraeger@linux.ibm.com,
	bp@alien8.de,
	bsegall@google.com,
	dave.hansen@linux.intel.com,
	davem@davemloft.net,
	david@redhat.com,
	dietmar.eggemann@arm.com,
	frederic@kernel.org,
	gor@linux.ibm.com,
	hca@linux.ibm.com,
	hpa@zytor.com,
	irogers@google.com,
	jolsa@kernel.org,
	juri.lelli@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux@armlinux.org.uk,
	lorenzo.stoakes@oracle.com,
	luto@kernel.org,
	mark.rutland@arm.com,
	mathieu.desnoyers@efficios.com,
	max.kellermann@ionos.com,
	mgorman@suse.de,
	mingo@redhat.com,
	namhyung@kernel.org,
	nysal@linux.ibm.com,
	palmer@dabbelt.com,
	paulmck@kernel.org,
	peterz@infradead.org,
	pjw@kernel.org,
	qq570070308@gmail.com,
	riel@surriel.com,
	rostedt@goodmis.org,
	ryan.roberts@arm.com,
	segher@kernel.crashing.org,
	sparclinux@vger.kernel.org,
	svens@linux.ibm.com,
	thuth@redhat.com,
	urezki@gmail.com,
	vincent.guittot@linaro.org,
	vschneid@redhat.com,
	will@kernel.org,
	x86@kernel.org
Subject: Re: [PATCH 3/3] Set the subfunctions called by finish_task_switch to be inline
Date: Sun, 26 Oct 2025 02:51:20 +0800
Message-ID: <20251025185120.6760-1-qq570070308@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <87placw0dx.ffs@tglx>
References: <87placw0dx.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_115146_417790_0AB49106 
X-CRM114-Status: GOOD (  11.62  )
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

On Fri, 24 Oct 2025 21:44:10 +0200, Thomas Gleixner wrote:
> What is exactly the point of this indirection. Why can't you just mark
> finish_arch_post_lock_switch() __always_inline and be done with it?

In this patch, I've added an always inline version of the function,
finish_arch_post_lock_switch_ainline. The original function,
finish_arch_post_lock_switch, retains its original inline attribute.

The reason for this is that this function is called not only during
context switches but also from other code, and I don't want to affect
those parts. In fact, with Os/Oz-level optimizations, if this function
is called multiple times within one .c file, it will most likely not be
inlined, even if it's marked as inline.

Context switching is a hot code, I hope it will be always inlined here to
improve performance. In other places, if it is not a performance-critical
function, then it can be not inlined to gain codesize benefits.

Look at your opinions. I have no objection to setting
finish_arch_post_lock_switch directly to __always_inline.

Xie Yuanbin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
