Return-Path: <SRS0=D0Wc=IK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16B33C433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Mar 2021 15:28:45 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8311A64F8F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Mar 2021 15:28:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8311A64F8F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RrWotXi6jFV6nQU7d5JLQ8ZM3+5HHRF+sW3XUE4rtvQ=; b=Heer5tCNmxKzahGaglHkoMWW/D
	eO2mrwpwyRD5U+iLczDiDT06kTt7kF5rLt7xbv1Y/VEfITe8TLXE5svxyQOT9UMHFeKWD6MW1zKWh
	RcKeLLw6mpmvIKwmkD/8DFDEipgXuoe1PNdjtYhMO7oCP/TAxAV7MOCgovOxX8Wv5e6wiu8U85Yaq
	uco1jscRkN1HmDb4knag/L/W1fB5Q+hyjE73hd05OAvF9rd5CDv+o1sSx6qqCPGIH/cxMKZx+wozj
	SP6k7v9a6TjLt/RBf4NanLew2uh0OJlrWy9QsO2sYaqcWld1nwlo984MDr+GIytRcj/H95Pj5loCM
	tkNcFNSw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKjiM-00BnSv-JY; Fri, 12 Mar 2021 15:28:34 +0000
Received: from mout.gmx.net ([212.227.17.20])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKjiI-00BnSC-Ln
 for linux-riscv@lists.infradead.org; Fri, 12 Mar 2021 15:28:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1615562901;
 bh=5kxWxnJH6TxGILTbWiEuWrtMiE4DpLAno4eP5DaAVnM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=kiKXOysos2SmX0B8pydGx/TlqeNKGYPZVqafF9L5KKf1Al2XFMky8lQfp1MKLafQR
 u/QUfHptnDrDwR7jBurSje/dRs7eWKoCvC+Tz3VLm8bFRNSY83gukQN+tuzcSAODwF
 IZKra52x10JkVmVRzlG1owQNUrmao7pr1QvPzkEI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.134]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MeU0q-1lutsH2fjA-00aZGP; Fri, 12
 Mar 2021 16:28:21 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-doc@vger.kernel.org
Cc: linux-arch@vger.kernel.org,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: [RFC PATCH] docs: Group arch-specific documentation under "CPU
 Architectures"
Date: Fri, 12 Mar 2021 16:28:03 +0100
Message-Id: <20210312152804.2110703-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:8ebQTw4lZ+rVZ5nvFoAmTj5OAS3v/fSaT0/jFvCvQVpD2gpKnVw
 DilHPjUKk0X3YA+e0yFNd1JIULXgIiQL40MkLj7dZA8ysVSSilzZ7qMxg0HWQZ1wZq9/0K3
 AlikEl29YsjY9T29dZz7XsfV1x5rdiUHqcVejJieZkb79pkNISCbXGhKVp5K9eocWVNHWNb
 CCflKytTdcFSBiCjkTG9A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:uihwH/s/73s=:+hoH2NdeT68B6TmcizC9x1
 TXVdHUe+JqESQt16Cq5/oXL3DvFyFqeaXccPt9272v//kgr3m8I0HKN4pRVradhhqBazITH7z
 BbDh82hc+C6xAu1YOOl/p58eCju57v2gzTnsTnIk3KJBaFXpo0gOUT01yse58b2Gb0TLHmP3B
 iO8qd4J12Wkpa/Nfs/y7NWqqO6bUrRiUQVHiuhAst9cBuXHRD1PYYx6y4KwAuTjYb6hQ/Rxsu
 4Rh7HBmuXbztjNUPCa1/AbxuAiiivPP3OlMWQW1sJIijtCfksooewFj0nnHAoynHoLyynUkun
 t7RGGKqiPEQHhHHpzpJvVZJ9NNDhGoiRMeh//UM8cVa6rYYMma2SPhXVJk/qSTyAikR6LbV4N
 pouSs8E9SSJWIj6CfbEn7BMDuaWfDS0ZRMjlecjFRrgopGIbOjg1XNZesVdGqhfbiaZd/shtG
 AsOwJORRB9VMct6kVmuYcX4AfHQ5M9VEbN4ivte5AaQjT4ir1Xj8kt5slQuR2CZfwdNT2KHYs
 wmru5aU2NjA2wff8w7VcDcb/bf9G9hp+Ja78L4MemUNHGE58bgAIUtePAP9eCp7jU1zZ5K7IC
 94guYKUzco1RFQa3/Mhw+T2PK8021yuCHoF8lwcPt/q1jy+xssVya+koF1aBOWK9pkfjA8f/R
 l5ZsYi/Zl4oZ4lLN/SnKD2i+q6cPvMru0mG9BjYePiTHwchhHlsDRG4Fq0dO+Xj9OjqSngkzU
 aMc0KVWmjwEupvidUCE+dXxuIwMiLE0bzmsokMK3PDoTKCDvSVKzYORAKsl5L3x4VyOXMc/9F
 OtjA0VL0FSNja1T1BVrci/JdSpkHG27IJCCohsnGiksPsKAC849jSCMly54uYsmxeXUoPoAdo
 +ABCTXVJnsJjMza5TP8Q==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210312_152830_829699_9CC8A53A 
X-CRM114-Status: GOOD (  11.07  )
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

VG8gZGVjbHV0dGVyIHRoZSB0b3AtbGV2ZWwgdGFibGUgb2YgY29udGVudHMgKHRoZSBzaWRlIGJh
ciksIHRoaXMKcGF0Y2ggcmVkdWNlcyB0aGUgYXJjaGl0ZWN0dXJlLXNwZWNmaWMgZG9jdW1lbnRh
dGlvbiB0byBvbmUgdG9wLWxldmVsCml0ZW0sICJDUFUgQXJjaGl0ZWN0dXJlcyIuCgpTaWduZWQt
b2ZmLWJ5OiBKb25hdGhhbiBOZXVzY2jDpGZlciA8ai5uZXVzY2hhZWZlckBnbXgubmV0PgotLS0K
CkFzIGEgc2lkZSBlZmZlY3QsIHRoZSBUT0MgaW4gaW5kZXguaHRtbCBlZmZlY3RpdmVseSBnZXRz
IG9uZSBsZXZlbCBvZgpkZXRhaWwgbGVzcy4gVGhpcyBjb3VsZCBiZSBmaXhlZCBieSBzcGVjaWZ5
aW5nICc6bWF4ZGVwdGg6IDMnLgotLS0KIERvY3VtZW50YXRpb24vYXJjaC5yc3QgIHwgMjYgKysr
KysrKysrKysrKysrKysrKysrKysrKysKIERvY3VtZW50YXRpb24vaW5kZXgucnN0IHwgMjAgKyst
LS0tLS0tLS0tLS0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMjggaW5zZXJ0aW9ucygrKSwgMTgg
ZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9hcmNoLnJzdAoK
ZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vYXJjaC5yc3QgYi9Eb2N1bWVudGF0aW9uL2FyY2gu
cnN0Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMDAuLmYxMGJkMzJhNTk3
MmUKLS0tIC9kZXYvbnVsbAorKysgYi9Eb2N1bWVudGF0aW9uL2FyY2gucnN0CkBAIC0wLDAgKzEs
MjYgQEAKKy4uIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCisKK0NQVSBBcmNoaXRl
Y3R1cmVzCis9PT09PT09PT09PT09PT09PQorCitUaGVzZSBib29rcyBwcm92aWRlIHByb2dyYW1t
aW5nIGRldGFpbHMgYWJvdXQgYXJjaGl0ZWN0dXJlLXNwZWNpZmljCitpbXBsZW1lbnRhdGlvbi4K
KworLi4gdG9jdHJlZTo6CisgICA6bWF4ZGVwdGg6IDIKKworICAgYXJtL2luZGV4CisgICBhcm02
NC9pbmRleAorICAgaWE2NC9pbmRleAorICAgbTY4ay9pbmRleAorICAgbWlwcy9pbmRleAorICAg
bmlvczIvaW5kZXgKKyAgIG9wZW5yaXNjL2luZGV4CisgICBwYXJpc2MvaW5kZXgKKyAgIHBvd2Vy
cGMvaW5kZXgKKyAgIHJpc2N2L2luZGV4CisgICBzMzkwL2luZGV4CisgICBzaC9pbmRleAorICAg
c3BhcmMvaW5kZXgKKyAgIHg4Ni9pbmRleAorICAgeHRlbnNhL2luZGV4CmRpZmYgLS1naXQgYS9E
b2N1bWVudGF0aW9uL2luZGV4LnJzdCBiL0RvY3VtZW50YXRpb24vaW5kZXgucnN0CmluZGV4IDMx
ZjJhZGM4NTQyZGMuLjU0Y2UzNGZkNmZiZGEgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vaW5k
ZXgucnN0CisrKyBiL0RvY3VtZW50YXRpb24vaW5kZXgucnN0CkBAIC0xNDksMjcgKzE0OSwxMSBA
QCBBcmNoaXRlY3R1cmUtYWdub3N0aWMgZG9jdW1lbnRhdGlvbgogQXJjaGl0ZWN0dXJlLXNwZWNp
ZmljIGRvY3VtZW50YXRpb24KIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCgot
VGhlc2UgYm9va3MgcHJvdmlkZSBwcm9ncmFtbWluZyBkZXRhaWxzIGFib3V0IGFyY2hpdGVjdHVy
ZS1zcGVjaWZpYwotaW1wbGVtZW50YXRpb24uCi0KIC4uIHRvY3RyZWU6OgogICAgOm1heGRlcHRo
OiAyCgotICAgYXJtL2luZGV4Ci0gICBhcm02NC9pbmRleAotICAgaWE2NC9pbmRleAotICAgbTY4
ay9pbmRleAotICAgbWlwcy9pbmRleAotICAgbmlvczIvaW5kZXgKLSAgIG9wZW5yaXNjL2luZGV4
Ci0gICBwYXJpc2MvaW5kZXgKLSAgIHBvd2VycGMvaW5kZXgKLSAgIHJpc2N2L2luZGV4Ci0gICBz
MzkwL2luZGV4Ci0gICBzaC9pbmRleAotICAgc3BhcmMvaW5kZXgKLSAgIHg4Ni9pbmRleAotICAg
eHRlbnNhL2luZGV4CisgICBhcmNoCisKCiBPdGhlciBkb2N1bWVudGF0aW9uCiAtLS0tLS0tLS0t
LS0tLS0tLS0tCi0tCjIuMzAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
