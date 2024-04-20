Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 472FBC4345F
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Apr 2024 01:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Igg1/Pz7JxXB91N497A7jEBzgo+fMuk3Dv0eKGyfAEY=; b=qvhGDFcr+KGNOy
	dxtRfF1WWsYZbcZJVowNJXKyTPBPmJYlPHQ0vWq/p9WXSXOPiy6nm1r+iL++cNYLS0MsUymxQNHA9
	W/KFYWCAEBSjHuRrBNCgqaMLUFeZYSlo4tdCzmFmpTIyWiCf0WKYfh6ojgNCHvjQIYkQArCOT1EoC
	U6LF3nTfHgZErxCrw9FAvWV0y6V1LatzWPsb+qDuI6zM7R9CQOVvcOhtw17Ly7daofw+sWxgtSqFY
	8Qed9TSJ8aG4JSPZxubPudeu/86QO/SLiyjj61ABzQ+SXT/1zQ2QV0Zifbmc6sy7UGUgjexGeamWi
	kkZQxm1BVdQRhB1h0V6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxz6k-00000007Sr6-2GJ9;
	Sat, 20 Apr 2024 01:01:34 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxxxO-00000007IW1-0vZ0
	for linux-riscv@lists.infradead.org;
	Fri, 19 Apr 2024 23:47:52 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1e83a2a4f2cso16912655ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 19 Apr 2024 16:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713570468; x=1714175268; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2nwzSC0mjOXawHhzlfTnID2LKW7HdSbdpZLlPlBet3o=;
        b=WShM7ifzUcezr1zLKEL58xS3rXtt+tag7dcBWCpbHA2bSZQOyINGTJrqR6kTvQgDQ0
         bih6z83CkN9ZFwmsd2ofqFWR4yG17pipuMpc4qTDFQhlrEhKHHwtAr/NChBK6FS1SCxs
         22UX+PpjDqeA8zMOK7qk3+0d0zwelDYltVQ+yuiuCUt0dXZ2pX7SlrclKV4tMLF1hKcb
         AX2IhEO5xKir7dMZVOMj5p1J9k7P/xUfQJA89GGLUQtPv9qTj1uIoi1q/EB0KYffoVv8
         pmFo1ihI+DofgobjQIsnIGpa4hgh3rbIJmkX8KH4fevXfPXHG/gi7+IXqbAb0+m7MG/l
         UrGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713570468; x=1714175268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2nwzSC0mjOXawHhzlfTnID2LKW7HdSbdpZLlPlBet3o=;
        b=C44e3PgWI3oysfiTTSKLgMR5/rlQdoDWr8/UMybTVWdLrF4o+sONBDuPbOi7CnL/0X
         JQD65NHEGLwHcvOe1r0Dbo5Bu5xyWQuFRXCHj5uas8phS6EwJ5/TJBZ6jAIUzFQkYYhz
         Tpc2Zs2dV5vWOfkWJ7etWfIPIRpRgthlJT9SjluYlm0Qb4uyquF94ddLdQq0oTU/RA5+
         SpgsiNtU9HNhR4iF1DyNb5q8DK+j6uNmALw1NPhxLoOSFeWplp1PYiWh6DvL46Zw8UZn
         PVMf4nw8IXDW/R1zXWWUzmHB7ZsPX9R82VoQE0BKzFvz8mdQdGonqKO501OYylr3RToj
         UDkQ==
X-Forwarded-Encrypted: i=1; AJvYcCULZcaQ//sx8jPf6OTk/XaAuyE19qScZt75g+pl8ePLwgPeO8Tv/J154X1SzzSATndUdHIO5dyALsVRmEtLpd1k9kpRFkhaMIuIg7jUCKo9
X-Gm-Message-State: AOJu0YwutiTJrPE5afdQPiZRT8GGMsQD/4+FbhjLsLKEIP/d8KDALIM2
	CECryD8kamOJ2nMa7IY39Ci9OxUm7yIqUbPT8CHELyviLPdGlds9LylgiHnYOHM=
X-Google-Smtp-Source: AGHT+IFwhdbfgPKxR3sTRhCsXv+l7GhC3Zl7nIRj/PlojSe97ane9b3f42xNp6we4mG5zu9et1mKlg==
X-Received: by 2002:a17:903:120f:b0:1e4:200e:9c2b with SMTP id l15-20020a170903120f00b001e4200e9c2bmr4072621plh.21.1713570468267;
        Fri, 19 Apr 2024 16:47:48 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id w17-20020a170902d11100b001e42f215f33sm3924017plw.85.2024.04.19.16.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 16:47:47 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Anup Patel <anup@brainfault.org>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	samuel.holland@sifive.com,
	Juergen Gross <jgross@suse.com>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Shuah Khan <shuah@kernel.org>,
	virtualization@lists.linux.dev,
	Will Deacon <will@kernel.org>,
	x86@kernel.org
Subject: [PATCH v8 02/24] RISC-V: Add FIRMWARE_READ_HI definition
Date: Sat, 20 Apr 2024 08:17:18 -0700
Message-Id: <20240420151741.962500-3-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240420151741.962500-1-atishp@rivosinc.com>
References: <20240420151741.962500-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_164750_438754_5684ECA2 
X-CRM114-Status: UNSURE (   9.16  )
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

U0JJIHYyLjAgYWRkZWQgYW5vdGhlciBmdW5jdGlvbiB0byBTQkkgUE1VIGV4dGVuc2lvbiB0byBy
ZWFkCnRoZSB1cHBlciBiaXRzIG9mIGEgY291bnRlciB3aXRoIHdpZHRoIGxhcmdlciB0aGFuIFhM
RU4uCgpBZGQgdGhlIGRlZmluaXRpb24gZm9yIHRoYXQgZnVuY3Rpb24uCgpSZXZpZXdlZC1ieTog
QW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KUmV2aWV3ZWQtYnk6IENsw6lt
ZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KQWNrZWQtYnk6IENvbm9yIERvb2xleSA8
Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+ClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVw
QGJyYWluZmF1bHQub3JnPgpTaWduZWQtb2ZmLWJ5OiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9z
aW5jLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oIHwgMSArCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL3NiaS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaAppbmRleCA2ZTY4ZjhkZmY3
NmIuLmVmODMxMWRhZmI5MSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmku
aAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oCkBAIC0xMzEsNiArMTMxLDcgQEAg
ZW51bSBzYmlfZXh0X3BtdV9maWQgewogCVNCSV9FWFRfUE1VX0NPVU5URVJfU1RBUlQsCiAJU0JJ
X0VYVF9QTVVfQ09VTlRFUl9TVE9QLAogCVNCSV9FWFRfUE1VX0NPVU5URVJfRldfUkVBRCwKKwlT
QklfRVhUX1BNVV9DT1VOVEVSX0ZXX1JFQURfSEksCiB9OwogCiB1bmlvbiBzYmlfcG11X2N0cl9p
bmZvIHsKLS0gCjIuMzQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
