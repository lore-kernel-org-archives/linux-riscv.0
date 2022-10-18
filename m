Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26DBEC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Oct 2022 16:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2t96UUY63sa9erkZ3s2GPeuqFEznc7oTGiJCrF+Btwg=; b=GO7bkxpHvEVUEV
	3G3klVPHs3fHUe+4EG6jhthsCihX6jns/6Ylr/dy+GPur5zlpqoHsNJ9mY5pFobgCxHscozG5adHQ
	okQsqbWOjW35U/yF1q6nNH5vpi2FHxOWBVBcc9V45cIfIFjWWOEWU+f6wZv6378oQpVr4IxPywWbZ
	8QFFfob25qoIMx0bB6n7XLigwG58EPivHaV/FkIR7iTK3el5X6W7If1LbI1nwU72O+fjVxOIFc6r4
	k9iKiw7j6SGqyoLFh3dVoDKaFp1MpNzcQmhhL9upY8MCad6Kom3fteJdzVCfRBaGa4J977ixcY07S
	h11Dvwf0ahgm3AUV3ilw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okpFF-008vh2-W3; Tue, 18 Oct 2022 16:15:10 +0000
Received: from forward500p.mail.yandex.net ([2a02:6b8:0:1472:2741:0:8b7:110])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okpFA-008vfc-Gn
	for linux-riscv@lists.infradead.org; Tue, 18 Oct 2022 16:15:08 +0000
Received: from vla1-27b4fc0f1fa3.qloud-c.yandex.net (vla1-27b4fc0f1fa3.qloud-c.yandex.net [IPv6:2a02:6b8:c0d:4201:0:640:27b4:fc0f])
	by forward500p.mail.yandex.net (Yandex) with ESMTP id 72953F014A9;
	Tue, 18 Oct 2022 19:14:58 +0300 (MSK)
Received: by vla1-27b4fc0f1fa3.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id KdSqNWrqZ8-EuTe7c6L;
	Tue, 18 Oct 2022 19:14:57 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cloudbear.ru; s=mail; t=1666109697;
	bh=Gl1VapB4JdDW4uFVEu96whi966WW8hmGpl0OiFG4jrY=;
	h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
	b=KFOPFVs9EOKhK9UWAZlNuwLYFFgX3MPkfi7BWksWAn7PXXVamze6k1P1VJH+WFH/V
	 QbwQRNIrkMz+U+IQePfP5khXTlibjGwGqlcfLsk1R3arMbhMW9f71BICNbP7qT7i4E
	 C5eynYvXIw6deIluWVzpVzteaLnRKOTLPddPr0yQ=
Authentication-Results: vla1-27b4fc0f1fa3.qloud-c.yandex.net; dkim=pass header.i=@cloudbear.ru
Message-ID: <347936fe-84c9-9955-b12d-f3193d1d0e15@cloudbear.ru>
Date: Tue, 18 Oct 2022 19:14:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: Bug report: cpu_relax call from vdso space
Content-Language: ru
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Dao Lu <daolu@rivosinc.com>, linux-riscv@lists.infradead.org
References: <3815b200-a9e2-a3db-c7f1-1e3f86dbab3f@cloudbear.ru>
 <Y0616eIDlrlGwF3a@xhacker>
From: Denis Ivanov <denis.ivanov@cloudbear.ru>
In-Reply-To: <Y0616eIDlrlGwF3a@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_091505_096124_047BCF45 
X-CRM114-Status: UNSURE (   7.95  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SSBkZWJ1Z2dlZCBzZWdtZW50YXRpb24gZmF1bHQgYWZ0ZXIgbmlnaHRseSByZWdyZXNzaW9uIGZh
aWxzIG9uIExUUCB0ZXN0IAppbm90aWZ5MDkgCihodHRwczovL2dpdGh1Yi5jb20vbGludXgtdGVz
dC1wcm9qZWN0L2x0cC9ibG9iL21hc3Rlci90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2lub3Rp
ZnkvaW5vdGlmeTA5LmMpLgpJbiBrZXJuZWwgY2FsbCBzZXF1ZW5jZSBpcyBmb2xsb3dpbmc6Cl9f
dmRzb19jbG9ja19nZXR0aW1lIC0+IF9fY3Zkc29fY2xvY2tfZ2V0dGltZSAtPiAKX19jdmRzb19j
bG9ja19nZXR0aW1lX2RhdGEgLT4gX19jdmRzb19jbG9ja19nZXR0aW1lX2NvbW1vbiAtPiBkb19o
cmVzIC0+IApjcHVfcmVsYXgKCjEwLzE4LzIwMjIgNToxOSBQTSwgSmlzaGVuZyBaaGFuZyDQv9C4
0YjQtdGCOgo+IE9uIFNhdCwgT2N0IDE1LCAyMDIyIGF0IDEwOjA4OjU1QU0gKzAzMDAsIERlbmlz
IEl2YW5vdiB3cm90ZToKPj4gSGVsbG8sCj4+Cj4+IFNlZ21lbnRhdGlvbiBmYXVsdCBtYXkgYmUg
cmFpc2VkIGZyb20gY3B1X3JlbGF4KCkKPj4gKGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmRzby9w
cm9jZXNzb3IuaCkuCj4+Cj4+IGNwdV9yZWxheCgpIG1heSBiZSBjYWxsZWQgZnJvbSB2RFNPIGZ1
bmN0aW9ucyAoZXg6IF9fdmRzb19jbG9ja19nZXR0aW1lKS4KPj4gVGhpcyBtZWFucyB0aGF0IGds
b2JhbCAncmlzY3ZfaXNhX2V4dF9rZXlzJyB2YXJpYWJsZSBtdXN0IG5vdCBiZSB1c2VkIGluCj4+
IGNwdV9yZWxheCgpIGRpcmVjdGx5Lgo+IEhpLAo+Cj4gQ291bGQgeW91IHBsZWFzZSBzaGFyZSBo
b3cgdG8gcmVwcm9kdWNlIHRoZSBTZWdtZW50IGZhdWx0IHdpdGgKPiBjcHVfcmVsYXgoKT8KPgo+
IFRoYW5rcwo+Cj4+IFVzZSBvZiB0aGlzIGFycmF5IHdhcyBhZGRlZCB0byBjcHVfcmVsYXgoKSBp
bgo+PiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9yaXNj
di9saW51eC5naXQvY29tbWl0Lz9oPWZpeGVzJmlkPThlYjA2MGUxMDE4NWNmYzk3ZWYwMjAwZDE5
N2VjMjQ2YmEwZjlmOGMKPj4KPj4gRGVuaXMgSXZhbm92Cj4+Cj4+Cj4+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IGxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdAo+PiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4+IGh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
