Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF015C35FFF
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 17:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AXV9kOtcK4t2YWLqlZPnT2bcmHDBpfmtqvEyh2qyufY=; b=EZ3c6Fgd8K41fH
	IaMZjeDd1ZW8Wk43QxfJ7luxkQHY7vpO2aqw7uyWBufGtGcnQ+IOMZP8ylDS0bl+/8qI9y5npPHmA
	rS7jK6sXPRVBXX9o3R/igjsV62pCV+Qbgeau0OkAeR8H3ikFkRwWJ+MlwxAgS4UUN8yBVnuP3cVDu
	3eITalqQ+DpZrw8t2sESBNHi9FkEHL2AAgZzStseCk55S7EAcbjo1qHO6z4YLsGUGtLZ6pt0j9q1a
	gl8WUYJ4aqcxCndjXolpds90xKC4KNUNUPY3MmzkZVjHRgFrvHKXkTT4t1EoZufevJ8+TKP5HP+oG
	FQi/23Qdk5ntN5I9Wc5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuE1L-00000003UrY-0w4C;
	Mon, 17 Mar 2025 17:12:59 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuDwf-00000003TLy-24cS
	for linux-riscv@lists.infradead.org;
	Mon, 17 Mar 2025 17:08:10 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43d07ca6a80so11473255e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 17 Mar 2025 10:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742231288; x=1742836088; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CVImGrzi7Si4eY1ElT4GTBjapJa7KEDVy79wJkwRK9M=;
        b=XgjLuDxVxhIvU5XW7jetxk2Gv2lmEQu5+tZAz2omHVnde3UzFAdMkmgmnJwKAVZccj
         4UTwN+aIghx17W6m0zjdvvy93OY1DrHFLrXEZQJ6uzgg+6qDBm6myEzrNT9NHuErapf+
         KHZO+4lM1Fhum4Se/7qhM7vImS6T+Rjzg4NvhqJ11DhsmUDpYksuBbP9LOSkHgxy0242
         y1Kambu3NRKwpF5Rkax4KBF8EJOQLdXoJYJvVmjek2w0qvXvJLsDKSjKVMsUSiJI3sXm
         w46lmrIFGhTY8VY50TjvGwQ0YSOvDa+eZQYZdnJP7dBKlyQ9qCZnXs0LTtNZdR3GN6JV
         kGlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742231288; x=1742836088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CVImGrzi7Si4eY1ElT4GTBjapJa7KEDVy79wJkwRK9M=;
        b=DF8sN6jISOtLafF+I6owvD6+lLiy6PAMvWpSjlTVvEgcpgsB+9UF96AsHlrE3GnbAV
         WmW5TIWUTVWyFBD28MgJY3DCaptvPXUWAWyVPUGEBdCnreFdpzck3w3XMZV+67yXqQon
         5sJHBFzY/+Zz+F3mZWd9GCH9qQ+2bpZNuqaEgsPylzSqTYSoG2RKaI47sixIlIfMhI1p
         YsKEuKdiV/TP9aMh2EeDzc1VLoW/1KRjIBInX9W6cOcdOAOn6tHAb3tGU7RJqGwNuP3x
         tmO7YB3jcdQuehHJpOyCffX9RnbzULY50txJ0GI7VBwg0bsn6JAQzGALhcSt7ubkoKR1
         v8vQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAWLf9fOggHm37KNY9Sw3gJYFut2QnguILTgTFTmQnl+eShew+KYAiGIe+AaETReWoaj632ngTr7NBfw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywk6/wBvr2+bMkfCBefMSQcbsr8b/NCNCwdqpES65Y2K6Zoqz0w
	TXj1FK2E3VGi7+ezN8eQiLJW7mK6+WfZfsMtF1yXwpde3LQ72KIVU9kXtEnfd54=
X-Gm-Gg: ASbGncu/i+RTr9mu8sr967xOny0lDFSBkW7TILZpn6AQDcqNBTHb0+IOhtPFEV3LHM6
	iuzz1LmL1Ky5NbXfEpsKlw6bS6yviiGSx4FzCQF4RNJnUtV3iId7aSeRusv9E2ict6/8Lu4EvUO
	GrAeXMfVbFgnJe+XSZ3S7IdI9e/oy/9lcwPHaAzcgkFGUmxHRa8XxoJH72L5ITKX3lhLQelcyZB
	yxLtlley+SdDtz5kw6GCTLY+eqdbDibMJiDanvExHSvQPohf96HNT78AY0081XxstzAQ9Xeh92m
	xHSIyuzb/AkkyLUraHGKe2e5Mf2P6yPnl4oVI8VrR0a70A==
X-Google-Smtp-Source: AGHT+IHKMm/vFlG6UDlvbMz7uYFJ/kE1+rhH+pJF0OJXqGvzOjYrzfvpGlP18pd4myenVCv8U+eYbw==
X-Received: by 2002:a05:600c:4ed2:b0:43d:cc9:b0a3 with SMTP id 5b1f17b1804b1-43d1ed000fdmr113482925e9.22.1742231287574;
        Mon, 17 Mar 2025 10:08:07 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d23cddb2asm96014505e9.39.2025.03.17.10.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 10:08:06 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH v4 01/18] riscv: add Firmware Feature (FWFT) SBI extensions definitions
Date: Mon, 17 Mar 2025 18:06:07 +0100
Message-ID: <20250317170625.1142870-2-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250317170625.1142870-1-cleger@rivosinc.com>
References: <20250317170625.1142870-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_100809_538027_8760AA25 
X-CRM114-Status: UNSURE (   8.97  )
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

VGhlIEZpcm13YXJlIEZlYXR1cmVzIGV4dGVuc2lvbiAoRldGVCkgd2FzIGFkZGVkIGFzIHBhcnQg
b2YgdGhlIFNCSSAzLjAKc3BlY2lmaWNhdGlvbi4gQWRkIFNCSSBkZWZpbml0aW9ucyB0byB1c2Ug
dGhpcyBleHRlbnNpb24uCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckBy
aXZvc2luYy5jb20+ClJldmlld2VkLWJ5OiBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsLmhvbGxhbmRA
c2lmaXZlLmNvbT4KVGVzdGVkLWJ5OiBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsLmhvbGxhbmRAc2lm
aXZlLmNvbT4KUmV2aWV3ZWQtYnk6IERlZXBhayBHdXB0YSA8ZGVidWdAcml2b3NpbmMuY29tPgpS
ZXZpZXdlZC1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KLS0tCiBh
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oIHwgMzMgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Ni
aS5oCmluZGV4IDNkMjUwODI0MTc4Yi4uYmIwNzdkMGM5MTJmIDEwMDY0NAotLS0gYS9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL3NiaS5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmgK
QEAgLTM1LDYgKzM1LDcgQEAgZW51bSBzYmlfZXh0X2lkIHsKIAlTQklfRVhUX0RCQ04gPSAweDQ0
NDI0MzRFLAogCVNCSV9FWFRfU1RBID0gMHg1MzU0NDEsCiAJU0JJX0VYVF9OQUNMID0gMHg0RTQx
NDM0QywKKwlTQklfRVhUX0ZXRlQgPSAweDQ2NTc0NjU0LAogCiAJLyogRXhwZXJpbWVudGFscyBl
eHRlbnNpb25zIG11c3QgbGllIHdpdGhpbiB0aGlzIHJhbmdlICovCiAJU0JJX0VYVF9FWFBFUklN
RU5UQUxfU1RBUlQgPSAweDA4MDAwMDAwLApAQCAtNDAyLDYgKzQwMywzMyBAQCBlbnVtIHNiaV9l
eHRfbmFjbF9mZWF0dXJlIHsKICNkZWZpbmUgU0JJX05BQ0xfU0hNRU1fU1JFVF9YKF9faSkJCSgo
X19yaXNjdl94bGVuIC8gOCkgKiAoX19pKSkKICNkZWZpbmUgU0JJX05BQ0xfU0hNRU1fU1JFVF9Y
X0xBU1QJCTMxCiAKKy8qIFNCSSBmdW5jdGlvbiBJRHMgZm9yIEZXIGZlYXR1cmUgZXh0ZW5zaW9u
ICovCisjZGVmaW5lIFNCSV9FWFRfRldGVF9TRVQJCTB4MAorI2RlZmluZSBTQklfRVhUX0ZXRlRf
R0VUCQkweDEKKworZW51bSBzYmlfZndmdF9mZWF0dXJlX3QgeworCVNCSV9GV0ZUX01JU0FMSUdO
RURfRVhDX0RFTEVHCQk9IDB4MCwKKwlTQklfRldGVF9MQU5ESU5HX1BBRAkJCT0gMHgxLAorCVNC
SV9GV0ZUX1NIQURPV19TVEFDSwkJCT0gMHgyLAorCVNCSV9GV0ZUX0RPVUJMRV9UUkFQCQkJPSAw
eDMsCisJU0JJX0ZXRlRfUFRFX0FEX0hXX1VQREFUSU5HCQk9IDB4NCwKKwlTQklfRldGVF9QT0lO
VEVSX01BU0tJTkdfUE1MRU4JCT0gMHg1LAorCVNCSV9GV0ZUX0xPQ0FMX1JFU0VSVkVEX1NUQVJU
CQk9IDB4NiwKKwlTQklfRldGVF9MT0NBTF9SRVNFUlZFRF9FTkQJCT0gMHgzZmZmZmZmZiwKKwlT
QklfRldGVF9MT0NBTF9QTEFURk9STV9TVEFSVAkJPSAweDQwMDAwMDAwLAorCVNCSV9GV0ZUX0xP
Q0FMX1BMQVRGT1JNX0VORAkJPSAweDdmZmZmZmZmLAorCisJU0JJX0ZXRlRfR0xPQkFMX1JFU0VS
VkVEX1NUQVJUCQk9IDB4ODAwMDAwMDAsCisJU0JJX0ZXRlRfR0xPQkFMX1JFU0VSVkVEX0VORAkJ
PSAweGJmZmZmZmZmLAorCVNCSV9GV0ZUX0dMT0JBTF9QTEFURk9STV9TVEFSVAkJPSAweGMwMDAw
MDAwLAorCVNCSV9GV0ZUX0dMT0JBTF9QTEFURk9STV9FTkQJCT0gMHhmZmZmZmZmZiwKK307CisK
KyNkZWZpbmUgU0JJX0ZXRlRfUExBVEZPUk1fRkVBVFVSRV9CSVQJCUJJVCgzMCkKKyNkZWZpbmUg
U0JJX0ZXRlRfR0xPQkFMX0ZFQVRVUkVfQklUCQlCSVQoMzEpCisKKyNkZWZpbmUgU0JJX0ZXRlRf
U0VUX0ZMQUdfTE9DSwkJCUJJVCgwKQorCiAvKiBTQkkgc3BlYyB2ZXJzaW9uIGZpZWxkcyAqLwog
I2RlZmluZSBTQklfU1BFQ19WRVJTSU9OX0RFRkFVTFQJMHgxCiAjZGVmaW5lIFNCSV9TUEVDX1ZF
UlNJT05fTUFKT1JfU0hJRlQJMjQKQEAgLTQxOSw2ICs0NDcsMTEgQEAgZW51bSBzYmlfZXh0X25h
Y2xfZmVhdHVyZSB7CiAjZGVmaW5lIFNCSV9FUlJfQUxSRUFEWV9TVEFSVEVEIC03CiAjZGVmaW5l
IFNCSV9FUlJfQUxSRUFEWV9TVE9QUEVEIC04CiAjZGVmaW5lIFNCSV9FUlJfTk9fU0hNRU0JLTkK
KyNkZWZpbmUgU0JJX0VSUl9JTlZBTElEX1NUQVRFCS0xMAorI2RlZmluZSBTQklfRVJSX0JBRF9S
QU5HRQktMTEKKyNkZWZpbmUgU0JJX0VSUl9USU1FT1VUCQktMTIKKyNkZWZpbmUgU0JJX0VSUl9J
TwkJLTEzCisjZGVmaW5lIFNCSV9FUlJfREVOSUVEX0xPQ0tFRAktMTQKIAogZXh0ZXJuIHVuc2ln
bmVkIGxvbmcgc2JpX3NwZWNfdmVyc2lvbjsKIHN0cnVjdCBzYmlyZXQgewotLSAKMi40Ny4yCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
