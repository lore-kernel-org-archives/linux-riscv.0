Return-Path: <SRS0=MNS6=4D=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A722C7114D
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 15 Feb 2020 11:50:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D6962073A
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 15 Feb 2020 11:50:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KKvNT4RV";
	dkim=pass (1024-bit key) header.d=web.de header.i=@web.de header.b="mJKgCbiZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D6962073A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=web.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:MIME-Version:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aDjOBugZQ0SawLe+YxF3NbyjsZWKVVzA64MmA1w5uAk=; b=KKvNT4RVyJlLOP
	yv3dUN1ZfPH6+wvg4tbUbJgbEQsReMHPaigzObHV+gNmWu6yPUanMIm8JU9L09hvPQAZ63qcxQBLo
	WtE4eTO7S5APNVpA2Iqf9W1ID7UDTfyPOkk7zoi4cnZAbLZReCDCi8LC23mmaKX+TG5W8jNYfKOwf
	zRKa9ILrk14+una1AwZLDIWKrGBvsoKGV7xpnFVrkr2z9FKvrooKKssJkX80MGx+jMNv1eMXD3KAg
	PeYA6YhUKH1yGI5gm/lTZTPZv0YQHQDXofm940TiObEHvU21YfGcEfDlTGgx2sryvjuZpFtHiREFQ
	AgajEL1uz7m0rZuyqJPg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j2vxv-00035W-Kz; Sat, 15 Feb 2020 11:50:31 +0000
Received: from mout.web.de ([217.72.192.78])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2vxr-000321-7n
 for linux-riscv@lists.infradead.org; Sat, 15 Feb 2020 11:50:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1581767418;
 bh=AKoI1ErJ1F/3SpqbaXivBShhVSF+4DVb1UPwPn9K9xA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References:
 In-Reply-To:References;
 b=mJKgCbiZ6DsG9pBjmp7Q/rVR1rt+ZjyUt4bwBodh29xfJDK95Hf8fOWZ8V8r1/D/D
 946137HXeT5QJiUdRyX0Y6wU6z4SJ7eloxGf9Z4hlu2mnrBH29k/ZCsurRKceJ3R3d
 LASFjszsZAHIzYwQdfkUVh82xOKaMRoU4Nrs4jLE=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.ww002.siemens.net ([95.157.55.156]) by smtp.web.de
 (mrweb102 [213.165.67.124]) with ESMTPSA (Nemesis) id
 0MgO8g-1io06e15Py-00NgBR; Sat, 15 Feb 2020 12:50:18 +0100
From: Jan Kiszka <jan.kiszka@web.de>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org
Subject: [PATCH v2 3/3] riscv: Fix crash when flushing executable ioremap
 regions
Date: Sat, 15 Feb 2020 12:49:44 +0100
Message-Id: <8a555b0b0934f0ba134de92f6cf9db8b1744316c.1581767384.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1581767384.git.jan.kiszka@web.de>
References: <cover.1581767384.git.jan.kiszka@web.de>
In-Reply-To: <cover.1581767384.git.jan.kiszka@web.de>
References: <cover.1581767384.git.jan.kiszka@web.de>
X-Provags-ID: V03:K1:3afGuyjXHZCaYg9y6mqcxZGBFQUaKdU7SqI4fBIhgjLUotUcjdu
 VuaSdTlCtsF3UnKqxPCCuX3NSTqYet+hsYgyVjRvAtcglfc77wGgfKg+q7l0b+vgEzSXcNM
 CiUzO8c4RrB3QFdyLZ+qc7PDN/+V1/qFsrrpPM56toO4IU9MQKuZcZYGhSJu63JCbKnsU7S
 ZlR79w+tspHae7bOSXjzA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+JySpZD7Yok=:62+NnABRoebGkDXmyK+Xd0
 eIJzRv8R5y2HGLiph7dktdAh0js3t0mQv4c2wcwhvcmveAgBoNukvjArwWPZ1xJizFVJSnpMA
 T3RUtWXubYB/CYg5SHFgKRGYO8kTC75cQJaYw+oBcwlpmV2yQiDH6PdhAQTv2bPn6AkLWfYjK
 GU26KrfV5KMVSaVaufxWdY3bi99mEUq8hXTHCXUh8OfKs/NBUOUW3KFjUzncjXh7Ma6mNvSiy
 lv6sWnRtg4Qi8LnQcsI3NpGtbZGsOC60A11lgT5qj71vAlzawDn+u69zhg0WLvEfCdT/2yGHU
 aHnGP9/660kNYKEk9c4Pkwph32RGBzxYJjJOP3Bx238unJ2wV4f0K+WZwz8lCjdO7PTA28Qol
 vgFFah1+fg+aCriLfS7xuW7C6PgBAD/I7APg7Gb4N4ZOAysN/JI/Yfz8j3QlR6ljh1jBkkwjC
 QY1hyt0n/Qs+VluYFX08NJ3PNxcXiT6xLZ+dK/NRyRBGio0DrsWe41Uqghs7sVF+w2l5lck2F
 8DsI1A7BRs2MsRgSWgVHIB/UjhePROJOHNx2Wb08qblh9aODzTVOGiuj0E/NXWHZm6vlrOsOm
 e/ylsWEdqfuFKzLEuweXpenDl2TS1ZePSQY8dMvxg/kbD4FEZo0pAcNnJ44re6chXxgmUMw7j
 pyg3ubd9Lc1lMdFVzsp/bJe8LdMvAFDecJbuti4Q7zUOaOd+IYXBjYSLAzpMbaY3TZuU6pmrB
 n+52WvX0fvou7EHsREhNu3GyLkDjCTfXzEm/Mlw69mD0SXd14nyhKG/uzHTrcPqMBZDP7J0Q+
 4iVMRbrN3FV6h+nfYMSz3uRXd0zETqklRNxTKx17xU4nXt5NWCijmijRpf4f/AyaWfFNBp3bL
 LtncCTLT/I7qQiZnMPX2L+GRblBVV76VcrRmalGL4LI1tOm3gEJZNCxsDwKLSwt/oaxDMfcMS
 GUoeUQfkBWDgzNNocWAgBXSuoD73Z/Iev5BHmUT1vmhlnDjrOSdAwfJcMo6sj5U0ppwO5lPjf
 MALXxYkWxyEbSflZGkm4CyRibJAi04OzvUx3hWG3Y20yo/FYzktlMa6rItC0XGD2VdDwnewcw
 I0GqOgNfqJ9eM04gNnTxnw52AkI+NWe/HTdAjDHheGoKPX+oIlVB5OY7eYiI324KrPPOQ8byj
 PE4SKupY9fqqQYl4CwUV7f02ljqg01s5bW86QGrwBrd09KzWfqJ6BJ2gz/CIEAKGLY+oNlxPq
 gqLhcti884KhbRp+y
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200215_035027_588636_93327AC3 
X-CRM114-Status: UNSURE (   7.72  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-kernel@vger.kernel.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

From: Jan Kiszka <jan.kiszka@siemens.com>

Those are not backed by page structs, and pte_page is returning an
invalid pointer.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
=2D--
 arch/riscv/mm/cacheflush.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index 8930ab7278e6..9ee2c1a387cc 100644
=2D-- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -84,7 +84,8 @@ void flush_icache_pte(pte_t pte)
 {
 	struct page *page =3D pte_page(pte);

-	if (!test_and_set_bit(PG_dcache_clean, &page->flags))
+	if (!pfn_valid(pte_pfn(pte)) ||
+	    !test_and_set_bit(PG_dcache_clean, &page->flags))
 		flush_icache_all();
 }
 #endif /* CONFIG_MMU */
=2D-
2.16.4


