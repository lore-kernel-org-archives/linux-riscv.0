Return-Path: <SRS0=OdZr=L5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5825C07E9B
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jul 2021 23:26:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51E9D60FD8
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jul 2021 23:26:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51E9D60FD8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=etorok.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RVKHbacuVvLPzUd5DD9r5TnuSjHqC3euu5DIe1TcdS4=; b=JibJg8JyivyB1w
	DduQn5sC2dqtsLbt89nWiHD0q+tD1wq1OXrCIIkL+CF9TIneybP4+bx5T2iQV5o58jf+5NZq3lPw8
	OdNQlpswPWgpgwH4sSsWTYrtK6/byxCSv1w2ulK7PYvDESSiBDJa8P5GKcptdY0ltJf7ru73IfGjp
	ltFUhG0/0Wf4xUBfTip/083XLzu65BL7Ort3Wkbm/EjGuKX9RkO6DhrNh562Ibuz34hA8ABMcP3eg
	MtOYgv2SE3bAExJXLrsVMDAQnWgOC+lw5fKkqimY8DIeSe4i9G590AA6X/CdRM/B3U5S4mrEA6gNa
	Im73pDl/EfhitWxgCRwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0Xym-00A15K-Fm; Mon, 05 Jul 2021 23:26:20 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0Xyh-00A13F-6T
 for linux-riscv@lists.infradead.org; Mon, 05 Jul 2021 23:26:17 +0000
Received: (Authenticated sender: edwin@etorok.net)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 08462200004;
 Mon,  5 Jul 2021 23:26:10 +0000 (UTC)
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin@etorok.net>
To: linux-riscv@lists.infradead.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin@etorok.net>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@redhat.com>,
 Namhyung Kim <namhyung@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-perf-users@vger.kernel.org
Subject: [PATCH 1/4] tools/perf/arch/riscv: record registers needed for
 --call-graph=dwarf
Date: Tue,  6 Jul 2021 00:25:21 +0100
Message-Id: <20210705232524.4024832-2-edwin@etorok.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210705232524.4024832-1-edwin@etorok.net>
References: <20210705232524.4024832-1-edwin@etorok.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210705_162615_555208_0B91EBA9 
X-CRM114-Status: UNSURE (   9.76  )
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

Rm9yIGxpYmR3LWJhc2VkIGNhbGxncmFwaCBzYW1wbGluZyB0byB3b3JrIHdlIG5lZWQgdG8gc2Ft
cGxlIHJlZ2lzdGVycy4KClRlc3RlZCBvbiBIaUZpdmUgVW5tYXRjaGVkIHdpdGggYSB0cnVuayB2
ZXJzaW9uIG9mIE9DYW1sOgpgYGAKICMgcGVyZiByZWNvcmQgLS11c2VyLXJlZ3M9PwphdmFpbGFi
bGUgcmVnaXN0ZXJzOiBwYyByYSBzcCBncCB0cCB0MCB0MSB0MiBzMCBzMSBhMCBhMSBhMiBhMyBh
NCBhNSBhNiBhNwogczIgczMgczQgczUgczYgczcgczggczkgczEwIHMxMSB0MyB0NCB0NSB0NgoK
ICMgc2VkIC1lICdzLyhcKlwqLy8nIC1lICdzL1wqXCopLy8nIFwKdGVzdHN1aXRlL3Rlc3RzL21p
c2MtdW5zYWZlL2FsbWFiZW5jaC5tbCA+YWxtYWJlbmNoX2JlbmNobWFyay5tbAogIyBvY2FtbG9w
dCBhbG1hYmVuY2hfYmVuY2htYXJrLm1sIC11bnNhZmUgLW8gYWxtYWJlbmNoX2JlbmNobWFyawog
IyBwZXJmIHJlY29yZCAtZSBjcHUtY2xvY2sgLXYgLS1jYWxsLWdyYXBoPWR3YXJmIC1GIDk5IFwK
Li9hbG1hYmVuY2hfYmVuY2htYXJrCgpjYWxsY2hhaW46IHR5cGUgRFdBUkYKY2FsbGNoYWluOiBz
dGFjayBkdW1wIHNpemUgODE5Mgpucl9jYmxvY2tzOiAwCmFmZmluaXR5OiBTWVMKbW1hcCBmbHVz
aDogMQpjb21wIGxldmVsOiAwCm1tYXAgc2l6ZSA1MjgzODRCCm1tYXAgc2l6ZSA1MjgzODRCCkNv
bnRyb2wgZGVzY3JpcHRvciBpcyBub3QgaW5pdGlhbGl6ZWQKMCAxNy4wMCAtMjYuMDYKMSAxMi4z
NCAxLjI5CjIgNi44MyAyMi45NQozIDAuMDQgLTEuMjYKNCAyLjMwIDEyLjU0CjUgMi45MyAxNC4z
NQo2IDIxLjI3IC0xNi41Nwo3IDIwLjQxIC0xOS4wNApbIHBlcmYgcmVjb3JkOiBXb2tlbiB1cCA2
NSB0aW1lcyB0byB3cml0ZSBkYXRhIF0KTG9va2luZyBhdCB0aGUgdm1saW51eF9wYXRoICg4IGVu
dHJpZXMgbG9uZykKRmFpbGVkIHRvIG9wZW4gL3Byb2Mva2NvcmUuCk5vdGUgL3Byb2Mva2NvcmUg
cmVxdWlyZXMgQ0FQX1NZU19SQVdJTyBjYXBhYmlsaXR5IHRvIGFjY2Vzcy4KVXNpbmcgL3Byb2Mv
a2FsbHN5bXMgZm9yIHN5bWJvbHMKZmFpbGVkIHRvIHdyaXRlIGZlYXR1cmUgQ1BVREVTQwpmYWls
ZWQgdG8gd3JpdGUgZmVhdHVyZSBDUFVJRApmYWlsZWQgdG8gd3JpdGUgZmVhdHVyZSBOVU1BX1RP
UE9MT0dZCmZhaWxlZCB0byB3cml0ZSBmZWF0dXJlIE1FTV9UT1BPTE9HWQpbIHBlcmYgcmVjb3Jk
OiBDYXB0dXJlZCBhbmQgd3JvdGUgMTYuMjY1IE1CIHBlcmYuZGF0YSAoMTk5NyBzYW1wbGVzKSBd
CgogIyBwZXJmIHNjcmlwdAouLi4KYWxtYWJlbmNoX2JlbmNoICAxMTkzIDE0ODE2LjM5OTIzNTog
ICAxMDEwMTAxMCBjcHUtY2xvY2s6CiAzZmJiZDYzZDU0IHJlZHVjZV9zaW5jb3MrMHgyNjggKGlu
bGluZWQpCiAzZmJiZDYzZDU0IF9fY29zKzB4MjY4ICgvbGliL2xpYm0tMi4zMy5zbykKIDJhYWM0
YjI2MWIgQWxtYWJlbmNoX2JlbmNobWFyay5wbGFuZXRwdisweDI1ZgogICAgKC9ob21lL3Jvb3Qv
b2NhbWwvYWxtYWJlbmNoX2JlbmNobWFyaykKIDJhYWM0YjNlMDMgQWxtYWJlbmNoX2JlbmNobWFy
ay5lbnRyeSsweDEyYmIKICAgICgvaG9tZS9yb290L29jYW1sL2FsbWFiZW5jaF9iZW5jaG1hcmsp
CiAyYWFjNGIwMDk3IGNhbWxfcHJvZ3JhbSsweDE0MwogICAgKC9ob21lL3Jvb3Qvb2NhbWwvYWxt
YWJlbmNoX2JlbmNobWFyaykKIDJhYWM0ZTRlM2QgY2FtbF9zdGFydF9wcm9ncmFtKzB4NzEKICAg
ICgvaG9tZS9yb290L29jYW1sL2FsbWFiZW5jaF9iZW5jaG1hcmspCiAyYWFjNGU1NDA5IGNhbWxf
c3RhcnR1cF9jb21tb24rMHgxOGYKICAgICgvaG9tZS9yb290L29jYW1sL2FsbWFiZW5jaF9iZW5j
aG1hcmspCiAyYWFjNGU1NDY1IGNhbWxfc3RhcnR1cF9leG4rMHg5IChpbmxpbmVkKQogMmFhYzRl
NTQ2NSBjYW1sX3N0YXJ0dXArMHg5IChpbmxpbmVkKQogMmFhYzRlNTQ2NSBjYW1sX21haW4rMHg5
CiAgICAoL2hvbWUvcm9vdC9vY2FtbC9hbG1hYmVuY2hfYmVuY2htYXJrKQogMmFhYzRhZmU4OSBt
YWluKzB4OQogICAgKC9ob21lL3Jvb3Qvb2NhbWwvYWxtYWJlbmNoX2JlbmNobWFyaykKIDNmYmJj
NDdiMGIgX19saWJjX3N0YXJ0X21haW4rMHg4NSAoL2xpYi9saWJjLTIuMzMuc28pCiAyYWFjNGFm
ZWJiIF9zdGFydCsweDJiICgvaG9tZS9yb290L29jYW1sL2FsbWFiZW5jaF9iZW5jaG1hcmspCmBg
YAoKQ2M6IFBldGVyIFppamxzdHJhIDxwZXRlcnpAaW5mcmFkZWFkLm9yZz4KQ2M6IEluZ28gTW9s
bmFyIDxtaW5nb0ByZWRoYXQuY29tPgpDYzogQXJuYWxkbyBDYXJ2YWxobyBkZSBNZWxvIDxhY21l
QGtlcm5lbC5vcmc+CkNjOiBKaXJpIE9sc2EgPGpvbHNhQHJlZGhhdC5jb20+CkNjOiBOYW1oeXVu
ZyBLaW0gPG5hbWh5dW5nQGtlcm5lbC5vcmc+CkNjOiBQYXVsIFdhbG1zbGV5IDxwYXVsLndhbG1z
bGV5QHNpZml2ZS5jb20+CkNjOiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQGRhYmJlbHQuY29tPgpD
YzogQWxiZXJ0IE91IDxhb3VAZWVjcy5iZXJrZWxleS5lZHU+CkNjOiBsaW51eC1wZXJmLXVzZXJz
QHZnZXIua2VybmVsLm9yZwpDYzogbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpTaWdu
ZWQtb2ZmLWJ5OiBFZHdpbiBUw7Zyw7ZrIDxlZHdpbkBldG9yb2submV0PgotLS0KIHRvb2xzL3Bl
cmYvYXJjaC9yaXNjdi91dGlsL3BlcmZfcmVncy5jIHwgMzIgKysrKysrKysrKysrKysrKysrKysr
KysrKysKIDEgZmlsZSBjaGFuZ2VkLCAzMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdG9v
bHMvcGVyZi9hcmNoL3Jpc2N2L3V0aWwvcGVyZl9yZWdzLmMgYi90b29scy9wZXJmL2FyY2gvcmlz
Y3YvdXRpbC9wZXJmX3JlZ3MuYwppbmRleCAyODY0ZTJlMzc3NmQuLjhjOWY1MTFlODMyMiAxMDA2
NDQKLS0tIGEvdG9vbHMvcGVyZi9hcmNoL3Jpc2N2L3V0aWwvcGVyZl9yZWdzLmMKKysrIGIvdG9v
bHMvcGVyZi9hcmNoL3Jpc2N2L3V0aWwvcGVyZl9yZWdzLmMKQEAgLTIsNSArMiwzNyBAQAogI2lu
Y2x1ZGUgIi4uLy4uL3V0aWwvcGVyZl9yZWdzLmgiCiAKIGNvbnN0IHN0cnVjdCBzYW1wbGVfcmVn
IHNhbXBsZV9yZWdfbWFza3NbXSA9IHsKKwlTTVBMX1JFRyhwYywgUEVSRl9SRUdfUklTQ1ZfUEMp
LAorCVNNUExfUkVHKHJhLCBQRVJGX1JFR19SSVNDVl9SQSksCisJU01QTF9SRUcoc3AsIFBFUkZf
UkVHX1JJU0NWX1NQKSwKKwlTTVBMX1JFRyhncCwgUEVSRl9SRUdfUklTQ1ZfR1ApLAorCVNNUExf
UkVHKHRwLCBQRVJGX1JFR19SSVNDVl9UUCksCisJU01QTF9SRUcodDAsIFBFUkZfUkVHX1JJU0NW
X1QwKSwKKwlTTVBMX1JFRyh0MSwgUEVSRl9SRUdfUklTQ1ZfVDEpLAorCVNNUExfUkVHKHQyLCBQ
RVJGX1JFR19SSVNDVl9UMiksCisJU01QTF9SRUcoczAsIFBFUkZfUkVHX1JJU0NWX1MwKSwKKwlT
TVBMX1JFRyhzMSwgUEVSRl9SRUdfUklTQ1ZfUzEpLAorCVNNUExfUkVHKGEwLCBQRVJGX1JFR19S
SVNDVl9BMCksCisJU01QTF9SRUcoYTEsIFBFUkZfUkVHX1JJU0NWX0ExKSwKKwlTTVBMX1JFRyhh
MiwgUEVSRl9SRUdfUklTQ1ZfQTIpLAorCVNNUExfUkVHKGEzLCBQRVJGX1JFR19SSVNDVl9BMyks
CisJU01QTF9SRUcoYTQsIFBFUkZfUkVHX1JJU0NWX0E0KSwKKwlTTVBMX1JFRyhhNSwgUEVSRl9S
RUdfUklTQ1ZfQTUpLAorCVNNUExfUkVHKGE2LCBQRVJGX1JFR19SSVNDVl9BNiksCisJU01QTF9S
RUcoYTcsIFBFUkZfUkVHX1JJU0NWX0E3KSwKKwlTTVBMX1JFRyhzMiwgUEVSRl9SRUdfUklTQ1Zf
UzIpLAorCVNNUExfUkVHKHMzLCBQRVJGX1JFR19SSVNDVl9TMyksCisJU01QTF9SRUcoczQsIFBF
UkZfUkVHX1JJU0NWX1M0KSwKKwlTTVBMX1JFRyhzNSwgUEVSRl9SRUdfUklTQ1ZfUzUpLAorCVNN
UExfUkVHKHM2LCBQRVJGX1JFR19SSVNDVl9TNiksCisJU01QTF9SRUcoczcsIFBFUkZfUkVHX1JJ
U0NWX1M3KSwKKwlTTVBMX1JFRyhzOCwgUEVSRl9SRUdfUklTQ1ZfUzgpLAorCVNNUExfUkVHKHM5
LCBQRVJGX1JFR19SSVNDVl9TOSksCisJU01QTF9SRUcoczEwLCBQRVJGX1JFR19SSVNDVl9TMTAp
LAorCVNNUExfUkVHKHMxMSwgUEVSRl9SRUdfUklTQ1ZfUzExKSwKKwlTTVBMX1JFRyh0MywgUEVS
Rl9SRUdfUklTQ1ZfVDMpLAorCVNNUExfUkVHKHQ0LCBQRVJGX1JFR19SSVNDVl9UNCksCisJU01Q
TF9SRUcodDUsIFBFUkZfUkVHX1JJU0NWX1Q1KSwKKwlTTVBMX1JFRyh0NiwgUEVSRl9SRUdfUklT
Q1ZfVDYpLAogCVNNUExfUkVHX0VORAogfTsKLS0gCjIuMzEuMQoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
