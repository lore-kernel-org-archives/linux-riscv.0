Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32243E7E378
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 11:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HPJYi1DfEw5A6B1cL5esyd1g+1klRwD6DFGapdxHLzE=; b=ZZyVPaKIQAcEvo
	IipenIRfuqU3U+dSEgMBD4xKQBXTobXnR1P/ErLo+Fr6CFTPS1W59OcfKUbneh16gmzWgi0ipUxZi
	dID2kHQo6WnmMhClrgWaEaBiGxaZtcNNSW1KC87thLqCmbqFmfQFv+6kPt2Rwu6Ib2x5ul85op2q6
	uq5fjoK4isE42+YJPBStlVDpKiKtsTeJjFjHZPAD/H6L7e61B6rN8kdV8TMYtl45KPH2RMJHLIKxe
	gWHRH2L1YucFvACi6aQ7E2zjbJ0Bum1GekYMCazyO6QortKddhw0GUVW2qoOTus5KYNQ7oSSAdmCr
	wA2fXWkESRhnii3O9zMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8cq7-00000001y5T-1gj1;
	Fri, 03 Apr 2026 11:37:27 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8cq5-00000001y4V-2c47
	for linux-riscv@lists.infradead.org;
	Fri, 03 Apr 2026 11:37:26 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-35d971fb6f1so1566993a91.0
        for <linux-riscv@lists.infradead.org>; Fri, 03 Apr 2026 04:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775216245; x=1775821045; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CuMPAUkAJvfBgKNEN+2BubKNuxBNh0SHWbF0CWlzYqI=;
        b=P6g3O+m1O2ovJkBDH7xZaKMZ+fgenPazOMQDkh4QK62lAvdyI/nHX3ZIVoYxfKk6Qx
         bNRORlxptxVdTGapGAqJ4+X6EgrxVKY27H3BcXJ+Uq3OLFpahbJBgpsMrrZ11cQC35HD
         aI9GNlMDSw3b4ooHUZGtomn8qDYvrzt7f4fOmXKa6C/S4Zq49DqUflmt8y41WttzXrE4
         KJ4b6vWZzhDswWmZK4so5svkvlNqDHv/6hZLtMW0NddRTps6Kzp7y8RX4iEyK2s0pT6Y
         YvCTSqipCfH4hdZAJ+aBGTpVfTsohlchg3aLlHQyX/2xf23hWOnKYs3DPgg6rUVb3JVF
         2HqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775216245; x=1775821045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CuMPAUkAJvfBgKNEN+2BubKNuxBNh0SHWbF0CWlzYqI=;
        b=ArePmAD3PwpFuzSjVqKxbpmMtTdVx6kpSJQeNgjbcEYPHe9WILsmqFI7ZX8RPwbbRw
         Ti9FUZGt8cmop4PSWCAHdQKyioH83eTjqNxgjrKMJqjTtdJk3W62z9VXA8xaQDg4dKV+
         lFYmMXE5T1hIeyo9BuzqvOMZrpxXylu0NenI+oCM9JSfRXOQEC8sqm/b6TBS0YKlZ6Ta
         on0ipu8OlP4QMQG06vNUOJ34FHNDtFjpspcKy+ACgXP3FaYJNVSicpzSHVk6b8XAIpqM
         5J11scSThw1KJNOoZENr+6Mf+JNYxa281+BN+LWnUx0iMwYjHoIt0rFDq/BScO/W7FAq
         8Gcw==
X-Forwarded-Encrypted: i=1; AJvYcCWCjGsdDdOiHQHPitiZgLuc8LDBpefCWqDPuyBcUWZj3BerWRxVchu0PugAds4zvhj8qEej9ObOmnbs7A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzNXixoMH6i43nLSQfKH1qKgny+Vn2ERZLI7qOnQq6Fsj8rEWnC
	TWmxXCSCBoJwj+ctXdG2lPNmzw4lUjiazeMby2B5AHviyBX3isPhyMA+
X-Gm-Gg: AeBDiev6be429ESzEOOezSfDnzcFo0HNxAyRDh65BIYlcKWyAhVQZJUqoUzj5WazuwI
	HIR8GwNJdwIrLb+BgcyMaN1WIZ6u1vrVI5wqbWREc7gQbDDZuFmbvs7znrWmi4rJomq0m5Tn0nk
	StyoN8w0+y+wLR40YzPzuePR90sb4jgjilc8ad8vfRqQtqVZKmtINip9WhkMlH0m8GdQk3kLukz
	3QrPnUss5YnU+MZ55JVdQ5vHEdNM2cfJD6h9xH9OARThrg8x8U0EuJi9d41FYY158R8JvelU+kX
	5xAuku5O7VpVNIZuTgENNY2uoOTILj+Bk/SrcTJhvEgzKjvVP55kBg+vOdKLwGWSkGpRkETk2Q8
	7XJCtHm8gAbR0J5iMusZsfU0qhyKoo/7snwdzgDBYoaxmuLEKFzMFmFQQHzqGfEwONU8QIdR+Hz
	0G2ikrAkaaq8oTT3yL8U4=
X-Received: by 2002:a17:90b:350e:b0:35b:9682:51e6 with SMTP id 98e67ed59e1d1-35de691ac13mr2549960a91.16.1775216244668;
        Fri, 03 Apr 2026 04:37:24 -0700 (PDT)
Received: from archriscv ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35de6860cfbsm957599a91.6.2026.04.03.04.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 04:37:24 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Han Gao <gaohan@iscas.ac.cn>,
	Ze Huang <huang.ze@linux.dev>,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH linux-next v1 3/3] riscv: dts: spacemit: k1-bananapi-f3: Correct USB hub power hierarchy
Date: Wed, 25 Mar 2026 13:46:10 +0530
Message-ID: <20260325081700.1502-4-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325081700.1502-1-linux.amoon@gmail.com>
References: <20260325081700.1502-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_043725_663007_69CC475B 
X-CRM114-Status: GOOD (  11.56  )
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

TGluayB0aGUgdXNiM19odWJfNXYgcmVndWxhdG9yIHRvIHRoZSBVU0IgY29udHJvbGxlcuKAmXMg
dmJ1cy1zdXBwbHkgdG8KZW5zdXJlIHRoZSBVU0IgMy4wIHN0YWNrIGlzIHByb3Blcmx5IHBvd2Vy
ZWQgYXMgcGVyIHRoZSBzY2hlbWF0aWNzLgpJbiBhZGRpdGlvbiwgYWxpZ24gdGhlIFVTQiBodWIg
cmVndWxhdG9yIHdpdGggdGhlIGJvYXJkIHNjaGVtYXRpY3MKYnkgcmVuYW1pbmcgaXQgdG8gVkND
NVYwX0hVQiBhbmQgbWFya2luZyBpdCBhcyByZWd1bGF0b3ItYWx3YXlzLW9uCnRvIG1haW50YWlu
IHBvd2VyIHN0YWJpbGl0eS4KCkNjOiBIYW4gR2FvIDxnYW9oYW5AaXNjYXMuYWMuY24+CkNjOiBa
ZSBIdWFuZyA8aHVhbmcuemVAbGludXguZGV2PgpDYzogQ2h1a3VuIFBhbiA8YW1hZGV1c0BqbXUu
ZWR1LmNuPgpTaWduZWQtb2ZmLWJ5OiBBbmFuZCBNb29uIDxsaW51eC5hbW9vbkBnbWFpbC5jb20+
Ci0tLQogYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS1iYW5hbmFwaS1mMy5kdHMgfCA0
ICsrKy0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2sxLWJhbmFuYXBpLWYzLmR0
cyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazEtYmFuYW5hcGktZjMuZHRzCmluZGV4
IGMzNWY0NzYzYzgwMC4uM2RiZGY1M2I2ZDhlIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2Jvb3Qv
ZHRzL3NwYWNlbWl0L2sxLWJhbmFuYXBpLWYzLmR0cworKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRz
L3NwYWNlbWl0L2sxLWJhbmFuYXBpLWYzLmR0cwpAQCAtODMsOSArODMsMTAgQEAgcmVnXzV2X3Zi
dXM6IHJlZ3VsYXRvci11c2IzLXZidXMtNXYgewogCiAJdXNiM19odWJfNXY6IHJlZ3VsYXRvci11
c2IzLWh1Yi01diB7CiAJCWNvbXBhdGlibGUgPSAicmVndWxhdG9yLWZpeGVkIjsKLQkJcmVndWxh
dG9yLW5hbWUgPSAiVVNCMzBfSFVCIjsKKwkJcmVndWxhdG9yLW5hbWUgPSAiVkNDNVYwX0hVQiI7
CiAJCXJlZ3VsYXRvci1taW4tbWljcm92b2x0ID0gPDUwMDAwMDA+OwogCQlyZWd1bGF0b3ItbWF4
LW1pY3Jvdm9sdCA9IDw1MDAwMDAwPjsKKwkJcmVndWxhdG9yLWFsd2F5cy1vbjsKIAkJdmluLXN1
cHBseSA9IDwmcmVnX3ZjYzV2MF9zeXM+OwogCQlncGlvID0gPCZncGlvIEsxX0dQSU8oMTIzKSBH
UElPX0FDVElWRV9ISUdIPjsKIAkJZW5hYmxlLWFjdGl2ZS1oaWdoOwpAQCAtMzYxLDYgKzM2Miw3
IEBAICZ1c2JfZHdjMyB7CiAJZHJfbW9kZSA9ICJob3N0IjsKIAkjYWRkcmVzcy1jZWxscyA9IDwx
PjsKIAkjc2l6ZS1jZWxscyA9IDwwPjsKKwl2YnVzLXN1cHBseSA9IDwmdXNiM19odWJfNXY+Owog
CXN0YXR1cyA9ICJva2F5IjsKIAogCWh1Yl8yXzA6IGh1YkAxIHsKLS0gCjIuNTMuMAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
