Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02C06C3DA7F
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jul 2024 08:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TjpojyU4mmppddBQ5PDjWSbW9UsBjp+aGiBmYrZcYkI=; b=Ds40x04XvfQlnM
	lARDAkjwi+6VcgftF7di6gVmmkpWv1XDgDzsdP5C9HXppCYXhaBPbLMWY5bEiUQmHqlcskjUC55f7
	KC2e89oPc4QjLyMlK+hQYP18Z6XFXGxamZCb/mgjEIuMaZWTA4oreBnLn6a9bs2IZiQZe4xFx79ok
	p9scO317FDPfzUmXFop/ySXg5HFjmdL0vaZTklR0UQbVOKrD4aRVzUkzD/jqOzg1Nj69Fpy5oMvnL
	TFUuRaUIxgw2fqFyN28yaRe2Wd8gW3CYhRW6UNMMvlyP1zHo+GBaVeGz+Gu5vJ2tQKx+ZJf2cQV6i
	O/R5IZLg+6flqCuTsYcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXGdw-00000003Mug-3BmL;
	Fri, 26 Jul 2024 08:49:40 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXGdt-00000003Mtd-0QKz
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 08:49:39 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-39834949f27so6341795ab.2
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 01:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1721983776; x=1722588576; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7XZtOcVU71qgefN2Ru/3ZszUxxOG8b1uowiT0jlNrFY=;
        b=CQcOhZxnkXS/9v9O+hxBgBxJQ8NkkILI3C2TFvbMv42cxR+55GcUv0FgW4DGdOoCxc
         HZqomPKUi9lUqlCAz436lmcuL2eVqpBv+gvEq8zdLcwZfoxB+om6OwMbqYKriDSouCyD
         w2r2NXHQHohD6YRnig1a6Wt2R3Nr03Ysz+QflDvE9ChiU3Rb25CTF2j6CmvYq03vbHhB
         9Ke/hcuqV2HnhLewB8bfNFpA8GgKGp4wmnk1pkw6FGP9f2Mq4rEHlPwVRbIhbbmV3a6h
         Z50WsSi6M6kGyqh5JBktvQpeRlm7vD+ex4KKZNolSd3n1cmJSB6UQ0cL7gPk0JiJm+L7
         AU8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721983776; x=1722588576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7XZtOcVU71qgefN2Ru/3ZszUxxOG8b1uowiT0jlNrFY=;
        b=HpXXXOT3ofytTTAK/EGlACxjhL6284aO3x/L6TrUN3vT9AnRR0bylcb9D3qfBGRhzF
         h8GkL1SzMawsJsOG5rqYlEADDUHzABpqv97roxg3f+MIS4TAfPEAq3xgyUtzRaprjt0J
         t3sSaNyuHxnQsruIpWoxlWgzE8Ws+U2ZLz6rvXXqcsss/J85zgwBFIghcoda0RTJU8ZH
         eP/pz4xekWFFqwQDPaIh33JNYyMoaOj4Ug54MqyEGlzbvcvzQTFNGuhi0YF0KOBDQoB3
         z3Zybrtj/lSW9e067eBq4YU9HDlWtgv8AQenzpmdfARqGTUnwOVqOjL6Cbnye0Xud8PL
         9lVw==
X-Forwarded-Encrypted: i=1; AJvYcCWVx7TOTALDqtWffc7oymGD4w0DZn2YXqRnCVISnBKgVemhDHxSYYk0aMrhQuVotSLINzHPVH1Kmq6EU9c2K6ba72tUip5ev9ofDUGL7jRr
X-Gm-Message-State: AOJu0YwTaZH0Aekkp7jk41cYQzHe/zPHzEvENrELTlVR/HpeV+CnQEGM
	1IOX05YQHWP9p2NM3rk0raDZupQjz8L0ErjDFeAGWLHijA/129DJOI6U6Fm6kmdt9jkGj+IKPyX
	dNnw=
X-Google-Smtp-Source: AGHT+IGIIC3hug3f1RinXPtTRLJ3e0ZL1wTw+7Nz0b4GXlvTkp9mdYRpo/TwavDaXmzo1aFws3QMLA==
X-Received: by 2002:a05:6e02:1aa1:b0:379:40e0:b0b8 with SMTP id e9e14a558f8ab-39a2185d921mr63531485ab.20.1721983775853;
        Fri, 26 Jul 2024 01:49:35 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7a9f816db18sm2049645a12.33.2024.07.26.01.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 01:49:35 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: greentime.hu@sifive.com,
	vincent.chen@sifive.com,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v8 0/5] Add Svade and Svadu Extensions Support
Date: Fri, 26 Jul 2024 16:49:25 +0800
Message-Id: <20240726084931.28924-1-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240726_014937_350894_A22E4950 
X-CRM114-Status: GOOD (  14.66  )
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

U3ZhZGUgYW5kIFN2YWR1IGV4dGVuc2lvbnMgcmVwcmVzZW50IHR3byBzY2hlbWVzIGZvciBtYW5h
Z2luZyB0aGUgUFRFIEEvRApiaXQuIFdoZW4gdGhlIFBURSBBL0QgYml0cyBuZWVkIHRvIGJlIHNl
dCwgU3ZhZGUgZXh0ZW5zaW9uIGludGRpY2F0ZXMgdGhhdAphIHJlbGF0ZWQgcGFnZSBmYXVsdCB3
aWxsIGJlIHJhaXNlZC4gSW4gY29udHJhc3QsIHRoZSBTdmFkdSBleHRlbnNpb24Kc3VwcG9ydHMg
aGFyZHdhcmUgdXBkYXRpbmcgb2YgUFRFIEEvRCBiaXRzLiBUaGlzIHNlcmllcyBlbmFibGVzIFN2
YWRlIGFuZApTdmFkdSBleHRlbnNpb25zIGZvciBib3RoIGhvc3QgYW5kIGd1ZXN0IE9TLgoKUmVn
cmFkaW5nIHRoZSBtYWlsaW5nIHRocmVhZFsxXSwgd2UgaGF2ZSA0IHBvc3NpYmxlIGNvbWJpbmF0
aW9ucyBvZgp0aGVzZSBleHRlbnNpb25zIGluIHRoZSBkZXZpY2UgdHJlZSwgdGhlIGRlZmF1bHQg
aGFyZHdhcmUgYmVoYXZpb3IgZm9yCnRoZXNlIHBvc3NpYmlsaXRpZXMgYXJlOgoxKSBOZWl0aGVy
IFN2YWRlIG5vciBTdmFkdSBwcmVzZW50IGluIERUID0+IEl0IGlzIHRlY2huaWNhbGx5CiAgIHVu
a25vd24gd2hldGhlciB0aGUgcGxhdGZvcm0gdXNlcyBTdmFkZSBvciBTdmFkdS4gU3VwZXJ2aXNv
cgogICBzb2Z0d2FyZSBzaG91bGQgYmUgcHJlcGFyZWQgdG8gaGFuZGxlIGVpdGhlciBoYXJkd2Fy
ZSB1cGRhdGluZwogICBvZiB0aGUgUFRFIEEvRCBiaXRzIG9yIHBhZ2UgZmF1bHRzIHdoZW4gdGhl
eSBuZWVkIHVwZGF0ZWQuCjIpIE9ubHkgU3ZhZGUgcHJlc2VudCBpbiBEVCA9PiBTdXBlcnZpc29y
IG11c3QgYXNzdW1lIFN2YWRlIHRvIGJlCiAgIGFsd2F5cyBlbmFibGVkLgozKSBPbmx5IFN2YWR1
IHByZXNlbnQgaW4gRFQgPT4gU3VwZXJ2aXNvciBtdXN0IGFzc3VtZSBTdmFkdSB0byBiZQogICBh
bHdheXMgZW5hYmxlZC4KNCkgQm90aCBTdmFkZSBhbmQgU3ZhZHUgcHJlc2VudCBpbiBEVCA9PiBT
dXBlcnZpc29yIG11c3QgYXNzdW1lCiAgIFN2YWR1IHR1cm5lZC1vZmYgYXQgYm9vdCB0aW1lLiBU
byB1c2UgU3ZhZHUsIHN1cGVydmlzb3IgbXVzdAogICBleHBsaWNpdGx5IGVuYWJsZSBpdCB1c2lu
ZyB0aGUgU0JJIEZXRlQgZXh0ZW5zaW9uLgoKVGhlIFN2YWRlIGV4dGVuc2lvbiBpcyBtYW5kYXRv
cnkgYW5kIHRoZSBTdmFkdSBleHRlbnNpb24gaXMgb3B0aW9uYWwgaW4KUlZBMjMgcHJvZmlsZS4g
UGxhdGZvcm1zIHdhbnQgdG8gdGFrZSB0aGUgYWR2YW50YWdlIG9mIFN2YWR1IGNhbiBjaG9vc2UK
My4gVGhvc2UgYXJlIGF3YXJlIG9mIHRoZSBwcm9maWxlIGNhbiBjaG9vc2UgNCwgYW5kIExpbnV4
IHdvbid0IGdldCB0aGUKYmVuZWZpdCBvZiBzdmFkdSB1bnRpbCB0aGUgU0JJIEZXRlQgZXh0ZW5z
aW9uIGlzIGF2YWlsYWJsZS4KClsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1rZXJu
ZWwvMjAyNDA1MjctZTk4NDVjMDY2MTliY2E1Y2QyODUwOThjQG9yZWwvVC8jbTI5NjQ0ZWI4OGUy
NDFlYzI4MmRmNGNjZDUxOTk1MTRlOTEzYjA2ZWUKCi0tLQp2ODoKLSBmaXggdHlwbyBpbiBQQVRD
SDEgKFNhbXVlbCkKLSB1c2UgdGhlIG5ldyBleHRlbnNpb24gdmFsaWRhdGluZyBBUEkgaW4gUEFU
Q0gxIChDbMOpbWVudCkKLSB1cGRhdGUgdGhlIGR0YmluZGluZyBpbiBQQVRDSDIgKFNhbXVlbCwg
Q29ub3IpCi0gYWRkIFBBVENINCB0byBmaXggY29tcGlsZSBlcnJvciBpbiBnZXQtcmVnLWxpc3Qg
dGVzdC4KCnY3OgotIGZpeCBhbGlnbm1lbnQgaW4gUEFUQ0gxCi0gdXBkYXRlIHRoZSBkdGJpbmRp
bmcgaW4gUEFUQ0gyIChDb25vciwgSmVzc2ljYSkKCnY2OgotIHJlZmxlY3QgdGhlIHBsYXRmb3Jt
J3MgYmVoYXZpb3IgYnkgcmlzY3ZfaXNhX2V4dGVuc2lvbl9hdmFpbGFibGUoKSBhbmQKICB1cGRh
dGUgdGhlIHRoZSBhcmNoX2hhc19od19wdGVfeW91bmcoKSBpbiBQQVRDSDEgKENvbm9yLCBBbmRy
ZXcpCi0gdXBkYXRlIHRoZSBkdGJpbmRpbmcgaW4gUEFUQ0gyIChBbGV4YW5kcmUsIEFuZHJldywg
QW51cCwgQ29ub3IpCi0gdXBkYXRlIHRoZSBoZW52Y2ZnIGNvbmRpdGlvbiBpbiBQQVRDSDMgKEFu
ZHJldykKLSBjaGVjayBpZiBTdmFkZSBpcyBhbGxvd2VkIHRvIGRpc2FibGVkIGJhc2VkIG9uIGFy
Y2hfaGFzX2h3X3B0ZV95b3VuZygpCiAgaW4gUEFUQ0gzCgp2NToKLSByZW1vdmUgYWxsIEFja2Vk
LWJ5IGFuZCBSZXZpZXdlZC1ieSAoQ29ub3IsIEFuZHJldykKLSBhZGQgU3ZhZGUgc3VwcG9ydAot
IHVwZGF0ZSB0aGUgYXJjaF9oYXNfaHdfcHRlX3lvdW5nKCkgaW4gUEFUQ0gxCi0gdXBkYXRlIHRo
ZSBkdGJpbmRpbmcgaW4gUEFUQ0gyIChBbGV4YW5kcmUsIEFuZHJldykKLSBjaGVjayB0aGUgYXZh
aWxpYmlsaXR5IG9mIFN2YWR1IGZvciBHdWVzdC9WTSBiYXNlZCBvbgogIGFyY2hfaGFzX2h3X3B0
ZV95b3VuZygpIGluIFBBVENIMwoKdjQ6Ci0gZml4IDMyYml0IGtlcm5lbCBidWlsZCBlcnJvciBp
biBQQVRDSDEgKENvbm9yKQotIHVwZGF0ZSB0aGUgc3RhdHVzIG9mIFN2YWR1IGV4dGVuc2lvbiB0
byByYXRpZmllZCBpbiBQQVRDSDIKLSBhZGQgdGhlIFBBVENINCB0byBzdXBvcnJ0IFNCSV9GV0ZU
X1BURV9BRF9IV19VUERBVElORyBmb3IgZ3Vlc3QgT1MKLSB1cGRhdGUgdGhlIFBBVENIMSBhbmQg
UEFUQ0gzIHRvIGludGVncmF0ZSB3aXRoIEZXRlQgZXh0ZW5zaW9uCi0gcmViYXNlIFBBVENINSBv
biB0aGUgbGFzdGVzdCBnZXQtcmVnLWxpc3QgdGVzdCAoQW5kcmV3KQoKdjM6Ci0gZml4IHRoZSBj
b250cm9sIGJpdCBuYW1lIHRvIEFEVUUgaW4gUEFUQ0gxIGFuZCBQQVRDSDMKLSB1cGRhdGUgZ2V0
LXJlZy1saXN0IGluIFBBVENINAoKdjI6Ci0gYWRkIENvLWRldmVsb3BlZC1ieTogaW4gUEFUQ0gx
Ci0gdXNlIHJpc2N2X2hhc19leHRlbnNpb25fdW5saWtlbHkoKSB0byBydW50aW1lIHBhdGNoIHRo
ZSBicmFuY2ggaW4gUEFUQ0gxCi0gdXBkYXRlIGR0LWJpbmRpbmcKCllvbmctWHVhbiBXYW5nICg1
KToKICBSSVNDLVY6IEFkZCBTdmFkZSBhbmQgU3ZhZHUgRXh0ZW5zaW9ucyBTdXBwb3J0CiAgZHQt
YmluZGluZ3M6IHJpc2N2OiBBZGQgU3ZhZGUgYW5kIFN2YWR1IEVudHJpZXMKICBSSVNDLVY6IEtW
TTogQWRkIFN2YWRlIGFuZCBTdmFkdSBFeHRlbnNpb25zIFN1cHBvcnQgZm9yIEd1ZXN0L1ZNCiAg
S1ZNOiByaXNjdjogc2VsZnRlc3RzOiBGaXggY29tcGlsZSBlcnJvcgogIEtWTTogcmlzY3Y6IHNl
bGZ0ZXN0czogQWRkIFN2YWRlIGFuZCBTdmFkdSBFeHRlbnNpb24gdG8gZ2V0LXJlZy1saXN0CiAg
ICB0ZXN0CgogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sIHwg
MjggKysrKysrKysrKysrKysrKysrKwogYXJjaC9yaXNjdi9LY29uZmlnICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgIDEgKwogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaCAgICAgICAg
ICAgICAgICAgIHwgIDEgKwogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oICAgICAgICAg
ICAgICAgIHwgIDIgKysKIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oICAgICAgICAg
ICAgICB8IDEzICsrKysrKysrLQogYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oICAg
ICAgICAgICAgIHwgIDIgKysKIGFyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyAgICAgICAg
ICAgICAgICB8IDEyICsrKysrKysrCiBhcmNoL3Jpc2N2L2t2bS92Y3B1LmMgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgNCArKysKIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfb25lcmVnLmMgICAgICAg
ICAgICAgICAgICB8IDE1ICsrKysrKysrKysKIC4uLi9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dldC1y
ZWctbGlzdC5jICAgICAgICB8IDE2ICsrKysrKysrLS0tCiAxMCBmaWxlcyBjaGFuZ2VkLCA4OSBp
bnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
