Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A12ACFA457
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Oct 2024 10:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5JeKHGL3U+AnsxsHEtpR5MbWb9/JbtvDoucb378GX/4=; b=Jn92psosN7oYEF
	drhhEd4X5yMwgl4TMOYObvsYoTEg0E4eaUWcDIGbQNBPtkC9K5N6H3Elq5N9RRV4EtjtvIqHfMlRA
	/rkgMC7kI4W91qTZ/LvDHYGnsw8f/41EoTSC3b22KU5WA4RVjKh0wc2tuIUpnZFw35Sythb6oA8+6
	jSpvZw5hmwxAH3urgxL4xVuq5nnbLT7GUSI7ub25wGl0NjJTpyafXF8CewwZ2YzBUcxI+TbHPojYM
	6tbLgv1xnR39LadaCtuArtTiLPRDs22qV1JxifEvr8kF5FKQcs02VvVqNLyvrPZAk+giQoDBgft9o
	lpzH6Ih+R9FZR8FCWM5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3uxT-000000002rj-3CxP;
	Thu, 24 Oct 2024 10:20:47 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3uwh-000000002el-42a6
	for linux-riscv@lists.infradead.org;
	Thu, 24 Oct 2024 10:20:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F32B6A4531E;
	Thu, 24 Oct 2024 10:19:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55805C4CEC7;
	Thu, 24 Oct 2024 10:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729765198;
	bh=1eOymLXp8Il5GG8XBWYJ5u7O1358IpUBrRLlLzVG6p0=;
	h=From:To:Cc:Subject:Date:From;
	b=OchkCHrkdOP4TCE7IstWNbHLx7hok7P32qyw6l54Eq7OCuqbqYe2N1iuqHTAxvviy
	 LVQJqiSIWLinZ0bO7EiF3SlczA6fbf3UG8W46t4hxGVYtJKBgNo2N8No/+qa5JV+Z9
	 FKZSz/UuXrBgpWLrOheUR0wlO18QB1PJa/LMc/TMxSVovw5noSPiIOJqeOfxnJ2TeA
	 NB0TajSgTE4QMjGzbPz/DSaYJr1ECtsyRLuMubUhiq/PVUX7IHZ1J5mDMkfin0bjSB
	 qF0sqgpL+4C6qu0bzKwenKB4xzehTFee3ti36QCSazbpjW4jZtKGlvvOuHdWlR1bwr
	 xMR/z6ijIIXaQ==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	xiao.w.wang@intel.com,
	Andrew Jones <ajones@ventanamicro.com>,
	pulehui@huawei.com,
	Charlie Jenkins <charlie@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-kernel@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Pu Lehui <pulehui@huaweicloud.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
Subject: [PATCH v4 0/2]  RISC-V: clarify what some RISCV_ISA* config options do & redo Zbb toolchain dependency
Date: Thu, 24 Oct 2024 11:19:39 +0100
Message-ID: <20241024-aspire-rectify-9982da6943e5@spud>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2294; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=cQHZLXl0Lem86H8PfivnwWB967sopbzxoPR7jwhqlyo=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDOlS8vaSm3muyWy+r7A4Y2WLnfXsf42ni84encV7PSX7B Vv2fYaMjlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAExEeTcjw2LbyeJmR9wkz6W8 S/fhCDju+/TsFpGvs0/HLb+yc21axQyGf2oPJ3veY9ERllqm8iB4VXCf1k6FKamLma8cin+1vTt GmQ0A
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_032000_159594_91681204 
X-CRM114-Status: GOOD (  11.71  )
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

RnJvbTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KClNpbmNlIG9u
ZSBkZXBlbmRzIG9uIHRoZSBvdGhlciwgYWxiZWl0IHRyaXZpYWxseSwgaGVyZSdzIGEgdjQgb2Yg
dGhlIFpiYgp0b29sY2hhaW4gZGVwIHJlbW92YWwgYWxvbmdzaWRlIHRoZSByZXdvcmRpbmcgb2Yg
S2NvbmZpZyBvcHRpb25zIEknZApzZW50IG91dCBiZWZvcmUgdGhlIG1lcmdlIHdpbmRvdy4gSSB0
aGluayBJIGxpa2UgdGhpcyBpbXBsZW1lbnRhdGlvbgpiZXR0ZXIgdGhhbiB2MSwgYnV0IEkgY291
bGRuJ3QgdGhpbmsgb2YgYSBnb29kIG5hbWUgZm9yIGEgInB1YmxpYyIKdmVyc2lvbiBvZiBfX0FM
VEVSTkFUSVZFKCksIHNvIEkgdXNlZCBpdCBoZXJlIGRpcmVjdGx5LgpVbmZvcnR1bmF0ZWx5ICJB
TFRFUk5BVElWRV8yX0NGRyIgYWxyZWFkeSBleGlzdHMgYW5kIEkgY291bGRuJ3QgdGhpbmsgb2YK
YSBnb29kIHdheSB0byBuYW1lIGFuIGFsdGVybmF0aXZlIG1hY3JvIHRoYXQgYWxsb3dzIGZvciBz
ZXZlcmFsIGNvbmZpZwpvcHRpb25zIHRoYXQgZGlkbid0IG1ha2UgdGhlIGRpc3RpbmN0aW9uIHN1
ZmZpY2llbnRseSBjbGVhci4uIFllbGwKaWYgeW91IGhhdmUgYmV0dGVyIHN1Z2dlc3Rpb25zIHRo
YW4gSSBkaWQuCgpJIGFtIGEgd2VlIGJpdCAid29ycmllZCIgdGhhdCB0aGlzIG1ha2VzIHRoZSBL
Y29uZmlnIG9wdGlvbiBjb25mdXNpbmcgYXMKaXQgaXNuJ3QgaW1tZWRpYXRlbHkgb2J2aW91cyBp
ZiBzb21lb25lIGlzIG9yIGlzIG5vdCBnb2luZyB0byBnZXQgdGhlCnRvb2xjaGFpbiBiYXNlZCBv
cHRpbWlzYXRpb25zLgoKQ2hlZXJzLApDb25vci4KCnY0OgotIHJlYmFzZSBzaW5jZSBpdCdzIGJl
ZW4gYSBmZXcgbW9udGhzCi0gY2hhbmdlIHNvbWUgd29yZGluZyBBbGV4IHdhc24ndCBmb25kIG9m
IGluIHBhdGNoIDEKLSByZW1vdmUgYSBsZWZ0IG92ZXIgQ09ORklHX1JJU0NWX0lTQV9aQkJfQUxU
IGZyb20gdGhlIHYxIGltcGxlbWVudGF0aW9uCiAgaW4gcGF0Y2ggMgoKQ0M6IHhpYW8udy53YW5n
QGludGVsLmNvbQpDQzogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KQ0M6
IHB1bGVodWlAaHVhd2VpLmNvbQpDQzogQ2hhcmxpZSBKZW5raW5zIDxjaGFybGllQHJpdm9zaW5j
LmNvbT4KQ0M6IFBhdWwgV2FsbXNsZXkgPHBhdWwud2FsbXNsZXlAc2lmaXZlLmNvbT4KQ0M6IFBh
bG1lciBEYWJiZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+CkNDOiBDb25vciBEb29sZXkgPGNvbm9y
LmRvb2xleUBtaWNyb2NoaXAuY29tPgpDQzogbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpDQzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZwpDQzogU2FtdWVsIEhvbGxhbmQgPHNh
bXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+CkNDOiBQdSBMZWh1aSA8cHVsZWh1aUBodWF3ZWljbG91
ZC5jb20+CkNDOiBCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJuZWwub3JnPgpDQzogQW5kcmV3IEpv
bmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KQ0M6IFBhdWwgV2FsbXNsZXkgPHBhdWwud2Fs
bXNsZXlAc2lmaXZlLmNvbT4KQ0M6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+
CkNDOiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCgpDb25vciBEb29sZXkgKDIpOgog
IFJJU0MtVjogY2xhcmlmeSB3aGF0IHNvbWUgUklTQ1ZfSVNBKiBjb25maWcgb3B0aW9ucyBkbwog
IFJJU0MtVjogc2VwYXJhdGUgWmJiIG9wdGltaXNhdGlvbnMgcmVxdWlyaW5nIGFuZCBub3QgcmVx
dWlyaW5nCiAgICB0b29sY2hhaW4gc3VwcG9ydAoKIGFyY2gvcmlzY3YvS2NvbmZpZyAgICAgICAg
ICAgICAgICAgICAgfCAzOCArKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0KIGFyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vYXJjaF9od2VpZ2h0LmggfCAgNiArKy0tLQogYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9iaXRvcHMuaCAgICAgICB8ICA0ICstLQogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jaGVj
a3N1bS5oICAgICB8ICAzICstLQogYXJjaC9yaXNjdi9saWIvY3N1bS5jICAgICAgICAgICAgICAg
ICB8IDIxICsrKy0tLS0tLS0tLS0tLQogYXJjaC9yaXNjdi9saWIvc3RyY21wLlMgICAgICAgICAg
ICAgICB8ICA1ICsrLS0KIGFyY2gvcmlzY3YvbGliL3N0cmxlbi5TICAgICAgICAgICAgICAgfCAg
NSArKy0tCiBhcmNoL3Jpc2N2L2xpYi9zdHJuY21wLlMgICAgICAgICAgICAgIHwgIDUgKystLQog
OCBmaWxlcyBjaGFuZ2VkLCAzOCBpbnNlcnRpb25zKCspLCA0OSBkZWxldGlvbnMoLSkKCi0tIAoy
LjQ1LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
