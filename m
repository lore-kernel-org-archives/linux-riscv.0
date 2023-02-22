Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B97C6379F
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Feb 2023 10:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Os2Qd0Tfm+pRYRiexSnXAtV6GWddqush4tRp1gsdUc0=; b=XQogQAMFcCf+yY
	Ygd0GY/J7R1ctYuntl6ECjC8R5929JuV2WSFJ+j1ZUz7/zGaxbTf3zm6sI8a593TJ2tDNKVIb3Lko
	B7Lu4Q6/WjtbTJ0IIGMUmMEj2XvO2cMQyV3ONj872NIKtlGwp73HP1O5TS9Ntx/bnkbe/Oq/tYvM5
	xLD7exRg/jZ8zk9V7lpyewFCkg1C2uIcsW2PPb3HmQeU1oROCVRwY406CyZAnj/1u94pMLcvimRiO
	eXGmMKwkkSiire7Z+tZOxI5xe9Xae3OhpV+mcOb6drcAm4qm8iY23MNq9qVGf4j/jrtbGiFiYytTM
	vwABaBHJ4n7k7+EjVMnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUmaz-00C2KC-TL; Wed, 22 Feb 2023 10:43:33 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUmau-00C2Hh-O4
	for linux-riscv@lists.infradead.org; Wed, 22 Feb 2023 10:43:30 +0000
Received: by mail-wr1-x430.google.com with SMTP id c12so7253264wrw.1
        for <linux-riscv@lists.infradead.org>; Wed, 22 Feb 2023 02:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UhT58sinHFct4qgunNLg5u/XIFyEJ64KsH0nJ4Jq3VI=;
        b=E3mhp2S/pYriP6lLsQo4TfjWLohTGpgIU2xyChC0o8I7Tvs9Rzs1Z2ECShnsif5isZ
         p8yChvV92xDtZrlY6vOpN1bUKw2fg4krL8iebjbD5mSa97vZcPEDq/Gy+M1o9i+88SEl
         qAvCVJb9D0ey+keKZvwPX3JohXCzLuP34j9S1EyaVYHw8BlfgaA9yIyBF0V/HtrkVxvV
         VDqzl34G0c5PRTA9qkXd4fhFKeyM7i+ApRiewpCnFSQsabhnbuw9N8O+u6+VxYZowzM3
         J+t+KVVw1GQKpgWT0E/fmfCu3dxn0qqjjYTHIO3WE5+b3P+Z9xxkKJjOJhMHEj71F8WW
         QOiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UhT58sinHFct4qgunNLg5u/XIFyEJ64KsH0nJ4Jq3VI=;
        b=50qA0nTwh/9RW4MQBxbyrmjsJD8zVk6K5bMFXe+q9aVihRKusdIJxGdMUHVMAm5VNX
         J5qqDdJjq/d/ZREAquVrpspjpZF0qie08ruVd3QaqureKGnsOq32/lAptAnIfLA+s9bc
         D9R3eXB5lA9a/RoEZcBssDlhvjzgnt+WkbJYxp2Sf9WeIZKnP4QbOomG6zD7rLj+JqAZ
         bFfNWnK/CLANT7h6FIGtgv3MP8OmOW4EAlgrfsdfOvzghG0fDOXWGgP1+090cqMfhbiF
         Vdd6MnoxIsxSgKTPGe8S0J7Mh6kcQ599rb7+83KwOyLGLfEpGvbvFpJs/YLH2EufacRB
         XDXg==
X-Gm-Message-State: AO0yUKUdVPpLd6bk4hBUd99i2TuCE/hM2U4j2uyLJ5YnNDVXOennVyqI
	+OhphBL5jwwQ6N6+Ons2aNH0ZA==
X-Google-Smtp-Source: AK7set97crFvqEY9KymyVgzh9ZbKxig7GJ92PiQcr3HEodbwNfUwX5oCC7Jv573SDTcXPhgm66t+IQ==
X-Received: by 2002:adf:ea88:0:b0:2c5:5a65:79a0 with SMTP id s8-20020adfea88000000b002c55a6579a0mr4953341wrm.53.1677062606035;
        Wed, 22 Feb 2023 02:43:26 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (lfbn-gre-1-235-32.w90-112.abo.wanadoo.fr. [90.112.194.32])
        by smtp.gmail.com with ESMTPSA id u9-20020a5d5149000000b002c550eb062fsm5798294wrt.14.2023.02.22.02.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 02:43:25 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v5 0/1] riscv: Allow to downgrade paging mode from the command line
Date: Wed, 22 Feb 2023 11:43:21 +0100
Message-Id: <20230222104322.1197763-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_024329_003904_6315EA06 
X-CRM114-Status: GOOD (  13.90  )
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

VGhpcyBuZXcgdmVyc2lvbiBnZXRzIHJpZCBvZiB0aGUgbGltaXRhdGlvbiB0aGF0IHByZXZlbnRl
ZCBLQVNBTiBrZXJuZWxzICAgICAgICAgCnRvIHVzZSB0aGUgbmV3bHkgaW50cm9kdWNlZCBwYXJh
bWV0ZXJzLiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAKV2hpbGUgbG9va2luZyBpbnRvIEtBU0xSLCBJIGZlbGwgb250byBj
b21taXQgYWFjZDE0OWI2MjM4ICgiYXJtNjQ6IGhlYWQ6ICAgICAgICAgCmF2b2lkIHJlbG9jYXRp
bmcgdGhlIGtlcm5lbCB0d2ljZSBmb3IgS0FTTFIiKTogaXQgYWxsb3dzIHRvIHVzZSB0aGUgZmR0
ICAgICAgICAgIApmdW5jdGlvbnMgdmVyeSBlYXJseSBpbiB0aGUgYm9vdCBwcm9jZXNzIHdpdGgg
S0FTQU4gZW5hYmxlZCBieSBzaW1wbHkgICAgICAgICAgICAKY29tcGlsaW5nIGEgbmV3IHZlcnNp
b24gb2YgdGhvc2UgZnVuY3Rpb25zIHdpdGhvdXQgaW5zdHJ1bWVudGF0aW9uLiAgICAgICAgICAg
ICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIApJIGhhZCB0byBjaGFuZ2UgdGhlIGhhbmRsaW5n
IG9mIHRoZSBjb21tYW5kIGxpbmUgcGFyc2luZyB0byBtYWtlIHRoZSAgICAgICAgICAgICAKY29k
ZSBzZWxmLWNvbnRhaW5lZCBpbiBrZXJuZWwvcGkvY21kX2Vhcmx5LmMgdG8gYXZvaWQgY2FsbGlu
ZyB0b28gbWFueSAgICAgICAgICAgCl9fcGkgcHJlZml4ZWQgZnVuY3Rpb25zIGZyb20gb3V0c2lk
ZSB0aGlzIGZpbGUuICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAKSSdsbCB1c2UgdGhpcyBhcHByb2FjaCBsaWtlIGFybTY0IHRvIGhhbmRs
ZSB0aGUgZXh0cmFjdGlvbiBvZiB0aGUgcmFuZG9tICAgICAgICAgCnNlZWRpIGZyb20gdGhlIGRl
dmljZSB0cmVlIGZvciBLQVNMUi4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKYmFzZS1jb21taXQtdGFnOiB2Ni4yLXJj
NwoKdjU6ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgCi0gSGFuZGxlIG51bGwgY29tbWFuZCBsaW5lLCBU
aGFua3MgQmrDtnJuISAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKLSBB
ZGQgUkIvVEIgZnJvbSBCasO2cm4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKdjQ6ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgCi0gSW50cm9kdWNlIHBpLyBmb3IgS0FTQU4gdG8gd29yayAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAKdjM6ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCi0gTWFzc2FnZSBjb21taXQgbG9nIHRv
IG1ha2Ugbm80bHZsIGNsZWFyZXIsIGFzIGFza2VkIGJ5IENvbm9yICAgICAgICAgICAgICAgICAg
IAotIEFkZCBhIG5vdGUgdG8ga2VybmVsLXBhcmFtZXRlcnMudHh0IHJlZ2FyZGluZyB0aGUgaW1w
b3NzaWJpbGl0eSB0byB1c2UgICAgICAgICAKICB0aG9zZSBwYXJhbWV0ZXJzIHdoZW4gS0FTQU4g
aXMgZW5hYmxlZCwgYXMgc3VnZ2VzdGVkIGJ5IENvbm9yICAgICAgICAgICAgICAgICAgCi0gQWRk
IFJCIGZyb20gQmrDtnJuICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCnYyOiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIAotIEhvbm9yIENNRExJTkVfRVhURU5EIGFuZCBDTURMSU5FX0ZPUkNFIGFz
IG5vdGljZWQgYnkgQmrDtnJuCgpBbGV4YW5kcmUgR2hpdGkgKDEpOgogIHJpc2N2OiBBbGxvdyB0
byBkb3duZ3JhZGUgcGFnaW5nIG1vZGUgZnJvbSB0aGUgY29tbWFuZCBsaW5lCgogLi4uL2FkbWlu
LWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dCAgICAgICAgIHwgIDUgKy0KIGFyY2gvcmlzY3Yv
a2VybmVsL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICB8ICAyICsKIGFyY2gvcmlzY3Yva2Vy
bmVsL3BpL01ha2VmaWxlICAgICAgICAgICAgICAgICB8IDM0ICsrKysrKysrKysrKwogYXJjaC9y
aXNjdi9rZXJuZWwvcGkvY21kbGluZV9lYXJseS5jICAgICAgICAgIHwgNTUgKysrKysrKysrKysr
KysrKysrKwogYXJjaC9yaXNjdi9saWIvbWVtY3B5LlMgICAgICAgICAgICAgICAgICAgICAgIHwg
IDIgKwogYXJjaC9yaXNjdi9saWIvbWVtbW92ZS5TICAgICAgICAgICAgICAgICAgICAgIHwgIDIg
KwogYXJjaC9yaXNjdi9tbS9pbml0LmMgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMzYgKysr
KysrKysrKy0tCiA3IGZpbGVzIGNoYW5nZWQsIDEyOSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9u
cygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3Yva2VybmVsL3BpL01ha2VmaWxlCiBj
cmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9rZXJuZWwvcGkvY21kbGluZV9lYXJseS5jCgot
LSAKMi4zNy4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
