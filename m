Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E2AEC02188
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jan 2025 10:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Oi0CmcXzA2f5QngK4GV6PliYk7r4NTTgQb+vrav5BcM=; b=eCU8FcNSWGzbn+
	us5WtMKpM9epn+JpdPOk6NsZ/M2Ms+gX0bMo6xp/0psmxKw7e3Uvzh5EFLVklMq2Iho9GYplnEaGc
	gm9OsF4d2cdb4zMLdUKi5639YxZMopkZqpN8tnTeK12s7y3bf2Vq63zsyDn57jNDP5i0PD6w0jKDL
	eIVtmfL44k4pLwKo2zlnrH9h6aGPLa4YYGVypz7Br33YCOKs+ukaMioYqEQIAO9N62pJRxLWx85v1
	yMccaKhunTd6GI4//F7o++JYqu0iv+SputWfcaOSWJMcDsc79ST8QpZS757RsU8uj6nxXXq6SMR7z
	/uaLhxnzb9PA189I3D5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcMhr-00000002ARF-1nkh;
	Mon, 27 Jan 2025 10:51:03 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcMh5-00000002AQ3-1oTj
	for linux-riscv@lists.infradead.org;
	Mon, 27 Jan 2025 10:50:17 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-385ddcfc97bso3722117f8f.1
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jan 2025 02:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1737975013; x=1738579813; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fuVOZHrwuABxNs35BacCC496I5JiKTElWByt9dcR7l0=;
        b=HQWWHGNLmSbsikGhY7c7S7FFCrnfkkimrh0C7fm3svuIxhLaTs+s1rTKQhBZ6WeLny
         DVeNmUoGXcRpJcZuqJro/nZ6HbJcIqhKec7f7TxtcP+5h8rmG5lAdFA7bUf1rV7PqXNW
         /vm/KRqtWV0cVxNdHvrlpWdCzVO+sWd4UcWEr1GlDam4KqWhyfohWxzjo9zea447gldz
         lRWe4cvD2sT26rbm2hjVxqxo1ez2xHXp50ahxqgzG7nC7mFEFZNo9bUNQwB3Oinl0WXk
         xaOyIb6w3aFvi0rAIUv62T9xpxyw4ZnH7JtQWnXOYsrGD8X6Mlmp+oOuH1ynelqhg+7l
         laRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737975013; x=1738579813;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fuVOZHrwuABxNs35BacCC496I5JiKTElWByt9dcR7l0=;
        b=bVOFiaaHjcK64kjml/GL+zPACvWPCq6GCjzjWZqcBlPajsGPlQNf2sDPkZnQWwooex
         Uyo5ZuRNgL+6wa7msII4sMKGVHSHUfwGdKfzUhOk8InwSYbESsByxqzQ9UxE+s/9Tedp
         YTHGjj+kpVL2aSAJ9Qc5uAq/NTE+FVNpMPRwgtH5mga/GSUrCt3Nkclq3GrnVDwIxFxY
         ZSPSzgpg7trjxA2BJHK4u+7D6+QC6J1Hre4h/a0W2Yg2Xq1wilr2LXt2tdhWodYLMNRH
         kOmFihXdlh8FJusOy6JgfDi7Q39nxPkON5lLBNE3oZRH7zH3yHkfiZICT1Qi5RfUwzBU
         dggA==
X-Forwarded-Encrypted: i=1; AJvYcCVDntssWjljVUlTbFbjjRDkpnbnNPfZriaeuVGi3WyaEKXV5oq/ynzrdJB/dTDxJI8wx2pFBBBUR4WuhA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyjjQWMKQUA/hregQlgLTfrNCVNC/UtbAQ/YO4Tcg0hAybe32gf
	2qrSOAGZ880Lg/xXkEYTOXUxYrRuk7rLOdNKh1yJJptrstYg+x2jJps/76kZ8dI=
X-Gm-Gg: ASbGncvYNyVs3peREqBhFtcMPTppTA+r25AtBsNUM03hAwmtPSgy1PTQ42KE14pU3jd
	YIYyZBQS++3WsL627Zk9WobNVlwDCuPHcAleoFGkWAHfggmyv3PPmUuqxFkurPETY3PH8RSKQ6K
	uvN8sG9f4rNXe6ETE1LFqhoumlQgtq/A9779GbcLUa+y3qMXlB12vdtstbwnSYZVPfqrM9SOi00
	HrBB8A0QxGuYlVE678FJyqa0jjuuSTXjpMJPUWpb5MK8JaykWMjJ7wzUsAfPGV/tL+8YJAe3Rjo
	nLCTOgaW/g==
X-Google-Smtp-Source: AGHT+IF8zXvRud3bxzKoETBM+MMw8ZUW8atexFFnZXnmo/DFoE45mb4c3Y2gv8eCVHkD9pzzKhfOaQ==
X-Received: by 2002:a5d:64e4:0:b0:385:e35e:9da8 with SMTP id ffacd0b85a97d-38bf56635bemr38024984f8f.18.1737975013606;
        Mon, 27 Jan 2025 02:50:13 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a17640csm11104610f8f.18.2025.01.27.02.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 02:50:13 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH] pwm: Strengthen dependency for PWM_SIFIVE
Date: Mon, 27 Jan 2025 11:50:01 +0100
Message-ID: <20250127105001.587610-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1190; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=91Ysoi0XSMFKk2q6OR5ur+zCw8xY07DINvs++TomGyI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnl2TaSzHKHgQt9mbyPx216MqJ/tGg/ldJNcXOf b71p9w9WQ+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ5dk2gAKCRCPgPtYfRL+ TqfJB/9GL+EBEuPmLlcmnUYzKCnqf8cQz+4aS7SYxfMOaIme+UedPpSJx7fguUIMM0VW2rDOq3n al1kAMVFDnMYUllGsC2CeJa2w/WfH2mF/6Kd6dcr0C4sNaN61m8Nn+jrftyPArId8mJOYXdIeGm keHKok25CDntHSM2jONUNlBpoEcxtyo1bJk1QNGU/qlA2iRvs6oRfSuB08HGgkCDB4KqA2YD8be +TqBukzlpYpRYyhqplSDVPHDuG46klk+BD/KGeHaf7uiW3Gr1AFWxGPbQ6rHijmZ9Af1aKYJJrR BKRsRSPYLWcDRc7/UvlqzAcCI+nBUclPhTxb1N46Hc4nrT+m
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_025015_738899_3B01912E 
X-CRM114-Status: GOOD (  12.34  )
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

QmFjayB3aGVuIHRoZSBzaWZpdmUgcHdtIGRyaXZlciB3YXMgYWRkZWQgdGhlcmUgd2FzIG5vIHN5
bWJvbCBmb3Igc2lmaXZlClNvQ3MgeWV0LiBUb2RheSB0aGVyZSBpcyBBUkNIX1NJRklWRSBob3dl
dmVyLiBMZXQgUFdNX1NJRklWRSBkZXBlbmQgb24KdGhhdCB0byBlbnN1cmUgdGhlIGRyaXZlciBp
cyBvbmx5IGJ1aWxkIGZvciBwbGF0Zm9ybXMgd2hlcmUgdGhlcmUgaXMgYQpjaGFuY2UgdGhhdCB0
aGUgaGFyZHdhcmUgaXMgYXZhaWxhYmxlLgoKU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7Zu
aWcgPHUua2xlaW5lLWtvZW5pZ0BiYXlsaWJyZS5jb20+Ci0tLQpIZWxsbywKCmEgcXVpY2sgZ3Jl
cCBzdWdnZXN0cyB0aGF0IHRoZSBkcml2ZXIgaXMgb25seSB1c2VkIG9uIG1hY2hpbmVzIHRoYXQg
aW5jbHVkZQphcmNoL3Jpc2N2L2Jvb3QvZHRzL3NpZml2ZS9mdTU0MC1jMDAwLmR0c2kgb3IKYXJj
aC9yaXNjdi9ib290L2R0cy9zaWZpdmUvZnU3NDAtYzAwMC5kdHNpIGFuZCBmb3IgdGhlc2UgQVJD
SF9TSUZJVkUgaXMKZW5hYmxlZC4gU28gSSdkIGd1ZXNzIHRoaXMgcGF0Y2ggaXMgZmluZS4gU3Rp
bGwgYW4gYWNrIGZyb20gc29tZW9uZSB3aG8Ka25vd3MgdGhpcyBhcmNoIGJldHRlciB3b3VsZCBi
ZSB2ZXJ5IHdlbGNvbWUuCgpCZXN0IHJlZ2FyZHMKVXdlCgogZHJpdmVycy9wd20vS2NvbmZpZyB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvcHdtL0tjb25maWcgYi9kcml2ZXJzL3B3bS9LY29uZmlnCmluZGV4
IDA5MTVjMWU3ZGYxNi4uYmUwZGI3MzAwM2U0IDEwMDY0NAotLS0gYS9kcml2ZXJzL3B3bS9LY29u
ZmlnCisrKyBiL2RyaXZlcnMvcHdtL0tjb25maWcKQEAgLTU2Nyw3ICs1NjcsNyBAQCBjb25maWcg
UFdNX1NJRklWRQogCXRyaXN0YXRlICJTaUZpdmUgUFdNIHN1cHBvcnQiCiAJZGVwZW5kcyBvbiBP
RgogCWRlcGVuZHMgb24gQ09NTU9OX0NMSyAmJiBIQVNfSU9NRU0KLQlkZXBlbmRzIG9uIFJJU0NW
IHx8IENPTVBJTEVfVEVTVAorCWRlcGVuZHMgb24gQVJDSF9TSUZJVkUgfHwgQ09NUElMRV9URVNU
CiAJaGVscAogCSAgR2VuZXJpYyBQV00gZnJhbWV3b3JrIGRyaXZlciBmb3IgU2lGaXZlIFNvQ3Mu
CiAKLS0gCjIuNDcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
