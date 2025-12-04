Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7771ED20690
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Dec 2025 13:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sB548rXcqoI3cA9b1GOaglwgI4vYWSJ1tckIhKGGZSk=; b=G4t6B7ClCCBHRT
	kwr3juAf/MyLe9Rp0hXOwvGKtyk9C/JdPW13lFPqOEagz0Ddv3Fr25AFmFgTnItD+sRl8pts2v5W4
	w0wjTJqqwiew+/5CXzZI5xPxPViQunuS9L6zbCU94VPb1bciuL9U2jx/YamKRDAnB+MT0jv+ok7ce
	B1KHL2O9U6mBSpPeivYK8IcCaQg51IOmLY3ClxTcXt3+nt6Ng3+9TRn3jjSW9SGtU7Hxve1PqWerE
	vmyIFkVSuBkeZyO5izcXj1D4DbCRPWwO03fB6XyJu4EJpzlI58M0J0YUmqdl3wbDiuu2PReynaC+y
	JJfWCSq49Kp8KriOgegg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR9M0-000000083Tt-1DTo;
	Thu, 04 Dec 2025 13:26:40 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR9Lx-000000083SW-2OjD
	for linux-riscv@lists.infradead.org;
	Thu, 04 Dec 2025 13:26:38 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-7baa5787440so104542b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 04 Dec 2025 05:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1764854797; x=1765459597; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PPEKow+S1V9nD4RjhE0AT2vR6lJZBYGZgAPJj0Y/F/M=;
        b=NwG2P1JgbTmEd+MKEkSq7r0nnCwYXU8I3g6AmyZmJvA/tcBwOt6/Um4Vj1h0PxP7rO
         c1NQzfKwIYJuRwT/k580b9ewAhWo9nAEKlyqVMcr90ymEwuqzJTbL0IqnzDlgySktrQM
         goUPcf96CiLjzOaioYGQ/ECSb3uN6HFWDhPjpKBo61HoDYgsOoJdHlliWWT3DqE3JdDk
         X5f7hJLhbbOhW+MEVPqIwa3lovf5sU2ls5muXW7yJHhcRnT9OAQbpkWQ9XXS/fHbWScP
         +zAVLutXVTxsh0XU/q6dCfkQFYm82L49162kIrjGiW0SaEDWful/cCWix4F3PIkEhDLM
         NC1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764854797; x=1765459597;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PPEKow+S1V9nD4RjhE0AT2vR6lJZBYGZgAPJj0Y/F/M=;
        b=cT4cFf0fs8s26HiZOLtr4Gi7kF8hJCN/ggKQKxm4Bv0rKOne9ddZoL4l60hg+XCAPD
         /yAATyDIKoo6iTTOn5W7QwA9HA34itvt0cTargjg6iNk1R28scPeoJw7s23tAevCDeQ6
         uWne8NCDzlnCpgrYuAUoEma/rMROf54nVS1o705d8tbN2Ec2ugDKlJchMUGnmPfWySoC
         eBDnI/2F0jr5uNr3t1IcFQz5Nn6Du9mtho0CnIH56hVH/XoHJonJYvD4zEOERXq5rdo0
         uCQMBfwWrODRxwbov3tqkU0E+n3Gw1ZMFLFdjucj8xBOpkUePAtIednh2G5QJjn9y29c
         Vw7g==
X-Forwarded-Encrypted: i=1; AJvYcCVUz8UmZ6KNvL3+bDGXD+q4U/Vo2ZMn14lXd15qL8JGqYsJDJFnZpr59vc4uaPzqTkQPoLIPxv7wgl7NA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzb6vJnYPYCao0ZEmhr+VJLtIgcujIzQCVPIHywU2AfLIAJAl/e
	vhNKphACadhhDbgpV2O3qulJMEA5P+vURMrXX6FTI/5/exfewgvA1SqHHcRxCUPHtSo=
X-Gm-Gg: ASbGncuwByqh3bkjJT+tkr4GrP+XxIRWmOsWw00dex4f58zt9LlTtLafSlQA2Rrbw1T
	PLNIK3Z+lG4JfkJitynQk0kuDCq+fZqoLHvnq4Kie/ZNSLCs95FY4VGvlwz0jQFemD/PQ1EtAK3
	MFqJF/P4vr6wDd+cYNY0IILAjk6Rj+lSY3MeCmLPn7UwqIVsXNwtffX5cmSwsG0MNLJ8+jU2rC3
	7H52l0DHX2mqc+bhJJApLaQkU7dHJLxn0S9vu8o7kE8I8gwbs8z/I2MehwHbvIzEtR5ydNA46ec
	JZS3eMz2CLpIzT0zHq5isQggvaMgK8cQGRFujpyNpRQ9LFt4rHxLb2OCTNzXwK/B8C1m8nihxFH
	6Ih8RX5UpQqdqTzn24lh4qS87643GfziX3Ht+DHbkvFdnQmDBAXonf0TupPNjUus96+dDql4WOx
	+uS61QX4jKikYmXLyHu7VPDrQ=
X-Google-Smtp-Source: AGHT+IGrHboW09wMQpU4oVsmDnSvR1IeUr9hXakfYrN3aeCUws3FeuN3UgGRx5C6/MohpF51Ft6eMg==
X-Received: by 2002:a05:6a00:4703:b0:7e1:afd9:9a66 with SMTP id d2e1a72fcca58-7e1afd9bf60mr2011009b3a.2.1764854796666;
        Thu, 04 Dec 2025 05:26:36 -0800 (PST)
Received: from localhost ([1.232.169.190])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-7e2adc5c355sm2211441b3a.33.2025.12.04.05.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 05:26:36 -0800 (PST)
Mime-Version: 1.0
Date: Thu, 04 Dec 2025 22:26:34 +0900
Message-Id: <DEPGT7OPYNFW.10L6V344HZE4T@ventanamicro.com>
Subject: Re: [External] Re: [PATCH v3 8/8] drivers: firmware: riscv: add
 unknown nmi support
Cc: <conor@kernel.org>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
 <aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <luxu.kernel@bytedance.com>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <jassisinghbrar@gmail.com>, <conor.dooley@microchip.com>,
 <valentina.fernandezalanis@microchip.com>, <catalin.marinas@arm.com>,
 <will@kernel.org>, <maz@kernel.org>, <timothy.hayes@arm.com>,
 <lpieralisi@kernel.org>, <arnd@arndb.de>, <kees@kernel.org>,
 <tglx@linutronix.de>, <viresh.kumar@linaro.org>, <boqun.feng@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>, <cleger@rivosinc.com>,
 <atishp@rivosinc.com>, <ajones@ventanamicro.com>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
To: "yunhui cui" <cuiyunhui@bytedance.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20251127125305.89961-1-cuiyunhui@bytedance.com>
 <20251127125305.89961-9-cuiyunhui@bytedance.com>
 <DEP50CD8K22E.1JW7GL6WLK44W@ventanamicro.com>
 <CAEEQ3wkmFXAqBfHwJYbJRc5pagOJvtu-wEYGwXBF2beQiSMT1w@mail.gmail.com>
In-Reply-To: <CAEEQ3wkmFXAqBfHwJYbJRc5pagOJvtu-wEYGwXBF2beQiSMT1w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_052637_640514_3D17215A 
X-CRM114-Status: UNSURE (   9.93  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

MjAyNS0xMi0wNFQxMzoxODowMCswODowMCwgeXVuaHVpIGN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5j
ZS5jb20+Ogo+IEhpIFJhZGltLAo+Cj4gT24gVGh1LCBEZWMgNCwgMjAyNSBhdCAxMjoxMeKAr1BN
IFJhZGltIEtyxI1tw6HFmSA8cmtyY21hckB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPj4KPj4g
MjAyNS0xMS0yN1QyMDo1MzowNSswODowMCwgWXVuaHVpIEN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5j
ZS5jb20+Ogo+PiA+IFJlZ2lzdGVyIHVua25vd25fbm1pX2hhbmRsZXIoKSBhcyB0aGUgaGFuZGxl
ciBmb3IgdGhlIFVOS05PV05fTk1JCj4+ID4gZXZlbnQuIFdoZW4gdGhlIHN5c3RlbSBiZWNvbWVz
IHVucmVzcG9uc2l2ZSwgdW5rbm93bl9ubWlfaGFuZGxlcigpCj4+ID4gY2FuIGJlIG1hbnVhbGx5
IHRyaWdnZXJlZCwgd2hpY2ggaW4gdHVybiBpbnZva2VzIG5taV9wYW5pYygpIHRvCj4+ID4gY29s
bGVjdCB2bWNvcmUgZm9yIHJvb3QgY2F1c2UgYW5hbHlzaXMuCj4+Cj4+IElzIFVOS05PV05fTk1J
IHdoYXQgd2UgZXhwZWN0IHRoZSB3YXRjaGRvZyB0byBzZW5kPwo+Cj4gRm9yIHJlZmVyZW5jZTog
QXMgc3RhdGVkIGluCj4gaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2LW5vbi1pc2EvcmlzY3Ytc2Jp
LWRvYy9wdWxsLzIyMywgIkdlbmVyYWxseSwKPiBhbiBleHRlcm5hbCBpbnRlcnJ1cHQgaXMgdXNl
ZCBhcyBhbiBVbmtub3duIE5NSSBwaW4sIGFuZCBhbiBVbmtub3duCj4gTk1JIGV2ZW50IGlzIHNl
bnQgdG8gdGhlIFNCSSBmaXJtd2FyZSBieSB0cmlnZ2VyaW5nIHRoaXMgcGluLiBUaGVuIHRoZQo+
IFNCSSBmaXJtd2FyZSB3aWxsIHNlbmQgU0JJX1NTRV9FVkVOVF9HTE9CQUxfVU5LTk9XTl9OTUkg
dG8gdGhlCj4ga2VybmVsLiIKPgo+IFdoZW4gdGhlIExpbnV4IHN5c3RlbSBpcyB1bnJlc3BvbnNp
dmUsIHdlIGNhbiBtYW51YWxseSB0cmlnZ2VyIGl0IHZpYQo+IEJNQyAoaXBtaXRvb2wpLgoKTWFr
ZXMgc2Vuc2UsIHRoYW5rcywgYW5kIGRvIHdlIHBsYW4gdG8gZGVhbCB3aXRoIG90aGVyIGNyYXNo
IHNvdXJjZXM/CgpGb3IgZXhhbXBsZSBpZiBhIHdhdGNoZG9nL3N5c3JxIHRyaWdnZXJzIGEgY3Jh
c2gsIGFuZCB0aGVuIGdldHMKaW50ZXJydXB0ZWQgd2l0aCBVTktOT1dOX05NSS4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
