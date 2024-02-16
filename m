Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D4E1C48295
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Feb 2024 20:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UNkwqMzKD0XNFKSuIchtCtmXCj15TKL4TM/Yq7RQSl8=; b=CF/SF/9msylk5I
	lKOVuhImZ+Fxbcu8H8AtVpuQxdkTNeBOaTC2qfktJNj+ZURRf664XjVpVM4CvuJhQBbOCUf9wE9UY
	eZw71DhUm6hgL4Quorn63jWlq42Rlc/2gy6CDjEMNMLXKzxP5HUtiS0RgA2cgzMjUIWNiI+YdW0lc
	5n2MpxRsjZwa800GpL0w+zTt9ACifHJ7WBoDeQBNIS7qdwiPvkEZB7oTn10loPXjbIX+moQjqWm6u
	3rimK+mjsgBWZpKvEI8l8LY4NzSMjuI3LufiiTQIU3c/bY4wJlTMadrwCxea6MEZ4h3m5c3IQ6DjE
	gNcRZaDhj80LFHG33t+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb4uS-00000003eEK-3rf9;
	Fri, 16 Feb 2024 20:34:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb4tu-00000003drd-0uOB
	for linux-riscv@bombadil.infradead.org;
	Fri, 16 Feb 2024 20:33:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=NzWE5WIBCpf5ZTmFY5V/bHTObz1VU0gjQMeEJG7d9OY=; b=Q//1P7oHvWkMlJ1kwZC9yfRJ6t
	9et0NqvY2XFF54n/wTRn1wu5RPwnsLrrkTS/FycqYkN2zBSgoBhWvSFup+eN/JjI7oui2fUcjlgyF
	AX1mm95qygYQIXFJFQMD+47deGBRBlSofaCfoAgDxjZ/NX0OeycBsC6Zfb87oSqQ0KdJp6mgnv94u
	K8oNLgZpS7Me1YIHKnxctTIRv3mBbxdxE2a4rpdyYLiF6EwW6Jj6BUmWIxdPLGUqn2ztdcngG2T79
	+bsY4NFsGnekniW/bbI5kMhMeznqZ04Gxxv91gf7+s8W5swSbZaay6nsVo6qdeHrQ4OizpNJthEBQ
	xORK//Fw==;
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb4tp-000000001ss-3fHf
	for linux-riscv@lists.infradead.org;
	Fri, 16 Feb 2024 20:33:36 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-6e10746c6f4so1820146b3a.2
        for <linux-riscv@lists.infradead.org>; Fri, 16 Feb 2024 12:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1708115606; x=1708720406; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NzWE5WIBCpf5ZTmFY5V/bHTObz1VU0gjQMeEJG7d9OY=;
        b=yIuBz0hEtVz7rknfgYngA/Z90X7PJMWSNfS+stCgRXg6jzWnH0zNCCbc23hUBFnDXh
         WcNUtKzF/4O1QOEGisFPqlMsKGf+cx9sy8fRg/VuvyimUxtH0T1yml8qN54Gx1Q2pjiz
         TuI7PH17qncQDvRkGZzt/6924BRz3+6AdfmwSbrSNFj01JRVjpAzuSuHTHxZiV095pa1
         flhvqOxtlFnTNI3pLlAEnLq4x0YttfjIlruUiOVvF9sh8vsU6R4U8DtUpI1vLU7m3EZj
         GaWYwIW/F6EAVt3943MV2NczW7wXcRE5XEd/xUEp3t1tR+DFug2ObR5GXEX0ch2YeIqa
         OaVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708115606; x=1708720406;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NzWE5WIBCpf5ZTmFY5V/bHTObz1VU0gjQMeEJG7d9OY=;
        b=qDa3xkPIKkWiPAYpQy9E3pmkSP56Hhpl9mlMX1fbkNu/zLgP/BpmcOsiE7qfm7FsNZ
         HNkSwDYi/y/Kv0bXLEZxWBqU6xeJQjH7F2+y/zdc5wEb77jgMNHx7oHpSnCN4EBzSbdv
         haGXEUZqDRNBHrOaFal/YEvEbegF0Z8xVb0CIDGd3TTDyPhNh3Fn8l9wOz7BjyTK2Rfs
         dFXdUOFwoBSVTQO90zGahlNwiUH08acyDZvjOsxHi5/1WNiO1foLa26W3WOf0s1eQZfo
         YGgLQBhDFfECT+46WUB5Fe0l8TpoMulh0FMAvAFAFFldJjFGzaDHZIvi5nn5NBgDFsXz
         EG3Q==
X-Gm-Message-State: AOJu0YzALfLaJDn+dKRDQsWYO6+1YToi3qe2/ltFfMGm9roIcxRcJKiO
	tJ7/rZaqJ5mwN9GWXeB+xIxDn6KFGqoIbwO410nFW7PxZ3jnkbwUgvHUNPuAcTo=
X-Google-Smtp-Source: AGHT+IEVhbPcWzD55yw+Y7FJ5a5/7r4jpRGA/7IFcvDtH0t0CDKBUnIYaYNUkpWQ2BiBJU+p07ZlYA==
X-Received: by 2002:a05:6a20:c906:b0:1a0:911d:e4f with SMTP id gx6-20020a056a20c90600b001a0911d0e4fmr503112pzb.33.1708115605908;
        Fri, 16 Feb 2024 12:33:25 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id s32-20020a056a0017a000b006e091489776sm369918pfg.92.2024.02.16.12.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 12:33:25 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v4 0/2] riscv: Use Kconfig to set unaligned access speed
Date: Fri, 16 Feb 2024 12:33:17 -0800
Message-Id: <20240216-disable_misaligned_probe_config-v4-0-dc01e581c0ac@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAI3Gz2UC/43NywrCMBCF4VeRrI3kVtu68j1ESi6TOqBJSSQo0
 nc3ulFE0NXwz+I7N5IhIWSyWdxIgoIZY6ihlgtiDzqMQNHVJoIJxbjk1GHW5gjDqd4jjgHcMKV
 oYLAxeBwpU1KDlm3je0mqMiXweHku7Pa1D5jPMV2fg4U/vv/bhVNG+87xpoHeOt1tE5aYMdiVj
 Sfy4It4kYL9QYpKtq2V686Aa434Qsp3UvwmZSWtUr7nnklj1h/kPM93+lwUUXcBAAA=
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Evan Green <evan@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Eric Biggers <ebiggers@kernel.org>, 
 Elliot Berman <quic_eberman@quicinc.com>, Charles Lohr <lohr85@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1708115604; l=1835;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=yAKgil5iGjdT26N5K5Xf0fZQIeI37RtlfXgAB02i4iY=;
 b=BN1ENEKrMEo8ZtA4kCbniJfEZ5tGU5bD879ggcvgytzCbBDPp+jAEUqS9S/ESeyVDiXM3VD28
 K/v6hM7AKaDA4OzThqF0hDpZ/IYjCFZUTCwgFHNtuyBGo1ZetswNh2R
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_203334_234602_E2228544 
X-CRM114-Status: UNSURE (   8.69  )
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

SWYgdGhlIGhhcmR3YXJlIHVuYWxpZ25lZCBhY2Nlc3Mgc3BlZWQgaXMga25vd24gYXQgY29tcGls
ZSB0aW1lLCBpdCBpcwpwb3NzaWJsZSB0byBhdm9pZCBydW5uaW5nIHRoZSB1bmFsaWduZWQgYWNj
ZXNzIHNwZWVkIHByb2JlIHRvIHNwZWVkdXAKYm9vdC10aW1lLgoKU2lnbmVkLW9mZi1ieTogQ2hh
cmxpZSBKZW5raW5zIDxjaGFybGllQHJpdm9zaW5jLmNvbT4KLS0tCkNoYW5nZXMgaW4gdjQ6Ci0g
QWRkIGFkZGl0aW9uYWwgS2NvbmZpZyBvcHRpb25zIGZvciB0aGUgb3RoZXIgdW5hbGlnbmVkIGFj
Y2VzcyBzcGVlZHMKLSBMaW5rIHRvIHYzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjQw
MjAyLWRpc2FibGVfbWlzYWxpZ25lZF9wcm9iZV9jb25maWctdjMtMC1jNDRmOTFmMDNiYjZAcml2
b3NpbmMuY29tCgpDaGFuZ2VzIGluIHYzOgotIFJldmVydCBjaGFuZ2UgdG8gY3N1bSAoRXJpYykK
LSBDaGFuZ2UgaWZuZGVmcyBmb3IgaWZkZWZzIChFcmljKQotIENoYW5nZSBjb25maWcgaW4gTWFr
ZWZpbGUgKEVsbGlvdC9FcmljKQotIExpbmsgdG8gdjI6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L3IvMjAyNDAyMDEtZGlzYWJsZV9taXNhbGlnbmVkX3Byb2JlX2NvbmZpZy12Mi0wLTc3YzM2OGJl
ZDdiMkByaXZvc2luYy5jb20KCkNoYW5nZXMgaW4gdjI6Ci0gTW92ZSBhcm91bmQgZGVmaW5pdGlv
bnMgdG8gcmVkdWNlIGlmZGVmcyAoQ2zDqW1lbnQpCi0gTWFrZSBSSVNDVl9NSVNBTElHTkVEIGRl
cGVuZCBvbiAhSEFWRV9FRkZJQ0lFTlRfVU5BTElHTkVEX0FDQ0VTUwogIChDbMOpbWVudCkKLSBM
aW5rIHRvIHYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjQwMTMxLWRpc2FibGVfbWlz
YWxpZ25lZF9wcm9iZV9jb25maWctdjEtMC05OGQxNTVlOWNkYThAcml2b3NpbmMuY29tCgotLS0K
Q2hhcmxpZSBKZW5raW5zICgyKToKICAgICAgcmlzY3Y6IGxpYjogSW50cm9kdWNlIGhhc19mYXN0
X21pc2FsaWduZWRfYWNjZXNzIGZ1bmN0aW9uCiAgICAgIHJpc2N2OiBTZXQgdW5hbGlnbm1lbnQg
c3BlZWQgYXQgY29tcGlsZSB0aW1lCgogYXJjaC9yaXNjdi9LY29uZmlnICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICA1OCArKysrKy0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3B1ZmVhdHVy
ZS5oICAgICAgICAgfCAgNDUgKysrKy0KIGFyY2gvcmlzY3Yva2VybmVsL01ha2VmaWxlICAgICAg
ICAgICAgICAgICAgfCAgIDYgKy0KIGFyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyAgICAg
ICAgICAgICAgfCAyNTUgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIGFyY2gvcmlzY3Yva2Vy
bmVsL21pc2FsaWduZWRfYWNjZXNzX3NwZWVkLmMgfCAyNjUgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKwogYXJjaC9yaXNjdi9rZXJuZWwvcHJvYmVfZW11bGF0ZWRfYWNjZXNzLmMgICB8ICA2
NCArKysrKysrCiBhcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jICAgICAgICAgICAgIHwg
IDI1ICsrKwogYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jICAgICAgICB8ICA1
NCArLS0tLS0KIGFyY2gvcmlzY3YvbGliL2NzdW0uYyAgICAgICAgICAgICAgICAgICAgICAgfCAg
IDcgKy0KIDkgZmlsZXMgY2hhbmdlZCwgNDU0IGluc2VydGlvbnMoKyksIDMyNSBkZWxldGlvbnMo
LSkKLS0tCmJhc2UtY29tbWl0OiA2NjEzNDc2ZTIyNWUwOTBjYzlhYWQ0OWJlN2ZhNTA0ZTI5MGRk
MzNkCmNoYW5nZS1pZDogMjAyNDAxMzEtZGlzYWJsZV9taXNhbGlnbmVkX3Byb2JlX2NvbmZpZy0w
NDNhZWEzNzVmOTMKLS0gCi0gQ2hhcmxpZQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
