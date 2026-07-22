Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41973C4451C
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 06:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qQEU0J4il/EVghLeVuQPbIlgfEustsFs0sCWKRlp+0I=; b=LT7PYKnoHrLadt
	cfPkkfPo4p5onoNCafypTR1ZsvyXpNkvF+FBJx3DGJ2Vew8yJcrfZg6J5D+YWWbrbCF+cg0mbnBP+
	4F908UcrDJND5ax6vuoYhipjFhPv1reZlyBn2sR9h2wm7qiDRkC7Ft3Ds85ZD5+7fYmTZ/40jx30U
	H9YuMwn5iC85bIlLtr6TVv/+p2RbfM8jXGonBAKKbB0pmZgNF6niVBVeu27SHLC+R1fOAkJB6mXmh
	E3Di5Ni5TpvcP42jk/5W/IE/niRS7ADa2Q/brITRLy/j2kQ3cNGtCGysajaB3zF0NIpF++jjTkrRA
	eX6J1zL0/XvrJ8W2m8ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmQg2-0000000AzEw-31Wi;
	Wed, 22 Jul 2026 06:43:34 +0000
Received: from mxhk.zte.com.cn ([160.30.148.34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmQfz-0000000AzEI-1jmf
	for linux-riscv@lists.infradead.org;
	Wed, 22 Jul 2026 06:43:33 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4h4l7x3MCkz5B101;
	Wed, 22 Jul 2026 14:43:25 +0800 (CST)
Received: from szxl2zmapp06.zte.com.cn ([10.1.32.108])
	by mse-fl2.zte.com.cn with SMTP id 66M6hIud024364;
	Wed, 22 Jul 2026 14:43:18 +0800 (+08)
	(envelope-from gao.rui@zte.com.cn)
Received: from localhost.localdomain (unknown [10.234.74.162])
	by smtp (Zmail) with SMTP;
	Wed, 22 Jul 2026 14:43:20 +0800
X-Zmail-TransId: 3e816a60668700d-a0a69
X-Zmail-LocalSMTP: 1
X-ZMAIL-USEORIGINALEMLTOOUTBOUND: 1
X-Zmail-RealSender: gao.rui@zte.com.cn
From: Gao Rui <gao.rui@zte.com.cn>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Feng Jiang <jiangfeng@kylinos.cn>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        Gao Rui <gao.rui@zte.com.cn>
Subject: [PATCH 0/2] riscv: strnlen ZBB overflow fix and test coverage
Date: Wed, 22 Jul 2026 14:40:25 +0800
Message-ID: <20260722064037.1111467-1-gao.rui@zte.com.cn>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-MAIL: mse-fl2.zte.com.cn 66M6hIud024364
X-TLS: YES
X-ENVELOPE-SENDER: gao.rui@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Wed, 22 Jul 2026 14:43:25 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A60668D.000/4h4l7x3MCkz5B101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_234331_621739_B041A3AF 
X-CRM114-Status: UNSURE (   8.96  )
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

SGkgYWxsLAoKSSBub3RpY2VkIHRoZSBlYXJsaWVyIHBhdGNoIGZyb20gTWljaGFlbCBOZXVsaW5n
OgpodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDI2MDQxMzAxMDczOC4xNjIy
NDIzLTEtbWlrZXlAbmV1bGluZy5vcmcvCndoaWNoIGFkanVzdGVkIHRoZSBib3VuZGFyeSBjYWxj
dWxhdGlvbiBpbiBzdHJubGVuLiBIb3dldmVyLCB0aGF0IGZpeAppcyBub3QgY29tcGxldGUg4oCU
IGluIG1hbnkgY2FzZXMgdGhlIGBjb3VudGAgdmFsdWUgaXRzZWxmIGNhbiBvdmVyZmxvdywKbGVh
ZGluZyB0byBpbmNvcnJlY3QgYmVoYXZpb3IuIFRoaXMgc2VyaWVzIGFkZHJlc3NlcyB0aG9zZSBt
aXNzaW5nCmNhc2VzIGJ5IGFkZGluZyBleHBsaWNpdCBmYWxsYmFjayBsb2dpYyBmb3IgU0laRV9N
QVggYW5kIG92ZXJmbG93CmNvbmRpdGlvbnMsIGFuZCBleHRlbmRzIEtVbml0IGNvdmVyYWdlIHRv
IHZhbGlkYXRlIHRoZSBuZXcgYmVoYXZpb3IuCgpQYXRjaCAxLzI6CiAgcmlzY3Y6IHN0cm5sZW46
IGZpeCBaQkIgcGF0aCBvdmVyZmxvdyBhbmQgU0laRV9NQVggZmFsbGJhY2sKICAtIEFkZCBmYWxs
YmFjayB0byBnZW5lcmljIHBhdGggd2hlbiBjb3VudCA9PSBTSVpFX01BWAogIC0gQWRkIG92ZXJm
bG93IGNoZWNrIGZvciAocyArIGNvdW50KQogIC0gUmVmYWN0b3IgYWxpZ25lZCBib3VuZGFyeSBj
YWxjdWxhdGlvbgogIC0gQWRkIGZhc3QgZXhpdCBmb3IgZmlyc3Qgd29yZCBjYXNlCiAgLSBTaW1w
bGlmeSBnZW5lcmljIHBhdGggbG9vcAoKUGF0Y2ggMi8yOgogIGt1bml0OiBzdHJpbmc6IGFkZCBz
dHJubGVuIFNJWkVfTUFYIHRlc3QgY292ZXJhZ2UKICAtIEFkZCBleHBsaWNpdCB0ZXN0IGNhc2Ug
Zm9yIHN0cm5sZW4ocywgU0laRV9NQVgpCiAgLSBFbnN1cmUgZmFsbGJhY2sgcmV0dXJucyBjb3Jy
ZWN0IGxlbmd0aCBmb3Igbm9uLXRlcm1pbmF0ZWQgc3RyaW5ncwogIC0gQ29tcGxlbWVudHMgZXhp
c3RpbmcgYm91bmRhcnkgdGVzdHMKCkdhbyBSdWkgKDIpOgogIHJpc2N2OiBzdHJubGVuOiBmaXgg
WkJCIHBhdGggb3ZlcmZsb3cgYW5kIFNJWkVfTUFYIGZhbGxiYWNrCiAga3VuaXQ6IHN0cmluZzog
YWRkIHN0cm5sZW4gU0laRV9NQVggdGVzdCBjb3ZlcmFnZQoKIGFyY2gvcmlzY3YvbGliL3N0cm5s
ZW4uUyB8IDQwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0KIGxpYi90
ZXN0cy9zdHJpbmdfa3VuaXQuYyB8IDEzICsrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwg
NDQgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCi0tIAoyLjI3LjAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
