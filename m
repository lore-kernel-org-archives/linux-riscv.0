Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A3FC64ED6
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Feb 2023 15:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1aLv0C214V2rRIs5tGyyW7LXS5ABWam6q6h0yD9A/lk=; b=0JMfcbZNGJAaT9
	ATrtdv8Cd5/5h/snHLLpjCk350OXyznBEm1lS6YYAKUdeFBmrEtevA/0UG2nGdEQSrrKHSkQSH+Hh
	4k9GVE5wwDYzbPljyaqousmuV0y1Cc++oQf5eZKtcexxik237DT79z5MaA7YCdKCpISbC2eDQ7ZlO
	CzGmDvEblIa1k2WhLB8d5ZuvTP1nbEv2TCU42quR958M5a72ElXnFw1wywH+Wj9iFJtoheXUcrjwG
	jD25xeLCdMXWG88D18p4wMokirnGKwDxyeL0uqzBu/M3fV5ymd0s/OzUg9f7DffCYfII/PN5pAxY6
	fiMtyO0hX5UieQZ/64VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX2Bb-00DfvT-2u; Tue, 28 Feb 2023 15:46:39 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX2BY-00DfuG-7w
	for linux-riscv@lists.infradead.org; Tue, 28 Feb 2023 15:46:38 +0000
Received: by mail-wr1-x432.google.com with SMTP id t15so10243314wrz.7
        for <linux-riscv@lists.infradead.org>; Tue, 28 Feb 2023 07:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677599193;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UoR1tCMqBp+csZse58QFeQTl6XiwfpRChiE77LfzzYo=;
        b=yVJiteKDOKx05exhBTQfkblzBUFYBV3RpEh+t371JH9Huxj90BDLY3pgO6oCDUt197
         Xs+BgPVxxh80ZymxFXB1moFb8j8LT3tgjv69XJdDbLKNi/o2Mt/cYEK/rWElTEpqTyE7
         APoBkOHpaTb0w9nMY3rlg6SgNf2f27WlvinT/x3If0c5gq6dMYf4e+OtXlgwFAfQCOt4
         S3kK3mFZdbnvlt8uxBfWhqLu3eV9TnsMwtX9Yeb13iIu6qp1pANC3A6yRct7k2xmBE3o
         dlyqutgCzf4bMuUG9eJ7AK0JT2oZxYSNE2o54sZVm7t3318xqY3VYDBLNP3AFSQujlyV
         rSpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677599193;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UoR1tCMqBp+csZse58QFeQTl6XiwfpRChiE77LfzzYo=;
        b=vL9pp1e+rd0g8/49EaTIS4vyB6dKkI3SYLVJj3kv9VqsrKuZcJYzQqK/BowIw9UcT7
         FlD5/VCCr3HF+3I3hOkA9HgQINn2WwUfZMS5pqkSdbjcVOyUdywRnqFoeb7NgU1Sm2aA
         Yb3nW3fSlVMszT+zWxt9ajmaBX1eFz6TIwlXm85/idUXMBrEvO2okcamTDRPrs6ex0X5
         ZkY6Od7H/ZipQAmZgClqlShG+vbWW/S/p2lnT4+qzypufujv7Vd4Q8iDIXrNzr+X3SDx
         CicmG3Zeaf5odUWZ53oybqMJnHt/R73F7NAktJMrGHQlXWLMCbC42cYRUsmEPf38YO5X
         vvgA==
X-Gm-Message-State: AO0yUKUDQHw4LGJh18jkxGpCfhIJVB1QcNH55EHZqUVNvXzZoGLfzMST
	JLXS+J6pq4sMI4ZdCD40PW7vGQ==
X-Google-Smtp-Source: AK7set9VVCtNON7BjfYFEn4DTD0yqlg1psIpUaMtYWkHZHahodZ1gU0u3rTiKHVc8V7atr0Iv41aKQ==
X-Received: by 2002:adf:fe8b:0:b0:2cc:3308:514f with SMTP id l11-20020adffe8b000000b002cc3308514fmr2142195wrr.57.1677599193296;
        Tue, 28 Feb 2023 07:46:33 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (lfbn-gre-1-235-32.w90-112.abo.wanadoo.fr. [90.112.194.32])
        by smtp.gmail.com with ESMTPSA id c4-20020adffb04000000b002c70bfe505esm10122806wrr.82.2023.02.28.07.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 07:46:32 -0800 (PST)
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
Subject: [PATCH v8 0/1] riscv: Allow to downgrade paging mode from the command line
Date: Tue, 28 Feb 2023 16:46:28 +0100
Message-Id: <20230228154629.240541-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_074636_498651_DB3D89CC 
X-CRM114-Status: GOOD (  17.04  )
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
dmljZSB0cmVlIGZvciBLQVNMUi4gCgpiYXNlLWNvbW1pdDogZWI5YmU4MzEwYzU4ICgiUklTQy1W
OiBhZGQgYSBzcGluX3NoYWRvd19zdGFjayBkZWNsYXJhdGlvbiIpCgp2ODoKLSBGaXggTExWTSBs
ZCB3YXJuaW5nIGJ5IG1vdmluZyB0aGUgc2VjdGlvbiAuaW5pdC5zZGF0YSBmcm9tCiAga2VybmVs
L3BpL3N0cmluZy5jIGludG8gdGhlIG5ld2x5IGNyZWF0ZWQgc2VjdGlvbiAuaW5pdC5waWRhdGEK
CnY3OgotIFJlYmFzZWQgb24gdG9wIG9mIGZvci1uZXh0IHdoaWNoIGludHJvZHVjZXMgbG90cyBv
ZiBlcnJvcnMgKHRoYW5rcyB0bwogIHRoZSBwYXRjaHdvcmsgQ0kpCi0gQWRkIF9fTk9fRk9SVElG
WSB0byBhdm9pZCB1bmRlZmluZWQgX19waV9mb3J0aWZ5X3BhbmljCi0gQWRkIGFuIGFsaWFzIHRv
IG91ciBuZXdseSBpbnRyb2R1Y2VkIHN0cmxlbgotIFJlbW92ZSBfX2luaXQgYXMgc2VjdGlvbnMg
YXJlIGFscmVhZHkgcHJlZml4ZWQgaW4gdGhlIE1ha2VmaWxlCi0gSW50cm9kdWNlIG5ldyBzZWN0
aW9uIGZvciBrZXJuZWwvcGkvc3RyaW5nLmMgdG8gcXVpZXQgdGhlIGZvbGxvd2luZwogIHdhcm5p
bmdzIChvbmNlIHdlIGhhdmUgYWxsIHRoZSBzdHJpbmcgZnVuY3Rpb25zLCB3ZSdsbCBiZSBhYmxl
IHRvIGdldAogIHJpZCBvZiB0aGlzKToKCndhcm5pbmc6IG9ycGhhbiBzZWN0aW9uIGAuaW5pdF9f
YnVnX3RhYmxlJyBmcm9tIGBhcmNoL3Jpc2N2L2tlcm5lbC9waS9zdHJpbmcucGkubycgYmVpbmcg
cGxhY2VkIGluIHNlY3Rpb24gYC5pbml0X19idWdfdGFibGUnCndhcm5pbmc6IG9ycGhhbiBzZWN0
aW9uIGAuaW5pdC5zcm9kYXRhLmNzdDgnIGZyb20gYGFyY2gvcmlzY3Yva2VybmVsL3BpL3N0cmlu
Zy5waS5vJyBiZWluZyBwbGFjZWQgaW4gc2VjdGlvbiBgLmluaXQuc3JvZGF0YS5jc3Q4JwoKdjY6
Ci0gRml4IGxsdm0gd2FybmluZyBieSBmb3J3YXJkIGRlY2xhcmluZyBzZXRfc2F0cF9tb2RlX2Zy
b21fY21kbGluZQoKdjU6ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCi0gSGFuZGxlIG51bGwgY29tbWFu
ZCBsaW5lLCBUaGFua3MgQmrDtnJuISAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAKLSBBZGQgUkIvVEIgZnJvbSBCasO2cm4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAK
djQ6ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgCi0gSW50cm9kdWNlIHBpLyBmb3IgS0FTQU4gdG8gd29y
ayAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAKdjM6ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCi0gTWFzc2FnZSBjb21t
aXQgbG9nIHRvIG1ha2Ugbm80bHZsIGNsZWFyZXIsIGFzIGFza2VkIGJ5IENvbm9yICAgICAgICAg
ICAgICAgICAgIAotIEFkZCBhIG5vdGUgdG8ga2VybmVsLXBhcmFtZXRlcnMudHh0IHJlZ2FyZGlu
ZyB0aGUgaW1wb3NzaWJpbGl0eSB0byB1c2UgICAgICAgICAKICB0aG9zZSBwYXJhbWV0ZXJzIHdo
ZW4gS0FTQU4gaXMgZW5hYmxlZCwgYXMgc3VnZ2VzdGVkIGJ5IENvbm9yICAgICAgICAgICAgICAg
ICAgCi0gQWRkIFJCIGZyb20gQmrDtnJuICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCnYy
OiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIAotIEhvbm9yIENNRExJTkVfRVhURU5EIGFuZCBDTURMSU5F
X0ZPUkNFIGFzIG5vdGljZWQgYnkgQmrDtnJuCgoKQWxleGFuZHJlIEdoaXRpICgxKToKICByaXNj
djogQWxsb3cgdG8gZG93bmdyYWRlIHBhZ2luZyBtb2RlIGZyb20gdGhlIGNvbW1hbmQgbGluZQoK
IC4uLi9hZG1pbi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50eHQgICAgICAgICB8ICA1ICstCiBh
cmNoL3Jpc2N2L2tlcm5lbC9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgfCAgMiArCiBhcmNo
L3Jpc2N2L2tlcm5lbC9waS9NYWtlZmlsZSAgICAgICAgICAgICAgICAgfCAzNyArKysrKysrKysr
KwogYXJjaC9yaXNjdi9rZXJuZWwvcGkvY21kbGluZV9lYXJseS5jICAgICAgICAgIHwgNjIgKysr
KysrKysrKysrKysrKysrKwogYXJjaC9yaXNjdi9rZXJuZWwvdm1saW51eC5sZHMuUyAgICAgICAg
ICAgICAgIHwgIDggKysrCiBhcmNoL3Jpc2N2L2xpYi9tZW1jcHkuUyAgICAgICAgICAgICAgICAg
ICAgICAgfCAgMiArCiBhcmNoL3Jpc2N2L2xpYi9tZW1tb3ZlLlMgICAgICAgICAgICAgICAgICAg
ICAgfCAgMiArCiBhcmNoL3Jpc2N2L2xpYi9zdHJsZW4uUyAgICAgICAgICAgICAgICAgICAgICAg
fCAgMSArCiBhcmNoL3Jpc2N2L21tL2luaXQuYyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAz
NiArKysrKysrKystLQogOSBmaWxlcyBjaGFuZ2VkLCAxNDggaW5zZXJ0aW9ucygrKSwgNyBkZWxl
dGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2tlcm5lbC9waS9NYWtlZmls
ZQogY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3Yva2VybmVsL3BpL2NtZGxpbmVfZWFybHku
YwoKLS0gCjIuMzcuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
