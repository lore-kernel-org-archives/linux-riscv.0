Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1583DC54798
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Feb 2024 19:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rwYH9KX976eWPUPI3sTpF4UUbrlyq2rBVO9WpX21j1U=; b=T99rYP+tMsyjcD
	9Qbbv3jal+WgexTAad34KdT83frE1RvDqDvS0kt8NFTlRqUDA4+BzpQx3VD3SqA0GGOsoGWP0LJmA
	wjLdI7xZO5T1XfZHJmDj6qfDG6RYup6ZfijGG6GSk9ydvkYfaYQiqJkKASUak+9h/AmABobbN3bNx
	e9Jlf87bHpiBV95iXlgDYEh/TmK7NK5NaeX/JlEBzeOpU9UvuTXpEjuX0D1vqyCMwznSzrUSsZfM4
	Wgl1L5c2NNfhzaRGJgVqQ30MYpDMy8CRwz4YYszwonvgZtwXt1lCu3tRNd0J/EKoXaYjtz6Kb8bZH
	V6UVTzKns6OBlqaNUaYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rflqZ-0000000EpiI-1M79;
	Thu, 29 Feb 2024 19:13:35 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rflqW-0000000EpfA-2HwO
	for linux-riscv@lists.infradead.org;
	Thu, 29 Feb 2024 19:13:34 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6e56d594b31so737160b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 29 Feb 2024 11:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1709234004; x=1709838804; darn=lists.infradead.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gDcArbucJdyaAvLy60oXS6bCVhoffqyHS70y5f6zPQM=;
        b=iYpuwqcrrLh+x+gchlnJ9bmE4SALqgLL3TDw3IrW+xMWVjQTgAWmTpwJ5aku7w14et
         ngNWhVcE4pgXMuEJwDRbZmzRRy2nvjvfexIA/lcMJ69Y8Oan8D6AnlyJd5sFynXDghnL
         CygIxGNIfX9tLOAMM9dJ4cwn2PL91Fpzgq0CInOrnSECWIOtndCnD4P5pwVDOjxAGBPZ
         QlZNApd2xWG7vHLXoxQG68ftNMPBj0Mj9YmUkM2WttZr7o8w4G5gGqwGesYKqD+dUGAR
         Gazm6o69xXv4k1jcMHwcq7Q2IowYgBEa1y/LoP5DzdPdgmgcKGOq8YIV5xT6ApJxe1aX
         Fd3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709234004; x=1709838804;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gDcArbucJdyaAvLy60oXS6bCVhoffqyHS70y5f6zPQM=;
        b=EW2y1QeNWoDZc7zUmk1W5lZwWoy4yB4XiRaN6GQHew5syTkW6jeNHvK9YEZT/tdUS3
         TvR/vZoF4R1XOcIlE6cxGn8GNJUM/g1NweyL+dKlXAWHL6KH7dYmuwn2rrgDrdPmNTvU
         UF//vFYvPbR/bXahqSGmepnu4zYNL9CaIwhXcAsX3t6vmPG0xjrwcxWNnqoM5hlDqvuk
         Il21eLgMcuKmyKtl7qJLE9ykuVBkqxcZo2mOWJfGQMukXhY+HNAaGLbIs9F9cz98Ba2j
         EWWjHdSzg5UCtXK55bN8mkX6R4vVqAgKoM51VfpysrtIghUHh6UvAuisjIoH/vEUYpDx
         ynWA==
X-Forwarded-Encrypted: i=1; AJvYcCXR+a7/HkllqswlEh66GdsMGXjzoQURm4fubIIQwBxUxtBjknvyQeR8Gb5cJvo8SRdql7pnvEiyz5zOJQiI71re1nSqBsYsIMkSAag8m0I+
X-Gm-Message-State: AOJu0Yxz0ntdCEKqCfR9bluR0RmA3cv9b+Tv0MmKaCRtjTnrNlKsl544
	aQpU/RvhQxA1GKEZgxttOUeDpd673BrIprl9YJYASHRKhjWfa9owxcdNagr0bIc=
X-Google-Smtp-Source: AGHT+IEbfm719PUIN8oU5mkeKRlaNBnBkv6AVCHW3upsRPy0WGosIkm+9XpZnSckdfNF7n7iqP8yaA==
X-Received: by 2002:a17:902:f813:b0:1dc:bcb3:f552 with SMTP id ix19-20020a170902f81300b001dcbcb3f552mr2762237plb.66.1709234004612;
        Thu, 29 Feb 2024 11:13:24 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id p23-20020aa78617000000b006e091a254adsm1623909pfn.30.2024.02.29.11.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 11:13:24 -0800 (PST)
Message-ID: <65e0d754.a70a0220.f6721.7b16@mx.google.com>
Date: Thu, 29 Feb 2024 11:13:24 -0800 (PST)
MIME-Version: 1.0
X-Kernelci-Tree: riscv
X-Kernelci-Branch: fixes
X-Kernelci-Kernel: riscv-for-linus-6.8-rc4-13-g680945f0aa508
X-Kernelci-Report-Type: build
Subject: riscv/fixes build: 8 builds: 0 failed, 8 passed,
 2 warnings (riscv-for-linus-6.8-rc4-13-g680945f0aa508)
To: kernelci-results@groups.io, kernel-ci-triage@rivosinc.com,
 linux-riscv@lists.infradead.org
From: "kernelci.org bot" <bot@kernelci.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_111332_808855_06193872 
X-CRM114-Status: UNSURE (   2.17  )
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

cmlzY3YvZml4ZXMgYnVpbGQ6IDggYnVpbGRzOiAwIGZhaWxlZCwgOCBwYXNzZWQsIDIgd2Fybmlu
Z3MgKHJpc2N2LWZvci1saW51cy02LjgtcmM0LTEzLWc2ODA5NDVmMGFhNTA4KQoKRnVsbCBCdWls
ZCBTdW1tYXJ5OiBodHRwczovL2tlcm5lbGNpLm9yZy9idWlsZC9yaXNjdi9icmFuY2gvZml4ZXMv
a2VybmVsL3Jpc2N2LWZvci1saW51cy02LjgtcmM0LTEzLWc2ODA5NDVmMGFhNTA4LwoKVHJlZTog
cmlzY3YKQnJhbmNoOiBmaXhlcwpHaXQgRGVzY3JpYmU6IHJpc2N2LWZvci1saW51cy02LjgtcmM0
LTEzLWc2ODA5NDVmMGFhNTA4CkdpdCBDb21taXQ6IDY4MDk0NWYwYWE1MDg0ZDQ5YmJmYjcwNWNh
MTYyZmMwMGNjMTQ2YWUKR2l0IFVSTDogaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xp
bnV4L2tlcm5lbC9naXQvcmlzY3YvbGludXguZ2l0CkJ1aWx0OiAxIHVuaXF1ZSBhcmNoaXRlY3R1
cmUKCldhcm5pbmdzIERldGVjdGVkOgoKcmlzY3Y6CiAgICBkZWZjb25maWcgKGdjYy0xMCk6IDEg
d2FybmluZwogICAgZGVmY29uZmlnK0NPTkZJR19TTVA9biAoZ2NjLTEwKTogMSB3YXJuaW5nCgoK
V2FybmluZ3Mgc3VtbWFyeToKCiAgICAyICAgIHNlY3VyaXR5L3NlY3VyaXR5LmM6ODEwOjI6IHdh
cm5pbmc6IOKAmG1lbWNweeKAmSBvZmZzZXQgMzIgaXMgb3V0IG9mIHRoZSBib3VuZHMgWzAsIDBd
IFstV2FycmF5LWJvdW5kc10KCj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CgpEZXRhaWxlZCBwZXIt
ZGVmY29uZmlnIGJ1aWxkIHJlcG9ydHM6CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpkZWZjb25m
aWcgKHJpc2N2LCBnY2MtMTApIOKAlCBQQVNTLCAwIGVycm9ycywgMSB3YXJuaW5nLCAwIHNlY3Rp
b24gbWlzbWF0Y2hlcwoKV2FybmluZ3M6CiAgICBzZWN1cml0eS9zZWN1cml0eS5jOjgxMDoyOiB3
YXJuaW5nOiDigJhtZW1jcHnigJkgb2Zmc2V0IDMyIGlzIG91dCBvZiB0aGUgYm91bmRzIFswLCAw
XSBbLVdhcnJheS1ib3VuZHNdCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpkZWZjb25maWcgKHJp
c2N2LCBjbGFuZy0xNikg4oCUIFBBU1MsIDAgZXJyb3JzLCAwIHdhcm5pbmdzLCAwIHNlY3Rpb24g
bWlzbWF0Y2hlcwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KZGVmY29uZmlnK0NPTkZJR19TTVA9
biAocmlzY3YsIGdjYy0xMCkg4oCUIFBBU1MsIDAgZXJyb3JzLCAxIHdhcm5pbmcsIDAgc2VjdGlv
biBtaXNtYXRjaGVzCgpXYXJuaW5nczoKICAgIHNlY3VyaXR5L3NlY3VyaXR5LmM6ODEwOjI6IHdh
cm5pbmc6IOKAmG1lbWNweeKAmSBvZmZzZXQgMzIgaXMgb3V0IG9mIHRoZSBib3VuZHMgWzAsIDBd
IFstV2FycmF5LWJvdW5kc10KCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCmRlZmNvbmZpZytDT05G
SUdfU01QPW4gKHJpc2N2LCBjbGFuZy0xNikg4oCUIFBBU1MsIDAgZXJyb3JzLCAwIHdhcm5pbmdz
LCAwIHNlY3Rpb24gbWlzbWF0Y2hlcwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0Kbm9tbXVfazIx
MF9kZWZjb25maWcgKHJpc2N2LCBnY2MtMTApIOKAlCBQQVNTLCAwIGVycm9ycywgMCB3YXJuaW5n
cywgMCBzZWN0aW9uIG1pc21hdGNoZXMKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCm5vbW11X2sy
MTBfZGVmY29uZmlnIChyaXNjdiwgY2xhbmctMTYpIOKAlCBQQVNTLCAwIGVycm9ycywgMCB3YXJu
aW5ncywgMCBzZWN0aW9uIG1pc21hdGNoZXMKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCm5vbW11
X2syMTBfc2RjYXJkX2RlZmNvbmZpZyAocmlzY3YsIGNsYW5nLTE2KSDigJQgUEFTUywgMCBlcnJv
cnMsIDAgd2FybmluZ3MsIDAgc2VjdGlvbiBtaXNtYXRjaGVzCgotLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQpub21tdV9rMjEwX3NkY2FyZF9kZWZjb25maWcgKHJpc2N2LCBnY2MtMTApIOKAlCBQQVNT
LCAwIGVycm9ycywgMCB3YXJuaW5ncywgMCBzZWN0aW9uIG1pc21hdGNoZXMKCi0tLQpGb3IgbW9y
ZSBpbmZvIHdyaXRlIHRvIDxpbmZvQGtlcm5lbGNpLm9yZz4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
