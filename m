Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73567C25B7E
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jun 2024 12:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6bVDsWBaeVJDqKhA4WTqd4jcdNBQvOVzzkgJxCkffl8=; b=q8nwULcR4eSH5i
	UJ0pg+KVsZs1D7Pl7YXXmjXekZmN9Jk+02iWHk72baGH3hJ5TyynFwAyC3A83Sc80uaH6CLyKO/pb
	6+PFdaAgtfnC/lRqZhqdTItfh0/HMxa9at7y9HzaMa/mYiUHNV3nNpOJQg0Ej+xSfxXCWTNt3iV4E
	XShrs8+HE2fd/SQLv7msVDQD8XY6rEFd72o3MhMk7aQEignWseumevF6PSn3/DtgZCGvTwBYRLz/R
	EXOpf7KGxeus/OujdkjFMG5hH4aM0rf3bQyuQH2LcgKNGrZB5TnRYI66tWBVd2q/ir5Vil49e+hod
	0lY7/9Io/eiADPi6mq1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sETaq-00000002Mwf-3w8c;
	Tue, 04 Jun 2024 12:48:48 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sETam-00000002Mrh-1iZ6
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jun 2024 12:48:46 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-6c9cd96e485so313895a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 04 Jun 2024 05:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717505322; x=1718110122; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+f8PvBYYePzU1WhfRZSwb8yDs46YibFa/aQ6ldPx3Ns=;
        b=2dmS3eLP134vNtcAkpf20jkQ6BG/LXsZR8GXfnwpYqpWKBrukUXpJQ+Z+5eCThlrbZ
         Mq0zm+xbDu52RCHtCWTEJLEk6gUWYQOFLyxOEK2OkxW/gCVPAmd6PHobyGofO+Yus9iN
         lG2NZyLFExY+iU8BJLE9e2Zd/xYyX5/XpM8I+VVnYxhBuUYVB7hweCBjTpdwjwYQYsa0
         tGoB6pAbN3ZH6SyxQ7utAmc8XSZ32ji5meNovP+sNTGxgmRA1pentqsURzmIDBLJMNiZ
         c5eCpuxykvO/3PRkFqMCbPS6VQ9nDMCsLeXhayc/YgjyUnWERnA2b9ATQCKUHmuVO+vX
         Unkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717505322; x=1718110122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+f8PvBYYePzU1WhfRZSwb8yDs46YibFa/aQ6ldPx3Ns=;
        b=F6w6KS9ypbApZ6Gw+JVvTQ7VcPGckDzA6QkCILTG1moFRTA/e9uLaphBg1oEynSy4g
         2gxu/FUmfpUY0C6u22HMUKYr3UF+sxBk5FWA5xz+wLlg009iqWYcxbdzGZMpGh3ciozJ
         ZMG7gz1STtPzHu+rnbeGp1f8Lnqy5YKBBHpYCJgCpkIIi0VS0oDtTLCpkYEDP2/F9Bho
         F2djrqpZDbkH7uT+JNSNYomOnaZntg4BWEfK2yQxxi8h8zlwmKp/qyoVVxtT3+fqkHpl
         7S1vvqF1hUaMUJwmK5Z6V7l/OskF74Q9ZJEkjoS9IytOGSntAZP5XYJY/jbmvHsrcmfK
         H9fw==
X-Forwarded-Encrypted: i=1; AJvYcCWxJEd45tr9Bzk7ePHq754uqEHo0H51RgMvg9B7/O4B0U7TOFEmRlDjyU0CuO5q0kYAxVjoAh3XheC5sTpU/Cp+7yOy3iO1YEJq40/SyDZZ
X-Gm-Message-State: AOJu0Yzo86JztTnOKK74ZICZJEGC9k+JhEIW8h5e6A2sM/oMHORAKPG7
	9kojh4LlGt/Qlg3v/Z1UhWrlYuS3TvFIKiVsRXJaFzByVaPPUC0s2Pd35Ld5T/M=
X-Google-Smtp-Source: AGHT+IHlZckxUbCS2xW6q2DtBaj93CInAhGV+KC/Lja0MHjxnG9sUtL/5KteefRmvNyH0j8QM/rGkQ==
X-Received: by 2002:a05:6a21:789b:b0:1aa:68c4:3271 with SMTP id adf61e73a8af0-1b2a46a884dmr2408655637.3.1717505322181;
        Tue, 04 Jun 2024 05:48:42 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:327b:5ba3:8154:37ed])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6323ebc69sm83042885ad.211.2024.06.04.05.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 05:48:41 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Shuah Khan <shuah@kernel.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Atish Patra <atishp@atishpatra.org>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v6 13/16] riscv: add ISA extension parsing for Zcmop
Date: Tue,  4 Jun 2024 14:45:45 +0200
Message-ID: <20240604124550.3214710-14-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240604124550.3214710-1-cleger@rivosinc.com>
References: <20240604124550.3214710-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_054844_607576_23C1F518 
X-CRM114-Status: UNSURE (   9.69  )
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

QWRkIHBhcnNpbmcgZm9yIFpjbW9wIElTQSBleHRlbnNpb24gd2hpY2ggd2FzIHJhdGlmaWVkIGlu
IGNvbW1pdApjNzMyYTRmMzlhNGMgKCJaY21vcCBpcyByYXRpZmllZC8xLjAiKSBvZiB0aGUgcmlz
Y3YtaXNhLW1hbnVhbC4KClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJp
dm9zaW5jLmNvbT4KUmV2aWV3ZWQtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3Jv
Y2hpcC5jb20+ClJldmlld2VkLWJ5OiBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMu
Y29tPgotLS0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaCB8IDEgKwogYXJjaC9yaXNj
di9rZXJuZWwvY3B1ZmVhdHVyZS5jIHwgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaCBiL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaAppbmRleCAzOTE1YzljYjA4OGIuLjg2MDZiMTY0YzY5
NiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCisrKyBiL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaApAQCAtODYsNiArODYsNyBAQAogI2RlZmluZSBSSVND
Vl9JU0FfRVhUX1pDQgkJNzcKICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aQ0QJCTc4CiAjZGVmaW5l
IFJJU0NWX0lTQV9FWFRfWkNGCQk3OQorI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pDTU9QCQk4MAog
I2RlZmluZSBSSVNDVl9JU0FfRVhUX1hMSU5VWEVOVkNGRwkxMjcKIAogI2RlZmluZSBSSVNDVl9J
U0FfRVhUX01BWAkJMTI4CmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJl
LmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKaW5kZXggNTNjN2NhNTkwYTIyLi5h
YjI5NTMyNDU2MDkgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwor
KysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKQEAgLTMyMCw2ICszMjAsNyBAQCBj
b25zdCBzdHJ1Y3QgcmlzY3ZfaXNhX2V4dF9kYXRhIHJpc2N2X2lzYV9leHRbXSA9IHsKIAlfX1JJ
U0NWX0lTQV9FWFRfREFUQV9WQUxJREFURSh6Y2IsIFJJU0NWX0lTQV9FWFRfWkNCLCByaXNjdl9l
eHRfemNhX2RlcGVuZHMpLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBX1ZBTElEQVRFKHpjZCwgUklT
Q1ZfSVNBX0VYVF9aQ0QsIHJpc2N2X2V4dF96Y2RfdmFsaWRhdGUpLAogCV9fUklTQ1ZfSVNBX0VY
VF9EQVRBX1ZBTElEQVRFKHpjZiwgUklTQ1ZfSVNBX0VYVF9aQ0YsIHJpc2N2X2V4dF96Y2ZfdmFs
aWRhdGUpLAorCV9fUklTQ1ZfSVNBX0VYVF9EQVRBX1ZBTElEQVRFKHpjbW9wLCBSSVNDVl9JU0Ff
RVhUX1pDTU9QLCByaXNjdl9leHRfemNhX2RlcGVuZHMpLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRB
KHpiYSwgUklTQ1ZfSVNBX0VYVF9aQkEpLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHpiYiwgUklT
Q1ZfSVNBX0VYVF9aQkIpLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHpiYywgUklTQ1ZfSVNBX0VY
VF9aQkMpLAotLSAKMi40NS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
