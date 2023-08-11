Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C249C0015E
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 15:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jyppjCKMrqZp29VQTn6pRIQBG3xbknELd3mGXndMA2w=; b=CcF+1fnslR2v0a
	etxJAC8GhAtCwLKbs8C31355B412pSL4cy4Ag5JT9pfX5FGDdwN3KrGhm7hl9LWC1QBzhC7ZJOK8n
	FeYDEYlLRf65xyqR0fuD2GRep9GnTCUrC2qgSQrgS6FnDq/Z0O1olSiKebiwa6hVoBDawRKZJ+IEn
	TzERCwDXPVZAoCkIQtnqG2yFYu/hEUgw+A+XS3e7hP40/y2gBC/kqgRWxDrDkGppYDW1d0rEDOI6f
	Es1/c0jWuH9f2VsvJvCi3uEk3nRsKaIW1HyaP0405FpsRU1NegWxv3XDLFQcdt7kqK0PA7zsRs5SC
	gGQ6Z2MeJBHtTYs/uVOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUTiT-00AtjH-1o;
	Fri, 11 Aug 2023 15:06:17 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUTiQ-00AtiB-24
	for linux-riscv@lists.infradead.org;
	Fri, 11 Aug 2023 15:06:16 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-31768ce2e81so1906420f8f.1
        for <linux-riscv@lists.infradead.org>; Fri, 11 Aug 2023 08:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1691766367; x=1692371167;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+UvZ9HrNi6+0yvLdChwz5BHmbfK5E+QD2Q28lED/r0w=;
        b=DoAkr8vQPF+g1TAc2v1DWTvRvYCOdl+r1dl2Gn3/JA21fcwn/yjAJVGIMwtQRglFEZ
         LG3+WQigEgoFMBi5nkax70WTsesmgUPV4QmvGhhTNPXFHoWJ+wrdnWSxoeMtAzIUyNog
         VfjRy/yNxn6huscKH8uRh4XYWKOebfrCiof1yVnhUaV/SKSmHkIytq+bQLqHNd+/u0G0
         JOoNfaEweEsBww5/QQYdCm6+vvN7S1UNBeqviZChjv5/kG38WdiVTl0TV3mdLkU+hc3m
         QnKkIURJn+Ll0SvggNw7RiienZoO/34+sLH7H5IlTYAhvqAm1LsdokweIzqX/fjVaaG/
         49sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691766367; x=1692371167;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+UvZ9HrNi6+0yvLdChwz5BHmbfK5E+QD2Q28lED/r0w=;
        b=IZhdu0hMtu6E1e1J8ezxESuUBK1OZtQk+hR3911awXLn33nUU5tkk2pt6TCwfOipCW
         jXrDk+w2A6bt5jMHYwuvCzje8jHhSaUS3n98//cbcC8bIGts+U3YfVRSPXVokZryfXaM
         2AxN1mozECUiUoGRYOUin6xf1CyPwUktXYeqT+QnwpMd0Y8+rJvuKNx0FGSJbwxuwYgi
         j6iYxdYNjdTuOlojllUJBC7C1OPp3EaFVqB6iN+MWBxsVAs5qRbcRlTo/fr6mzmXtkWL
         apeWCLBCsB6+6+HBv1vamNJGEMgJbIXokm8e1B75kUH8ee7azf6uLUWMYpVQ5s/aNoIO
         TIPA==
X-Gm-Message-State: AOJu0YwmgaQOXsyPBoX6Faelar6x8VnEnGPkg3XhVvvjzUW/8+YXpDgS
	twph8PeA/RNcDfqXF+xqT17fAA==
X-Google-Smtp-Source: AGHT+IEspuCzVImRxZHDzo52eLe0Y1eyFUEFhTu07gl6/+etdGcwcvyYYYANXY5lJOKHC8KYzPjJ4Q==
X-Received: by 2002:a5d:62d1:0:b0:317:3d36:b2cd with SMTP id o17-20020a5d62d1000000b003173d36b2cdmr1302741wrv.71.1691766367377;
        Fri, 11 Aug 2023 08:06:07 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id w4-20020adfcd04000000b003176eab8868sm5704018wrm.82.2023.08.11.08.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Aug 2023 08:06:07 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alan Kao <alankao@andestech.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Bo YU <tsu.yubo@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>
Subject: [PATCH -fixes v2] riscv: uaccess: Return the number of bytes effectively not copied
Date: Fri, 11 Aug 2023 17:06:04 +0200
Message-Id: <20230811150604.1621784-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_080614_678920_AA40DFA9 
X-CRM114-Status: GOOD (  18.44  )
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

SXQgd2FzIHJlcG9ydGVkIHRoYXQgdGhlIHJpc2N2IGtlcm5lbCBoYW5ncyB3aGlsZSBleGVjdXRp
bmcgdGhlIHRlc3QKaW4gWzFdLgoKSW5kZWVkLCB0aGUgdGVzdCBoYW5ncyB3aGVuIHRyeWluZyB0
byB3cml0ZSBhIGJ1ZmZlciB0byBhIGZpbGUuIFRoZQpwcm9ibGVtIGlzIHRoYXQgdGhlIHJpc2N2
IGltcGxlbWVudGF0aW9uIG9mIHJhd19jb3B5X2Zyb21fdXNlcigpIGRvZXMgbm90CnJldHVybiB0
aGUgY29ycmVjdCBudW1iZXIgb2YgYnl0ZXMgbm90IHdyaXR0ZW4gd2hlbiBhbiBleGNlcHRpb24g
aGFwcGVucwphbmQgaXMgZml4ZWQgdXAsIGluc3RlYWQgaXQgYWx3YXlzIHJldHVybnMgdGhlIGlu
aXRpYWwgc2l6ZSB0byBjb3B5LApldmVuIGlmIHNvbWUgYnl0ZXMgd2VyZSBhY3R1YWxseSBjb3Bp
ZWQuCgpnZW5lcmljX3BlcmZvcm1fd3JpdGUoKSBwcmUtZmF1bHRzIHRoZSB1c2VyIHBhZ2VzIGFu
ZCBiYWlscyBvdXQgaWYgbm90aGluZwpjYW4gYmUgd3JpdHRlbiwgb3RoZXJ3aXNlIGl0IHdpbGwg
YWNjZXNzIHRoZSB1c2Vyc3BhY2UgYnVmZmVyOiBoZXJlIHRoZQpyaXNjdiBpbXBsZW1lbnRhdGlv
biBrZWVwcyByZXR1cm5pbmcgaXQgd2FzIG5vdCBhYmxlIHRvIGNvcHkgYW55IGJ5dGUKdGhvdWdo
IHRoZSBwcmUtZmF1bHRpbmcgaW5kaWNhdGVzIG90aGVyd2lzZS4gU28gZ2VuZXJpY19wZXJmb3Jt
X3dyaXRlKCkKa2VlcHMgcmV0cnlpbmcgdG8gYWNjZXNzIHRoZSB1c2VyIG1lbW9yeSBhbmQgZW5k
cyB1cCBpbiBhbiBpbmZpbml0ZQpsb29wLgoKTm90ZSB0aGF0IGJlZm9yZSB0aGUgY29tbWl0IG1l
bnRpb25lZCBpbiBbMV0gdGhhdCBpbnRyb2R1Y2VkIHRoaXMKcmVncmVzc2lvbiwgaXQgd29ya2Vk
IGJlY2F1c2UgZ2VuZXJpY19wZXJmb3JtX3dyaXRlKCkgd291bGQgYmFpbCBvdXQgaWYKb25seSBv
bmUgYnl0ZSBjb3VsZCBub3QgYmUgd3JpdHRlbi4KClNvIGZpeCB0aGlzIGJ5IHJldHVybmluZyB0
aGUgbnVtYmVyIG9mIGJ5dGVzIGVmZmVjdGl2ZWx5IG5vdCB3cml0dGVuIGluCl9fYXNtX2NvcHlf
W3RvfGZyb21dX3VzZXIoKSBhbmQgX19jbGVhcl91c2VyKCksIGFzIGl0IGlzIGV4cGVjdGVkLgoK
TGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAyMzAzMDkxNTE4NDEu
Ym9tb3Y2aHEzeWJ5cDQyYUBkZWJpYW4vIFsxXQpGaXhlczogZWJjYmQ3NWUzOTYyICgicmlzY3Y6
IEZpeCB0aGUgYnVnIGluIG1lbW9yeSBhY2Nlc3MgZml4dXAgY29kZSIpClJlcG9ydGVkLWJ5OiBC
byBZVSA8dHN1Lnl1Ym9AZ21haWwuY29tPgpDbG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2xpbnV4LXJpc2N2LzIwMjMwMzA5MTUxODQxLmJvbW92NmhxM3lieXA0MmFAZGViaWFuLyN0ClJl
cG9ydGVkLWJ5OiBBdXJlbGllbiBKYXJubyA8YXVyZWxpZW5AYXVyZWwzMi5uZXQ+CkNsb3Nlczog
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvWk5PbkNha2h3SWV1ZTN5ckBhdXJl
bDMyLm5ldC8KU2lnbmVkLW9mZi1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3Np
bmMuY29tPgpSZXZpZXdlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgpU
ZXN0ZWQtYnk6IEF1cmVsaWVuIEphcm5vIDxhdXJlbGllbkBhdXJlbDMyLm5ldD4KUmV2aWV3ZWQt
Ynk6IEF1cmVsaWVuIEphcm5vIDxhdXJlbGllbkBhdXJlbDMyLm5ldD4KLS0tCgpDaGFuZ2VzIGlu
IHYyOgogIC0gQWRkIFJCL1RCIGZyb20gQmpvcm4gYW5kIEF1cmVsaWVuCiAgLSBGaXggY29tbWl0
IGNoYW5nZWxvZyBhcyBpdCBpbmNvcnJlY3RseSBzdGF0ZWQgdGhlIGZ1bmN0aW9ucyBzaG91bGQK
ICAgIHJldHVybiB0aGUgbnVtYmVyIG9mIGJ5dGVzIGNvcGllZCwgd2hlcmVhcyBpdCBpcyBhY3R1
YWxseSB0aGUgbnVtYmVyCiAgICBvZiBieXRlcyAqbm90KiB3cml0dGVuCiAgLSBJbXByb3ZlZCBj
aGFuZ2Vsb2cgYSBiaXQgaW4gdGhlIDJuZCBwYXJhZ3JhcGgKCiBhcmNoL3Jpc2N2L2xpYi91YWNj
ZXNzLlMgfCAxMSArKysrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwg
NCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2xpYi91YWNjZXNzLlMgYi9h
cmNoL3Jpc2N2L2xpYi91YWNjZXNzLlMKaW5kZXggZWM0ODZlNTM2OWQ5Li4wOWI0N2ViYWNmMmUg
MTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvbGliL3VhY2Nlc3MuUworKysgYi9hcmNoL3Jpc2N2L2xp
Yi91YWNjZXNzLlMKQEAgLTE3LDggKzE3LDExIEBAIEVOVFJZKF9fYXNtX2NvcHlfZnJvbV91c2Vy
KQogCWxpIHQ2LCBTUl9TVU0KIAljc3JzIENTUl9TVEFUVVMsIHQ2CiAKLQkvKiBTYXZlIGZvciBy
ZXR1cm4gdmFsdWUgKi8KLQltdgl0NSwgYTIKKwkvKgorCSAqIFNhdmUgdGhlIHRlcm1pbmFsIGFk
ZHJlc3Mgd2hpY2ggd2lsbCBiZSB1c2VkIHRvIGNvbXB1dGUgdGhlIG51bWJlcgorCSAqIG9mIGJ5
dGVzIGNvcGllZCBpbiBjYXNlIG9mIGEgZml4dXAgZXhjZXB0aW9uLgorCSAqLworCWFkZAl0NSwg
YTAsIGEyCiAKIAkvKgogCSAqIFJlZ2lzdGVyIGFsbG9jYXRpb24gZm9yIGNvZGUgYmVsb3c6CkBA
IC0xNzYsNyArMTc5LDcgQEAgRU5UUlkoX19hc21fY29weV9mcm9tX3VzZXIpCiAxMDoKIAkvKiBE
aXNhYmxlIGFjY2VzcyB0byB1c2VyIG1lbW9yeSAqLwogCWNzcmMgQ1NSX1NUQVRVUywgdDYKLQlt
diBhMCwgdDUKKwlzdWIgYTAsIHQ1LCBhMAogCXJldAogRU5EUFJPQyhfX2FzbV9jb3B5X3RvX3Vz
ZXIpCiBFTkRQUk9DKF9fYXNtX2NvcHlfZnJvbV91c2VyKQpAQCAtMjI4LDcgKzIzMSw3IEBAIEVO
VFJZKF9fY2xlYXJfdXNlcikKIDExOgogCS8qIERpc2FibGUgYWNjZXNzIHRvIHVzZXIgbWVtb3J5
ICovCiAJY3NyYyBDU1JfU1RBVFVTLCB0NgotCW12IGEwLCBhMQorCXN1YiBhMCwgYTMsIGEwCiAJ
cmV0CiBFTkRQUk9DKF9fY2xlYXJfdXNlcikKIEVYUE9SVF9TWU1CT0woX19jbGVhcl91c2VyKQot
LSAKMi4zOS4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
