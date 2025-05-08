Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2064C3ABBE
	for <linux-riscv@archiver.kernel.org>; Thu,  8 May 2025 08:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R8mf9lj2g84IaPuNh75kaUtqmU2KLrX8GMrTu/Yo17Q=; b=WBLJpifqxNBTeU
	1IMPvLuQUad3JZbp21G/m5N5KRQIdeAl/CtXJaOMvqV3er3s7sHg42dN580FK3ng+4tA1lTaPXxBa
	7ODl2Uaxrb4HOdrie6tCr6vNH9evLntWJDmduFtn6RS0whoBMORNX3BSRn3iiTJ504u/hfU3u0V+5
	RGrrpqXXLYN71rTgMgFaAeMozvN1/XaKknniVq6tbwBHAgIrWwLvkx++hL9WFbqdEwyDzZAd4Rp2i
	vovQ9zj4Kpbb9qus30vBrRIjVSVo613zZy5QZKR0o2gleBO1CqA11oPn5OZZhDBN9tvM5KGlqcPaw
	fXs3SPtmWdBSaXpDL1XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCwlM-000000008Y5-0q4H;
	Thu, 08 May 2025 08:37:52 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCwXK-000000006AG-0yo9
	for linux-riscv@lists.infradead.org;
	Thu, 08 May 2025 08:23:23 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so2995865e9.2
        for <linux-riscv@lists.infradead.org>; Thu, 08 May 2025 01:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1746692601; x=1747297401; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vh7Nh/LNhUg5Xl+qiW1/QFk8dwafIYEiWF4enwv0UK4=;
        b=3TGj89K0n/wUDMvSWtdHdSm0v7GSMWc0jLVtb/oR/xYUGMriJyrcT+eNRgTPA5/3KH
         OA79qoZkwEJXctRIPE4IwYsFaTx8EduGBV3eOQpPR/NL6NV/D/G1gm7EJPZd09n2d+Z9
         tMWfkr/94wNG58fmIcZGN18+DOSA/3CY+qLIoOb9aAZtzBgC+L4GGrNHnLN3w7+VrD9y
         +1dFWpvXrV9BKKdHb+VEz6jqbx1MC5/qZGkrqHW1vaM0r/2xeoID1C9+vbX4LZnX6QsM
         jAB1yEZ2FbbHChZzRjiqK3ZweIiTOJ5NHCe6UC/ofZ2IDVklZBUJJQHnlLtjZViIoIx/
         MOaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746692601; x=1747297401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vh7Nh/LNhUg5Xl+qiW1/QFk8dwafIYEiWF4enwv0UK4=;
        b=eBJ/TZ8OD+ItkF7FgQ1pQD9goRoF8pxDYlYbpV8dQv6h3FRKpwDocLbFvkTccTxvOh
         ojTPJTHRDtk38AtLrRYRNZgObwQUR5/fEfkr5F63D7zFnmSY0PqYvCPUsb9FJTdxbdHt
         bnNOcTCbHy+xtEML+nz7F7WpJLmypzdttUYpoiYThanl+4J7/XA3WAIBVmRI+BYz4DX3
         90Uv7k/R5eEUKiu3ziSlutYMNVKY+I3mYkvsGO91TpG4dhF+/H0ka97ZstUxs/vge9vw
         E04NKxqy+eV+ycMcEyvQHpiuGPbSlvd8eJoV7CaIpYBMaej6QR+RJAufQlFCVjLDhfoS
         cpww==
X-Forwarded-Encrypted: i=1; AJvYcCVfEf1shBChDKnlJh5jsMtPCYV1gfnrwILlUwDInDyuUlB+tt0fCtrKwJRhHyVPFS+Zdpvompkj03wXKg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxj6MwFr1QtVC7GRI93zv3Ol5XY9uKVAxfhvDSmH8vigFzMiUon
	eQoxeBSRdciIMABLPdSrP+/hIFhVJ5lDju2bjntI63whzJk45udEHN2xhOTLzRY=
X-Gm-Gg: ASbGnctEDM6FOo5HCz6WKRthDrBhjzlsHDgjBRPSiOl50T5/RCH0jWbZMEeLd3ciOqu
	sQe3u4uIla4ZXDGXVwrhefBiFYH2yJ0uyYxe/bLTolmS8B/rNHsgqNUnM6fOEgfn7H9cX64nMII
	LGx+30TDvirjaI+0S77AfP60qhN2ImKu9XAzY38YRqRs1hDTG4HPpLVLtxcG0NOGCbv4sLwd9ur
	69PXGRTxnUZ5rXXKSRxGyyBmmpqUGcprMR2PP8cLa3uzFOhOFm6DgzTnVugzJek0drthFOKFg8o
	pC6uvJNdzLorwrlwIU5tTU/eE1z2iJdSdN1d+8PJfUYDWBrV+iNQcMjLJCf2Eg==
X-Google-Smtp-Source: AGHT+IEaepCUF0s1jaV8f2x9+3A/ICFXfGBKrXbBRgf8EnrZFcBImB0rnl0HY1gtvoGRDu1Jbp/ttg==
X-Received: by 2002:a05:600c:4e16:b0:43b:c5a3:2e1a with SMTP id 5b1f17b1804b1-441d44bb815mr54224835e9.2.1746692600740;
        Thu, 08 May 2025 01:23:20 -0700 (PDT)
Received: from alex-rivos.lan ([2001:861:3382:ef90:e3eb:2939:f761:f7f1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd32f331sm28697035e9.13.2025.05.08.01.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 01:23:20 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v2 1/3] riscv: Fix typo EXRACT -> EXTRACT
Date: Thu,  8 May 2025 10:22:13 +0200
Message-Id: <20250508082215.88658-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250508082215.88658-1-alexghiti@rivosinc.com>
References: <20250508082215.88658-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_012322_269311_253EB894 
X-CRM114-Status: GOOD (  10.89  )
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

U2ltcGx5IGZpeCBhIHR5cG8uCgpSZXZpZXdlZC1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kg
PHBoaWxtZEBsaW5hcm8ub3JnPgpSZXZpZXdlZC1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVu
dGFuYW1pY3JvLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlA
cml2b3NpbmMuY29tPgotLS0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaW5zbi5oIHwgMiArLQog
YXJjaC9yaXNjdi9rZXJuZWwvdmVjdG9yLmMgICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL2luc24uaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaW5zbi5oCmluZGV4IDA5
ZmRlOTVhNWU4Zi4uMmE1ODlhNThiMjkxIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2luc24uaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2luc24uaApAQCAtMzUyLDcg
KzM1Miw3IEBAIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgYm9vbCByaXNjdl9pbnNuX2lzX2NfamFs
cih1MzIgY29kZSkKIAkoe3R5cGVvZih4KSB4XyA9ICh4KTsgUlZfWCh4XywgUlZGRFFfRkxfRlNf
V0lEVEhfT0ZGLCBcCiAJCQkJICAgUlZGRFFfRkxfRlNfV0lEVEhfTUFTSyk7IH0pCiAKLSNkZWZp
bmUgUlZWX0VYUkFDVF9WTF9WU19XSURUSCh4KSBSVkZEUV9FWFRSQUNUX0ZMX0ZTX1dJRFRIKHgp
CisjZGVmaW5lIFJWVl9FWFRSQUNUX1ZMX1ZTX1dJRFRIKHgpIFJWRkRRX0VYVFJBQ1RfRkxfRlNf
V0lEVEgoeCkKIAogLyoKICAqIEdldCB0aGUgaW1tZWRpYXRlIGZyb20gYSBKLXR5cGUgaW5zdHJ1
Y3Rpb24uCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC92ZWN0b3IuYyBiL2FyY2gvcmlz
Y3Yva2VybmVsL3ZlY3Rvci5jCmluZGV4IDE4NGY3ODBjOTMyZC4uOTAxZTY3YWRmNTc2IDEwMDY0
NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC92ZWN0b3IuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5l
bC92ZWN0b3IuYwpAQCAtOTMsNyArOTMsNyBAQCBib29sIGluc25faXNfdmVjdG9yKHUzMiBpbnNu
X2J1ZikKIAkJcmV0dXJuIHRydWU7CiAJY2FzZSBSVlZfT1BDT0RFX1ZMOgogCWNhc2UgUlZWX09Q
Q09ERV9WUzoKLQkJd2lkdGggPSBSVlZfRVhSQUNUX1ZMX1ZTX1dJRFRIKGluc25fYnVmKTsKKwkJ
d2lkdGggPSBSVlZfRVhUUkFDVF9WTF9WU19XSURUSChpbnNuX2J1Zik7CiAJCWlmICh3aWR0aCA9
PSBSVlZfVkxfVlNfV0lEVEhfOCB8fCB3aWR0aCA9PSBSVlZfVkxfVlNfV0lEVEhfMTYgfHwKIAkJ
ICAgIHdpZHRoID09IFJWVl9WTF9WU19XSURUSF8zMiB8fCB3aWR0aCA9PSBSVlZfVkxfVlNfV0lE
VEhfNjQpCiAJCQlyZXR1cm4gdHJ1ZTsKLS0gCjIuMzkuMgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
