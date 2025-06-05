Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77F19C5B549
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Jun 2025 01:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oSweWgRftA8vPScx6e6QC9Dc2TXXe/C2ozKtT+jHOMM=; b=BfaaXiMREv9vnd
	UkX2hISLNFzLUNmwGL6hpc8RliptgOEQmr8qIeEX+D5y96T/8U1CgRCu8/2B9N0Lt0+xv9xErzOPs
	eREeFaz3GOt3T6CfIFCg4K2VeJMGJO3nV5iu+36eo9G8Re3VBlkHmFCRsK4kHxX8Hcc0KvShobZb6
	rq+zIJe7xX3eYV1tDlQfj7fgOvc6eJeaiZ1bnVUBFf1SG95Fdl7iCH07BKRwDRUeDTbpir2KQrdJg
	hvY67U25w2POA/xRA7lr2Am/x8TU2m5cmoXtPr5tSo1TKY0UIV9YiFDaSwwaYDMc0dEnhcBZrnJNZ
	yMlLEkyRAf3MWbhwaPMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMzqZ-0000000EXvz-3R1j;
	Thu, 05 Jun 2025 01:56:47 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMzqX-0000000EXvQ-3ZTZ;
	Thu, 05 Jun 2025 01:56:46 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-311f6be42f1so74524a91.0;
        Wed, 04 Jun 2025 18:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749088604; x=1749693404; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hxHhCDDPHxwIzDJ0REZ0X+PrkWb9cpY+n8pdJBmfk4E=;
        b=ahi+1UnHvx17nV6SOQEVLhk9cTpV1B7u7khNG1wsTpYLpK53nm38VamZTX2uS0Wo3m
         NUtZkQdL88eO6t1bnD6LC2tHzhAEPDfQ1YmmnTdGwdPFSFSf3AfKYSsrU+GOldbhXbl3
         zoX4ynMbJ07OE8DMbz2waYmgcQ1ynGWGRvRE15DEpgMsMvMb+NoMiVWQcoWEb4f8GMhF
         Uki6xu/5wDZl5Zjf7G7L6bK00+BG2oHaUdQs59gfa18WXeKcHhnbCWCLuteGSdGyxela
         4V+l0WGc0BN+iMod5qo4ZpJPTJkg85qIwfUOmuADdF5a/S/xqmBqBSOwQM6cb9iVpeti
         pMoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749088604; x=1749693404;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hxHhCDDPHxwIzDJ0REZ0X+PrkWb9cpY+n8pdJBmfk4E=;
        b=E5skNQ0nOz7zcrELMV1+opzDl4b9LoCE3pbnJVq767XcZ17SmUZumzyHZ5u65k8nNL
         P6WjzddNVfZs2JUQa6TQZDHHFFCfYcdlrBfYyNyMMI+2YofJE8zdSePr6RnYQj6AOIIn
         7X5uPX+pHjRRqt2hiUTkeEYHBUofiSJJChU5s8EajoFMe705O6J1UAYU6LNQxYKqiPa7
         XuviaJywvy5W+3aSYu0WPmy4orDbdpI9yqTZL58yGSs9DcRchl/XbbH+LBnKLnMsbKAS
         9WueGRom9/EmvSKDzjuaBJyBFtcaVeppE5Iqf3Qfju4l62dQwBnhP5yLeaMCJkTJFxuM
         9iYw==
X-Forwarded-Encrypted: i=1; AJvYcCU60sbU7FLS9aZlEh0hf0clyMEFP99k0kQF8Ph+rBwwtj7VVsDltDGBMDgIdWsHQ/QFp8u+xZUD7Yk93i8tALFl@lists.infradead.org, AJvYcCWA2XCNwY+Mg4wTXMEDXIhC3fEtnmxLsr5nPV5LrzLqT8ugYMCzbZLxUeImTvX9CCic/FJv7nff3jEALGw=@lists.infradead.org
X-Gm-Message-State: AOJu0YxfxIV51ehq12ri296pnT42R4j7zTm28qWFiJRlWGUBHfn11tPZ
	R4FHSpbu5GfVNb5THLIXJM/USuqt/BL8VRPdZLwMjuVxuUKOXEPKOaaYM/4l9FOq109A6diEAMl
	w+fyIna56dVlj92kwXPkvmc7PFu/BifE=
X-Gm-Gg: ASbGncuUKOEFkfEUk3KjJgjk8SULNBkWGC69jm+EOpZnvnUxSkOxJiu0aELlOGl5G+q
	/l+C9nlplSHo5YYS+LJjw2jF+Y2jEfvTfJ96CIYImNpI+ujeZL5u3VcEaGjnGuEXYeGhCWpDnca
	xrswDGDtYpN9DHswDBLRhsqP9mF4y1EztY
X-Google-Smtp-Source: AGHT+IFHh37ON8OdKdzVBBFcxedCAlOOwXK4V/iC1EPOOjVJZxdYBvuNOsHpf8VVt21G19e5ASyjwRRmZcF7LJTAmMs=
X-Received: by 2002:a17:90b:48c6:b0:30a:80bc:ad4 with SMTP id
 98e67ed59e1d1-3130cabf1f7mr2575310a91.0.1749088604483; Wed, 04 Jun 2025
 18:56:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250502094537.231725-1-fujita.tomonori@gmail.com>
In-Reply-To: <20250502094537.231725-1-fujita.tomonori@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 5 Jun 2025 03:56:31 +0200
X-Gm-Features: AX0GCFugcCm505NwwgN-68q9ZVnBp5bIOw8-paPBHPB9oCMtC5Zudgwp1svRBNU
Message-ID: <CANiq72=GXWj-aj1kPwnH=9mwR=GgrfJ4xsQUK36SFBRedk3oYg@mail.gmail.com>
Subject: Re: [PATCH v6 0/4] rust: Add bug/warn abstractions
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	x86@kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, peterz@infradead.org, hpa@zytor.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org, 
	kernel@xen0n.name, tangyouling@loongson.cn, hejinyang@loongson.cn, 
	yangtiezhu@loongson.cn, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_185645_891157_DEA1CC87 
X-CRM114-Status: UNSURE (   6.92  )
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

T24gRnJpLCBNYXkgMiwgMjAyNSBhdCAxMTo0NuKAr0FNIEZVSklUQSBUb21vbm9yaQo8ZnVqaXRh
LnRvbW9ub3JpQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBUaGlzIHBhdGNoc2V0IGFkZHMgd2Fybl9v
biBtYWNybyB3aXRoIHRoZSBidWcvd2FybiBhYnN0cmFjdGlvbiB0aGF0Cj4gdXRpbGl6ZXMgdGhl
IGtlcm5lbCdzIEJVRy9XQVJOIGZlYXR1cmUgdmlhIGFzc2VtYmx5LgoKVGhpcyBwYXNzZWQgbXkg
dXN1YWwgdGVzdHMgLS0gSSB3aWxsIHRha2UgYSBiZXR0ZXIgbG9vayBhbmQgcGljayBpdAplYXJs
eSBuZXh0IGN5Y2xlLgoKQ2hlZXJzLApNaWd1ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
