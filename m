Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4FD1CFA441
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Nov 2025 19:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nvL0J0ZzmRsMjo/BUsT3ZTwM/yHh0O+jf9Ntv0TgzUw=; b=e8u4EUtsuZhDNv
	aWmx2Rg74gawu3134WqkEnhAw5a3oDe7ufDtcCTckv/JWWYmQiBZaiUM6T3Ts8oHZk03fSdpMbzJ6
	wHBu5RP1Vsd5Jq6ywAiJ+HBX8bsMw/y3sqTWn2ln4qVFxSkKF+qh2JsEZa0C/mUI+4LqFA9q9YlvS
	yNELzdocR7uAfVn8iEWU5oeIWw8q1ztElAKAHa9UYeiaFURVmAMmCDEuYXfcEOq6u23h8pK7gumTB
	0dWyDPFXAzt5mYN5Kyn1V7ZQ3oM9MslM4bSy565/sCaLTaFQknySS6EvtC+Xz10fETe3X5LdPQJNl
	oCIpuiAvSMdssgTHWaaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM9vL-00000007G3r-2qN5;
	Thu, 20 Nov 2025 19:02:31 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM9vJ-00000007G3E-3eM8
	for linux-riscv@lists.infradead.org;
	Thu, 20 Nov 2025 19:02:30 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4779ce2a624so11228155e9.2
        for <linux-riscv@lists.infradead.org>; Thu, 20 Nov 2025 11:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763665347; x=1764270147; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pUk7F3OiQezqpI/i6F82zzEyxwA4n2FgbJ6n9Doemj0=;
        b=QJjdFVDx5uCnxLU946H+5W4TGjkxkdz1rUXJccLqY5KddVSbxPcOq7iZBFZh46j385
         PezENRZ6HY+fdC7hMElU9fSAP30ca5Qd/KkYztkiQeMw5NKXNNnxGSFv2EhnMfWmuRda
         46equ05RBWYwMqOoa7i916wnpwmhIiXq9unRwLFvcRQjIs1XRHjQH4lCHFNA8w90Vjxu
         nOQZxf6NmGVn+QOJk+c59Wmjz0G0VG+xReTNbPmNQ4KHJ7vlZw0UYI3jE776jy2JcNFt
         dtuR6jUQBG6vme9940XSE4Ju15Bq9FKgq8mwKKt2hLUY/5WindybWL3VbA65O9p98lTQ
         PnRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763665347; x=1764270147;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pUk7F3OiQezqpI/i6F82zzEyxwA4n2FgbJ6n9Doemj0=;
        b=a6fKAZnPm/PeRNRfXiJHakw9rfparLe2KEXrMRWJFyjly60Qa243A5ro8XjS5aH2Ey
         KrpJ51vSuReZuf3TAVFmbvMH2QuK10wS5bNs1L5JJuULgizg8kGf5Co/E1oNxWR9X49S
         Bn/jvSkxQ/PujB0XfQFFWpaXFQ7ul3wkh1t5ul2gwFwq4NJZwL+lLqS8thxxLQow0B6k
         X8de0gzj+Fod8Fr6jN5DDTrjRMWIjYJQ3TM1rxhmItjt2jAmzHzUD8Rrd3L3nm4tPsc9
         3wNf0K3wN4T4dDLz8OLk8VyYlRRHrJ5O5r463fyHL7yKYfgdPjcA0cPqYCrTJ9SyeUkP
         aSIw==
X-Gm-Message-State: AOJu0YysyhSmRce9yTO/Alg31qD7j0bYUSQlAroNPIARcxDa4vkQOYEW
	1PXy58s7f6I58toz+SW4CisfB9yfRmFJ7v18lRy9/TxHnj8Nq5Gnemjo
X-Gm-Gg: ASbGncuOsM5ob2pkZs8fBUJRMZ06ungepVL/3vfQOiTyLBX77qq+WatV4AwsQLZLy6s
	kFd9HiIBOQjtwV/wiZHID9uyFGgjciegX6B9Cg7A1dwgNTdFSSASO8U0cAj21JUlFw1eeBBFiMt
	0DxA213zr34V6GJIUnmj0yxpK+qFTgko5HRWpFDQoNIzqFG6q2k/xfHT9RHn4M+cuaEOji9oEDa
	npppAqG+apCaAauMrpOMoKr50tadsMGIiZt6a9bS4CnKtSTja+79sV+81lvaXt4m1srEC7lQpT9
	CIyrHZgne/A43C86/m1jRBxoNqWrPNKSraNk4xSx3IbsKjcwEZ5PLTQs149w7hVIRPbwOaAiSJb
	9retkQZOxMdec912d9tKUt6Y7+EBBsSPfUD+AaWoNbfaa3O5IVbh/CLhxZO9Sv9JpYnaeH6uCAX
	wsYvpn
X-Google-Smtp-Source: AGHT+IEm7cyBl9sCriUUQUppCnGpTm7hcBwhjRia2+n5Yk+UR+NhXXnMSkR2YAPQMqM5M9apaOTEZw==
X-Received: by 2002:a05:600c:1c86:b0:477:a36f:1a57 with SMTP id 5b1f17b1804b1-477b857907amr46992595e9.3.1763665347278;
        Thu, 20 Nov 2025 11:02:27 -0800 (PST)
Received: from curiosity ([80.211.22.60])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477bf3af0e1sm3254925e9.10.2025.11.20.11.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 11:02:26 -0800 (PST)
Date: Thu, 20 Nov 2025 22:02:21 +0300
From: Sergey Matyukevich <geomatsi@gmail.com>
To: Andy Chiu <andybnac@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Oleg Nesterov <oleg@redhat.com>,
	Shuah Khan <shuah@kernel.org>, Thomas Huth <thuth@redhat.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Joel Granados <joel.granados@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v4 1/9] selftests: riscv: test ptrace vector interface
Message-ID: <aR9lvboEcSzSjGNY@curiosity>
References: <20251108194207.1257866-1-geomatsi@gmail.com>
 <20251108194207.1257866-2-geomatsi@gmail.com>
 <CAFTtA3PK8kU6dsHdOT8Gj=ov9UbguSWv8+aQjtnvkx6hFWZGkg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFTtA3PK8kU6dsHdOT8Gj=ov9UbguSWv8+aQjtnvkx6hFWZGkg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_110229_913594_58753B1D 
X-CRM114-Status: GOOD (  12.49  )
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

T24gV2VkLCBOb3YgMTksIDIwMjUgYXQgMTE6MTM6MzZBTSAtMDYwMCwgQW5keSBDaGl1IHdyb3Rl
Ogo+IE9uIFNhdCwgTm92IDgsIDIwMjUgYXQgMTo0MuKAr1BNIFNlcmdleSBNYXR5dWtldmljaCA8
Z2VvbWF0c2lAZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBBZGQgYSB0ZXN0IGNhc2UgdG8gY2hl
Y2sgcHRyYWNlIGJlaGF2aW9yIGluIHRoZSBjYXNlIHdoZW4gdmVjdG9yCj4gPiBleHRlbnNpb24g
aXMgc3VwcG9ydGVkIGJ5IHRoZSBzeXN0ZW0sIGJ1dCB2ZWN0b3IgY29udGV4dCBpcyBub3QKPiA+
IHlldCBlbmFibGVkIGZvciB0aGUgdHJhY2VkIHByb2Nlc3MuCj4gPgo+ID4gU2lnbmVkLW9mZi1i
eTogU2VyZ2V5IE1hdHl1a2V2aWNoIDxnZW9tYXRzaUBnbWFpbC5jb20+Cj4gCj4gUmV2aWV3ZWQt
Ynk6IEFuZHkgQ2hpdSA8YW5keWJuYWNAZ21haWwuY29tPgoKVGhhbmtzIGZvciB0YWtpbmcgYSBs
b29rICEgSSB3aWxsIG5lZWQgYXQgbGVhc3Qgb25lIG1vcmUgcmVzcGluCnRvIGNvdmVyIHh0aGVh
ZHZlY3RvciBzdXBwb3J0IHRvIGJvdGggcHRyYWNlIGNoZWNrIGFuZCB0aGUgc2VsZnRlc3RzLgoK
UmVnYXJkcywKU2VyZ2V5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
