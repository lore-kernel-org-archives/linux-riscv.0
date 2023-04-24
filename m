Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C24C77B7E
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Apr 2023 09:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OFEMKju8FN8v0FC2KdylKo88jM42Nrxbuk3WeG6kffU=; b=17ZraRZRLg/UG5
	26mLcWvGafZw9hnUut0o8/tZXYqKCq07lkiAiFkZPF/1E4ZdDQYiI+y+P0SZwwPChFiA/DMe2+Qu0
	/lxCM5DcBQHCrbEEb+PbKAuw5CMqhsL9w0UJr9YuvN0BQMkGM3m34SyqLlusQUoiEKnRNe0epD0fc
	C9UO2qWicRKyzMLsK2HtJNPQOcstJ9jrcBmc7YEVwSvj03hjluZsoC0Brvm+rrOm7StwLMvDKRR0z
	Tahy7LN/kylxmPiFJ2MDJl0vOAaKXg00LNP/5wPUzNKt0/Xiwg0lKmbjGWBIaI4v8LBc7M71/90ZR
	jCLZJpp/CqXvbD0xBuXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pqsPp-00FmO9-1f;
	Mon, 24 Apr 2023 09:23:21 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pqsPl-00FmMo-1j
	for linux-riscv@lists.infradead.org;
	Mon, 24 Apr 2023 09:23:19 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3f19ab99540so18222755e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 24 Apr 2023 02:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1682328196; x=1684920196;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EXcFasvYcCcX5M/Oqzczio5jClnFAANnb2Xvikd7U7A=;
        b=rw3uoZSD2cv6C8bIkJfrr8Hxzj4xP6HDs9VqlScy9e0jX1XeuIikb1eMqMqq+IfTBi
         Bua7ZF8W/sP2+9rqKNbZ5bCmJy6fGE47hT6zFnUVDqPnmTK3abMMXu+ssSp9CZgl7rsh
         oGgvkHi0wgS9oLumPsYvpXu0rloUrjQvdojtvPeENhDeWql3UYihPP3Hpbiyp/4INX8A
         9ubu6OWpHGxleZ0ogFHdqrE2MM7M1ckuo92zYW1hhYhfJT7bDtIzPNIhTJab0U4rCTEB
         g8JE1P2iAvsKNRxf6IM/TaHu59mzUxW7fuSPnTt/o0dvm8YuuxjUJ+/WgnNJXvzs903p
         KNOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682328196; x=1684920196;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EXcFasvYcCcX5M/Oqzczio5jClnFAANnb2Xvikd7U7A=;
        b=fHYAfNWnOsur7x72+/eKk8fuHJfePNO2OnGcFJG4v5RFKCSNoAeoTZGcZsBw8CnK4A
         4pe2eYRWqMCDj6VqYGD+dKtPLXJ/DGQ3Tcn6f3uL3sf+kaLBTjf7zn6pk1MS5Sv9RJrB
         LIrW6uCoO/qSMeTv7TAn9lKiMPMIDM8USXGnSP8lqZ+Xhyu5nJprfSEtv3TCeIfjIzGl
         kotwNsCes48ZnPOtoE8SxYTg3uJgX0slNRYaidGfjQjCphGgh3HvfzfUJj/eY4mv/a8b
         Qpy1Sfu6x0VwDu9QNWSk1s+U7e7MsFxJiCvig1WnyYC9leyAHfsHTHd6i/ytXThP3ySQ
         geoA==
X-Gm-Message-State: AAQBX9ff9N44a2sCH2YBhjicSIGTyc5d4Zod8/HPnf5vzpGkZHZnoDHz
	SXCV4Ndx9eS8GV+qjMk7TgBxsA==
X-Google-Smtp-Source: AKy350ZGA/34dC7i7D2a/hjvz5pLQPYdT9/obwuNRSwU39wOtAvc2iVIM4u0ToVzfv8KAENelqieHQ==
X-Received: by 2002:a7b:c5c7:0:b0:3f1:75d0:6151 with SMTP id n7-20020a7bc5c7000000b003f175d06151mr7250507wmk.1.1682328195740;
        Mon, 24 Apr 2023 02:23:15 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id n16-20020adfe350000000b002c71b4d476asm10327819wrj.106.2023.04.24.02.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Apr 2023 02:23:15 -0700 (PDT)
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
Subject: [PATCH v10 0/1] riscv: Allow to downgrade paging mode from the command line
Date: Mon, 24 Apr 2023 11:23:12 +0200
Message-Id: <20230424092313.178699-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230424_022317_785615_3885212C 
X-CRM114-Status: GOOD (  17.20  )
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

aGlzIG5ldyB2ZXJzaW9uIGdldHMgcmlkIG9mIHRoZSBsaW1pdGF0aW9uIHRoYXQgcHJldmVudGVk
IEtBU0FOIGtlcm5lbHMKdG8gdXNlIHRoZSBuZXdseSBpbnRyb2R1Y2VkIHBhcmFtZXRlcnMuCgpX
aGlsZSBsb29raW5nIGludG8gS0FTTFIsIEkgZmVsbCBvbnRvIGNvbW1pdCBhYWNkMTQ5YjYyMzgg
KCJhcm02NDogaGVhZDoKYXZvaWQgcmVsb2NhdGluZyB0aGUga2VybmVsIHR3aWNlIGZvciBLQVNM
UiIpOiBpdCBhbGxvd3MgdG8gdXNlIHRoZSBmZHQKZnVuY3Rpb25zIHZlcnkgZWFybHkgaW4gdGhl
IGJvb3QgcHJvY2VzcyB3aXRoIEtBU0FOIGVuYWJsZWQgYnkgc2ltcGx5CmNvbXBpbGluZyBhIG5l
dyB2ZXJzaW9uIG9mIHRob3NlIGZ1bmN0aW9ucyB3aXRob3V0IGluc3RydW1lbnRhdGlvbi4KCkkg
aGFkIHRvIGNoYW5nZSB0aGUgaGFuZGxpbmcgb2YgdGhlIGNvbW1hbmQgbGluZSBwYXJzaW5nIHRv
IG1ha2UgdGhlCmNvZGUgc2VsZi1jb250YWluZWQgaW4ga2VybmVsL3BpL2NtZF9lYXJseS5jIHRv
IGF2b2lkIGNhbGxpbmcgdG9vIG1hbnkKX19waSBwcmVmaXhlZCBmdW5jdGlvbnMgZnJvbSBvdXRz
aWRlIHRoaXMgZmlsZS4KCkknbGwgdXNlIHRoaXMgYXBwcm9hY2ggbGlrZSBhcm02NCB0byBoYW5k
bGUgdGhlIGV4dHJhY3Rpb24gb2YgdGhlIHJhbmRvbQpzZWVkaSBmcm9tIHRoZSBkZXZpY2UgdHJl
ZSBmb3IgS0FTTFIuCgpUaGlzIHBhdGNoc2V0IGlzIHJlYmFzZWQgb24gdG9wOgoKSW50cm9kdWNl
IDY0YiByZWxvY2F0YWJsZSBrZXJuZWwKKGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJv
amVjdC9saW51eC1yaXNjdi9saXN0Lz9zZXJpZXM9NzM0ODQ3KQpiYXNlLWNvbW1pdC10YWc6IHY2
LjMtcmMxCgp2MTA6Ci0gQ29tcGlsZSBrZXJuZWwvcGkgd2l0aCAtZnBpZSB0byBmaXggbGx2bSBi
b290IGlzc3VlcyAoYXJtNjQgZG9lcyBqdXN0CiAgdGhhdCkKLSBSZWJhc2Ugb24gdG9wIHJlbG9j
YXRhYmxlIHBhdGNoc2V0IHRoYXQgd2FzIG1lcmdlZAotIEFkZCAteiBub3JlbHJvIHRvIGFsbCBr
ZXJuZWxzIChub3QganVzdCByZWxvY2F0YWJsZSkgdG8gcXVpZXQgbGQubGxkCiAgd2FybmluZ3MK
CnY5OgotIEZpeCBtZWRsb3cgYnVpbGRzIGJ5IG1hcmtpbmcgcGkvIG1lZGFueSwgYXMgcmVwb3J0
ZWQgYnkgUGFsbWVyCgp2ODoKLSBGaXggTExWTSBsZCB3YXJuaW5nIGJ5IG1vdmluZyB0aGUgc2Vj
dGlvbiAuaW5pdC5zZGF0YSBmcm9tCiAga2VybmVsL3BpL3N0cmluZy5jIGludG8gdGhlIG5ld2x5
IGNyZWF0ZWQgc2VjdGlvbiAuaW5pdC5waWRhdGEKCnY3OgotIFJlYmFzZWQgb24gdG9wIG9mIGZv
ci1uZXh0IHdoaWNoIGludHJvZHVjZXMgbG90cyBvZiBlcnJvcnMgKHRoYW5rcyB0bwogIHRoZSBw
YXRjaHdvcmsgQ0kpCi0gQWRkIF9fTk9fRk9SVElGWSB0byBhdm9pZCB1bmRlZmluZWQgX19waV9m
b3J0aWZ5X3BhbmljCi0gQWRkIGFuIGFsaWFzIHRvIG91ciBuZXdseSBpbnRyb2R1Y2VkIHN0cmxl
bgotIFJlbW92ZSBfX2luaXQgYXMgc2VjdGlvbnMgYXJlIGFscmVhZHkgcHJlZml4ZWQgaW4gdGhl
IE1ha2VmaWxlCi0gSW50cm9kdWNlIG5ldyBzZWN0aW9uIGZvciBrZXJuZWwvcGkvc3RyaW5nLmMg
dG8gcXVpZXQgdGhlIGZvbGxvd2luZwogIHdhcm5pbmdzIChvbmNlIHdlIGhhdmUgYWxsIHRoZSBz
dHJpbmcgZnVuY3Rpb25zLCB3ZSdsbCBiZSBhYmxlIHRvIGdldAogIHJpZCBvZiB0aGlzKToKCndh
cm5pbmc6IG9ycGhhbiBzZWN0aW9uIGAuaW5pdF9fYnVnX3RhYmxlJyBmcm9tIGBhcmNoL3Jpc2N2
L2tlcm5lbC9waS9zdHJpbmcucGkubycgYmVpbmcgcGxhY2VkIGluIHNlY3Rpb24gYC5pbml0X19i
dWdfdGFibGUnCndhcm5pbmc6IG9ycGhhbiBzZWN0aW9uIGAuaW5pdC5zcm9kYXRhLmNzdDgnIGZy
b20gYGFyY2gvcmlzY3Yva2VybmVsL3BpL3N0cmluZy5waS5vJyBiZWluZyBwbGFjZWQgaW4gc2Vj
dGlvbiBgLmluaXQuc3JvZGF0YS5jc3Q4JwoKdjY6Ci0gRml4IGxsdm0gd2FybmluZyBieSBmb3J3
YXJkIGRlY2xhcmluZyBzZXRfc2F0cF9tb2RlX2Zyb21fY21kbGluZQoKdjU6Ci0gSGFuZGxlIG51
bGwgY29tbWFuZCBsaW5lLCBUaGFua3MgQmrDtnJuIQotIEFkZCBSQi9UQiBmcm9tIEJqw7ZybgoK
djQ6Ci0gSW50cm9kdWNlIHBpLyBmb3IgS0FTQU4gdG8gd29yawoKdjM6Ci0gTWFzc2FnZSBjb21t
aXQgbG9nIHRvIG1ha2Ugbm80bHZsIGNsZWFyZXIsIGFzIGFza2VkIGJ5IENvbm9yCi0gQWRkIGEg
bm90ZSB0byBrZXJuZWwtcGFyYW1ldGVycy50eHQgcmVnYXJkaW5nIHRoZSBpbXBvc3NpYmlsaXR5
IHRvIHVzZQogIHRob3NlIHBhcmFtZXRlcnMgd2hlbiBLQVNBTiBpcyBlbmFibGVkLCBhcyBzdWdn
ZXN0ZWQgYnkgQ29ub3IKLSBBZGQgUkIgZnJvbSBCasO2cm4KCnYyOgotIEhvbm9yIENNRExJTkVf
RVhURU5EIGFuZCBDTURMSU5FX0ZPUkNFIGFzIG5vdGljZWQgYnkgQmrDtnJuCgpBbGV4YW5kcmUg
R2hpdGkgKDEpOgogIHJpc2N2OiBBbGxvdyB0byBkb3duZ3JhZGUgcGFnaW5nIG1vZGUgZnJvbSB0
aGUgY29tbWFuZCBsaW5lCgogLi4uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dCAg
ICAgICAgIHwgIDUgKy0KIGFyY2gvcmlzY3YvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8ICAzICstCiBhcmNoL3Jpc2N2L2tlcm5lbC9NYWtlZmlsZSAgICAgICAgICAgICAgICAg
ICAgfCAgMiArCiBhcmNoL3Jpc2N2L2tlcm5lbC9waS9NYWtlZmlsZSAgICAgICAgICAgICAgICAg
fCAzOSArKysrKysrKysrKysKIGFyY2gvcmlzY3Yva2VybmVsL3BpL2NtZGxpbmVfZWFybHkuYyAg
ICAgICAgICB8IDYyICsrKysrKysrKysrKysrKysrKysKIGFyY2gvcmlzY3Yva2VybmVsL3ZtbGlu
dXgubGRzLlMgICAgICAgICAgICAgICB8IDExICsrKy0KIGFyY2gvcmlzY3YvbGliL21lbWNweS5T
ICAgICAgICAgICAgICAgICAgICAgICB8ICAyICsKIGFyY2gvcmlzY3YvbGliL21lbW1vdmUuUyAg
ICAgICAgICAgICAgICAgICAgICB8ICAyICsKIGFyY2gvcmlzY3YvbGliL3N0cmxlbi5TICAgICAg
ICAgICAgICAgICAgICAgICB8ICAxICsKIGFyY2gvcmlzY3YvbW0vaW5pdC5jICAgICAgICAgICAg
ICAgICAgICAgICAgICB8IDM2ICsrKysrKysrKy0tCiAxMCBmaWxlcyBjaGFuZ2VkLCAxNTQgaW5z
ZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2
L2tlcm5lbC9waS9NYWtlZmlsZQogY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3Yva2VybmVs
L3BpL2NtZGxpbmVfZWFybHkuYwoKLS0gCjIuMzcuMgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
