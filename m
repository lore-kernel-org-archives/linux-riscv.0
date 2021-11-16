Return-Path: <SRS0=z0LS=QD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 253B4C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 00:53:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD68861B3B
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 00:53:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DD68861B3B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P5bWKTl+ZXjDFMLxUf2uDSZW0/uS0OWAykX35iozhFs=; b=Hm2n/eRpATO2+z
	QcTLQYEm0WKAh92XqSG8rHZux8JHb+OmrEqOVGCtk/VTsH5Rxbh8VG8vwKydBWsQh/QhLWHE1thMo
	J/pEHLKG463WhhDt4B2WFs95isUXy0VijEYTt5SUVVdc6H292bdtkgKAtYT+r3IvxmGtXueCK1f0S
	WfgmTXZWhm5NTSCIQAlZvh9PinwM8G22B6kJ3uSa5QMQkdj4TPAxu/xJn0hjx2XxT+kKPMnLGkepG
	/UzDLk/hi6yZgOaSH1CIPq0mmkPnDJ9eKGEqkhNqigbgqzGUQ5AhzjIgtJocoRUqHfK1+p1qFVd4A
	sNo1JDn/fxEWyT7b3AUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmmj2-00HTwt-5b; Tue, 16 Nov 2021 00:53:28 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmmik-00HTrN-KP
 for linux-riscv@lists.infradead.org; Tue, 16 Nov 2021 00:53:13 +0000
Received: by mail-pl1-x62a.google.com with SMTP id o14so15926943plg.5
 for <linux-riscv@lists.infradead.org>; Mon, 15 Nov 2021 16:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=aZ5tXp1sMvrUv561doAiiCqmD/rNuSSbtkKz5FumcyA=;
 b=Fokzzr5kW5aWUlaCTKfzgxiKq8Sz0JJNct2dPr95icW0vsZJtaR2EFMTnO1oVDfMOq
 Lz6JGgFasUyOruecRwq5Aml0eaiTTg2hnH8ICBGuMMPr777ZnKVxIVX5IvluwbuK+Rxh
 IsN8tYvUeOJ/6U6qlHZicvs0HDoYKEcXWRmbJRZCLUI/NSUB23Le+8IpMm1BnErovhx0
 /LQuVgCI0ouIkBrtJacuCHdWWHdWgKrQCegBDrITIPL4TLXT0NkMQRmFyoWkFbcwxX37
 thogFTUiBYPEvVKPH9yj+GjkpWVutq8FxhlU8Uua6imHeqE6Fadf2rf4Rz5xTfSBxRVx
 MKQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aZ5tXp1sMvrUv561doAiiCqmD/rNuSSbtkKz5FumcyA=;
 b=NhzTi5ifYt91qYWWC9HIVjAHKOLYBXFPfTeN3sklthiSqKF+fIs+yoCVR/spWF/et7
 SJNPTehpBA7ud0R21kqJfw29YHH8Ym/ylChSDtkpA1jcKcy/dWSvWdAF9NXnyMWnCf2Z
 Z6HyHY9Hv4JUh9FG+uc60/h3wRV/B9dS6orW/98e228X4kfK5svEUDQ582pGWrFyFJJc
 NtX8y3qSzk6JRijF1W3kst2TuFKbxMgWzq6VFhKiPwpiYSjX5HCzhgTwtibnhNOWjegs
 wwu2tvreU+bMa4+J9Hk9jX/KBaTzd7+87BDvkqzQnPjY7yUReRZzF/7ZPgsnIeV+dfGu
 53AQ==
X-Gm-Message-State: AOAM530+f5jqqXifDbffqkvp4y3jaHwg68aErfO/g5FYSpr36WCoPCPa
 YhoO16EMlJSv9E9dz+iYh4Y=
X-Google-Smtp-Source: ABdhPJyigJGV07hysM698lYSq2/gFNLDQaOt6dLD9KS7jPLXXnrmHTdY0gRp1kmucLGbfl6j1VlUpA==
X-Received: by 2002:a17:90a:1b45:: with SMTP id
 q63mr70178224pjq.135.1637023986396; 
 Mon, 15 Nov 2021 16:53:06 -0800 (PST)
Received: from localhost.lan ([2400:4070:175b:7500::7a7])
 by smtp.gmail.com with ESMTPSA id b22sm12780502pge.2.2021.11.15.16.53.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 16:53:05 -0800 (PST)
Received: from x2.lan (localhost [127.0.0.1])
 by localhost.lan (Postfix) with ESMTPSA id 7D2D4900958;
 Tue, 16 Nov 2021 00:53:03 +0000 (GMT)
From: Vincent Pelletier <plr.vincent@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Qiu Wenbo <qiuwenbo@kylinos.com.cn>, Yash Shah <yash.shah@sifive.com>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 David Abdurachmanov <david.abdurachmanov@sifive.com>
Subject: [PATCH] riscv: dts: sifive unmatched: Expose the FU740 core supply
 regulator.
Date: Tue, 16 Nov 2021 00:52:59 +0000
Message-Id: <0879c5b0c72b9bf6bf71f880def166f8804f41c7.1637023980.git.plr.vincent@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <f6512cc50dc31a086e00ed59c63ea60d8c148fc4.1637023980.git.plr.vincent@gmail.com>
References: <f6512cc50dc31a086e00ed59c63ea60d8c148fc4.1637023980.git.plr.vincent@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_165310_695109_D71DBEF2 
X-CRM114-Status: GOOD (  12.62  )
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

UHJvdmlkZXMgbW9uaXRvcmluZyBvZiBjb3JlIHZvbHRhZ2UgYW5kIGN1cnJlbnQ6CnRwczU0NGIy
MC1pMmMtMC0xZQpBZGFwdGVyOiBpMmMtb2NvcmVzCnZvdXQxOiAgICAgICA5MDYuMDAgbVYKdGVt
cDE6ICAgICAgICAtNDAuMMKwQyAgKGhpZ2ggPSArMTI1LjDCsEMsIGNyaXQgPSArMTUwLjDCsEMp
CmlvdXQxOiAgICAgICAgIDUuMDYgQSAgKG1heCA9ICsyMC4wMCBBLCBjcml0IG1heCA9ICsyNi4w
MCBBKQoKU2lnbmVkLW9mZi1ieTogVmluY2VudCBQZWxsZXRpZXIgPHBsci52aW5jZW50QGdtYWls
LmNvbT4KCi0tCk5vdGUgZm9yIHJldmlldzogdGhpcyBwYXRjaCBoYXMgb25lIHdhcm5pbmcgZnJv
bSBjaGVja3BhdGNoLnBsOgogIFdBUk5JTkc6IERUIGNvbXBhdGlibGUgc3RyaW5nICJ0cHM1NDRi
MjAiIGFwcGVhcnMgdW4tZG9jdW1lbnRlZCAtLSBjaGVjayAuL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy8KICAjMzI6IEZJTEU6IGFyY2gvcmlzY3YvYm9vdC9kdHMvc2lmaXZlL2hp
Zml2ZS11bm1hdGNoZWQtYTAwLmR0czo1NToKICArICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9
ICJ0cHM1NDRiMjAiOwpUaGlzIGNoaXAgaXMgaGFuZGxlZCBieSB0aGUgZXhpc3RpbmcgcG1idXMg
bW9kdWxlLCBhbmQgdGhlcmUgaXMgaW5kZWVkIG5vCm1hdGNoaW5nIGVudHJ5IGluIERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9od21vbi9wbWJ1cy4gSSBhbSBub3QKZXNwZWNpYWxs
eSBrbm93bGVkZ2VhYmxlIGFib3V0IHRoaXMgY2hpcCwgSSBvbmx5IGtub3cgaXQgaXMgdXNlZCBi
eSB0aGlzCmJvYXJkLCBzbyBJIGFtIG5vdCBzdXJlIEkgY2FuIGRvIHRoZSBiZXN0IGpvYiBpbiBw
dXR0aW5nIHN1Y2ggYSBmaWxlCnRvZ2V0aGVyLgpJZiBuZWVkZWQgSSBjYW4gZ2l0IGl0IGEgdHJ5
LgotLS0KIGFyY2gvcmlzY3YvYm9vdC9kdHMvc2lmaXZlL2hpZml2ZS11bm1hdGNoZWQtYTAwLmR0
cyB8IDUgKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NpZml2ZS9oaWZpdmUtdW5tYXRjaGVkLWEwMC5kdHMgYi9h
cmNoL3Jpc2N2L2Jvb3QvZHRzL3NpZml2ZS9oaWZpdmUtdW5tYXRjaGVkLWEwMC5kdHMKaW5kZXgg
MjcwMzYwYjI1OGI3Li5lMzI3ODMxZDBkNDggMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvYm9vdC9k
dHMvc2lmaXZlL2hpZml2ZS11bm1hdGNoZWQtYTAwLmR0cworKysgYi9hcmNoL3Jpc2N2L2Jvb3Qv
ZHRzL3NpZml2ZS9oaWZpdmUtdW5tYXRjaGVkLWEwMC5kdHMKQEAgLTUxLDYgKzUxLDExIEBAICZ1
YXJ0MSB7CiAmaTJjMCB7CiAJc3RhdHVzID0gIm9rYXkiOwogCisJdHBzNTQ0YjIwQDFlIHsKKwkJ
Y29tcGF0aWJsZSA9ICJ0cHM1NDRiMjAiOworCQlyZWcgPSA8MHgxZT47CisJfTsKKwogCXRlbXBl
cmF0dXJlLXNlbnNvckA0YyB7CiAJCWNvbXBhdGlibGUgPSAidGksdG1wNDUxIjsKIAkJcmVnID0g
PDB4NGM+OwotLSAKMi4zMy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
