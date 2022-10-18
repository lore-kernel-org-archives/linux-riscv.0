Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27C82C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Oct 2022 08:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=krDlvgPwczs2VZFm0q8jkzbAgsWF8ycPoby00IwpolI=; b=J7yu5SYIchqOKc
	nyJd8AfR61sN8I4EFcluczYZ6RkuF87PWh407K5kyNsBL+rczc+PRy/oMs0hR6S7uFYmJjCRXqdlj
	LqTfPruLpYyxiAiJJbpKJyUH1PzLvnQOF+UnmyL3XUD6ZCkPuqqCxReWl41SPOHMkCOuBoVeE4knP
	hyfYuYNG+6Umy9hhA2+oR5UDUidrGz/TGgUB/DAZIh3VBBzBs+nCuENQMzsH1t/Iy8fI2lJTaA6DJ
	VVfHYdTppIY9rhMYxjyyf227IqakKpfHZ4pj37qciciybCVi+N3imMMNQUl9Yq8yY2XS8VYyKaJIC
	Nhj0KBW5utBHuBQr5KKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oki6o-004Pd6-RR; Tue, 18 Oct 2022 08:37:58 +0000
Received: from forward502p.mail.yandex.net ([2a02:6b8:0:1472:2741:0:8b7:121])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oki6l-004Pbe-Er
	for linux-riscv@lists.infradead.org; Tue, 18 Oct 2022 08:37:58 +0000
Received: from myt5-01d0fbe499ab.qloud-c.yandex.net (myt5-01d0fbe499ab.qloud-c.yandex.net [IPv6:2a02:6b8:c12:4619:0:640:1d0:fbe4])
	by forward502p.mail.yandex.net (Yandex) with ESMTP id 80C5FB813D7;
	Tue, 18 Oct 2022 11:37:45 +0300 (MSK)
Received: by myt5-01d0fbe499ab.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id De7APUMdkR-bhjauMNW;
	Tue, 18 Oct 2022 11:37:44 +0300
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cloudbear.ru; s=mail; t=1666082264;
	bh=O/aLXJ9lXqxBSKb7Iw6TeIPKueBC7MmAtzgFH9soM1Q=;
	h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
	b=f6AEU3u7+p/wBdNG6VUVUipJSBrR3xu5peXqme4Lr8vEMGSAPv2hsKv9ghIdkztk+
	 FBvsIlrmCxo3cPAQq7ZWXrNizukkXDAPyprvaN89Y7ZHq3llEngsPEkHf5rhjRgqb2
	 LgZp3V3J78+k6pmXR8AbpoAcNX5i6fYcnxsiSO6o=
Authentication-Results: myt5-01d0fbe499ab.qloud-c.yandex.net; dkim=pass header.i=@cloudbear.ru
Message-ID: <4d818fb4-e182-f489-d227-d6da506803d5@cloudbear.ru>
Date: Tue, 18 Oct 2022 11:37:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: Bug report: cpu_relax call from vdso space
To: Atish Patra <atishp@atishpatra.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Dao Lu <daolu@rivosinc.com>, linux-riscv@lists.infradead.org
References: <3815b200-a9e2-a3db-c7f1-1e3f86dbab3f@cloudbear.ru>
 <CAOnJCUKeszH7Q6n+jdvBZkL90b7DasWqoO4VT6QU4-kaZSMwUQ@mail.gmail.com>
Content-Language: ru
From: Denis Ivanov <denis.ivanov@cloudbear.ru>
In-Reply-To: <CAOnJCUKeszH7Q6n+jdvBZkL90b7DasWqoO4VT6QU4-kaZSMwUQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_013756_079295_153901D5 
X-CRM114-Status: UNSURE (   7.87  )
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

VGhhdCBzb3VuZHMgcmVhc29uYWJsZS4gVGhhbmtzLgoKMTAvMTcvMjAyMiA4OjU0IFBNLCBBdGlz
aCBQYXRyYSDQv9C40YjQtdGCOgo+IE9uIFNhdCwgT2N0IDE1LCAyMDIyIGF0IDEyOjA5IEFNIERl
bmlzIEl2YW5vdiA8ZGVuaXMuaXZhbm92QGNsb3VkYmVhci5ydT4gd3JvdGU6Cj4+IEhlbGxvLAo+
Pgo+PiBTZWdtZW50YXRpb24gZmF1bHQgbWF5IGJlIHJhaXNlZCBmcm9tIGNwdV9yZWxheCgpCj4+
IChhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Zkc28vcHJvY2Vzc29yLmgpLgo+Pgo+PiBjcHVfcmVs
YXgoKSBtYXkgYmUgY2FsbGVkIGZyb20gdkRTTyBmdW5jdGlvbnMgKGV4Ogo+PiBfX3Zkc29fY2xv
Y2tfZ2V0dGltZSkuIFRoaXMgbWVhbnMgdGhhdCBnbG9iYWwgJ3Jpc2N2X2lzYV9leHRfa2V5cycK
Pj4gdmFyaWFibGUgbXVzdCBub3QgYmUgdXNlZCBpbiBjcHVfcmVsYXgoKSBkaXJlY3RseS4KPj4K
Pj4gVXNlIG9mIHRoaXMgYXJyYXkgd2FzIGFkZGVkIHRvIGNwdV9yZWxheCgpIGluCj4+IGh0dHBz
Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3Jpc2N2L2xpbnV4Lmdp
dC9jb21taXQvP2g9Zml4ZXMmaWQ9OGViMDYwZTEwMTg1Y2ZjOTdlZjAyMDBkMTk3ZWMyNDZiYTBm
OWY4Ywo+Pgo+IFRoYW5rcy4gV2Ugc2F3IHNvbWUgb3RoZXIgaXNzdWVzIHdpdGggdGhlIHN0YXRp
YyBrZXkgaW4gY3B1X3JlbGF4IHBhdGggYXMgd2VsbC4KPgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2xpbnV4LXJpc2N2LzIwMjIwOTIyMDYwOTU4LjQ0MjAzLTEtc2FtdWVsQHNob2xsYW5kLm9y
Zy8KPgo+IFdlIG1heSByZW1vdmUgdGhlIHN0YXRpYyBrZXkgYWx0b2dldGhlciBmcm9tIHRoYXQg
cGF0aC4KPgo+PiBEZW5pcyBJdmFub3YKPj4KPj4KPj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4+IGxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo+Cj4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
