Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54CDEC47073
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jan 2024 06:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gllyxHhSXRrAuJ2cVu/zld0kqlkfmbsl6A4DkOShMnk=; b=0PgnF6MLCKZKNL
	Yoyil5vUc423Wd1V3Z+evdHVbxiPxGyIpVDzTriTu6L4+kSI0MrI09Tk8dhebHlS3xlpOHIcyujz9
	oqsuvTxjzWEi5MwQxDyNkP34TT7ScOXUakoAt/wJCStzyf/WWAt5pR5bafp5GHUMxFOJbo1Ce+ak5
	wQklf4EWFa3Q3glIwmPSKrAMkKQ8boo8Tht1bD2SBJLjINTG4uYDPNBAD0hkKZnndny8crTxrvqjA
	XaXiyv+gv+SCl19/O41AljIKABmQGZ/L1Y1JUlh4IhVKq2oMMofl0M9zcDDdE1URm60ZRx8KacCM9
	4Chv72EoMjFzohSz6log==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMj1J-0043b6-0S;
	Mon, 08 Jan 2024 06:21:57 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMj1F-0043YR-0O
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jan 2024 06:21:55 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-6dc035ee106so1021200a34.3
        for <linux-riscv@lists.infradead.org>; Sun, 07 Jan 2024 22:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1704694910; x=1705299710; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IgN1RtSHS+JihbyfrF8H+rWapyEwSGcmrp8GqdU1aGQ=;
        b=rMO1aEs/cjZuFmx15+ccGyYjqfpesqy8Mxp4CNy5frdMGwAr7mUvJbyj9zXBMorAwR
         Cp//w1ev9D+amSCj4UXOq7Z212BcztJwmxNAVcMUTeW8OCPnqJ6T9IkMjGlOWsUQspKW
         AMq3+N6ti57J6MJXX+DlLwuHAJrFg279PzWl93pPRYsDQeEKwquwuw+zkxFub8L33IE8
         bOz6QHuoRo44EEjR2hmDDTGYOKmxZQPvKnA4zKsjhr4zcKoQpyeQMkFDKRzUsoHWeE1c
         aYSCSqjFtVbgwPqtl4oKIi629f5MMTAIM6AkCV5VYZus33CNKCTTrU2czeX5gdacQ2mk
         iCww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704694910; x=1705299710;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IgN1RtSHS+JihbyfrF8H+rWapyEwSGcmrp8GqdU1aGQ=;
        b=vdY8rJjuUsYEdaF7HBYcvmiGTN01bNZQk+G1hPqjoL9PGtvAYVKBwMqXqVbh5RJdTw
         TgSjyau2yyVRZ15LhlDNAbU+sOV+fCmREJ6mJj4Ox1GWVBsIokA9+frPidKmsrJDRuan
         qUL2FcxcatY0j2pmCQO82RdyRFL+fchqJlXW9P9iy6socQr0fvILa+BxiS/ZxLiGBghy
         muDY+Mnd7VzdkzNqXOLytUEp65xVGqLpV4lksUkp00BdeIsXbiz+zDZpQSSjYz7/wI8u
         fPpY+jhlMmtEzvIgV+F3QEt+Rs4hsWgae9brBUA4/9/xdHMs6EqwGRqAfDtn2rz5MzJb
         bgTQ==
X-Gm-Message-State: AOJu0Yztw9vcfA8tBHulknTl9Z+fC/EsDA0xHiDjfVMPWO50HOmvGaYF
	NiIAJ9LO1FacX5MNZWurBUMDKlKXZLgcWA==
X-Google-Smtp-Source: AGHT+IHHLM64yXuAJqutSrCtJH9wFIuHVngJMBfn7wJwWMQrh6npPEnqoNbWGGHxcbsCZuTJ7MSZxQ==
X-Received: by 2002:a9d:6558:0:b0:6dc:c4:c97 with SMTP id q24-20020a9d6558000000b006dc00c40c97mr1594886otl.11.1704694910008;
        Sun, 07 Jan 2024 22:21:50 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id i12-20020a9d53cc000000b006dba99e1835sm1274322oth.4.2024.01.07.22.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jan 2024 22:21:49 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v4 0/2] riscv: Create and document
 PR_RISCV_SET_ICACHE_FLUSH_CTX prctl
Date: Sun, 07 Jan 2024 22:21:44 -0800
Message-Id: <20240107-fencei-v4-0-d4cf2fb905d3@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHiUm2UC/23NTQ7CIBCG4as0rMUwQ/905T2Mi0IHOwtbA4Zom
 t5d2mg1xuU34XkZRSDPFMQ+G4WnyIGHPo18kwnbNf2ZJLdpC1SoAaCSjnpLLN3Olaqt6tw1SqT
 HV0+O70voeEq743Ab/GPpRpivrwTiOxFBKmnIqhrAGgQ8eI5D4N5u7XARcyXil9RqlZgkWlOib
 gwYcH+k/kgEvUo9/1kVUNSoazLVj5ym6QletJnOEwEAAA==
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jonathan Corbet <corbet@lwn.net>, Conor Dooley <conor.dooley@microchip.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Atish Patra <atishp@atishpatra.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1704694908; l=1657;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=kIreaapBsnIOgafnWutqHg5bxWxo+ONImq2ZU3lLm5E=;
 b=ei81+ovlZsn5ye8bHDG1IeVHaGGTtLEg4XHJVKc6XwI/8Hr00OB2m23YatRSjeq1jM5jcTeS4
 8vIYF4k9/t2DQEpEQw+fNFyeJBf43MRFboveLsDiG4vGL6Z22QJo4pd
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240107_222153_365092_8F4EBF1F 
X-CRM114-Status: UNSURE (   8.65  )
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

SW1wcm92ZSB0aGUgcGVyZm9ybWFuY2Ugb2YgaWNhY2hlIGZsdXNoaW5nIGJ5IGNyZWF0aW5nIGEg
bmV3IHByY3RsIGZsYWcKUFJfUklTQ1ZfU0VUX0lDQUNIRV9GTFVTSF9DVFguIFRoZSBpbnRlcmZh
Y2UgaXMgbGVmdCBnZW5lcmljIHRvIGFsbG93CmZvciBmdXR1cmUgZXhwYW5zaW9ucyBzdWNoIGFz
IHdpdGggdGhlIHByb3Bvc2VkIEogZXh0ZW5zaW9uIFsxXS4KCkRvY3VtZW50YXRpb24gaXMgYWxz
byBwcm92aWRlZCB0byBleHBsYWluIHRoZSB1c2UgY2FzZS4KClsxXSBodHRwczovL2dpdGh1Yi5j
b20vcmlzY3YvcmlzY3Ytai1leHRlbnNpb24KClNpZ25lZC1vZmYtYnk6IENoYXJsaWUgSmVua2lu
cyA8Y2hhcmxpZUByaXZvc2luYy5jb20+Ci0tLQpDaGFuZ2VzIGluIHY0OgotIEFkZCBPRkYgZmxh
ZyB0byBkaXNhbGxvdyBmZW5jZS5pIGluIHVzZXJzcGFjZSAoQXRpc2gpCi0gRml4IGRvY3VtZW50
YXRpb24gaXNzdWVzIChBdGlzaCkKLSBMaW5rIHRvIHYzOiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9yLzIwMjMxMjEzLWZlbmNlaS12My0wLWI3NTE1ODIzOGViN0ByaXZvc2luYy5jb20KCkNoYW5n
ZXMgaW4gdjM6Ci0gQ2hlY2sgaWYgdmFsdWUgZm9yY2VfaWNhY2hlX2ZsdXNoIHNldCBvbiB0aHJl
YWQsIHJhdGhlciB0aGFuIGluIG1tCiAgdHdpY2UgKENsw6ltZW50KQotIExpbmsgdG8gdjI6IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyMzExMzAtZmVuY2VpLXYyLTAtMmNiNjIzYWIxYjFm
QHJpdm9zaW5jLmNvbQoKQ2hhbmdlcyBpbiB2MjoKLSBGaXgga2VybmVsLWRvYyBjb21tZW50IChD
b25vcikKLSBMaW5rIHRvIHYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjMxMTIyLWZl
bmNlaS12MS0wLWJlYzA4MTFjYjIxMkByaXZvc2luYy5jb20KCi0tLQpDaGFybGllIEplbmtpbnMg
KDIpOgogICAgICByaXNjdjogSW5jbHVkZSByaXNjdl9zZXRfaWNhY2hlX2ZsdXNoX2N0eCBwcmN0
bAogICAgICBkb2N1bWVudGF0aW9uOiBEb2N1bWVudCBQUl9SSVNDVl9TRVRfSUNBQ0hFX0ZMVVNI
X0NUWCBwcmN0bAoKIERvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9jbW9keC5yc3QgfCA4OCArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogRG9jdW1lbnRhdGlvbi9hcmNoL3Jp
c2N2L2luZGV4LnJzdCB8ICAxICsKIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vbW11LmggICAgICAg
fCAgMiArCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oIHwgIDYgKysrCiBhcmNo
L3Jpc2N2L21tL2NhY2hlZmx1c2guYyAgICAgICAgIHwgNTYgKysrKysrKysrKysrKysrKysrKysr
KysrCiBhcmNoL3Jpc2N2L21tL2NvbnRleHQuYyAgICAgICAgICAgIHwgIDggKystLQogaW5jbHVk
ZS91YXBpL2xpbnV4L3ByY3RsLmggICAgICAgICB8ICA0ICsrCiBrZXJuZWwvc3lzLmMgICAgICAg
ICAgICAgICAgICAgICAgIHwgIDYgKysrCiA4IGZpbGVzIGNoYW5nZWQsIDE2OCBpbnNlcnRpb25z
KCspLCAzIGRlbGV0aW9ucygtKQotLS0KYmFzZS1jb21taXQ6IGI4NWVhOTVkMDg2NDcxYWZiNGFk
MDYyMDEyYTRkNzNjZDMyOGZhODYKY2hhbmdlLWlkOiAyMDIzMTExNy1mZW5jZWktZjlmNjBkNzg0
ZmEwCi0tIAotIENoYXJsaWUKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
