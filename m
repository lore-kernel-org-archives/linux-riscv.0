Return-Path: <SRS0=MbfZ=KN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB204C433B4
	for <linux-riscv@archiver.kernel.org>; Tue, 18 May 2021 10:21:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64FEC611B0
	for <linux-riscv@archiver.kernel.org>; Tue, 18 May 2021 10:21:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64FEC611B0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jASK8Ayh88DZcPl47iYaK4o57N8zZiaPFdRzR0NEgB8=; b=BDldt3bEtULRpyFJ6oFBaWUhn
	VSX5HUyyPfETY8JnkLStiRK+kPY6nETeLecnKrdrv5FTltiVUII1FPGjveS21b905edXCxgJsxGcw
	KXwibhCXesOHiNiNpyJbMHfodQ8WJa6DgmaVG5ecgqIVwwziyE6Dg0rgpCTHH2FQ0I6RnOaFSVCOu
	Be9s/xtOK0qnFQBBKaMZyUrPt7UxC2FwAnwXgqYr4b5A0MWZCFNv6RxaMSO5Zmrap1wGNdk0FZxYn
	hP4mBWcBSvHrZRhcJNTH4WgvqHPJABuU/lTxMku2DkpsY3IwN+rdvHnzNGl2LES5U2mapvtnHaYvD
	CaPo+mYYg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1liwqJ-000LRj-VY; Tue, 18 May 2021 10:20:52 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liwky-000Jkh-NF
 for linux-riscv@desiato.infradead.org; Tue, 18 May 2021 10:15:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=M9dDDHzMfR3R6pJCYVEIL/GRl5YZ0w6tBTuK0cpNRvY=; b=qXw1iDCMjUOUL/7tCeugGQswhm
 jzlU71VWO/fPWn10KH+Osle9D9RPR/qpiLlYLpQ9Rfnnbv9WGJw2rzuFXX6q+M5Y7m6Efm5Yxqz4F
 VnMxs5gDCVPz22oWfKO0qJ/J3NQnQajRQvHgxIjcOtgktQiJXkitp/v+1vYFsEc7eRVbKF4nn92ul
 HY7Sh8302m20qaZ//aXJQz46g/n/PW4GhLNw+AYFPZkK1c0z4MJH9D2j/OczWPpM5YWF/WjemujJV
 Hp0bOw+s8fbMs/92EGafPpMHQX/MR96OIkPsy+rMfXAh3kXZGFugar+9rK0N7UGlBfW5C4HxZK3IR
 laFigI8g==;
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liwkv-00EYHL-S8
 for linux-riscv@lists.infradead.org; Tue, 18 May 2021 10:15:19 +0000
Received: (Authenticated sender: alex@ghiti.fr)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 2B23C24000D;
 Tue, 18 May 2021 10:15:09 +0000 (UTC)
From: Alexandre Ghiti <alex@ghiti.fr>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>
Subject: [PATCH v6 2/3] powerpc: Move script to check relocations at compile
 time in scripts/
Date: Tue, 18 May 2021 12:12:51 +0200
Message-Id: <20210518101252.1484465-3-alex@ghiti.fr>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210518101252.1484465-1-alex@ghiti.fr>
References: <20210518101252.1484465-1-alex@ghiti.fr>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_031518_064918_BC666168 
X-CRM114-Status: GOOD (  13.59  )
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

UmVsb2NhdGluZyBrZXJuZWwgYXQgcnVudGltZSBpcyBkb25lIHZlcnkgZWFybHkgaW4gdGhlIGJv
b3QgcHJvY2Vzcywgc28KaXQgaXMgbm90IGNvbnZlbmllbnQgdG8gY2hlY2sgZm9yIHJlbG9jYXRp
b25zIHRoZXJlIGFuZCByZWFjdCBpbiBjYXNlIGEKcmVsb2NhdGlvbiB3YXMgbm90IGV4cGVjdGVk
LgoKUG93ZXJwYyBhcmNoaXRlY3R1cmUgaGFzIGEgc2NyaXB0IHRoYXQgYWxsb3dzIHRvIGNoZWNr
IGF0IGNvbXBpbGUgdGltZQpmb3Igc3VjaCB1bmV4cGVjdGVkIHJlbG9jYXRpb25zOiBleHRyYWN0
IHRoZSBjb21tb24gbG9naWMgdG8gc2NyaXB0cy8Kc28gdGhhdCBvdGhlciBhcmNoaXRlY3R1cmVz
IGNhbiB0YWtlIGFkdmFudGFnZSBvZiBpdC4KClNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBHaGl0
aSA8YWxleEBnaGl0aS5mcj4KUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVs
dC5vcmc+Ci0tLQogYXJjaC9wb3dlcnBjL3Rvb2xzL3JlbG9jc19jaGVjay5zaCB8IDE4ICsrLS0t
LS0tLS0tLS0tLS0tLQogc2NyaXB0cy9yZWxvY3NfY2hlY2suc2ggICAgICAgICAgICB8IDIwICsr
KysrKysrKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDE2
IGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNzU1IHNjcmlwdHMvcmVsb2NzX2NoZWNrLnNo
CgpkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL3Rvb2xzL3JlbG9jc19jaGVjay5zaCBiL2FyY2gv
cG93ZXJwYy90b29scy9yZWxvY3NfY2hlY2suc2gKaW5kZXggMDE0ZTAwZTc0ZDJiLi5lMzY3ODk1
OTQxYWUgMTAwNzU1Ci0tLSBhL2FyY2gvcG93ZXJwYy90b29scy9yZWxvY3NfY2hlY2suc2gKKysr
IGIvYXJjaC9wb3dlcnBjL3Rvb2xzL3JlbG9jc19jaGVjay5zaApAQCAtMTUsMjEgKzE1LDggQEAg
aWYgWyAkIyAtbHQgMyBdOyB0aGVuCiAJZXhpdCAxCiBmaQogCi0jIEhhdmUgS2J1aWxkIHN1cHBs
eSB0aGUgcGF0aCB0byBvYmpkdW1wIGFuZCBubSBzbyB3ZSBoYW5kbGUgY3Jvc3MgY29tcGlsYXRp
b24uCi1vYmpkdW1wPSIkMSIKLW5tPSIkMiIKLXZtbGludXg9IiQzIgotCi0jIFJlbW92ZSBmcm9t
IHRoZSBiYWQgcmVsb2NhdGlvbnMgdGhvc2UgdGhhdCBtYXRjaCBhbiB1bmRlZmluZWQgd2VhayBz
eW1ib2wKLSMgd2hpY2ggd2lsbCByZXN1bHQgaW4gYW4gYWJzb2x1dGUgcmVsb2NhdGlvbiB0byAw
LgotIyBXZWFrIHVucmVzb2x2ZWQgc3ltYm9scyBhcmUgb2YgdGhhdCBmb3JtIGluIG5tIG91dHB1
dDoKLSMgIiAgICAgICAgICAgICAgICAgIHcgX2JpbmFyeV9fYnRmX3ZtbGludXhfYmluX2VuZCIK
LXVuZGVmX3dlYWtfc3ltYm9scz0kKCRubSAiJHZtbGludXgiIHwgYXdrICckMSB+IC93LyB7IHBy
aW50ICQyIH0nKQotCiBiYWRfcmVsb2NzPSQoCi0kb2JqZHVtcCAtUiAiJHZtbGludXgiIHwKLQkj
IE9ubHkgbG9vayBhdCByZWxvY2F0aW9uIGxpbmVzLgotCWdyZXAgLUUgJ1w8Ul8nIHwKKyR7c3Jj
dHJlZX0vc2NyaXB0cy9yZWxvY3NfY2hlY2suc2ggIiRAIiB8CiAJIyBUaGVzZSByZWxvY2F0aW9u
cyBhcmUgb2theQogCSMgT24gUFBDNjQ6CiAJIwlSX1BQQzY0X1JFTEFUSVZFLCBSX1BQQzY0X05P
TkUKQEAgLTQzLDggKzMwLDcgQEAgUl9QUENfQUREUjE2X0xPCiBSX1BQQ19BRERSMTZfSEkKIFJf
UFBDX0FERFIxNl9IQQogUl9QUENfUkVMQVRJVkUKLVJfUFBDX05PTkUnIHwKLQkoWyAiJHVuZGVm
X3dlYWtfc3ltYm9scyIgXSAmJiBncmVwIC1GIC13IC12ICIkdW5kZWZfd2Vha19zeW1ib2xzIiB8
fCBjYXQpCitSX1BQQ19OT05FJwogKQogCiBpZiBbIC16ICIkYmFkX3JlbG9jcyIgXTsgdGhlbgpk
aWZmIC0tZ2l0IGEvc2NyaXB0cy9yZWxvY3NfY2hlY2suc2ggYi9zY3JpcHRzL3JlbG9jc19jaGVj
ay5zaApuZXcgZmlsZSBtb2RlIDEwMDc1NQppbmRleCAwMDAwMDAwMDAwMDAuLjEzN2M2NjA0OTlm
MwotLS0gL2Rldi9udWxsCisrKyBiL3NjcmlwdHMvcmVsb2NzX2NoZWNrLnNoCkBAIC0wLDAgKzEs
MjAgQEAKKyMhL2Jpbi9zaAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vci1s
YXRlcgorCisjIEdldCBhIGxpc3Qgb2YgYWxsIHRoZSByZWxvY2F0aW9ucywgcmVtb3ZlIGZyb20g
aXQgdGhlIHJlbG9jYXRpb25zCisjIHRoYXQgYXJlIGtub3duIHRvIGJlIGxlZ2l0aW1hdGUgYW5k
IHJldHVybiB0aGlzIGxpc3QgdG8gYXJjaCBzcGVjaWZpYworIyBzY3JpcHQgdGhhdCB3aWxsIGxv
b2sgZm9yIHN1c3BpY2lvdXMgcmVsb2NhdGlvbnMuCisKK29iamR1bXA9IiQxIgorbm09IiQyIgor
dm1saW51eD0iJDMiCisKKyMgUmVtb3ZlIGZyb20gdGhlIHBvc3NpYmxlIGJhZCByZWxvY2F0aW9u
cyB0aG9zZSB0aGF0IG1hdGNoIGFuIHVuZGVmaW5lZAorI8Kgd2VhayBzeW1ib2wgd2hpY2ggd2ls
bCByZXN1bHQgaW4gYW4gYWJzb2x1dGUgcmVsb2NhdGlvbiB0byAwLgorIyBXZWFrIHVucmVzb2x2
ZWQgc3ltYm9scyBhcmUgb2YgdGhhdCBmb3JtIGluIG5tIG91dHB1dDoKKyMgIiAgICAgICAgICAg
ICAgICAgIHcgX2JpbmFyeV9fYnRmX3ZtbGludXhfYmluX2VuZCIKK3VuZGVmX3dlYWtfc3ltYm9s
cz0kKCRubSAiJHZtbGludXgiIHwgYXdrICckMSB+IC93LyB7IHByaW50ICQyIH0nKQorCiskb2Jq
ZHVtcCAtUiAiJHZtbGludXgiIHwKKwlncmVwIC1FICdcPFJfJyB8CisJKFsgIiR1bmRlZl93ZWFr
X3N5bWJvbHMiIF0gJiYgZ3JlcCAtRiAtdyAtdiAiJHVuZGVmX3dlYWtfc3ltYm9scyIgfHwgY2F0
KQotLSAKMi4zMC4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
