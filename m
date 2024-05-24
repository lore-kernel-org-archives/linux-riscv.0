Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 004E5C25B74
	for <linux-riscv@archiver.kernel.org>; Fri, 24 May 2024 10:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FyL1MAN7/lOKLjm5iVobIqOdGbVi49pyBSuYi9sN4zM=; b=qU8ofVBeSN/Rck
	lndmswzaaHN5fU0lhDpAPctL6Rrf3sghCavjqi00tGDLMF6q2j2zn4F8ep2CInI1Lcx4CIGMqMfKE
	OZqkOXvfK82Q+NqW6PevnaKkwZtUujTk0HLzDPzTrRBqwe8oXRN+0UypcxuFbiB0L+2yz2n5M6m7k
	ujKajKHpGo7CFA2EKfbEdvkhXNsm1iMoBmi8RFGvxq1Tv7jzn4UAe9b3qDMbZbwrkIsSzX1+KYO7V
	JMfgubgQDm+wVeWRxIyJY2EBT5DK2Ug95OXXnJdF9vSAUdyf/OEAFVOOn2TckNOf3jIICb/2GyzWY
	ZMo6FRrBj77Zin0+beiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sASEe-00000008fyI-2XmM;
	Fri, 24 May 2024 10:33:16 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sASEc-00000008fxD-0MvL
	for linux-riscv@lists.infradead.org;
	Fri, 24 May 2024 10:33:15 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1f3310a21d8so19389615ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 24 May 2024 03:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1716546793; x=1717151593; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o5+OeJiNJH/1PCnl6kf4yooZjPqVSPQ1EmI9g6Y0DgE=;
        b=K0KqVfjksYAqwJEqWnunMb4SBgI2hpeVSspnlau41tDJDLLKRENO71hI6gcy9RwZPs
         ymxSujKYCHDCih09BkJWtPbGYqulPh4D9YdP9U12eyIoJruStScl3OTdTyfwALnDclYU
         Sr/N4fBaaYMlieDzVRkU05GVma6S5iIk8RuM7SeagLGXXRfr/YpsAz0AGRQoUI9hzGvc
         1NYqNn+/w/y/EixpujN8RSIakrESFmNusmiXt9PICBsCYO1C8kP4yJTRNIMhT9yk2OB7
         oGNqagyKr7spxvIs8oXdJJRiXB6ujfMGWnerAmXDHxnq+u24gazcp38C+PWBRUwPEzHd
         y+rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716546793; x=1717151593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o5+OeJiNJH/1PCnl6kf4yooZjPqVSPQ1EmI9g6Y0DgE=;
        b=U66BnEXSMhTUUPy6wIZ1lWrTDuDqPodTr6faXdGFV98FH5C1ntnNbFZTIN8/BHLwAS
         HS6u8SzC8MFlfUFdSvl/NhVyzep0KlRBCTaQxpVXrB2/ggVAsERAGJ3ird/lJnZWq6zd
         zc3//08pmej4kOlJdAGkSm48cw6YZ9wN9jOqt76CTTgvCPoJ2w6Ki9VRlPaTfr7eLF2c
         W3nYZ3flttclW7p7GTlSLMxtGwZEFTBb8iEqBe6PYMXD+L/7+tDQYJuXQsOE5FSoWnQ4
         nm7dQ0RzKtXBA9tjgdSalgfRlPdNdfiW7VbJV8Q983G1NyHJunFxeHHt5Wxd/J37QYfq
         bf5g==
X-Gm-Message-State: AOJu0Yyg1ZEg7qJtfvNyxDpN5cqj7pZFTV6GNNDpZ1BD5O6bTGl2nCgJ
	Kbslhm99khc1VnQByIPI3WaUGuttTZnQwXqm4dXw8iGMa4jvPixn4nqBK/iRLaYsAQEpOZflI23
	mgvJZBWHDWzw6r5KkMp8xj0ao2v6380OY7bvXgBGO7wNoxGNYayjJaWl/SioTM7R4CV/TB+uojv
	wRN4bcXS0B94f2aPt+wGSZ/VT1T+XSKehfWVGMTVtVg+yjmXe6IjxX6Bw=
X-Google-Smtp-Source: AGHT+IE9eMxclG0+cNauzYQWG6YBPxa+DJVJBSIOCovX2C8vK9iNEwX0H6Fyj7KryEFR0rIeUI/J9g==
X-Received: by 2002:a17:902:d583:b0:1e4:6938:6fe3 with SMTP id d9443c01a7336-1f4497e5b89mr24702995ad.58.1716546792557;
        Fri, 24 May 2024 03:33:12 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c756996sm10936625ad.8.2024.05.24.03.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 03:33:12 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: greentime.hu@sifive.com,
	vincent.chen@sifive.com,
	cleger@rivosinc.com,
	alex@ghiti.fr,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [RFC PATCH v4 0/5] Add Svadu Extension Support
Date: Fri, 24 May 2024 18:33:00 +0800
Message-Id: <20240524103307.2684-1-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240524_033314_160674_8133CD66 
X-CRM114-Status: GOOD (  11.82  )
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

U3ZhZHUgaXMgYSBSSVNDLVYgZXh0ZW5zaW9uIGZvciBoYXJkd2FyZSB1cGRhdGluZyBvZiBQVEUg
QS9EIGJpdHMuIFRoaXMKcGF0Y2ggc2V0IGFkZHMgc3VwcG9ydCB0byBlbmFibGUgU3ZhZHUgZXh0
ZW5zaW9uIGZvciBib3RoIGhvc3QgYW5kIGd1ZXN0Ck9TLgoKRm9yIGJhY2t3YXJkLWNvbXBhdGli
aWxpdHksIFN2YWR1IGV4dGVuc2lvbiBzaG91bGQgYmUgZW5hYmxlZCB0aHJvdWdoIHRoZQpTQkkg
RldGVCBleHRlbnNpb24uIFRoaXMgcGF0Y2hzZXQgaXMgYmFzZWQgb24gdGhlIExpbnV4IGltcGxl
bWVudGF0aW9uIG9mCkZXRlQgZXh0ZW5zaW9uIGJyYW5jaCBieSBDbMOpbWVudCBMw6lnZXIgWzFd
LCBhbmQgY2FuIGJlIHZlcmlmaWVkIHdpdGggdGhlCk9wZW5TQkkgRldGVCBwYXRjaHNldCBbMl0u
CgpbMV0gaHR0cHM6Ly9naXRodWIuY29tL3Jpdm9zaW5jL2xpbnV4L2NvbW1pdHMvZGV2L2NsZWdl
ci9md2Z0LwpbMl0gaHR0cHM6Ly9saXN0cy5pbmZyYWRlYWQub3JnL3BpcGVybWFpbC9vcGVuc2Jp
LzIwMjQtTWF5LzAwNjkyNy5odG1sCgotLS0KdjQ6Ci0gZml4IDMyYml0IGtlcm5lbCBidWlsZCBl
cnJvciBpbiBQQVRDSDEgKENvbm9yKQotIHVwZGF0ZSB0aGUgc3RhdHVzIG9mIFN2YWR1IGV4dGVu
c2lvbiB0byByYXRpZmllZCBpbiBQQVRDSDIKLSBhZGQgdGhlIFBBVENINCB0byBzdXBvcnJ0IFNC
SV9GV0ZUX1BURV9BRF9IV19VUERBVElORyBmb3IgZ3Vlc3QgT1MKLSB1cGRhdGUgdGhlIFBBVENI
MSBhbmQgUEFUQ0gzIHRvIGludGVncmF0ZSB3aXRoIEZXRlQgZXh0ZW5zaW9uCi0gcmViYXNlIFBB
VENINSBvbiB0aGUgbGFzdGVzdCBnZXQtcmVnLWxpc3QgdGVzdCAoQW5kcmV3KQoKdjM6Ci0gZml4
IHRoZSBjb250cm9sIGJpdCBuYW1lIHRvIEFEVUUgaW4gUEFUQ0gxIGFuZCBQQVRDSDMKLSB1cGRh
dGUgZ2V0LXJlZy1saXN0IGluIFBBVENINAoKdjI6Ci0gYWRkIENvLWRldmVsb3BlZC1ieTogaW4g
UEFUQ0gxCi0gdXNlIHJpc2N2X2hhc19leHRlbnNpb25fdW5saWtlbHkoKSB0byBydW50aW1lIHBh
dGNoIHRoZSBicmFuY2ggaW4gUEFUQ0gxCi0gdXBkYXRlIGR0LWJpbmRpbmcKCllvbmctWHVhbiBX
YW5nICg1KToKICBSSVNDLVY6IERldGVjdCBhbmQgRW5hYmxlIFN2YWR1IEV4dGVuc2lvbiBTdXBw
b3J0CiAgZHQtYmluZGluZ3M6IHJpc2N2OiBBZGQgU3ZhZHUgRW50cnkKICBSSVNDLVY6IEtWTTog
QWRkIFN2YWR1IEV4dGVuc2lvbiBTdXBwb3J0IGZvciBHdWVzdC9WTQogIFJJU0MtVjogS1ZNOiBh
ZGQgc3VwcG9ydCBmb3IgU0JJX0ZXRlRfUFRFX0FEX0hXX1VQREFUSU5HCiAgS1ZNOiByaXNjdjog
c2VsZnRlc3RzOiBBZGQgU3ZhZHUgRXh0ZW5zaW9uIHRvIGdldC1yZWctbGlzdCB0ZXN0dAoKIC4u
Li9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbCB8ICA2ICsrKwogYXJj
aC9yaXNjdi9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwogYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9jc3IuaCAgICAgICAgICAgICAgICAgIHwgIDEgKwogYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9od2NhcC5oICAgICAgICAgICAgICAgIHwgIDEgKwogYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9rdm1fdmNwdV9zYmlfZndmdC5oICAgIHwgIDIgKy0KIGFyY2gvcmlzY3YvaW5j
bHVkZS9hc20vcGd0YWJsZS5oICAgICAgICAgICAgICB8ICA4ICsrKy0KIGFyY2gvcmlzY3YvaW5j
bHVkZS91YXBpL2FzbS9rdm0uaCAgICAgICAgICAgICB8ICAxICsKIGFyY2gvcmlzY3Yva2VybmVs
L2NwdWZlYXR1cmUuYyAgICAgICAgICAgICAgICB8IDExICsrKysrKwogYXJjaC9yaXNjdi9rdm0v
dmNwdV9vbmVyZWcuYyAgICAgICAgICAgICAgICAgIHwgIDEgKwogYXJjaC9yaXNjdi9rdm0vdmNw
dV9zYmlfZndmdC5jICAgICAgICAgICAgICAgIHwgMzggKysrKysrKysrKysrKysrKysrLQogLi4u
L3NlbGZ0ZXN0cy9rdm0vcmlzY3YvZ2V0LXJlZy1saXN0LmMgICAgICAgIHwgIDQgKysKIDExIGZp
bGVzIGNoYW5nZWQsIDcxIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgotLSAKMi4xNy4x
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
